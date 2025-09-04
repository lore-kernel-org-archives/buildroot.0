Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08B1CA101C
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D736073E;
	Thu,  4 Sep 2025 16:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRR5ydZw4XPv; Thu,  4 Sep 2025 16:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B364606F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B364606F1;
	Thu,  4 Sep 2025 16:34:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A85106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80979400B9
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMtokSBz00ts for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD8B40075
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDD8B40075
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE7387EEF; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:04:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: d8280e64d739132c2ac48087bcd890059dfc4aa7
X-Git-Newrev: 15c14563d3f46a50aef693c87d0fd5672fb4969e
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.BBE7387EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] configs/bananapro: remove
 defconfig, broken
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

commit: https://git.buildroot.net/buildroot/commit/?id=15c14563d3f46a50aef693c87d0fd5672fb4969e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012272989

It has been broken for at least 2 months, and it has no maintainer in
the DEVELOPERS file. We're adding Bartosz Bilas who has been the last
person doing updates to this defconfig.

Unless some fixes are provided, this defconfig will be dropped from
Buildroot.

Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 754c399038249186040c5ef53552d300b017daf7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |  4 --
 board/lemaker/bananapro/boot.cmd                   |  5 --
 board/lemaker/bananapro/genimage.cfg               | 38 -------------
 board/lemaker/bananapro/linux-wifi.fragment        | 24 ---------
 ...ot-dts-sun7i-a20-bananapro.dts-disable-00.patch | 44 ---------------
 board/lemaker/bananapro/post-build.sh              | 12 -----
 board/lemaker/bananapro/post-image.sh              | 16 ------
 board/lemaker/bananapro/readme.txt                 | 62 ----------------------
 .../brcm/brcmfmac43362-sdio.lemaker,bananapro.txt  |  1 -
 .../lib/firmware/brcm/brcmfmac43362-sdio.txt       | 56 -------------------
 configs/bananapro_defconfig                        | 48 -----------------
 11 files changed, 310 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2a3f5fecf8..a1789f47b7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -39,9 +39,6 @@ board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-c
 board/kontron/pitx-imx8m/post-build.sh Shellcheck
 board/kontron/smarc-sal28/post-build.sh Shellcheck
 board/lego/ev3/post-image.sh Shellcheck
-board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch lib_patch.Upstream
-board/lemaker/bananapro/post-build.sh Shellcheck
-board/lemaker/bananapro/post-image.sh Shellcheck
 board/minnowboard/post-build.sh Shellcheck
 board/nexbox/a95x/post-build.sh Shellcheck
 board/nexbox/a95x/post-image.sh Shellcheck
@@ -126,7 +123,6 @@ configs/avnet_rzboard_v2l_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
 configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
-configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/lemaker/bananapro/boot.cmd b/board/lemaker/bananapro/boot.cmd
deleted file mode 100644
index 439f5b12c4..0000000000
--- a/board/lemaker/bananapro/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv fdt_high ffffffff
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-bananapro.dtb
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/lemaker/bananapro/genimage.cfg b/board/lemaker/bananapro/genimage.cfg
deleted file mode 100644
index 9d15f35e3a..0000000000
--- a/board/lemaker/bananapro/genimage.cfg
+++ /dev/null
@@ -1,38 +0,0 @@
-# Minimal SD card image for the Banana Pro
-# Based in the Orange Pi genimage.cfg
-
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun7i-a20-bananapro.dtb",
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
-		size = 512M
-	}
-}
diff --git a/board/lemaker/bananapro/linux-wifi.fragment b/board/lemaker/bananapro/linux-wifi.fragment
deleted file mode 100644
index f4ede39faa..0000000000
--- a/board/lemaker/bananapro/linux-wifi.fragment
+++ /dev/null
@@ -1,24 +0,0 @@
-# Networking support
-CONFIG_WIRELESS=y
-CONFIG_CFG80211=y
-CONFIG_CFG80211_WEXT=y
-CONFIG_RFKILL=y
-
-# Network device support
-CONFIG_WLAN=y
-CONFIG_WLAN_VENDOR_BROADCOM=y
-CONFIG_BRCMFMAC=m
-# CONFIG_WLAN_VENDOR_ADMTEK is not set
-# CONFIG_WLAN_VENDOR_ATH is not set
-# CONFIG_WLAN_VENDOR_ATMEL is not set
-# CONFIG_WLAN_VENDOR_CISCO is not set
-# CONFIG_WLAN_VENDOR_INTEL is not set
-# CONFIG_WLAN_VENDOR_INTERSIL is not set
-# CONFIG_WLAN_VENDOR_MARVELL is not set
-# CONFIG_WLAN_VENDOR_MEDIATEK is not set
-# CONFIG_WLAN_VENDOR_RALINK is not set
-# CONFIG_WLAN_VENDOR_REALTEK is not set
-# CONFIG_WLAN_VENDOR_RSI is not set
-# CONFIG_WLAN_VENDOR_ST is not set
-# CONFIG_WLAN_VENDOR_TI is not set
-# CONFIG_WLAN_VENDOR_ZYDAS is not set
diff --git a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
deleted file mode 100644
index c8e8c03753..0000000000
--- a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 896e82ab14e7e4e361ffa7c81def787907c1bf4c Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Sun, 19 May 2019 21:04:35 +0200
-Subject: [PATCH] arch/arm/boot/dts/sun7i-a20-bananapro.dts: disable 00B
- IRQ for brcm wifi module
-
-	BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
-
-Signed-off-by: Hans de Goede <hdegoede@redhat.com>
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- arch/arm/boot/dts/sun7i-a20-bananapro.dts | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-index 0176e9de0..93b3340f5 100644
---- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-@@ -160,9 +160,19 @@
- 	brcmf: wifi@1 {
- 		reg = <1>;
- 		compatible = "brcm,bcm4329-fmac";
--		interrupt-parent = <&pio>;
--		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
--		interrupt-names = "host-wake";
-+		/*
-+		 * OOB interrupt support is broken ATM, often the first irq
-+		 * does not get seen resulting in the drv probe failing with:
-+		 *
-+		 * brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
-+		 * brcmfmac: brcmf_bus_started: failed: -110
-+		 * brcmfmac: brcmf_attach: dongle is not responding: err=-110
-+		 * brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
-+		 *
-+		 * interrupt-parent = <&pio>;
-+		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-+		 * interrupt-names = "host-wake";
-+		 */
- 	};
- };
- 
--- 
-2.21.0
-
diff --git a/board/lemaker/bananapro/post-build.sh b/board/lemaker/bananapro/post-build.sh
deleted file mode 100755
index a335310dbc..0000000000
--- a/board/lemaker/bananapro/post-build.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-
-# Remove all but the brcmfmac43362 firmware files
-find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/lemaker/bananapro/post-image.sh b/board/lemaker/bananapro/post-image.sh
deleted file mode 100755
index 9cca1b1789..0000000000
--- a/board/lemaker/bananapro/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/board/lemaker/bananapro/readme.txt b/board/lemaker/bananapro/readme.txt
deleted file mode 100644
index 27b922e26d..0000000000
--- a/board/lemaker/bananapro/readme.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Banana Pro
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-Buildroot environment for the Banana Pro. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-How to build it
-===============
-
-Configure Buildroot:
-
-  $ make bananapro_defconfig
-
-Compile everything and build the SD card image:
-
-  $ make
-
-How to write the SD card
-========================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ dd if=output/images/sdcard.img of=/dev/sdX
-
-Notes:
-  - replace 'sdX' with the actual device with your micro SD card
-  - you may need to be root to do that (use 'sudo')
-
-Insert the micro SD card in your Banana Pro and power it up. The console
-is on the debug TTL UART, 115200 8N1.
-
-Ethernet
-==========
-
-  # udhcpc -i eth0
-
-Wifi
-==========
-
-  # wpa_passphrase YOUR_SSID >> /etc/wpa_supplicant.conf
-  (enter the wifi password and press enter)
-  # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
-  # udhcpc -i wlan0
-
-Note:
-  - replace 'YOUR_SSID' with the actual SSID from your access point
-
-Audio
-==========
-
-Connect a headphone to the 3.5mm jack (TRRS). Note, that the Banana Pro
-has an on-board microphone, too.
-
-  # amixer cset name='Power Amplifier DAC Playback Switch' on
-  # amixer cset name='Power Amplifier Mute Switch' on
-  # amixer cset name='Power Amplifier Volume' 42
diff --git a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
deleted file mode 120000
index 93947975ee..0000000000
--- a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
+++ /dev/null
@@ -1 +0,0 @@
-brcmfmac43362-sdio.txt
\ No newline at end of file
diff --git a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt b/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
deleted file mode 100644
index 14a554fdd8..0000000000
--- a/board/lemaker/bananapro/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-#AP6210_NVRAM_V1.2_03192013
-manfid=0x2d0
-prodid=0x492
-vendid=0x14e4
-devid=0x4343
-boardtype=0x0598
-
-# Board Revision is P307, same nvram file can be used for P304, P305, P306 and P307 as the tssi pa params used are same
-#Please force the automatic RX PER data to the respective board directory if not using P307 board, for e.g. for P305 boards force the data into the following directory /projects/BCM43362/a1_labdata/boardtests/results/sdg_rev0305
-boardrev=0x1307
-boardnum=777
-xtalfreq=26000
-boardflags=0x80201
-boardflags2=0x80
-sromrev=3
-wl0id=0x431b
-macaddr=00:90:4c:07:71:12
-aa2g=1
-ag0=2
-maxp2ga0=74
-cck2gpo=0x2222
-ofdm2gpo=0x44444444
-mcs2gpo0=0x6666
-mcs2gpo1=0x6666
-pa0maxpwr=56
-
-#P207 PA params
-#pa0b0=5447
-#pa0b1=-658
-#pa0b2=-175
-
-#Same PA params for P304,P305, P306, P307
-
-pa0b0=5447
-pa0b1=-607
-pa0b2=-160
-pa0itssit=62
-pa1itssit=62
-
-
-cckPwrOffset=5
-ccode=0
-rssismf2g=0xa
-rssismc2g=0x3
-rssisav2g=0x7
-triso2g=0
-noise_cal_enable_2g=0
-noise_cal_po_2g=0
-swctrlmap_2g=0x04040404,0x02020202,0x02020202,0x010101,0x1ff
-temp_add=29767
-temp_mult=425
-
-btc_flags=0x6
-btc_params0=5000
-btc_params1=1000
-btc_params6=63
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
deleted file mode 100644
index f733f8c0ca..0000000000
--- a/configs/bananapro_defconfig
+++ /dev/null
@@ -1,48 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
-BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
-BR2_TARGET_GENERIC_HOSTNAME="bananapro"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pro!"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_OVERLAY="board/lemaker/bananapro/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/lemaker/bananapro/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.7"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapro"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_ALSA_UTILS=y
-# BR2_PACKAGE_ALSA_UTILS_ALSAMIXER is not set
-BR2_PACKAGE_ALSA_UTILS_AMIXER=y
-BR2_PACKAGE_ALSA_UTILS_APLAY=y
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
-BR2_PACKAGE_IW=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
-BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
