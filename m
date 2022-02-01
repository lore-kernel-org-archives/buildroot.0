Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629ECC433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 045FB83300;
	Tue,  1 Feb 2022 22:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOBnNfTy7aDX; Tue,  1 Feb 2022 22:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCBA83027;
	Tue,  1 Feb 2022 22:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3361BF3BE
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C228415F9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YPy9DzqfPIvf for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16356415E6
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:05:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2CA5A82817; Tue,  1 Feb 2022 21:58:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Feb 2022 22:58:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 789e84b5dacbb39a34fe0ea873f044690a0944a2
X-Git-Newrev: 2a084afe2a36d0dc29480afa62e57bbfe9c30e48
X-Patchwork-Hint: ignore
Message-Id: <20220201215822.2CA5A82817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero_defconfig:
 refactoring, bump Linux and U-Boot versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a084afe2a36d0dc29480afa62e57bbfe9c30e48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
- Refactoring configs/orangepi_zero_defconfig.
- Linux: bump to version 5.15.16 (from 5.12.2).
- U-Boot: bump to version 2022.01 (from 2021.04).

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by:  Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../{linux-extras.config => linux-extras.fragment} |  0
 configs/orangepi_zero_defconfig                    | 32 +++++++++++++++-------
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.fragment
similarity index 100%
rename from board/orangepi/orangepi-zero/linux-extras.config
rename to board/orangepi/orangepi-zero/linux-extras.fragment
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 1c107b10e6..5aaa1566c5 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,49 +1,61 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# System
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
+
+# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Required tools to create the SD image
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero/genimage.cfg"
 
-# wireless driver and firmware
+# Wireless driver and firmware
 BR2_PACKAGE_XR819_XRADIO=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE=y
 BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819=y
 
-# wireless support
+# Wireless support
 BR2_PACKAGE_IW=y
 BR2_PACKAGE_WIRELESS_TOOLS=y
 BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
@@ -51,5 +63,5 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
 BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 
-# spi flash support
+# Spi flash support
 BR2_PACKAGE_MTD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
