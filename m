Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C87CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 09:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0027E40136;
	Mon,  2 Sep 2024 09:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K37_qWaUcB66; Mon,  2 Sep 2024 09:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98CD40360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98CD40360;
	Mon,  2 Sep 2024 09:44:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 709EA1BF31C
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 09:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E605607CD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 09:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xj_ju_U0Ueo for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 09:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 694A96064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 694A96064B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 694A96064B
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 09:44:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A25B620009;
 Mon,  2 Sep 2024 09:44:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sl3bV-0027iz-0Z;
 Mon, 02 Sep 2024 11:44:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 11:44:04 +0200
Message-Id: <20240902094405.506338-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] configs/pandaboard_defconfig: drop defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfig has failed to build since May with the change to GCC 13.x,
E.G.:

https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597768

I no longer have access to a pandaboard.  Pandaboard/omap4 support has
recently been dropped from u-boot:
https://lists.denx.de/pipermail/u-boot/2024-July/558846.html

And (part of) the kernel support is also getting removed:
https://patchwork.kernel.org/project/linux-media/patch/815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl/

So drop the defconfig here as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore           |  1 -
 DEVELOPERS                    |  2 --
 board/pandaboard/genimage.cfg | 27 --------------------
 board/pandaboard/readme.txt   | 46 ---------------------------------
 configs/pandaboard_defconfig  | 48 -----------------------------------
 5 files changed, 124 deletions(-)
 delete mode 100644 board/pandaboard/genimage.cfg
 delete mode 100644 board/pandaboard/readme.txt
 delete mode 100644 configs/pandaboard_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 4cfc202153..96358d0d6c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -221,7 +221,6 @@ configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/pandaboard_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pcengines_apu2_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 0b590f0ec2..59f3b03202 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2553,7 +2553,6 @@ F:	board/librecomputer/lafrite/
 F:	board/nexbox/a95x/
 F:	board/openblocks/a6/
 F:	board/orangepi/
-F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	board/visionfive/
 F:	boot/shim/
@@ -2566,7 +2565,6 @@ F:	configs/nezha_defconfig
 F:	configs/openblocks_a6_defconfig
 F:	configs/orangepi_pc_defconfig
 F:	configs/orangepi_r1_defconfig
-F:	configs/pandaboard_defconfig
 F:	configs/roseapplepi_defconfig
 F:	configs/sheevaplug_defconfig
 F:	configs/visionfive_defconfig
diff --git a/board/pandaboard/genimage.cfg b/board/pandaboard/genimage.cfg
deleted file mode 100644
index dfe388227e..0000000000
--- a/board/pandaboard/genimage.cfg
+++ /dev/null
@@ -1,27 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"MLO",
-			"u-boot.img"
-		}
-	}
-
-	size = 8M
-}
-
-image sdcard.img {
-	hdimage {
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
-		size = 512M
-	}
-}
diff --git a/board/pandaboard/readme.txt b/board/pandaboard/readme.txt
deleted file mode 100644
index 80a20c2743..0000000000
--- a/board/pandaboard/readme.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Pandaboard
-==========
-
-This file documents the Buildroot support for the Pandaboard, a
-low-power, low-cost single-board computer development platform based
-on the Texas Instruments OMAP4 system on a chip (SoC).
-
-Configuring and building Buildroot
-----------------------------------
-
-Start from the defconfig:
-
-  $ make pandaboard_defconfig
-
-You can edit build options the usual way:
-
-  $ make menuconfig
-
-When you are happy with the setup, run:
-
-  $ make
-
-The result of the build with the default settings should be these files:
-
-  output/images
-  +-- MLO
-  +-- omap4-panda-a4.dtb
-  +-- omap4-panda.dtb
-  +-- omap4-panda-es.dtb
-  +-- rootfs.ext4
-  +-- sdcard.img
-  +-- u-boot.img
-  +-- zImage
-
-How to write the SD card
-------------------------
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Where /dev/sdX is the device node of your SD card (may be /dev/mmcblkX
-instead depending on setup).
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
deleted file mode 100644
index 376ecfe504..0000000000
--- a/configs/pandaboard_defconfig
+++ /dev/null
@@ -1,48 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a9=y
-BR2_ARM_ENABLE_NEON=y
-BR2_ARM_ENABLE_VFP=y
-BR2_ARM_FPU_VFPV3=y
-
-# Linux headers same as kernel, a 5.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
-
-# System
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
-BR2_SYSTEM_DHCP="eth0"
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pandaboard/genimage.cfg"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
-BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap4_panda"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="MLO"
-
-# Required tools to create the SD card image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
