Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DACC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 16:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EAF417CC;
	Thu,  2 May 2024 16:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cifp0Y0wI9N9; Thu,  2 May 2024 16:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A59341B90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A59341B90;
	Thu,  2 May 2024 16:59:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62F611BF296
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E45441B90
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 16:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iledzrCZl4Ny for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 16:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8A340836
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8A340836
 for <buildroot@buildroot.org>; Thu,  2 May 2024 16:59:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 18EFF86647; Thu,  2 May 2024 16:59:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 18:58:10 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bf3225e55137b5c565d37981b6be0348a52a2cd4
X-Git-Newrev: 6e8ae6b661355bb56368fa8dc7fd9289e6d4d226
X-Patchwork-Hint: ignore
Message-Id: <20240502165955.18EFF86647@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fmc: enable also
 for aarch64 QorIQ processors
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e8ae6b661355bb56368fa8dc7fd9289e6d4d226
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

QorIQ processors family also includes LS Series wich are based on aarch64

Signed-off-by: David Gouarin <dgouarin@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 2656ca8912e151e874ceb366e6eef0bfe4228ac0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmc/Config.in   |  6 +++---
 package/fmlib/Config.in | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index c89a87c99e..1c6ae5e80a 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -1,14 +1,14 @@
 comment "fmc needs a toolchain w/ C++"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "fmc needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMC
 	bool "fmc"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LINUX_KERNEL # fmlib
 	select BR2_PACKAGE_TCLAP
diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 97d55d1250..459d5bf102 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -1,10 +1,10 @@
 comment "fmlib needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMLIB
 	bool "fmlib"
-	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500 || BR2_aarch64
 	depends on BR2_LINUX_KERNEL
 	help
 	  The Frame Manager library provides Freescale PowerPC platforms
@@ -33,6 +33,10 @@ config BR2_FMLIB_QORIQ_FAMILY_T2080
 	bool "t208x"
 	depends on BR2_powerpc_e6500
 
+config BR2_FMLIB_QORIQ_FAMILY_ARM
+	bool "arm"
+	depends on BR2_aarch64
+
 endchoice
 
 config BR2_PACKAGE_FMLIB_ARCHTYPE
@@ -40,11 +44,13 @@ config BR2_PACKAGE_FMLIB_ARCHTYPE
 	default "ppce500mc" if BR2_powerpc_e500mc
 	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
 	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
+	default "arm" if BR2_aarch64
 
 config BR2_PACKAGE_FMLIB_PLATFORM
 	string
 	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
 	default "T4240" if BR2_FMLIB_QORIQ_FAMILY_T4240
 	default "FMAN_V3H" if BR2_FMLIB_QORIQ_FAMILY_T2080
+	default "arm" if BR2_aarch64
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
