Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D37C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E1940942;
	Sat, 13 Jul 2024 14:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_MumhgmPob9; Sat, 13 Jul 2024 14:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54258414EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54258414EB;
	Sat, 13 Jul 2024 14:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BEAE1BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 855AF40942
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFMSkM6fgDmp for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7790F408ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7790F408ED
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63266864C7; Sat, 13 Jul 2024 14:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:27:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbc8cc1cb6ed0db859bc6caf6b52d8913d51506e
X-Git-Newrev: df8df20004879bd75ae2d21dcb586cb1c34ffd38
X-Patchwork-Hint: ignore
Message-Id: <20240713142748.63266864C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp157a_dk1: bump Linux to
 6.6.39 and U-Boot to 2024.07
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=df8df20004879bd75ae2d21dcb586cb1c34ffd38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch bumps the Linux kernel to version 6.6.39 and U-Boot to version
2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../stm32mp157a-dk1/patches/linux/linux.hash                   |  2 +-
 .../stm32mp157a-dk1/patches/uboot/uboot.hash                   |  2 +-
 configs/stm32mp157a_dk1_defconfig                              | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
index 8b7624cceb..f4b1146f83 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
+sha256  2783d42112095f95c510e1b421f056df8cbfa845f9040c6115080434a77a776b  linux-6.6.39.tar.xz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
index 7cef5b688e..fe9b4f53dc 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 38f7bc8946..31c52a7723 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
@@ -14,11 +14,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dk1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dk1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
@@ -41,7 +41,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
