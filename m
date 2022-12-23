Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948D5C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5954F1FF;
	Mon, 20 Feb 2023 22:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5954F1FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuYn89QoyPkP; Mon, 20 Feb 2023 22:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491BE4F20B;
	Mon, 20 Feb 2023 22:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491BE4F20B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B62D1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D227B416FD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D227B416FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HhNGuaBNd6H for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA1141194
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EA1141194
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF5586494; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 23 Dec 2022 16:55:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f81b1358fc115fc854a9c9699daaca4be713f873
X-Git-Newrev: 7967755fbf25fe4d5860884bedb3e01fcd7e9855
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.1BF5586494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl_433: drop dynamic
 library dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7967755fbf25fe4d5860884bedb3e01fcd7e9855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

rtl_433 can be built statically since its addition in commit
4634e84978a3e64e9050021d209a41cd88a1ad16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl_433/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/rtl_433/Config.in b/package/rtl_433/Config.in
index 5664227c82..a6db00f477 100644
--- a/package/rtl_433/Config.in
+++ b/package/rtl_433/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_RTL_433
 	bool "rtl_433"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
 	help
@@ -11,6 +10,6 @@ config BR2_PACKAGE_RTL_433
 
 	  https://github.com/merbanan/rtl_433
 
-comment "rtl_433 needs a toolchain w/ dynamic library, threads"
+comment "rtl_433 needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
