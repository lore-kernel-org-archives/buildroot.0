Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A1EC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F80415B9;
	Tue,  1 Nov 2022 22:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F80415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QO1Gu1Q73dXI; Tue,  1 Nov 2022 22:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25BBF4161F;
	Tue,  1 Nov 2022 22:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25BBF4161F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2F7B1BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE4F48142B
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE4F48142B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z74VpUeDryFN for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49C2813F3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B49C2813F3
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:20:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id C57B8240009;
 Tue,  1 Nov 2022 22:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 23:20:00 +0100
Message-Id: <20221101222001.407202-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
References: <20221101220354.403933-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667341203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzTwtFULbMDs5D4+Lp3p+XVAEL9ifiqb01CUJKvciKY=;
 b=N3i9ptzYVOmi9kVL7qT2uRI7eQeZXWCK3TA1Soyd4QmQiShhitqKxa/qMNpqXm3fViQTli
 VC0bktm3WjJ1V5xEuSCl1CbVNC9O8DcTmfkxCLA/hvjAy52uQwLs3Na2gXg6fs23EmQi4u
 h+nbs1u+9/mKlwLlSNVGZic7KLFUgAW34ROQ8UFJpazaqGjpXUA2i9I1a13r/HX0pFBaS/
 sL8eL3pY3Ywev/hoCHN3ub4gPvqkZCldey+yoqDb4hsajU9Tpy+Hy9zj9U72L8Hh+14KA1
 bpu+WqOqDH8hyTWDFRfZ1UZ5LU3hWCFuOWpdBj2A/Rhu1x8gKsYWWXg0/OLhFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N3i9ptzY
Subject: [Buildroot] [PATCH 15/21] configs/friendlyarm_nanopi_r1: remove
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
Cc: Davide Viti <zinosat@gmail.com>,
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3234499056

Cc: Davide Viti <zinosat@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |   2 -
 board/friendlyarm/nanopi-r1/boot.cmd          |   8 -
 board/friendlyarm/nanopi-r1/genimage.cfg      |  37 ----
 .../nanopi-r1/kernel/linux-extras.config      |   2 -
 .../nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts   | 170 ------------------
 board/friendlyarm/nanopi-r1/readme.txt        |  29 ---
 .../nanopi-r1/uboot/nanopi_r1_defconfig       |  22 ---
 .../nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts    | 102 -----------
 configs/friendlyarm_nanopi_r1_defconfig       |  49 -----
 9 files changed, 421 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-r1/boot.cmd
 delete mode 100644 board/friendlyarm/nanopi-r1/genimage.cfg
 delete mode 100644 board/friendlyarm/nanopi-r1/kernel/linux-extras.config
 delete mode 100644 board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
 delete mode 100644 board/friendlyarm/nanopi-r1/readme.txt
 delete mode 100644 board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig
 delete mode 100644 board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts
 delete mode 100644 configs/friendlyarm_nanopi_r1_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 2050268173..a24fc168bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -722,8 +722,6 @@ N:	David Pierret <david.pierret@smile.fr>
 F:	package/bat/
 
 N:	Davide Viti <zinosat@gmail.com>
-F:	board/friendlyarm/nanopi-r1/
-F:	configs/friendlyarm_nanopi_r1_defconfig
 F:	package/flann/
 F:	package/python-paho-mqtt/
 F:	package/qhull/
diff --git a/board/friendlyarm/nanopi-r1/boot.cmd b/board/friendlyarm/nanopi-r1/boot.cmd
deleted file mode 100644
index 9f0cdbfe51..0000000000
--- a/board/friendlyarm/nanopi-r1/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-r1.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-r1/genimage.cfg b/board/friendlyarm/nanopi-r1/genimage.cfg
deleted file mode 100644
index a180311cae..0000000000
--- a/board/friendlyarm/nanopi-r1/genimage.cfg
+++ /dev/null
@@ -1,37 +0,0 @@
-# Minimal SD card image for the NanoPi M1
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-nanopi-r1.dtb",
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
diff --git a/board/friendlyarm/nanopi-r1/kernel/linux-extras.config b/board/friendlyarm/nanopi-r1/kernel/linux-extras.config
deleted file mode 100644
index 206b3810a7..0000000000
--- a/board/friendlyarm/nanopi-r1/kernel/linux-extras.config
+++ /dev/null
@@ -1,2 +0,0 @@
-# USB ethernet
-CONFIG_USB_RTL8152=y
diff --git a/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts b/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
deleted file mode 100644
index ca15a57bee..0000000000
--- a/board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts
+++ /dev/null
@@ -1,170 +0,0 @@
-/*
- * Copyright (C) 2019 Igor Pecovnik <igor@armbian.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include "sun8i-h3-nanopi.dtsi"
-
-/ {
-	model = "FriendlyElec NanoPi-R1";
-	compatible = "friendlyarm,nanopi-r1", "allwinner,sun8i-h3";
-
-	aliases {
-		serial1 = &uart3;
-		ethernet0 = &emac;
-		ethernet1 = &emac;
-		ethernet2 = &sdio_wifi;
-	};
-
-	wifi_pwrseq: wifi_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		pinctrl-names = "default";
-		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-	};
-
-	reg_gmac_3v3: gmac-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "gmac-3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <100000>;
-		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
-	};
-
-	leds {
-		/delete-node/ status;
-		/delete-node/ pwr;
-		led1 {
-			label = "LED1";
-			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
-			linux,default-trigger = "heartbeat";
-		};
-
-		led2 {
-			label = "LED2";
-			gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-			linux,default-trigger = "netdev";
-		};
-
-		led3 {
-			label = "LED3";
-			gpios = <&pio 0 9 GPIO_ACTIVE_HIGH>;
-			default-state = "off";
-			linux,default-trigger = "netdev";
-		};
-	};
-
-	r_gpio_keys {
-		compatible = "gpio-keys";
-		input-name = "k1";
-		pinctrl-names = "default";
-		pinctrl-0 = <&sw_r_npi>;
-
-		/delete-node/ k1;
-		reset {
-			label = "reset";
-			linux,code = <BTN_1>;
-			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
-		};
-	};
-};
-
-&emac {
-	pinctrl-names = "default";
-	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
-	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
-
-	status = "okay";
-};
-
-&external_mdio {
-	ext_rgmii_phy: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <7>;
-	};
-};
-
-&mmc1 {
-	vmmc-supply = <&reg_vcc3v3>;
-	vqmmc-supply = <&reg_vcc3v3>;
-	mmc-pwrseq = <&wifi_pwrseq>;
-	bus-width = <4>;
-	non-removable;
-	status = "okay";
-
-	sdio_wifi: sdio_wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-		interrupt-parent = <&pio>;
-		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
-		interrupt-names = "host-wake";
-	};
-};
-
-&mmc2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_8bit_pins>;
-	vmmc-supply = <&reg_vcc3v3>;
-	vqmmc-supply = <&reg_vcc3v3>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
-&ohci0 {
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
-&usb_otg {
-	dr_mode = "peripheral";
-	status = "okay";
-};
-
-&usbphy {
-	status = "okay";
-};
diff --git a/board/friendlyarm/nanopi-r1/readme.txt b/board/friendlyarm/nanopi-r1/readme.txt
deleted file mode 100644
index fa3114fc83..0000000000
--- a/board/friendlyarm/nanopi-r1/readme.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-NanoPi R1
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the NanoPi R1. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-How to build it
-===============
-
-Configure Buildroot:
-
-    $ make friendlyarm_nanopi_r1_defconfig
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
diff --git a/board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig b/board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig
deleted file mode 100644
index e028b41a46..0000000000
--- a/board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig
+++ /dev/null
@@ -1,22 +0,0 @@
-CONFIG_ARM=y
-CONFIG_ARCH_SUNXI=y
-CONFIG_SPL=y
-CONFIG_MACH_SUN8I_H3=y
-CONFIG_DRAM_CLK=408
-CONFIG_DRAM_ZQ=3881979
-CONFIG_DRAM_ODT_EN=y
-CONFIG_MACPWR="PD6"
-# CONFIG_VIDEO_DE2 is not set
-CONFIG_NR_DRAM_BANKS=1
-# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_CONSOLE_MUX=y
-CONFIG_SYS_CLK_FREQ=480000000
-# CONFIG_CMD_FLASH is not set
-# CONFIG_SPL_DOS_PARTITION is not set
-# CONFIG_SPL_EFI_PARTITION is not set
-CONFIG_DEFAULT_DEVICE_TREE="sun8i-h3-nanopi-r1"
-CONFIG_SUN8I_EMAC=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_SYS_USB_EVENT_POLL_VIA_INT_QUEUE=y
-CONFIG_MMC_SUNXI_SLOT_EXTRA=2
diff --git a/board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts b/board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts
deleted file mode 100644
index 9c3c574e0f..0000000000
--- a/board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts
+++ /dev/null
@@ -1,102 +0,0 @@
-/*
- * Copyright (C) 2019 Igor Pecovnik <igor@armbian.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include "sun8i-h3-nanopi.dtsi"
-
-/ {
-	model = "FriendlyARM NanoPi R1";
-	compatible = "friendlyarm,nanopi-neo", "allwinner,sun8i-h3";
-
-	reg_gmac_3v3: gmac-3v3 {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		regulator-name = "gmac-3v3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <100000>;
-		enable-active-high;
-		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
-	};
-
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&pio {
-	gmac_power_pin_nanopi: gmac_power_pin@0 {
-		pins = "PD6";
-		function = "gpio_out";
-	};
-};
-
-&ohci0 {
-	status = "okay";
-};
-
-&mmc2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_8bit_pins>;
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <8>;
-	non-removable;
-	cap-mmc-hw-reset;
-	status = "okay";
-};
-
-&emac {
-	pinctrl-names = "default";
-	pinctrl-0 = <&emac_rgmii_pins>;
-	phy-supply = <&reg_gmac_3v3>;
-	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
-
-	status = "okay";
-};
-
-&external_mdio {
-	ext_rgmii_phy: ethernet-phy@1 {
-		compatible = "ethernet-phy-ieee802.3-c22";
-		reg = <7>;
-	};
-};
diff --git a/configs/friendlyarm_nanopi_r1_defconfig b/configs/friendlyarm_nanopi_r1_defconfig
deleted file mode 100644
index 8b03f6dd00..0000000000
--- a/configs/friendlyarm_nanopi_r1_defconfig
+++ /dev/null
@@ -1,49 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
-
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-
-# System configuration
-BR2_TARGET_GENERIC_HOSTNAME="nanopi-r1"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi R1"
-
-# Bootloaders
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-r1/uboot/sun8i-h3-nanopi-r1.dts"
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r1/uboot/nanopi_r1_defconfig"
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-r1/boot.cmd"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-r1/kernel/linux-extras.config"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/friendlyarm/nanopi-r1/kernel/sun8i-h3-nanopi-r1.dts"
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-r1"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-r1/genimage.cfg"
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
