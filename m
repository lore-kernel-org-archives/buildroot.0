Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C12C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2194E4163E;
	Tue,  1 Nov 2022 22:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2194E4163E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0d9UG0GCebGh; Tue,  1 Nov 2022 22:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5102541626;
	Tue,  1 Nov 2022 22:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5102541626
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BF9F1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 037B9410AB
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 037B9410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT6JRoP8R_zN for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:20:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186AF410A7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 186AF410A7
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:20:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 16C0E40007;
 Tue,  1 Nov 2022 22:20:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:20:06 +0100
Message-Id: <20221101222006.407225-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8wsQWTEEKx6mjLToucl/T69rBmxWmCJips/9MscyBE=;
 b=NFmKw7nhaPYxRf9xcHZrk1DgheoApgCtQOD3CSdn+N5+rorq2k9hTjVj8XpODIZUJ6IU7k
 coiO47i03mnTFmhe7E8sNsfhm54AMOftsA3hgCR5PAjGMlmrkJWwGd6Bs8IRrUDpNNa0j2
 axDgS5vXNa2J81Yq46GWf66+3xHpvVU5IrbFzEVhRmGaqW2v0HPmf+BBULCk74QO1a9/Rx
 2e8+ICdInbvPM3R87mK4QYZ+j8f32mFRfbwpLZlGZYLjB5kG6mmtOWahyczj0lB4pIS3mO
 Ho9FGQJaUo2TIb2ioWqsxnFy5jsT39pgPr072SoFsIRiJiQn+RneZu6D5haqEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NFmKw7nh
Subject: [Buildroot] [PATCH 16/21] configs/orangepi_pc2: remove defconfig
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499136

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  2 -
 board/orangepi/orangepi-pc2/boot.cmd     |  6 ---
 board/orangepi/orangepi-pc2/genimage.cfg | 40 -------------------
 board/orangepi/orangepi-pc2/readme.txt   | 37 ------------------
 configs/orangepi_pc2_defconfig           | 50 ------------------------
 5 files changed, 135 deletions(-)
 delete mode 100644 board/orangepi/orangepi-pc2/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc2/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-pc2/readme.txt
 delete mode 100644 configs/orangepi_pc2_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index a24fc168bc..d040389eea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1306,7 +1306,6 @@ F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
-F:	board/orangepi/orangepi-pc2/
 F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
@@ -1322,7 +1321,6 @@ F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
-F:	configs/orangepi_pc2_defconfig
 F:	configs/orangepi_prime_defconfig
 F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
diff --git a/board/orangepi/orangepi-pc2/boot.cmd b/board/orangepi/orangepi-pc2/boot.cmd
deleted file mode 100644
index 4d4fc7bf67..0000000000
--- a/board/orangepi/orangepi-pc2/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-pc2.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
deleted file mode 100644
index cc8695c9f1..0000000000
--- a/board/orangepi/orangepi-pc2/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-orangepi-pc2.dtb",
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
diff --git a/board/orangepi/orangepi-pc2/readme.txt b/board/orangepi/orangepi-pc2/readme.txt
deleted file mode 100644
index 1200481952..0000000000
--- a/board/orangepi/orangepi-pc2/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Orangepi PC2. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Orangepi PC2 link:
-http://www.orangepi.org/orangepipc2/
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+PC2
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make orangepi_pc2_defconfig
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
-Insert the micro SDcard in your Orangepi PC2 and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
deleted file mode 100644
index c7e17c8eb1..0000000000
--- a/configs/orangepi_pc2_defconfig
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
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc2/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc2/genimage.cfg"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
