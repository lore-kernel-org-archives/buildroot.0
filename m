Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68158C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0635841674;
	Tue,  1 Nov 2022 22:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0635841674
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yGdP1Qe87LUx; Tue,  1 Nov 2022 22:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9532741625;
	Tue,  1 Nov 2022 22:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9532741625
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7792C1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4633B8190B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4633B8190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-pAw5tpmXNK for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:20:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B20C48142B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B20C48142B
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:20:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D89C0FF807;
 Tue,  1 Nov 2022 22:20:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:20:27 +0100
Message-Id: <20221101222027.407351-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuGNnRh2bZOtNhrvneCcS5QzMqfpI4V7vGXLarOKeYs=;
 b=Cc1uxZf8R7j3JA+1Fnc3rkUFmkAp8UTM2IrPUiJOm6lNaYUje3WB2aOa1i220UR+XcAe5m
 iMiD/RabVUTnmCHPymw6rmWkqfwGwdGht5jKyWZMO7VuHbOB/PLQ1yFZhfx0QQIIM34E6A
 Ejd3SpiNlyiAaxWpTwB0VfKgtt/gcr6W+Gj8I+r1fccCvw+BVzjBSZ+hS51rA0810Ma6VK
 0uCS5loTCGNrghb0w8xfU3ZrpV00YMLYo82MmQmUECGm3S/cyeZ9NNYFDKkIJS4nYag1Ok
 01NAdfzGXJiDC8Lr9jwY+N9UqOTZ98/10tZvXVVO/y18t9jYxWC4BkbtPLqkwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cc1uxZf8
Subject: [Buildroot] [PATCH 20/21] configs/orangepi_win: remove defconfig
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig has been failing to build for several months, with
nobody stepping up to fix it. It's time to drop it.

See
https://lore.kernel.org/buildroot/20220806224338.0159e15c@windsurf/
for a notification on August 6, 2022 about the issues with this
defconfig.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499145

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  2 -
 board/orangepi/orangepi-win/boot.cmd     |  6 ---
 board/orangepi/orangepi-win/genimage.cfg | 40 --------------------
 board/orangepi/orangepi-win/readme.txt   | 37 ------------------
 configs/orangepi_win_defconfig           | 48 ------------------------
 5 files changed, 133 deletions(-)
 delete mode 100644 board/orangepi/orangepi-win/boot.cmd
 delete mode 100644 board/orangepi/orangepi-win/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-win/readme.txt
 delete mode 100644 configs/orangepi_win_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ee13d5258..ebfa0a6b30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1306,7 +1306,6 @@ F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
-F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
 F:	configs/amarula_vyasa_rk3288_defconfig
@@ -1320,7 +1319,6 @@ F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
-F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
diff --git a/board/orangepi/orangepi-win/boot.cmd b/board/orangepi/orangepi-win/boot.cmd
deleted file mode 100644
index 2ddb769d6d..0000000000
--- a/board/orangepi/orangepi-win/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-a64-orangepi-win.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-win/genimage.cfg b/board/orangepi/orangepi-win/genimage.cfg
deleted file mode 100644
index 98fd1a033d..0000000000
--- a/board/orangepi/orangepi-win/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-orangepi-win.dtb",
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
diff --git a/board/orangepi/orangepi-win/readme.txt b/board/orangepi/orangepi-win/readme.txt
deleted file mode 100644
index 93adddd86b..0000000000
--- a/board/orangepi/orangepi-win/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Orangepi Win/Win Plus. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Orangepi Win/Win Plus link:
-http://www.orangepi.org/OrangePiWin_WinPlus/
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Win
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make orangepi_win_defconfig
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
-Insert the micro SDcard in your Orangepi Win/Win Plus and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
deleted file mode 100644
index 715ff3b711..0000000000
--- a/configs/orangepi_win_defconfig
+++ /dev/null
@@ -1,48 +0,0 @@
-BR2_aarch64=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
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
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_win"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-win/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-orangepi-win"
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Win/Win Plus"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-win/genimage.cfg"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
