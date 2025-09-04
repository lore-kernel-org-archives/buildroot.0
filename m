Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC2CCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16B960648;
	Thu,  4 Sep 2025 16:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTkE6zIVPNAf; Thu,  4 Sep 2025 16:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A755660628
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A755660628;
	Thu,  4 Sep 2025 16:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E15AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70F780778
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlP1utDKrfeJ for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EFF80762
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27EFF80762
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 255928617D; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 29c4281ff05d2c92db4ced6caacc13b67351987e
X-Git-Newrev: b5f10141e896b35a0b1f2e575e35631c210bf152
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.255928617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/orangepi_lite2:
 remove defconfig, broken
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5f10141e896b35a0b1f2e575e35631c210bf152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274018

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dorangepi_lite2&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274018

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ea24b22344024d8da95828cfdde9da51daad0ce2)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  2 -
 DEVELOPERS                                         |  2 -
 board/orangepi/orangepi-lite2/extlinux.conf        |  4 --
 board/orangepi/orangepi-lite2/genimage.cfg         | 34 ---------
 board/orangepi/orangepi-lite2/post-build.sh        |  4 --
 board/orangepi/orangepi-lite2/readme.txt           | 44 ------------
 .../lib/firmware/brcm/brcmfmac43455-sdio.txt       | 82 ----------------------
 configs/orangepi_lite2_defconfig                   | 43 ------------
 8 files changed, 215 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 219ef17913..1a8fe383cf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -45,7 +45,6 @@ board/olimex/a20_olinuxino/post-build.sh Shellcheck
 board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
 board/orangepi/common/post-build.sh Shellcheck
-board/orangepi/orangepi-lite2/post-build.sh Shellcheck
 board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
 board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch lib_patch.Upstream
@@ -177,7 +176,6 @@ configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 2fcfef8e32..3639665ae1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1469,7 +1469,6 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
-F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
@@ -1482,7 +1481,6 @@ F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
-F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
diff --git a/board/orangepi/orangepi-lite2/extlinux.conf b/board/orangepi/orangepi-lite2/extlinux.conf
deleted file mode 100644
index 1966186a20..0000000000
--- a/board/orangepi/orangepi-lite2/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /sun50i-h6-orangepi-lite2.dtb
-  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/orangepi/orangepi-lite2/genimage.cfg b/board/orangepi/orangepi-lite2/genimage.cfg
deleted file mode 100644
index bc981eed51..0000000000
--- a/board/orangepi/orangepi-lite2/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h6-orangepi-lite2.dtb",
-			"extlinux"
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
diff --git a/board/orangepi/orangepi-lite2/post-build.sh b/board/orangepi/orangepi-lite2/post-build.sh
deleted file mode 100755
index ec20fca7d9..0000000000
--- a/board/orangepi/orangepi-lite2/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-lite2/readme.txt b/board/orangepi/orangepi-lite2/readme.txt
deleted file mode 100644
index 7f88250418..0000000000
--- a/board/orangepi/orangepi-lite2/readme.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Orangepi Lite2. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Orangepi Lite2 link:
-http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Lite-2.html
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Lite2
-
-How to build
-============
-
-    $ make orangepi_lite2_defconfig
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
-Insert the micro SDcard in your Orangepi Lite2 and power it up. The console
-is on the serial line, 115200 8N1.
-
-WiFi
-====
-
- # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
-   (type password and enter)
- # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
- # udhcpc -i wlan0
- # ping google.com
diff --git a/board/orangepi/orangepi-lite2/rootfs_overlay/lib/firmware/brcm/brcmfmac43455-sdio.txt b/board/orangepi/orangepi-lite2/rootfs_overlay/lib/firmware/brcm/brcmfmac43455-sdio.txt
deleted file mode 100755
index c1cc4c3c2e..0000000000
--- a/board/orangepi/orangepi-lite2/rootfs_overlay/lib/firmware/brcm/brcmfmac43455-sdio.txt
+++ /dev/null
@@ -1,82 +0,0 @@
-#AP6255_NVRAM_V1.0_29052015
-
-NVRAMRev=$Rev: 498373 $
-sromrev=11
-vendid=0x14e4
-devid=0x43ab
-manfid=0x2d0
-prodid=0x06e4
-macaddr=00:90:4c:c5:12:38
-nocrc=1
-boardtype=0x6e4
-boardrev=0x1304
-xtalfreq=37400
-#boardflags: 5GHz eTR switch by default
-#2.4GHz eTR switch by default
-#bit1 for btcoex
-boardflags=0x00080201
-boardflags2=0x40000000
-boardflags3=0x48200100
-rxgains2gelnagaina0=0
-rxgains2gtrisoa0=0
-rxgains2gtrelnabypa0=0
-rxgains5gelnagaina0=0
-rxgains5gtrisoa0=0
-rxgains5gtrelnabypa0=0
-rxchain=1
-txchain=1
-aa2g=1
-aa5g=1
-tssipos5g=1
-tssipos2g=1
-femctrl=0
-AvVmid_c0=0,157,1,126,1,126,1,126,1,126
-pa2ga0=-112,6296,-662
-pa2ga1=-165,3699,-515
-pa5ga0=-143,6016,-683,-141,6013,-678,-137,5988,-670,-136,5982,-670
-pa5ga1=-161,3544,-499,-166,3543,-497,-169,3569,-497,-171,3598,-498
-itrsw=1
-pdoffset2g40ma0=10
-pdoffset40ma0=0xaaaa
-pdoffset80ma0=0xaaaa
-extpagain5g=2
-extpagain2g=2
-tworangetssi2g=1
-tworangetssi5g=1
-# LTECX flags
-# WCI2
-ltecxmux=0
-ltecxpadnum=0x0504
-ltecxfnsel=0x22
-ltecxgcigpio=0x32
-
-maxp2ga0=64
-ofdmlrbw202gpo=0x0033
-dot11agofdmhrbw202gpo=0x1553
-mcsbw202gpo=0x99355533
-
-maxp5ga0=80,82,76,77
-
-mcsbw205glpo=0x99755000
-mcsbw205gmpo=0x9df55000
-mcsbw205ghpo=0x99855000
-
-mcsbw405glpo=0xb8555000
-mcsbw405gmpo=0xed955000
-mcsbw405ghpo=0xd9755000
-
-mcsbw805glpo=0xc8555000
-mcsbw805gmpo=0xe9555000
-mcsbw805ghpo=0xd9555000
-
-swctrlmap_2g=0x00040004,0x00020002,0x00040004,0x010a02,0x1ff
-swctrlmap_5g=0x00100010,0x00200020,0x00100010,0x010a02,0x2f4
-swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
-swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
-
-vcodivmode=1
-deadman_to=481500000
-ed_thresh2g=-54
-ed_thresh5g=-54
-
-muxenab=0x10
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
deleted file mode 100644
index ad847a8205..0000000000
--- a/configs/orangepi_lite2_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-BR2_aarch64=y
-BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Lite2"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-lite2/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-lite2/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-lite2/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,h6-v1.0b)/linux-amarula_h6-v1.0b.tar.gz"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-orangepi-lite2"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
-BR2_PACKAGE_IW=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
-BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="h6-v1.0a"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite2"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
