Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB81CC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A9D44157B;
	Tue,  1 Nov 2022 22:19:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9D44157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwIfY8xAbEA1; Tue,  1 Nov 2022 22:19:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37686410AB;
	Tue,  1 Nov 2022 22:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37686410AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8C31BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47B26410C0
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47B26410C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMWdjdcCgZDC for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:19:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88567410A7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88567410A7
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:19:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A968F1C0004;
 Tue,  1 Nov 2022 22:19:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:19:30 +0100
Message-Id: <20221101221930.407045-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1klBbCJD+VsfCocoqg7T2GzebEU+yYp42DifcoJ2X38=;
 b=C78VJC9uThr/R4zYGAQ1t1msUCT2nl9yk8YhTOrRYXDm69rxwLt/8A0yfCl4DWTnnDkT73
 /9K2qxcj7+Q3JD5L8/VAAH6/lXw7KZtr0eDTy/KQm5ddhbSOoGsSy7t6C7eeFa6j8zTHcq
 dE1JqUGBqAL7brbfgmBrc/jfMsL7m0RtqE8qVQVY77fr5kQXAYYBC5NsjUcC6O/IaH7fam
 zH5nAQfG2yliK4Nfk3bVbwTjM5U94XSaNODbxhvi4IfyWO7rdm2bDxL7vvmcwI5+ZXaoZJ
 GJ0lUN6vrnyyKH3Hkk/ys72u+Y0iZbdWmcEtwhK7Nuha98MD6bf5CfpNRjlBoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C78VJC9u
Subject: [Buildroot] [PATCH 10/21] configs/friendlyarm_nanopi_m1: remove
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
Cc: Filip Skoneczny <fskoneczny@gmail.com>,
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

This defconfig did not even have an entry in the DEVELOPERS file.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499051

Cc: Filip Skoneczny <fskoneczny@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/friendlyarm/nanopi-m1-plus/boot.cmd     |  8 ----
 board/friendlyarm/nanopi-m1-plus/genimage.cfg | 36 ---------------
 board/friendlyarm/nanopi-m1-plus/readme.txt   | 29 ------------
 configs/friendlyarm_nanopi_m1_plus_defconfig  | 45 -------------------
 4 files changed, 118 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-m1-plus/boot.cmd
 delete mode 100644 board/friendlyarm/nanopi-m1-plus/genimage.cfg
 delete mode 100644 board/friendlyarm/nanopi-m1-plus/readme.txt
 delete mode 100644 configs/friendlyarm_nanopi_m1_plus_defconfig

diff --git a/board/friendlyarm/nanopi-m1-plus/boot.cmd b/board/friendlyarm/nanopi-m1-plus/boot.cmd
deleted file mode 100644
index 35a1d65d3d..0000000000
--- a/board/friendlyarm/nanopi-m1-plus/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-m1-plus.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-m1-plus/genimage.cfg b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
deleted file mode 100644
index 5257cf89c7..0000000000
--- a/board/friendlyarm/nanopi-m1-plus/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the NanoPi M1 Plus
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-nanopi-m1-plus.dtb",
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
diff --git a/board/friendlyarm/nanopi-m1-plus/readme.txt b/board/friendlyarm/nanopi-m1-plus/readme.txt
deleted file mode 100644
index 0327dec80e..0000000000
--- a/board/friendlyarm/nanopi-m1-plus/readme.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-NanoPi M1 Plus
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the NanoPi M1 Plus. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-How to build it
-===============
-
-Configure Buildroot:
-
-    $ make friendlyarm_nanopi_m1_plus_defconfig
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
diff --git a/configs/friendlyarm_nanopi_m1_plus_defconfig b/configs/friendlyarm_nanopi_m1_plus_defconfig
deleted file mode 100644
index 06adc54b15..0000000000
--- a/configs/friendlyarm_nanopi_m1_plus_defconfig
+++ /dev/null
@@ -1,45 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# System configuration
-BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1-plus"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1 Plus"
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1-plus/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1-plus"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1-plus/genimage.cfg"
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Additional tools
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
