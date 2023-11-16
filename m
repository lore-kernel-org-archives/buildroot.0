Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D0C197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 19:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C85A640C39;
	Thu, 16 Nov 2023 19:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C85A640C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzjQmMuLDikB; Thu, 16 Nov 2023 19:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25D494119B;
	Thu, 16 Nov 2023 19:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25D494119B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 946C81BF387
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D755819F3
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 19:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D755819F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zWAZUalP-Sy for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 19:20:57 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E41E8817B1
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 19:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E41E8817B1
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5232AB00576;
 Thu, 16 Nov 2023 20:20:46 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44678])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Nov 2023 20:20:46 +0100
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 20:20:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20231116130131.3660078-1-neal.frager@amd.com>
References: <20231116130131.3660078-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.5
Message-ID: <c3a1fa258bf88bebe374d6e628831e12@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700162454;
 bh=jb7OHXsdwNFrmuhfLV7sPEnxjYy0Pa4w2iPUayGhJLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l7CpjnB6sKiuFIqN86CADfuMtClMsVHbEl6x4cBSwl09uUo023zdwGcQpNiTzcpza
 u00aHxR9H2A5Ys63hB1UomSwoJoWvOT1tBlfn2Opd0/retfWusoHGZT23rw07BEJBK
 VEKN0SGp4lX3ShZEe0IJhtmf9VeTRP8QQddRBDSkpj9v1+GdQDMbLAibmPGkU7lH+F
 WYyxfp3ZNjdATfqg5aw2d0zwfxCAM+LVGSabb7jHBJUqVIO0S6G05VWAJbs5gp6uST
 aqOjGgDiqLRatcPSTg7SwIVsjcbdcWvZMFogTz28jaQRII1BLmZBkjZjsCsVl5vgUY
 S+IIkgCUgIM3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l7CpjnB6
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynq_qmtech_defconfig:
 deprecate board
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
Cc: martin.chabot@gmail.com, luca.ceresoli@bootlin.com, juju@cotds.org,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal, All,

My board for this defconfig is no longer functional. It will be hard for
me to maintain it. So it can be removed now.

On 16/11/2023 14:01, Neal Frager wrote:
> This is a proposal to deprecate support for the zynq qmtech board.  The
> zynq_qmtech_defconfig has not been maintained for 3 years, and is now 
> using
> a very out of date u-boot and Linux kernel.  Since there are 4 other 
> zynq7000
> defconfigs available in buildroot, do we still require support for this 
> board?

Acked-by: Julien Olivain <ju.o@free.fr>

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  .checkpackageignore                           |   1 -
>  DEVELOPERS                                    |   2 -
>  ...0001-DTS-for-QMTech-Zynq-starter-kit.patch | 418 ------------------
>  board/qmtech/zynq/readme.txt                  |  76 ----
>  configs/zynq_qmtech_defconfig                 |  33 --
>  5 files changed, 530 deletions(-)
>  delete mode 100644 
> board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
>  delete mode 100644 board/qmtech/zynq/readme.txt
>  delete mode 100644 configs/zynq_qmtech_defconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0663149d01..dd3829add6 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -76,7 +76,6 @@ 
> board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
>  
> board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch 
> Upstream
>  board/qemu/x86/post-build.sh Shellcheck
>  board/qemu/x86_64/post-build.sh Shellcheck
> -board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch 
> Upstream
>  board/radxa/rockpi-n8/post-build.sh Shellcheck
>  board/raspberrypi/post-build.sh Shellcheck
>  board/raspberrypi/post-image.sh Shellcheck
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1f26e9bc81..a42fb769d3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1707,14 +1707,12 @@ F:	configs/ts7680_defconfig
>  F:	package/paho-mqtt-c
> 
>  N:	Julien Olivain <ju.o@free.fr>
> -F:	board/qmtech/zynq/
>  F:	board/spike/
>  F:	board/technexion/imx8mmpico/
>  F:	board/technexion/imx8mpico/
>  F:	configs/imx8mmpico_defconfig
>  F:	configs/imx8mpico_defconfig
>  F:	configs/spike_riscv64_defconfig
> -F:	configs/zynq_qmtech_defconfig
>  F:	package/fluid-soundfont/
>  F:	package/fluidsynth/
>  F:	package/glslsandbox-player/
> diff --git 
> a/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch 
> b/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
> deleted file mode 100644
> index 86d8e387de..0000000000
> --- 
> a/board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
> +++ /dev/null
> @@ -1,418 +0,0 @@
> -From 22d955122ac0f7ac74ab74aadebf6b8edaf0bbbd Mon Sep 17 00:00:00 2001
> -From: Julien Olivain <juju@cotds.org>
> -Date: Sun, 15 Dec 2019 18:45:40 +0100
> -Subject: [PATCH] DTS for QMTech Zynq starter kit
> -
> -Signed-off-by: Martin Chabot <martin.chabot@gmail.com>
> -Signed-off-by: Julien Olivain <juju@cotds.org>
> ----
> - arch/arm/boot/dts/zynq-qmtech.dts | 397 
> ++++++++++++++++++++++++++++++
> - 1 file changed, 397 insertions(+)
> - create mode 100644 arch/arm/boot/dts/zynq-qmtech.dts
> -
> -diff --git a/arch/arm/boot/dts/zynq-qmtech.dts 
> b/arch/arm/boot/dts/zynq-qmtech.dts
> -new file mode 100644
> -index 000000000000..c6081dc0080e
> ---- /dev/null
> -+++ b/arch/arm/boot/dts/zynq-qmtech.dts
> -@@ -0,0 +1,397 @@
> -+// SPDX-License-Identifier: GPL-2.0+
> -+/*
> -+ *  Copyright (C) 2011 - 2015 Xilinx
> -+ *  Copyright (C) 2012 National Instruments Corp.
> -+ *  Copyright (C) 2019 Martin Chabot <martin.chabot@gmail.com>
> -+ */
> -+
> -+/* Derived from:
> -+ * 
> https://github.com/Xilinx/linux-xlnx/blob/xilinx-v2019.2.01/arch/arm/boot/dts/zynq-zc702.dts
> -+ */
> -+
> -+/dts-v1/;
> -+#include "zynq-7000.dtsi"
> -+
> -+/ {
> -+	model = "QMTECH XC7Z010 Starter Kit";
> -+	compatible = "xlnx,zynq-qmtech", "xlnx,zynq-zc702", 
> "xlnx,zynq-7000";
> -+
> -+	aliases {
> -+		ethernet0 = &gem0;
> -+		i2c0 = &i2c0;
> -+		serial0 = &uart1;
> -+		spi0 = &qspi;
> -+		mmc0 = &sdhci0;
> -+	};
> -+
> -+	memory@0 {
> -+		device_type = "memory";
> -+		reg = <0x0 0x20000000>;
> -+	};
> -+
> -+	chosen {
> -+		bootargs = "";
> -+		stdout-path = "serial0:115200n8";
> -+	};
> -+
> -+	leds {
> -+		compatible = "gpio-leds";
> -+
> -+		ds23 {
> -+			label = "ds23";
> -+			gpios = <&gpio0 10 0>;
> -+			linux,default-trigger = "heartbeat";
> -+		};
> -+	};
> -+
> -+};
> -+
> -+&amba {
> -+	ocm: sram@fffc0000 {
> -+		compatible = "mmio-sram";
> -+		reg = <0xfffc0000 0x10000>;
> -+	};
> -+};
> -+
> -+&clkc {
> -+	ps-clk-frequency = <33333333>;
> -+};
> -+
> -+&gem0 {
> -+	status = "okay";
> -+	phy-mode = "rgmii-id";
> -+	phy-handle = <&ethernet_phy>;
> -+
> -+	ethernet_phy: ethernet-phy@0 {
> -+		reg = <0>;
> -+		device_type = "ethernet-phy";
> -+	};
> -+};
> -+
> -+&gpio0 {
> -+	pinctrl-names = "default";
> -+	pinctrl-0 = <&pinctrl_gpio0_default>;
> -+};
> -+
> -+&i2c0 {
> -+	status = "disabled";
> -+	clock-frequency = <400000>;
> -+	pinctrl-names = "default", "gpio";
> -+	pinctrl-0 = <&pinctrl_i2c0_default>;
> -+	pinctrl-1 = <&pinctrl_i2c0_gpio>;
> -+	scl-gpios = <&gpio0 50 0>;
> -+	sda-gpios = <&gpio0 51 0>;
> -+
> -+	i2c-mux@74 {
> -+		compatible = "nxp,pca9548";
> -+		#address-cells = <1>;
> -+		#size-cells = <0>;
> -+		reg = <0x74>;
> -+
> -+		i2c@0 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <0>;
> -+			si570: clock-generator@5d {
> -+				#clock-cells = <0>;
> -+				compatible = "silabs,si570";
> -+				temperature-stability = <50>;
> -+				reg = <0x5d>;
> -+				factory-fout = <156250000>;
> -+				clock-frequency = <148500000>;
> -+			};
> -+		};
> -+
> -+		i2c@1 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <1>;
> -+			adv7511: hdmi-tx@39 {
> -+				compatible = "adi,adv7511";
> -+				reg = <0x39>;
> -+				adi,input-depth = <8>;
> -+				adi,input-colorspace = "yuv422";
> -+				adi,input-clock = "1x";
> -+				adi,input-style = <3>;
> -+				adi,input-justification = "right";
> -+			};
> -+		};
> -+
> -+		i2c@2 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <2>;
> -+			eeprom@54 {
> -+				compatible = "atmel,24c08";
> -+				reg = <0x54>;
> -+			};
> -+		};
> -+
> -+		i2c@3 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <3>;
> -+			gpio@21 {
> -+				compatible = "ti,tca6416";
> -+				reg = <0x21>;
> -+				gpio-controller;
> -+				#gpio-cells = <2>;
> -+			};
> -+		};
> -+
> -+		i2c@4 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <4>;
> -+			rtc@51 {
> -+				compatible = "nxp,pcf8563";
> -+				reg = <0x51>;
> -+			};
> -+		};
> -+
> -+		i2c@7 {
> -+			#address-cells = <1>;
> -+			#size-cells = <0>;
> -+			reg = <7>;
> -+			hwmon@52 {
> -+				compatible = "ti,ucd9248";
> -+				reg = <52>;
> -+			};
> -+			hwmon@53 {
> -+				compatible = "ti,ucd9248";
> -+				reg = <53>;
> -+			};
> -+			hwmon@54 {
> -+				compatible = "ti,ucd9248";
> -+				reg = <54>;
> -+			};
> -+		};
> -+	};
> -+};
> -+
> -+&pinctrl0 {
> -+	pinctrl_can0_default: can0-default {
> -+		mux {
> -+			function = "can0";
> -+			groups = "can0_9_grp";
> -+		};
> -+
> -+		conf {
> -+			groups = "can0_9_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+
> -+		conf-rx {
> -+			pins = "MIO46";
> -+			bias-high-impedance;
> -+		};
> -+
> -+		conf-tx {
> -+			pins = "MIO47";
> -+			bias-disable;
> -+		};
> -+	};
> -+
> -+	pinctrl_gem0_default: gem0-default {
> -+		mux {
> -+			function = "ethernet0";
> -+			groups = "ethernet0_0_grp";
> -+		};
> -+
> -+		conf {
> -+			groups = "ethernet0_0_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <4>;
> -+		};
> -+
> -+		conf-rx {
> -+			pins = "MIO22", "MIO23", "MIO24", "MIO25", "MIO26", "MIO27";
> -+			bias-high-impedance;
> -+			low-power-disable;
> -+		};
> -+
> -+		conf-tx {
> -+			pins = "MIO16", "MIO17", "MIO18", "MIO19", "MIO20", "MIO21";
> -+			bias-disable;
> -+			low-power-enable;
> -+		};
> -+
> -+		mux-mdio {
> -+			function = "mdio0";
> -+			groups = "mdio0_0_grp";
> -+		};
> -+
> -+		conf-mdio {
> -+			groups = "mdio0_0_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+			bias-disable;
> -+		};
> -+	};
> -+
> -+	pinctrl_gpio0_default: gpio0-default {
> -+		mux {
> -+			function = "gpio0";
> -+			groups = "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
> -+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
> -+				 "gpio0_13_grp", "gpio0_14_grp";
> -+		};
> -+
> -+		conf {
> -+			groups = "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
> -+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
> -+				 "gpio0_13_grp", "gpio0_14_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+
> -+		conf-pull-up {
> -+			pins = "MIO9", "MIO10", "MIO11", "MIO12", "MIO13", "MIO14";
> -+			bias-pull-up;
> -+		};
> -+
> -+		conf-pull-none {
> -+			pins = "MIO7", "MIO8";
> -+			bias-disable;
> -+		};
> -+	};
> -+
> -+	pinctrl_i2c0_default: i2c0-default {
> -+		mux {
> -+			groups = "i2c0_10_grp";
> -+			function = "i2c0";
> -+		};
> -+
> -+		conf {
> -+			groups = "i2c0_10_grp";
> -+			bias-pull-up;
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+	};
> -+
> -+	pinctrl_i2c0_gpio: i2c0-gpio {
> -+		mux {
> -+			groups = "gpio0_50_grp", "gpio0_51_grp";
> -+			function = "gpio0";
> -+		};
> -+
> -+		conf {
> -+			groups = "gpio0_50_grp", "gpio0_51_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+	};
> -+
> -+	pinctrl_sdhci0_default: sdhci0-default {
> -+		mux {
> -+			groups = "sdio0_2_grp";
> -+			function = "sdio0";
> -+		};
> -+
> -+		conf {
> -+			groups = "sdio0_2_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+			bias-disable;
> -+		};
> -+
> -+		mux-cd {
> -+			groups = "gpio0_0_grp";
> -+			function = "sdio0_cd";
> -+		};
> -+
> -+		conf-cd {
> -+			groups = "gpio0_0_grp";
> -+			bias-high-impedance;
> -+			bias-pull-up;
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+
> -+		mux-wp {
> -+			groups = "gpio0_15_grp";
> -+			function = "sdio0_wp";
> -+		};
> -+
> -+		conf-wp {
> -+			groups = "gpio0_15_grp";
> -+			bias-high-impedance;
> -+			bias-pull-up;
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+	};
> -+
> -+	pinctrl_uart1_default: uart1-default {
> -+		mux {
> -+			groups = "uart1_10_grp";
> -+			function = "uart1";
> -+		};
> -+
> -+		conf {
> -+			groups = "uart1_10_grp";
> -+			slew-rate = <0>;
> -+			io-standard = <1>;
> -+		};
> -+
> -+		conf-rx {
> -+			pins = "MIO25";
> -+			bias-high-impedance;
> -+		};
> -+
> -+		conf-tx {
> -+			pins = "MIO24";
> -+			bias-disable;
> -+		};
> -+	};
> -+};
> -+
> -+&qspi {
> -+	u-boot,dm-pre-reloc;
> -+	status = "disabled";
> -+	is-dual = <0>;
> -+	num-cs = <1>;
> -+	flash@0 {
> -+		compatible = "n25q128a11";
> -+		reg = <0x0>;
> -+		spi-tx-bus-width = <1>;
> -+		spi-rx-bus-width = <4>;
> -+		spi-max-frequency = <50000000>;
> -+		#address-cells = <1>;
> -+		#size-cells = <1>;
> -+		partition@qspi-fsbl-uboot {
> -+			label = "qspi-fsbl-uboot";
> -+			reg = <0x0 0x100000>;
> -+		};
> -+		partition@qspi-linux {
> -+			label = "qspi-linux";
> -+			reg = <0x100000 0x500000>;
> -+		};
> -+		partition@qspi-device-tree {
> -+			label = "qspi-device-tree";
> -+			reg = <0x600000 0x20000>;
> -+		};
> -+		partition@qspi-rootfs {
> -+			label = "qspi-rootfs";
> -+			reg = <0x620000 0x5E0000>;
> -+		};
> -+		partition@qspi-bitstream {
> -+			label = "qspi-bitstream";
> -+			reg = <0xC00000 0x400000>;
> -+		};
> -+	};
> -+};
> -+
> -+&sdhci0 {
> -+	u-boot,dm-pre-reloc;
> -+	status = "okay";
> -+};
> -+
> -+&uart1 {
> -+	u-boot,dm-pre-reloc;
> -+	status = "okay";
> -+	pinctrl-names = "default";
> -+	pinctrl-0 = <&pinctrl_uart1_default>;
> -+};
> ---
> -2.23.0
> -
> diff --git a/board/qmtech/zynq/readme.txt 
> b/board/qmtech/zynq/readme.txt
> deleted file mode 100644
> index 5fb95bb90b..0000000000
> --- a/board/qmtech/zynq/readme.txt
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -*******************************
> -QMTECH Zynq XC7Z010 Starter Kit
> -*******************************
> -
> -This file documents the Buildroot support for the QMTECH [1] Zynq
> -XC7Z010 Starter Kit [2]. It is a low cost (~55$) Zynq based
> -development board. The board user manual is available at
> -[3]. Additional files are available on Github [4].
> -
> -
> -Build
> -=====
> -
> -First, configure Buildroot for the QMTECH Zynq board:
> -
> -  make zynq_qmtech_defconfig
> -
> -Build all components:
> -
> -  make
> -
> -You will find in output/images/ the following files:
> -  - boot.bin
> -  - boot.vfat
> -  - devicetree.dtb
> -  - rootfs.cpio
> -  - rootfs.cpio.gz
> -  - rootfs.cpio.uboot
> -  - rootfs.tar
> -  - sdcard.img
> -  - u-boot.bin
> -  - u-boot.img
> -  - uImage
> -  - zynq-qmtech.dtb
> -
> -
> -Create a bootable micro SD card
> -===============================
> -
> -To determine the device associated to the micro SD card have a look in
> -the /proc/partitions file:
> -
> -  cat /proc/partitions
> -
> -Buildroot prepares a bootable "sdcard.img" image in the output/images/
> -directory, ready to be dumped on a micro SD card. Launch the following
> -command as root:
> -
> -  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
> -
> -*** WARNING! This will destroy all the card content. Use with care! 
> ***
> -
> -
> -Boot the QMTECH Zynq board
> -==========================
> -
> -To boot your newly created system:
> -- put a mini USB cable into the J4 Debug USB Port and connect using a
> -  terminal emulator at 115200 bps, 8n1,
> -- put the prepared micro SD card in the J2 micro SD card slot,
> -- plug the 5V power supply on the JP4 barrel jack.
> -
> -Enjoy!
> -
> -
> -[1]. QMTECH:
> -     http://www.chinaqmtech.com/
> -
> -[2]. QMTECH Zynq XC7Z010 Starter Kit Product Page:
> -     http://www.chinaqmtech.com/xilinx_zynq_soc
> -
> -[3]. QMTECH Zynq XC7Z010 Starter Kit Hardware User Manual:
> -     http://www.chinaqmtech.com/filedownload/32552
> -
> -[4]. QMTECH Github:
> -     https://github.com/ChinaQMTECH/ZYNQ_STARTER_KIT
> diff --git a/configs/zynq_qmtech_defconfig 
> b/configs/zynq_qmtech_defconfig
> deleted file mode 100644
> index f536b80f57..0000000000
> --- a/configs/zynq_qmtech_defconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_NEON=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,Xilinx,linux-xlnx,xilinx-v2019.2.01)/linux-xilinx-v2019.2.01.tar.gz"
> -BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
> -BR2_LINUX_KERNEL_UIMAGE=y
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> -BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
> -BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call 
> github,jolivain,u-boot-xlnx,xilinx-v2019.2.qmtech.1)/uboot-xilinx-v2019.2.qmtech.1.tar.gz"
> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_qmtech"
> -BR2_TARGET_UBOOT_NEEDS_DTC=y
> -BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> -BR2_TARGET_UBOOT_FORMAT_IMG=y
> -BR2_TARGET_UBOOT_SPL=y
> -BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> -BR2_PACKAGE_HOST_DOSFSTOOLS=y
> -BR2_PACKAGE_HOST_GENIMAGE=y
> -BR2_PACKAGE_HOST_MTOOLS=y
> --
> 2.25.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
