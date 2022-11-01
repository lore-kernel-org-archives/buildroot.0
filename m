Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60868C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D8760E2F;
	Tue,  1 Nov 2022 22:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D8760E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xaZijsYD4zVk; Tue,  1 Nov 2022 22:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEE3760D70;
	Tue,  1 Nov 2022 22:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE3760D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA5871BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9561F60881
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9561F60881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rb70tLUzX9na for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2030360D70
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2030360D70
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:04:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 6B26CC0004;
 Tue,  1 Nov 2022 22:03:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:03:35 +0100
Message-Id: <20221101220354.403933-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667340239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ntm39PFCdozKaVCgG89DW5AOBIlnPhhaPrkJ6lNwkHU=;
 b=ccOTcyR18qEjeMU41how6Gb0c1Zrr7S4ppBYp9PbDjGA1PXrPNqVbttKwHXO+InmsHKFL2
 JBnMkmHQ0CRz3+XC5k1OWIDjquRxb2u37QvB76JLmt5/26qVkAM1fhQRgVogCmb/1glLIu
 e/BfooMy0bb9dBKaOKflVi9Cc4DGSODXE8KtT2EGwKjZ+nghIpd9OAlhO03NTQCBjMR7Md
 R2KSZFDwTQy3RjYF40OYcxHG4ChWzq8dMvQo0e/sja92WWcteIA9I6tmRAzWGL2LW0WzR6
 qEFSukKvw1dXA/dLVNp1b1fumz9sSGAqIZphd/XOGN7EZMIZzDIYu+ewQc6bgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ccOTcyR1
Subject: [Buildroot] [PATCH 03/21] configs/bananapi_m1: remove defconfig
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499003

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                              |  1 -
 board/bananapi/bananapi-m1/boot.cmd     |  7 -----
 board/bananapi/bananapi-m1/genimage.cfg | 34 -----------------------
 board/bananapi/bananapi-m1/readme.txt   | 37 -------------------------
 configs/bananapi_m1_defconfig           | 29 -------------------
 5 files changed, 108 deletions(-)
 delete mode 100644 board/bananapi/bananapi-m1/boot.cmd
 delete mode 100644 board/bananapi/bananapi-m1/genimage.cfg
 delete mode 100644 board/bananapi/bananapi-m1/readme.txt
 delete mode 100644 configs/bananapi_m1_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 3e03dd51f5..9b1932ac61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1321,7 +1321,6 @@ F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
-F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
diff --git a/board/bananapi/bananapi-m1/boot.cmd b/board/bananapi/bananapi-m1/boot.cmd
deleted file mode 100644
index 0cf6f4d63e..0000000000
--- a/board/bananapi/bananapi-m1/boot.cmd
+++ /dev/null
@@ -1,7 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-mmc dev 0
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m1/genimage.cfg b/board/bananapi/bananapi-m1/genimage.cfg
deleted file mode 100644
index ce62fbf712..0000000000
--- a/board/bananapi/bananapi-m1/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun7i-a20-bananapi.dtb",
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
diff --git a/board/bananapi/bananapi-m1/readme.txt b/board/bananapi/bananapi-m1/readme.txt
deleted file mode 100644
index 382ba63c49..0000000000
--- a/board/bananapi/bananapi-m1/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Bananapi M1. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Bananapi M1 link:
-http://www.banana-pi.org/m1.html
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Bananapi+M1
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make bananapi_m1_defconfig
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
-Insert the micro SDcard in your Bananapi M1 and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
deleted file mode 100644
index 23da363345..0000000000
--- a/configs/bananapi_m1_defconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m1/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.12"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
