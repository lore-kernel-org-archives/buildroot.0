Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4638C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C3940643;
	Tue,  1 Nov 2022 22:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C3940643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKzYdzseO3w7; Tue,  1 Nov 2022 22:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 556ED405BC;
	Tue,  1 Nov 2022 22:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556ED405BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09F6D1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9721405BC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9721405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQ5c_TRI8Uvk for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76257400EF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76257400EF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:19:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 953D2C0002;
 Tue,  1 Nov 2022 22:19:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:19:43 +0100
Message-Id: <20221101221944.407130-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ad3RChPCuL8MHIIGz9IgD7yVcCSyg7PtbCZtbq50w48=;
 b=JbkHb++ndBdnb8C/VqDkqR2pslzVH9H9cxDgnbXQ/05rJJlduw1bFDcoYlcN/RgOfuMFSM
 64nxkIKIEyYWWr/T1TXmezoqC8rmjPoqASpQmzbx+8sS+lkT2qFEArQYXtsmGX5xFyPS0E
 je+jLz2qG5ZBnrXKGzWtIFMq0DuCRVJ37mM4WTS1WPZ3QR878RLpG2m/8EoWf5DL689L8A
 TYE2v4qIp+z+EUL5l0dsHGR7nY8fJg+vDqJMzRzeP6/NQ2Tp6s47ouPVvSCgDWCu3KdGPR
 7065X0FxxHRcya0LJ8LvD3Xt151NC6PJYxD8lXEVq9amBAj4YEQLMmUtVZQG7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JbkHb++n
Subject: [Buildroot] [PATCH 12/21] configs/friendlyarm_nanopi_neo2: remove
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499053

Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  2 -
 board/friendlyarm/nanopi-neo2/boot.cmd     |  6 ---
 board/friendlyarm/nanopi-neo2/genimage.cfg | 40 -----------------
 board/friendlyarm/nanopi-neo2/readme.txt   | 37 ----------------
 configs/friendlyarm_nanopi_neo2_defconfig  | 50 ----------------------
 5 files changed, 135 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-neo2/boot.cmd
 delete mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 delete mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 delete mode 100644 configs/friendlyarm_nanopi_neo2_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 889ce3a02c..a4bfad30ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1304,7 +1304,6 @@ F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
-F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
@@ -1321,7 +1320,6 @@ F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
 F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
-F:	configs/friendlyarm_nanopi_neo2_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
diff --git a/board/friendlyarm/nanopi-neo2/boot.cmd b/board/friendlyarm/nanopi-neo2/boot.cmd
deleted file mode 100644
index 9a39f4afc9..0000000000
--- a/board/friendlyarm/nanopi-neo2/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-h5-nanopi-neo2.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
deleted file mode 100644
index 3163a06592..0000000000
--- a/board/friendlyarm/nanopi-neo2/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h5-nanopi-neo2.dtb",
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
diff --git a/board/friendlyarm/nanopi-neo2/readme.txt b/board/friendlyarm/nanopi-neo2/readme.txt
deleted file mode 100644
index 0f445e2bea..0000000000
--- a/board/friendlyarm/nanopi-neo2/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Nanopi NEO2. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Nanopi NEO2 link:
-http://nanopi.io/nanopi-neo2.html
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/FriendlyARM+NanoPi+NEO2
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make friendlyarm_nanopi_neo2_defconfig
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
-Insert the micro SDcard in your Nanopi NEO2 and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_neo2_defconfig b/configs/friendlyarm_nanopi_neo2_defconfig
deleted file mode 100644
index 9262737b88..0000000000
--- a/configs/friendlyarm_nanopi_neo2_defconfig
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
-R2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo2"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo2/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-nanopi-neo2"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM Nanopi NEO2"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo2/genimage.cfg"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
