Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA4C761A6
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 12:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0733A41DB9;
	Thu, 30 Mar 2023 12:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0733A41DB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TR4YNnDyDjAp; Thu, 30 Mar 2023 12:36:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA4841E78;
	Thu, 30 Mar 2023 12:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA4841E78
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3174B1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A0FB41E78
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A0FB41E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8b0FxcLsUSeQ for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 12:36:20 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC5641DB9
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BC5641DB9
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 12:36:19 +0000 (UTC)
Received: from debian-test.local.in-circuit.de ([87.185.213.79]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N1M4p-1qSJEA1dDn-012oMh; Thu, 30 Mar 2023 14:31:13 +0200
From: Ludwig Kormann <ludwig.kormann@in-circuit.de>
To: buildroot@buildroot.org
Date: Thu, 30 Mar 2023 14:30:53 +0200
Message-Id: <20230330123053.7204-1-ludwig.kormann@in-circuit.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:ENdyWHszxBX1XmwgNbhpPIKuXr15trBc1JdsXEdJP7cPJw3qssb
 jO9dijHDp8UM/+h86BErnwGIXyhKF9oKAi5GwZz8lQABDWvhy7xkH3Z+mlUu/8EfzbsQHU6
 h2gf/crmLlF2vUiIpA8eBXtsVLEVQzhS+7yrnBsc7blrGAbD4vgsQEm1azaSZYOGdOqLer1
 JCE13lOiZ/ho3NMF7tD2g==
UI-OutboundReport: notjunk:1;M01:P0:nyYik+c7koQ=;0zcUJx9aIKlH0yCV2HCSdkoMSNZ
 /877MQE1mblKb0BPUYAhFsyeWvhyEyRi8m4tKBjlBI2o7a/zY5de5akYm5YWRw1/wbFis6hmT
 z9V+//Yt8zdb3Goeckpye3QIJcmssfOCUK2oOjTLCzlWCCKNeE9v94A8V7CAFNYWiFjs73kVR
 Dz6hBKtoCW5zIuSleC9udndzwOrV4Bk9QVI9MOBzmDkjv42NabJCqbmoAHj8eqUrC+Z3nnUKS
 1ba02MJumKarEI+kWms+aa4Jq4GXF5KyGMEHmoCa1fYu3HIw3tjUAAF0VRdVz73/sXCoqaxYJ
 KeOsliVQ5aVw1/og+4+MaSvVFdXU/Zr6xJm/qiJRKjPMdd2ohyRtx1Y9VNvDryHAbM6VXuvDU
 R1uqcjbsu30c0jh+csawLKHYj2O3/PoOhFHIha8lNKvnqQqkYt5mhzV2AjWLewrzbxWHaStw4
 dCah+5y+9omajNhldDPGgUYOA4CY87VIHwx8oAHlHc3H8PUai/1v96pok0+fyiICQIEUArq2h
 6roY/fb2Mv260tDOiT3OS+47G5Wfg9p3jSr6yu6GC9h32iGm6pT7S7F/61QEgcTqPWHRkKdO+
 NOjhovugb6wVlAicavObnMW3Ft3L2hzqSMN40py7GT/M/bSmIUiivPiVZINxt4dZClmd9Wec7
 ShsxHNcGs5kOf0nxAJgXNIxKQRWYuSpZpmvNNkOOBw==
Subject: [Buildroot] [PATCH 1/1] configs/icnova-a20-adb4006: new defconfig
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
Cc: Ludwig Kormann <ludwig.kormann@in-circuit.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a defconfig for ICnova A20 SomPi compute module on ADB4006
development board with Allwinner A20 chip and 512MB/1GB RAM.

Board support package includes the following components:
- mainline Linux kernel 6.1.21
- mainline U-Boot 2023.01
- custom dts & uboot defconfig
- default packages from buildoot

https://wiki.in-circuit.de/index.php5?title=ICnova_ADB4006
https://wiki.in-circuit.de/index.php5?title=ICnova_A20_SODIMM

Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>
---
 DEVELOPERS                                    |   4 +
 board/in-circuit/icnova-a20-adb4006/boot.cmd  |   5 +
 .../icnova-a20-adb4006/genimage.cfg           |  38 +++
 .../icnova-a20-adb4006/linux.fragment         |   1 +
 .../icnova-a20-adb4006/post-image.sh          |  16 ++
 .../sun7i-a20-icnova-a20-adb4006.dts          | 255 ++++++++++++++++++
 ...n7i-a20-icnova-a20-adb4006_uboot_defconfig |  26 ++
 configs/icnova-a20-adb4006_defconfig          |  48 ++++
 8 files changed, 393 insertions(+)
 create mode 100644 board/in-circuit/icnova-a20-adb4006/boot.cmd
 create mode 100644 board/in-circuit/icnova-a20-adb4006/genimage.cfg
 create mode 100644 board/in-circuit/icnova-a20-adb4006/linux.fragment
 create mode 100755 board/in-circuit/icnova-a20-adb4006/post-image.sh
 create mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
 create mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
 create mode 100644 configs/icnova-a20-adb4006_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 67c6004ddf..4cd7964cde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1903,6 +1903,10 @@ F:	package/python-simplejson/
 F:	package/python-versiontools/
 F:	package/wilc-firmware/
 
+N:	Ludwig Kormann <ludwig.kormann@in-circuit.de>
+F:	board/in-circuit/
+F:	configs/icnova*
+
 N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
 F:	board/freescale/imx8qmmek/
 F:	configs/freescale_imx8qmmek_defconfig
diff --git a/board/in-circuit/icnova-a20-adb4006/boot.cmd b/board/in-circuit/icnova-a20-adb4006/boot.cmd
new file mode 100644
index 0000000000..93d32a5e5f
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-icnova-a20-adb4006.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/in-circuit/icnova-a20-adb4006/genimage.cfg b/board/in-circuit/icnova-a20-adb4006/genimage.cfg
new file mode 100644
index 0000000000..4975d679be
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the ICnova A20 SomPi on ADB4006
+# Based in the Cubieboard2 genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-icnova-a20-adb4006.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/in-circuit/icnova-a20-adb4006/linux.fragment b/board/in-circuit/icnova-a20-adb4006/linux.fragment
new file mode 100644
index 0000000000..1c99df12e6
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/linux.fragment
@@ -0,0 +1 @@
+CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
diff --git a/board/in-circuit/icnova-a20-adb4006/post-image.sh b/board/in-circuit/icnova-a20-adb4006/post-image.sh
new file mode 100755
index 0000000000..9cca1b1789
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
new file mode 100644
index 0000000000..798851311d
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
@@ -0,0 +1,255 @@
+/*
+ * Copyright 2023 Ludwig Kormann <ludwig.kormann@in-circuit.de>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "sun7i-a20.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "In-Circuit ICnova A20 ADB4006";
+	compatible = "in-circuit,icnova-a20-adb4006", "allwinner,sun7i-a20";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_icnova_a20_adb4006>;
+
+		yellow {
+			label = "icnova_a20_adb4006:yellow:usr";
+			gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		red {
+			label = "icnova_a20_adb4006:red:usr";
+			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&ahci {
+	target-supply = <&reg_ahci_5v>;
+	status = "okay";
+};
+
+&codec {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_mii_pins>;
+	phy-handle = <&phy1>;
+	phy-mode = "mii";
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&gmac_mdio {
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&pio {
+	led_pins_icnova_a20_adb4006: led_pins@0 {
+		pins = "PH20", "PH21";
+		function = "gpio_out";
+		drive-strength = <20>;
+	};
+
+	usb0_id_detect_pin: usb0-id-detect-pin {
+		pins = "PH4";
+		function = "gpio_in";
+		bias-pull-up;
+	};
+};
+
+&reg_ahci_5v {
+	status = "okay";
+};
+
+#include "axp209.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-int-dll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
+
+&reg_ldo4 {
+	regulator-always-on;
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "csi-io";
+};
+
+&reg_usb1_vbus {
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>;
+	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
new file mode 100644
index 0000000000..011271892b
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
@@ -0,0 +1,26 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-icnova-a20-adb4006"
+CONFIG_SPL=y
+CONFIG_MACH_SUN7I=y
+CONFIG_DRAM_CLK=384
+CONFIG_MMC0_CD_PIN="PH1"
+CONFIG_USB0_VBUS_DET="PH5"
+CONFIG_USB0_ID_DET="PH4"
+CONFIG_USB1_VBUS_PIN="PH6"
+CONFIG_USB2_VBUS_PIN="PH3"
+CONFIG_SATAPWR="PB8"
+CONFIG_AHCI=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SCSI_AHCI=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_MII=y
+CONFIG_SUN7I_GMAC=y
+CONFIG_AXP_ALDO4_VOLT=2800
+CONFIG_SCSI=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
new file mode 100644
index 0000000000..f9d17ba082
--- /dev/null
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -0,0 +1,48 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 6.1 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="ICnova A20 ADB4006"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ICnova A20 ADB4006!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/in-circuit/icnova-a20-adb4006/post-image.sh"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.21"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/in-circuit/icnova-a20-adb4006/boot.cmd"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
