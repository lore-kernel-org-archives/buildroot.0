Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D264CA0FF2
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1245783B70;
	Thu, 28 Aug 2025 13:26:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYLBdeyRFlg9; Thu, 28 Aug 2025 13:26:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09E8083B81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E8083B81;
	Thu, 28 Aug 2025 13:26:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E4E1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D613837D3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRq80B51jl03 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F5483A50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50F5483A50
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50B5D87CF3; Thu, 28 Aug 2025 13:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 15:16:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a3bae64244422a4b5e1d0bbb7dbc9036585cc0e
X-Git-Newrev: a933920ff0d28947f5f6d4f6b6be04f113ad960c
X-Patchwork-Hint: ignore
Message-Id: <20250828132628.50B5D87CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ts7680: remove defconfig, broken
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
Content-Type: multipart/mixed; boundary="===============3340664325113585330=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3340664325113585330==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a933920ff0d28947f5f6d4f6b6be04f113ad960c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774180

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dts7680&kind=BUILD

It uses the outdated Linux 4.9 kernel, which is no longer maintained,
and no longer builds with recent toolchains.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026774180

Cc: Julien Grossholtz <julien.grossholtz@openest.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                   |  1 -
 DEVELOPERS                            |  2 --
 board/technologic/ts7680/genimage.cfg | 14 ----------
 board/technologic/ts7680/readme.txt   | 50 -----------------------------------
 configs/ts7680_defconfig              | 16 -----------
 5 files changed, 83 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2596a5c77b..11c8a23763 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -198,7 +198,6 @@ configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/ts4900_defconfig lib_defconfig.ForceCheckHash
 configs/ts5500_defconfig lib_defconfig.ForceCheckHash
-configs/ts7680_defconfig lib_defconfig.ForceCheckHash
 configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
 configs/visionfive_defconfig lib_defconfig.ForceCheckHash
 configs/wandboard_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index e0ea0c2c26..b33dbf8c5e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1796,9 +1796,7 @@ F:	package/qt5/
 
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
 F:	board/raspberrypi/
-F:	board/technologic/ts7680/
 F:	configs/raspberrypizero2w_defconfig
-F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <ju.o@free.fr>
diff --git a/board/technologic/ts7680/genimage.cfg b/board/technologic/ts7680/genimage.cfg
deleted file mode 100644
index 58a63edd1a..0000000000
--- a/board/technologic/ts7680/genimage.cfg
+++ /dev/null
@@ -1,14 +0,0 @@
-image sdcard.img {
-	hdimage {
-	}
-
-	partition unused {
-		size = 512
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 256M
-	}
-}
diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
deleted file mode 100644
index 3f703330bf..0000000000
--- a/board/technologic/ts7680/readme.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Technologic Systems TS-7680 SBC
-===============================
-
-This document explains how to set up a basic Buildroot system for
-the Technologic Systems TS-7680 Single Board Computer.
-
-The TS-7680 SBC is based on the Freescale i.MX286 ARM ARM926EJ-S
-running at 454MHz. The TS-7680 features are 10/100 Ethernet ports,
-Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
-relays and ADC/DAC. More details on the board here:
-https://docs.embeddedTS.com/TS-7680
-
-The TS-7680 uses a 4.9 Linux kernel provided by Technologic Systems.
-
-To build the default configuration you only have to run:
-
-  $ make ts7680_defconfig
-  $ make
-
-The output looks like:
-output/images
-├── imx28-ts7680.dtb
-├── rootfs.ext2
-├── rootfs.ext4 -> rootfs.ext2
-├── rootfs.tar
-├── sdcard.img
-└── uImage
-
-The provided genimage configuration generates an image file containing
-two partitions. The first one is unused, but mandatory as the
-TS-7680 built-in bootloader loads the Linux uImage from the /boot
-directory in the second partition. The second partition contains the
-rootfs with the Linux uImage into the /boot directory.
-
-  $ fdisk output/images/sdcard.img
-  output/images/sdcard.img1          1      1       1  512B  0 Empty
-  output/images/sdcard.img2          2 524289  524288  256M 83 Linux
-
-This image can be directly written to an SD card.
-
-    $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
-
-To boot with Buildroot, insert this SD card on the board, make sure
-the SD jumper is present and the U-Boot jumper is not.
-
-The bootloader comes pre-flashed on the board on an SPI flash. Since
-updating the bootloader is risky and not trivial, it is not included
-in the Buildroot defconfig. Refer to
-https://docs.embeddedts.com/TS-7680#U-Boot for details on
-which U-Boot config to use and how to flash it.
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
deleted file mode 100644
index 9e058b1d78..0000000000
--- a/configs/ts7680_defconfig
+++ /dev/null
@@ -1,16 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,v4.9.311-ts)/linux-v4.9.311-ts.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-ts7680"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_GENIMAGE=y

--===============3340664325113585330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3340664325113585330==--
