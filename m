Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF31C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03008813D1;
	Wed,  5 Oct 2022 07:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03008813D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdX9CZyQDklJ; Wed,  5 Oct 2022 07:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70BF5813D5;
	Wed,  5 Oct 2022 07:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BF5813D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDA01BF2BC
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63F914029B
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 07:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F914029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8oGhi6IQY6j9 for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 07:58:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93E940287
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A93E940287
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 07:58:21 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F3FE1BF218;
 Wed,  5 Oct 2022 07:58:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 09:58:13 +0200
Message-Id: <20221005075815.305236-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664956696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zs1MXBSTGPbv8IH8JZ42EqugMtOHAtpt9C2MQzCF8Mc=;
 b=cMw8hh/N/3b5Op/Ca1MdtRS/gDnTDC+MaOap2wQJVXQsr9usLOvm2jCzyrCmXszuwsfUBL
 Cl/kiW/xFnf/k7ArpUa8a49g1REC21fXgqAyPD+YKan7iLl1gYWXUOinDLlmctTk2xHtrR
 XElusYMKF3vhRj+rb1RABicLwVGnj0VsiCebSZ1uaVpTqTj6M7dqIZ3qxO77wHiV0hRS7S
 tsukG0QWSfb7LZZ6f1ULnPC2Dqnepc7UR9vXDrgs3iQrHqW18n4Vz7KR4z/t/B01M5y82B
 HsWUtHAIVx/YXSPI8a2sE8tgJ9YTioba00iz/nCVaBC8Qua5srfq95+FxDfqIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cMw8hh/N
Subject: [Buildroot] [PATCH 1/2] board/octavo/osd32mp1-red: update BSP
 components
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
From: =?utf-8?q?K=C3=B6ry_Maincent_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

Update description:
  TF-A to v2.4-stm32mp-r1
  U-boot to version v2020.10-stm32mp-r2.1
  Linux to v5.10-stm32mp-r2.1

This patch also updates U-boot to to use FIP image.

Reference:

  https://octavosystems.com/octavo_products/osd32mp1-red/

The device tree blobs, and the U-boot patches come from Octavo System:

  https://github.com/octavosystems/meta-octavo-osd32mp1

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 board/octavo/osd32mp1-red/genimage.cfg        |    8 +-
 ...1-red.dts => stm32mp157c-osd32mp1-red.dts} |  591 +++--
 .../linux-dts/stm32mp157c-osd32mp1-red.dtsi   | 2077 -----------------
 .../overlay/boot/extlinux/extlinux.conf       |    2 +-
 ...Add-OSD32MP1-RED-Device-Tree-support.patch | 1180 +++++-----
 ...5_trusted_defconfig-disable-environm.patch |   47 +-
 ...1066-binG.dtsi => osd32mp1_ddr_1x4Gb.dtsi} |   12 +-
 .../stm32mp157c-osd32mp1-red-fw-config.dts    |    6 +
 ...1-red.dts => stm32mp157c-osd32mp1-red.dts} |  672 +++---
 configs/octavo_osd32mp1_red_defconfig         |   24 +-
 10 files changed, 1308 insertions(+), 3311 deletions(-)
 rename board/octavo/osd32mp1-red/linux-dts/{osd32mp1-red.dts => stm32mp157c-osd32mp1-red.dts} (84%)
 delete mode 100644 board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
 rename board/octavo/osd32mp1-red/tfa-dts/{stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi => osd32mp1_ddr_1x4Gb.dtsi} (94%)
 create mode 100644 board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red-fw-config.dts
 rename board/octavo/osd32mp1-red/tfa-dts/{osd32mp1-red.dts => stm32mp157c-osd32mp1-red.dts} (60%)

diff --git a/board/octavo/osd32mp1-red/genimage.cfg b/board/octavo/osd32mp1-red/genimage.cfg
index 3f86579b98..bdad191489 100644
--- a/board/octavo/osd32mp1-red/genimage.cfg
+++ b/board/octavo/osd32mp1-red/genimage.cfg
@@ -4,15 +4,15 @@ image sdcard.img {
 	}
 
 	partition fsbl1 {
-		image = "tf-a-osd32mp1-red.stm32"
+		image = "tf-a-stm32mp157c-osd32mp1-red.stm32"
 	}
 
 	partition fsbl2 {
-		image = "tf-a-osd32mp1-red.stm32"
+		image = "tf-a-stm32mp157c-osd32mp1-red.stm32"
 	}
 
-	partition ssbl {
-		image = "u-boot.stm32"
+	partition fip {
+		image = "fip.bin"
 		size = 2M
 	}
 
diff --git a/board/octavo/osd32mp1-red/linux-dts/osd32mp1-red.dts b/board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dts
similarity index 84%
rename from board/octavo/osd32mp1-red/linux-dts/osd32mp1-red.dts
rename to board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dts
index 32a6d5cb45..bf0e23c761 100644
--- a/board/octavo/osd32mp1-red/linux-dts/osd32mp1-red.dts
+++ b/board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dts
@@ -1,35 +1,40 @@
 /* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 /*
- * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
- * Author: STM32CubeMX code generation for STMicroelectronics.
- */
-
-/* For more information on Device Tree configuration, please refer to
- * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
+ * Copyright (C) Octavo Systems 2021 - All Rights Reserved
+ * Author: Neeraj Dantu <dantuguf14105@gmail.com> for Octavo Systems
  */
 
 /dts-v1/;
-#include "stm32mp157c-osd32mp1-red.dtsi"
-#include "stm32mp157cac-pinctrl.dtsi"
-#include "stm32mp157c-m4-srm.dtsi"
-
 
-#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15-m4-srm.dtsi"
 #include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/rtc/rtc-stm32.h>
 
-
 / {
-	model = "Octavo OSD32MP1-RED board";
-	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
+	model = "Octavo OSD32MP1 RED board";
+	compatible = "octavo,stm32mp157c-osd32mp1-red", "st,stm32mp157";
 
 	memory@c0000000 {
+		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpiog 5 GPIO_ACTIVE_LOW>;
+  	};
+
+	clocks {
+		clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
 	};
 
 	reserved-memory {
@@ -37,46 +42,43 @@
 		#size-cells = <1>;
 		ranges;
 
-
-
-		retram: retram@0x38000000 {
+		mcuram2:mcuram2@10000000{
 			compatible = "shared-dma-pool";
-			reg = <0x38000000 0x10000>;
+			reg = <0x10000000 0x40000>;
 			no-map;
 		};
 
-		mcuram: mcuram@0x30000000 {
+		vdev0vring0:vdev0vring0@10040000{
 			compatible = "shared-dma-pool";
-			reg = <0x30000000 0x40000>;
+			reg = <0x10040000 0x1000>;
 			no-map;
 		};
 
-		mcuram2: mcuram2@0x10000000 {
+		vdev0vring1:vdev0vring1@10041000{
 			compatible = "shared-dma-pool";
-			reg = <0x10000000 0x40000>;
+			reg = <0x10041000 0x1000>;
 			no-map;
 		};
 
-		vdev0vring0: vdev0vring0@10040000 {
+		vdev0buffer:vdev0buffer@10042000{
 			compatible = "shared-dma-pool";
-			reg = <0x10040000 0x2000>;
+			reg = <0x10042000 0x4000>;
 			no-map;
 		};
 
-		vdev0vring1: vdev0vring1@10042000 {
+		mcuram:mcuram@30000000{
 			compatible = "shared-dma-pool";
-			reg = <0x10042000 0x2000>;
+			reg = <0x30000000 0x40000>;
 			no-map;
 		};
 
-		vdev0buffer: vdev0buffer@10044000 {
+		retram:retram@38000000{
 			compatible = "shared-dma-pool";
-			reg = <0x10044000 0x4000>;
+			reg = <0x38000000 0x10000>;
 			no-map;
 		};
 
-
-		gpu_reserved: gpu@d4000000 {
+		gpu_reserved:gpu@d4000000{
 			reg = <0xd4000000 0x4000000>;
 			no-map;
 		};
@@ -95,19 +97,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	sram: sram@10050000 {
-		compatible = "mmio-sram";
-		reg = <0x10050000 0x10000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x10050000 0x10000>;
-
-		dma_pool: dma_pool@0 {
-			reg = <0x0 0x10000>;
-			pool;
-		};
-	};
-
 	led {
 		compatible = "gpio-leds";
 		blue {
@@ -116,21 +105,9 @@
 			linux,default-trigger = "heartbeat";
 			default-state = "off";
 		};
-
-	};
-
-	sound {
-		compatible = "audio-graph-card";
-		label = "STM32MP1-DK";
-		routing =
-			"Playback" , "MCLK",
-			"Capture" , "MCLK",
-			"MICL" , "Mic Bias";
-		dais = <&i2s2_port>;
-		status = "okay";
 	};
 
-	usb_phy_tuning: usb-phy-tuning {
+	usb_phy_tuning:usb-phy-tuning{
 		st,hs-dc-level = <2>;
 		st,fs-rftime-tuning;
 		st,hs-rftime-reduction;
@@ -141,43 +118,24 @@
 		st,no-lsfs-sc;
 	};
 
-
-
-	clocks {
-
-    clk_ext_camera: clk-ext-camera {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <24000000>;
-		};
-
-
-		clk_lsi: clk-lsi {
-			clock-frequency = <32000>;
-		};
-
-		clk_hsi: clk-hsi {
-			clock-frequency = <64000000>;
-		};
-
-		clk_csi: clk-csi {
-			clock-frequency = <4000000>;
-		};
-
-		clk_lse: clk-lse {
-			clock-frequency = <32768>;
-		};
-
-		clk_hse: clk-hse {
-			clock-frequency = <24000000>;
-		};
+	vin:vin{
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
-}; /*root*/
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP15-DK";
+		dais = <&i2s2_port>;
+		status = "okay";
+	};
+};
 
 &pinctrl {
 	u-boot,dm-pre-reloc;
-
 	dcmi_pins_mx: dcmi_mx-0 {
 		pins {
 			pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
@@ -271,7 +229,7 @@
 	i2c1_pins_mx: i2c1_mx-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
-			         <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+					 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
 			bias-disable;
 			drive-open-drain;
 			slew-rate = <0>;
@@ -281,7 +239,7 @@
 	i2c1_sleep_pins_mx: i2c1_sleep_mx-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
-			         <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+					 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
 		};
 	};
 
@@ -363,11 +321,16 @@
 					 <STM32_PINMUX('I', 0, AF14)>, /* LTDC_G5 */
 					 <STM32_PINMUX('I', 1, AF14)>, /* LTDC_G6 */
 					 <STM32_PINMUX('I', 2, AF14)>, /* LTDC_G7 */
-					<STM32_PINMUX('G', 7, AF14)>, /* LTDC_CLK */
 					 <STM32_PINMUX('I', 9, AF14)>, /* LTDC_VSYNC */
 					 <STM32_PINMUX('I', 10, AF14)>; /* LTDC_HSYNC */
 			bias-disable;
 			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 7, AF14)>; /* LTDC_CLK */
+			bias-disable;
+			drive-push-pull;
 			slew-rate = <1>;
 		};
 	};
@@ -423,7 +386,7 @@
 			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <2>;
 		};
 	};
 
@@ -444,7 +407,7 @@
 			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
 			bias-disable;
 			drive-push-pull;
-			slew-rate = <3>;
+			slew-rate = <2>;
 		};
 		pins3 {
 			u-boot,dm-pre-reloc;
@@ -668,36 +631,46 @@
 	usart2_pins_mx: usart2_mx-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('D', 3, AF7)>, /* USART2_CTS */
-				 <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+					 <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
 			bias-disable;
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('D', 4, AF7)>, /* USART2_RTS */
-			         <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
+					 <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <0>;
 		};
 	};
 
-	usart2_idle_pins_mx: usart2_sleep_mx-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+	usart2_sleep_pins_mx: usart2_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, ANALOG)>, /* USART2_CTS */
+					 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+					 <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+					 <STM32_PINMUX('D', 6, ANALOG)>; /* USART2_RX */
 		};
-		pins2 {
-			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+	};
+
+	cec_pins_mx: cec-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 6, AF5)>;
 			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
 		};
 	};
 
-	usart2_sleep_pins_mx: usart2_sleep_mx-0 {
+	cec_sleep_pins_mx: cec-sleep-1 {
 		pins {
-			pinmux = <STM32_PINMUX('D', 3, ANALOG)>, /* USART2_CTS */
-				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
-				 <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
-				 <STM32_PINMUX('D', 6, ANALOG)>; /* USART2_RX */
+			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
+		};
+	};
+
+	stusb1600_pins_mx: stusb1600-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
+			bias-pull-up;
 		};
 	};
 
@@ -721,15 +694,6 @@
 		};
 	};
 
-
-
-	stusb1600_pins_mx: stusb1600_mx-0 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 8, ANALOG)>;
-			bias-pull-up;
-		};
-	};
-
 };
 
 &pinctrl_z {
@@ -770,36 +734,26 @@
 					 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
 		};
 	};
-
 };
 
-&m4_rproc {
+&m4_rproc{
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
 	mbox-names = "vq0", "vq1", "shutdown";
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
-	interrupt-names = "wdg";
 	wakeup-source;
-	recovery;
 	status = "okay";
 };
 
-&bsec{
-	status = "okay";
-
-};
-
 &dcmi{
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmi_pins_mx>;
 	pinctrl-1 = <&dcmi_sleep_pins_mx>;
 	status = "okay";
 
-
-
-  	port {
+	port {
 		dcmi_0: endpoint {
 			remote-endpoint = <&ov5640_0>;
 			bus-width = <8>;
@@ -809,20 +763,12 @@
 			pclk-max-frequency = <77000000>;
 		};
 	};
-
 };
 
 &dsi{
 	status = "okay";
 
-  #address-cells = <1>;
-	#size-cells = <0>;
-	status = "okay";
-
 	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		port@0 {
 			reg = <0>;
 			dsi_in: endpoint {
@@ -838,7 +784,7 @@
 		};
 	};
 
-	panel@0 {
+	panel_otm8009a: panel-otm8009a@0 {
 		compatible = "orisetech,otm8009a";
 		reg = <0>;
 		reset-gpios = <&gpioe 9 GPIO_ACTIVE_LOW>;
@@ -851,8 +797,6 @@
 			};
 		};
 	};
-
-
 };
 
 &ethernet0{
@@ -862,10 +806,12 @@
 	status = "okay";
 
 
-  st,eth_clk_sel = <1>;
-  phy-mode = "rgmii-id";
+	st,eth-clk-sel;  //custom
+	phy-mode = "rgmii-id";
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
+	nvmem-cells = <&ethernet_mac_address>;
+	nvmem-cell-names = "mac-address";
 
 	mdio0 {
 		#address-cells = <1>;
@@ -875,20 +821,24 @@
 			reg = <3>;
 		};
 	};
-
 };
 
 &gpu{
 	status = "okay";
-
-
 	contiguous-area = <&gpu_reserved>;
+};
 
+&hash1 {
+	status = "okay";
 };
 
 &hsem{
 	status = "okay";
+};
 
+&cryp1{
+	u-boot,dm-pre-reloc;
+	status = "okay";
 };
 
 &i2c1{
@@ -896,16 +846,11 @@
 	pinctrl-0 = <&i2c1_pins_mx>;
 	pinctrl-1 = <&i2c1_sleep_pins_mx>;
 	status = "okay";
-
-
-
 	i2c-scl-rising-time-ns = <100>;
 	i2c-scl-falling-time-ns = <7>;
-
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-
 	touchscreen@2a {
 		compatible = "focaltech,ft6236";
 		reg = <0x2a>;
@@ -914,29 +859,31 @@
 		interrupt-controller;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
+		panel = <&panel_otm8009a>;
+		vcc-supply = <&v3v3>;
 		status = "okay";
 	};
 	touchscreen@38 {
-		compatible = "focaltech,ft6336";
+		compatible = "focaltech,ft6236";
 		reg = <0x38>;
 		interrupts = <2 2>;
 		interrupt-parent = <&gpiof>;
 		interrupt-controller;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
+		panel = <&panel_otm8009a>;
+		vcc-supply = <&v3v3>;
 		status = "okay";
 	};
+
 	hdmi-transmitter@39 {
 		compatible = "sil,sii9022";
 		reg = <0x39>;
 		reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
 		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiog>;
-		pinctrl-names = "default", "sleep";
-		pinctrl-0 = <&ltdc_pins_mx>;
-		pinctrl-1 = <&ltdc_sleep_pins_mx>;
+		#sound-dai-cells = <0>;
 		status = "okay";
-
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -948,15 +895,14 @@
 				};
 			};
 
-      port@1 {
-        reg = <1>;
-        sii9022_tx_endpoint: endpoint {
-          remote-endpoint = <&i2s2_endpoint>;
-        };
-      };
+			port@3 {
+				reg = <3>;
+				sii9022_tx_endpoint: endpoint {
+					remote-endpoint = <&i2s2_endpoint>;
+				};
+			};
 		};
 	};
-
 };
 
 &i2c2{
@@ -964,19 +910,21 @@
 	pinctrl-0 = <&i2c2_pins_mx &i2c2_pins_z_mx>;
 	pinctrl-1 = <&i2c2_sleep_pins_mx &i2c2_sleep_pins_z_mx>;
 	status = "okay";
-
-  	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
-  	ov5640: camera@3c {
+	ov5640: camera@3c {
 		compatible = "ovti,ov5640";
 		reg = <0x3c>;
 		clocks = <&clk_ext_camera>;
 		clock-names = "xclk";
 		DOVDD-supply = <&v3v3>;
+		//powerdown-gpios = <&stmfx_pinctrl 18 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
+		//reset-gpios = <&stmfx_pinctrl 19 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+		//powerdown-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;  //custom
+		//reset-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;  //custom
 		rotation = <180>;
 		status = "okay";
 
@@ -992,7 +940,6 @@
 			};
 		};
 	};
-
 };
 
 &i2c4{
@@ -1001,12 +948,11 @@
 	pinctrl-0 = <&i2c4_pins_z_mx>;
 	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
 	status = "okay";
-
-
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
+	clock-frequency = <400000>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
 
 	typec: stusb1600@28 {
 		compatible = "st,stusb1600";
@@ -1016,16 +962,23 @@
 		pinctrl-0 = <&stusb1600_pins_mx>;
 		pinctrl-names = "default";
 		status = "okay";
+		vdd-supply = <&vin>;
 
 		typec_con: connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
 			power-role = "dual";
 			power-opmode = "default";
+
+			port {
+				con_usbotg_hs_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
 		};
 	};
 
-	pmic: stpmic@33 {
+	pmic:stpmic@33{
 		compatible = "st,stpmic1";
 		reg = <0x33>;
 		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
@@ -1037,16 +990,25 @@
 		st,vin-control-register = <0xc0>;
 		st,usb-control-register = <0x20>;
 
-		regulators {
+		regulators{
 			compatible = "st,stpmic1-regulators";
-
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
 			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&vin>;
 			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
+			ldo5-supply = <&vin>;
 			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
 
-			vddcore: buck1 {
+
+			vddcore:buck1{
 				regulator-name = "vddcore";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
@@ -1055,7 +1017,7 @@
 				regulator-over-current-protection;
 			};
 
-			vdd_ddr: buck2 {
+			vdd_ddr:buck2{
 				regulator-name = "vdd_ddr";
 				regulator-min-microvolt = <1350000>;
 				regulator-max-microvolt = <1350000>;
@@ -1064,7 +1026,7 @@
 				regulator-over-current-protection;
 			};
 
-			vdd: buck3 {
+			vdd:buck3{
 				regulator-name = "vdd";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -1074,7 +1036,7 @@
 				regulator-over-current-protection;
 			};
 
-			v3v3: buck4 {
+			v3v3:buck4{
 				regulator-name = "v3v3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -1083,25 +1045,23 @@
 				regulator-initial-mode = <0>;
 			};
 
-			v1v8_ldo1: ldo1 {
-				regulator-name = "v1v8_ldo1";
+			v1v8_audio:ldo1{
+				regulator-name = "v1v8_audio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO1 0>;
-
 			};
 
-			v2v8_ldo2: ldo2 {			//custom
-				regulator-name = "v2v8_ldo2";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
+			v3v3_hdmi:ldo2{
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO2 0>;
-
 			};
 
-			vtt_ddr: ldo3 {
+			vtt_ddr:ldo3{
 				regulator-name = "vtt_ddr";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <750000>;
@@ -1109,14 +1069,12 @@
 				regulator-over-current-protection;
 			};
 
-			vdd_usb: ldo4 {
+			vdd_usb:ldo4{
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
 			};
 
-                        v3v3_eth: ldo5 {
+			v3v3_eth:ldo5{
 				regulator-name = "v3v3_eth";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -1124,46 +1082,46 @@
 				regulator-boot-on;
 			};
 
-			v3v3_dsi: ldo6 {
+			v3v3_dsi:ldo6{
 				regulator-name = "v3v3_dsi";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO6 0>;
-
 			};
 
-			vref_ddr: vref_ddr {
+			vref_ddr:vref_ddr{
 				regulator-name = "vref_ddr";
 				regulator-always-on;
 				regulator-over-current-protection;
 			};
 
-      bst_out: boost {
-       regulator-name = "bst_out";
-       interrupts = <IT_OCP_BOOST 0>;
-       regulator-always-on;
-      };
+			bst_out:boost{
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+				regulator-always-on;
+			};
 
-     vbus_otg: pwr_sw1 {
-       regulator-name = "vbus_otg";
-       interrupts = <IT_OCP_OTG 0>;
-       regulator-active-discharge;
-       regulator-always-on;
-      };
+			vbus_otg:pwr_sw1{
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+				regulator-active-discharge;
+				regulator-always-on;
+			};
 
-      vbus_sw: pwr_sw2 {
-       regulator-name = "vbus_sw";
-       interrupts = <IT_OCP_SWOUT 0>;
-       regulator-active-discharge;
-       regulator-always-on;
-      };
+			vbus_sw:pwr_sw2{
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+				regulator-always-on;
+			};
 		};
 
-		onkey {
+		onkey{
 			compatible = "st,stpmic1-onkey";
-			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
 			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
 			status = "okay";
 		};
 
@@ -1172,6 +1130,11 @@
 			status = "disabled";
 		};
 	};
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
 };
 
 &i2c5{
@@ -1185,45 +1148,52 @@
 
 };
 
+&spi5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi5_pins_mx>;
+	pinctrl-1 = <&spi5_sleep_pins_mx>;
+	cs-gpios = <&gpiof 6 0>;
+	status = "okay";
+
+	spidev: spidev@0 {
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <30000000>;
+		reg = <0>;
+	};
+};
+
 &i2s2{
-  clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-  clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+	clock-names = "pclk", "i2sclk", "x8k", "x11k";
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2s2_pins_mx>;
 	pinctrl-1 = <&i2s2_sleep_pins_mx>;
 	status = "okay";
 
-  i2s2_port: port {
+	i2s2_port: port {
 		i2s2_endpoint: endpoint {
 			remote-endpoint = <&sii9022_tx_endpoint>;
 			format = "i2s";
 			mclk-fs = <256>;
 		};
 	};
-
 };
 
 &ipcc{
 	status = "okay";
-
 };
 
 &iwdg2{
 	status = "okay";
-
-
 	timeout-sec = <32>;
-
 };
 
 &ltdc{
-
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_mx>;
+	pinctrl-1 = <&ltdc_sleep_pins_mx>;
 	status = "okay";
-
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		ltdc_ep0_out: endpoint@0 {
 			reg = <0>;
 			remote-endpoint = <&sii9022_in>;
@@ -1233,36 +1203,48 @@
 			reg = <1>;
 			remote-endpoint = <&dsi_in>;
 		};
-
 	};
+};
 
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-&pwr{
+&rcc{
+	u-boot,dm-pre-reloc;
 	status = "okay";
+};
 
+&rng1{
+	status = "okay";
+};
 
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-		vdd_3v3_usbfs-supply = <&vdd_usb>;
-	};
-
+&rtc{
+	status = "okay";
 };
 
-&rcc{
-	u-boot,dm-pre-reloc;
+&cec {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&cec_pins_mx>;
+	pinctrl-1 = <&cec_sleep_pins_mx>;
 	status = "okay";
+};
 
+&cpu0{
+	cpu-supply = <&vddcore>;
 };
 
-&rng1{
-	status = "okay";
+&cpu1{
+	cpu-supply = <&vddcore>;
+};
 
+&crc1 {
+	status = "okay";
 };
 
-&rtc{
+&dts {
 	status = "okay";
-	st,lsco = <RTC_OUT2_RMP>;
 };
 
 &sdmmc1{
@@ -1272,11 +1254,12 @@
 	pinctrl-1 = <&sdmmc1_opendrain_pins_mx>;
 	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
 	status = "okay";
-	broken-cd;
+
+	cd-gpios = <&gpioe 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
-
 };
 
 &sdmmc2{
@@ -1286,7 +1269,7 @@
 	pinctrl-1 = <&sdmmc2_opendrain_pins_mx>;
 	pinctrl-2 = <&sdmmc2_sleep_pins_mx>;
 	status = "okay";
-        non-removable;
+  	non-removable;
 	no-sd;
 	no-sdio;
 	st,neg-edge;
@@ -1294,20 +1277,15 @@
 	vmmc-supply = <&v3v3>;
 	vqmmc-supply = <&v3v3>;
 	mmc-ddr-3_3v;
-
 };
 
 &sdmmc3{
-	u-boot,dm-pre-reloc;
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc3_pins_mx>;
 	pinctrl-1 = <&sdmmc3_opendrain_pins_mx>;
 	pinctrl-2 = <&sdmmc3_sleep_pins_mx>;
-	status = "okay";
-
-
 	arm,primecell-periphid = <0x10153180>;
-	non-removable;
+  	non-removable;
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
@@ -1320,14 +1298,11 @@
 	brcmf: bcrmf@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
-		status = "okay";
 	};
-
 };
 
 &tamp{
 	status = "okay";
-
 };
 
 &timers5 {
@@ -1350,29 +1325,32 @@
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&uart4_pins_mx>;
 	pinctrl-1 = <&uart4_sleep_pins_mx>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
-
 };
 
 &usart2{
-	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&usart2_pins_mx>;
 	pinctrl-1 = <&usart2_sleep_pins_mx>;
-	pinctrl-2 = <&usart2_idle_pins_mx>;
-	st,hw-flow-ctrl;
+	uart-has-rtscts;
 	status = "okay";
 
 	bluetooth {
 		shutdown-gpios = <&gpioe 10 GPIO_ACTIVE_HIGH>;
 		compatible = "brcm,bcm43438-bt";
 		max-speed = <3000000>;
+		vbat-supply = <&v3v3>;
+		vddio-supply = <&v3v3>;
 	};
 };
 
-
-&m4_rproc {
-memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-		<&vdev0vring1>, <&vdev0buffer>;
+&sram {
+	dma_pool: dma_pool@0 {
+		reg = <0x50000 0x10000>;
+		pool;
+	};
 };
 
 &dma1 {
@@ -1383,6 +1361,37 @@ memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 	sram = <&dma_pool>;
 };
 
+&adc {
+	vdd-supply = <&vdd>;
+	vdda-supply = <&v3v3_eth>;
+	vref-supply = <&v3v3_eth>;
+	status = "okay";
+	adc1: adc@0 {
+		st,min-sample-time-nsecs = <5000>;
+		st,adc-channels = <0 1>;
+		status = "okay";
+	};
+
+	adc_temp: temp {
+		status = "okay";
+	};
+};
+
+
+// WARNING: Do not try to enable DAC1 and DCMI
+// This devices share the same pin PA4
+/* &dac {
+	pinctrl-names = "default";
+	status = "okay";
+	dac1: dac@1 {
+		pinctrl-0 = <&dac_ch1_pins_a>;
+		status = "disabled";
+	};
+	dac2: dac@2 {
+		pinctrl-0 = <&dac_ch2_pins_a>;
+		status = "okay";
+	};
+};*/
 
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
@@ -1391,76 +1400,38 @@ memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 };
 
 &usbh_ohci{
-  phys = <&usbphyc_port0>;
-  phy-names = "usb";
-  status = "okay";
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
 };
 
 &usbotg_hs {
-	extcon = <&typec>;
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
+	usb-role-switch;
 	status = "okay";
+
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usbotg_hs_ep>;
+		};
+	};
 };
 
 &usbphyc {
-	vdd3v3-supply = <&vdd_usb>;
 	status = "okay";
 };
 
 &usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
 	st,phy-tuning = <&usb_phy_tuning>;
 };
 
 &usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
 	st,phy-tuning = <&usb_phy_tuning>;
 };
 
-&spi5 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&spi5_pins_mx>;
-	pinctrl-1 = <&spi5_sleep_pins_mx>;
-	cs-gpios = <&gpiof 6 0>;
-	status = "okay";
-
-	spidev: spidev@0 {
-		compatible = "rohm,dh2228fv";
-		spi-max-frequency = <30000000>;
-		reg = <0>;
-	};
-};
-
-// WARNING: Do not try to enable DAC1 and DCMI
-// This devices share the same pin PA4
-&dac {
-	pinctrl-names = "default";
-	vref-supply = <&vrefbuf>;
-	status = "okay";
-	dac1: dac@1 {
-		pinctrl-0 = <&dac_ch1_pins_a>;
-		status = "disabled";
-	};
-	dac2: dac@2 {
-		pinctrl-0 = <&dac_ch2_pins_a>;
-		status = "okay";
-	};
-};
-
-&adc {
-	vdd-supply = <&vdd>;
-	vdda-supply = <&vdd>;
-	vref-supply = <&v3v3_eth>;
-	status = "okay";
-	adc1: adc@0 {
-		st,adc-channels = <0 1>; //ANA0 ANA1
-		status = "okay";
-	};
-	adc2: adc@100 {
-		//st,adc-channels = <0 1 2 6 12 18 19>;
-		status = "okay";
-	};
-};
-
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_mx>;
diff --git a/board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dtsi b/board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
deleted file mode 100644
index b1e6303950..0000000000
--- a/board/octavo/osd32mp1-red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
+++ /dev/null
@@ -1,2077 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
-/*//
- * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
- * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
- */
-#include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/stm32mp1-clks.h>
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/reset/stm32mp1-resets.h>
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "arm,cortex-a7";
-			device_type = "cpu";
-			reg = <0>;
-			clocks = <&rcc CK_MPU>;
-			clock-names = "cpu";
-			operating-points-v2 = <&cpu0_opp_table>;
-			nvmem-cells = <&part_number_otp>;
-			nvmem-cell-names = "part_number";
-		};
-
-		cpu1: cpu@1 {
-			compatible = "arm,cortex-a7";
-			device_type = "cpu";
-			reg = <1>;
-			clocks = <&rcc CK_MPU>;
-			clock-names = "cpu";
-			operating-points-v2 = <&cpu0_opp_table>;
-		};
-	};
-
-	cpu0_opp_table: cpu0-opp-table {
-		compatible = "operating-points-v2";
-		opp-shared;
-
-		opp-650000000 {
-			opp-hz = /bits/ 64 <650000000>;
-			opp-microvolt = <1200000>;
-			opp-supported-hw = <0x1>;
-		};
-		opp-800000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <1350000>;
-			opp-supported-hw = <0x2>;
-		};
-	};
-
-	arm-pmu {
-		compatible = "arm,cortex-a7-pmu";
-		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>, <&cpu1>;
-		interrupt-parent = <&intc>;
-	};
-
-	psci {
-		compatible = "arm,psci-1.0";
-		method = "smc";
-	};
-
-	intc: interrupt-controller@a0021000 {
-		compatible = "arm,cortex-a7-gic";
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		reg = <0xa0021000 0x1000>,
-		      <0xa0022000 0x2000>;
-	};
-
-	timer {
-		compatible = "arm,armv7-timer";
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		interrupt-parent = <&intc>;
-		always-on;
-	};
-
-	clocks {
-		clk_hse: clk-hse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <24000000>;
-		};
-
-		clk_hsi: clk-hsi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <64000000>;
-		};
-
-		clk_lse: clk-lse {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32768>;
-		};
-
-		clk_lsi: clk-lsi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <32000>;
-		};
-
-		clk_csi: clk-csi {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <4000000>;
-		};
-
-		clk_i2s_ckin: i2s_ckin {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-
-		clk_dsi_phy: ck_dsi_phy {
-			#clock-cells = <0>;
-			compatible = "fixed-clock";
-			clock-frequency = <0>;
-		};
-	};
-
-	pm_domain {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "st,stm32mp157c-pd";
-
-		pd_core_ret: core-ret-power-domain@1 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <1>;
-			#power-domain-cells = <0>;
-			label = "CORE-RETENTION";
-
-			pd_core: core-power-domain@2 {
-				reg = <2>;
-				#power-domain-cells = <0>;
-				label = "CORE";
-			};
-		};
-	};
-
-	thermal-zones {
-		cpu_thermal: cpu-thermal {
-			polling-delay-passive = <0>;
-			polling-delay = <0>;
-			thermal-sensors = <&dts>;
-
-			trips {
-				cpu-crit {
-					temperature = <120000>;
-					hysteresis = <0>;
-					type = "critical";
-				};
-			};
-
-			cooling-maps {
-			};
-		};
-	};
-
-	reboot {
-		compatible = "syscon-reboot";
-		regmap = <&rcc>;
-		offset = <0x404>;
-		mask = <0x1>;
-	};
-
-	replicator {
-		/*
-		 * non-configurable replicators don't show up on the
-		 * AMBA bus.  As such no need to add "arm,primecell"
-		 */
-		compatible = "arm,coresight-replicator";
-		clocks = <&rcc CK_TRACE>;
-		clock-names = "apb_pclk";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			/* replicator output ports */
-			port@0 {
-				reg = <0>;
-				replicator_out_port0: endpoint {
-					remote-endpoint = <&funnel_in_port4>;
-				};
-			};
-		};
-	};
-
-	soc {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		interrupt-parent = <&intc>;
-		ranges;
-
-		timers2: timer@40000000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40000000 0x400>;
-			clocks = <&rcc TIM2_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 18 0x400 0x5>,
-			       <&dmamux1 19 0x400 0x5>,
-			       <&dmamux1 20 0x400 0x5>,
-			       <&dmamux1 21 0x400 0x5>,
-			       <&dmamux1 22 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4", "up";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@1 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <1>;
-				status = "disabled";
-			};
-		};
-
-		timers3: timer@40001000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40001000 0x400>;
-			clocks = <&rcc TIM3_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 23 0x400 0x5>,
-			       <&dmamux1 24 0x400 0x5>,
-			       <&dmamux1 25 0x400 0x5>,
-			       <&dmamux1 26 0x400 0x5>,
-			       <&dmamux1 27 0x400 0x5>,
-			       <&dmamux1 28 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@2 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		timers4: timer@40002000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40002000 0x400>;
-			clocks = <&rcc TIM4_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 29 0x400 0x5>,
-			       <&dmamux1 30 0x400 0x5>,
-			       <&dmamux1 31 0x400 0x5>,
-			       <&dmamux1 32 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@3 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <3>;
-				status = "disabled";
-			};
-		};
-
-		timers5: timer@40003000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40003000 0x400>;
-			clocks = <&rcc TIM5_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 55 0x400 0x5>,
-			       <&dmamux1 56 0x400 0x5>,
-			       <&dmamux1 57 0x400 0x5>,
-			       <&dmamux1 58 0x400 0x5>,
-			       <&dmamux1 59 0x400 0x5>,
-			       <&dmamux1 60 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@4 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <4>;
-				status = "disabled";
-			};
-		};
-
-		timers6: timer@40004000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40004000 0x400>;
-			clocks = <&rcc TIM6_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 69 0x400 0x5>;
-			dma-names = "up";
-			status = "disabled";
-
-			timer@5 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <5>;
-				status = "disabled";
-			};
-		};
-
-		timers7: timer@40005000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40005000 0x400>;
-			clocks = <&rcc TIM7_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 70 0x400 0x5>;
-			dma-names = "up";
-			status = "disabled";
-
-			timer@6 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <6>;
-				status = "disabled";
-			};
-		};
-
-		timers12: timer@40006000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40006000 0x400>;
-			clocks = <&rcc TIM12_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@11 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <11>;
-				status = "disabled";
-			};
-		};
-
-		timers13: timer@40007000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40007000 0x400>;
-			clocks = <&rcc TIM13_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@12 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <12>;
-				status = "disabled";
-			};
-		};
-
-		timers14: timer@40008000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x40008000 0x400>;
-			clocks = <&rcc TIM14_K>;
-			clock-names = "int";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@13 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <13>;
-				status = "disabled";
-			};
-		};
-
-		lptimer1: timer@40009000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x40009000 0x400>;
-			clocks = <&rcc LPTIM1_K>;
-			clock-names = "mux";
-			power-domains = <&pd_core>;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@0 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <0>;
-				status = "disabled";
-			};
-
-			counter {
-				compatible = "st,stm32-lptimer-counter";
-				status = "disabled";
-			};
-		};
-
-		spi2: spi@4000b000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x4000b000 0x400>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI2_K>;
-			resets = <&rcc SPI2_R>;
-			dmas = <&dmamux1 39 0x400 0x01>,
-			       <&dmamux1 40 0x400 0x01>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		i2s2: audio-controller@4000b000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x4000b000 0x400>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 39 0x400 0x01>,
-			       <&dmamux1 40 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi3: spi@4000c000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x4000c000 0x400>;
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI3_K>;
-			resets = <&rcc SPI3_R>;
-			dmas = <&dmamux1 61 0x400 0x01>,
-			       <&dmamux1 62 0x400 0x01>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		i2s3: audio-controller@4000c000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x4000c000 0x400>;
-			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 61 0x400 0x01>,
-			       <&dmamux1 62 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spdifrx: audio-controller@4000d000 {
-			compatible = "st,stm32h7-spdifrx";
-			#sound-dai-cells = <0>;
-			reg = <0x4000d000 0x400>;
-			clocks = <&rcc SPDIF_K>;
-			clock-names = "kclk";
-			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 93 0x400 0x01>,
-			       <&dmamux1 94 0x400 0x01>;
-			dma-names = "rx", "rx-ctrl";
-			status = "disabled";
-		};
-
-		usart2: serial@4000e000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x4000e000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 27 1>;
-			clocks = <&rcc USART2_K>;
-			resets = <&rcc USART2_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 43 0x400 0x21>,
-			       <&dmamux1 44 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		usart3: serial@4000f000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x4000f000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 28 1>;
-			clocks = <&rcc USART3_K>;
-			resets = <&rcc USART3_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 45 0x400 0x21>,
-			       <&dmamux1 46 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		uart4: serial@40010000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40010000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 30 1>;
-			clocks = <&rcc UART4_K>;
-			resets = <&rcc UART4_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 63 0x400 0x21>,
-			       <&dmamux1 64 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		uart5: serial@40011000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40011000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 31 1>;
-			clocks = <&rcc UART5_K>;
-			resets = <&rcc UART5_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 65 0x400 0x21>,
-			       <&dmamux1 66 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		i2c1: i2c@40012000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40012000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 21 1>;
-			clocks = <&rcc I2C1_K>;
-			resets = <&rcc I2C1_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 33 0x400 0x05>,
-			       <&dmamux1 34 0x400 0x05>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x1>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x1>;
-			status = "disabled";
-		};
-
-		i2c2: i2c@40013000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40013000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 22 1>;
-			clocks = <&rcc I2C2_K>;
-			resets = <&rcc I2C2_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 35 0x400 0x05>,
-			       <&dmamux1 36 0x400 0x05>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x2>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x2>;
-			status = "disabled";
-		};
-
-		i2c3: i2c@40014000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40014000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 23 1>;
-			clocks = <&rcc I2C3_K>;
-			resets = <&rcc I2C3_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 73 0x400 0x05>,
-			       <&dmamux1 74 0x400 0x05>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x4>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x4>;
-			status = "disabled";
-		};
-
-		i2c5: i2c@40015000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x40015000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 25 1>;
-			clocks = <&rcc I2C5_K>;
-			resets = <&rcc I2C5_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&dmamux1 115 0x400 0x05>,
-			       <&dmamux1 116 0x400 0x05>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x10>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x10>;
-			status = "disabled";
-		};
-
-		cec: cec@40016000 {
-			compatible = "st,stm32-cec";
-			reg = <0x40016000 0x400>;
-			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CEC_K>, <&rcc CEC>;
-			clock-names = "cec", "hdmi-cec";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		dac: dac@40017000 {
-			compatible = "st,stm32h7-dac-core";
-			reg = <0x40017000 0x400>;
-			clocks = <&rcc DAC12>;
-			clock-names = "pclk";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			dac1: dac@1 {
-				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
-				reg = <1>;
-				status = "disabled";
-			};
-
-			dac2: dac@2 {
-				compatible = "st,stm32-dac";
-				#io-channels-cells = <1>;
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		uart7: serial@40018000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40018000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 32 1>;
-			clocks = <&rcc UART7_K>;
-			resets = <&rcc UART7_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 79 0x400 0x21>,
-			       <&dmamux1 80 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		uart8: serial@40019000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x40019000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 33 1>;
-			clocks = <&rcc UART8_K>;
-			resets = <&rcc UART8_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 81 0x400 0x21>,
-			       <&dmamux1 82 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		timers1: timer@44000000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x44000000 0x400>;
-			clocks = <&rcc TIM1_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 11 0x400 0x5>,
-			       <&dmamux1 12 0x400 0x5>,
-			       <&dmamux1 13 0x400 0x5>,
-			       <&dmamux1 14 0x400 0x5>,
-			       <&dmamux1 15 0x400 0x5>,
-			       <&dmamux1 16 0x400 0x5>,
-			       <&dmamux1 17 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4",
-				    "up", "trig", "com";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@0 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <0>;
-				status = "disabled";
-			};
-		};
-
-		timers8: timer@44001000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x44001000 0x400>;
-			clocks = <&rcc TIM8_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 47 0x400 0x5>,
-			       <&dmamux1 48 0x400 0x5>,
-			       <&dmamux1 49 0x400 0x5>,
-			       <&dmamux1 50 0x400 0x5>,
-			       <&dmamux1 51 0x400 0x5>,
-			       <&dmamux1 52 0x400 0x5>,
-			       <&dmamux1 53 0x400 0x5>;
-			dma-names = "ch1", "ch2", "ch3", "ch4",
-				    "up", "trig", "com";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@7 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <7>;
-				status = "disabled";
-			};
-		};
-
-		usart6: serial@44003000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x44003000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 29 1>;
-			clocks = <&rcc USART6_K>;
-			resets = <&rcc USART6_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			dmas = <&dmamux1 71 0x400 0x21>,
-			       <&dmamux1 72 0x400 0x1>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi1: spi@44004000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x44004000 0x400>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI1_K>;
-			resets = <&rcc SPI1_R>;
-			dmas = <&dmamux1 37 0x400 0x01>,
-			       <&dmamux1 38 0x400 0x01>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		i2s1: audio-controller@44004000 {
-			compatible = "st,stm32h7-i2s";
-			#sound-dai-cells = <0>;
-			reg = <0x44004000 0x400>;
-			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&dmamux1 37 0x400 0x01>,
-			       <&dmamux1 38 0x400 0x01>;
-			dma-names = "rx", "tx";
-			status = "disabled";
-		};
-
-		spi4: spi@44005000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x44005000 0x400>;
-			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI4_K>;
-			resets = <&rcc SPI4_R>;
-			dmas = <&dmamux1 83 0x400 0x01>,
-			       <&dmamux1 84 0x400 0x01>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		timers15: timer@44006000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x44006000 0x400>;
-			clocks = <&rcc TIM15_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 105 0x400 0x5>,
-			       <&dmamux1 106 0x400 0x5>,
-			       <&dmamux1 107 0x400 0x5>,
-			       <&dmamux1 108 0x400 0x5>;
-			dma-names = "ch1", "up", "trig", "com";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@14 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <14>;
-				status = "disabled";
-			};
-		};
-
-		timers16: timer@44007000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x44007000 0x400>;
-			clocks = <&rcc TIM16_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 109 0x400 0x5>,
-			       <&dmamux1 110 0x400 0x5>;
-			dma-names = "ch1", "up";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-			timer@15 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <15>;
-				status = "disabled";
-			};
-		};
-
-		timers17: timer@44008000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-timers";
-			reg = <0x44008000 0x400>;
-			clocks = <&rcc TIM17_K>;
-			clock-names = "int";
-			dmas = <&dmamux1 111 0x400 0x5>,
-			       <&dmamux1 112 0x400 0x5>;
-			dma-names = "ch1", "up";
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			timer@16 {
-				compatible = "st,stm32h7-timer-trigger";
-				reg = <16>;
-				status = "disabled";
-			};
-		};
-
-		spi5: spi@44009000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x44009000 0x400>;
-			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI5_K>;
-			resets = <&rcc SPI5_R>;
-			dmas = <&dmamux1 85 0x400 0x01>,
-			       <&dmamux1 86 0x400 0x01>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		sai1: sai@4400a000 {
-			compatible = "st,stm32h7-sai";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4400a000 0x400>;
-			reg = <0x4400a000 0x4>;
-			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc SAI1_R>;
-			status = "disabled";
-
-			sai1a: audio-controller@4400a004 {
-				#sound-dai-cells = <0>;
-
-				compatible = "st,stm32-sai-sub-a";
-				reg = <0x4 0x1c>;
-				clocks = <&rcc SAI1_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 87 0x400 0x01>;
-				status = "disabled";
-			};
-
-			sai1b: audio-controller@4400a024 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
-				clocks = <&rcc SAI1_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 88 0x400 0x01>;
-				status = "disabled";
-			};
-		};
-
-		sai2: sai@4400b000 {
-			compatible = "st,stm32h7-sai";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4400b000 0x400>;
-			reg = <0x4400b000 0x4>;
-			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc SAI2_R>;
-			status = "disabled";
-
-			sai2a: audio-controller@4400b004 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-a";
-				reg = <0x4 0x1c>;
-				clocks = <&rcc SAI2_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 89 0x400 0x01>;
-				status = "disabled";
-			};
-
-			sai2b: audio-controller@4400b024 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
-				clocks = <&rcc SAI2_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 90 0x400 0x01>;
-				status = "disabled";
-			};
-		};
-
-		sai3: sai@4400c000 {
-			compatible = "st,stm32h7-sai";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x4400c000 0x400>;
-			reg = <0x4400c000 0x4>;
-			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc SAI3_R>;
-			status = "disabled";
-
-			sai3a: audio-controller@4400c004 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-a";
-				reg = <0x04 0x1c>;
-				clocks = <&rcc SAI3_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 113 0x400 0x01>;
-				status = "disabled";
-			};
-
-			sai3b: audio-controller@4400c024 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
-				clocks = <&rcc SAI3_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 114 0x400 0x01>;
-				status = "disabled";
-			};
-		};
-
-		dfsdm: dfsdm@4400d000 {
-			compatible = "st,stm32mp1-dfsdm";
-			reg = <0x4400d000 0x800>;
-			clocks = <&rcc DFSDM_K>;
-			clock-names = "dfsdm";
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			dfsdm0: filter@0 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <0>;
-				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 101 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			dfsdm1: filter@1 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <1>;
-				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 102 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			dfsdm2: filter@2 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <2>;
-				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 103 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			dfsdm3: filter@3 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <3>;
-				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 104 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			dfsdm4: filter@4 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <4>;
-				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 91 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			dfsdm5: filter@5 {
-				compatible = "st,stm32-dfsdm-adc";
-				#io-channel-cells = <1>;
-				reg = <5>;
-				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
-				dmas = <&dmamux1 92 0x400 0x01>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-		};
-
-		m_can1: can@4400e000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc FDCAN>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
-		m_can2: can@4400f000 {
-			compatible = "bosch,m_can";
-			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
-			reg-names = "m_can", "message_ram";
-			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "int0", "int1";
-			clocks = <&rcc FDCAN>, <&rcc FDCAN_K>;
-			clock-names = "hclk", "cclk";
-			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
-			status = "disabled";
-		};
-
-		dma1: dma@48000000 {
-			compatible = "st,stm32-dma";
-			reg = <0x48000000 0x400>;
-			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc DMA1>;
-			resets = <&rcc DMA1_R>;
-			#dma-cells = <4>;
-			st,mem2mem;
-			dma-requests = <8>;
-			dmas = <&mdma1 0 0x3 0x1200000a 0x48000008 0x00000020 1>,
-			       <&mdma1 1 0x3 0x1200000a 0x48000008 0x00000800 1>,
-			       <&mdma1 2 0x3 0x1200000a 0x48000008 0x00200000 1>,
-			       <&mdma1 3 0x3 0x1200000a 0x48000008 0x08000000 1>,
-			       <&mdma1 4 0x3 0x1200000a 0x4800000C 0x00000020 1>,
-			       <&mdma1 5 0x3 0x1200000a 0x4800000C 0x00000800 1>,
-			       <&mdma1 6 0x3 0x1200000a 0x4800000C 0x00200000 1>,
-			       <&mdma1 7 0x3 0x1200000a 0x4800000C 0x08000000 1>;
-			dma-names = "ch0", "ch1", "ch2", "ch3", "ch4", "ch5", "ch6", "ch7";
-		};
-
-		dma2: dma@48001000 {
-			compatible = "st,stm32-dma";
-			reg = <0x48001000 0x400>;
-			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc DMA2>;
-			resets = <&rcc DMA2_R>;
-			#dma-cells = <4>;
-			st,mem2mem;
-			dma-requests = <8>;
-			dmas = <&mdma1 8 0x3 0x1200000a 0x48001008 0x00000020 1>,
-			       <&mdma1 9 0x3 0x1200000a 0x48001008 0x00000800 1>,
-			       <&mdma1 10 0x3 0x1200000a 0x48001008 0x00200000 1>,
-			       <&mdma1 11 0x3 0x1200000a 0x48001008 0x08000000 1>,
-			       <&mdma1 12 0x3 0x1200000a 0x4800100C 0x00000020 1>,
-			       <&mdma1 13 0x3 0x1200000a 0x4800100C 0x00000800 1>,
-			       <&mdma1 14 0x3 0x1200000a 0x4800100C 0x00200000 1>,
-			       <&mdma1 15 0x3 0x1200000a 0x4800100C 0x08000000 1>;
-			dma-names = "ch0", "ch1", "ch2", "ch3", "ch4", "ch5", "ch6", "ch7";
-		};
-
-		dmamux1: dma-router@48002000 {
-			compatible = "st,stm32h7-dmamux";
-			reg = <0x48002000 0x1c>;
-			#dma-cells = <3>;
-			dma-requests = <128>;
-			dma-masters = <&dma1 &dma2>;
-			dma-channels = <16>;
-			clocks = <&rcc DMAMUX>;
-			resets = <&rcc DMAMUX_R>;
-		};
-
-		adc: adc@48003000 {
-			compatible = "st,stm32mp1-adc-core";
-			reg = <0x48003000 0x400>;
-			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
-			clock-names = "bus", "adc";
-			interrupt-controller;
-			st,syscfg-vbooster = <&syscfg 0x4 0x100>;
-			st,syscfg-vbooster-clr = <&syscfg 0x44 0x100>;
-			st,syscfg-anaswvdd = <&syscfg 0x4 0x200>;
-			st,syscfg-anaswvdd-clr = <&syscfg 0x44 0x200>;
-			#interrupt-cells = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			status = "disabled";
-
-			adc1: adc@0 {
-				compatible = "st,stm32mp1-adc";
-				#io-channel-cells = <1>;
-				reg = <0x0>;
-				interrupt-parent = <&adc>;
-				interrupts = <0>;
-				dmas = <&dmamux1 9 0x400 0x05>;
-				dma-names = "rx";
-				status = "disabled";
-			};
-
-			adc2: adc@100 {
-				compatible = "st,stm32mp1-adc";
-				#io-channel-cells = <1>;
-				reg = <0x100>;
-				interrupt-parent = <&adc>;
-				interrupts = <1>;
-				dmas = <&dmamux1 10 0x400 0x05>;
-				dma-names = "rx";
-				/* temperature sensor */
-				st,adc-channels = <12>;
-				st,min-sample-time-nsecs = <10000>;
-				status = "disabled";
-			};
-
-			jadc1: jadc@0 {
-				compatible = "st,stm32mp1-adc";
-				st,injected;
-				#io-channel-cells = <1>;
-				reg = <0x0>;
-				interrupt-parent = <&adc>;
-				interrupts = <3>;
-				status = "disabled";
-			};
-
-			jadc2: jadc@100 {
-				compatible = "st,stm32mp1-adc";
-				st,injected;
-				#io-channel-cells = <1>;
-				reg = <0x100>;
-				interrupt-parent = <&adc>;
-				interrupts = <4>;
-				/* temperature sensor */
-				st,adc-channels = <12>;
-				st,min-sample-time-nsecs = <10000>;
-				status = "disabled";
-			};
-
-			adc_temp: temp {
-				compatible = "st,stm32mp1-adc-temp";
-				io-channels = <&adc2 12>;
-				nvmem-cells = <&ts_cal1>, <&ts_cal2>;
-				nvmem-cell-names = "ts_cal1", "ts_cal2";
-				#io-channel-cells = <0>;
-				#thermal-sensor-cells = <0>;
-				status = "disabled";
-			};
-		};
-
-		sdmmc3: sdmmc@48004000 {
-			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00253180>;
-			reg = <0x48004000 0x400>, <0x48005000 0x400>;
-			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
-			clocks = <&rcc SDMMC3_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC3_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <120000000>;
-			status = "disabled";
-		};
-
-		usbotg_hs: usb-otg@49000000 {
-			compatible = "st,stm32mp1-hsotg", "snps,dwc2";
-			reg = <0x49000000 0x10000>;
-			clocks = <&rcc USBO_K>;
-			clock-names = "otg";
-			resets = <&rcc USBO_R>;
-			reset-names = "dwc2";
-			interrupts-extended = <&intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 44 1>;
-			interrupt-names = "event", "wakeup";
-			g-rx-fifo-size = <256>;
-			g-np-tx-fifo-size = <32>;
-			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
-			dr_mode = "otg";
-			usb33d-supply = <&usb33>;
-			power-domains = <&pd_core>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		hsem: hwspinlock@4c000000 {
-			compatible = "st,stm32-hwspinlock";
-			#hwlock-cells = <1>;
-			reg = <0x4c000000 0x400>;
-			clocks = <&rcc HSEM>;
-			clock-names = "hsem";
-			status = "okay";
-		};
-
-		ipcc: mailbox@4c001000 {
-			compatible = "st,stm32mp1-ipcc";
-			#mbox-cells = <1>;
-			reg = <0x4c001000 0x400>;
-			st,proc-id = <0>;
-			interrupts-extended =
-				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				<&exti 61 1>;
-			interrupt-names = "rx", "tx", "wakeup";
-			clocks = <&rcc IPCC>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		dcmi: dcmi@4c006000 {
-			compatible = "st,stm32-dcmi";
-			reg = <0x4c006000 0x400>;
-			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc CAMITF_R>;
-			clocks = <&rcc DCMI>;
-			clock-names = "mclk";
-			dmas = <&dmamux1 75 0x400 0x1d>;
-			dma-names = "tx";
-			status = "disabled";
-		};
-
-		rcc: rcc@50000000 {
-			compatible = "st,stm32mp1-rcc", "syscon";
-			reg = <0x50000000 0x1000>;
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
-		pwr: pwr@50001000 {
-			compatible = "st,stm32mp1-pwr", "syscon", "simple-mfd";
-			reg = <0x50001000 0x400>;
-
-			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
-
-			interrupt-controller;
-			#interrupt-cells = <3>;
-
-			wakeup-gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>,
-				       <&gpioa 2 GPIO_ACTIVE_HIGH>,
-				       <&gpioc 13 GPIO_ACTIVE_HIGH>,
-				       <&gpioi 8 GPIO_ACTIVE_HIGH>,
-				       <&gpioi 11 GPIO_ACTIVE_HIGH>,
-				       <&gpioc 1 GPIO_ACTIVE_HIGH>;
-
-			pwr-regulators {
-				compatible = "st,stm32mp1,pwr-reg";
-				st,tzcr = <&rcc 0x0 0x1>;
-
-				reg11: reg11 {
-					regulator-name = "reg11";
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-				};
-
-				reg18: reg18 {
-					regulator-name = "reg18";
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-				};
-
-				usb33: usb33 {
-					regulator-name = "usb33";
-					regulator-min-microvolt = <3300000>;
-					regulator-max-microvolt = <3300000>;
-				};
-			};
-		};
-
-		exti: interrupt-controller@5000d000 {
-			compatible = "st,stm32mp1-exti", "syscon";
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			reg = <0x5000d000 0x400>;
-			hwlocks = <&hsem 1>;
-
-			/* exti_pwr is an extra interrupt controller used for
-			 * EXTI 55 to 60. It's mapped on pwr interrupt
-			 * controller.
-			 */
-			exti_pwr: exti-pwr {
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				interrupt-parent = <&pwr>;
-				st,irq-number = <6>;
-			};
-		};
-
-		syscfg: syscon@50020000 {
-			compatible = "st,stm32mp157-syscfg", "syscon";
-			reg = <0x50020000 0x400>;
-			clocks = <&rcc SYSCFG>;
-		};
-
-		lptimer2: timer@50021000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x50021000 0x400>;
-			clocks = <&rcc LPTIM2_K>;
-			clock-names = "mux";
-			power-domains = <&pd_core>;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@1 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <1>;
-				status = "disabled";
-			};
-
-			counter {
-				compatible = "st,stm32-lptimer-counter";
-				status = "disabled";
-			};
-		};
-
-		lptimer3: timer@50022000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32-lptimer";
-			reg = <0x50022000 0x400>;
-			clocks = <&rcc LPTIM3_K>;
-			clock-names = "mux";
-			power-domains = <&pd_core>;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-
-			trigger@2 {
-				compatible = "st,stm32-lptimer-trigger";
-				reg = <2>;
-				status = "disabled";
-			};
-		};
-
-		lptimer4: timer@50023000 {
-			compatible = "st,stm32-lptimer";
-			reg = <0x50023000 0x400>;
-			clocks = <&rcc LPTIM4_K>;
-			clock-names = "mux";
-			power-domains = <&pd_core>;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		lptimer5: timer@50024000 {
-			compatible = "st,stm32-lptimer";
-			reg = <0x50024000 0x400>;
-			clocks = <&rcc LPTIM5_K>;
-			clock-names = "mux";
-			power-domains = <&pd_core>;
-			status = "disabled";
-
-			pwm {
-				compatible = "st,stm32-pwm-lp";
-				#pwm-cells = <3>;
-				status = "disabled";
-			};
-		};
-
-		vrefbuf: vrefbuf@50025000 {
-			compatible = "st,stm32-vrefbuf";
-			reg = <0x50025000 0x8>;
-			regulator-min-microvolt = <1500000>;
-			regulator-max-microvolt = <2500000>;
-			clocks = <&rcc VREF>;
-			status = "disabled";
-		};
-
-		sai4: sai@50027000 {
-			compatible = "st,stm32h7-sai";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x50027000 0x400>;
-			reg = <0x50027000 0x4>;
-			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&rcc SAI4_R>;
-			status = "disabled";
-
-			sai4a: audio-controller@50027004 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-a";
-				reg = <0x04 0x1c>;
-				clocks = <&rcc SAI4_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 99 0x400 0x01>;
-				status = "disabled";
-			};
-
-			sai4b: audio-controller@50027024 {
-				#sound-dai-cells = <0>;
-				compatible = "st,stm32-sai-sub-b";
-				reg = <0x24 0x1c>;
-				clocks = <&rcc SAI4_K>;
-				clock-names = "sai_ck";
-				dmas = <&dmamux1 100 0x400 0x01>;
-				status = "disabled";
-			};
-		};
-
-		dts: thermal@50028000 {
-			compatible = "st,stm32-thermal";
-			reg = <0x50028000 0x100>;
-			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc TMPSENS>;
-			clock-names = "pclk";
-			#thermal-sensor-cells = <0>;
-			status = "disabled";
-		};
-
-		hdp: hdp@5002a000 {
-			compatible = "st,stm32mp1-hdp";
-			reg = <0x5002a000 0x400>;
-			clocks = <&rcc HDP>;
-			clock-names = "hdp";
-			status = "disabled";
-		};
-
-		funnel: funnel@50091000 {
-			compatible = "arm,coresight-funnel", "arm,primecell";
-			reg = <0x50091000 0x1000>;
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				/* funnel input ports */
-				port@0 {
-					reg = <0>;
-					funnel_in_port0: endpoint {
-					  slave-mode;
-					  remote-endpoint = <&stm_out_port>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					funnel_in_port1: endpoint {
-					  slave-mode; /* A7-1 input */
-					  remote-endpoint = <&etm1_out_port>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-					funnel_in_port2: endpoint {
-					  slave-mode; /* A7-2 input */
-					  remote-endpoint = <&etm2_out_port>;
-					};
-				};
-
-				port@4 {
-					reg = <4>;
-					funnel_in_port4: endpoint {
-					  slave-mode; /* REPLICATOR input */
-					  remote-endpoint = <&replicator_out_port0>;
-					};
-				};
-
-				port@5 {
-					reg = <0>;
-					funnel_out_port0: endpoint {
-					  remote-endpoint = <&etf_in_port>;
-					};
-				};
-			};
-		};
-
-		etf: etf@50092000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x50092000 0x1000>;
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					etf_in_port: endpoint {
-						slave-mode;
-						remote-endpoint = <&funnel_out_port0>;
-					};
-				};
-
-				port@1 {
-					reg = <0>;
-					etf_out_port: endpoint {
-						remote-endpoint = <&tpiu_in_port>;
-					};
-				};
-			};
-		};
-
-		tpiu: tpiu@50093000 {
-			compatible = "arm,coresight-tpiu", "arm,primecell";
-			reg = <0x50093000 0x1000>;
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-
-			port {
-				tpiu_in_port: endpoint {
-					slave-mode;
-					remote-endpoint = <&etf_out_port>;
-				};
-			};
-		};
-
-		stm: stm@500a0000 {
-			compatible = "arm,coresight-stm", "arm,primecell";
-			reg = <0x500a0000 0x1000>, <0x90000000 0x1000000>,
-			      <0x50094000 0x1000>;
-			reg-names = "stm-base", "stm-stimulus-base", "cti-base";
-
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					stm_out_port: endpoint {
-						remote-endpoint = <&funnel_in_port0>;
-					};
-				};
-			};
-		};
-
-		/* Cortex A7-1 */
-		etm1: etm@500dc000 {
-			compatible = "arm,coresight-etm3x", "arm,primecell";
-			reg = <0x500dc000 0x1000>;
-			cpu = <&cpu0>;
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-			port {
-				etm1_out_port: endpoint {
-					remote-endpoint = <&funnel_in_port1>;
-				};
-			};
-		};
-
-		/* Cortex A7-2 */
-		etm2: etm@500dd000 {
-			compatible = "arm,coresight-etm3x", "arm,primecell";
-			reg = <0x500dd000 0x1000>;
-			cpu = <&cpu1>;
-			clocks = <&rcc CK_TRACE>;
-			clock-names = "apb_pclk";
-
-			port {
-				etm2_out_port: endpoint {
-					remote-endpoint = <&funnel_in_port2>;
-				};
-			};
-		};
-
-		cryp1: cryp@54001000 {
-			compatible = "st,stm32mp1-cryp";
-			reg = <0x54001000 0x400>;
-			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc CRYP1>;
-			resets = <&rcc CRYP1_R>;
-			status = "disabled";
-		};
-
-		hash1: hash@54002000 {
-			compatible = "st,stm32f756-hash";
-			reg = <0x54002000 0x400>;
-			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc HASH1>;
-			resets = <&rcc HASH1_R>;
-			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0 0x0>;
-			dma-names = "in";
-			dma-maxburst = <2>;
-			status = "disabled";
-		};
-
-		rng1: rng@54003000 {
-			compatible = "st,stm32-rng";
-			reg = <0x54003000 0x400>;
-			clocks = <&rcc RNG1_K>;
-			resets = <&rcc RNG1_R>;
-			status = "disabled";
-		};
-
-		mdma1: dma@58000000 {
-			compatible = "st,stm32h7-mdma";
-			reg = <0x58000000 0x1000>;
-			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc MDMA>;
-			resets = <&rcc MDMA_R>;
-			#dma-cells = <6>;
-			dma-channels = <32>;
-			dma-requests = <48>;
-		};
-
-		fmc: nand-controller@58002000 {
-			compatible = "st,stm32mp15-fmc2";
-			reg = <0x58002000 0x1000>,
-			      <0x80000000 0x1000>,
-			      <0x88010000 0x1000>,
-			      <0x88020000 0x1000>,
-			      <0x81000000 0x1000>,
-			      <0x89010000 0x1000>,
-			      <0x89020000 0x1000>;
-			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 20 0x2 0x12000A02 0x0 0x0 0>,
-			       <&mdma1 20 0x2 0x12000A08 0x0 0x0 0>,
-			       <&mdma1 21 0x2 0x12000A0A 0x0 0x0 0>;
-			dma-names = "tx", "rx", "ecc";
-			clocks = <&rcc FMC_K>;
-			resets = <&rcc FMC_R>;
-			status = "disabled";
-		};
-
-		qspi: spi@58003000 {
-			compatible = "st,stm32f469-qspi";
-			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
-			reg-names = "qspi", "qspi_mm";
-			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0 0x0>,
-			       <&mdma1 22 0x2 0x100008 0x0 0x0 0x0>;
-			dma-names = "tx", "rx";
-			clocks = <&rcc QSPI_K>;
-			resets = <&rcc QSPI_R>;
-			status = "disabled";
-		};
-
-		sdmmc1: sdmmc@58005000 {
-			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00253180>;
-			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
-			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
-			clocks = <&rcc SDMMC1_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC1_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <120000000>;
-			status = "disabled";
-		};
-
-		sdmmc2: sdmmc@58007000 {
-			compatible = "arm,pl18x", "arm,primecell";
-			arm,primecell-periphid = <0x00253180>;
-			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
-			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "cmd_irq";
-			clocks = <&rcc SDMMC2_K>;
-			clock-names = "apb_pclk";
-			resets = <&rcc SDMMC2_R>;
-			cap-sd-highspeed;
-			cap-mmc-highspeed;
-			max-frequency = <120000000>;
-			status = "disabled";
-		};
-
-		crc1: crc@58009000 {
-			compatible = "st,stm32f7-crc";
-			reg = <0x58009000 0x400>;
-			clocks = <&rcc CRC1>;
-			status = "disabled";
-		};
-
-		stmmac_axi_config_0: stmmac-axi-config {
-			snps,wr_osr_lmt = <0x7>;
-			snps,rd_osr_lmt = <0x7>;
-			snps,blen = <0 0 0 0 16 8 4>;
-		};
-
-		ethernet0: ethernet@5800a000 {
-			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
-			reg = <0x5800a000 0x2000>;
-			reg-names = "stmmaceth";
-			interrupts-extended = <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 70 1>;
-			interrupt-names = "macirq",
-					  "eth_wake_irq",
-					  "stm32_pwr_wakeup";
-			clock-names = "stmmaceth",
-				      "mac-clk-tx",
-				      "mac-clk-rx",
-				      "eth-ck",    //custom
-				      "syscfg-clk", //custom
-				      "ethstp";
-			clocks = <&rcc ETHMAC>,
-				 <&rcc ETHTX>,
-				 <&rcc ETHRX>,
-				 <&rcc ETHCK_K>, //custom
-				 <&rcc SYSCFG>,  //custom
-				 <&rcc ETHSTP>;
-			st,syscon = <&syscfg 0x4>;
-			snps,mixed-burst;
-			snps,pbl = <2>;
-			snps,en-tx-lpi-clockgating;
-			snps,axi-config = <&stmmac_axi_config_0>;
-			snps,tso;
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		usbh_ohci: usbh-ohci@5800c000 {
-			compatible = "generic-ohci";
-			reg = <0x5800c000 0x1000>;
-			clocks = <&rcc USBH>;
-			resets = <&rcc USBH_R>;
-			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-		};
-
-		usbh_ehci: usbh-ehci@5800d000 {
-			compatible = "generic-ehci";
-			reg = <0x5800d000 0x1000>;
-			clocks = <&rcc USBH>;
-			resets = <&rcc USBH_R>;
-			interrupts-extended = <&intc GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 43 1>;
-			interrupt-names = "event", "wakeup";
-			companion = <&usbh_ohci>;
-			power-domains = <&pd_core>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		gpu: gpu@59000000 {
-			compatible = "vivante,gc";
-			reg = <0x59000000 0x800>;
-			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc GPU>, <&rcc GPU_K>;
-			clock-names = "bus" ,"core";
-			resets = <&rcc GPU_R>;
-			status = "disabled";
-		};
-
-		dsi: dsi@5a000000 {
-			compatible = "st,stm32-dsi";
-			reg = <0x5a000000 0x800>;
-			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
-			clock-names = "pclk", "ref", "px_clk";
-			resets = <&rcc DSI_R>;
-			reset-names = "apb";
-			phy-dsi-supply = <&reg18>;
-			status = "disabled";
-		};
-
-		ltdc: display-controller@5a001000 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x5a001000 0x400>;
-			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc LTDC_PX>;
-			clock-names = "lcd";
-			resets = <&rcc LTDC_R>;
-			status = "disabled";
-		};
-
-		iwdg2: watchdog@5a002000 {
-			compatible = "st,stm32mp1-iwdg";
-			reg = <0x5a002000 0x400>;
-			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
-			clock-names = "pclk", "lsi";
-			status = "disabled";
-		};
-
-		usbphyc: usbphyc@5a006000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			#clock-cells = <0>;
-			compatible = "st,stm32mp1-usbphyc";
-			reg = <0x5a006000 0x1000>;
-			clocks = <&rcc USBPHY_K>;
-			resets = <&rcc USBPHY_R>;
-			vdda1v1-supply = <&reg11>;
-			vdda1v8-supply = <&reg18>;
-			status = "disabled";
-
-			usbphyc_port0: usb-phy@0 {
-				#phy-cells = <0>;
-				reg = <0>;
-			};
-
-			usbphyc_port1: usb-phy@1 {
-				#phy-cells = <1>;
-				reg = <1>;
-			};
-		};
-
-		ddrperfm: perf@5a007000 {
-			compatible = "st,stm32-ddr-pmu";
-			reg = <0x5a007000 0x400>;
-			clocks = <&rcc DDRPERFM>, <&rcc PLL2_R>;
-			clock-names = "bus", "ddr";
-			resets = <&rcc DDRPERFM_R>;
-			status = "okay";
-		};
-
-		usart1: serial@5c000000 {
-			compatible = "st,stm32h7-uart";
-			reg = <0x5c000000 0x400>;
-			interrupt-names = "event", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 26 1>;
-			clocks = <&rcc USART1_K>;
-			resets = <&rcc USART1_R>;
-			wakeup-source;
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		spi6: spi@5c001000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "st,stm32h7-spi";
-			reg = <0x5c001000 0x400>;
-			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&rcc SPI6_K>;
-			resets = <&rcc SPI6_R>;
-			dmas = <&mdma1 34 0x0 0x40008 0x0 0x0 0x0>,
-			       <&mdma1 35 0x0 0x40002 0x0 0x0 0x0>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			status = "disabled";
-		};
-
-		i2c4: i2c@5c002000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x5c002000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 24 1>;
-			clocks = <&rcc I2C4_K>;
-			resets = <&rcc I2C4_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&mdma1 36 0x0 0x40008 0x0 0x0 0>,
-			       <&mdma1 37 0x0 0x40002 0x0 0x0 0>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x8>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x8>;
-			status = "disabled";
-		};
-
-		rtc: rtc@5c004000 {
-			compatible = "st,stm32mp1-rtc";
-			reg = <0x5c004000 0x400>;
-			clocks = <&rcc RTCAPB>, <&rcc RTC>;
-			clock-names = "pclk", "rtc_ck";
-			interrupts-extended = <&intc GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 19 1>;
-			status = "disabled";
-		};
-
-		bsec: nvmem@5c005000 {
-			compatible = "st,stm32mp15-bsec";
-			reg = <0x5c005000 0x400>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			part_number_otp: part_number_otp@4 {
-				reg = <0x4 0x1>;
-			};
-			ts_cal1: calib@5c {
-				reg = <0x5c 0x2>;
-			};
-			ts_cal2: calib@5e {
-				reg = <0x5e 0x2>;
-			};
-		};
-
-		i2c6: i2c@5c009000 {
-			compatible = "st,stm32f7-i2c";
-			reg = <0x5c009000 0x400>;
-			interrupt-names = "event", "error", "wakeup";
-			interrupts-extended = <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-					      <&exti 54 1>;
-			clocks = <&rcc I2C6_K>;
-			resets = <&rcc I2C6_R>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-			dmas = <&mdma1 38 0x0 0x40008 0x0 0x0 0>,
-			       <&mdma1 39 0x0 0x40002 0x0 0x0 0>;
-			dma-names = "rx", "tx";
-			power-domains = <&pd_core>;
-			st,syscfg-fmp = <&syscfg 0x4 0x20>;
-			st,syscfg-fmp-clr = <&syscfg 0x44 0x20>;
-			status = "disabled";
-		};
-
-		tamp: tamp@5c00a000 {
-			compatible = "simple-bus", "syscon", "simple-mfd";
-			reg = <0x5c00a000 0x400>;
-
-			reboot-mode {
-				compatible = "syscon-reboot-mode";
-				offset = <0x150>; /* reg20 */
-				mask = <0xff>;
-				mode-normal = <0>;
-				mode-fastboot = <0x1>;
-				mode-recovery = <0x2>;
-				mode-stm32cubeprogrammer = <0x3>;
-				mode-ums_mmc0 = <0x10>;
-				mode-ums_mmc1 = <0x11>;
-				mode-ums_mmc2 = <0x12>;
-			};
-		};
-	};
-
-	m4_rproc: m4@0 {
-		compatible = "st,stm32mp1-rproc";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		ranges = <0x00000000 0x38000000 0x10000>,
-			 <0x30000000 0x30000000 0x60000>,
-			 <0x10000000 0x10000000 0x60000>;
-		resets = <&rcc MCU_R>;
-		reset-names = "mcu_rst";
-		st,syscfg-pdds = <&pwr 0x014 0x1>;
-		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
-		st,syscfg-tz = <&rcc 0x000 0x1>;
-		st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
-		status = "disabled";
-
-		m4_system_resources {
-			compatible = "rproc-srm-core";
-			status = "disabled";
-		};
-	};
-
-	firmware {
-		optee {
-			compatible = "linaro,optee-tz";
-			method = "smc";
-		};
-	};
-};
diff --git a/board/octavo/osd32mp1-red/overlay/boot/extlinux/extlinux.conf b/board/octavo/osd32mp1-red/overlay/boot/extlinux/extlinux.conf
index c082c2462a..b3f16b2247 100644
--- a/board/octavo/osd32mp1-red/overlay/boot/extlinux/extlinux.conf
+++ b/board/octavo/osd32mp1-red/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label osd32mp1-red-buildroot
   kernel /boot/zImage
-  devicetree /boot/osd32mp1-red.dtb
+  devicetree /boot/stm32mp157c-osd32mp1-red.dtb
   append root=/dev/mmcblk1p4 rootwait
diff --git a/board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch b/board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
index aa83fde0d9..9b075139ee 100644
--- a/board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
+++ b/board/octavo/osd32mp1-red/patches/uboot/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
@@ -1,31 +1,167 @@
-From ad8ef01e630f1c60ac9fa22a1e05af61ce1c0569 Mon Sep 17 00:00:00 2001
-From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
-Date: Sun, 31 Jan 2021 21:03:30 -0600
+From 69029a32acdfac1499750f657c16ab3a3cbfa8f8 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Mon, 3 Oct 2022 12:17:37 +0200
 Subject: [PATCH 1/2] Add OSD32MP1-RED Device Tree support
 
-Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>
-[Kory: from https://github.com/octavosystems/osd32mp1-build-tools/tree/395ebd1f4832353c2bc66bbf3346b07d5243e44d/patches/u-boot-2018.11]
 Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
 ---
- arch/arm/dts/osd32mp1-red-u-boot.dtsi         |  242 +++
- arch/arm/dts/osd32mp1-red.dts                 | 1311 +++++++++++++++++
- ...m32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi |  119 ++
- arch/arm/dts/stm32mp157c.dtsi                 |    4 +
- 4 files changed, 1676 insertions(+)
- create mode 100644 arch/arm/dts/osd32mp1-red-u-boot.dtsi
- create mode 100644 arch/arm/dts/osd32mp1-red.dts
- create mode 100644 arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
+ arch/arm/dts/Makefile                         |    3 +-
+ .../dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi    |  119 ++
+ .../dts/stm32mp157c-osd32mp1-red-u-boot.dtsi  |  233 +++
+ arch/arm/dts/stm32mp157c-osd32mp1-red.dts     | 1445 +++++++++++++++++
+ 4 files changed, 1799 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-red-u-boot.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-red.dts
 
-diff --git a/arch/arm/dts/osd32mp1-red-u-boot.dtsi b/arch/arm/dts/osd32mp1-red-u-boot.dtsi
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 83677c3d4f..00b27c8695 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -959,7 +959,8 @@ dtb-$(CONFIG_STM32MP15x) += \
+ 	stm32mp157f-ed1.dtb \
+ 	stm32mp157f-ev1.dtb \
+ 	stm32mp15xx-dhcom-pdk2.dtb \
+-	stm32mp15xx-dhcor-avenger96.dtb
++	stm32mp15xx-dhcor-avenger96.dtb \
++	stm32mp157c-osd32mp1-red.dtb
+ 
+ dtb-$(CONFIG_SOC_K3_AM6) += k3-am654-base-board.dtb k3-am654-r5-base-board.dtb
+ dtb-$(CONFIG_SOC_K3_J721E) += k3-j721e-common-proc-board.dtb \
+diff --git a/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
 new file mode 100644
-index 0000000000..801b021145
+index 0000000000..362f3281b8
 --- /dev/null
-+++ b/arch/arm/dts/osd32mp1-red-u-boot.dtsi
-@@ -0,0 +1,242 @@
++++ b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+@@ -0,0 +1,119 @@
++/*
++ * Copyright (C) 2015-2018, STMicroelectronics - All Rights Reserved
++ *
++ * SPDX-License-Identifier:	GPL-2.0+	BSD-3-Clause
++ *
++ */
++
++/*
++ * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
++ * DDR type: DDR3 / DDR3L
++ * DDR width: 16bits
++ * DDR density: 4Gb
++ * System frequency: 533000Khz
++ * Relaxed Timing Mode: false
++ * Address mapping type: RBC
++ *
++ * Save Date: 2020.08.20, save Time: 10:57:25
++ */
++
++#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
++#define DDR_MEM_SPEED	533000
++#define DDR_MEM_SIZE	0x20000000
++
++#define DDR_MSTR 0x00041401
++#define DDR_MRCTRL0 0x00000010
++#define DDR_MRCTRL1 0x00000000
++#define DDR_DERATEEN 0x00000000
++#define DDR_DERATEINT 0x00800000
++#define DDR_PWRCTL 0x00000000
++#define DDR_PWRTMG 0x00400010
++#define DDR_HWLPCTL 0x00000000
++#define DDR_RFSHCTL0 0x00210000
++#define DDR_RFSHCTL3 0x00000000
++#define DDR_RFSHTMG 0x0081008B
++#define DDR_CRCPARCTL0 0x00000000
++#define DDR_DRAMTMG0 0x121B2414
++#define DDR_DRAMTMG1 0x000A041C
++#define DDR_DRAMTMG2 0x0608090F
++#define DDR_DRAMTMG3 0x0050400C
++#define DDR_DRAMTMG4 0x08040608
++#define DDR_DRAMTMG5 0x06060403
++#define DDR_DRAMTMG6 0x02020002
++#define DDR_DRAMTMG7 0x00000202
++#define DDR_DRAMTMG8 0x00001005
++#define DDR_DRAMTMG14 0x000000A0
++#define DDR_ZQCTL0 0xC2000040
++#define DDR_DFITMG0 0x02060105
++#define DDR_DFITMG1 0x00000202
++#define DDR_DFILPCFG0 0x07000000
++#define DDR_DFIUPD0 0xC0400003
++#define DDR_DFIUPD1 0x00000000
++#define DDR_DFIUPD2 0x00000000
++#define DDR_DFIPHYMSTR 0x00000000
++#define DDR_ODTCFG 0x06000600
++#define DDR_ODTMAP 0x00000001
++#define DDR_SCHED 0x00000C01
++#define DDR_SCHED1 0x00000000
++#define DDR_PERFHPR1 0x01000001
++#define DDR_PERFLPR1 0x08000200
++#define DDR_PERFWR1 0x08000400
++#define DDR_DBG0 0x00000000
++#define DDR_DBG1 0x00000000
++#define DDR_DBGCMD 0x00000000
++#define DDR_POISONCFG 0x00000000
++#define DDR_PCCFG 0x00000010
++#define DDR_PCFGR_0 0x00010000
++#define DDR_PCFGW_0 0x00000000
++#define DDR_PCFGQOS0_0 0x02100C03
++#define DDR_PCFGQOS1_0 0x00800100
++#define DDR_PCFGWQOS0_0 0x01100C03
++#define DDR_PCFGWQOS1_0 0x01000200
++#define DDR_PCFGR_1 0x00010000
++#define DDR_PCFGW_1 0x00000000
++#define DDR_PCFGQOS0_1 0x02100C03
++#define DDR_PCFGQOS1_1 0x00800040
++#define DDR_PCFGWQOS0_1 0x01100C03
++#define DDR_PCFGWQOS1_1 0x01000200
++#define DDR_ADDRMAP1 0x00070707
++#define DDR_ADDRMAP2 0x00000000
++#define DDR_ADDRMAP3 0x1F000000
++#define DDR_ADDRMAP4 0x00001F1F
++#define DDR_ADDRMAP5 0x06060606
++#define DDR_ADDRMAP6 0x0F060606
++#define DDR_ADDRMAP9 0x00000000
++#define DDR_ADDRMAP10 0x00000000
++#define DDR_ADDRMAP11 0x00000000
++#define DDR_PGCR 0x01442E02
++#define DDR_PTR0 0x0022AA5B
++#define DDR_PTR1 0x04841104
++#define DDR_PTR2 0x042DA068
++#define DDR_ACIOCR 0x10400812
++#define DDR_DXCCR 0x00000C40
++#define DDR_DSGCR 0xF200011F
++#define DDR_DCR 0x0000000B
++#define DDR_DTPR0 0x38D488D0
++#define DDR_DTPR1 0x098B00D8
++#define DDR_DTPR2 0x10023600
++#define DDR_MR0 0x00000840
++#define DDR_MR1 0x00000000
++#define DDR_MR2 0x00000208
++#define DDR_MR3 0x00000000
++#define DDR_ODTCR 0x00010000
++#define DDR_ZQ0CR1 0x00000038
++#define DDR_DX0GCR 0x0000CE81
++#define DDR_DX0DLLCR 0x40000000
++#define DDR_DX0DQTR 0xFFFFFFFF
++#define DDR_DX0DQSTR 0x3DB02000
++#define DDR_DX1GCR 0x0000CE81
++#define DDR_DX1DLLCR 0x40000000
++#define DDR_DX1DQTR 0xFFFFFFFF
++#define DDR_DX1DQSTR 0x3DB02000
++#define DDR_DX2GCR 0x0000CE80
++#define DDR_DX2DLLCR 0x40000000
++#define DDR_DX2DQTR 0xFFFFFFFF
++#define DDR_DX2DQSTR 0x3DB02000
++#define DDR_DX3GCR 0x0000CE80
++#define DDR_DX3DLLCR 0x40000000
++#define DDR_DX3DQTR 0xFFFFFFFF
++#define DDR_DX3DQSTR 0x3DB02000
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-red-u-boot.dtsi b/arch/arm/dts/stm32mp157c-osd32mp1-red-u-boot.dtsi
+new file mode 100644
+index 0000000000..6da91e0bb8
+--- /dev/null
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-red-u-boot.dtsi
+@@ -0,0 +1,233 @@
 +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause*/
 +/*
-+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
-+ * Author: STM32CubeMX code generation for STMicroelectronics.
++ * Copyright (C) 2020, Octavo Systems LLC - All Rights Reserved
 + */
 +
 +/* For more information on Device Tree configuration, please refer to
@@ -33,29 +169,46 @@ index 0000000000..801b021145
 + */
 +
 +#include <dt-bindings/clock/stm32mp1-clksrc.h>
-+#include "stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi"
-+
-+#include "stm32mp157-u-boot.dtsi"
++#include "stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi"
++#include "stm32mp15-u-boot.dtsi"
 +#include "stm32mp15-ddr.dtsi"
 +
 +
-+
-+
 +/ {
 +
-+
-+	aliases {
-+		i2c3 = &i2c4;
-+		mmc0 = &sdmmc1;					//orig
-+		//mmc0 = &sdmmc2;						//custom
++	aliases{
++		i2c0 = &i2c4;
++		mmc0 = &sdmmc1;
++		usb0 = &usbotg_hs;
 +	};
-+	config {
++
++	config{
 +		u-boot,boot-led = "heartbeat";
 +		u-boot,error-led = "error";
-+		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
-+		//st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;	//custom
-+		//st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;	//custom
++		u-boot,mmc-env-partition = "fip";
 +	};
++
++#ifdef CONFIG_STM32MP15x_STM32IMAGE
++	config {
++		u-boot,mmc-env-partition = "ssbl";
++	};
++
++	/* only needed for boot with TF-A, witout FIP support */
++	firmware {
++		optee {
++			compatible = "linaro,optee-tz";
++			method = "smc";
++		};
++	};
++
++	reserved-memory {
++		optee@de000000 {
++			reg = <0xde000000 0x02000000>;
++			no-map;
++		};
++	};
++#endif
++
 +	led {
 +		red {
 +			label = "error";
@@ -68,54 +221,24 @@ index 0000000000..801b021145
 +			default-state = "on";
 +		};
 +	};
++}; /*root*/
 +
++#ifndef CONFIG_TFABOOT
 +
-+	clocks {
-+		u-boot,dm-pre-reloc;
-+
-+
-+
-+
-+		clk_lsi: clk-lsi {
-+			u-boot,dm-pre-reloc;
-+
-+
-+
-+		};
-+
-+		clk_hsi: clk-hsi {
-+			u-boot,dm-pre-reloc;
-+
-+
-+
-+		};
-+
-+		clk_csi: clk-csi {
-+			u-boot,dm-pre-reloc;
-+			status = "disabled";
-+
-+
-+
-+		};
-+
-+		clk_lse: clk-lse {
-+			u-boot,dm-pre-reloc;
-+			st,drive = < LSEDRV_MEDIUM_HIGH >;
-+
-+
-+
-+		};
++&i2s2{
++	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
++};
 +
-+		clk_hse: clk-hse {
-+			u-boot,dm-pre-reloc;
-+			st,digbypass;
 +
 +
++&sai2{
++	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
++};
 +
-+		};
-+	};
 +
-+}; /*root*/
++&clk_hse {
++	st,digbypass;
++};
 +
 +&rcc {
 +	u-boot,dm-pre-reloc;
@@ -144,29 +267,30 @@ index 0000000000..801b021145
 +		0 		/*MCO2*/
 +	>;
 +	st,pkcs = <
-+		CLK_CKPER_DISABLED
++		CLK_CKPER_HSE
 +		CLK_ETH_PLL3Q
 +		CLK_SDMMC12_PLL4P
 +		CLK_DSI_DSIPLL
 +		CLK_STGEN_HSE
-+		CLK_USBPHY_DISABLED
-+		CLK_SPI2S1_DISABLED
-+		CLK_SPI2S23_PLL3Q
-+		CLK_SPI45_DISABLED
++		CLK_USBPHY_HSE
++		CLK_SPI2S1_PLL3Q
++		CLK_SPI2S23_CKPER
++		CLK_SPI45_PCLK2
 +		CLK_SPI6_DISABLED
 +		CLK_I2C46_HSI
 +		CLK_SDMMC3_PLL4P
-+		CLK_ADC_DISABLED
-+		CLK_CEC_DISABLED
++                CLK_USBO_USBPHY
++		CLK_ADC_CKPER
++		CLK_CEC_LSE
 +		CLK_I2C12_HSI
-+		CLK_I2C35_DISABLED
++		CLK_I2C35_HSI
 +		CLK_UART1_DISABLED
 +		CLK_UART24_HSI
-+		CLK_UART35_DISABLED
++		CLK_UART35_HSI
 +		CLK_UART6_DISABLED
 +		CLK_UART78_DISABLED
 +		CLK_SPDIF_DISABLED
-+		CLK_SAI2_CKPER
++		CLK_SAI1_DISABLED
 +		CLK_SAI2_DISABLED
 +		CLK_SAI3_DISABLED
 +		CLK_SAI4_DISABLED
@@ -198,112 +322,119 @@ index 0000000000..801b021145
 +
 +&i2c4{
 +	u-boot,dm-pre-reloc;
-+
-+
-+
 +};
 +
-+&rcc{
++&i2c4_pins_z_mx {
 +	u-boot,dm-pre-reloc;
-+
-+
-+
++	pins {
++		u-boot,dm-pre-reloc;
++	};
 +};
 +
 +&sdmmc1{
 +	u-boot,dm-pre-reloc;
-+
-+
-+
 +};
 +
 +&sdmmc2{
 +	u-boot,dm-pre-reloc;
++};
 +
-+
-+
++&sdmmc1_pins_mx {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
 +};
 +
-+&sdmmc3{
-+	u-boot,dm-pre-reloc;
++&sdmmc2_pins_mx {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
++};
 +
++#endif	/*CONFIG_TFABOOT*/
 +
++&cryp1{
++	u-boot,dm-pre-reloc;
++};
 +
++&hash1{
++	u-boot,dm-pre-reloc;
 +};
 +
 +&uart4{
 +	u-boot,dm-pre-reloc;
-+
-+
-+
 +};
 +
-+
-+&pmic {
++&usbotg_hs{
 +	u-boot,dm-pre-reloc;
++	u-boot,force-b-session-valid;
++	hnp-srp-disable;
++	dr_mode = "peripheral";
 +};
 +
-+&v3v3 {
-+	regulator-always-on;
++&usbphyc{
++	u-boot,dm-pre-reloc;
 +};
 +
-+&uart4_pins_mx {
++&usbphyc_port0{
 +	u-boot,dm-pre-reloc;
-+	pins1 {
-+		u-boot,dm-pre-reloc;
-+		/* pull-up on rx to avoid floating level */
-+		bias-pull-up;
-+	};
-+	pins2 {
-+		u-boot,dm-pre-reloc;
-+	};
 +};
 +
-+&adc {
-+	status = "okay";
++&usbphyc_port1{
++	u-boot,dm-pre-reloc;
 +};
 +
-+
-diff --git a/arch/arm/dts/osd32mp1-red.dts b/arch/arm/dts/osd32mp1-red.dts
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-red.dts b/arch/arm/dts/stm32mp157c-osd32mp1-red.dts
 new file mode 100644
-index 0000000000..2cc1961d08
+index 0000000000..6104aff03d
 --- /dev/null
-+++ b/arch/arm/dts/osd32mp1-red.dts
-@@ -0,0 +1,1311 @@
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-red.dts
+@@ -0,0 +1,1445 @@
 +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
 +/*
-+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
-+ * Author: STM32CubeMX code generation for STMicroelectronics.
-+ */
-+
-+/* For more information on Device Tree configuration, please refer to
-+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
++ * Copyright (C) Octavo Systems 2021 - All Rights Reserved
++ * Author: Neeraj Dantu <dantuguf14105@gmail.com> for Octavo Systems
 + */
 +
 +/dts-v1/;
-+#include "stm32mp157c.dtsi"
-+#include "stm32mp157cac-pinctrl.dtsi"
-+#include "stm32mp157c-m4-srm.dtsi"
-+
 +
-+#include <dt-bindings/input/input.h>
++#include <dt-bindings/pinctrl/stm32-pinfunc.h>
++#include "stm32mp157.dtsi"
++#include "stm32mp15xc.dtsi"
++#include "stm32mp15xxac-pinctrl.dtsi"
++#include "stm32mp15-m4-srm.dtsi"
 +#include <dt-bindings/mfd/st,stpmic1.h>
++#include <dt-bindings/gpio/gpio.h>
 +#include <dt-bindings/rtc/rtc-stm32.h>
 +
-+
 +/ {
-+	model = "Octavo OSD32MP1-RED board";
-+	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
++	model = "Octavo OSD32MP1 RED board";
++	compatible = "st,stm32mp157c-osd32mp1-red", "st,stm32mp157";
 +
 +	memory@c0000000 {
++		device_type = "memory";
 +		reg = <0xc0000000 0x20000000>;
++	};
 +
-+
-+    wifi_pwrseq: wifi-pwrseq {
-+  		compatible = "mmc-pwrseq-simple";
-+  		reset-gpios = <&gpiog 5 GPIO_ACTIVE_LOW>;     //custom
++	wifi_pwrseq: wifi-pwrseq {
++		compatible = "mmc-pwrseq-simple";
++		reset-gpios = <&gpiog 5 GPIO_ACTIVE_LOW>;
 +  	};
 +
++	clocks {
++		clk_ext_camera: clk-ext-camera {
++			#clock-cells = <0>;
++			compatible = "fixed-clock";
++			clock-frequency = <24000000>;
++		};
 +	};
 +
 +	reserved-memory {
@@ -311,46 +442,43 @@ index 0000000000..2cc1961d08
 +		#size-cells = <1>;
 +		ranges;
 +
-+
-+
-+		retram: retram@0x38000000 {
++		mcuram2:mcuram2@10000000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x38000000 0x10000>;
++			reg = <0x10000000 0x40000>;
 +			no-map;
 +		};
 +
-+		mcuram: mcuram@0x30000000 {
++		vdev0vring0:vdev0vring0@10040000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x30000000 0x40000>;
++			reg = <0x10040000 0x1000>;
 +			no-map;
 +		};
 +
-+		mcuram2: mcuram2@0x10000000 {
++		vdev0vring1:vdev0vring1@10041000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x10000000 0x40000>;
++			reg = <0x10041000 0x1000>;
 +			no-map;
 +		};
 +
-+		vdev0vring0: vdev0vring0@10040000 {
++		vdev0buffer:vdev0buffer@10042000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x10040000 0x2000>;
++			reg = <0x10042000 0x4000>;
 +			no-map;
 +		};
 +
-+		vdev0vring1: vdev0vring1@10042000 {
++		mcuram:mcuram@30000000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x10042000 0x2000>;
++			reg = <0x30000000 0x40000>;
 +			no-map;
 +		};
 +
-+		vdev0buffer: vdev0buffer@10044000 {
++		retram:retram@38000000{
 +			compatible = "shared-dma-pool";
-+			reg = <0x10044000 0x4000>;
++			reg = <0x38000000 0x10000>;
 +			no-map;
 +		};
 +
-+
-+		gpu_reserved: gpu@d4000000 {
++		gpu_reserved:gpu@d4000000{
 +			reg = <0xd4000000 0x4000000>;
 +			no-map;
 +		};
@@ -369,19 +497,6 @@ index 0000000000..2cc1961d08
 +		stdout-path = "serial0:115200n8";
 +	};
 +
-+	sram: sram@10050000 {
-+		compatible = "mmio-sram";
-+		reg = <0x10050000 0x10000>;
-+		#address-cells = <1>;
-+		#size-cells = <1>;
-+		ranges = <0 0x10050000 0x10000>;
-+
-+		dma_pool: dma_pool@0 {
-+			reg = <0x0 0x10000>;
-+			pool;
-+		};
-+	};
-+
 +	led {
 +		compatible = "gpio-leds";
 +		blue {
@@ -390,25 +505,9 @@ index 0000000000..2cc1961d08
 +			linux,default-trigger = "heartbeat";
 +			default-state = "off";
 +		};
-+
-+    //custom_gpios{                             //custom
-+    //gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
-+    //default-state = "on";
-+    //};
 +	};
 +
-+	/*sound {
-+		compatible = "audio-graph-card";
-+		label = "STM32MP1-DK";
-+		routing =
-+			"Playback" , "MCLK",
-+			"Capture" , "MCLK",
-+			"MICL" , "Mic Bias";
-+		dais = <&sai2a_port &sai2b_port &i2s2_port>;
-+		status = "okay";
-+	}; */
-+
-+	usb_phy_tuning: usb-phy-tuning {
++	usb_phy_tuning:usb-phy-tuning{
 +		st,hs-dc-level = <2>;
 +		st,fs-rftime-tuning;
 +		st,hs-rftime-reduction;
@@ -419,43 +518,28 @@ index 0000000000..2cc1961d08
 +		st,no-lsfs-sc;
 +	};
 +
-+
-+
-+	clocks {
-+
-+    clk_ext_camera: clk-ext-camera {
-+			#clock-cells = <0>;
-+			compatible = "fixed-clock";
-+			clock-frequency = <24000000>;
-+		};
-+
-+
-+		clk_lsi: clk-lsi {
-+			clock-frequency = <32000>;
-+		};
-+
-+		clk_hsi: clk-hsi {
-+			clock-frequency = <64000000>;
-+		};
-+
-+		clk_csi: clk-csi {
-+			clock-frequency = <4000000>;
-+		};
-+
-+		clk_lse: clk-lse {
-+			clock-frequency = <32768>;
-+		};
-+
-+		clk_hse: clk-hse {
-+			clock-frequency = <24000000>;
-+		};
++	vin:vin{
++		compatible = "regulator-fixed";
++		regulator-name = "vin";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		regulator-always-on;
 +	};
 +
-+}; /*root*/
++	sound {
++		compatible = "audio-graph-card";
++		label = "STM32MP15-DK";
++		routing =
++			"Playback" , "MCLK",
++			"Capture" , "MCLK",
++			"MICL" , "Mic Bias";
++		dais = <&i2s2_port>;
++		status = "okay";
++	};
++};
 +
 +&pinctrl {
 +	u-boot,dm-pre-reloc;
-+
 +	dcmi_pins_mx: dcmi_mx-0 {
 +		pins {
 +			pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
@@ -578,6 +662,23 @@ index 0000000000..2cc1961d08
 +		};
 +	};
 +
++	i2c5_pins_mx: i2c5_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
++					 <STM32_PINMUX('A', 12, AF4)>; /* I2C5_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c5_sleep_pins_mx: i2c5_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
++					 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
++		};
++	};
++
 +	i2s2_pins_mx: i2s2_mx-0 {
 +		pins {
 +			pinmux = <STM32_PINMUX('B', 12, AF5)>, /* I2S2_WS */
@@ -689,7 +790,7 @@ index 0000000000..2cc1961d08
 +			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
 +			bias-disable;
 +			drive-push-pull;
-+			slew-rate = <3>;
++			slew-rate = <2>;
 +		};
 +	};
 +
@@ -710,7 +811,7 @@ index 0000000000..2cc1961d08
 +			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
 +			bias-disable;
 +			drive-push-pull;
-+			slew-rate = <3>;
++			slew-rate = <2>;
 +		};
 +		pins3 {
 +			u-boot,dm-pre-reloc;
@@ -872,6 +973,40 @@ index 0000000000..2cc1961d08
 +		};
 +	};
 +
++	spi5_pins_mx: spi5_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('F', 7, AF5)>, /* SPI5_SCK */
++					 <STM32_PINMUX('F', 8, AF5)>, /* SPI5_MISO */
++					 <STM32_PINMUX('F', 9, AF5)>; /* SPI5_MOSI */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++	};
++
++	spi5_sleep_pins_mx: spi5_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* SPI5_SCK */
++					 <STM32_PINMUX('F', 8, ANALOG)>, /* SPI5_MISO */
++					 <STM32_PINMUX('F', 9, ANALOG)>; /* SPI5_MOSI */
++		};
++	};
++
++	tim5_pwm_pins_mx: tim5_pwm_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 11, AF2)>; /* TIM5_CH2 */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	tim5_pwm_sleep_pins_mx: tim5_pwm_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 11, ANALOG)>; /* TIM5_CH2 */
++		};
++	};
++
 +	uart4_pins_mx: uart4_mx-0 {
 +		u-boot,dm-pre-reloc;
 +		pins1 {
@@ -921,7 +1056,47 @@ index 0000000000..2cc1961d08
 +		};
 +	};
 +
++	cec_pins_mx: cec-1 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 6, AF5)>;
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
 +
++	cec_sleep_pins_mx: cec-sleep-1 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 6, ANALOG)>; /* HDMI_CEC */
++		};
++	};
++
++	stusb1600_pins_mx: stusb1600-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
++			bias-pull-up;
++		};
++	};
++
++	m_can1_pins_mx: m_can1_sleep_mx-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('D', 1, AF9)>; /* CAN1_TX */
++			slew-rate = <0>;
++			drive-push-pull;
++			bias-disable;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
++			bias-disable;
++		};
++	};
++
++	m_can1_sleep_pins_mx: m_can1_sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* CAN1_TX */
++				 <STM32_PINMUX('D', 0, ANALOG)>; /* CAN1_RX */
++		};
++	};
 +
 +};
 +
@@ -963,31 +1138,17 @@ index 0000000000..2cc1961d08
 +					 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
 +		};
 +	};
-+
-+
-+
 +};
 +
 +&m4_rproc{
-+	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
-+	mboxes = <&ipcc 2>;
-+	mbox-names = "shutdown";
-+	recovery;
-+	status = "okay";
-+
-+
++	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++			<&vdev0vring1>, <&vdev0buffer>;
++	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
++	mbox-names = "vq0", "vq1", "shutdown";
 +	interrupt-parent = <&exti>;
 +	interrupts = <68 1>;
-+	interrupt-names = "wdg";
 +	wakeup-source;
-+
-+};
-+
-+&bsec{
 +	status = "okay";
-+
-+
-+
 +};
 +
 +&dcmi{
@@ -996,9 +1157,7 @@ index 0000000000..2cc1961d08
 +	pinctrl-1 = <&dcmi_sleep_pins_mx>;
 +	status = "okay";
 +
-+
-+
-+  port {
++	port {
 +		dcmi_0: endpoint {
 +			remote-endpoint = <&ov5640_0>;
 +			bus-width = <8>;
@@ -1008,23 +1167,12 @@ index 0000000000..2cc1961d08
 +			pclk-max-frequency = <77000000>;
 +		};
 +	};
-+
-+
 +};
 +
 +&dsi{
 +	status = "okay";
 +
-+
-+
-+  #address-cells = <1>;
-+	#size-cells = <0>;
-+	status = "okay";
-+
 +	ports {
-+		#address-cells = <1>;
-+		#size-cells = <0>;
-+
 +		port@0 {
 +			reg = <0>;
 +			dsi_in: endpoint {
@@ -1040,7 +1188,7 @@ index 0000000000..2cc1961d08
 +		};
 +	};
 +
-+	panel@0 {
++	panel_otm8009a: panel-otm8009a@0 {
 +		compatible = "orisetech,otm8009a";
 +		reg = <0>;
 +		reset-gpios = <&gpioe 9 GPIO_ACTIVE_LOW>;
@@ -1053,8 +1201,6 @@ index 0000000000..2cc1961d08
 +			};
 +		};
 +	};
-+
-+
 +};
 +
 +&ethernet0{
@@ -1064,36 +1210,39 @@ index 0000000000..2cc1961d08
 +	status = "okay";
 +
 +
-+  st,eth_clk_sel = <1>;  //custom
-+  phy-mode = "rgmii-id";
++	st,eth-clk-sel;  //custom
++	phy-mode = "rgmii-id";
 +	max-speed = <1000>;
 +	phy-handle = <&phy0>;
++	nvmem-cells = <&ethernet_mac_address>;
++	nvmem-cell-names = "mac-address";
 +
 +	mdio0 {
 +		#address-cells = <1>;
 +		#size-cells = <0>;
 +		compatible = "snps,dwmac-mdio";
 +		phy0: ethernet-phy@0 {
-+			reg = <0>;
++			reg = <3>;
 +		};
 +	};
-+
-+
 +};
 +
 +&gpu{
 +	status = "okay";
-+
-+
 +	contiguous-area = <&gpu_reserved>;
++};
 +
++&hash1 {
++	status = "okay";
 +};
 +
 +&hsem{
 +	status = "okay";
++};
 +
-+
-+
++&cryp1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
 +};
 +
 +&i2c1{
@@ -1101,16 +1250,11 @@ index 0000000000..2cc1961d08
 +	pinctrl-0 = <&i2c1_pins_mx>;
 +	pinctrl-1 = <&i2c1_sleep_pins_mx>;
 +	status = "okay";
-+
-+
-+
-+  i2c-scl-rising-time-ns = <100>;
++	i2c-scl-rising-time-ns = <100>;
 +	i2c-scl-falling-time-ns = <7>;
-+
 +	/delete-property/dmas;
 +	/delete-property/dma-names;
 +
-+
 +	touchscreen@2a {
 +		compatible = "focaltech,ft6236";
 +		reg = <0x2a>;
@@ -1119,20 +1263,53 @@ index 0000000000..2cc1961d08
 +		interrupt-controller;
 +		touchscreen-size-x = <480>;
 +		touchscreen-size-y = <800>;
++		panel = <&panel_otm8009a>;
++		vcc-supply = <&v3v3>;
 +		status = "okay";
 +	};
 +	touchscreen@38 {
-+		compatible = "focaltech,ft6336";
++		compatible = "focaltech,ft6236";
 +		reg = <0x38>;
 +		interrupts = <2 2>;
 +		interrupt-parent = <&gpiof>;
 +		interrupt-controller;
 +		touchscreen-size-x = <480>;
 +		touchscreen-size-y = <800>;
++		panel = <&panel_otm8009a>;
++		vcc-supply = <&v3v3>;
 +		status = "okay";
 +	};
 +
++	hdmi-transmitter@39 {
++		compatible = "sil,sii9022";
++		reg = <0x39>;
++		reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
++		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
++		interrupt-parent = <&gpiog>;
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&ltdc_pins_mx>;
++		pinctrl-1 = <&ltdc_sleep_pins_mx>;
++		status = "okay";
++
++		ports {
++			#address-cells = <1>;
++			#size-cells = <0>;
++
++			port@0 {
++				reg = <0>;
++				sii9022_in: endpoint {
++					remote-endpoint = <&ltdc_ep0_out>;
++				};
++			};
 +
++			port@1 {
++				reg = <1>;
++				sii9022_tx_endpoint: endpoint {
++					remote-endpoint = <&i2s2_endpoint>;
++				};
++			};
++		};
++	};
 +};
 +
 +&i2c2{
@@ -1140,16 +1317,12 @@ index 0000000000..2cc1961d08
 +	pinctrl-0 = <&i2c2_pins_mx &i2c2_pins_z_mx>;
 +	pinctrl-1 = <&i2c2_sleep_pins_mx &i2c2_sleep_pins_z_mx>;
 +	status = "okay";
-+
-+
-+
-+  i2c-scl-rising-time-ns = <185>;
++	i2c-scl-rising-time-ns = <185>;
 +	i2c-scl-falling-time-ns = <20>;
-+
 +	/delete-property/dmas;
 +	/delete-property/dma-names;
 +
-+  ov5640: camera@3c {
++	ov5640: camera@3c {
 +		compatible = "ovti,ov5640";
 +		reg = <0x3c>;
 +		clocks = <&clk_ext_camera>;
@@ -1157,8 +1330,8 @@ index 0000000000..2cc1961d08
 +		DOVDD-supply = <&v3v3>;
 +		//powerdown-gpios = <&stmfx_pinctrl 18 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
 +		//reset-gpios = <&stmfx_pinctrl 19 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
-+    //powerdown-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;  //custom
-+    //reset-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;  //custom
++		//powerdown-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;  //custom
++		//reset-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;  //custom
 +		rotation = <180>;
 +		status = "okay";
 +
@@ -1174,8 +1347,6 @@ index 0000000000..2cc1961d08
 +			};
 +		};
 +	};
-+
-+
 +};
 +
 +&i2c4{
@@ -1184,31 +1355,37 @@ index 0000000000..2cc1961d08
 +	pinctrl-0 = <&i2c4_pins_z_mx>;
 +	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
 +	status = "okay";
-+
-+
 +	i2c-scl-rising-time-ns = <185>;
 +	i2c-scl-falling-time-ns = <20>;
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
++	clock-frequency = <400000>;
++	/delete-property/ dmas;
++	/delete-property/ dma-names;
 +
 +	typec: stusb1600@28 {
 +		compatible = "st,stusb1600";
 +		reg = <0x28>;
 +		interrupt-parent = <&gpioe>;
 +		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
-+		pinctrl-0 = <&stusb1600_pins_a>;
++		pinctrl-0 = <&stusb1600_pins_mx>;
 +		pinctrl-names = "default";
 +		status = "okay";
++		vdd-supply = <&vin>;
 +
 +		typec_con: connector {
 +			compatible = "usb-c-connector";
 +			label = "USB-C";
 +			power-role = "dual";
 +			power-opmode = "default";
++
++			port {
++				con_usbotg_hs_ep: endpoint {
++					remote-endpoint = <&usbotg_hs_ep>;
++				};
++			};
 +		};
 +	};
 +
-+	pmic: stpmic@33 {
++	pmic:stpmic@33{
 +		compatible = "st,stpmic1";
 +		reg = <0x33>;
 +		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
@@ -1220,16 +1397,25 @@ index 0000000000..2cc1961d08
 +		st,vin-control-register = <0xc0>;
 +		st,usb-control-register = <0x20>;
 +
-+		regulators {
++		regulators{
 +			compatible = "st,stpmic1-regulators";
-+
++			buck1-supply = <&vin>;
++			buck2-supply = <&vin>;
++			buck3-supply = <&vin>;
++			buck4-supply = <&vin>;
 +			ldo1-supply = <&v3v3>;
++			ldo2-supply = <&vin>;
 +			ldo3-supply = <&vdd_ddr>;
++			ldo4-supply = <&vin>;
++			ldo5-supply = <&vin>;
 +			ldo6-supply = <&v3v3>;
++			vref_ddr-supply = <&vin>;
++			boost-supply = <&vin>;
 +			pwr_sw1-supply = <&bst_out>;
 +			pwr_sw2-supply = <&bst_out>;
 +
-+			vddcore: buck1 {
++
++			vddcore:buck1{
 +				regulator-name = "vddcore";
 +				regulator-min-microvolt = <1200000>;
 +				regulator-max-microvolt = <1350000>;
@@ -1238,7 +1424,7 @@ index 0000000000..2cc1961d08
 +				regulator-over-current-protection;
 +			};
 +
-+			vdd_ddr: buck2 {
++			vdd_ddr:buck2{
 +				regulator-name = "vdd_ddr";
 +				regulator-min-microvolt = <1350000>;
 +				regulator-max-microvolt = <1350000>;
@@ -1247,7 +1433,7 @@ index 0000000000..2cc1961d08
 +				regulator-over-current-protection;
 +			};
 +
-+			vdd: buck3 {
++			vdd:buck3{
 +				regulator-name = "vdd";
 +				regulator-min-microvolt = <3300000>;
 +				regulator-max-microvolt = <3300000>;
@@ -1257,7 +1443,7 @@ index 0000000000..2cc1961d08
 +				regulator-over-current-protection;
 +			};
 +
-+			v3v3: buck4 {
++			v3v3:buck4{
 +				regulator-name = "v3v3";
 +				regulator-min-microvolt = <3300000>;
 +				regulator-max-microvolt = <3300000>;
@@ -1266,25 +1452,23 @@ index 0000000000..2cc1961d08
 +				regulator-initial-mode = <0>;
 +			};
 +
-+			v1v8_audio: ldo1 {
++			v1v8_audio:ldo1{
 +				regulator-name = "v1v8_audio";
 +				regulator-min-microvolt = <1800000>;
 +				regulator-max-microvolt = <1800000>;
 +				regulator-always-on;
 +				interrupts = <IT_CURLIM_LDO1 0>;
-+
 +			};
 +
-+			v3v3_hdmi: ldo2 {
++			v3v3_hdmi:ldo2{
 +				regulator-name = "v3v3_hdmi";
 +				regulator-min-microvolt = <3300000>;
 +				regulator-max-microvolt = <3300000>;
 +				regulator-always-on;
 +				interrupts = <IT_CURLIM_LDO2 0>;
-+
 +			};
 +
-+			vtt_ddr: ldo3 {
++			vtt_ddr:ldo3{
 +				regulator-name = "vtt_ddr";
 +				regulator-min-microvolt = <500000>;
 +				regulator-max-microvolt = <750000>;
@@ -1292,14 +1476,12 @@ index 0000000000..2cc1961d08
 +				regulator-over-current-protection;
 +			};
 +
-+			vdd_usb: ldo4 {
++			vdd_usb:ldo4{
 +				regulator-name = "vdd_usb";
-+				regulator-min-microvolt = <3300000>;
-+				regulator-max-microvolt = <3300000>;
 +				interrupts = <IT_CURLIM_LDO4 0>;
 +			};
 +
-+      v3v3_eth: ldo5 {                           //custom
++			v3v3_eth:ldo5{
 +				regulator-name = "v3v3_eth";
 +				regulator-min-microvolt = <3300000>;
 +				regulator-max-microvolt = <3300000>;
@@ -1307,46 +1489,46 @@ index 0000000000..2cc1961d08
 +				regulator-boot-on;
 +			};
 +
-+			v3v3_dsi: ldo6 {                           //custom
++			v3v3_dsi:ldo6{
 +				regulator-name = "v3v3_dsi";
 +				regulator-min-microvolt = <3300000>;
 +				regulator-max-microvolt = <3300000>;
 +				regulator-always-on;
 +				interrupts = <IT_CURLIM_LDO6 0>;
-+
 +			};
 +
-+			vref_ddr: vref_ddr {
++			vref_ddr:vref_ddr{
 +				regulator-name = "vref_ddr";
 +				regulator-always-on;
 +				regulator-over-current-protection;
 +			};
 +
-+      bst_out: boost {
-+       regulator-name = "bst_out";
-+       interrupts = <IT_OCP_BOOST 0>;
-+       regulator-always-on;                    //custom
-+      };
++			bst_out:boost{
++				regulator-name = "bst_out";
++				interrupts = <IT_OCP_BOOST 0>;
++				regulator-always-on;
++			};
 +
-+     vbus_otg: pwr_sw1 {
-+       regulator-name = "vbus_otg";
-+       interrupts = <IT_OCP_OTG 0>;
-+       regulator-active-discharge;
-+       regulator-always-on;                    //custom
-+      };
++			vbus_otg:pwr_sw1{
++				regulator-name = "vbus_otg";
++				interrupts = <IT_OCP_OTG 0>;
++				regulator-active-discharge;
++				regulator-always-on;
++			};
 +
-+      vbus_sw: pwr_sw2 {
-+       regulator-name = "vbus_sw";
-+       interrupts = <IT_OCP_SWOUT 0>;
-+       regulator-active-discharge;
-+       regulator-always-on;                    //custom
-+      };
++			vbus_sw:pwr_sw2{
++				regulator-name = "vbus_sw";
++				interrupts = <IT_OCP_SWOUT 0>;
++				regulator-active-discharge = <1>;
++				regulator-always-on;
++			};
 +		};
 +
-+		onkey {
++		onkey{
 +			compatible = "st,stpmic1-onkey";
-+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
++			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
 +			interrupt-names = "onkey-falling", "onkey-rising";
++			power-off-time-sec = <10>;
 +			status = "okay";
 +		};
 +
@@ -1355,88 +1537,118 @@ index 0000000000..2cc1961d08
 +			status = "disabled";
 +		};
 +	};
++	eeprom@50 {
++		compatible = "atmel,24c02";
++		reg = <0x50>;
++		pagesize = <16>;
++	};
++};
++
++&i2c5{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c5_pins_mx>;
++	pinctrl-1 = <&i2c5_sleep_pins_mx>;
++	status = "okay";
++
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++};
++
++&spi5 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi5_pins_mx>;
++	pinctrl-1 = <&spi5_sleep_pins_mx>;
++	cs-gpios = <&gpiof 6 0>;
++	status = "okay";
 +
++	spidev: spidev@0 {
++		compatible = "rohm,dh2228fv";
++		spi-max-frequency = <30000000>;
++		reg = <0>;
++	};
 +};
 +
 +&i2s2{
++	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
++	clock-names = "pclk", "i2sclk", "x8k", "x11k";
 +	pinctrl-names = "default", "sleep";
 +	pinctrl-0 = <&i2s2_pins_mx>;
 +	pinctrl-1 = <&i2s2_sleep_pins_mx>;
 +	status = "okay";
 +
-+
-+
++	i2s2_port: port {
++		i2s2_endpoint: endpoint {
++			remote-endpoint = <&sii9022_tx_endpoint>;
++			format = "i2s";
++			mclk-fs = <256>;
++		};
++	};
 +};
 +
 +&ipcc{
 +	status = "okay";
-+
-+
-+
 +};
 +
 +&iwdg2{
 +	status = "okay";
-+
-+
 +	timeout-sec = <32>;
-+
 +};
 +
 +&ltdc{
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&ltdc_pins_mx>;
-+	pinctrl-1 = <&ltdc_sleep_pins_mx>;
 +	status = "okay";
-+
-+
-+
-+  port {
-+		#address-cells = <1>;
-+		#size-cells = <0>;
++	port {
++		ltdc_ep0_out: endpoint@0 {
++			reg = <0>;
++			remote-endpoint = <&sii9022_in>;
++		};
 +
 +		ltdc_ep1_out: endpoint@1 {
 +			reg = <1>;
 +			remote-endpoint = <&dsi_in>;
 +		};
 +	};
-+
-+
-+
 +};
 +
-+&pwr{
-+	status = "okay";
-+
-+
-+	pwr-regulators {
-+		vdd-supply = <&vdd>;
-+		vdd_3v3_usbfs-supply = <&vdd_usb>;
-+	};
-+
++&pwr_regulators {
++	vdd-supply = <&vdd>;
++	vdd_3v3_usbfs-supply = <&vdd_usb>;
 +};
 +
 +&rcc{
 +	u-boot,dm-pre-reloc;
 +	status = "okay";
-+
-+
-+
 +};
 +
 +&rng1{
 +	status = "okay";
-+
-+
-+
 +};
 +
 +&rtc{
 +	status = "okay";
++};
++
++&cec {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&cec_pins_mx>;
++	pinctrl-1 = <&cec_sleep_pins_mx>;
++	status = "okay";
++};
++
++&cpu0{
++	cpu-supply = <&vddcore>;
++};
 +
++&cpu1{
++	cpu-supply = <&vddcore>;
++};
 +
-+	st,lsco = <RTC_OUT2_RMP>;
++&crc1 {
++	status = "okay";
++};
 +
++&dts {
++	status = "okay";
 +};
 +
 +&sdmmc1{
@@ -1447,12 +1659,11 @@ index 0000000000..2cc1961d08
 +	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
 +	status = "okay";
 +
-+
-+	broken-cd;
++	cd-gpios = <&gpioe 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	disable-wp;
 +	st,neg-edge;
 +	bus-width = <4>;
 +	vmmc-supply = <&v3v3>;
-+
 +};
 +
 +&sdmmc2{
@@ -1462,8 +1673,6 @@ index 0000000000..2cc1961d08
 +	pinctrl-1 = <&sdmmc2_opendrain_pins_mx>;
 +	pinctrl-2 = <&sdmmc2_sleep_pins_mx>;
 +	status = "okay";
-+
-+
 +  	non-removable;
 +	no-sd;
 +	no-sdio;
@@ -1472,43 +1681,48 @@ index 0000000000..2cc1961d08
 +	vmmc-supply = <&v3v3>;
 +	vqmmc-supply = <&v3v3>;
 +	mmc-ddr-3_3v;
-+
-+
 +};
 +
 +&sdmmc3{
-+	u-boot,dm-pre-reloc;
 +	pinctrl-names = "default", "opendrain", "sleep";
 +	pinctrl-0 = <&sdmmc3_pins_mx>;
 +	pinctrl-1 = <&sdmmc3_opendrain_pins_mx>;
 +	pinctrl-2 = <&sdmmc3_sleep_pins_mx>;
-+	//status = "okay";
-+
-+
 +	arm,primecell-periphid = <0x10153180>;
 +  	non-removable;
 +	st,neg-edge;
 +	bus-width = <4>;
 +	vmmc-supply = <&v3v3>;
-+	//mmc-pwrseq = <&wifi_pwrseq>; //messes up sdmmc alias shifting when used
++	//mmc-pwrseq = <&wifi_pwrseq>;
 +	#address-cells = <1>;
 +	#size-cells = <0>;
 +	keep-power-in-suspend;
++	status = "disabled";
 +	//status = "okay";
 +
 +	brcmf: bcrmf@1 {
 +		reg = <1>;
 +		compatible = "brcm,bcm4329-fmac";
 +	};
-+
-+
 +};
 +
 +&tamp{
 +	status = "okay";
++};
 +
-+
-+
++&timers5 {
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	status = "okay";
++	pwm {
++		pinctrl-0 = <&tim5_pwm_pins_mx>;
++		pinctrl-1 = <&tim5_pwm_sleep_pins_mx>;
++		pinctrl-names = "default", "sleep";
++		status = "okay";
++	};
++	timer@4 {
++		status = "okay";
++	};
 +};
 +
 +&uart4{
@@ -1516,31 +1730,32 @@ index 0000000000..2cc1961d08
 +	pinctrl-names = "default", "sleep";
 +	pinctrl-0 = <&uart4_pins_mx>;
 +	pinctrl-1 = <&uart4_sleep_pins_mx>;
++	/delete-property/dmas;
++	/delete-property/dma-names;
 +	status = "okay";
-+
-+
-+
 +};
 +
 +&usart2{
 +	pinctrl-names = "default", "sleep";
 +	pinctrl-0 = <&usart2_pins_mx>;
 +	pinctrl-1 = <&usart2_sleep_pins_mx>;
++	uart-has-rtscts;
 +	status = "okay";
 +
-+
-+  bluetooth {
++	bluetooth {
 +		shutdown-gpios = <&gpioe 10 GPIO_ACTIVE_HIGH>;
 +		compatible = "brcm,bcm43438-bt";
 +		max-speed = <3000000>;
++		vbat-supply = <&v3v3>;
++		vddio-supply = <&v3v3>;
 +	};
-+
 +};
 +
-+
-+&m4_rproc {
-+memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-+		<&vdev0vring1>, <&vdev0buffer>;
++&sram {
++	dma_pool: dma_pool@0 {
++		reg = <0x50000 0x10000>;
++		pool;
++	};
 +};
 +
 +&dma1 {
@@ -1552,179 +1767,82 @@ index 0000000000..2cc1961d08
 +};
 +
 +&adc {
-+	status = "disabled";
++	vdd-supply = <&vdd>;
++	vdda-supply = <&v3v3_eth>;
++	vref-supply = <&v3v3_eth>;
++	status = "okay";
++	adc1: adc@0 {
++		st,min-sample-time-nsecs = <5000>;
++		st,adc-channels = <0 1>;
++		status = "okay";
++	};
++
++	adc_temp: temp {
++		status = "okay";
++	};
 +};
 +
 +
++// WARNING: Do not try to enable DAC1 and DCMI
++// This devices share the same pin PA4
++/* &dac {
++	pinctrl-names = "default";
++	status = "okay";
++	dac1: dac@1 {
++		pinctrl-0 = <&dac_ch1_pins_a>;
++		status = "disabled";
++	};
++	dac2: dac@2 {
++		pinctrl-0 = <&dac_ch2_pins_a>;
++		status = "okay";
++	};
++};*/
++
 +&usbh_ehci {
 +	phys = <&usbphyc_port0>;
 +	phy-names = "usb";
 +	status = "okay";
 +};
 +
++&usbh_ohci{
++	phys = <&usbphyc_port0>;
++	phy-names = "usb";
++	status = "okay";
++};
++
 +&usbotg_hs {
-+	extcon = <&typec>;
 +	phys = <&usbphyc_port1 0>;
 +	phy-names = "usb2-phy";
++	usb-role-switch;
 +	status = "okay";
++
++	port {
++		usbotg_hs_ep: endpoint {
++			remote-endpoint = <&con_usbotg_hs_ep>;
++		};
++	};
 +};
 +
 +&usbphyc {
-+	vdd3v3-supply = <&vdd_usb>;
 +	status = "okay";
 +};
 +
 +&usbphyc_port0 {
++	phy-supply = <&vdd_usb>;
 +	st,phy-tuning = <&usb_phy_tuning>;
 +};
 +
 +&usbphyc_port1 {
++	phy-supply = <&vdd_usb>;
 +	st,phy-tuning = <&usb_phy_tuning>;
 +};
-diff --git a/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
-new file mode 100644
-index 0000000000..f33886f2b4
---- /dev/null
-+++ b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
-@@ -0,0 +1,119 @@
-+/*
-+ * Copyright (C) 2015-2018, STMicroelectronics - All Rights Reserved
-+ *
-+ * SPDX-License-Identifier:	GPL-2.0+	BSD-3-Clause
-+ *
-+ */
-+
-+/*
-+ * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
-+ * DDR type: DDR3 / DDR3L
-+ * DDR width: 16bits
-+ * DDR density: 4Gb
-+ * System frequency: 533000Khz
-+ * Relaxed Timing Mode: false
-+ * Address mapping type: RBC
-+ *
-+ * Save Date: 2020.02.08, save Time: 23:22:33
-+ */
-+
-+#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
-+#define DDR_MEM_SPEED	533000
-+#define DDR_MEM_SIZE	0x20000000
 +
-+#define DDR_MSTR 0x00041401
-+#define DDR_MRCTRL0 0x00000010
-+#define DDR_MRCTRL1 0x00000000
-+#define DDR_DERATEEN 0x00000000
-+#define DDR_DERATEINT 0x00800000
-+#define DDR_PWRCTL 0x00000000
-+#define DDR_PWRTMG 0x00400010
-+#define DDR_HWLPCTL 0x00000000
-+#define DDR_RFSHCTL0 0x00210000
-+#define DDR_RFSHCTL3 0x00000000
-+#define DDR_RFSHTMG 0x0081008B
-+#define DDR_CRCPARCTL0 0x00000000
-+#define DDR_DRAMTMG0 0x121B2414
-+#define DDR_DRAMTMG1 0x000A041C
-+#define DDR_DRAMTMG2 0x0608090F
-+#define DDR_DRAMTMG3 0x0050400C
-+#define DDR_DRAMTMG4 0x08040608
-+#define DDR_DRAMTMG5 0x06060403
-+#define DDR_DRAMTMG6 0x02020002
-+#define DDR_DRAMTMG7 0x00000202
-+#define DDR_DRAMTMG8 0x00001005
-+#define DDR_DRAMTMG14 0x000000A0
-+#define DDR_ZQCTL0 0xC2000040
-+#define DDR_DFITMG0 0x02060105
-+#define DDR_DFITMG1 0x00000202
-+#define DDR_DFILPCFG0 0x07000000
-+#define DDR_DFIUPD0 0xC0400003
-+#define DDR_DFIUPD1 0x00000000
-+#define DDR_DFIUPD2 0x00000000
-+#define DDR_DFIPHYMSTR 0x00000000
-+#define DDR_ODTCFG 0x06000600
-+#define DDR_ODTMAP 0x00000001
-+#define DDR_SCHED 0x00000C01
-+#define DDR_SCHED1 0x00000000
-+#define DDR_PERFHPR1 0x01000001
-+#define DDR_PERFLPR1 0x08000200
-+#define DDR_PERFWR1 0x08000400
-+#define DDR_DBG0 0x00000000
-+#define DDR_DBG1 0x00000000
-+#define DDR_DBGCMD 0x00000000
-+#define DDR_POISONCFG 0x00000000
-+#define DDR_PCCFG 0x00000010
-+#define DDR_PCFGR_0 0x00010000
-+#define DDR_PCFGW_0 0x00000000
-+#define DDR_PCFGQOS0_0 0x02100C03
-+#define DDR_PCFGQOS1_0 0x00800100
-+#define DDR_PCFGWQOS0_0 0x01100C03
-+#define DDR_PCFGWQOS1_0 0x01000200
-+#define DDR_PCFGR_1 0x00010000
-+#define DDR_PCFGW_1 0x00000000
-+#define DDR_PCFGQOS0_1 0x02100C03
-+#define DDR_PCFGQOS1_1 0x00800040
-+#define DDR_PCFGWQOS0_1 0x01100C03
-+#define DDR_PCFGWQOS1_1 0x01000200
-+#define DDR_ADDRMAP1 0x00070707
-+#define DDR_ADDRMAP2 0x00000000
-+#define DDR_ADDRMAP3 0x1F000000
-+#define DDR_ADDRMAP4 0x00001F1F
-+#define DDR_ADDRMAP5 0x06060606
-+#define DDR_ADDRMAP6 0x0F060606
-+#define DDR_ADDRMAP9 0x00000000
-+#define DDR_ADDRMAP10 0x00000000
-+#define DDR_ADDRMAP11 0x00000000
-+#define DDR_PGCR 0x01442E02
-+#define DDR_PTR0 0x0022AA5B
-+#define DDR_PTR1 0x04841104
-+#define DDR_PTR2 0x042DA068
-+#define DDR_ACIOCR 0x10400812
-+#define DDR_DXCCR 0x00000C40
-+#define DDR_DSGCR 0xF200011F
-+#define DDR_DCR 0x0000000B
-+#define DDR_DTPR0 0x38D488D0
-+#define DDR_DTPR1 0x098B00D8
-+#define DDR_DTPR2 0x10023600
-+#define DDR_MR0 0x00000840
-+#define DDR_MR1 0x00000000
-+#define DDR_MR2 0x00000208
-+#define DDR_MR3 0x00000000
-+#define DDR_ODTCR 0x00010000
-+#define DDR_ZQ0CR1 0x00000038
-+#define DDR_DX0GCR 0x0000CE81
-+#define DDR_DX0DLLCR 0x40000000
-+#define DDR_DX0DQTR 0xFFFFFFFF
-+#define DDR_DX0DQSTR 0x3DB02000
-+#define DDR_DX1GCR 0x0000CE81
-+#define DDR_DX1DLLCR 0x40000000
-+#define DDR_DX1DQTR 0xFFFFFFFF
-+#define DDR_DX1DQSTR 0x3DB02000
-+#define DDR_DX2GCR 0x0000CE80
-+#define DDR_DX2DLLCR 0x40000000
-+#define DDR_DX2DQTR 0xFFFFFFFF
-+#define DDR_DX2DQSTR 0x3DB02000
-+#define DDR_DX3GCR 0x0000CE80
-+#define DDR_DX3DLLCR 0x40000000
-+#define DDR_DX3DQTR 0xFFFFFFFF
-+#define DDR_DX3DQSTR 0x3DB02000
-diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
-index 80081dde4e..0463e8813c 100644
---- a/arch/arm/dts/stm32mp157c.dtsi
-+++ b/arch/arm/dts/stm32mp157c.dtsi
-@@ -1775,10 +1775,14 @@
- 			clock-names = "stmmaceth",
- 				      "mac-clk-tx",
- 				      "mac-clk-rx",
-+				      "eth-ck",    //custom
-+				      "syscfg-clk", //custom
- 				      "ethstp";
- 			clocks = <&rcc ETHMAC>,
- 				 <&rcc ETHTX>,
- 				 <&rcc ETHRX>,
-+				 <&rcc ETHCK_K>, //custom
-+				 <&rcc SYSCFG>,  //custom
- 				 <&rcc ETHSTP>;
- 			st,syscon = <&syscfg 0x4>;
- 			snps,mixed-burst;
++&m_can1 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&m_can1_pins_mx>;
++	pinctrl-1 = <&m_can1_sleep_pins_mx>;
++	status = "okay";
++};
 -- 
 2.25.1
 
diff --git a/board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch b/board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch
index cc43b80f21..a2ec783e1b 100644
--- a/board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch
+++ b/board/octavo/osd32mp1-red/patches/uboot/0002-configs-stm32mp15_trusted_defconfig-disable-environm.patch
@@ -1,32 +1,49 @@
-From 3feee3e00dcb9467b5345671300e7c73f3e05f93 Mon Sep 17 00:00:00 2001
+From 27a516e2ad464bf1de5e23e8277e0f6d6735bd21 Mon Sep 17 00:00:00 2001
 From: Kory Maincent <kory.maincent@bootlin.com>
-Date: Tue, 5 Oct 2021 14:31:28 +0200
+Date: Mon, 3 Oct 2022 12:20:40 +0200
 Subject: [PATCH 2/2] configs/stm32mp15_trusted_defconfig: disable environment
 
-select only ENV_IS_NOWHERE
-
 Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
 ---
- configs/stm32mp15_trusted_defconfig | 6 ------
- 1 file changed, 6 deletions(-)
+ board/st/stm32mp1/stm32mp1.c        | 4 ++++
+ configs/stm32mp15_trusted_defconfig | 9 ---------
+ 2 files changed, 4 insertions(+), 9 deletions(-)
 
+diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
+index 48591b2f1e..ba510d843c 100644
+--- a/board/st/stm32mp1/stm32mp1.c
++++ b/board/st/stm32mp1/stm32mp1.c
+@@ -78,6 +78,10 @@ DECLARE_GLOBAL_DATA_PTR;
+ #define USB_START_LOW_THRESHOLD_UV	1230000
+ #define USB_START_HIGH_THRESHOLD_UV	2150000
+ 
++#ifndef CONFIG_SYS_MMC_ENV_DEV
++#define CONFIG_SYS_MMC_ENV_DEV -1
++#endif
++
+ int board_early_init_f(void)
+ {
+ 	/* nothing to do, only used in SPL */
 diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
-index 7635d7f6c7..6ec4bcd080 100644
+index 2161ccbefa..fd3fed8fb0 100644
 --- a/configs/stm32mp15_trusted_defconfig
 +++ b/configs/stm32mp15_trusted_defconfig
-@@ -38,12 +38,6 @@ CONFIG_CMD_MTDPARTS=y
+@@ -45,15 +45,6 @@ CONFIG_CMD_EXT4_WRITE=y
+ CONFIG_CMD_MTDPARTS=y
  CONFIG_CMD_UBI=y
- CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
  CONFIG_ENV_IS_NOWHERE=y
--CONFIG_ENV_IS_IN_EXT4=y
+-CONFIG_ENV_IS_IN_MMC=y
 -CONFIG_ENV_IS_IN_SPI_FLASH=y
 -CONFIG_ENV_IS_IN_UBI=y
--CONFIG_ENV_EXT4_INTERFACE="mmc"
--CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
--CONFIG_ENV_EXT4_FILE="/uboot.env"
+-CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
+-CONFIG_ENV_UBI_PART="UBI"
+-CONFIG_ENV_UBI_VOLUME="uboot_config"
+-CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
+-CONFIG_SYS_RELOC_GD_ENV_ADDR=y
+-CONFIG_SYS_MMC_ENV_DEV=-1
  CONFIG_STM32_ADC=y
- CONFIG_USB_FUNCTION_FASTBOOT=y
- CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+ CONFIG_CLK_SCMI=y
+ CONFIG_SET_DFU_ALT_INFO=y
 -- 
 2.25.1
 
diff --git a/board/octavo/osd32mp1-red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi b/board/octavo/osd32mp1-red/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
similarity index 94%
rename from board/octavo/osd32mp1-red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
rename to board/octavo/osd32mp1-red/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
index f33886f2b4..3cd2c3f5d1 100644
--- a/board/octavo/osd32mp1-red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
+++ b/board/octavo/osd32mp1-red/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
@@ -14,7 +14,7 @@
  * Relaxed Timing Mode: false
  * Address mapping type: RBC
  *
- * Save Date: 2020.02.08, save Time: 23:22:33
+ * Save Date: 2020.08.27, save Time: 15:22:11
  */
 
 #define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
@@ -103,12 +103,12 @@
 #define DDR_ZQ0CR1 0x00000038
 #define DDR_DX0GCR 0x0000CE81
 #define DDR_DX0DLLCR 0x40000000
-#define DDR_DX0DQTR 0xFFFFFFFF
-#define DDR_DX0DQSTR 0x3DB02000
+#define DDR_DX0DQTR 0x00112121
+#define DDR_DX0DQSTR 0x3D200000
 #define DDR_DX1GCR 0x0000CE81
 #define DDR_DX1DLLCR 0x40000000
-#define DDR_DX1DQTR 0xFFFFFFFF
-#define DDR_DX1DQSTR 0x3DB02000
+#define DDR_DX1DQTR 0x11100121
+#define DDR_DX1DQSTR 0x3D200000
 #define DDR_DX2GCR 0x0000CE80
 #define DDR_DX2DLLCR 0x40000000
 #define DDR_DX2DQTR 0xFFFFFFFF
@@ -117,3 +117,5 @@
 #define DDR_DX3DLLCR 0x40000000
 #define DDR_DX3DQTR 0xFFFFFFFF
 #define DDR_DX3DQSTR 0x3DB02000
+
+#include "stm32mp15-ddr.dtsi"
diff --git a/board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red-fw-config.dts b/board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red-fw-config.dts
new file mode 100644
index 0000000000..256d0db935
--- /dev/null
+++ b/board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red-fw-config.dts
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+#include "stm32mp15-ddr-512m-fw-config.dts"
diff --git a/board/octavo/osd32mp1-red/tfa-dts/osd32mp1-red.dts b/board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red.dts
similarity index 60%
rename from board/octavo/osd32mp1-red/tfa-dts/osd32mp1-red.dts
rename to board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red.dts
index a37b048a71..7cf64d9d98 100644
--- a/board/octavo/osd32mp1-red/tfa-dts/osd32mp1-red.dts
+++ b/board/octavo/osd32mp1-red/tfa-dts/stm32mp157c-osd32mp1-red.dts
@@ -4,300 +4,100 @@
  * Author: STM32CubeMX code generation for STMicroelectronics.
  */
 
-/* For more information on Device Tree configuration, please refer to
- * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
- */
-
 /dts-v1/;
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
-#include "stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi"
-
-#include "stm32mp157c.dtsi"
-#include "stm32mp157cac-pinctrl.dtsi"
-#include "stm32mp15-ddr.dtsi"
-#include "stm32mp157c-security.dtsi"
+#include <dt-bindings/soc/st,stm32-etzpc.h>
 #include <dt-bindings/power/stm32mp1-power.h>
 
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "osd32mp1_ddr_1x4Gb.dtsi"
 
 / {
-	model = "Octavo OSD32MP1-RED board";
-	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
-
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
+	model = "Octavo OSD32MP1 RED board";
+	compatible = "octavo,stm32mp157c-osd32mp1-red", "st,stm32mp157";
 
 	aliases {
 		serial0 = &uart4;
-		serial1 = &usart3;
-		serial2 = &uart7;
-		gpio0 = &gpioa;
-		gpio1 = &gpiob;
-		gpio2 = &gpioc;
-		gpio3 = &gpiod;
-		gpio4 = &gpioe;
-		gpio5 = &gpiof;
-		gpio6 = &gpiog;
-		gpio7 = &gpioh;
-		gpio8 = &gpioi;
-		gpio25 = &gpioz;
-		i2c3 = &i2c4;
-	};
-
-
-	clocks {
-
-
-
-		clk_lse: clk-lse {
-			st,drive = < LSEDRV_MEDIUM_HIGH >;
-
-
-
-		};
-
-		clk_hse: clk-hse {
-			st,digbypass;
-
-
-
-		};
 	};
 
-}; /*root*/
-
-&pinctrl {
-	sdmmc1_pins_mx: sdmmc1_mx-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-					 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-					 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <3>;
-		};
-	};
-
-	sdmmc2_pins_mx: sdmmc2_mx-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
-					 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
-					 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
-					 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
-					 <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
-					 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
-					 <STM32_PINMUX('C', 7, AF10)>, /* SDMMC2_D7 */
-					 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
-					 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
-			bias-pull-up;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
-			bias-pull-up;
-			drive-push-pull;
-			slew-rate = <2>;
-		};
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
 	};
 
-	sdmmc3_pins_mx: sdmmc3_mx-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
-					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
-					 <STM32_PINMUX('F', 1, AF9)>, /* SDMMC3_CMD */
-					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
-					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <2>;
-		};
+	vin: vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
-	uart4_pins_mx: uart4_mx-0 {
-		pins1 {
-			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-			bias-disable;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <0>;
-		};
+	chosen {
+		stdout-path = "serial0:115200n8";
 	};
-
-
-
 };
 
-&pinctrl_z {
-	i2c4_pins_z_mx: i2c4_mx-0 {
-		pins {
-			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-			         <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
-			bias-disable;
-			drive-open-drain;
-			slew-rate = <0>;
-		};
+&bsec {
+	board_id: board_id@ec {
+		reg = <0xec 0x4>;
+		st,non-secure-otp;
 	};
+};
 
+&clk_hse {
+	st,digbypass;
+};
 
-
+&cpu0 {
+	cpu-supply = <&vddcore>;
 };
 
-&rcc {
-	st,csi-cal;
-	st,hsi-cal;
-	st,cal-sec = <60>;
-	st,clksrc = <
-		CLK_MPU_PLL1P
-		CLK_AXI_PLL2P
-		CLK_MCU_PLL3P
-		CLK_PLL12_HSE
-		CLK_PLL3_HSE
-		CLK_PLL4_HSE
-		CLK_RTC_LSE
-		CLK_MCO1_DISABLED
-		CLK_MCO2_DISABLED
-	>;
-	st,clkdiv = <
-		1 		/*MPU*/
-		0 		/*AXI*/
-		0 		/*MCU*/
-		1 		/*APB1*/
-		1 		/*APB2*/
-		1 		/*APB3*/
-		1 		/*APB4*/
-		2 		/*APB5*/
-		23 		/*RTC*/
-		0 		/*MCO1*/
-		0 		/*MCO2*/
-	>;
-	st,pkcs = <
-		CLK_CKPER_HSE
-		CLK_ETH_PLL3Q
-		CLK_SDMMC12_PLL4P
-		CLK_DSI_DSIPLL
-		CLK_STGEN_HSE
-		CLK_USBPHY_HSE
-		CLK_SPI2S1_DISABLED
-		CLK_SPI2S23_PLL3Q
-		CLK_SPI45_PCLK2
-		CLK_SPI6_DISABLED
-		CLK_I2C46_HSI
-		CLK_SDMMC3_PLL4P
-                CLK_USBO_USBPHY
-		CLK_ADC_CKPER
-		CLK_CEC_DISABLED
-		CLK_I2C12_HSI
-		CLK_I2C35_PCLK1
-		CLK_UART1_DISABLED
-		CLK_UART24_HSI
-		CLK_UART35_HSI
-		CLK_UART6_DISABLED
-		CLK_UART78_DISABLED
-		CLK_SPDIF_DISABLED
-		CLK_SAI1_DISABLED
-		CLK_SAI2_CKPER
-		CLK_SAI3_DISABLED
-		CLK_SAI4_DISABLED
-		CLK_RNG1_LSI
-		CLK_LPTIM1_DISABLED
-		CLK_LPTIM23_DISABLED
-		CLK_LPTIM45_DISABLED
-	>;
-	pll1:st,pll@0 {
-		cfg = < 2 80 0 1 1 PQR(1,0,0) >;
-		frac = < 0x800>;
-	};
-	pll2:st,pll@1 {
-		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
-		frac = < 0x1400>;
-	};
-	pll3:st,pll@2 {
-		cfg = < 1 61 3 5 36 PQR(1,1,0) >;
-		frac = < 0x1000 >;
-	};
-	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
-	pll4: st,pll@3 {
-		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
-	};
+&cpu1 {
+	cpu-supply = <&vddcore>;
 };
 
-&bsec{
+&hash1 {
 	status = "okay";
-	secure-status = "okay";
-
-
-	board_id: board_id@ec {
-		reg = <0xec 0x4>;
-		status = "okay";
-		secure-status = "okay";
-	};
+};
 
+&cryp1 {
+	status = "okay";
 };
 
-&etzpc{
+&etzpc {
 	st,decprot = <
-	/*"Non Secured" peripherals*/
-	DECPROT(STM32MP1_ETZPC_DCMI_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_ETH_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_I2C1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_I2C2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_I2C5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_SPI2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_RNG1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_SAI2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_SDMMC3_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_DLYBSD3_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_SPI5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_TIM5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_UART4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-	DECPROT(STM32MP1_ETZPC_USART2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-
-	/*Restriction: following IDs are not managed  - please to use User-Section if needed:
-		STM32MP1_ETZPC_DMA1_ID, STM32MP1_ETZPC_DMA2_ID, STM32MP1_ETZPC_DMAMUX_ID,
-		STM32MP1_ETZPC_SRAMx_ID, STM32MP1_ETZPC_RETRAM_ID, STM32MP1_ETZPC_BKPSRAM_ID*/
-
-
-		/*STM32CubeMX generates a basic and standard configuration for ETZPC.
-		Additional device configurations can be added here if needed.
-		"etzpc" node could be also overloaded in "addons" User-Section.*/
-
+		DECPROT(STM32MP1_ETZPC_DCMI_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_ETH_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_USART1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_SPI6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_SPI2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_I2C6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_RNG1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_HASH1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_CRYP1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_DDRCTRL_ID, DECPROT_NS_R_S_W, DECPROT_LOCK)
+		DECPROT(STM32MP1_ETZPC_DDRPHYC_ID, DECPROT_NS_R_S_W, DECPROT_LOCK)
+		DECPROT(STM32MP1_ETZPC_STGENC_ID, DECPROT_S_RW, DECPROT_LOCK)
+		DECPROT(STM32MP1_ETZPC_BKPSRAM_ID, DECPROT_S_RW, DECPROT_LOCK)
+		DECPROT(STM32MP1_ETZPC_IWDG1_ID, DECPROT_S_RW, DECPROT_LOCK)
 	>;
-
-	secure-status = "okay";
-
+};
 
 
-};
 
-&i2c4{
+&i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_z_mx>;
-	status = "okay";
-	secure-status = "okay";
-
-
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+	status = "okay";
+	secure-status = "okay";
 
 	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
@@ -306,17 +106,24 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		status = "okay";
-
-		st,main-control-register = <0x04>;
-		st,vin-control-register = <0xc0>;
-		st,usb-control-register = <0x20>;
+		secure-status = "okay";
 
 		regulators {
 			compatible = "st,stpmic1-regulators";
-
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
 			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&vin>;
 			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
+			ldo5-supply = <&vin>;
 			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
 
 			vddcore: buck1 {
 				regulator-name = "vddcore";
@@ -325,14 +132,14 @@
 				regulator-always-on;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-				lp-stop {
+				lp-stop{
 					regulator-on-in-suspend;
 					regulator-suspend-microvolt = <1200000>;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -344,15 +151,15 @@
 				regulator-always-on;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-				lp-stop {
+				lp-stop{
 					regulator-suspend-microvolt = <1350000>;
 					regulator-on-in-suspend;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-suspend-microvolt = <1350000>;
 					regulator-on-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -365,15 +172,15 @@
 				st,mask-reset;
 				regulator-initial-mode = <0>;
 				regulator-over-current-protection;
-				lp-stop {
+				lp-stop{
 					regulator-suspend-microvolt = <3300000>;
 					regulator-on-in-suspend;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-suspend-microvolt = <3300000>;
 					regulator-on-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-suspend-microvolt = <3300000>;
 					regulator-on-in-suspend;
 				};
@@ -386,40 +193,40 @@
 				regulator-always-on;
 				regulator-over-current-protection;
 				regulator-initial-mode = <0>;
-				lp-stop {
+				lp-stop{
 					regulator-suspend-microvolt = <3300000>;
 					regulator-on-in-suspend;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
 
-			v1v8_audio: ldo1 {
+			v1v8_ldo1: ldo1 {
 				regulator-name = "v1v8_audio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
-				standby-ddr-sr {
-						regulator-off-in-suspend;
-					};
-					standby-ddr-off {
-						regulator-off-in-suspend;
-					};
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
 			};
 
-			v3v3_hdmi: ldo2 {
+			v3v3_ldo2: ldo2 {
 				regulator-name = "v3v3_hdmi";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -430,13 +237,13 @@
 				regulator-max-microvolt = <750000>;
 				regulator-always-on;
 				regulator-over-current-protection;
-				lp-stop {
+				lp-stop{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -445,10 +252,11 @@
 				regulator-name = "vdd_usb";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				standby-ddr-sr {
-					regulator-off-in-suspend;
+				regulator-always-on;
+				standby-ddr-sr{
+					regulator-on-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -458,23 +266,23 @@
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
 				regulator-boot-on;
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
 
-			v1v2_hdmi: ldo6 {
-				regulator-name = "v1v2_hdmi";
+			v1v2_ldo6: ldo6 {
+				regulator-name = "v1v2_ldo6";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-off-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
@@ -483,133 +291,281 @@
 				regulator-name = "vref_ddr";
 				regulator-always-on;
 				regulator-over-current-protection;
-				lp-stop {
+				lp-stop{
 					regulator-on-in-suspend;
 				};
-				standby-ddr-sr {
+				standby-ddr-sr{
 					regulator-on-in-suspend;
 				};
-				standby-ddr-off {
+				standby-ddr-off{
 					regulator-off-in-suspend;
 				};
 			};
-		};
-	};
-
-};
-
-&iwdg2{
-	status = "okay";
-	secure-status = "okay";
 
+			bst_out: boost {
+				regulator-name = "bst_out";
+			};
 
-	timeout-sec = <32>;
+			vbus_otg: pwr_sw1 {
+				regulator-name = "vbus_otg";
+			};
 
+			vbus_sw: pwr_sw2 {
+				regulator-name = "vbus_sw";
+				regulator-active-discharge = <1>;
+			};
+		};
+	};
 };
 
-&pwr{
+&iwdg2 {
+	timeout-sec = <32>;
+	secure-timeout-sec = <5>;
 	status = "okay";
 	secure-status = "okay";
+};
 
+&nvmem_layout {
+	nvmem-cells = <&cfg0_otp>,
+		      <&part_number_otp>,
+		      <&monotonic_otp>,
+		      <&nand_otp>,
+		      <&uid_otp>,
+		      <&package_otp>,
+		      <&hw2_otp>,
+		      <&pkh_otp>,
+		      <&board_id>;
+
+	nvmem-cell-names = "cfg0_otp",
+			   "part_number_otp",
+			   "monotonic_otp",
+			   "nand_otp",
+			   "uid_otp",
+			   "package_otp",
+			   "hw2_otp",
+			   "pkh_otp",
+			   "board_id";
+};
 
+&pwr_regulators {
 	system_suspend_supported_soc_modes = <
 		STM32_PM_CSLEEP_RUN
 		STM32_PM_CSTOP_ALLOW_LP_STOP
 		STM32_PM_CSTOP_ALLOW_STANDBY_DDR_SR
 	>;
 	system_off_soc_mode = <STM32_PM_CSTOP_ALLOW_STANDBY_DDR_OFF>;
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
 
-	pwr-regulators {
-		vdd-supply = <&vdd>;
-	};
+&rcc {
+	st,hsi-cal;
+	st,csi-cal;
+	st,cal-sec = <60>;
+	st,clksrc = <
+		CLK_MPU_PLL1P
+		CLK_AXI_PLL2P
+		CLK_MCU_PLL3P
+		CLK_PLL12_HSE
+		CLK_PLL3_HSE
+		CLK_PLL4_HSE
+		CLK_RTC_LSE
+		CLK_MCO1_DISABLED
+		CLK_MCO2_DISABLED
+	>;
 
-};
+	st,clkdiv = <
+		1 /*MPU*/
+		0 /*AXI*/
+		0 /*MCU*/
+		1 /*APB1*/
+		1 /*APB2*/
+		1 /*APB3*/
+		1 /*APB4*/
+		2 /*APB5*/
+		23 /*RTC*/
+		0 /*MCO1*/
+		0 /*MCO2*/
+	>;
 
-&rcc{
-	status = "okay";
-	secure-status = "okay";
+	st,pkcs = <
+		CLK_CKPER_HSE
+		CLK_ETH_PLL3Q
+		CLK_SDMMC12_PLL4P
+		CLK_DSI_DSIPLL
+		CLK_STGEN_HSE
+		CLK_USBPHY_HSE
+		CLK_SPI2S1_PLL3Q
+		CLK_SPI2S23_CKPER
+		CLK_SPI45_PCLK2
+		CLK_SPI6_DISABLED
+		CLK_I2C46_HSI
+		CLK_SDMMC3_PLL4P
+                CLK_USBO_USBPHY
+		CLK_ADC_CKPER
+		CLK_CEC_LSE
+		CLK_I2C12_HSI
+		CLK_I2C35_HSI
+		CLK_UART1_DISABLED
+		CLK_UART24_HSI
+		CLK_UART35_HSI
+		CLK_UART6_DISABLED
+		CLK_UART78_DISABLED
+		CLK_SPDIF_DISABLED
+		CLK_SAI1_DISABLED
+		CLK_SAI2_DISABLED
+		CLK_SAI3_DISABLED
+		CLK_SAI4_DISABLED
+		CLK_RNG1_LSI
+		CLK_LPTIM1_DISABLED
+		CLK_LPTIM23_DISABLED
+		CLK_LPTIM45_DISABLED
+	>;
+
+	pll1:st,pll@0 {
+		cfg = < 2 80 0 1 1 PQR(1,0,0) >;
+		frac = < 0x800>;
+	};
 
+	pll2:st,pll@1 {
+		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
+		frac = < 0x1400>;
+	};
 
+	pll3:st,pll@2 {
+		cfg = < 1 61 3 5 36 PQR(1,1,0) >;
+		frac = < 0x1000 >;
+	};
 
+	pll4: st,pll@3 {
+		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
+	};
 };
 
-&rng1{
+&rng1 {
 	status = "okay";
 	secure-status = "okay";
-
-
-
 };
 
-&rtc{
+&rtc {
 	status = "okay";
 	secure-status = "okay";
-
-
-
 };
 
-&sdmmc1{
+&sdmmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_pins_mx>;
-	status = "okay";
-
-
-	broken-cd;
+	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
-
+	status = "okay";
 };
 
 &sdmmc2{
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc2_pins_mx>;
 	status = "okay";
-
-
-
 };
 
-&sdmmc3{
+&timers15 {
+	secure-status = "okay";
+	st,hsi-cal-input = <7>;
+	st,csi-cal-input = <8>;
+};
+&uart4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&sdmmc3_pins_mx>;
+	pinctrl-0 = <&uart4_pins_mx>;
 	status = "okay";
-
-
-
 };
 
-&tamp{
+&usbotg_hs {
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	usb-role-switch;
 	status = "okay";
-	secure-status = "okay";
-
+};
 
+&usbphyc {
+	status = "okay";
+};
 
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
 };
 
-&uart4{
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart4_pins_mx>;
-	status = "okay";
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
 
 
 
-};
 
+&pinctrl {
+	sdmmc1_pins_mx: sdmmc1-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+				 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+				 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+				 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-disable;
+		};
+	};
 
-/delete-node/ &qspi_bk1_pins_a;
-/delete-node/ &qspi_bk2_pins_a;
-/delete-node/ &qspi_clk_pins_a;
-/delete-node/ &sdmmc1_b4_pins_a;
-/delete-node/ &sdmmc1_dir_pins_a;
-/delete-node/ &sdmmc1_dir_pins_b;
-/delete-node/ &sdmmc2_b4_pins_a;
-/delete-node/ &sdmmc2_d47_pins_a;
-/delete-node/ &uart4_pins_a;
-/delete-node/ &uart7_pins_a;
-/delete-node/ &usart3_pins_a;
-/delete-node/ &usart3_pins_b;
-/delete-node/ &i2c4_pins_a;
+	sdmmc2_pins_mx: sdmmc2_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+					 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+					 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+					 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+					 <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+					 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+					 <STM32_PINMUX('C', 7, AF10)>, /* SDMMC2_D7 */
+					 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
+					 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
 
+	uart4_pins_mx: uart4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+	};
+};
 
+&pinctrl_z {
+	i2c4_pins_z_mx: i2c4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
+				 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+};
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
index ee8dbcb76d..2d0b340580 100644
--- a/configs/octavo_osd32mp1_red_defconfig
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a7=y
 # global patch directory
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-red/patches"
 
-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # rootfs overlay
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-red/overlay/"
@@ -20,11 +20,11 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-red/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.19-stm32mp-r3.3"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.10-stm32mp-r2.1"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/fragment-01-multiv7_cleanup.config $(LINUX_DIR)/arch/arm/configs/fragment-02-multiv7_addons.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="osd32mp1-red"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-osd32mp1-red"
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/osd32mp1-red/linux-dts/*"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -38,11 +38,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0-stm32mp-r1.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4-stm32mp-r1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/octavo/osd32mp1-red/tfa-dts/*"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=osd32mp1-red.dtb STM32MP_USB_PROGRAMMER=1 CFLAGS=-Wno-array-bounds"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-osd32mp1-red.dtb STM32MP_USB_PROGRAMMER=1 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32 fip.bin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 
 # U-Boot
@@ -50,11 +53,12 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2018.11-stm32mp-r3.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2020.10-stm32mp-r2.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_STM32=y
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=osd32mp1-red"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-osd32mp1-red"
 
 # Package needed to generate the image
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
