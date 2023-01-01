Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB570C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 16:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5393D400CF;
	Sun,  1 Jan 2023 16:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5393D400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Qs0yTmrgaqH; Sun,  1 Jan 2023 16:50:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96F62400D2;
	Sun,  1 Jan 2023 16:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F62400D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7211BF3F9
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14169400D2
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 16:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14169400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvI2XeU_fvhc for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 16:50:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44D6E400CF
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 16:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44D6E400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3487D86E9E; Sun,  1 Jan 2023 16:50:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 17:37:15 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 85a121770b682149ce492f773a159cce312a22ef
X-Git-Newrev: 45ce6c48ba3f2fd0753a60aec4620a2901555cfd
X-Patchwork-Hint: ignore
Message-Id: <20230101165045.3487D86E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl_433: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=45ce6c48ba3f2fd0753a60aec4620a2901555cfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
