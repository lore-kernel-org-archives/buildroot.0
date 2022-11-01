Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398F2C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C23F54062A;
	Tue,  1 Nov 2022 22:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C23F54062A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2s5ZaoKTyFFf; Tue,  1 Nov 2022 22:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48C40405BC;
	Tue,  1 Nov 2022 22:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48C40405BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF1E1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A7EE40643
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A7EE40643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPMdC8ivAtUG for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:04:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F80140640
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F80140640
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:04:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 93F4CC0006;
 Tue,  1 Nov 2022 22:04:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:03:36 +0100
Message-Id: <20221101220354.403933-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667340240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K7jqJLY41TC7kWPsm+OcU5bg4TmZaeDWaavBb99lIZo=;
 b=O/DFNX5Afgq++rqmO/WFtDCiKuTIMFYmbpu8fRhI6G2vT3tPUQfpRbLL/kT+Vh8VjE5sS7
 jAQx7bRfYPXOOF8D2o/Zl6tHAQwCi0nuQOtI+qRW33LZi4jyFOLHfPbn+Evz79Q9R4faP/
 9DzBDweU9gRwUWZ2l2AzHE8Jtx+IJDMrzCj8lFIrcC9NpXlN/cWlLygmME1nlnBWlaKvxy
 cQP7YkCywoX6/MCQ8a8vrrSV7ySR4KTMxgP/lAwt3Tw7HZj2BShfll3ez7UofkJlTIyOKQ
 sWNL+qri3E0kg/03zmw0vvd6gKPFem2Kwh1boUs3eGI4oZz2Jk6IUp9knBLiYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O/DFNX5A
Subject: [Buildroot] [PATCH 04/21] configs/bananapi_m1_plus: remove defconfig
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

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499004

Cc: Filip Skoneczny <fskoneczny@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  4 --
 board/sinovoip/m1-plus/boot.cmd               |  5 --
 board/sinovoip/m1-plus/genimage.cfg           | 38 -----------
 board/sinovoip/m1-plus/linux-wifi.fragment    | 10 ---
 ...nanapi-m1-plus-Disable-OOB-IRQ-for-b.patch | 39 -----------
 board/sinovoip/m1-plus/post-build.sh          |  4 --
 board/sinovoip/m1-plus/readme.txt             | 64 -------------------
 ...rcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt |  1 -
 .../lib/firmware/brcm/brcmfmac43362-sdio.txt  | 56 ----------------
 configs/bananapi_m1_plus_defconfig            | 45 -------------
 10 files changed, 266 deletions(-)
 delete mode 100644 board/sinovoip/m1-plus/boot.cmd
 delete mode 100644 board/sinovoip/m1-plus/genimage.cfg
 delete mode 100644 board/sinovoip/m1-plus/linux-wifi.fragment
 delete mode 100644 board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
 delete mode 100755 board/sinovoip/m1-plus/post-build.sh
 delete mode 100644 board/sinovoip/m1-plus/readme.txt
 delete mode 120000 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
 delete mode 100644 board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
 delete mode 100644 configs/bananapi_m1_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b1932ac61..dc968f9c4f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1009,10 +1009,6 @@ F:	configs/freescale_imx6ullevk_defconfig
 N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
-N:	Filip Skoneczny <fskoneczny@gmail.com>
-F:	board/sinovoip/m1-plus
-F:	configs/bananapi_m1_plus_defconfig
-
 N:	Florian Fainelli <f.fainelli@gmail.com>
 F:	package/cpulimit/
 
diff --git a/board/sinovoip/m1-plus/boot.cmd b/board/sinovoip/m1-plus/boot.cmd
deleted file mode 100644
index 4829996474..0000000000
--- a/board/sinovoip/m1-plus/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv fdt_high ffffffff
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi-m1-plus.dtb
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/sinovoip/m1-plus/genimage.cfg b/board/sinovoip/m1-plus/genimage.cfg
deleted file mode 100644
index 18a549e631..0000000000
--- a/board/sinovoip/m1-plus/genimage.cfg
+++ /dev/null
@@ -1,38 +0,0 @@
-# Minimal SD card image for the Banana Pi M1+
-# Based on the Banana Pro genimage.cfg
-
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun7i-a20-bananapi-m1-plus.dtb",
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
diff --git a/board/sinovoip/m1-plus/linux-wifi.fragment b/board/sinovoip/m1-plus/linux-wifi.fragment
deleted file mode 100644
index 5576d738ad..0000000000
--- a/board/sinovoip/m1-plus/linux-wifi.fragment
+++ /dev/null
@@ -1,10 +0,0 @@
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
diff --git a/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch b/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
deleted file mode 100644
index b01b6b2829..0000000000
--- a/board/sinovoip/m1-plus/patches/linux/0001-ARM-dts-sun7i-bananapi-m1-plus-Disable-OOB-IRQ-for-b.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 58bae4096a7bf8d5d3bfbddb82cb37dd0561c938 Mon Sep 17 00:00:00 2001
-From: Filip Skoneczny <fskoneczny@gmail.com>
-Date: Sun, 10 Jan 2021 19:07:14 +0100
-Subject: [PATCH] ARM: dts: sun7i: bananapi-m1-plus: Disable OOB IRQ for brcm
- wifi module
-
-    Based on 23bc805.
-    BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
-
-Signed-off-by: Filip Skoneczny <fskoneczny@gmail.com>
----
- arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
-index 32d5d45a35c0..97f9987f51d7 100644
---- a/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
-+++ b/arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts
-@@ -193,9 +193,14 @@ &mmc3 {
- 	brcmf: wifi@1 {
- 		reg = <1>;
- 		compatible = "brcm,bcm4329-fmac";
--		interrupt-parent = <&pio>;
--		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
--		interrupt-names = "host-wake";
-+		/*
-+		 * OOB interrupt support is broken ATM, drv probe failing with:
-+		 * ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
-+		 *
-+		 * interrupt-parent = <&pio>;
-+		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-+		 * interrupt-names = "host-wake";
-+		 */
- 	};
- };
- 
--- 
-2.25.1
-
diff --git a/board/sinovoip/m1-plus/post-build.sh b/board/sinovoip/m1-plus/post-build.sh
deleted file mode 100755
index 4ee6fa3bc4..0000000000
--- a/board/sinovoip/m1-plus/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-# Remove all but the brcmfmac43362 firmware files
-find $TARGET_DIR/lib/firmware/brcm -type f -not -name "brcmfmac43362*" -delete
diff --git a/board/sinovoip/m1-plus/readme.txt b/board/sinovoip/m1-plus/readme.txt
deleted file mode 100644
index ae647c21a9..0000000000
--- a/board/sinovoip/m1-plus/readme.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-Banana Pi M1+
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-Buildroot environment for the Banana Pi M1+. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-How to build it
-===============
-
-Configure Buildroot:
-
-  $ make bananapi_m1_plus_defconfig
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
-Insert the micro SD card in your Banana Pi M1+ and power it up. The console
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
-For this example you need package alsa-utils.
-
-Connect a headphone to the 3.5mm jack (TRRS). Note, that the Banana Pi M1+
-has an on-board microphone, too.
-
-  # amixer cset name='Power Amplifier DAC Playback Switch' on
-  # amixer cset name='Power Amplifier Mute Switch' on
-  # amixer cset name='Power Amplifier Volume' 42
diff --git a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
deleted file mode 120000
index 93947975ee..0000000000
--- a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.sinovoip,bpi-m1-plus.txt
+++ /dev/null
@@ -1 +0,0 @@
-brcmfmac43362-sdio.txt
\ No newline at end of file
diff --git a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt b/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
deleted file mode 100644
index 14a554fdd8..0000000000
--- a/board/sinovoip/m1-plus/rootfs_overlay/lib/firmware/brcm/brcmfmac43362-sdio.txt
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
diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
deleted file mode 100644
index 271124f79a..0000000000
--- a/configs/bananapi_m1_plus_defconfig
+++ /dev/null
@@ -1,45 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_GLOBAL_PATCH_DIR="board/sinovoip/m1-plus/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_TARGET_GENERIC_HOSTNAME="bananapi"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pi!"
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_OVERLAY="board/sinovoip/m1-plus/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sinovoip/m1-plus/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sinovoip/m1-plus/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.3"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sinovoip/m1-plus/linux-wifi.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi-m1-plus"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
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
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m1_plus"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sinovoip/m1-plus/boot.cmd"
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
