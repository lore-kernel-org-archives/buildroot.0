Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95889C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 21:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F68060BEF;
	Mon,  7 Nov 2022 21:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F68060BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urSfogVdBo1Y; Mon,  7 Nov 2022 21:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403A760BD6;
	Mon,  7 Nov 2022 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 403A760BD6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10FCB1BF27A
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7116A81412
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 21:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7116A81412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jp682uu5YfdU for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 21:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 302DD81815
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 21:19:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302DD81815
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1429B880C3; Mon,  7 Nov 2022 21:19:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 22:17:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeede611f81d8f83b72e4a6671cd7d1e46b266b0
X-Git-Newrev: 2c4828568d6c5e4f1efb5b7d83ec6254d23ccdfa
X-Patchwork-Hint: ignore
Message-Id: <20221107211911.1429B880C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_plus: remove defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c4828568d6c5e4f1efb5b7d83ec6254d23ccdfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

This defconfig did not even have an entry in the DEVELOPERS file.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499140

Cc: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/orangepi/orangepi-plus/boot.cmd     |  8 ------
 board/orangepi/orangepi-plus/genimage.cfg | 36 -------------------------
 board/orangepi/orangepi-plus/readme.txt   | 29 --------------------
 configs/orangepi_plus_defconfig           | 44 -------------------------------
 4 files changed, 117 deletions(-)

diff --git a/board/orangepi/orangepi-plus/boot.cmd b/board/orangepi/orangepi-plus/boot.cmd
deleted file mode 100644
index 1a378cb918..0000000000
--- a/board/orangepi/orangepi-plus/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-plus.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-plus/genimage.cfg b/board/orangepi/orangepi-plus/genimage.cfg
deleted file mode 100644
index 1ca30258dc..0000000000
--- a/board/orangepi/orangepi-plus/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the OrangePi Plus\Plus2
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-plus.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/orangepi/orangepi-plus/readme.txt b/board/orangepi/orangepi-plus/readme.txt
deleted file mode 100644
index 7f871bcfab..0000000000
--- a/board/orangepi/orangepi-plus/readme.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-OrangePi Plus/Plus2
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the OrangePi Plus/Plus2. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-How to build it
-===============
-
-Configure Buildroot:
-
-    $ make orangepi_plus_defconfig
-
-Compile everything and build the SD card image:
-
-    $ make
-
-How to write the SD card
-========================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
deleted file mode 100644
index 11d7486486..0000000000
--- a/configs/orangepi_plus_defconfig
+++ /dev/null
@@ -1,44 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# System configuration
-BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Plus"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Plus"
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_plus"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-plus/genimage.cfg"
-
-# Additional tools
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
