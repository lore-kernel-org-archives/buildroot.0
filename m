Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E13C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:53:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DC861371
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32DC861371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09FE340297;
	Tue,  5 Oct 2021 14:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t76l4qOz3UQp; Tue,  5 Oct 2021 14:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F212340898;
	Tue,  5 Oct 2021 14:53:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 442241BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26C6D4086F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDZ8maJfzAQi for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:52:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70ED040870
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:52:08 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6FBA320005;
 Tue,  5 Oct 2021 14:52:06 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 16:52:05 +0200
Message-Id: <20211005145205.27617-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005145205.27617-1-kory.maincent@bootlin.com>
References: <20211005145205.27617-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/octavo_osd32mp1_red_defconfig: Add
 support for octavo red board
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
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Very similar to the other stm32mp157-based boards. We use the TF-A, U-boot
and Linux version from ST selected by the Octavo constructor.

Reference:
    https://octavosystems.com/octavo_products/osd32mp1-red/

The device tree blobs come from Octavo System:
    https://github.com/octavosystems/OSD32MP1-RED-Device-tree.git

The uboot patches come from Octavo System:
    https://github.com/octavosystems/osd32mp1-build-tools/tree/master/patches/u-boot-2018.11

It is licensed under BSD 3-Clause.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 DEVELOPERS                                    |    2 +
 board/octavo/red/genimage.cfg                 |   23 +
 board/octavo/red/linux-dts/osd32mp1-red.dts   | 1469 ++++++++++++
 .../linux-dts/stm32mp157c-osd32mp1-red.dtsi   | 2077 +++++++++++++++++
 board/octavo/red/linux.config                 |  936 ++++++++
 .../red/overlay/boot/extlinux/extlinux.conf   |    4 +
 board/octavo/red/post-image.sh                |   39 +
 board/octavo/red/tfa-dts/osd32mp1-red.dts     |  615 +++++
 ...m32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi |  119 +
 ...Add-OSD32MP1-RED-Device-Tree-support.patch | 1708 ++++++++++++++
 ...-Fix-Ethernet-Clock-for-OSD32MP1-RED.patch |   32 +
 ...5_trusted_defconfig-disable-environm.patch |   32 +
 configs/octavo_osd32mp1_red_defconfig         |   39 +
 13 files changed, 7095 insertions(+)
 create mode 100644 board/octavo/red/genimage.cfg
 create mode 100644 board/octavo/red/linux-dts/osd32mp1-red.dts
 create mode 100644 board/octavo/red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
 create mode 100644 board/octavo/red/linux.config
 create mode 100644 board/octavo/red/overlay/boot/extlinux/extlinux.conf
 create mode 100755 board/octavo/red/post-image.sh
 create mode 100644 board/octavo/red/tfa-dts/osd32mp1-red.dts
 create mode 100644 board/octavo/red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
 create mode 100644 board/octavo/red/uboot-patches/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
 create mode 100644 board/octavo/red/uboot-patches/0002-Fix-Ethernet-Clock-for-OSD32MP1-RED.patch
 create mode 100644 board/octavo/red/uboot-patches/0003-configs-stm32mp15_trusted_defconfig-disable-environm.patch
 create mode 100644 configs/octavo_osd32mp1_red_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index f0749be912..be2be47806 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1541,7 +1541,9 @@ F:	package/linuxconsoletools/
 
 N:	Kory Maincent <kory.maincent@bootlin.com
 F:	board/octavo/brk/
+F:	board/octavo/red/
 F:	configs/octavo_osd32mp1_brk_defconfig
+F:	configs/octavo_osd32mp1_red_defconfig
 
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
diff --git a/board/octavo/red/genimage.cfg b/board/octavo/red/genimage.cfg
new file mode 100644
index 0000000000..03fba8daf0
--- /dev/null
+++ b/board/octavo/red/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "%ATFBIN%"
+	}
+
+	partition fsbl2 {
+		image = "%ATFBIN%"
+	}
+
+	partition ssbl {
+		image = "u-boot.stm32"
+		size = 2M
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/octavo/red/linux-dts/osd32mp1-red.dts b/board/octavo/red/linux-dts/osd32mp1-red.dts
new file mode 100644
index 0000000000..ec461b80f0
--- /dev/null
+++ b/board/octavo/red/linux-dts/osd32mp1-red.dts
@@ -0,0 +1,1469 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ * Author: STM32CubeMX code generation for STMicroelectronics.
+ */
+
+/* For more information on Device Tree configuration, please refer to
+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
+ */
+
+/dts-v1/;
+#include "stm32mp157c-osd32mp1-red.dtsi"
+#include "stm32mp157cac-pinctrl.dtsi"
+#include "stm32mp157c-m4-srm.dtsi"
+
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/rtc/rtc-stm32.h>
+
+
+/ {
+	model = "Octavo OSD32MP1-RED board";
+	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
+
+	memory@c0000000 {
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpiog 5 GPIO_ACTIVE_LOW>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+
+
+		retram: retram@0x38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		mcuram: mcuram@0x30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		mcuram2: mcuram2@0x10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x2000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x2000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10044000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10044000 0x4000>;
+			no-map;
+		};
+
+
+		gpu_reserved: gpu@d4000000 {
+			reg = <0xd4000000 0x4000000>;
+			no-map;
+		};
+	};
+
+
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
+		serial3 = &usart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sram: sram@10050000 {
+		compatible = "mmio-sram";
+		reg = <0x10050000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x10050000 0x10000>;
+
+		dma_pool: dma_pool@0 {
+			reg = <0x0 0x10000>;
+			pool;
+		};
+	};
+
+	led {
+		compatible = "gpio-leds";
+		blue {
+			label = "heartbeat";
+			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP1-DK";
+		routing =
+			"Playback" , "MCLK",
+			"Capture" , "MCLK",
+			"MICL" , "Mic Bias";
+		dais = <&i2s2_port>;
+		status = "okay";
+	};
+
+	usb_phy_tuning: usb-phy-tuning {
+		st,hs-dc-level = <2>;
+		st,fs-rftime-tuning;
+		st,hs-rftime-reduction;
+		st,hs-current-trim = <15>;
+		st,hs-impedance-trim = <1>;
+		st,squelch-level = <3>;
+		st,hs-rx-offset = <2>;
+		st,no-lsfs-sc;
+	};
+
+
+
+	clocks {
+
+    clk_ext_camera: clk-ext-camera {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+
+		clk_lsi: clk-lsi {
+			clock-frequency = <32000>;
+		};
+
+		clk_hsi: clk-hsi {
+			clock-frequency = <64000000>;
+		};
+
+		clk_csi: clk-csi {
+			clock-frequency = <4000000>;
+		};
+
+		clk_lse: clk-lse {
+			clock-frequency = <32768>;
+		};
+
+		clk_hse: clk-hse {
+			clock-frequency = <24000000>;
+		};
+	};
+
+}; /*root*/
+
+&pinctrl {
+	u-boot,dm-pre-reloc;
+
+	dcmi_pins_mx: dcmi_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
+					 <STM32_PINMUX('A', 6, AF13)>, /* DCMI_PIXCLK */
+					 <STM32_PINMUX('A', 10, AF13)>, /* DCMI_D1 */
+					 <STM32_PINMUX('B', 9, AF13)>, /* DCMI_D7 */
+					 <STM32_PINMUX('C', 6, AF13)>, /* DCMI_D0 */
+					 <STM32_PINMUX('E', 0, AF13)>, /* DCMI_D2 */
+					 <STM32_PINMUX('E', 1, AF13)>, /* DCMI_D3 */
+					 <STM32_PINMUX('E', 4, AF13)>, /* DCMI_D4 */
+					 <STM32_PINMUX('E', 13, AF13)>, /* DCMI_D6 */
+					 <STM32_PINMUX('G', 9, AF13)>, /* DCMI_VSYNC */
+					 <STM32_PINMUX('H', 6, AF13)>, /* DCMI_D8 */
+					 <STM32_PINMUX('H', 7, AF13)>, /* DCMI_D9 */
+					 <STM32_PINMUX('H', 15, AF13)>, /* DCMI_D11 */
+					 <STM32_PINMUX('I', 3, AF13)>, /* DCMI_D10 */
+					 <STM32_PINMUX('I', 4, AF13)>; /* DCMI_D5 */
+			bias-disable;
+		};
+	};
+
+	dcmi_sleep_pins_mx: dcmi_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* DCMI_HSYNC */
+					 <STM32_PINMUX('A', 6, ANALOG)>, /* DCMI_PIXCLK */
+					 <STM32_PINMUX('A', 10, ANALOG)>, /* DCMI_D1 */
+					 <STM32_PINMUX('B', 9, ANALOG)>, /* DCMI_D7 */
+					 <STM32_PINMUX('C', 6, ANALOG)>, /* DCMI_D0 */
+					 <STM32_PINMUX('E', 0, ANALOG)>, /* DCMI_D2 */
+					 <STM32_PINMUX('E', 1, ANALOG)>, /* DCMI_D3 */
+					 <STM32_PINMUX('E', 4, ANALOG)>, /* DCMI_D4 */
+					 <STM32_PINMUX('E', 13, ANALOG)>, /* DCMI_D6 */
+					 <STM32_PINMUX('G', 9, ANALOG)>, /* DCMI_VSYNC */
+					 <STM32_PINMUX('H', 6, ANALOG)>, /* DCMI_D8 */
+					 <STM32_PINMUX('H', 7, ANALOG)>, /* DCMI_D9 */
+					 <STM32_PINMUX('H', 15, ANALOG)>, /* DCMI_D11 */
+					 <STM32_PINMUX('I', 3, ANALOG)>, /* DCMI_D10 */
+					 <STM32_PINMUX('I', 4, ANALOG)>; /* DCMI_D5 */
+		};
+	};
+
+	eth1_pins_mx: eth1_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 1, AF11)>, /* ETH1_RX_CLK */
+					 <STM32_PINMUX('A', 7, AF11)>, /* ETH1_RX_CTL */
+					 <STM32_PINMUX('B', 0, AF11)>, /* ETH1_RXD2 */
+					 <STM32_PINMUX('B', 1, AF11)>, /* ETH1_RXD3 */
+					 <STM32_PINMUX('C', 4, AF11)>, /* ETH1_RXD0 */
+					 <STM32_PINMUX('C', 5, AF11)>; /* ETH1_RXD1 */
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH1_MDIO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('B', 11, AF11)>, /* ETH1_TX_CTL */
+					 <STM32_PINMUX('C', 1, AF11)>, /* ETH1_MDC */
+					 <STM32_PINMUX('C', 2, AF11)>, /* ETH1_TXD2 */
+					 <STM32_PINMUX('E', 2, AF11)>, /* ETH1_TXD3 */
+					 <STM32_PINMUX('G', 4, AF11)>, /* ETH1_GTX_CLK */
+					 <STM32_PINMUX('G', 13, AF11)>, /* ETH1_TXD0 */
+					 <STM32_PINMUX('G', 14, AF11)>; /* ETH1_TXD1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	eth1_sleep_pins_mx: eth1_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 1, ANALOG)>, /* ETH1_RX_CLK */
+					 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH1_MDIO */
+					 <STM32_PINMUX('A', 7, ANALOG)>, /* ETH1_RX_CTL */
+					 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH1_RXD2 */
+					 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH1_RXD3 */
+					 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH1_TX_CTL */
+					 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH1_MDC */
+					 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH1_TXD2 */
+					 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH1_RXD0 */
+					 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH1_RXD1 */
+					 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH1_TXD3 */
+					 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH1_GTX_CLK */
+					 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_TXD0 */
+					 <STM32_PINMUX('G', 14, ANALOG)>; /* ETH1_TXD1 */
+		};
+	};
+
+	i2c1_pins_mx: i2c1_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
+			         <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_sleep_pins_mx: i2c1_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
+			         <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
+	i2c2_pins_mx: i2c2_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_mx: i2c2_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
+	i2c5_pins_mx: i2c5_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
+					 <STM32_PINMUX('A', 12, AF4)>; /* I2C5_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_sleep_pins_mx: i2c5_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 11, ANALOG)>, /* I2C5_SCL */
+					 <STM32_PINMUX('A', 12, ANALOG)>; /* I2C5_SDA */
+		};
+	};
+
+	i2s2_pins_mx: i2s2_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 12, AF5)>, /* I2S2_WS */
+					 <STM32_PINMUX('B', 13, AF5)>, /* I2S2_CK */
+					 <STM32_PINMUX('C', 3, AF5)>; /* I2S2_SDO */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	i2s2_sleep_pins_mx: i2s2_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 12, ANALOG)>, /* I2S2_WS */
+					 <STM32_PINMUX('B', 13, ANALOG)>, /* I2S2_CK */
+					 <STM32_PINMUX('C', 3, ANALOG)>; /* I2S2_SDO */
+		};
+	};
+
+	ltdc_pins_mx: ltdc_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 3, AF14)>, /* LTDC_B5 */
+					 <STM32_PINMUX('B', 8, AF14)>, /* LTDC_B6 */
+					 <STM32_PINMUX('C', 0, AF14)>, /* LTDC_R5 */
+					 <STM32_PINMUX('D', 8, AF14)>, /* LTDC_B7 */
+					 <STM32_PINMUX('D', 9, AF14)>, /* LTDC_B0 */
+					 <STM32_PINMUX('D', 10, AF14)>, /* LTDC_B3 */
+					 <STM32_PINMUX('E', 6, AF14)>, /* LTDC_G1 */
+					 <STM32_PINMUX('E', 12, AF14)>, /* LTDC_B4 */
+					 <STM32_PINMUX('E', 14, AF13)>, /* LTDC_G0 */
+					 <STM32_PINMUX('E', 15, AF14)>, /* LTDC_R7 */
+					 <STM32_PINMUX('F', 10, AF14)>, /* LTDC_DE */
+					 <STM32_PINMUX('G', 10, AF14)>, /* LTDC_B2 */
+					 <STM32_PINMUX('G', 12, AF14)>, /* LTDC_B1 */
+					 <STM32_PINMUX('H', 2, AF14)>, /* LTDC_R0 */
+					 <STM32_PINMUX('H', 3, AF14)>, /* LTDC_R1 */
+					 <STM32_PINMUX('H', 4, AF14)>, /* LTDC_G4 */
+					 <STM32_PINMUX('H', 8, AF14)>, /* LTDC_R2 */
+					 <STM32_PINMUX('H', 9, AF14)>, /* LTDC_R3 */
+					 <STM32_PINMUX('H', 10, AF14)>, /* LTDC_R4 */
+					 <STM32_PINMUX('H', 12, AF14)>, /* LTDC_R6 */
+					 <STM32_PINMUX('H', 13, AF14)>, /* LTDC_G2 */
+					 <STM32_PINMUX('H', 14, AF14)>, /* LTDC_G3 */
+					 <STM32_PINMUX('I', 0, AF14)>, /* LTDC_G5 */
+					 <STM32_PINMUX('I', 1, AF14)>, /* LTDC_G6 */
+					 <STM32_PINMUX('I', 2, AF14)>, /* LTDC_G7 */
+					<STM32_PINMUX('G', 7, AF14)>, /* LTDC_CLK */
+					 <STM32_PINMUX('I', 9, AF14)>, /* LTDC_VSYNC */
+					 <STM32_PINMUX('I', 10, AF14)>; /* LTDC_HSYNC */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	ltdc_sleep_pins_mx: ltdc_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* LTDC_B5 */
+					 <STM32_PINMUX('B', 8, ANALOG)>, /* LTDC_B6 */
+					 <STM32_PINMUX('C', 0, ANALOG)>, /* LTDC_R5 */
+					 <STM32_PINMUX('D', 8, ANALOG)>, /* LTDC_B7 */
+					 <STM32_PINMUX('D', 9, ANALOG)>, /* LTDC_B0 */
+					 <STM32_PINMUX('D', 10, ANALOG)>, /* LTDC_B3 */
+					 <STM32_PINMUX('E', 6, ANALOG)>, /* LTDC_G1 */
+					 <STM32_PINMUX('E', 12, ANALOG)>, /* LTDC_B4 */
+					 <STM32_PINMUX('E', 14, ANALOG)>, /* LTDC_G0 */
+					 <STM32_PINMUX('E', 15, ANALOG)>, /* LTDC_R7 */
+					 <STM32_PINMUX('F', 10, ANALOG)>, /* LTDC_DE */
+					 <STM32_PINMUX('G', 7, ANALOG)>, /* LTDC_CLK */
+					 <STM32_PINMUX('G', 10, ANALOG)>, /* LTDC_B2 */
+					 <STM32_PINMUX('G', 12, ANALOG)>, /* LTDC_B1 */
+					 <STM32_PINMUX('H', 2, ANALOG)>, /* LTDC_R0 */
+					 <STM32_PINMUX('H', 3, ANALOG)>, /* LTDC_R1 */
+					 <STM32_PINMUX('H', 4, ANALOG)>, /* LTDC_G4 */
+					 <STM32_PINMUX('H', 8, ANALOG)>, /* LTDC_R2 */
+					 <STM32_PINMUX('H', 9, ANALOG)>, /* LTDC_R3 */
+					 <STM32_PINMUX('H', 10, ANALOG)>, /* LTDC_R4 */
+					 <STM32_PINMUX('H', 12, ANALOG)>, /* LTDC_R6 */
+					 <STM32_PINMUX('H', 13, ANALOG)>, /* LTDC_G2 */
+					 <STM32_PINMUX('H', 14, ANALOG)>, /* LTDC_G3 */
+					 <STM32_PINMUX('I', 0, ANALOG)>, /* LTDC_G5 */
+					 <STM32_PINMUX('I', 1, ANALOG)>, /* LTDC_G6 */
+					 <STM32_PINMUX('I', 2, ANALOG)>, /* LTDC_G7 */
+					 <STM32_PINMUX('I', 9, ANALOG)>, /* LTDC_VSYNC */
+					 <STM32_PINMUX('I', 10, ANALOG)>; /* LTDC_HSYNC */
+		};
+	};
+
+	sdmmc1_pins_mx: sdmmc1_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+					 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+					 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+
+	sdmmc1_opendrain_pins_mx: sdmmc1_opendrain_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+					 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+		pins3 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <1>;
+		};
+	};
+
+	sdmmc1_sleep_pins_mx: sdmmc1_sleep_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
+					 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
+					 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
+					 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
+					 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
+					 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
+		};
+	};
+
+	sdmmc2_pins_mx: sdmmc2_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
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
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	sdmmc2_opendrain_pins_mx: sdmmc2_opendrain_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
+					 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
+					 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
+					 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
+					 <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
+					 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
+					 <STM32_PINMUX('C', 7, AF10)>, /* SDMMC2_D7 */
+					 <STM32_PINMUX('E', 5, AF9)>; /* SDMMC2_D6 */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
+			bias-pull-up;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+		pins3 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
+			bias-pull-up;
+			drive-open-drain;
+			slew-rate = <1>;
+		};
+	};
+
+	sdmmc2_sleep_pins_mx: sdmmc2_sleep_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
+					 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
+					 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
+					 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
+					 <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
+					 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
+					 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC2_D7 */
+					 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
+					 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
+					 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	sdmmc3_pins_mx: sdmmc3_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
+					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+					 <STM32_PINMUX('F', 1, AF9)>, /* SDMMC3_CMD */
+					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	sdmmc3_opendrain_pins_mx: sdmmc3_opendrain_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
+					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('F', 1, AF9)>; /* SDMMC3_CMD */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <1>;
+		};
+		pins3 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	sdmmc3_sleep_pins_mx: sdmmc3_sleep_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
+					 <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
+					 <STM32_PINMUX('F', 1, ANALOG)>, /* SDMMC3_CMD */
+					 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
+					 <STM32_PINMUX('F', 5, ANALOG)>, /* SDMMC3_D2 */
+					 <STM32_PINMUX('G', 15, ANALOG)>; /* SDMMC3_CK */
+		};
+	};
+
+	spi5_pins_mx: spi5_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 7, AF5)>, /* SPI5_SCK */
+					 <STM32_PINMUX('F', 8, AF5)>, /* SPI5_MISO */
+					 <STM32_PINMUX('F', 9, AF5)>; /* SPI5_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	spi5_sleep_pins_mx: spi5_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 7, ANALOG)>, /* SPI5_SCK */
+					 <STM32_PINMUX('F', 8, ANALOG)>, /* SPI5_MISO */
+					 <STM32_PINMUX('F', 9, ANALOG)>; /* SPI5_MOSI */
+		};
+	};
+
+	tim5_pwm_pins_mx: tim5_pwm_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, AF2)>; /* TIM5_CH2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	tim5_pwm_sleep_pins_mx: tim5_pwm_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, ANALOG)>; /* TIM5_CH2 */
+		};
+	};
+
+	uart4_pins_mx: uart4_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+		pins2 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	uart4_sleep_pins_mx: uart4_sleep_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('B', 2, ANALOG)>, /* UART4_RX */
+					 <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
+		};
+	};
+
+	usart2_pins_mx: usart2_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 3, AF7)>, /* USART2_CTS */
+				 <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 4, AF7)>, /* USART2_RTS */
+			         <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	usart2_idle_pins_mx: usart2_sleep_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 3, ANALOG)>; /* USART2_CTS_NSS */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_mx: usart2_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 3, ANALOG)>, /* USART2_CTS */
+				 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
+				 <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('D', 6, ANALOG)>; /* USART2_RX */
+		};
+	};
+
+	m_can1_pins_mx: m_can1_sleep_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 1, AF9)>; /* CAN1_TX */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('D', 0, AF9)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	m_can1_sleep_pins_mx: m_can1_sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('D', 0, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
+
+
+	stusb1600_pins_mx: stusb1600_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 8, ANALOG)>;
+			bias-pull-up;
+		};
+	};
+
+};
+
+&pinctrl_z {
+	u-boot,dm-pre-reloc;
+
+	i2c2_pins_z_mx: i2c2_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 6, AF3)>; /* I2C2_SCL */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_z_mx: i2c2_sleep_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 6, ANALOG)>; /* I2C2_SCL */
+		};
+	};
+
+	i2c4_pins_z_mx: i2c4_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
+					 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c4_sleep_pins_z_mx: i2c4_sleep_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
+					 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
+		};
+	};
+
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	interrupt-names = "wdg";
+	wakeup-source;
+	recovery;
+	status = "okay";
+};
+
+&bsec{
+	status = "okay";
+
+};
+
+&dcmi{
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_mx>;
+	pinctrl-1 = <&dcmi_sleep_pins_mx>;
+	status = "okay";
+
+
+
+  	port {
+		dcmi_0: endpoint {
+			remote-endpoint = <&ov5640_0>;
+			bus-width = <8>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pclk-sample = <1>;
+			pclk-max-frequency = <77000000>;
+		};
+	};
+
+};
+
+&dsi{
+	status = "okay";
+
+  #address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi_in: endpoint {
+				remote-endpoint = <&ltdc_ep1_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+
+	panel@0 {
+		compatible = "orisetech,otm8009a";
+		reg = <0>;
+		reset-gpios = <&gpioe 9 GPIO_ACTIVE_LOW>;
+		power-supply = <&v3v3>;
+		status = "okay";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+
+};
+
+&ethernet0{
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth1_pins_mx>;
+	pinctrl-1 = <&eth1_sleep_pins_mx>;
+	status = "okay";
+
+
+  st,eth_clk_sel = <1>;
+  phy-mode = "rgmii-id";
+	max-speed = <1000>;
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <3>;
+		};
+	};
+
+};
+
+&gpu{
+	status = "okay";
+
+
+	contiguous-area = <&gpu_reserved>;
+
+};
+
+&hsem{
+	status = "okay";
+
+};
+
+&i2c1{
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_mx>;
+	pinctrl-1 = <&i2c1_sleep_pins_mx>;
+	status = "okay";
+
+
+
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+
+	touchscreen@2a {
+		compatible = "focaltech,ft6236";
+		reg = <0x2a>;
+		interrupts = <2 2>;
+		interrupt-parent = <&gpiof>;
+		interrupt-controller;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		status = "okay";
+	};
+	touchscreen@38 {
+		compatible = "focaltech,ft6336";
+		reg = <0x38>;
+		interrupts = <2 2>;
+		interrupt-parent = <&gpiof>;
+		interrupt-controller;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+		status = "okay";
+	};
+	hdmi-transmitter@39 {
+		compatible = "sil,sii9022";
+		reg = <0x39>;
+		reset-gpios = <&gpiog 0 GPIO_ACTIVE_LOW>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpiog>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&ltdc_pins_mx>;
+		pinctrl-1 = <&ltdc_sleep_pins_mx>;
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sii9022_in: endpoint {
+					remote-endpoint = <&ltdc_ep0_out>;
+				};
+			};
+
+      port@1 {
+        reg = <1>;
+        sii9022_tx_endpoint: endpoint {
+          remote-endpoint = <&i2s2_endpoint>;
+        };
+      };
+		};
+	};
+
+};
+
+&i2c2{
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_mx &i2c2_pins_z_mx>;
+	pinctrl-1 = <&i2c2_sleep_pins_mx &i2c2_sleep_pins_z_mx>;
+	status = "okay";
+
+  	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+  	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ext_camera>;
+		clock-names = "xclk";
+		DOVDD-supply = <&v3v3>;
+		rotation = <180>;
+		status = "okay";
+
+		port {
+			ov5640_0: endpoint {
+				remote-endpoint = <&dcmi_0>;
+				bus-width = <8>;
+				data-shift = <2>; /* lines 9:2 are used */
+				hsync-active = <0>;
+				vsync-active = <0>;
+				pclk-sample = <1>;
+				pclk-max-frequency = <77000000>;
+			};
+		};
+	};
+
+};
+
+&i2c4{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c4_pins_z_mx>;
+	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
+	status = "okay";
+
+
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	typec: stusb1600@28 {
+		compatible = "st,stusb1600";
+		reg = <0x28>;
+		interrupt-parent = <&gpioe>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&stusb1600_pins_mx>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			power-opmode = "default";
+		};
+	};
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		st,main-control-register = <0x04>;
+		st,vin-control-register = <0xc0>;
+		st,usb-control-register = <0x20>;
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+
+			ldo1-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo6-supply = <&v3v3>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_ldo1: ldo1 {
+				regulator-name = "v1v8_ldo1";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+
+			};
+
+			v2v8_ldo2: ldo2 {			//custom
+				regulator-name = "v2v8_ldo2";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				interrupts = <IT_CURLIM_LDO4 0>;
+			};
+
+                        v3v3_eth: ldo5 {
+				regulator-name = "v3v3_eth";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v3v3_dsi: ldo6 {
+				regulator-name = "v3v3_dsi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+      bst_out: boost {
+       regulator-name = "bst_out";
+       interrupts = <IT_OCP_BOOST 0>;
+       regulator-always-on;
+      };
+
+     vbus_otg: pwr_sw1 {
+       regulator-name = "vbus_otg";
+       interrupts = <IT_OCP_OTG 0>;
+       regulator-active-discharge;
+       regulator-always-on;
+      };
+
+      vbus_sw: pwr_sw2 {
+       regulator-name = "vbus_sw";
+       interrupts = <IT_OCP_SWOUT 0>;
+       regulator-active-discharge;
+       regulator-always-on;
+      };
+		};
+
+		onkey {
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+};
+
+&i2c5{
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c5_pins_mx>;
+	pinctrl-1 = <&i2c5_sleep_pins_mx>;
+	status = "okay";
+
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+};
+
+&i2s2{
+  clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+  clock-names = "pclk", "i2sclk", "x8k", "x11k";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2s2_pins_mx>;
+	pinctrl-1 = <&i2s2_sleep_pins_mx>;
+	status = "okay";
+
+  i2s2_port: port {
+		i2s2_endpoint: endpoint {
+			remote-endpoint = <&sii9022_tx_endpoint>;
+			format = "i2s";
+			mclk-fs = <256>;
+		};
+	};
+
+};
+
+&ipcc{
+	status = "okay";
+
+};
+
+&iwdg2{
+	status = "okay";
+
+
+	timeout-sec = <32>;
+
+};
+
+&ltdc{
+
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&sii9022_in>;
+		};
+
+		ltdc_ep1_out: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&dsi_in>;
+		};
+
+	};
+
+};
+
+&pwr{
+	status = "okay";
+
+
+	pwr-regulators {
+		vdd-supply = <&vdd>;
+		vdd_3v3_usbfs-supply = <&vdd_usb>;
+	};
+
+};
+
+&rcc{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+
+};
+
+&rng1{
+	status = "okay";
+
+};
+
+&rtc{
+	status = "okay";
+	st,lsco = <RTC_OUT2_RMP>;
+};
+
+&sdmmc1{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_pins_mx>;
+	pinctrl-1 = <&sdmmc1_opendrain_pins_mx>;
+	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
+	status = "okay";
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+
+};
+
+&sdmmc2{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_pins_mx>;
+	pinctrl-1 = <&sdmmc2_opendrain_pins_mx>;
+	pinctrl-2 = <&sdmmc2_sleep_pins_mx>;
+	status = "okay";
+        non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&v3v3>;
+	vqmmc-supply = <&v3v3>;
+	mmc-ddr-3_3v;
+
+};
+
+&sdmmc3{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc3_pins_mx>;
+	pinctrl-1 = <&sdmmc3_opendrain_pins_mx>;
+	pinctrl-2 = <&sdmmc3_sleep_pins_mx>;
+	status = "okay";
+
+
+	arm,primecell-periphid = <0x10153180>;
+	non-removable;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	keep-power-in-suspend;
+	status = "okay";
+
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		status = "okay";
+	};
+
+};
+
+&tamp{
+	status = "okay";
+
+};
+
+&timers5 {
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+	pwm {
+		pinctrl-0 = <&tim5_pwm_pins_mx>;
+		pinctrl-1 = <&tim5_pwm_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+	timer@4 {
+		status = "okay";
+	};
+};
+
+&uart4{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&uart4_pins_mx>;
+	pinctrl-1 = <&uart4_sleep_pins_mx>;
+	status = "okay";
+
+};
+
+&usart2{
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_mx>;
+	pinctrl-1 = <&usart2_sleep_pins_mx>;
+	pinctrl-2 = <&usart2_idle_pins_mx>;
+	st,hw-flow-ctrl;
+	status = "okay";
+
+	bluetooth {
+		shutdown-gpios = <&gpioe 10 GPIO_ACTIVE_HIGH>;
+		compatible = "brcm,bcm43438-bt";
+		max-speed = <3000000>;
+	};
+};
+
+
+&m4_rproc {
+memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+		<&vdev0vring1>, <&vdev0buffer>;
+};
+
+&dma1 {
+	sram = <&dma_pool>;
+};
+
+&dma2 {
+	sram = <&dma_pool>;
+};
+
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
+};
+
+&usbh_ohci{
+  phys = <&usbphyc_port0>;
+  phy-names = "usb";
+  status = "okay";
+};
+
+&usbotg_hs {
+	extcon = <&typec>;
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usbphyc {
+	vdd3v3-supply = <&vdd_usb>;
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	st,phy-tuning = <&usb_phy_tuning>;
+};
+
+&usbphyc_port1 {
+	st,phy-tuning = <&usb_phy_tuning>;
+};
+
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
+// WARNING: Do not try to enable DAC1 and DCMI
+// This devices share the same pin PA4
+&dac {
+	pinctrl-names = "default";
+	vref-supply = <&vrefbuf>;
+	status = "okay";
+	dac1: dac@1 {
+		pinctrl-0 = <&dac_ch1_pins_a>;
+		status = "disabled";
+	};
+	dac2: dac@2 {
+		pinctrl-0 = <&dac_ch2_pins_a>;
+		status = "okay";
+	};
+};
+
+&adc {
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdd>;
+	vref-supply = <&v3v3_eth>;
+	status = "okay";
+	adc1: adc@0 {
+		st,adc-channels = <0 1>; //ANA0 ANA1
+		status = "okay";
+	};
+	adc2: adc@100 {
+		//st,adc-channels = <0 1 2 6 12 18 19>;
+		status = "okay";
+	};
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_mx>;
+	pinctrl-1 = <&m_can1_sleep_pins_mx>;
+	status = "okay";
+};
diff --git a/board/octavo/red/linux-dts/stm32mp157c-osd32mp1-red.dtsi b/board/octavo/red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
new file mode 100644
index 0000000000..b1e6303950
--- /dev/null
+++ b/board/octavo/red/linux-dts/stm32mp157c-osd32mp1-red.dtsi
@@ -0,0 +1,2077 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*//
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/stm32mp1-clks.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/stm32mp1-resets.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <0>;
+			clocks = <&rcc CK_MPU>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			nvmem-cells = <&part_number_otp>;
+			nvmem-cell-names = "part_number";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a7";
+			device_type = "cpu";
+			reg = <1>;
+			clocks = <&rcc CK_MPU>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	cpu0_opp_table: cpu0-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			opp-microvolt = <1200000>;
+			opp-supported-hw = <0x1>;
+		};
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <1350000>;
+			opp-supported-hw = <0x2>;
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+		interrupt-parent = <&intc>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	intc: interrupt-controller@a0021000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0xa0021000 0x1000>,
+		      <0xa0022000 0x2000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupt-parent = <&intc>;
+		always-on;
+	};
+
+	clocks {
+		clk_hse: clk-hse {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		clk_hsi: clk-hsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <64000000>;
+		};
+
+		clk_lse: clk-lse {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
+
+		clk_lsi: clk-lsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+		};
+
+		clk_csi: clk-csi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <4000000>;
+		};
+
+		clk_i2s_ckin: i2s_ckin {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		clk_dsi_phy: ck_dsi_phy {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+	};
+
+	pm_domain {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "st,stm32mp157c-pd";
+
+		pd_core_ret: core-ret-power-domain@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			#power-domain-cells = <0>;
+			label = "CORE-RETENTION";
+
+			pd_core: core-power-domain@2 {
+				reg = <2>;
+				#power-domain-cells = <0>;
+				label = "CORE";
+			};
+		};
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&dts>;
+
+			trips {
+				cpu-crit {
+					temperature = <120000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+			};
+		};
+	};
+
+	reboot {
+		compatible = "syscon-reboot";
+		regmap = <&rcc>;
+		offset = <0x404>;
+		mask = <0x1>;
+	};
+
+	replicator {
+		/*
+		 * non-configurable replicators don't show up on the
+		 * AMBA bus.  As such no need to add "arm,primecell"
+		 */
+		compatible = "arm,coresight-replicator";
+		clocks = <&rcc CK_TRACE>;
+		clock-names = "apb_pclk";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* replicator output ports */
+			port@0 {
+				reg = <0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&funnel_in_port4>;
+				};
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&intc>;
+		ranges;
+
+		timers2: timer@40000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40000000 0x400>;
+			clocks = <&rcc TIM2_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 18 0x400 0x5>,
+			       <&dmamux1 19 0x400 0x5>,
+			       <&dmamux1 20 0x400 0x5>,
+			       <&dmamux1 21 0x400 0x5>,
+			       <&dmamux1 22 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@1 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <1>;
+				status = "disabled";
+			};
+		};
+
+		timers3: timer@40001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40001000 0x400>;
+			clocks = <&rcc TIM3_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 23 0x400 0x5>,
+			       <&dmamux1 24 0x400 0x5>,
+			       <&dmamux1 25 0x400 0x5>,
+			       <&dmamux1 26 0x400 0x5>,
+			       <&dmamux1 27 0x400 0x5>,
+			       <&dmamux1 28 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@2 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <2>;
+				status = "disabled";
+			};
+		};
+
+		timers4: timer@40002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40002000 0x400>;
+			clocks = <&rcc TIM4_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 29 0x400 0x5>,
+			       <&dmamux1 30 0x400 0x5>,
+			       <&dmamux1 31 0x400 0x5>,
+			       <&dmamux1 32 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@3 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <3>;
+				status = "disabled";
+			};
+		};
+
+		timers5: timer@40003000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40003000 0x400>;
+			clocks = <&rcc TIM5_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 55 0x400 0x5>,
+			       <&dmamux1 56 0x400 0x5>,
+			       <&dmamux1 57 0x400 0x5>,
+			       <&dmamux1 58 0x400 0x5>,
+			       <&dmamux1 59 0x400 0x5>,
+			       <&dmamux1 60 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4", "up", "trig";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@4 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+
+		timers6: timer@40004000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40004000 0x400>;
+			clocks = <&rcc TIM6_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 69 0x400 0x5>;
+			dma-names = "up";
+			status = "disabled";
+
+			timer@5 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <5>;
+				status = "disabled";
+			};
+		};
+
+		timers7: timer@40005000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40005000 0x400>;
+			clocks = <&rcc TIM7_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 70 0x400 0x5>;
+			dma-names = "up";
+			status = "disabled";
+
+			timer@6 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <6>;
+				status = "disabled";
+			};
+		};
+
+		timers12: timer@40006000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40006000 0x400>;
+			clocks = <&rcc TIM12_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@11 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <11>;
+				status = "disabled";
+			};
+		};
+
+		timers13: timer@40007000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40007000 0x400>;
+			clocks = <&rcc TIM13_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@12 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <12>;
+				status = "disabled";
+			};
+		};
+
+		timers14: timer@40008000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x40008000 0x400>;
+			clocks = <&rcc TIM14_K>;
+			clock-names = "int";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@13 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <13>;
+				status = "disabled";
+			};
+		};
+
+		lptimer1: timer@40009000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x40009000 0x400>;
+			clocks = <&rcc LPTIM1_K>;
+			clock-names = "mux";
+			power-domains = <&pd_core>;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@0 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+		};
+
+		spi2: spi@4000b000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x4000b000 0x400>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI2_K>;
+			resets = <&rcc SPI2_R>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		i2s2: audio-controller@4000b000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000b000 0x400>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 39 0x400 0x01>,
+			       <&dmamux1 40 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi3: spi@4000c000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x4000c000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI3_K>;
+			resets = <&rcc SPI3_R>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		i2s3: audio-controller@4000c000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x4000c000 0x400>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 61 0x400 0x01>,
+			       <&dmamux1 62 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spdifrx: audio-controller@4000d000 {
+			compatible = "st,stm32h7-spdifrx";
+			#sound-dai-cells = <0>;
+			reg = <0x4000d000 0x400>;
+			clocks = <&rcc SPDIF_K>;
+			clock-names = "kclk";
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 93 0x400 0x01>,
+			       <&dmamux1 94 0x400 0x01>;
+			dma-names = "rx", "rx-ctrl";
+			status = "disabled";
+		};
+
+		usart2: serial@4000e000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4000e000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 27 1>;
+			clocks = <&rcc USART2_K>;
+			resets = <&rcc USART2_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 43 0x400 0x21>,
+			       <&dmamux1 44 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		usart3: serial@4000f000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x4000f000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 28 1>;
+			clocks = <&rcc USART3_K>;
+			resets = <&rcc USART3_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 45 0x400 0x21>,
+			       <&dmamux1 46 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart4: serial@40010000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40010000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 30 1>;
+			clocks = <&rcc UART4_K>;
+			resets = <&rcc UART4_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 63 0x400 0x21>,
+			       <&dmamux1 64 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart5: serial@40011000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40011000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 31 1>;
+			clocks = <&rcc UART5_K>;
+			resets = <&rcc UART5_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 65 0x400 0x21>,
+			       <&dmamux1 66 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2c1: i2c@40012000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x40012000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 21 1>;
+			clocks = <&rcc I2C1_K>;
+			resets = <&rcc I2C1_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 33 0x400 0x05>,
+			       <&dmamux1 34 0x400 0x05>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x1>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@40013000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x40013000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 22 1>;
+			clocks = <&rcc I2C2_K>;
+			resets = <&rcc I2C2_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 35 0x400 0x05>,
+			       <&dmamux1 36 0x400 0x05>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x2>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x2>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@40014000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x40014000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 23 1>;
+			clocks = <&rcc I2C3_K>;
+			resets = <&rcc I2C3_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 73 0x400 0x05>,
+			       <&dmamux1 74 0x400 0x05>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x4>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x4>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@40015000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x40015000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 25 1>;
+			clocks = <&rcc I2C5_K>;
+			resets = <&rcc I2C5_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&dmamux1 115 0x400 0x05>,
+			       <&dmamux1 116 0x400 0x05>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x10>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x10>;
+			status = "disabled";
+		};
+
+		cec: cec@40016000 {
+			compatible = "st,stm32-cec";
+			reg = <0x40016000 0x400>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CEC_K>, <&rcc CEC>;
+			clock-names = "cec", "hdmi-cec";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		dac: dac@40017000 {
+			compatible = "st,stm32h7-dac-core";
+			reg = <0x40017000 0x400>;
+			clocks = <&rcc DAC12>;
+			clock-names = "pclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			dac1: dac@1 {
+				compatible = "st,stm32-dac";
+				#io-channels-cells = <1>;
+				reg = <1>;
+				status = "disabled";
+			};
+
+			dac2: dac@2 {
+				compatible = "st,stm32-dac";
+				#io-channels-cells = <1>;
+				reg = <2>;
+				status = "disabled";
+			};
+		};
+
+		uart7: serial@40018000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40018000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 32 1>;
+			clocks = <&rcc UART7_K>;
+			resets = <&rcc UART7_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 79 0x400 0x21>,
+			       <&dmamux1 80 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		uart8: serial@40019000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x40019000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 33 1>;
+			clocks = <&rcc UART8_K>;
+			resets = <&rcc UART8_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 81 0x400 0x21>,
+			       <&dmamux1 82 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		timers1: timer@44000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44000000 0x400>;
+			clocks = <&rcc TIM1_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 11 0x400 0x5>,
+			       <&dmamux1 12 0x400 0x5>,
+			       <&dmamux1 13 0x400 0x5>,
+			       <&dmamux1 14 0x400 0x5>,
+			       <&dmamux1 15 0x400 0x5>,
+			       <&dmamux1 16 0x400 0x5>,
+			       <&dmamux1 17 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@0 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <0>;
+				status = "disabled";
+			};
+		};
+
+		timers8: timer@44001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44001000 0x400>;
+			clocks = <&rcc TIM8_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 47 0x400 0x5>,
+			       <&dmamux1 48 0x400 0x5>,
+			       <&dmamux1 49 0x400 0x5>,
+			       <&dmamux1 50 0x400 0x5>,
+			       <&dmamux1 51 0x400 0x5>,
+			       <&dmamux1 52 0x400 0x5>,
+			       <&dmamux1 53 0x400 0x5>;
+			dma-names = "ch1", "ch2", "ch3", "ch4",
+				    "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@7 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <7>;
+				status = "disabled";
+			};
+		};
+
+		usart6: serial@44003000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x44003000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 29 1>;
+			clocks = <&rcc USART6_K>;
+			resets = <&rcc USART6_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			dmas = <&dmamux1 71 0x400 0x21>,
+			       <&dmamux1 72 0x400 0x1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi1: spi@44004000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x44004000 0x400>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI1_K>;
+			resets = <&rcc SPI1_R>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		i2s1: audio-controller@44004000 {
+			compatible = "st,stm32h7-i2s";
+			#sound-dai-cells = <0>;
+			reg = <0x44004000 0x400>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmamux1 37 0x400 0x01>,
+			       <&dmamux1 38 0x400 0x01>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		spi4: spi@44005000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x44005000 0x400>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI4_K>;
+			resets = <&rcc SPI4_R>;
+			dmas = <&dmamux1 83 0x400 0x01>,
+			       <&dmamux1 84 0x400 0x01>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		timers15: timer@44006000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44006000 0x400>;
+			clocks = <&rcc TIM15_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 105 0x400 0x5>,
+			       <&dmamux1 106 0x400 0x5>,
+			       <&dmamux1 107 0x400 0x5>,
+			       <&dmamux1 108 0x400 0x5>;
+			dma-names = "ch1", "up", "trig", "com";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@14 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <14>;
+				status = "disabled";
+			};
+		};
+
+		timers16: timer@44007000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44007000 0x400>;
+			clocks = <&rcc TIM16_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 109 0x400 0x5>,
+			       <&dmamux1 110 0x400 0x5>;
+			dma-names = "ch1", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+			timer@15 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <15>;
+				status = "disabled";
+			};
+		};
+
+		timers17: timer@44008000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-timers";
+			reg = <0x44008000 0x400>;
+			clocks = <&rcc TIM17_K>;
+			clock-names = "int";
+			dmas = <&dmamux1 111 0x400 0x5>,
+			       <&dmamux1 112 0x400 0x5>;
+			dma-names = "ch1", "up";
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			timer@16 {
+				compatible = "st,stm32h7-timer-trigger";
+				reg = <16>;
+				status = "disabled";
+			};
+		};
+
+		spi5: spi@44009000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x44009000 0x400>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI5_K>;
+			resets = <&rcc SPI5_R>;
+			dmas = <&dmamux1 85 0x400 0x01>,
+			       <&dmamux1 86 0x400 0x01>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		sai1: sai@4400a000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400a000 0x400>;
+			reg = <0x4400a000 0x4>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI1_R>;
+			status = "disabled";
+
+			sai1a: audio-controller@4400a004 {
+				#sound-dai-cells = <0>;
+
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 87 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai1b: audio-controller@4400a024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI1_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 88 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai2: sai@4400b000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400b000 0x400>;
+			reg = <0x4400b000 0x4>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI2_R>;
+			status = "disabled";
+
+			sai2a: audio-controller@4400b004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x4 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 89 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai2b: audio-controller@4400b024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI2_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 90 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		sai3: sai@4400c000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x4400c000 0x400>;
+			reg = <0x4400c000 0x4>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI3_R>;
+			status = "disabled";
+
+			sai3a: audio-controller@4400c004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 113 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai3b: audio-controller@4400c024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI3_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 114 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		dfsdm: dfsdm@4400d000 {
+			compatible = "st,stm32mp1-dfsdm";
+			reg = <0x4400d000 0x800>;
+			clocks = <&rcc DFSDM_K>;
+			clock-names = "dfsdm";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			dfsdm0: filter@0 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <0>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 101 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm1: filter@1 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <1>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 102 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm2: filter@2 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <2>;
+				interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 103 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm3: filter@3 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <3>;
+				interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 104 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm4: filter@4 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <4>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 91 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			dfsdm5: filter@5 {
+				compatible = "st,stm32-dfsdm-adc";
+				#io-channel-cells = <1>;
+				reg = <5>;
+				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dmamux1 92 0x400 0x01>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+		};
+
+		m_can1: can@4400e000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400e000 0x400>, <0x44011000 0x1400>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc FDCAN>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+
+		m_can2: can@4400f000 {
+			compatible = "bosch,m_can";
+			reg = <0x4400f000 0x400>, <0x44011000 0x2800>;
+			reg-names = "m_can", "message_ram";
+			interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "int0", "int1";
+			clocks = <&rcc FDCAN>, <&rcc FDCAN_K>;
+			clock-names = "hclk", "cclk";
+			bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
+			status = "disabled";
+		};
+
+		dma1: dma@48000000 {
+			compatible = "st,stm32-dma";
+			reg = <0x48000000 0x400>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc DMA1>;
+			resets = <&rcc DMA1_R>;
+			#dma-cells = <4>;
+			st,mem2mem;
+			dma-requests = <8>;
+			dmas = <&mdma1 0 0x3 0x1200000a 0x48000008 0x00000020 1>,
+			       <&mdma1 1 0x3 0x1200000a 0x48000008 0x00000800 1>,
+			       <&mdma1 2 0x3 0x1200000a 0x48000008 0x00200000 1>,
+			       <&mdma1 3 0x3 0x1200000a 0x48000008 0x08000000 1>,
+			       <&mdma1 4 0x3 0x1200000a 0x4800000C 0x00000020 1>,
+			       <&mdma1 5 0x3 0x1200000a 0x4800000C 0x00000800 1>,
+			       <&mdma1 6 0x3 0x1200000a 0x4800000C 0x00200000 1>,
+			       <&mdma1 7 0x3 0x1200000a 0x4800000C 0x08000000 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3", "ch4", "ch5", "ch6", "ch7";
+		};
+
+		dma2: dma@48001000 {
+			compatible = "st,stm32-dma";
+			reg = <0x48001000 0x400>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc DMA2>;
+			resets = <&rcc DMA2_R>;
+			#dma-cells = <4>;
+			st,mem2mem;
+			dma-requests = <8>;
+			dmas = <&mdma1 8 0x3 0x1200000a 0x48001008 0x00000020 1>,
+			       <&mdma1 9 0x3 0x1200000a 0x48001008 0x00000800 1>,
+			       <&mdma1 10 0x3 0x1200000a 0x48001008 0x00200000 1>,
+			       <&mdma1 11 0x3 0x1200000a 0x48001008 0x08000000 1>,
+			       <&mdma1 12 0x3 0x1200000a 0x4800100C 0x00000020 1>,
+			       <&mdma1 13 0x3 0x1200000a 0x4800100C 0x00000800 1>,
+			       <&mdma1 14 0x3 0x1200000a 0x4800100C 0x00200000 1>,
+			       <&mdma1 15 0x3 0x1200000a 0x4800100C 0x08000000 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3", "ch4", "ch5", "ch6", "ch7";
+		};
+
+		dmamux1: dma-router@48002000 {
+			compatible = "st,stm32h7-dmamux";
+			reg = <0x48002000 0x1c>;
+			#dma-cells = <3>;
+			dma-requests = <128>;
+			dma-masters = <&dma1 &dma2>;
+			dma-channels = <16>;
+			clocks = <&rcc DMAMUX>;
+			resets = <&rcc DMAMUX_R>;
+		};
+
+		adc: adc@48003000 {
+			compatible = "st,stm32mp1-adc-core";
+			reg = <0x48003000 0x400>;
+			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc ADC12>, <&rcc ADC12_K>;
+			clock-names = "bus", "adc";
+			interrupt-controller;
+			st,syscfg-vbooster = <&syscfg 0x4 0x100>;
+			st,syscfg-vbooster-clr = <&syscfg 0x44 0x100>;
+			st,syscfg-anaswvdd = <&syscfg 0x4 0x200>;
+			st,syscfg-anaswvdd-clr = <&syscfg 0x44 0x200>;
+			#interrupt-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			adc1: adc@0 {
+				compatible = "st,stm32mp1-adc";
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				interrupt-parent = <&adc>;
+				interrupts = <0>;
+				dmas = <&dmamux1 9 0x400 0x05>;
+				dma-names = "rx";
+				status = "disabled";
+			};
+
+			adc2: adc@100 {
+				compatible = "st,stm32mp1-adc";
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				interrupt-parent = <&adc>;
+				interrupts = <1>;
+				dmas = <&dmamux1 10 0x400 0x05>;
+				dma-names = "rx";
+				/* temperature sensor */
+				st,adc-channels = <12>;
+				st,min-sample-time-nsecs = <10000>;
+				status = "disabled";
+			};
+
+			jadc1: jadc@0 {
+				compatible = "st,stm32mp1-adc";
+				st,injected;
+				#io-channel-cells = <1>;
+				reg = <0x0>;
+				interrupt-parent = <&adc>;
+				interrupts = <3>;
+				status = "disabled";
+			};
+
+			jadc2: jadc@100 {
+				compatible = "st,stm32mp1-adc";
+				st,injected;
+				#io-channel-cells = <1>;
+				reg = <0x100>;
+				interrupt-parent = <&adc>;
+				interrupts = <4>;
+				/* temperature sensor */
+				st,adc-channels = <12>;
+				st,min-sample-time-nsecs = <10000>;
+				status = "disabled";
+			};
+
+			adc_temp: temp {
+				compatible = "st,stm32mp1-adc-temp";
+				io-channels = <&adc2 12>;
+				nvmem-cells = <&ts_cal1>, <&ts_cal2>;
+				nvmem-cell-names = "ts_cal1", "ts_cal2";
+				#io-channel-cells = <0>;
+				#thermal-sensor-cells = <0>;
+				status = "disabled";
+			};
+		};
+
+		sdmmc3: sdmmc@48004000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00253180>;
+			reg = <0x48004000 0x400>, <0x48005000 0x400>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&rcc SDMMC3_K>;
+			clock-names = "apb_pclk";
+			resets = <&rcc SDMMC3_R>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+			status = "disabled";
+		};
+
+		usbotg_hs: usb-otg@49000000 {
+			compatible = "st,stm32mp1-hsotg", "snps,dwc2";
+			reg = <0x49000000 0x10000>;
+			clocks = <&rcc USBO_K>;
+			clock-names = "otg";
+			resets = <&rcc USBO_R>;
+			reset-names = "dwc2";
+			interrupts-extended = <&intc GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 44 1>;
+			interrupt-names = "event", "wakeup";
+			g-rx-fifo-size = <256>;
+			g-np-tx-fifo-size = <32>;
+			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
+			dr_mode = "otg";
+			usb33d-supply = <&usb33>;
+			power-domains = <&pd_core>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		hsem: hwspinlock@4c000000 {
+			compatible = "st,stm32-hwspinlock";
+			#hwlock-cells = <1>;
+			reg = <0x4c000000 0x400>;
+			clocks = <&rcc HSEM>;
+			clock-names = "hsem";
+			status = "okay";
+		};
+
+		ipcc: mailbox@4c001000 {
+			compatible = "st,stm32mp1-ipcc";
+			#mbox-cells = <1>;
+			reg = <0x4c001000 0x400>;
+			st,proc-id = <0>;
+			interrupts-extended =
+				<&intc GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				<&intc GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				<&exti 61 1>;
+			interrupt-names = "rx", "tx", "wakeup";
+			clocks = <&rcc IPCC>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		dcmi: dcmi@4c006000 {
+			compatible = "st,stm32-dcmi";
+			reg = <0x4c006000 0x400>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc CAMITF_R>;
+			clocks = <&rcc DCMI>;
+			clock-names = "mclk";
+			dmas = <&dmamux1 75 0x400 0x1d>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
+		rcc: rcc@50000000 {
+			compatible = "st,stm32mp1-rcc", "syscon";
+			reg = <0x50000000 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pwr: pwr@50001000 {
+			compatible = "st,stm32mp1-pwr", "syscon", "simple-mfd";
+			reg = <0x50001000 0x400>;
+
+			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			wakeup-gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>,
+				       <&gpioa 2 GPIO_ACTIVE_HIGH>,
+				       <&gpioc 13 GPIO_ACTIVE_HIGH>,
+				       <&gpioi 8 GPIO_ACTIVE_HIGH>,
+				       <&gpioi 11 GPIO_ACTIVE_HIGH>,
+				       <&gpioc 1 GPIO_ACTIVE_HIGH>;
+
+			pwr-regulators {
+				compatible = "st,stm32mp1,pwr-reg";
+				st,tzcr = <&rcc 0x0 0x1>;
+
+				reg11: reg11 {
+					regulator-name = "reg11";
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+				};
+
+				reg18: reg18 {
+					regulator-name = "reg18";
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				usb33: usb33 {
+					regulator-name = "usb33";
+					regulator-min-microvolt = <3300000>;
+					regulator-max-microvolt = <3300000>;
+				};
+			};
+		};
+
+		exti: interrupt-controller@5000d000 {
+			compatible = "st,stm32mp1-exti", "syscon";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			reg = <0x5000d000 0x400>;
+			hwlocks = <&hsem 1>;
+
+			/* exti_pwr is an extra interrupt controller used for
+			 * EXTI 55 to 60. It's mapped on pwr interrupt
+			 * controller.
+			 */
+			exti_pwr: exti-pwr {
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&pwr>;
+				st,irq-number = <6>;
+			};
+		};
+
+		syscfg: syscon@50020000 {
+			compatible = "st,stm32mp157-syscfg", "syscon";
+			reg = <0x50020000 0x400>;
+			clocks = <&rcc SYSCFG>;
+		};
+
+		lptimer2: timer@50021000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x50021000 0x400>;
+			clocks = <&rcc LPTIM2_K>;
+			clock-names = "mux";
+			power-domains = <&pd_core>;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@1 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <1>;
+				status = "disabled";
+			};
+
+			counter {
+				compatible = "st,stm32-lptimer-counter";
+				status = "disabled";
+			};
+		};
+
+		lptimer3: timer@50022000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32-lptimer";
+			reg = <0x50022000 0x400>;
+			clocks = <&rcc LPTIM3_K>;
+			clock-names = "mux";
+			power-domains = <&pd_core>;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			trigger@2 {
+				compatible = "st,stm32-lptimer-trigger";
+				reg = <2>;
+				status = "disabled";
+			};
+		};
+
+		lptimer4: timer@50023000 {
+			compatible = "st,stm32-lptimer";
+			reg = <0x50023000 0x400>;
+			clocks = <&rcc LPTIM4_K>;
+			clock-names = "mux";
+			power-domains = <&pd_core>;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+		};
+
+		lptimer5: timer@50024000 {
+			compatible = "st,stm32-lptimer";
+			reg = <0x50024000 0x400>;
+			clocks = <&rcc LPTIM5_K>;
+			clock-names = "mux";
+			power-domains = <&pd_core>;
+			status = "disabled";
+
+			pwm {
+				compatible = "st,stm32-pwm-lp";
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+		};
+
+		vrefbuf: vrefbuf@50025000 {
+			compatible = "st,stm32-vrefbuf";
+			reg = <0x50025000 0x8>;
+			regulator-min-microvolt = <1500000>;
+			regulator-max-microvolt = <2500000>;
+			clocks = <&rcc VREF>;
+			status = "disabled";
+		};
+
+		sai4: sai@50027000 {
+			compatible = "st,stm32h7-sai";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x50027000 0x400>;
+			reg = <0x50027000 0x4>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc SAI4_R>;
+			status = "disabled";
+
+			sai4a: audio-controller@50027004 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-a";
+				reg = <0x04 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 99 0x400 0x01>;
+				status = "disabled";
+			};
+
+			sai4b: audio-controller@50027024 {
+				#sound-dai-cells = <0>;
+				compatible = "st,stm32-sai-sub-b";
+				reg = <0x24 0x1c>;
+				clocks = <&rcc SAI4_K>;
+				clock-names = "sai_ck";
+				dmas = <&dmamux1 100 0x400 0x01>;
+				status = "disabled";
+			};
+		};
+
+		dts: thermal@50028000 {
+			compatible = "st,stm32-thermal";
+			reg = <0x50028000 0x100>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc TMPSENS>;
+			clock-names = "pclk";
+			#thermal-sensor-cells = <0>;
+			status = "disabled";
+		};
+
+		hdp: hdp@5002a000 {
+			compatible = "st,stm32mp1-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			clock-names = "hdp";
+			status = "disabled";
+		};
+
+		funnel: funnel@50091000 {
+			compatible = "arm,coresight-funnel", "arm,primecell";
+			reg = <0x50091000 0x1000>;
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* funnel input ports */
+				port@0 {
+					reg = <0>;
+					funnel_in_port0: endpoint {
+					  slave-mode;
+					  remote-endpoint = <&stm_out_port>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					funnel_in_port1: endpoint {
+					  slave-mode; /* A7-1 input */
+					  remote-endpoint = <&etm1_out_port>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					funnel_in_port2: endpoint {
+					  slave-mode; /* A7-2 input */
+					  remote-endpoint = <&etm2_out_port>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					funnel_in_port4: endpoint {
+					  slave-mode; /* REPLICATOR input */
+					  remote-endpoint = <&replicator_out_port0>;
+					};
+				};
+
+				port@5 {
+					reg = <0>;
+					funnel_out_port0: endpoint {
+					  remote-endpoint = <&etf_in_port>;
+					};
+				};
+			};
+		};
+
+		etf: etf@50092000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x50092000 0x1000>;
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					etf_in_port: endpoint {
+						slave-mode;
+						remote-endpoint = <&funnel_out_port0>;
+					};
+				};
+
+				port@1 {
+					reg = <0>;
+					etf_out_port: endpoint {
+						remote-endpoint = <&tpiu_in_port>;
+					};
+				};
+			};
+		};
+
+		tpiu: tpiu@50093000 {
+			compatible = "arm,coresight-tpiu", "arm,primecell";
+			reg = <0x50093000 0x1000>;
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+
+			port {
+				tpiu_in_port: endpoint {
+					slave-mode;
+					remote-endpoint = <&etf_out_port>;
+				};
+			};
+		};
+
+		stm: stm@500a0000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x500a0000 0x1000>, <0x90000000 0x1000000>,
+			      <0x50094000 0x1000>;
+			reg-names = "stm-base", "stm-stimulus-base", "cti-base";
+
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					stm_out_port: endpoint {
+						remote-endpoint = <&funnel_in_port0>;
+					};
+				};
+			};
+		};
+
+		/* Cortex A7-1 */
+		etm1: etm@500dc000 {
+			compatible = "arm,coresight-etm3x", "arm,primecell";
+			reg = <0x500dc000 0x1000>;
+			cpu = <&cpu0>;
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+			port {
+				etm1_out_port: endpoint {
+					remote-endpoint = <&funnel_in_port1>;
+				};
+			};
+		};
+
+		/* Cortex A7-2 */
+		etm2: etm@500dd000 {
+			compatible = "arm,coresight-etm3x", "arm,primecell";
+			reg = <0x500dd000 0x1000>;
+			cpu = <&cpu1>;
+			clocks = <&rcc CK_TRACE>;
+			clock-names = "apb_pclk";
+
+			port {
+				etm2_out_port: endpoint {
+					remote-endpoint = <&funnel_in_port2>;
+				};
+			};
+		};
+
+		cryp1: cryp@54001000 {
+			compatible = "st,stm32mp1-cryp";
+			reg = <0x54001000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc CRYP1>;
+			resets = <&rcc CRYP1_R>;
+			status = "disabled";
+		};
+
+		hash1: hash@54002000 {
+			compatible = "st,stm32f756-hash";
+			reg = <0x54002000 0x400>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc HASH1>;
+			resets = <&rcc HASH1_R>;
+			dmas = <&mdma1 31 0x2 0x1000A02 0x0 0x0 0x0>;
+			dma-names = "in";
+			dma-maxburst = <2>;
+			status = "disabled";
+		};
+
+		rng1: rng@54003000 {
+			compatible = "st,stm32-rng";
+			reg = <0x54003000 0x400>;
+			clocks = <&rcc RNG1_K>;
+			resets = <&rcc RNG1_R>;
+			status = "disabled";
+		};
+
+		mdma1: dma@58000000 {
+			compatible = "st,stm32h7-mdma";
+			reg = <0x58000000 0x1000>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc MDMA>;
+			resets = <&rcc MDMA_R>;
+			#dma-cells = <6>;
+			dma-channels = <32>;
+			dma-requests = <48>;
+		};
+
+		fmc: nand-controller@58002000 {
+			compatible = "st,stm32mp15-fmc2";
+			reg = <0x58002000 0x1000>,
+			      <0x80000000 0x1000>,
+			      <0x88010000 0x1000>,
+			      <0x88020000 0x1000>,
+			      <0x81000000 0x1000>,
+			      <0x89010000 0x1000>,
+			      <0x89020000 0x1000>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&mdma1 20 0x2 0x12000A02 0x0 0x0 0>,
+			       <&mdma1 20 0x2 0x12000A08 0x0 0x0 0>,
+			       <&mdma1 21 0x2 0x12000A0A 0x0 0x0 0>;
+			dma-names = "tx", "rx", "ecc";
+			clocks = <&rcc FMC_K>;
+			resets = <&rcc FMC_R>;
+			status = "disabled";
+		};
+
+		qspi: spi@58003000 {
+			compatible = "st,stm32f469-qspi";
+			reg = <0x58003000 0x1000>, <0x70000000 0x10000000>;
+			reg-names = "qspi", "qspi_mm";
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&mdma1 22 0x2 0x100002 0x0 0x0 0x0>,
+			       <&mdma1 22 0x2 0x100008 0x0 0x0 0x0>;
+			dma-names = "tx", "rx";
+			clocks = <&rcc QSPI_K>;
+			resets = <&rcc QSPI_R>;
+			status = "disabled";
+		};
+
+		sdmmc1: sdmmc@58005000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00253180>;
+			reg = <0x58005000 0x1000>, <0x58006000 0x1000>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&rcc SDMMC1_K>;
+			clock-names = "apb_pclk";
+			resets = <&rcc SDMMC1_R>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+			status = "disabled";
+		};
+
+		sdmmc2: sdmmc@58007000 {
+			compatible = "arm,pl18x", "arm,primecell";
+			arm,primecell-periphid = <0x00253180>;
+			reg = <0x58007000 0x1000>, <0x58008000 0x1000>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cmd_irq";
+			clocks = <&rcc SDMMC2_K>;
+			clock-names = "apb_pclk";
+			resets = <&rcc SDMMC2_R>;
+			cap-sd-highspeed;
+			cap-mmc-highspeed;
+			max-frequency = <120000000>;
+			status = "disabled";
+		};
+
+		crc1: crc@58009000 {
+			compatible = "st,stm32f7-crc";
+			reg = <0x58009000 0x400>;
+			clocks = <&rcc CRC1>;
+			status = "disabled";
+		};
+
+		stmmac_axi_config_0: stmmac-axi-config {
+			snps,wr_osr_lmt = <0x7>;
+			snps,rd_osr_lmt = <0x7>;
+			snps,blen = <0 0 0 0 16 8 4>;
+		};
+
+		ethernet0: ethernet@5800a000 {
+			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
+			reg = <0x5800a000 0x2000>;
+			reg-names = "stmmaceth";
+			interrupts-extended = <&intc GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 70 1>;
+			interrupt-names = "macirq",
+					  "eth_wake_irq",
+					  "stm32_pwr_wakeup";
+			clock-names = "stmmaceth",
+				      "mac-clk-tx",
+				      "mac-clk-rx",
+				      "eth-ck",    //custom
+				      "syscfg-clk", //custom
+				      "ethstp";
+			clocks = <&rcc ETHMAC>,
+				 <&rcc ETHTX>,
+				 <&rcc ETHRX>,
+				 <&rcc ETHCK_K>, //custom
+				 <&rcc SYSCFG>,  //custom
+				 <&rcc ETHSTP>;
+			st,syscon = <&syscfg 0x4>;
+			snps,mixed-burst;
+			snps,pbl = <2>;
+			snps,en-tx-lpi-clockgating;
+			snps,axi-config = <&stmmac_axi_config_0>;
+			snps,tso;
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		usbh_ohci: usbh-ohci@5800c000 {
+			compatible = "generic-ohci";
+			reg = <0x5800c000 0x1000>;
+			clocks = <&rcc USBH>;
+			resets = <&rcc USBH_R>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		usbh_ehci: usbh-ehci@5800d000 {
+			compatible = "generic-ehci";
+			reg = <0x5800d000 0x1000>;
+			clocks = <&rcc USBH>;
+			resets = <&rcc USBH_R>;
+			interrupts-extended = <&intc GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 43 1>;
+			interrupt-names = "event", "wakeup";
+			companion = <&usbh_ohci>;
+			power-domains = <&pd_core>;
+			wakeup-source;
+			status = "disabled";
+		};
+
+		gpu: gpu@59000000 {
+			compatible = "vivante,gc";
+			reg = <0x59000000 0x800>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc GPU>, <&rcc GPU_K>;
+			clock-names = "bus" ,"core";
+			resets = <&rcc GPU_R>;
+			status = "disabled";
+		};
+
+		dsi: dsi@5a000000 {
+			compatible = "st,stm32-dsi";
+			reg = <0x5a000000 0x800>;
+			clocks = <&rcc DSI_K>, <&clk_hse>, <&rcc DSI_PX>;
+			clock-names = "pclk", "ref", "px_clk";
+			resets = <&rcc DSI_R>;
+			reset-names = "apb";
+			phy-dsi-supply = <&reg18>;
+			status = "disabled";
+		};
+
+		ltdc: display-controller@5a001000 {
+			compatible = "st,stm32-ltdc";
+			reg = <0x5a001000 0x400>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc LTDC_PX>;
+			clock-names = "lcd";
+			resets = <&rcc LTDC_R>;
+			status = "disabled";
+		};
+
+		iwdg2: watchdog@5a002000 {
+			compatible = "st,stm32mp1-iwdg";
+			reg = <0x5a002000 0x400>;
+			clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
+			clock-names = "pclk", "lsi";
+			status = "disabled";
+		};
+
+		usbphyc: usbphyc@5a006000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <0>;
+			compatible = "st,stm32mp1-usbphyc";
+			reg = <0x5a006000 0x1000>;
+			clocks = <&rcc USBPHY_K>;
+			resets = <&rcc USBPHY_R>;
+			vdda1v1-supply = <&reg11>;
+			vdda1v8-supply = <&reg18>;
+			status = "disabled";
+
+			usbphyc_port0: usb-phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+			};
+
+			usbphyc_port1: usb-phy@1 {
+				#phy-cells = <1>;
+				reg = <1>;
+			};
+		};
+
+		ddrperfm: perf@5a007000 {
+			compatible = "st,stm32-ddr-pmu";
+			reg = <0x5a007000 0x400>;
+			clocks = <&rcc DDRPERFM>, <&rcc PLL2_R>;
+			clock-names = "bus", "ddr";
+			resets = <&rcc DDRPERFM_R>;
+			status = "okay";
+		};
+
+		usart1: serial@5c000000 {
+			compatible = "st,stm32h7-uart";
+			reg = <0x5c000000 0x400>;
+			interrupt-names = "event", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 26 1>;
+			clocks = <&rcc USART1_K>;
+			resets = <&rcc USART1_R>;
+			wakeup-source;
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		spi6: spi@5c001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "st,stm32h7-spi";
+			reg = <0x5c001000 0x400>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rcc SPI6_K>;
+			resets = <&rcc SPI6_R>;
+			dmas = <&mdma1 34 0x0 0x40008 0x0 0x0 0x0>,
+			       <&mdma1 35 0x0 0x40002 0x0 0x0 0x0>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@5c002000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x5c002000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 24 1>;
+			clocks = <&rcc I2C4_K>;
+			resets = <&rcc I2C4_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&mdma1 36 0x0 0x40008 0x0 0x0 0>,
+			       <&mdma1 37 0x0 0x40002 0x0 0x0 0>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x8>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x8>;
+			status = "disabled";
+		};
+
+		rtc: rtc@5c004000 {
+			compatible = "st,stm32mp1-rtc";
+			reg = <0x5c004000 0x400>;
+			clocks = <&rcc RTCAPB>, <&rcc RTC>;
+			clock-names = "pclk", "rtc_ck";
+			interrupts-extended = <&intc GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 19 1>;
+			status = "disabled";
+		};
+
+		bsec: nvmem@5c005000 {
+			compatible = "st,stm32mp15-bsec";
+			reg = <0x5c005000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			part_number_otp: part_number_otp@4 {
+				reg = <0x4 0x1>;
+			};
+			ts_cal1: calib@5c {
+				reg = <0x5c 0x2>;
+			};
+			ts_cal2: calib@5e {
+				reg = <0x5e 0x2>;
+			};
+		};
+
+		i2c6: i2c@5c009000 {
+			compatible = "st,stm32f7-i2c";
+			reg = <0x5c009000 0x400>;
+			interrupt-names = "event", "error", "wakeup";
+			interrupts-extended = <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&exti 54 1>;
+			clocks = <&rcc I2C6_K>;
+			resets = <&rcc I2C6_R>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dmas = <&mdma1 38 0x0 0x40008 0x0 0x0 0>,
+			       <&mdma1 39 0x0 0x40002 0x0 0x0 0>;
+			dma-names = "rx", "tx";
+			power-domains = <&pd_core>;
+			st,syscfg-fmp = <&syscfg 0x4 0x20>;
+			st,syscfg-fmp-clr = <&syscfg 0x44 0x20>;
+			status = "disabled";
+		};
+
+		tamp: tamp@5c00a000 {
+			compatible = "simple-bus", "syscon", "simple-mfd";
+			reg = <0x5c00a000 0x400>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x150>; /* reg20 */
+				mask = <0xff>;
+				mode-normal = <0>;
+				mode-fastboot = <0x1>;
+				mode-recovery = <0x2>;
+				mode-stm32cubeprogrammer = <0x3>;
+				mode-ums_mmc0 = <0x10>;
+				mode-ums_mmc1 = <0x11>;
+				mode-ums_mmc2 = <0x12>;
+			};
+		};
+	};
+
+	m4_rproc: m4@0 {
+		compatible = "st,stm32mp1-rproc";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0x00000000 0x38000000 0x10000>,
+			 <0x30000000 0x30000000 0x60000>,
+			 <0x10000000 0x10000000 0x60000>;
+		resets = <&rcc MCU_R>;
+		reset-names = "mcu_rst";
+		st,syscfg-pdds = <&pwr 0x014 0x1>;
+		st,syscfg-holdboot = <&rcc 0x10C 0x1>;
+		st,syscfg-tz = <&rcc 0x000 0x1>;
+		st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+		status = "disabled";
+
+		m4_system_resources {
+			compatible = "rproc-srm-core";
+			status = "disabled";
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+};
diff --git a/board/octavo/red/linux.config b/board/octavo/red/linux.config
new file mode 100644
index 0000000000..97e4e56c19
--- /dev/null
+++ b/board/octavo/red/linux.config
@@ -0,0 +1,936 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_BLK_CGROUP=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CFS_BANDWIDTH=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CHECKPOINT_RESTORE=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_BPF_SYSCALL=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_754327=y
+CONFIG_ARM_ERRATA_764369=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_ARM_ERRATA_798181=y
+CONFIG_PCI_ENDPOINT=y
+CONFIG_PCI_ENDPOINT_CONFIGFS=y
+CONFIG_PCI_EPF_TEST=m
+CONFIG_SMP=y
+CONFIG_SCHED_MC=y
+CONFIG_MCPM=y
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_EFI=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+CONFIG_CPU_FREQ_GOV_USERSPACE=m
+CONFIG_CPU_FREQ_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_QORIQ_CPUFREQ=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_EFI_VARS=m
+CONFIG_EFI_CAPSULE_LOADER=m
+CONFIG_ARM_CRYPTO=y
+CONFIG_CRYPTO_SHA1_ARM_NEON=m
+CONFIG_CRYPTO_SHA1_ARM_CE=m
+CONFIG_CRYPTO_SHA2_ARM_CE=m
+CONFIG_CRYPTO_SHA512_ARM=m
+CONFIG_CRYPTO_AES_ARM=m
+CONFIG_CRYPTO_AES_ARM_BS=m
+CONFIG_CRYPTO_AES_ARM_CE=m
+CONFIG_CRYPTO_GHASH_ARM_CE=m
+CONFIG_CRYPTO_CRC32_ARM_CE=m
+CONFIG_CRYPTO_CHACHA20_NEON=m
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_UNIX_DIAG=m
+CONFIG_TLS=m
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_IP_FIB_TRIE_STATS=y
+CONFIG_IP_MULTIPLE_TABLES=y
+CONFIG_IP_ROUTE_MULTIPATH=y
+CONFIG_IP_ROUTE_VERBOSE=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_NET_IPIP=m
+CONFIG_NET_IPGRE_DEMUX=m
+CONFIG_NET_IPGRE=m
+CONFIG_NET_IPGRE_BROADCAST=y
+CONFIG_IP_MROUTE=y
+CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
+CONFIG_IP_PIMSM_V1=y
+CONFIG_IP_PIMSM_V2=y
+CONFIG_NET_IPVTI=m
+CONFIG_NET_FOU_IP_TUNNELS=y
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_ESP_OFFLOAD=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=m
+CONFIG_INET_XFRM_MODE_TUNNEL=m
+CONFIG_INET_XFRM_MODE_BEET=m
+CONFIG_INET_DIAG=m
+CONFIG_INET_UDP_DIAG=m
+CONFIG_INET_RAW_DIAG=m
+CONFIG_INET_DIAG_DESTROY=y
+CONFIG_TCP_CONG_ADVANCED=y
+CONFIG_TCP_MD5SIG=y
+CONFIG_IPV6=m
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_ROUTE_INFO=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_ESP_OFFLOAD=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=m
+CONFIG_IPV6_VTI=m
+CONFIG_IPV6_SIT_6RD=y
+CONFIG_IPV6_GRE=m
+CONFIG_IPV6_SUBTREES=y
+CONFIG_IPV6_MROUTE=y
+CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
+CONFIG_IPV6_PIMSM_V2=y
+CONFIG_IPV6_SEG6_LWTUNNEL=y
+CONFIG_IPV6_SEG6_HMAC=y
+CONFIG_NETWORK_SECMARK=y
+CONFIG_NETWORK_PHY_TIMESTAMPING=y
+CONFIG_NETFILTER=y
+CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_NETDEV=m
+CONFIG_NF_CONNTRACK_SECMARK=y
+CONFIG_NF_CONNTRACK_EVENTS=y
+CONFIG_NF_CONNTRACK_TIMEOUT=y
+CONFIG_NF_CONNTRACK_TIMESTAMP=y
+CONFIG_NF_CONNTRACK_AMANDA=m
+CONFIG_NF_CONNTRACK_FTP=m
+CONFIG_NF_CONNTRACK_H323=m
+CONFIG_NF_CONNTRACK_IRC=m
+CONFIG_NF_CONNTRACK_NETBIOS_NS=m
+CONFIG_NF_CONNTRACK_SNMP=m
+CONFIG_NF_CONNTRACK_PPTP=m
+CONFIG_NF_CONNTRACK_SIP=m
+CONFIG_NF_CONNTRACK_TFTP=m
+CONFIG_NF_CT_NETLINK=m
+CONFIG_NF_CT_NETLINK_TIMEOUT=m
+CONFIG_NF_CT_NETLINK_HELPER=m
+CONFIG_NETFILTER_NETLINK_GLUE_CT=y
+CONFIG_NF_TABLES=m
+CONFIG_NFT_NUMGEN=m
+CONFIG_NFT_CT=m
+CONFIG_NFT_COUNTER=m
+CONFIG_NFT_LOG=m
+CONFIG_NFT_LIMIT=m
+CONFIG_NFT_MASQ=m
+CONFIG_NFT_REDIR=m
+CONFIG_NFT_NAT=m
+CONFIG_NFT_OBJREF=m
+CONFIG_NFT_QUEUE=m
+CONFIG_NFT_QUOTA=m
+CONFIG_NFT_REJECT=m
+CONFIG_NFT_HASH=m
+CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
+CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
+CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
+CONFIG_NETFILTER_XT_TARGET_HMARK=m
+CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
+CONFIG_NETFILTER_XT_TARGET_LED=m
+CONFIG_NETFILTER_XT_TARGET_LOG=m
+CONFIG_NETFILTER_XT_TARGET_MARK=m
+CONFIG_NETFILTER_XT_TARGET_NFLOG=m
+CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
+CONFIG_NETFILTER_XT_TARGET_TEE=m
+CONFIG_NETFILTER_XT_TARGET_SECMARK=m
+CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
+CONFIG_NETFILTER_XT_MATCH_BPF=m
+CONFIG_NETFILTER_XT_MATCH_CGROUP=m
+CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
+CONFIG_NETFILTER_XT_MATCH_COMMENT=m
+CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
+CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
+CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
+CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
+CONFIG_NETFILTER_XT_MATCH_CPU=m
+CONFIG_NETFILTER_XT_MATCH_DCCP=m
+CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
+CONFIG_NETFILTER_XT_MATCH_DSCP=m
+CONFIG_NETFILTER_XT_MATCH_ESP=m
+CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
+CONFIG_NETFILTER_XT_MATCH_HELPER=m
+CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
+CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
+CONFIG_NETFILTER_XT_MATCH_LENGTH=m
+CONFIG_NETFILTER_XT_MATCH_LIMIT=m
+CONFIG_NETFILTER_XT_MATCH_MAC=m
+CONFIG_NETFILTER_XT_MATCH_MARK=m
+CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
+CONFIG_NETFILTER_XT_MATCH_NFACCT=m
+CONFIG_NETFILTER_XT_MATCH_OSF=m
+CONFIG_NETFILTER_XT_MATCH_OWNER=m
+CONFIG_NETFILTER_XT_MATCH_POLICY=m
+CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
+CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
+CONFIG_NETFILTER_XT_MATCH_QUOTA=m
+CONFIG_NETFILTER_XT_MATCH_RATEEST=m
+CONFIG_NETFILTER_XT_MATCH_REALM=m
+CONFIG_NETFILTER_XT_MATCH_RECENT=m
+CONFIG_NETFILTER_XT_MATCH_SCTP=m
+CONFIG_NETFILTER_XT_MATCH_STATE=m
+CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
+CONFIG_NETFILTER_XT_MATCH_STRING=m
+CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
+CONFIG_NETFILTER_XT_MATCH_TIME=m
+CONFIG_NETFILTER_XT_MATCH_U32=m
+CONFIG_IP_SET=m
+CONFIG_IP_VS=m
+CONFIG_NF_SOCKET_IPV4=m
+CONFIG_NF_LOG_ARP=m
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_MATCH_AH=m
+CONFIG_IP_NF_MATCH_ECN=m
+CONFIG_IP_NF_MATCH_RPFILTER=m
+CONFIG_IP_NF_MATCH_TTL=m
+CONFIG_IP_NF_FILTER=m
+CONFIG_IP_NF_TARGET_REJECT=m
+CONFIG_IP_NF_TARGET_SYNPROXY=m
+CONFIG_IP_NF_NAT=m
+CONFIG_IP_NF_TARGET_MASQUERADE=m
+CONFIG_IP_NF_TARGET_NETMAP=m
+CONFIG_IP_NF_TARGET_REDIRECT=m
+CONFIG_IP_NF_MANGLE=m
+CONFIG_IP_NF_TARGET_CLUSTERIP=m
+CONFIG_IP_NF_TARGET_ECN=m
+CONFIG_IP_NF_TARGET_TTL=m
+CONFIG_IP_NF_RAW=m
+CONFIG_IP_NF_ARPTABLES=m
+CONFIG_IP_NF_ARPFILTER=m
+CONFIG_IP_NF_ARP_MANGLE=m
+CONFIG_NF_SOCKET_IPV6=m
+CONFIG_IP6_NF_IPTABLES=m
+CONFIG_IP6_NF_MATCH_AH=m
+CONFIG_IP6_NF_MATCH_EUI64=m
+CONFIG_IP6_NF_MATCH_FRAG=m
+CONFIG_IP6_NF_MATCH_OPTS=m
+CONFIG_IP6_NF_MATCH_HL=m
+CONFIG_IP6_NF_MATCH_IPV6HEADER=m
+CONFIG_IP6_NF_MATCH_MH=m
+CONFIG_IP6_NF_MATCH_RPFILTER=m
+CONFIG_IP6_NF_MATCH_RT=m
+CONFIG_IP6_NF_TARGET_HL=m
+CONFIG_IP6_NF_FILTER=m
+CONFIG_IP6_NF_TARGET_REJECT=m
+CONFIG_IP6_NF_TARGET_SYNPROXY=m
+CONFIG_IP6_NF_MANGLE=m
+CONFIG_IP6_NF_RAW=m
+CONFIG_IP6_NF_NAT=m
+CONFIG_IP6_NF_TARGET_MASQUERADE=m
+CONFIG_IP6_NF_TARGET_NPT=m
+CONFIG_BRIDGE_NF_EBTABLES=m
+CONFIG_BRIDGE_EBT_BROUTE=m
+CONFIG_BRIDGE_EBT_T_FILTER=m
+CONFIG_BRIDGE_EBT_T_NAT=m
+CONFIG_BRIDGE_EBT_802_3=m
+CONFIG_BRIDGE_EBT_AMONG=m
+CONFIG_BRIDGE_EBT_ARP=m
+CONFIG_BRIDGE_EBT_IP=m
+CONFIG_BRIDGE_EBT_IP6=m
+CONFIG_BRIDGE_EBT_LIMIT=m
+CONFIG_BRIDGE_EBT_MARK=m
+CONFIG_BRIDGE_EBT_PKTTYPE=m
+CONFIG_BRIDGE_EBT_STP=m
+CONFIG_BRIDGE_EBT_VLAN=m
+CONFIG_BRIDGE_EBT_ARPREPLY=m
+CONFIG_BRIDGE_EBT_DNAT=m
+CONFIG_BRIDGE_EBT_MARK_T=m
+CONFIG_BRIDGE_EBT_REDIRECT=m
+CONFIG_BRIDGE_EBT_SNAT=m
+CONFIG_BRIDGE_EBT_LOG=m
+CONFIG_BRIDGE_EBT_NFLOG=m
+CONFIG_L2TP=m
+CONFIG_BRIDGE=m
+CONFIG_NET_DSA=m
+CONFIG_VLAN_8021Q=m
+CONFIG_VLAN_8021Q_GVRP=y
+CONFIG_VLAN_8021Q_MVRP=y
+CONFIG_LLC2=m
+CONFIG_6LOWPAN=m
+CONFIG_6LOWPAN_DEBUGFS=y
+CONFIG_IEEE802154=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_CBQ=m
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_MULTIQ=m
+CONFIG_NET_SCH_RED=m
+CONFIG_NET_SCH_SFB=m
+CONFIG_NET_SCH_SFQ=m
+CONFIG_NET_SCH_TEQL=m
+CONFIG_NET_SCH_TBF=m
+CONFIG_NET_SCH_GRED=m
+CONFIG_NET_SCH_DSMARK=m
+CONFIG_NET_SCH_NETEM=m
+CONFIG_NET_SCH_DRR=m
+CONFIG_NET_SCH_MQPRIO=m
+CONFIG_NET_SCH_CHOKE=m
+CONFIG_NET_SCH_QFQ=m
+CONFIG_NET_SCH_CODEL=m
+CONFIG_NET_SCH_FQ_CODEL=m
+CONFIG_NET_SCH_FQ=m
+CONFIG_NET_SCH_HHF=m
+CONFIG_NET_SCH_PIE=m
+CONFIG_NET_SCH_PLUG=m
+CONFIG_NET_SCH_DEFAULT=y
+CONFIG_NET_CLS_BASIC=m
+CONFIG_NET_CLS_TCINDEX=m
+CONFIG_NET_CLS_ROUTE4=m
+CONFIG_NET_CLS_FW=m
+CONFIG_NET_CLS_U32=m
+CONFIG_CLS_U32_PERF=y
+CONFIG_CLS_U32_MARK=y
+CONFIG_NET_CLS_RSVP=m
+CONFIG_NET_CLS_RSVP6=m
+CONFIG_NET_CLS_FLOW=m
+CONFIG_NET_CLS_CGROUP=m
+CONFIG_NET_CLS_BPF=m
+CONFIG_NET_CLS_FLOWER=m
+CONFIG_NET_CLS_MATCHALL=m
+CONFIG_NET_EMATCH=y
+CONFIG_NET_EMATCH_CMP=m
+CONFIG_NET_EMATCH_NBYTE=m
+CONFIG_NET_EMATCH_U32=m
+CONFIG_NET_EMATCH_META=m
+CONFIG_NET_EMATCH_TEXT=m
+CONFIG_NET_EMATCH_CANID=m
+CONFIG_NET_CLS_ACT=y
+CONFIG_NET_ACT_POLICE=m
+CONFIG_NET_ACT_GACT=m
+CONFIG_GACT_PROB=y
+CONFIG_NET_ACT_MIRRED=m
+CONFIG_NET_ACT_SAMPLE=m
+CONFIG_NET_ACT_NAT=m
+CONFIG_NET_ACT_PEDIT=m
+CONFIG_NET_ACT_CSUM=m
+CONFIG_NET_ACT_VLAN=m
+CONFIG_NET_ACT_BPF=m
+CONFIG_NET_ACT_SKBMOD=m
+CONFIG_NET_ACT_IFE=m
+CONFIG_NET_ACT_TUNNEL_KEY=m
+CONFIG_NET_IFE_SKBMARK=m
+CONFIG_NET_IFE_SKBPRIO=m
+CONFIG_NET_IFE_SKBTCINDEX=m
+CONFIG_NET_CLS_IND=y
+CONFIG_DCB=y
+CONFIG_BATMAN_ADV=m
+CONFIG_BATMAN_ADV_NC=y
+CONFIG_BATMAN_ADV_MCAST=y
+CONFIG_OPENVSWITCH=m
+CONFIG_VSOCKETS=m
+CONFIG_VIRTIO_VSOCKETS=m
+CONFIG_NETLINK_DIAG=m
+CONFIG_HSR=m
+CONFIG_CGROUP_NET_PRIO=y
+CONFIG_BPF_JIT=y
+CONFIG_CAN=y
+CONFIG_CAN_FLEXCAN=m
+CONFIG_CAN_M_CAN=y
+CONFIG_BT=m
+CONFIG_BT_6LOWPAN=m
+CONFIG_BT_HCIBTUSB=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCM=y
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_VEXPRESS_CONFIG=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_NAND_BRCMNAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_VIRTIO_BLK=y
+CONFIG_AD525X_DPOT=y
+CONFIG_AD525X_DPOT_I2C=y
+CONFIG_ICS932S401=y
+CONFIG_APDS9802ALS=y
+CONFIG_ISL29003=y
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_MACVLAN=m
+CONFIG_MACVTAP=m
+CONFIG_TUN=m
+CONFIG_TUN_VNET_CROSS_LE=y
+CONFIG_VETH=m
+CONFIG_VIRTIO_NET=y
+CONFIG_B53_SPI_DRIVER=m
+CONFIG_B53_MDIO_DRIVER=m
+CONFIG_B53_MMAP_DRIVER=m
+CONFIG_B53_SRAB_DRIVER=m
+CONFIG_NET_DSA_BCM_SF2=m
+CONFIG_BCMGENET=m
+CONFIG_SYSTEMPORT=m
+CONFIG_MACB=y
+CONFIG_HIX5HD2_GMAC=y
+CONFIG_MVMDIO=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_AT803X_PHY=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_ICPLUS_PHY=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_ROCKCHIP_PHY=y
+CONFIG_SMSC_PHY=y
+CONFIG_USB_PEGASUS=y
+CONFIG_USB_RTL8152=m
+CONFIG_USB_LAN78XX=m
+CONFIG_USB_USBNET=y
+CONFIG_USB_NET_SMSC75XX=y
+CONFIG_USB_NET_SMSC95XX=y
+CONFIG_BRCMFMAC=m
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
+CONFIG_RT2X00=m
+CONFIG_RT2800USB=m
+CONFIG_RTL8192CU=m
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_QT1070=m
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_SAMSUNG=m
+CONFIG_KEYBOARD_CROS_EC=m
+CONFIG_KEYBOARD_BCM=y
+CONFIG_MOUSE_PS2_ELANTECH=y
+CONFIG_MOUSE_CYAPA=m
+CONFIG_MOUSE_ELAN_I2C=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
+CONFIG_TOUCHSCREEN_GOODIX=m
+CONFIG_TOUCHSCREEN_MMS114=m
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_TOUCHSCREEN_ST1232=m
+CONFIG_TOUCHSCREEN_STMPE=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_MAX77693_HAPTIC=m
+CONFIG_INPUT_MAX8997_HAPTIC=m
+CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_AXP20X_PEK=m
+CONFIG_INPUT_UINPUT=m
+CONFIG_INPUT_ADXL34X=m
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_ARB_GPIO_CHALLENGE=m
+CONFIG_I2C_MUX_PCA954x=y
+CONFIG_I2C_MUX_PINCTRL=y
+CONFIG_I2C_DEMUX_PINCTRL=y
+CONFIG_I2C_NOMADIK=y
+CONFIG_I2C_STM32F7=y
+CONFIG_I2C_CROS_EC_TUNNEL=m
+CONFIG_SPI=y
+CONFIG_SPI_CADENCE=y
+CONFIG_SPI_GPIO=m
+CONFIG_SPI_PL022=y
+CONFIG_SPI_ROCKCHIP=m
+CONFIG_SPI_STM32=y
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_SPI_XILINX=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_SPMI=y
+CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_PINCTRL_PALMAS=y
+CONFIG_GPIO_DWAPB=y
+CONFIG_GPIO_PL061=y
+CONFIG_GPIO_SYSCON=y
+CONFIG_GPIO_XILINX=y
+CONFIG_GPIO_PALMAS=y
+CONFIG_GPIO_TPS6586X=y
+CONFIG_GPIO_TPS65910=y
+CONFIG_GPIO_TWL4030=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_AS3722=y
+CONFIG_POWER_RESET_BRCMKONA=y
+CONFIG_POWER_RESET_BRCMSTB=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_VEXPRESS=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_LM90=y
+CONFIG_SENSORS_LM95245=y
+CONFIG_SENSORS_NTC_THERMISTOR=m
+CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_INA2XX=m
+CONFIG_THERMAL=y
+CONFIG_CPU_THERMAL=y
+CONFIG_ST_THERMAL_MEMMAP=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+CONFIG_DA9063_WATCHDOG=m
+CONFIG_XILINX_WATCHDOG=y
+CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_DW_WATCHDOG=y
+CONFIG_RN5T618_WATCHDOG=y
+CONFIG_STPMIC1_WATCHDOG=y
+CONFIG_BCMA=y
+CONFIG_BCMA_HOST_SOC=y
+CONFIG_BCMA_DRIVER_GMAC_CMN=y
+CONFIG_BCMA_DRIVER_GPIO=y
+CONFIG_MFD_ACT8945A=y
+CONFIG_MFD_AS3711=y
+CONFIG_MFD_AS3722=y
+CONFIG_MFD_ATMEL_FLEXCOM=y
+CONFIG_MFD_ATMEL_HLCDC=m
+CONFIG_MFD_BCM590XX=y
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_MFD_CROS_EC=m
+CONFIG_MFD_DA9063=m
+CONFIG_MFD_MAX14577=y
+CONFIG_MFD_MAX77686=y
+CONFIG_MFD_MAX77693=m
+CONFIG_MFD_MAX8907=y
+CONFIG_MFD_MAX8997=y
+CONFIG_MFD_MAX8998=y
+CONFIG_MFD_CPCAP=y
+CONFIG_MFD_PM8XXX=y
+CONFIG_MFD_RK808=y
+CONFIG_MFD_RN5T618=y
+CONFIG_MFD_SEC_CORE=y
+CONFIG_ABX500_CORE=y
+CONFIG_MFD_STMPE=y
+CONFIG_MFD_PALMAS=y
+CONFIG_MFD_TPS65090=y
+CONFIG_MFD_TPS65217=y
+CONFIG_MFD_TPS65218=y
+CONFIG_MFD_TPS6586X=y
+CONFIG_MFD_TPS65910=y
+CONFIG_TWL4030_CORE=y
+CONFIG_TWL4030_POWER=y
+CONFIG_MFD_WM8994=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ACT8865=y
+CONFIG_REGULATOR_ACT8945A=y
+CONFIG_REGULATOR_ANATOP=y
+CONFIG_REGULATOR_AS3711=y
+CONFIG_REGULATOR_AS3722=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_BCM590XX=y
+CONFIG_REGULATOR_CPCAP=y
+CONFIG_REGULATOR_DA9210=y
+CONFIG_REGULATOR_FAN53555=y
+CONFIG_REGULATOR_GPIO=y
+CONFIG_REGULATOR_LP872X=y
+CONFIG_REGULATOR_MAX14577=m
+CONFIG_REGULATOR_MAX8907=y
+CONFIG_REGULATOR_MAX8973=y
+CONFIG_REGULATOR_MAX8997=m
+CONFIG_REGULATOR_MAX8998=m
+CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_MAX77693=m
+CONFIG_REGULATOR_MAX77802=m
+CONFIG_REGULATOR_PALMAS=y
+CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_RK808=y
+CONFIG_REGULATOR_RN5T618=y
+CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_S5M8767=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_REGULATOR_STPMIC1=y
+CONFIG_REGULATOR_TPS51632=y
+CONFIG_REGULATOR_TPS62360=y
+CONFIG_REGULATOR_TPS65090=y
+CONFIG_REGULATOR_TPS65217=y
+CONFIG_REGULATOR_TPS65218=y
+CONFIG_REGULATOR_TPS6586X=y
+CONFIG_REGULATOR_TPS65910=y
+CONFIG_REGULATOR_TWL4030=y
+CONFIG_REGULATOR_VEXPRESS=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_CEC_SUPPORT=y
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_STM32_DCMI=y
+CONFIG_SOC_CAMERA=m
+CONFIG_SOC_CAMERA_PLATFORM=m
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIDEO_VIVID=m
+CONFIG_CEC_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_STM32_HDMI_CEC=m
+# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
+CONFIG_VIDEO_ADV7180=m
+CONFIG_VIDEO_ML86V7667=m
+CONFIG_VIDEO_ADV7511=m
+CONFIG_VIDEO_OV5640=y
+CONFIG_DRM=y
+# CONFIG_DRM_FBDEV_EMULATION is not set
+CONFIG_DRM_EXYNOS=m
+CONFIG_DRM_EXYNOS_FIMD=y
+CONFIG_DRM_EXYNOS_MIXER=y
+CONFIG_DRM_EXYNOS_DPI=y
+CONFIG_DRM_EXYNOS_DSI=y
+CONFIG_DRM_EXYNOS_HDMI=y
+CONFIG_DRM_ATMEL_HLCDC=m
+CONFIG_DRM_RCAR_LVDS=y
+CONFIG_DRM_FSL_DCU=m
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
+CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
+CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
+CONFIG_DRM_DUMB_VGA_DAC=m
+CONFIG_DRM_NXP_PTN3460=m
+CONFIG_DRM_PARADE_PS8622=m
+CONFIG_DRM_SII902X=y
+CONFIG_DRM_SII9234=m
+CONFIG_DRM_I2C_ADV7511=m
+CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_STI=m
+CONFIG_DRM_MXSFB=m
+CONFIG_FB_ARMCLCD=y
+CONFIG_FB_EFI=y
+CONFIG_FB_SIMPLE=y
+CONFIG_LCD_PLATFORM=m
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_BACKLIGHT_AS3711=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_SND_USB_AUDIO=y
+CONFIG_SND_SOC=y
+CONFIG_SND_ATMEL_SOC=m
+CONFIG_SND_SOC_FSL_SAI=m
+CONFIG_SND_SOC_STM32_SAI=y
+CONFIG_SND_SOC_STM32_I2S=y
+CONFIG_SND_SOC_STM32_SPDIFRX=y
+CONFIG_SND_SOC_STM32_DFSDM=y
+CONFIG_SND_SOC_AK4642=m
+CONFIG_SND_SOC_CPCAP=m
+CONFIG_SND_SOC_CS42L42=y
+CONFIG_SND_SOC_CS42L51_I2C=y
+CONFIG_SND_SOC_SGTL5000=m
+CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SOC_TLV320AIC23_I2C=m
+CONFIG_SND_SOC_TS3A227E=m
+CONFIG_SND_SOC_WM8753=m
+CONFIG_SND_SOC_WM8903=m
+CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SOC_WM8994=y
+CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_SIMPLE_SCU_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_R8A66597_HCD=m
+CONFIG_USB_ACM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=m
+CONFIG_USB_DWC2=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_NOP_USB_XCEIV=m
+CONFIG_AM335X_PHY_USB=m
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=y
+CONFIG_USB_ULPI=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_SNP_UDC_PLAT=y
+CONFIG_USB_BDC_UDC=y
+CONFIG_USB_CONFIGFS=y
+CONFIG_USB_CONFIGFS_SERIAL=y
+CONFIG_USB_CONFIGFS_ACM=y
+CONFIG_USB_CONFIGFS_OBEX=y
+CONFIG_USB_CONFIGFS_NCM=y
+CONFIG_USB_CONFIGFS_ECM=y
+CONFIG_USB_CONFIGFS_ECM_SUBSET=y
+CONFIG_USB_CONFIGFS_RNDIS=y
+CONFIG_USB_CONFIGFS_EEM=y
+CONFIG_USB_CONFIGFS_MASS_STORAGE=y
+CONFIG_USB_CONFIGFS_F_LB_SS=y
+CONFIG_USB_CONFIGFS_F_FS=y
+CONFIG_USB_CONFIGFS_F_UAC1=y
+CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
+CONFIG_USB_CONFIGFS_F_UAC2=y
+CONFIG_USB_CONFIGFS_F_MIDI=y
+CONFIG_USB_CONFIGFS_F_HID=y
+CONFIG_USB_CONFIGFS_F_UVC=y
+CONFIG_USB_CONFIGFS_F_PRINTER=y
+CONFIG_USB_ETH=m
+CONFIG_TYPEC=y
+CONFIG_TYPEC_STUSB=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ARASAN=y
+CONFIG_MMC_SDHCI_OF_AT91=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_EXYNOS=y
+CONFIG_MMC_SDHCI_OMAP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_CLASS_FLASH=m
+CONFIG_LEDS_CPCAP=m
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_LEDS_MAX77693=m
+CONFIG_LEDS_MAX8997=m
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_TRANSIENT=y
+CONFIG_LEDS_TRIGGER_CAMERA=y
+CONFIG_EDAC=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_AS3722=y
+CONFIG_RTC_DRV_DS1307=y
+CONFIG_RTC_DRV_HYM8563=m
+CONFIG_RTC_DRV_MAX8907=y
+CONFIG_RTC_DRV_MAX8998=m
+CONFIG_RTC_DRV_MAX8997=m
+CONFIG_RTC_DRV_MAX77686=y
+CONFIG_RTC_DRV_RK808=m
+CONFIG_RTC_DRV_RS5C372=m
+CONFIG_RTC_DRV_BQ32K=m
+CONFIG_RTC_DRV_TWL4030=y
+CONFIG_RTC_DRV_PALMAS=y
+CONFIG_RTC_DRV_TPS6586X=y
+CONFIG_RTC_DRV_TPS65910=y
+CONFIG_RTC_DRV_S35390A=m
+CONFIG_RTC_DRV_RX8581=m
+CONFIG_RTC_DRV_EM3027=y
+CONFIG_RTC_DRV_S5M=m
+CONFIG_RTC_DRV_DA9063=m
+CONFIG_RTC_DRV_EFI=m
+CONFIG_RTC_DRV_PL031=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_RTC_DRV_CPCAP=m
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_PL330_DMA=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_DW_DMAC=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_CROS_EC_I2C=m
+CONFIG_CROS_EC_SPI=m
+CONFIG_COMMON_CLK_MAX77686=y
+CONFIG_COMMON_CLK_RK808=m
+CONFIG_COMMON_CLK_S2MPS11=m
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_ARM_TIMER_SP804=y
+CONFIG_PL320_MBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_TTY=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_CPCAP_ADC=m
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_ADC_TEMP=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_VF610_ADC=m
+CONFIG_STM32_LPTIMER_CNT=y
+CONFIG_STM32_DAC=y
+CONFIG_MPU3050_I2C=y
+CONFIG_HTS221=y
+CONFIG_IIO_ST_LSM6DSX=m
+CONFIG_CM36651=m
+CONFIG_SENSORS_ISL29018=y
+CONFIG_SENSORS_ISL29028=y
+CONFIG_AK8975=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_IIO_ST_PRESS=m
+CONFIG_PWM=y
+CONFIG_PWM_ATMEL_HLCDC_PWM=m
+CONFIG_PWM_FSL_FTM=m
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+CONFIG_PHY_CPCAP_USB=m
+CONFIG_PHY_SAMSUNG_USB2=m
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_STM32_DDR_PMU=y
+CONFIG_RAS=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_FUSE_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_NTFS_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_UBIFS_FS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
+CONFIG_SQUASHFS_XZ=y
+CONFIG_PSTORE=y
+CONFIG_PSTORE_CONSOLE=y
+CONFIG_PSTORE_PMSG=y
+CONFIG_PSTORE_RAM=y
+CONFIG_SYSV_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_USER=m
+CONFIG_CRYPTO_CCM=y
+CONFIG_CRYPTO_GCM=y
+CONFIG_CRYPTO_CMAC=y
+CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_ARC4=y
+CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+CONFIG_CRYPTO_DEV_STM32_CRC=y
+CONFIG_CRYPTO_DEV_STM32_HASH=y
+CONFIG_CRYPTO_DEV_STM32_CRYP=y
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_GDB_SCRIPTS=y
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_DEBUG_SECTION_MISMATCH=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_MAGIC_SYSRQ=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_RCU_TRACE=y
+CONFIG_SAMPLES=y
+CONFIG_SAMPLE_RPMSG_CLIENT=m
diff --git a/board/octavo/red/overlay/boot/extlinux/extlinux.conf b/board/octavo/red/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..a3f8a75d35
--- /dev/null
+++ b/board/octavo/red/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-dk2-buildroot
+  kernel /boot/zImage
+  devicetree /boot/osd32mp1-red.dtb
+  append root=/dev/mmcblk1p4 rootwait
diff --git a/board/octavo/red/post-image.sh b/board/octavo/red/post-image.sh
new file mode 100755
index 0000000000..fc2fbd1134
--- /dev/null
+++ b/board/octavo/red/post-image.sh
@@ -0,0 +1,39 @@
+#!/usr/bin/env bash
+
+#
+# atf_image extracts the ATF binary image from DTB_FILE_NAME that appears in
+# BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES in ${BR_CONFIG},
+# then prints the corresponding file name for the genimage
+# configuration file
+#
+atf_image()
+{
+	local ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\(.*\)"$/\1/p' ${BR2_CONFIG})"
+
+	local DTB_NAME="$(sed -n 's/.*DTB_FILE_NAME=\([^ ]*\)/\1/p' <<< ${ATF_VARIABLES})"
+	local STM_NAME="tf-a-$(cut -f1 -d'.' <<< ${DTB_NAME}).stm32"
+	echo ${STM_NAME}
+}
+
+main()
+{
+	local ATFBIN="$(atf_image)"
+	if [ ! -e ${BINARIES_DIR}/${ATFBIN} ]; then
+		echo "Can not find ATF binary ${ATFBIN}"
+		exit 1
+	fi
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+	local SCRIPT_PATH=$(dirname "$0")
+
+	sed -e "s/%ATFBIN%/${ATFBIN}/" \
+		${SCRIPT_PATH}/genimage.cfg > ${GENIMAGE_CFG}
+
+	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/board/octavo/red/tfa-dts/osd32mp1-red.dts b/board/octavo/red/tfa-dts/osd32mp1-red.dts
new file mode 100644
index 0000000000..b7864fbc55
--- /dev/null
+++ b/board/octavo/red/tfa-dts/osd32mp1-red.dts
@@ -0,0 +1,615 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+ * Author: STM32CubeMX code generation for STMicroelectronics.
+ */
+
+/* For more information on Device Tree configuration, please refer to
+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
+ */
+
+/dts-v1/;
+#include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include "stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi"
+
+#include "stm32mp157c.dtsi"
+#include "stm32mp157cac-pinctrl.dtsi"
+#include "stm32mp15-ddr.dtsi"
+#include "stm32mp157c-security.dtsi"
+#include <dt-bindings/power/stm32mp1-power.h>
+
+
+/ {
+	model = "Octavo OSD32MP1-RED board";
+	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
+
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	aliases {
+		serial0 = &uart4;
+		serial1 = &usart3;
+		serial2 = &uart7;
+		gpio0 = &gpioa;
+		gpio1 = &gpiob;
+		gpio2 = &gpioc;
+		gpio3 = &gpiod;
+		gpio4 = &gpioe;
+		gpio5 = &gpiof;
+		gpio6 = &gpiog;
+		gpio7 = &gpioh;
+		gpio8 = &gpioi;
+		gpio25 = &gpioz;
+		i2c3 = &i2c4;
+	};
+
+
+	clocks {
+
+
+
+		clk_lse: clk-lse {
+			st,drive = < LSEDRV_MEDIUM_HIGH >;
+
+
+
+		};
+
+		clk_hse: clk-hse {
+			st,digbypass;
+
+
+
+		};
+	};
+
+}; /*root*/
+
+&pinctrl {
+	sdmmc1_pins_mx: sdmmc1_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
+					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
+					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
+					 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
+					 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <3>;
+		};
+	};
+
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
+
+	sdmmc3_pins_mx: sdmmc3_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
+					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
+					 <STM32_PINMUX('F', 1, AF9)>, /* SDMMC3_CMD */
+					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
+					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <2>;
+		};
+	};
+
+	uart4_pins_mx: uart4_mx-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+
+
+};
+
+&pinctrl_z {
+	i2c4_pins_z_mx: i2c4_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
+			         <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+
+
+};
+
+&rcc {
+	st,csi-cal;
+	st,hsi-cal;
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
+	st,clkdiv = <
+		1 		/*MPU*/
+		0 		/*AXI*/
+		0 		/*MCU*/
+		1 		/*APB1*/
+		1 		/*APB2*/
+		1 		/*APB3*/
+		1 		/*APB4*/
+		2 		/*APB5*/
+		23 		/*RTC*/
+		0 		/*MCO1*/
+		0 		/*MCO2*/
+	>;
+	st,pkcs = <
+		CLK_CKPER_HSE
+		CLK_ETH_PLL3Q
+		CLK_SDMMC12_PLL4P
+		CLK_DSI_DSIPLL
+		CLK_STGEN_HSE
+		CLK_USBPHY_HSE
+		CLK_SPI2S1_DISABLED
+		CLK_SPI2S23_PLL3Q
+		CLK_SPI45_PCLK2
+		CLK_SPI6_DISABLED
+		CLK_I2C46_HSI
+		CLK_SDMMC3_PLL4P
+                CLK_USBO_USBPHY
+		CLK_ADC_CKPER
+		CLK_CEC_DISABLED
+		CLK_I2C12_HSI
+		CLK_I2C35_PCLK1
+		CLK_UART1_DISABLED
+		CLK_UART24_HSI
+		CLK_UART35_HSI
+		CLK_UART6_DISABLED
+		CLK_UART78_DISABLED
+		CLK_SPDIF_DISABLED
+		CLK_SAI1_DISABLED
+		CLK_SAI2_CKPER
+		CLK_SAI3_DISABLED
+		CLK_SAI4_DISABLED
+		CLK_RNG1_LSI
+		CLK_LPTIM1_DISABLED
+		CLK_LPTIM23_DISABLED
+		CLK_LPTIM45_DISABLED
+	>;
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
+	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
+	pll4: st,pll@3 {
+		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
+	};
+};
+
+&bsec{
+	status = "okay";
+	secure-status = "okay";
+
+
+	board_id: board_id@ec {
+		reg = <0xec 0x4>;
+		status = "okay";
+		secure-status = "okay";
+	};
+
+};
+
+&etzpc{
+	st,decprot = <
+	/*"Non Secured" peripherals*/
+	DECPROT(STM32MP1_ETZPC_DCMI_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_ETH_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_I2C1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_I2C2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_I2C5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_SPI2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_RNG1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_SAI2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_SDMMC3_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_DLYBSD3_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_SPI5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_TIM5_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_UART4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+	DECPROT(STM32MP1_ETZPC_USART2_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+
+	/*Restriction: following IDs are not managed  - please to use User-Section if needed:
+		STM32MP1_ETZPC_DMA1_ID, STM32MP1_ETZPC_DMA2_ID, STM32MP1_ETZPC_DMAMUX_ID,
+		STM32MP1_ETZPC_SRAMx_ID, STM32MP1_ETZPC_RETRAM_ID, STM32MP1_ETZPC_BKPSRAM_ID*/
+
+
+		/*STM32CubeMX generates a basic and standard configuration for ETZPC.
+		Additional device configurations can be added here if needed.
+		"etzpc" node could be also overloaded in "addons" User-Section.*/
+
+	>;
+
+	secure-status = "okay";
+
+
+
+};
+
+&i2c4{
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_z_mx>;
+	status = "okay";
+	secure-status = "okay";
+
+
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		st,main-control-register = <0x04>;
+		st,vin-control-register = <0xc0>;
+		st,usb-control-register = <0x20>;
+
+		regulators {
+			compatible = "st,stpmic1-regulators";
+
+			ldo1-supply = <&v3v3>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo6-supply = <&v3v3>;
+
+			vddcore: buck1 {
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1200000>;
+				};
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr: buck2 {
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop {
+					regulator-suspend-microvolt = <1350000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr {
+					regulator-suspend-microvolt = <1350000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd: buck3 {
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop {
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr {
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+			};
+
+			v3v3: buck4 {
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+				lp-stop {
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			v1v8_audio: ldo1 {
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				standby-ddr-sr {
+						regulator-off-in-suspend;
+					};
+					standby-ddr-off {
+						regulator-off-in-suspend;
+					};
+			};
+
+			v3v3_hdmi: ldo2 {
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vtt_ddr: ldo3 {
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				lp-stop {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_usb: ldo4 {
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda: ldo5 {
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				regulator-boot-on;
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			v1v2_hdmi: ldo6 {
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				standby-ddr-sr {
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vref_ddr: vref_ddr {
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+				lp-stop {
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr {
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+};
+
+&iwdg2{
+	status = "okay";
+	secure-status = "okay";
+
+
+	timeout-sec = <32>;
+
+};
+
+&pwr{
+	status = "okay";
+	secure-status = "okay";
+
+
+	system_suspend_supported_soc_modes = <
+		STM32_PM_CSLEEP_RUN
+		STM32_PM_CSTOP_ALLOW_LP_STOP
+		STM32_PM_CSTOP_ALLOW_STANDBY_DDR_SR
+	>;
+	system_off_soc_mode = <STM32_PM_CSTOP_ALLOW_STANDBY_DDR_OFF>;
+
+	pwr-regulators {
+		vdd-supply = <&vdd>;
+	};
+
+};
+
+&rcc{
+	status = "okay";
+	secure-status = "okay";
+
+
+
+};
+
+&rng1{
+	status = "okay";
+	secure-status = "okay";
+
+
+
+};
+
+&rtc{
+	status = "okay";
+	secure-status = "okay";
+
+
+
+};
+
+&sdmmc1{
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_pins_mx>;
+	status = "okay";
+
+
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+
+};
+
+&sdmmc2{
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc2_pins_mx>;
+	status = "okay";
+
+
+
+};
+
+&sdmmc3{
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc3_pins_mx>;
+	status = "okay";
+
+
+
+};
+
+&tamp{
+	status = "okay";
+	secure-status = "okay";
+
+
+
+};
+
+&uart4{
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_mx>;
+	status = "okay";
+
+
+
+};
+
+
+/delete-node/ &qspi_bk1_pins_a;
+/delete-node/ &qspi_bk2_pins_a;
+/delete-node/ &qspi_clk_pins_a;
+/delete-node/ &sdmmc1_b4_pins_a;
+/delete-node/ &sdmmc1_dir_pins_a;
+/delete-node/ &sdmmc1_dir_pins_b;
+/delete-node/ &sdmmc2_b4_pins_a;
+/delete-node/ &sdmmc2_d47_pins_a;
+/delete-node/ &uart4_pins_a;
+/delete-node/ &uart7_pins_a;
+/delete-node/ &usart3_pins_a;
+/delete-node/ &usart3_pins_b;
+/delete-node/ &i2c4_pins_a;
+
+
diff --git a/board/octavo/red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi b/board/octavo/red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
new file mode 100644
index 0000000000..b85f6cde72
--- /dev/null
+++ b/board/octavo/red/tfa-dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
@@ -0,0 +1,119 @@
+/*
+ * Copyright (C) 2015-2018, STMicroelectronics - All Rights Reserved
+ *
+ * SPDX-License-Identifier:	GPL-2.0+	BSD-3-Clause
+ *
+ */
+
+/*
+ * File generated by STMicroelectronics STM32CubeMX DDR Tool for MPUs
+ * DDR type: DDR3 / DDR3L
+ * DDR width: 16bits
+ * DDR density: 4Gb
+ * System frequency: 533000Khz
+ * Relaxed Timing Mode: false
+ * Address mapping type: RBC
+ *
+ * Save Date: 2020.02.08, save Time: 23:22:33
+ */
+
+#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
+#define DDR_MEM_SPEED	533000
+#define DDR_MEM_SIZE	0x20000000
+
+#define DDR_MSTR 0x00041401
+#define DDR_MRCTRL0 0x00000010
+#define DDR_MRCTRL1 0x00000000
+#define DDR_DERATEEN 0x00000000
+#define DDR_DERATEINT 0x00800000
+#define DDR_PWRCTL 0x00000000
+#define DDR_PWRTMG 0x00400010
+#define DDR_HWLPCTL 0x00000000
+#define DDR_RFSHCTL0 0x00210000
+#define DDR_RFSHCTL3 0x00000000
+#define DDR_RFSHTMG 0x0081008B
+#define DDR_CRCPARCTL0 0x00000000
+#define DDR_DRAMTMG0 0x121B2414
+#define DDR_DRAMTMG1 0x000A041C
+#define DDR_DRAMTMG2 0x0608090F
+#define DDR_DRAMTMG3 0x0050400C
+#define DDR_DRAMTMG4 0x08040608
+#define DDR_DRAMTMG5 0x06060403
+#define DDR_DRAMTMG6 0x02020002
+#define DDR_DRAMTMG7 0x00000202
+#define DDR_DRAMTMG8 0x00001005
+#define DDR_DRAMTMG14 0x000000A0
+#define DDR_ZQCTL0 0xC2000040
+#define DDR_DFITMG0 0x02060105
+#define DDR_DFITMG1 0x00000202
+#define DDR_DFILPCFG0 0x07000000
+#define DDR_DFIUPD0 0xC0400003
+#define DDR_DFIUPD1 0x00000000
+#define DDR_DFIUPD2 0x00000000
+#define DDR_DFIPHYMSTR 0x00000000
+#define DDR_ODTCFG 0x06000600
+#define DDR_ODTMAP 0x00000001
+#define DDR_SCHED 0x00000C01
+#define DDR_SCHED1 0x00000000
+#define DDR_PERFHPR1 0x01000001
+#define DDR_PERFLPR1 0x08000200
+#define DDR_PERFWR1 0x08000400
+#define DDR_DBG0 0x00000000
+#define DDR_DBG1 0x00000000
+#define DDR_DBGCMD 0x00000000
+#define DDR_POISONCFG 0x00000000
+#define DDR_PCCFG 0x00000010
+#define DDR_PCFGR_0 0x00010000
+#define DDR_PCFGW_0 0x00000000
+#define DDR_PCFGQOS0_0 0x02100C03
+#define DDR_PCFGQOS1_0 0x00800100
+#define DDR_PCFGWQOS0_0 0x01100C03
+#define DDR_PCFGWQOS1_0 0x01000200
+#define DDR_PCFGR_1 0x00010000
+#define DDR_PCFGW_1 0x00000000
+#define DDR_PCFGQOS0_1 0x02100C03
+#define DDR_PCFGQOS1_1 0x00800040
+#define DDR_PCFGWQOS0_1 0x01100C03
+#define DDR_PCFGWQOS1_1 0x01000200
+#define DDR_ADDRMAP1 0x00070707
+#define DDR_ADDRMAP2 0x00000000
+#define DDR_ADDRMAP3 0x1F000000
+#define DDR_ADDRMAP4 0x00001F1F
+#define DDR_ADDRMAP5 0x06060606
+#define DDR_ADDRMAP6 0x0F060606
+#define DDR_ADDRMAP9 0x00000000
+#define DDR_ADDRMAP10 0x00000000
+#define DDR_ADDRMAP11 0x00000000
+#define DDR_PGCR 0x01442E02
+#define DDR_PTR0 0x0022AA5B
+#define DDR_PTR1 0x04841104
+#define DDR_PTR2 0x042DA068
+#define DDR_ACIOCR 0x10400812
+#define DDR_DXCCR 0x00000C40
+#define DDR_DSGCR 0xF200011F
+#define DDR_DCR 0x0000000B
+#define DDR_DTPR0 0x38D488D0
+#define DDR_DTPR1 0x098B00D8
+#define DDR_DTPR2 0x10023600
+#define DDR_MR0 0x00000840
+#define DDR_MR1 0x00000000
+#define DDR_MR2 0x00000208
+#define DDR_MR3 0x00000000
+#define DDR_ODTCR 0x00010000
+#define DDR_ZQ0CR1 0x00000038
+#define DDR_DX0GCR 0x0000CE81
+#define DDR_DX0DLLCR 0x40000000
+#define DDR_DX0DQTR 0xFFFFFFFF
+#define DDR_DX0DQSTR 0x3DB02000
+#define DDR_DX1GCR 0x0000CE81
+#define DDR_DX1DLLCR 0x40000000
+#define DDR_DX1DQTR 0xFFFFFFFF
+#define DDR_DX1DQSTR 0x3DB02000
+#define DDR_DX2GCR 0x0000CE80
+#define DDR_DX2DLLCR 0x40000000
+#define DDR_DX2DQTR 0xFFFFFFFF
+#define DDR_DX2DQSTR 0x3DB02000
+#define DDR_DX3GCR 0x0000CE80
+#define DDR_DX3DLLCR 0x40000000
+#define DDR_DX3DQTR 0xFFFFFFFF
+#define DDR_DX3DQSTR 0x3DB02000
diff --git a/board/octavo/red/uboot-patches/0001-Add-OSD32MP1-RED-Device-Tree-support.patch b/board/octavo/red/uboot-patches/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
new file mode 100644
index 0000000000..a2e39f2c35
--- /dev/null
+++ b/board/octavo/red/uboot-patches/0001-Add-OSD32MP1-RED-Device-Tree-support.patch
@@ -0,0 +1,1708 @@
+From cc7f758f6059f6d64010a1639ca57c9c010f916e Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
+Date: Sun, 31 Jan 2021 21:03:30 -0600
+Subject: [PATCH 1/2] Add OSD32MP1-RED Device Tree support
+
+Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>
+---
+ arch/arm/dts/osd32mp1-red-u-boot.dtsi         |  242 +++
+ arch/arm/dts/osd32mp1-red.dts                 | 1311 +++++++++++++++++
+ ...m32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi |  119 ++
+ 3 files changed, 1672 insertions(+)
+ create mode 100644 arch/arm/dts/osd32mp1-red-u-boot.dtsi
+ create mode 100644 arch/arm/dts/osd32mp1-red.dts
+ create mode 100644 arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
+
+diff --git a/arch/arm/dts/osd32mp1-red-u-boot.dtsi b/arch/arm/dts/osd32mp1-red-u-boot.dtsi
+new file mode 100644
+index 0000000000..801b021145
+--- /dev/null
++++ b/arch/arm/dts/osd32mp1-red-u-boot.dtsi
+@@ -0,0 +1,242 @@
++/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause*/
++/*
++ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
++ * Author: STM32CubeMX code generation for STMicroelectronics.
++ */
++
++/* For more information on Device Tree configuration, please refer to
++ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
++ */
++
++#include <dt-bindings/clock/stm32mp1-clksrc.h>
++#include "stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi"
++
++#include "stm32mp157-u-boot.dtsi"
++#include "stm32mp15-ddr.dtsi"
++
++
++
++
++/ {
++
++
++	aliases {
++		i2c3 = &i2c4;
++		mmc0 = &sdmmc1;					//orig
++		//mmc0 = &sdmmc2;						//custom
++	};
++	config {
++		u-boot,boot-led = "heartbeat";
++		u-boot,error-led = "error";
++		st,adc_usb_pd = <&adc1 18>, <&adc1 19>;
++		//st,fastboot-gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;	//custom
++		//st,stm32prog-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;	//custom
++	};
++	led {
++		red {
++			label = "error";
++			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
++			default-state = "off";
++			status = "okay";
++		};
++
++		blue {
++			default-state = "on";
++		};
++	};
++
++
++	clocks {
++		u-boot,dm-pre-reloc;
++
++
++
++
++		clk_lsi: clk-lsi {
++			u-boot,dm-pre-reloc;
++
++
++
++		};
++
++		clk_hsi: clk-hsi {
++			u-boot,dm-pre-reloc;
++
++
++
++		};
++
++		clk_csi: clk-csi {
++			u-boot,dm-pre-reloc;
++			status = "disabled";
++
++
++
++		};
++
++		clk_lse: clk-lse {
++			u-boot,dm-pre-reloc;
++			st,drive = < LSEDRV_MEDIUM_HIGH >;
++
++
++
++		};
++
++		clk_hse: clk-hse {
++			u-boot,dm-pre-reloc;
++			st,digbypass;
++
++
++
++		};
++	};
++
++}; /*root*/
++
++&rcc {
++	u-boot,dm-pre-reloc;
++	st,clksrc = <
++		CLK_MPU_PLL1P
++		CLK_AXI_PLL2P
++		CLK_MCU_PLL3P
++		CLK_PLL12_HSE
++		CLK_PLL3_HSE
++		CLK_PLL4_HSE
++		CLK_RTC_LSE
++		CLK_MCO1_DISABLED
++		CLK_MCO2_DISABLED
++	>;
++	st,clkdiv = <
++		1 		/*MPU*/
++		0 		/*AXI*/
++		0 		/*MCU*/
++		1 		/*APB1*/
++		1 		/*APB2*/
++		1 		/*APB3*/
++		1 		/*APB4*/
++		2 		/*APB5*/
++		23 		/*RTC*/
++		0 		/*MCO1*/
++		0 		/*MCO2*/
++	>;
++	st,pkcs = <
++		CLK_CKPER_DISABLED
++		CLK_ETH_PLL3Q
++		CLK_SDMMC12_PLL4P
++		CLK_DSI_DSIPLL
++		CLK_STGEN_HSE
++		CLK_USBPHY_DISABLED
++		CLK_SPI2S1_DISABLED
++		CLK_SPI2S23_PLL3Q
++		CLK_SPI45_DISABLED
++		CLK_SPI6_DISABLED
++		CLK_I2C46_HSI
++		CLK_SDMMC3_PLL4P
++		CLK_ADC_DISABLED
++		CLK_CEC_DISABLED
++		CLK_I2C12_HSI
++		CLK_I2C35_DISABLED
++		CLK_UART1_DISABLED
++		CLK_UART24_HSI
++		CLK_UART35_DISABLED
++		CLK_UART6_DISABLED
++		CLK_UART78_DISABLED
++		CLK_SPDIF_DISABLED
++		CLK_SAI2_CKPER
++		CLK_SAI2_DISABLED
++		CLK_SAI3_DISABLED
++		CLK_SAI4_DISABLED
++		CLK_RNG1_LSI
++		CLK_LPTIM1_DISABLED
++		CLK_LPTIM23_DISABLED
++		CLK_LPTIM45_DISABLED
++	>;
++	pll1:st,pll@0 {
++		cfg = < 2 80 0 1 1 PQR(1,0,0) >;
++		frac = < 0x800>;
++		u-boot,dm-pre-reloc;
++	};
++	pll2:st,pll@1 {
++		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
++		frac = < 0x1400>;
++		u-boot,dm-pre-reloc;
++	};
++	pll3:st,pll@2 {
++		cfg = < 1 61 3 5 36 PQR(1,1,0) >;
++		frac = < 0x1000 >;
++		u-boot,dm-pre-reloc;
++	};
++	pll4:st,pll@3 {
++		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++&rcc{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++&sdmmc1{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++&sdmmc2{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++&sdmmc3{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++
++
++
++};
++
++
++&pmic {
++	u-boot,dm-pre-reloc;
++};
++
++&v3v3 {
++	regulator-always-on;
++};
++
++&uart4_pins_mx {
++	u-boot,dm-pre-reloc;
++	pins1 {
++		u-boot,dm-pre-reloc;
++		/* pull-up on rx to avoid floating level */
++		bias-pull-up;
++	};
++	pins2 {
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&adc {
++	status = "okay";
++};
++
++
+diff --git a/arch/arm/dts/osd32mp1-red.dts b/arch/arm/dts/osd32mp1-red.dts
+new file mode 100644
+index 0000000000..2cc1961d08
+--- /dev/null
++++ b/arch/arm/dts/osd32mp1-red.dts
+@@ -0,0 +1,1311 @@
++/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
++/*
++ * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
++ * Author: STM32CubeMX code generation for STMicroelectronics.
++ */
++
++/* For more information on Device Tree configuration, please refer to
++ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
++ */
++
++/dts-v1/;
++#include "stm32mp157c.dtsi"
++#include "stm32mp157cac-pinctrl.dtsi"
++#include "stm32mp157c-m4-srm.dtsi"
++
++
++#include <dt-bindings/input/input.h>
++#include <dt-bindings/mfd/st,stpmic1.h>
++#include <dt-bindings/rtc/rtc-stm32.h>
++
++
++/ {
++	model = "Octavo OSD32MP1-RED board";
++	compatible = "octavo,osd32mp1-red", "st,stm32mp157";
++
++	memory@c0000000 {
++		reg = <0xc0000000 0x20000000>;
++
++
++    wifi_pwrseq: wifi-pwrseq {
++  		compatible = "mmc-pwrseq-simple";
++  		reset-gpios = <&gpiog 5 GPIO_ACTIVE_LOW>;     //custom
++  	};
++
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++
++
++		retram: retram@0x38000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x38000000 0x10000>;
++			no-map;
++		};
++
++		mcuram: mcuram@0x30000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x30000000 0x40000>;
++			no-map;
++		};
++
++		mcuram2: mcuram2@0x10000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10000000 0x40000>;
++			no-map;
++		};
++
++		vdev0vring0: vdev0vring0@10040000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10040000 0x2000>;
++			no-map;
++		};
++
++		vdev0vring1: vdev0vring1@10042000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10042000 0x2000>;
++			no-map;
++		};
++
++		vdev0buffer: vdev0buffer@10044000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10044000 0x4000>;
++			no-map;
++		};
++
++
++		gpu_reserved: gpu@d4000000 {
++			reg = <0xd4000000 0x4000000>;
++			no-map;
++		};
++	};
++
++
++	aliases {
++		ethernet0 = &ethernet0;
++		serial0 = &uart4;
++		serial1 = &usart3;
++		serial2 = &uart7;
++		serial3 = &usart2;
++	};
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++
++	sram: sram@10050000 {
++		compatible = "mmio-sram";
++		reg = <0x10050000 0x10000>;
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges = <0 0x10050000 0x10000>;
++
++		dma_pool: dma_pool@0 {
++			reg = <0x0 0x10000>;
++			pool;
++		};
++	};
++
++	led {
++		compatible = "gpio-leds";
++		blue {
++			label = "heartbeat";
++			gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
++			linux,default-trigger = "heartbeat";
++			default-state = "off";
++		};
++
++    //custom_gpios{                             //custom
++    //gpios = <&gpiod 11 GPIO_ACTIVE_HIGH>;
++    //default-state = "on";
++    //};
++	};
++
++	/*sound {
++		compatible = "audio-graph-card";
++		label = "STM32MP1-DK";
++		routing =
++			"Playback" , "MCLK",
++			"Capture" , "MCLK",
++			"MICL" , "Mic Bias";
++		dais = <&sai2a_port &sai2b_port &i2s2_port>;
++		status = "okay";
++	}; */
++
++	usb_phy_tuning: usb-phy-tuning {
++		st,hs-dc-level = <2>;
++		st,fs-rftime-tuning;
++		st,hs-rftime-reduction;
++		st,hs-current-trim = <15>;
++		st,hs-impedance-trim = <1>;
++		st,squelch-level = <3>;
++		st,hs-rx-offset = <2>;
++		st,no-lsfs-sc;
++	};
++
++
++
++	clocks {
++
++    clk_ext_camera: clk-ext-camera {
++			#clock-cells = <0>;
++			compatible = "fixed-clock";
++			clock-frequency = <24000000>;
++		};
++
++
++		clk_lsi: clk-lsi {
++			clock-frequency = <32000>;
++		};
++
++		clk_hsi: clk-hsi {
++			clock-frequency = <64000000>;
++		};
++
++		clk_csi: clk-csi {
++			clock-frequency = <4000000>;
++		};
++
++		clk_lse: clk-lse {
++			clock-frequency = <32768>;
++		};
++
++		clk_hse: clk-hse {
++			clock-frequency = <24000000>;
++		};
++	};
++
++}; /*root*/
++
++&pinctrl {
++	u-boot,dm-pre-reloc;
++
++	dcmi_pins_mx: dcmi_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
++					 <STM32_PINMUX('A', 6, AF13)>, /* DCMI_PIXCLK */
++					 <STM32_PINMUX('A', 10, AF13)>, /* DCMI_D1 */
++					 <STM32_PINMUX('B', 9, AF13)>, /* DCMI_D7 */
++					 <STM32_PINMUX('C', 6, AF13)>, /* DCMI_D0 */
++					 <STM32_PINMUX('E', 0, AF13)>, /* DCMI_D2 */
++					 <STM32_PINMUX('E', 1, AF13)>, /* DCMI_D3 */
++					 <STM32_PINMUX('E', 4, AF13)>, /* DCMI_D4 */
++					 <STM32_PINMUX('E', 13, AF13)>, /* DCMI_D6 */
++					 <STM32_PINMUX('G', 9, AF13)>, /* DCMI_VSYNC */
++					 <STM32_PINMUX('H', 6, AF13)>, /* DCMI_D8 */
++					 <STM32_PINMUX('H', 7, AF13)>, /* DCMI_D9 */
++					 <STM32_PINMUX('H', 15, AF13)>, /* DCMI_D11 */
++					 <STM32_PINMUX('I', 3, AF13)>, /* DCMI_D10 */
++					 <STM32_PINMUX('I', 4, AF13)>; /* DCMI_D5 */
++			bias-disable;
++		};
++	};
++
++	dcmi_sleep_pins_mx: dcmi_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 4, ANALOG)>, /* DCMI_HSYNC */
++					 <STM32_PINMUX('A', 6, ANALOG)>, /* DCMI_PIXCLK */
++					 <STM32_PINMUX('A', 10, ANALOG)>, /* DCMI_D1 */
++					 <STM32_PINMUX('B', 9, ANALOG)>, /* DCMI_D7 */
++					 <STM32_PINMUX('C', 6, ANALOG)>, /* DCMI_D0 */
++					 <STM32_PINMUX('E', 0, ANALOG)>, /* DCMI_D2 */
++					 <STM32_PINMUX('E', 1, ANALOG)>, /* DCMI_D3 */
++					 <STM32_PINMUX('E', 4, ANALOG)>, /* DCMI_D4 */
++					 <STM32_PINMUX('E', 13, ANALOG)>, /* DCMI_D6 */
++					 <STM32_PINMUX('G', 9, ANALOG)>, /* DCMI_VSYNC */
++					 <STM32_PINMUX('H', 6, ANALOG)>, /* DCMI_D8 */
++					 <STM32_PINMUX('H', 7, ANALOG)>, /* DCMI_D9 */
++					 <STM32_PINMUX('H', 15, ANALOG)>, /* DCMI_D11 */
++					 <STM32_PINMUX('I', 3, ANALOG)>, /* DCMI_D10 */
++					 <STM32_PINMUX('I', 4, ANALOG)>; /* DCMI_D5 */
++		};
++	};
++
++	eth1_pins_mx: eth1_mx-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('A', 1, AF11)>, /* ETH1_RX_CLK */
++					 <STM32_PINMUX('A', 7, AF11)>, /* ETH1_RX_CTL */
++					 <STM32_PINMUX('B', 0, AF11)>, /* ETH1_RXD2 */
++					 <STM32_PINMUX('B', 1, AF11)>, /* ETH1_RXD3 */
++					 <STM32_PINMUX('C', 4, AF11)>, /* ETH1_RXD0 */
++					 <STM32_PINMUX('C', 5, AF11)>; /* ETH1_RXD1 */
++			bias-disable;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH1_MDIO */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins3 {
++			pinmux = <STM32_PINMUX('B', 11, AF11)>, /* ETH1_TX_CTL */
++					 <STM32_PINMUX('C', 1, AF11)>, /* ETH1_MDC */
++					 <STM32_PINMUX('C', 2, AF11)>, /* ETH1_TXD2 */
++					 <STM32_PINMUX('E', 2, AF11)>, /* ETH1_TXD3 */
++					 <STM32_PINMUX('G', 4, AF11)>, /* ETH1_GTX_CLK */
++					 <STM32_PINMUX('G', 13, AF11)>, /* ETH1_TXD0 */
++					 <STM32_PINMUX('G', 14, AF11)>; /* ETH1_TXD1 */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <2>;
++		};
++	};
++
++	eth1_sleep_pins_mx: eth1_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 1, ANALOG)>, /* ETH1_RX_CLK */
++					 <STM32_PINMUX('A', 2, ANALOG)>, /* ETH1_MDIO */
++					 <STM32_PINMUX('A', 7, ANALOG)>, /* ETH1_RX_CTL */
++					 <STM32_PINMUX('B', 0, ANALOG)>, /* ETH1_RXD2 */
++					 <STM32_PINMUX('B', 1, ANALOG)>, /* ETH1_RXD3 */
++					 <STM32_PINMUX('B', 11, ANALOG)>, /* ETH1_TX_CTL */
++					 <STM32_PINMUX('C', 1, ANALOG)>, /* ETH1_MDC */
++					 <STM32_PINMUX('C', 2, ANALOG)>, /* ETH1_TXD2 */
++					 <STM32_PINMUX('C', 4, ANALOG)>, /* ETH1_RXD0 */
++					 <STM32_PINMUX('C', 5, ANALOG)>, /* ETH1_RXD1 */
++					 <STM32_PINMUX('E', 2, ANALOG)>, /* ETH1_TXD3 */
++					 <STM32_PINMUX('G', 4, ANALOG)>, /* ETH1_GTX_CLK */
++					 <STM32_PINMUX('G', 13, ANALOG)>, /* ETH1_TXD0 */
++					 <STM32_PINMUX('G', 14, ANALOG)>; /* ETH1_TXD1 */
++		};
++	};
++
++	i2c1_pins_mx: i2c1_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 12, AF5)>, /* I2C1_SCL */
++					 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c1_sleep_pins_mx: i2c1_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 12, ANALOG)>, /* I2C1_SCL */
++					 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
++		};
++	};
++
++	i2c2_pins_mx: i2c2_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c2_sleep_pins_mx: i2c2_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
++		};
++	};
++
++	i2s2_pins_mx: i2s2_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 12, AF5)>, /* I2S2_WS */
++					 <STM32_PINMUX('B', 13, AF5)>, /* I2S2_CK */
++					 <STM32_PINMUX('C', 3, AF5)>; /* I2S2_SDO */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++	};
++
++	i2s2_sleep_pins_mx: i2s2_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 12, ANALOG)>, /* I2S2_WS */
++					 <STM32_PINMUX('B', 13, ANALOG)>, /* I2S2_CK */
++					 <STM32_PINMUX('C', 3, ANALOG)>; /* I2S2_SDO */
++		};
++	};
++
++	ltdc_pins_mx: ltdc_mx-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('A', 3, AF14)>, /* LTDC_B5 */
++					 <STM32_PINMUX('B', 8, AF14)>, /* LTDC_B6 */
++					 <STM32_PINMUX('C', 0, AF14)>, /* LTDC_R5 */
++					 <STM32_PINMUX('D', 8, AF14)>, /* LTDC_B7 */
++					 <STM32_PINMUX('D', 9, AF14)>, /* LTDC_B0 */
++					 <STM32_PINMUX('D', 10, AF14)>, /* LTDC_B3 */
++					 <STM32_PINMUX('E', 6, AF14)>, /* LTDC_G1 */
++					 <STM32_PINMUX('E', 12, AF14)>, /* LTDC_B4 */
++					 <STM32_PINMUX('E', 14, AF13)>, /* LTDC_G0 */
++					 <STM32_PINMUX('E', 15, AF14)>, /* LTDC_R7 */
++					 <STM32_PINMUX('F', 10, AF14)>, /* LTDC_DE */
++					 <STM32_PINMUX('G', 10, AF14)>, /* LTDC_B2 */
++					 <STM32_PINMUX('G', 12, AF14)>, /* LTDC_B1 */
++					 <STM32_PINMUX('H', 2, AF14)>, /* LTDC_R0 */
++					 <STM32_PINMUX('H', 3, AF14)>, /* LTDC_R1 */
++					 <STM32_PINMUX('H', 4, AF14)>, /* LTDC_G4 */
++					 <STM32_PINMUX('H', 8, AF14)>, /* LTDC_R2 */
++					 <STM32_PINMUX('H', 9, AF14)>, /* LTDC_R3 */
++					 <STM32_PINMUX('H', 10, AF14)>, /* LTDC_R4 */
++					 <STM32_PINMUX('H', 12, AF14)>, /* LTDC_R6 */
++					 <STM32_PINMUX('H', 13, AF14)>, /* LTDC_G2 */
++					 <STM32_PINMUX('H', 14, AF14)>, /* LTDC_G3 */
++					 <STM32_PINMUX('I', 0, AF14)>, /* LTDC_G5 */
++					 <STM32_PINMUX('I', 1, AF14)>, /* LTDC_G6 */
++					 <STM32_PINMUX('I', 2, AF14)>, /* LTDC_G7 */
++					 <STM32_PINMUX('I', 9, AF14)>, /* LTDC_VSYNC */
++					 <STM32_PINMUX('I', 10, AF14)>; /* LTDC_HSYNC */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('G', 7, AF14)>; /* LTDC_CLK */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++	};
++
++	ltdc_sleep_pins_mx: ltdc_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 3, ANALOG)>, /* LTDC_B5 */
++					 <STM32_PINMUX('B', 8, ANALOG)>, /* LTDC_B6 */
++					 <STM32_PINMUX('C', 0, ANALOG)>, /* LTDC_R5 */
++					 <STM32_PINMUX('D', 8, ANALOG)>, /* LTDC_B7 */
++					 <STM32_PINMUX('D', 9, ANALOG)>, /* LTDC_B0 */
++					 <STM32_PINMUX('D', 10, ANALOG)>, /* LTDC_B3 */
++					 <STM32_PINMUX('E', 6, ANALOG)>, /* LTDC_G1 */
++					 <STM32_PINMUX('E', 12, ANALOG)>, /* LTDC_B4 */
++					 <STM32_PINMUX('E', 14, ANALOG)>, /* LTDC_G0 */
++					 <STM32_PINMUX('E', 15, ANALOG)>, /* LTDC_R7 */
++					 <STM32_PINMUX('F', 10, ANALOG)>, /* LTDC_DE */
++					 <STM32_PINMUX('G', 7, ANALOG)>, /* LTDC_CLK */
++					 <STM32_PINMUX('G', 10, ANALOG)>, /* LTDC_B2 */
++					 <STM32_PINMUX('G', 12, ANALOG)>, /* LTDC_B1 */
++					 <STM32_PINMUX('H', 2, ANALOG)>, /* LTDC_R0 */
++					 <STM32_PINMUX('H', 3, ANALOG)>, /* LTDC_R1 */
++					 <STM32_PINMUX('H', 4, ANALOG)>, /* LTDC_G4 */
++					 <STM32_PINMUX('H', 8, ANALOG)>, /* LTDC_R2 */
++					 <STM32_PINMUX('H', 9, ANALOG)>, /* LTDC_R3 */
++					 <STM32_PINMUX('H', 10, ANALOG)>, /* LTDC_R4 */
++					 <STM32_PINMUX('H', 12, ANALOG)>, /* LTDC_R6 */
++					 <STM32_PINMUX('H', 13, ANALOG)>, /* LTDC_G2 */
++					 <STM32_PINMUX('H', 14, ANALOG)>, /* LTDC_G3 */
++					 <STM32_PINMUX('I', 0, ANALOG)>, /* LTDC_G5 */
++					 <STM32_PINMUX('I', 1, ANALOG)>, /* LTDC_G6 */
++					 <STM32_PINMUX('I', 2, ANALOG)>, /* LTDC_G7 */
++					 <STM32_PINMUX('I', 9, ANALOG)>, /* LTDC_VSYNC */
++					 <STM32_PINMUX('I', 10, ANALOG)>; /* LTDC_HSYNC */
++		};
++	};
++
++	sdmmc1_pins_mx: sdmmc1_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
++					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
++					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
++					 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
++					 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <3>;
++		};
++	};
++
++	sdmmc1_opendrain_pins_mx: sdmmc1_opendrain_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
++					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
++					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
++					 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <3>;
++		};
++		pins3 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <1>;
++		};
++	};
++
++	sdmmc1_sleep_pins_mx: sdmmc1_sleep_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
++					 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
++					 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
++					 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
++					 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
++					 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
++		};
++	};
++
++	sdmmc2_pins_mx: sdmmc2_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
++					 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
++					 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
++					 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
++					 <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
++					 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
++					 <STM32_PINMUX('C', 7, AF10)>, /* SDMMC2_D7 */
++					 <STM32_PINMUX('E', 5, AF9)>, /* SDMMC2_D6 */
++					 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
++			bias-pull-up;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
++			bias-pull-up;
++			drive-push-pull;
++			slew-rate = <2>;
++		};
++	};
++
++	sdmmc2_opendrain_pins_mx: sdmmc2_opendrain_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('A', 8, AF9)>, /* SDMMC2_D4 */
++					 <STM32_PINMUX('A', 9, AF10)>, /* SDMMC2_D5 */
++					 <STM32_PINMUX('B', 3, AF9)>, /* SDMMC2_D2 */
++					 <STM32_PINMUX('B', 4, AF9)>, /* SDMMC2_D3 */
++					 <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
++					 <STM32_PINMUX('B', 15, AF9)>, /* SDMMC2_D1 */
++					 <STM32_PINMUX('C', 7, AF10)>, /* SDMMC2_D7 */
++					 <STM32_PINMUX('E', 5, AF9)>; /* SDMMC2_D6 */
++			bias-pull-up;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
++			bias-pull-up;
++			drive-push-pull;
++			slew-rate = <2>;
++		};
++		pins3 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
++			bias-pull-up;
++			drive-open-drain;
++			slew-rate = <1>;
++		};
++	};
++
++	sdmmc2_sleep_pins_mx: sdmmc2_sleep_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('A', 8, ANALOG)>, /* SDMMC2_D4 */
++					 <STM32_PINMUX('A', 9, ANALOG)>, /* SDMMC2_D5 */
++					 <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC2_D2 */
++					 <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC2_D3 */
++					 <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC2_D0 */
++					 <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC2_D1 */
++					 <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC2_D7 */
++					 <STM32_PINMUX('E', 3, ANALOG)>, /* SDMMC2_CK */
++					 <STM32_PINMUX('E', 5, ANALOG)>, /* SDMMC2_D6 */
++					 <STM32_PINMUX('G', 6, ANALOG)>; /* SDMMC2_CMD */
++		};
++	};
++
++	sdmmc3_pins_mx: sdmmc3_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
++					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
++					 <STM32_PINMUX('F', 1, AF9)>, /* SDMMC3_CMD */
++					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
++					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <2>;
++		};
++	};
++
++	sdmmc3_opendrain_pins_mx: sdmmc3_opendrain_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('D', 7, AF10)>, /* SDMMC3_D3 */
++					 <STM32_PINMUX('F', 0, AF9)>, /* SDMMC3_D0 */
++					 <STM32_PINMUX('F', 4, AF9)>, /* SDMMC3_D1 */
++					 <STM32_PINMUX('F', 5, AF9)>; /* SDMMC3_D2 */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('F', 1, AF9)>; /* SDMMC3_CMD */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <1>;
++		};
++		pins3 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('G', 15, AF10)>; /* SDMMC3_CK */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <2>;
++		};
++	};
++
++	sdmmc3_sleep_pins_mx: sdmmc3_sleep_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('D', 7, ANALOG)>, /* SDMMC3_D3 */
++					 <STM32_PINMUX('F', 0, ANALOG)>, /* SDMMC3_D0 */
++					 <STM32_PINMUX('F', 1, ANALOG)>, /* SDMMC3_CMD */
++					 <STM32_PINMUX('F', 4, ANALOG)>, /* SDMMC3_D1 */
++					 <STM32_PINMUX('F', 5, ANALOG)>, /* SDMMC3_D2 */
++					 <STM32_PINMUX('G', 15, ANALOG)>; /* SDMMC3_CK */
++		};
++	};
++
++	uart4_pins_mx: uart4_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
++			bias-disable;
++		};
++		pins2 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	uart4_sleep_pins_mx: uart4_sleep_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('B', 2, ANALOG)>, /* UART4_RX */
++					 <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
++		};
++	};
++
++	usart2_pins_mx: usart2_mx-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('D', 3, AF7)>, /* USART2_CTS */
++					 <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
++			bias-disable;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('D', 4, AF7)>, /* USART2_RTS */
++					 <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	usart2_sleep_pins_mx: usart2_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 3, ANALOG)>, /* USART2_CTS */
++					 <STM32_PINMUX('D', 4, ANALOG)>, /* USART2_RTS */
++					 <STM32_PINMUX('D', 5, ANALOG)>, /* USART2_TX */
++					 <STM32_PINMUX('D', 6, ANALOG)>; /* USART2_RX */
++		};
++	};
++
++
++
++};
++
++&pinctrl_z {
++	u-boot,dm-pre-reloc;
++
++	i2c2_pins_z_mx: i2c2_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('Z', 6, AF3)>; /* I2C2_SCL */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c2_sleep_pins_z_mx: i2c2_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('Z', 6, ANALOG)>; /* I2C2_SCL */
++		};
++	};
++
++	i2c4_pins_z_mx: i2c4_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
++					 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c4_sleep_pins_z_mx: i2c4_sleep_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
++					 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
++		};
++	};
++
++
++
++};
++
++&m4_rproc{
++	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
++	mboxes = <&ipcc 2>;
++	mbox-names = "shutdown";
++	recovery;
++	status = "okay";
++
++
++	interrupt-parent = <&exti>;
++	interrupts = <68 1>;
++	interrupt-names = "wdg";
++	wakeup-source;
++
++};
++
++&bsec{
++	status = "okay";
++
++
++
++};
++
++&dcmi{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&dcmi_pins_mx>;
++	pinctrl-1 = <&dcmi_sleep_pins_mx>;
++	status = "okay";
++
++
++
++  port {
++		dcmi_0: endpoint {
++			remote-endpoint = <&ov5640_0>;
++			bus-width = <8>;
++			hsync-active = <0>;
++			vsync-active = <0>;
++			pclk-sample = <1>;
++			pclk-max-frequency = <77000000>;
++		};
++	};
++
++
++};
++
++&dsi{
++	status = "okay";
++
++
++
++  #address-cells = <1>;
++	#size-cells = <0>;
++	status = "okay";
++
++	ports {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		port@0 {
++			reg = <0>;
++			dsi_in: endpoint {
++				remote-endpoint = <&ltdc_ep1_out>;
++			};
++		};
++
++		port@1 {
++			reg = <1>;
++			dsi_out: endpoint {
++				remote-endpoint = <&panel_in>;
++			};
++		};
++	};
++
++	panel@0 {
++		compatible = "orisetech,otm8009a";
++		reg = <0>;
++		reset-gpios = <&gpioe 9 GPIO_ACTIVE_LOW>;
++		power-supply = <&v3v3>;
++		status = "okay";
++
++		port {
++			panel_in: endpoint {
++				remote-endpoint = <&dsi_out>;
++			};
++		};
++	};
++
++
++};
++
++&ethernet0{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&eth1_pins_mx>;
++	pinctrl-1 = <&eth1_sleep_pins_mx>;
++	status = "okay";
++
++
++  st,eth_clk_sel = <1>;  //custom
++  phy-mode = "rgmii-id";
++	max-speed = <1000>;
++	phy-handle = <&phy0>;
++
++	mdio0 {
++		#address-cells = <1>;
++		#size-cells = <0>;
++		compatible = "snps,dwmac-mdio";
++		phy0: ethernet-phy@0 {
++			reg = <0>;
++		};
++	};
++
++
++};
++
++&gpu{
++	status = "okay";
++
++
++	contiguous-area = <&gpu_reserved>;
++
++};
++
++&hsem{
++	status = "okay";
++
++
++
++};
++
++&i2c1{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c1_pins_mx>;
++	pinctrl-1 = <&i2c1_sleep_pins_mx>;
++	status = "okay";
++
++
++
++  i2c-scl-rising-time-ns = <100>;
++	i2c-scl-falling-time-ns = <7>;
++
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++
++	touchscreen@2a {
++		compatible = "focaltech,ft6236";
++		reg = <0x2a>;
++		interrupts = <2 2>;
++		interrupt-parent = <&gpiof>;
++		interrupt-controller;
++		touchscreen-size-x = <480>;
++		touchscreen-size-y = <800>;
++		status = "okay";
++	};
++	touchscreen@38 {
++		compatible = "focaltech,ft6336";
++		reg = <0x38>;
++		interrupts = <2 2>;
++		interrupt-parent = <&gpiof>;
++		interrupt-controller;
++		touchscreen-size-x = <480>;
++		touchscreen-size-y = <800>;
++		status = "okay";
++	};
++
++
++};
++
++&i2c2{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c2_pins_mx &i2c2_pins_z_mx>;
++	pinctrl-1 = <&i2c2_sleep_pins_mx &i2c2_sleep_pins_z_mx>;
++	status = "okay";
++
++
++
++  i2c-scl-rising-time-ns = <185>;
++	i2c-scl-falling-time-ns = <20>;
++
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++  ov5640: camera@3c {
++		compatible = "ovti,ov5640";
++		reg = <0x3c>;
++		clocks = <&clk_ext_camera>;
++		clock-names = "xclk";
++		DOVDD-supply = <&v3v3>;
++		//powerdown-gpios = <&stmfx_pinctrl 18 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
++		//reset-gpios = <&stmfx_pinctrl 19 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
++    //powerdown-gpios = <&gpioc 3 GPIO_ACTIVE_HIGH>;  //custom
++    //reset-gpios = <&gpioa 14 GPIO_ACTIVE_LOW>;  //custom
++		rotation = <180>;
++		status = "okay";
++
++		port {
++			ov5640_0: endpoint {
++				remote-endpoint = <&dcmi_0>;
++				bus-width = <8>;
++				data-shift = <2>; /* lines 9:2 are used */
++				hsync-active = <0>;
++				vsync-active = <0>;
++				pclk-sample = <1>;
++				pclk-max-frequency = <77000000>;
++			};
++		};
++	};
++
++
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c4_pins_z_mx>;
++	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
++	status = "okay";
++
++
++	i2c-scl-rising-time-ns = <185>;
++	i2c-scl-falling-time-ns = <20>;
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++	typec: stusb1600@28 {
++		compatible = "st,stusb1600";
++		reg = <0x28>;
++		interrupt-parent = <&gpioe>;
++		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
++		pinctrl-0 = <&stusb1600_pins_a>;
++		pinctrl-names = "default";
++		status = "okay";
++
++		typec_con: connector {
++			compatible = "usb-c-connector";
++			label = "USB-C";
++			power-role = "dual";
++			power-opmode = "default";
++		};
++	};
++
++	pmic: stpmic@33 {
++		compatible = "st,stpmic1";
++		reg = <0x33>;
++		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
++		interrupt-controller;
++		#interrupt-cells = <2>;
++		status = "okay";
++
++		st,main-control-register = <0x04>;
++		st,vin-control-register = <0xc0>;
++		st,usb-control-register = <0x20>;
++
++		regulators {
++			compatible = "st,stpmic1-regulators";
++
++			ldo1-supply = <&v3v3>;
++			ldo3-supply = <&vdd_ddr>;
++			ldo6-supply = <&v3v3>;
++			pwr_sw1-supply = <&bst_out>;
++			pwr_sw2-supply = <&bst_out>;
++
++			vddcore: buck1 {
++				regulator-name = "vddcore";
++				regulator-min-microvolt = <1200000>;
++				regulator-max-microvolt = <1350000>;
++				regulator-always-on;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			vdd_ddr: buck2 {
++				regulator-name = "vdd_ddr";
++				regulator-min-microvolt = <1350000>;
++				regulator-max-microvolt = <1350000>;
++				regulator-always-on;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			vdd: buck3 {
++				regulator-name = "vdd";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				st,mask-reset;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			v3v3: buck4 {
++				regulator-name = "v3v3";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				regulator-over-current-protection;
++				regulator-initial-mode = <0>;
++			};
++
++			v1v8_audio: ldo1 {
++				regulator-name = "v1v8_audio";
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <1800000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO1 0>;
++
++			};
++
++			v3v3_hdmi: ldo2 {
++				regulator-name = "v3v3_hdmi";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO2 0>;
++
++			};
++
++			vtt_ddr: ldo3 {
++				regulator-name = "vtt_ddr";
++				regulator-min-microvolt = <500000>;
++				regulator-max-microvolt = <750000>;
++				regulator-always-on;
++				regulator-over-current-protection;
++			};
++
++			vdd_usb: ldo4 {
++				regulator-name = "vdd_usb";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				interrupts = <IT_CURLIM_LDO4 0>;
++			};
++
++      v3v3_eth: ldo5 {                           //custom
++				regulator-name = "v3v3_eth";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				interrupts = <IT_CURLIM_LDO5 0>;
++				regulator-boot-on;
++			};
++
++			v3v3_dsi: ldo6 {                           //custom
++				regulator-name = "v3v3_dsi";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO6 0>;
++
++			};
++
++			vref_ddr: vref_ddr {
++				regulator-name = "vref_ddr";
++				regulator-always-on;
++				regulator-over-current-protection;
++			};
++
++      bst_out: boost {
++       regulator-name = "bst_out";
++       interrupts = <IT_OCP_BOOST 0>;
++       regulator-always-on;                    //custom
++      };
++
++     vbus_otg: pwr_sw1 {
++       regulator-name = "vbus_otg";
++       interrupts = <IT_OCP_OTG 0>;
++       regulator-active-discharge;
++       regulator-always-on;                    //custom
++      };
++
++      vbus_sw: pwr_sw2 {
++       regulator-name = "vbus_sw";
++       interrupts = <IT_OCP_SWOUT 0>;
++       regulator-active-discharge;
++       regulator-always-on;                    //custom
++      };
++		};
++
++		onkey {
++			compatible = "st,stpmic1-onkey";
++			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 1>;
++			interrupt-names = "onkey-falling", "onkey-rising";
++			status = "okay";
++		};
++
++		watchdog {
++			compatible = "st,stpmic1-wdt";
++			status = "disabled";
++		};
++	};
++
++};
++
++&i2s2{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2s2_pins_mx>;
++	pinctrl-1 = <&i2s2_sleep_pins_mx>;
++	status = "okay";
++
++
++
++};
++
++&ipcc{
++	status = "okay";
++
++
++
++};
++
++&iwdg2{
++	status = "okay";
++
++
++	timeout-sec = <32>;
++
++};
++
++&ltdc{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&ltdc_pins_mx>;
++	pinctrl-1 = <&ltdc_sleep_pins_mx>;
++	status = "okay";
++
++
++
++  port {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ltdc_ep1_out: endpoint@1 {
++			reg = <1>;
++			remote-endpoint = <&dsi_in>;
++		};
++	};
++
++
++
++};
++
++&pwr{
++	status = "okay";
++
++
++	pwr-regulators {
++		vdd-supply = <&vdd>;
++		vdd_3v3_usbfs-supply = <&vdd_usb>;
++	};
++
++};
++
++&rcc{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++
++
++};
++
++&rng1{
++	status = "okay";
++
++
++
++};
++
++&rtc{
++	status = "okay";
++
++
++	st,lsco = <RTC_OUT2_RMP>;
++
++};
++
++&sdmmc1{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc1_pins_mx>;
++	pinctrl-1 = <&sdmmc1_opendrain_pins_mx>;
++	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
++	status = "okay";
++
++
++	broken-cd;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&v3v3>;
++
++};
++
++&sdmmc2{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc2_pins_mx>;
++	pinctrl-1 = <&sdmmc2_opendrain_pins_mx>;
++	pinctrl-2 = <&sdmmc2_sleep_pins_mx>;
++	status = "okay";
++
++
++  	non-removable;
++	no-sd;
++	no-sdio;
++	st,neg-edge;
++	bus-width = <8>;
++	vmmc-supply = <&v3v3>;
++	vqmmc-supply = <&v3v3>;
++	mmc-ddr-3_3v;
++
++
++};
++
++&sdmmc3{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc3_pins_mx>;
++	pinctrl-1 = <&sdmmc3_opendrain_pins_mx>;
++	pinctrl-2 = <&sdmmc3_sleep_pins_mx>;
++	//status = "okay";
++
++
++	arm,primecell-periphid = <0x10153180>;
++  	non-removable;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&v3v3>;
++	//mmc-pwrseq = <&wifi_pwrseq>; //messes up sdmmc alias shifting when used
++	#address-cells = <1>;
++	#size-cells = <0>;
++	keep-power-in-suspend;
++	//status = "okay";
++
++	brcmf: bcrmf@1 {
++		reg = <1>;
++		compatible = "brcm,bcm4329-fmac";
++	};
++
++
++};
++
++&tamp{
++	status = "okay";
++
++
++
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&uart4_pins_mx>;
++	pinctrl-1 = <&uart4_sleep_pins_mx>;
++	status = "okay";
++
++
++
++};
++
++&usart2{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&usart2_pins_mx>;
++	pinctrl-1 = <&usart2_sleep_pins_mx>;
++	status = "okay";
++
++
++  bluetooth {
++		shutdown-gpios = <&gpioe 10 GPIO_ACTIVE_HIGH>;
++		compatible = "brcm,bcm43438-bt";
++		max-speed = <3000000>;
++	};
++
++};
++
++
++&m4_rproc {
++memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++		<&vdev0vring1>, <&vdev0buffer>;
++};
++
++&dma1 {
++	sram = <&dma_pool>;
++};
++
++&dma2 {
++	sram = <&dma_pool>;
++};
++
++&adc {
++	status = "disabled";
++};
++
++
++&usbh_ehci {
++	phys = <&usbphyc_port0>;
++	phy-names = "usb";
++	status = "okay";
++};
++
++&usbotg_hs {
++	extcon = <&typec>;
++	phys = <&usbphyc_port1 0>;
++	phy-names = "usb2-phy";
++	status = "okay";
++};
++
++&usbphyc {
++	vdd3v3-supply = <&vdd_usb>;
++	status = "okay";
++};
++
++&usbphyc_port0 {
++	st,phy-tuning = <&usb_phy_tuning>;
++};
++
++&usbphyc_port1 {
++	st,phy-tuning = <&usb_phy_tuning>;
++};
+diff --git a/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
+new file mode 100644
+index 0000000000..f33886f2b4
+--- /dev/null
++++ b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb-1066-binG.dtsi
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
++ * Save Date: 2020.02.08, save Time: 23:22:33
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
+-- 
+2.17.1
+
diff --git a/board/octavo/red/uboot-patches/0002-Fix-Ethernet-Clock-for-OSD32MP1-RED.patch b/board/octavo/red/uboot-patches/0002-Fix-Ethernet-Clock-for-OSD32MP1-RED.patch
new file mode 100644
index 0000000000..c5bea5fd4d
--- /dev/null
+++ b/board/octavo/red/uboot-patches/0002-Fix-Ethernet-Clock-for-OSD32MP1-RED.patch
@@ -0,0 +1,32 @@
+From eab9f046a43599fd46f41ac52eb7d20be9f9e7ab Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
+Date: Sun, 31 Jan 2021 21:06:08 -0600
+Subject: [PATCH 2/2] Fix Ethernet Clock for OSD32MP1-RED
+
+Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>
+---
+ arch/arm/dts/stm32mp157c.dtsi | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/arch/arm/dts/stm32mp157c.dtsi b/arch/arm/dts/stm32mp157c.dtsi
+index c94a1f254e..c0f94bb19c 100644
+--- a/arch/arm/dts/stm32mp157c.dtsi
++++ b/arch/arm/dts/stm32mp157c.dtsi
+@@ -1768,10 +1768,14 @@
+ 			clock-names = "stmmaceth",
+ 				      "mac-clk-tx",
+ 				      "mac-clk-rx",
++				      "eth-ck",    //custom
++				      "syscfg-clk", //custom
+ 				      "ethstp";
+ 			clocks = <&rcc ETHMAC>,
+ 				 <&rcc ETHTX>,
+ 				 <&rcc ETHRX>,
++				 <&rcc ETHCK_K>, //custom
++				 <&rcc SYSCFG>,  //custom
+ 				 <&rcc ETHSTP>;
+ 			st,syscon = <&syscfg 0x4>;
+ 			snps,mixed-burst;
+-- 
+2.17.1
+
diff --git a/board/octavo/red/uboot-patches/0003-configs-stm32mp15_trusted_defconfig-disable-environm.patch b/board/octavo/red/uboot-patches/0003-configs-stm32mp15_trusted_defconfig-disable-environm.patch
new file mode 100644
index 0000000000..05ea816498
--- /dev/null
+++ b/board/octavo/red/uboot-patches/0003-configs-stm32mp15_trusted_defconfig-disable-environm.patch
@@ -0,0 +1,32 @@
+From c0f7d94955600dac6b326630f90f887f45009eb7 Mon Sep 17 00:00:00 2001
+From: Kory Maincent <kory.maincent@bootlin.com>
+Date: Tue, 5 Oct 2021 14:31:28 +0200
+Subject: [PATCH] configs/stm32mp15_trusted_defconfig: disable environment
+
+select only ENV_IS_NOWHERE
+
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ configs/stm32mp15_trusted_defconfig | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
+index 7635d7f6c7..6ec4bcd080 100644
+--- a/configs/stm32mp15_trusted_defconfig
++++ b/configs/stm32mp15_trusted_defconfig
+@@ -38,12 +38,6 @@ CONFIG_CMD_MTDPARTS=y
+ CONFIG_CMD_UBI=y
+ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+ CONFIG_ENV_IS_NOWHERE=y
+-CONFIG_ENV_IS_IN_EXT4=y
+-CONFIG_ENV_IS_IN_SPI_FLASH=y
+-CONFIG_ENV_IS_IN_UBI=y
+-CONFIG_ENV_EXT4_INTERFACE="mmc"
+-CONFIG_ENV_EXT4_DEVICE_AND_PART="0:auto"
+-CONFIG_ENV_EXT4_FILE="/uboot.env"
+ CONFIG_STM32_ADC=y
+ CONFIG_USB_FUNCTION_FASTBOOT=y
+ CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
+-- 
+2.25.1
+
diff --git a/configs/octavo_osd32mp1_red_defconfig b/configs/octavo_osd32mp1_red_defconfig
new file mode 100644
index 0000000000..b4f76b38d1
--- /dev/null
+++ b/configs/octavo_osd32mp1_red_defconfig
@@ -0,0 +1,39 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_ROOTFS_OVERLAY="board/octavo/red/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/octavo/red/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.19-stm32mp-r3.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/octavo/red/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="osd32mp1-red"
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/red/linux-dts/*"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0-stm32mp-r1.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/octavo/red/tfa-dts/*"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=osd32mp1-red.dtb STM32MP_USB_PROGRAMMER=1 CFLAGS=-Wno-array-bounds"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2018.11-stm32mp-r3.2"
+BR2_TARGET_UBOOT_PATCH="board/octavo/red/uboot-patches/*.patch"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=osd32mp1-red"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
