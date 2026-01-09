Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7C3D26D71
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 17:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B98CE60EE2;
	Fri,  9 Jan 2026 17:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwlCg2s8cuUs; Fri,  9 Jan 2026 17:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4154607EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767980199;
	bh=4NgeRR8uioKI7E0wAiEjn4ko56W8UxHdXATHssBz1Y0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ME+zXHExH6tpGU6xSm/IXHiWjGNnI6watsqHO2pgMA+ct90W5B/jRQH+FmZW32EhG
	 XFSabw7xHNkqgmF9BJba4epi9EdnROVvAuX6KN3rqf8aYn2IGUjkq+2eiTHeCJ5B00
	 qUjeCtSDsBE0XFBPEXcm3IIQZWtnNYGSV0OcWdlf/CSHM5dbRut6hFGPGCiCcPWVjB
	 nZ+UxB7e4sHjtUio6IAuQGEiQ/yq01uzf99R+2D1QwGztYg2+5+iYzKXf5cAibLmoR
	 FZ6nmPG85XhXzuxhQXdDie1f8uydESGoBsjq6M5eIJpPqs01Wled/e1Pt8MJuPpxNc
	 yOlDvGFfjunoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4154607EA;
	Fri,  9 Jan 2026 17:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F23131
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DAFF40829
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ejvrc-RZ8Cjx for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 17:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5013040827
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5013040827
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 17:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF8A881EE; Fri,  9 Jan 2026 17:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:36:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b521f25764c80ec06d50f0bbc0fdf75b80f645d2
X-Git-Newrev: fd2555ecfdc682201cc2081d0f9249f70a1f4022
X-Patchwork-Hint: ignore
Message-Id: <20260109173637.2CF8A881EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 5.10.246-cip66
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd2555ecfdc682201cc2081d0f9249f70a1f4022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added Upstream: tag to patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                               | 1 -
 .../0001-arch-microblaze-mm-init.c-fix-build.patch                | 4 ++--
 linux/Config.in                                                   | 8 ++++----
 linux/linux.hash                                                  | 4 ++--
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 99a864fd3f..2a09961f74 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -176,7 +176,6 @@ configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
 configs/warp7_defconfig lib_defconfig.ForceCheckHash
-linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
 package/acl/0001-Build-with-old-GCC-versions.patch lib_patch.Upstream
diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
similarity index 93%
rename from linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
rename to linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
index 4760d9e4fb..d1124f4cda 100644
--- a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
+++ b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -13,9 +13,9 @@ arch/microblaze/mm/init.c:71:2: error: #endif without #if
 Fixes:
  - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
 
+Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to
-Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
 ---
  arch/microblaze/mm/init.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/linux/Config.in b/linux/Config.in
index 0bf8d0ab02..ca8dff1f4b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.162-cip24)"
+	bool "Latest CIP SLTS version (5.10.246-cip66)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -57,7 +57,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.162-cip24-rt10)"
+	bool "Latest CIP RT SLTS version (5.10.246-cip66-rt29)"
 	# Support was introduced in Linux 5.19
 	depends on !BR2_loongarch64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
@@ -142,8 +142,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 45437f8796..11db3e59b6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -7,8 +7,8 @@ sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
 # Locally computed
-sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
-sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
+sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
+sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
