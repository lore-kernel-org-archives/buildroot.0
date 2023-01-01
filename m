Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C96C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A3F940194;
	Sun,  1 Jan 2023 16:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A3F940194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4mQ_O5VTt4R; Sun,  1 Jan 2023 16:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1FAC40136;
	Sun,  1 Jan 2023 16:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1FAC40136
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02C981BF3F9
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D170040541
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D170040541
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKNQl9rXwJBe for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7B040509
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7B040509
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB06786DD2; Sun,  1 Jan 2023 16:49:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 17:47:54 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 378f560fad786411e240f1bb75a6f8f5aa196738
X-Git-Newrev: 13dd036002bbc4cdbaa86d1b2672333de23a4897
X-Patchwork-Hint: ignore
Message-Id: <20230101164929.BB06786DD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/rtl_433: drop
 dynamic library dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=13dd036002bbc4cdbaa86d1b2672333de23a4897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

rtl_433 can be built statically since its addition in commit
4634e84978a3e64e9050021d209a41cd88a1ad16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7967755fbf25fe4d5860884bedb3e01fcd7e9855)
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
