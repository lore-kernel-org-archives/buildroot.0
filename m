Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2670AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEBB42A1A;
	Mon, 20 Feb 2023 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEBB42A1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtA3lByhCuU3; Mon, 20 Feb 2023 21:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F75B42B1D;
	Mon, 20 Feb 2023 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F75B42B1D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 070411BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D6F61094
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D6F61094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1w66yh95hwb for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E985A6100B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E985A6100B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D71EB86494; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 22:17:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2c4828568d6c5e4f1efb5b7d83ec6254d23ccdfa
X-Git-Newrev: a0763bc283fda0117b920fe8fae29c9e8cc48737
X-Patchwork-Hint: ignore
Message-Id: <20230220205148.D71EB86494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_prime: remove
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0763bc283fda0117b920fe8fae29c9e8cc48737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499141

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  2 --
 board/orangepi/orangepi-prime/boot.cmd     |  6 ----
 board/orangepi/orangepi-prime/genimage.cfg | 40 ------------------------
 board/orangepi/orangepi-prime/readme.txt   | 37 ----------------------
 configs/orangepi_prime_defconfig           | 50 ------------------------------
 5 files changed, 135 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ec8df84fa8..f366426125 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1303,7 +1303,6 @@ F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
-F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
@@ -1318,7 +1317,6 @@ F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
-F:	configs/orangepi_prime_defconfig
 F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
diff --git a/board/orangepi/orangepi-prime/boot.cmd b/board/orangepi/orangepi-prime/boot.cmd
deleted file mode 100644
index 34887880d8..0000000000
--- a/board/orangepi/orangepi-prime/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-prime.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-prime/genimage.cfg b/board/orangepi/orangepi-prime/genimage.cfg
deleted file mode 100644
index dde9a6485f..0000000000
--- a/board/orangepi/orangepi-prime/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-orangepi-prime.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
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
diff --git a/board/orangepi/orangepi-prime/readme.txt b/board/orangepi/orangepi-prime/readme.txt
deleted file mode 100644
index 5811884d4d..0000000000
--- a/board/orangepi/orangepi-prime/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Orangepi Prime. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Orangepi Prime link:
-http://www.orangepi.org/OrangePiPrime/
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Prime
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make orangepi_prime_defconfig
-    $ make
-
-Note: you will need access to the internet to download the required
-sources.
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
-  $ sudo sync
-
-Insert the micro SDcard in your Orangepi Prime and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
deleted file mode 100644
index f8f958c67b..0000000000
--- a/configs/orangepi_prime_defconfig
+++ /dev/null
@@ -1,50 +0,0 @@
-BR2_aarch64=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# Firmware
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_prime"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-prime/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-prime"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Prime"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-prime/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
