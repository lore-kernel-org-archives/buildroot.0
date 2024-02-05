Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B96EC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D4C415CE;
	Mon,  5 Feb 2024 10:38:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D4C415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Jw76PKHsF3v; Mon,  5 Feb 2024 10:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5A2417A1;
	Mon,  5 Feb 2024 10:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5A2417A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56CD31BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 300A560F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 300A560F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIAgUPOd2_TA for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F96060EED
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F96060EED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C96586ACD; Mon,  5 Feb 2024 10:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:38:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5a90f1b75e59aa5707394f3c707fbbf03204b7
X-Git-Newrev: c39bf6823ae947b215ac870d2b5f54b7e7b65073
X-Patchwork-Hint: ignore
Message-Id: <20240205103820.2C96586ACD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/icnova-a20-adb4006: bump Linux and
 U-Boot version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c39bf6823ae947b215ac870d2b5f54b7e7b65073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version of Linux to 6.6.14 and U-Boot to 2024.01
and also use upstream configs and dts.

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../sun7i-a20-icnova-a20-adb4006.dts               | 137 ---------------------
 .../sun7i-a20-icnova-a20-adb4006_uboot_defconfig   |  20 ---
 .../icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi   |  62 ----------
 configs/icnova-a20-adb4006_defconfig               |  14 +--
 4 files changed, 6 insertions(+), 227 deletions(-)

diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
deleted file mode 100644
index 577ead1d02..0000000000
--- a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
+++ /dev/null
@@ -1,137 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-// Copyright (C) 2023 In-Circuit GmbH
-
-/dts-v1/;
-
-#include "sun7i-a20-icnova-a20.dtsi"
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
-
-/ {
-	model = "In-Circuit ICnova A20 ADB4006";
-	compatible = "incircuit,icnova-a20-adb4006", "incircuit,icnova-a20",
-		     "allwinner,sun7i-a20";
-
-	aliases {
-		serial0 = &uart0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&hdmi_out_con>;
-			};
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led-0 {
-			function = LED_FUNCTION_POWER;
-			color = <LED_COLOR_ID_YELLOW>;
-			gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* PH21 */
-			default-state = "on";
-		};
-
-		led-1 {
-			function = LED_FUNCTION_HEARTBEAT;
-			color = <LED_COLOR_ID_RED>;
-			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>; /* PH20 */
-			linux,default-trigger = "heartbeat";
-		};
-	};
-};
-
-&ahci {
-	target-supply = <&reg_ahci_5v>;
-	status = "okay";
-};
-
-&codec {
-	status = "okay";
-};
-
-&de {
-	status = "okay";
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
-};
-
-&hdmi {
-	status = "okay";
-};
-
-&hdmi_out {
-	hdmi_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
-	};
-};
-
-&mmc0 {
-	vmmc-supply = <&reg_vcc3v3>;
-	bus-width = <4>;
-	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
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
-&otg_sram {
-	status = "okay";
-};
-
-&reg_ahci_5v {
-	status = "okay";
-};
-
-&ac_power_supply {
-	status = "okay";
-};
-
-&reg_usb1_vbus {
-	status = "okay";
-};
-
-&reg_usb2_vbus {
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_pb_pins>;
-	status = "okay";
-};
-
-&usb_otg {
-	dr_mode = "otg";
-	status = "okay";
-};
-
-&usbphy {
-	usb0_id_det-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
-	usb0_vbus_det-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
-	usb1_vbus-supply = <&reg_usb1_vbus>;
-	usb2_vbus-supply = <&reg_usb2_vbus>;
-	status = "okay";
-};
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
deleted file mode 100644
index f70ffe45ab..0000000000
--- a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-CONFIG_ARM=y
-CONFIG_ARCH_SUNXI=y
-CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-icnova-a20-adb4006"
-CONFIG_SPL=y
-CONFIG_MACH_SUN7I=y
-CONFIG_DRAM_CLK=384
-CONFIG_AHCI=y
-# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_I2C=y
-CONFIG_SCSI_AHCI=y
-CONFIG_SYS_I2C_MVTWSI=y
-CONFIG_SYS_I2C_SLAVE=0x7f
-CONFIG_SYS_I2C_SPEED=400000
-CONFIG_ETH_DESIGNWARE=y
-CONFIG_MII=y
-CONFIG_SUN7I_GMAC=y
-CONFIG_AXP_ALDO4_VOLT=2800
-CONFIG_SCSI=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_OHCI_HCD=y
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi
deleted file mode 100644
index 46616c6bc8..0000000000
--- a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-// Copyright (C) 2023 In-Circuit GmbH
-
-#include "sun7i-a20.dtsi"
-#include "sunxi-common-regulators.dtsi"
-
-#include <dt-bindings/interrupt-controller/irq.h>
-
-&cpu0 {
-	cpu-supply = <&reg_dcdc2>;
-};
-
-&gmac {
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac_mii_pins>;
-	phy-handle = <&phy1>;
-	phy-mode = "mii";
-	status = "okay";
-};
-
-&i2c0 {
-	status = "okay";
-
-	axp209: pmic@34 {
-		reg = <0x34>;
-		interrupt-parent = <&nmi_intc>;
-		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-	};
-};
-
-&gmac_mdio {
-	phy1: ethernet-phy@1 {
-		reg = <1>;
-	};
-};
-
-#include "axp209.dtsi"
-
-&reg_dcdc2 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1400000>;
-	regulator-name = "vdd-cpu";
-};
-
-&reg_dcdc3 {
-	regulator-always-on;
-	regulator-min-microvolt = <1000000>;
-	regulator-max-microvolt = <1400000>;
-	regulator-name = "vdd-int-dll";
-};
-
-&reg_ldo1 {
-	regulator-name = "vdd-rtc";
-};
-
-&reg_ldo2 {
-	regulator-always-on;
-	regulator-min-microvolt = <3000000>;
-	regulator-max-microvolt = <3000000>;
-	regulator-name = "avcc";
-};
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index d572bbd0b5..ba529c8db5 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -2,8 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 6.1 LTS series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="ICnova A20 ADB4006"
@@ -20,11 +20,11 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.35"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-icnova-a20-adb4006"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
@@ -36,15 +36,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
-BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="icnova-a20-adb4006"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/in-circuit/icnova-a20-adb4006/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
