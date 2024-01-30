Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA69C46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 13:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C51281EAF;
	Tue, 30 Jan 2024 13:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C51281EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgtbEsAfwY8E; Tue, 30 Jan 2024 13:24:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7337E81E5F;
	Tue, 30 Jan 2024 13:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7337E81E5F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DEE41BF2A5
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 13:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97E2400B9
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 13:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97E2400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Biaw6vbakyyf for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 13:23:57 +0000 (UTC)
X-Greylist: delayed 359 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 30 Jan 2024 13:23:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE4740242
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CAE4740242
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1706620674; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=s/WpiCGf69EJikwrammh4bqVfZyVAEo2z55kx1GnDtBr4+gUfX9NYCjjNlh3se9Wwt
 VPavNGlYwIelpdNH7Z2z43nu49ijD/PSH3gfcSKWAvBxF+UgLIRsio+NXWgF0mXq8c6Z
 Ln3WPRzH3mik8QI5kWbWiS5gMi25Qsr+7zsk+r5rptYAG41qrpIqNufikpixZB0jTj0D
 g7zuTecI1iwyfBFohg2gQ8YkHzEV5yK/Hf7R0zN/baU2XzfFioLFJSIaivTBKk8dsvPS
 VZNcniOMOifY0WOuAlfHbZug49O8h833MA541/d9df/7B56lH2wvjz6UniiEBuk5LGpX
 3uUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1706620674;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=dBie0KEgHsa2XSYZcNMBJrA3Rw6grX7cJah+cTOgqEQ=;
 b=JEQJMg30AvFGHQ/p1RtDL2NCfe/dhonNTm8XMQCz4tOpXIIphO5WN3BzvoehtS4aAV
 +8m0PovbIKiyibobdJsMd8RTkiZyHVFv6ECMCZgyfDVAvPBvgyuSS5rVZOaR2+RwS+zl
 Wo+86Q/sBQN0eeUGfPkLfR9S/OwvrW21VoQAUEJ9E3WjSTzeIQrmfiEgXK63gqLEs8PC
 1me30kFHe7hh+MawsKQ0kVJgqE07HX7rm+2Zpnr3zj9sASMHZS4v73NdT6M5dgsJFIH0
 b+PWyb6ft4va56qoidkzT5JgIQGZIwtB70311/isx6/IJB/To6LQHoct4vPFjqTWk3Uw
 Wvag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KglxDI1B7BeEcdPLARTmodKwkQi99TJCcPJmIA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 49.11.2 DYNA|AUTH)
 with ESMTPSA id x7ec2e00UDHs4Mj
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Tue, 30 Jan 2024 14:17:54 +0100 (CET)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 14:17:50 +0100
Message-Id: <20240130131750.3802767-1-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1706620674; 
 s=strato-dkim-0002; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=dBie0KEgHsa2XSYZcNMBJrA3Rw6grX7cJah+cTOgqEQ=;
 b=Uh/oy05leszKg6qDW+emQFA+nxXvVpxySQqaEqavdOzsS1ygBe0GLpFcTlsf77fB+Q
 Nwt/zMdaHGJd7zRWScwWryM9jyAzQwpBJ5dV3DmU8i36K3lscSeWylN1XA5G3wFh7elW
 F45E3LtGvPaBVoJbAmWjTLE/CFGNKm0RVxjafobhy2q4avw2lPNZMvHGysuZWfABerOu
 zXNhBOS/xP3v/sFbx9cb/5BnUCaxlEjLuJQesftbOVhlaHJDt8rRHVkV1b/9p/hrEyHg
 JBPwEZ2WPhH/itC1UAG1OdF8AFvvrTCC5Iu7OZCGG7LG+RZtWAle7HJMaMlPRzY/dS+F
 Oh+w==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1706620674; 
 s=strato-dkim-0003; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=dBie0KEgHsa2XSYZcNMBJrA3Rw6grX7cJah+cTOgqEQ=;
 b=eZX2uUB4vo9DeLTMq5yPturhO2q6bP4ELiuIpTTsSZzWSJJu/lOnA9D6hbKC2odcLw
 QuoIpyE9kmb1JUozKqAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Uh/oy05l; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=eZX2uUB4
Subject: [Buildroot] [PATCH 1/1] configs/icnova-a20-adb4006: Bump Linux and
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version of Linux to 6.6.14 and U-Boot to 2024.01
and also use upstream configs and dts.

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 .../sun7i-a20-icnova-a20-adb4006.dts          | 137 ------------------
 ...n7i-a20-icnova-a20-adb4006_uboot_defconfig |  20 ---
 .../sun7i-a20-icnova-a20.dtsi                 |  62 --------
 configs/icnova-a20-adb4006_defconfig          |  14 +-
 4 files changed, 6 insertions(+), 227 deletions(-)
 delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
 delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
 delete mode 100644 board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
