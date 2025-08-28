Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2FCCA0FF2
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A4340612;
	Thu, 28 Aug 2025 13:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqrrG4M2qC7I; Thu, 28 Aug 2025 13:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8732840D21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8732840D21;
	Thu, 28 Aug 2025 13:26:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E21EFC8
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D2840D81
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMjWam-D0gaW for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2791F40DA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2791F40DA3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0804387CF6; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 15:14:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3601fb6fef2a1c99dd265d963d046d065b208571
X-Git-Newrev: 54ac9c6450fc996681227f7100ffd64d66af2f37
X-Patchwork-Hint: ignore
Message-Id: <20250828132628.0804387CF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pine64_sopine: remove defconfig,
 broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54ac9c6450fc996681227f7100ffd64d66af2f37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dpine64_sopine&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore              |  1 -
 DEVELOPERS                       |  1 -
 board/pine64/sopine/boot.cmd     |  6 ------
 board/pine64/sopine/genimage.cfg | 40 ----------------------------------------
 board/pine64/sopine/readme.txt   | 38 --------------------------------------
 configs/pine64_sopine_defconfig  | 37 -------------------------------------
 6 files changed, 123 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0e2c781446..ec3b11aa3f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -176,7 +176,6 @@ configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
 configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 5c6d0e0ae3..6bab6502ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1501,7 +1501,6 @@ F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
-F:	configs/pine64_sopine_defconfig
 F:	package/python-scipy/
 F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_scipy.py
diff --git a/board/pine64/sopine/boot.cmd b/board/pine64/sopine/boot.cmd
deleted file mode 100644
index 2eab642370..0000000000
--- a/board/pine64/sopine/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-a64-sopine-baseboard.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/pine64/sopine/genimage.cfg b/board/pine64/sopine/genimage.cfg
deleted file mode 100644
index 9300f3d601..0000000000
--- a/board/pine64/sopine/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-sopine-baseboard.dtb",
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
diff --git a/board/pine64/sopine/readme.txt b/board/pine64/sopine/readme.txt
deleted file mode 100644
index 08cb380b46..0000000000
--- a/board/pine64/sopine/readme.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the SoPine. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-SoPINE link:
-https://www.pine64.org/?page_id=1491
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/SoPine
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make pine64_sopine_defconfig
-
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
-Insert the micro SDcard in your SoPine and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
deleted file mode 100644
index 845775338b..0000000000
--- a/configs/pine64_sopine_defconfig
+++ /dev/null
@@ -1,37 +0,0 @@
-BR2_aarch64=y
-BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64 SOPINE"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/sopine/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-sopine-baseboard"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sopine_baseboard"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
