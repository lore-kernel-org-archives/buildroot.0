Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E41C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE53860C00;
	Sat,  1 Mar 2025 21:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6uo7wIw6Epm; Sat,  1 Mar 2025 21:45:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D653F60BEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D653F60BEA;
	Sat,  1 Mar 2025 21:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8544C1CB
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71C9D42F40
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSvSAjLT2HlZ for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 21:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C87642F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C87642F3D
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C87642F3D
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 21:45:36 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee] (unknown
 [IPv6:2a01:e0a:12:eba0:c9c5:d2da:9767:caee])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 35AF3BFBA5
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 22:45:34 +0100 (CET)
Message-ID: <e28ea119-c23e-402a-9700-55e8794c9376@grenoble.cnrs.fr>
Date: Sat, 1 Mar 2025 22:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1740865534;
 bh=8eKVJKhiLzoWrFifMsQh++4mlOsTc8mTU/aJLicWnww=;
 h=Date:To:From:Subject:From;
 b=hIrwOnE1zVItg8u/Tqzo1YHEhSwa5mtRGL0CalcfvEBHpZdHMNwdtxb2l4Jcp1Dlo
 qUc0P70h4H8S70U4kEv2Cos1HWcyj0BufEiCAZndORs2bQDXrj4IbhEx38ZGfEjYDZ
 yWTqTx7N5NkGXRG88gY9o3LruPo6/T+CLA5p/qOMX14oSBpLXcqgxhqvHfZ8bm1svg
 QVqJMqm3dFGpgzoofMMov+pqkKp+6lKj+NbOF5PAFRouLSXrBuVmO2QnCow4hZozhG
 rANKjhkQnBEDngJ+pMdQt60tBfDYcgYTciuKI5HbJYx9JOzGkoQpwYoJFQl2jU1ljF
 zQ5AS/W7NVE7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=hIrwOnE1
Subject: [Buildroot] [PATCH 1/2] board/acmesystems/acqua-a5: add device tree
 as a kernel patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Acqua device tree is provided via the
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH variable. This works well with the
kernel currently used (6.6.30). However, starting with Linux 6.12, this
scheme does not work in the architectures, including ARM, that use
per-vendor directories for the devices trees.[1]

In order to ease future kernel upgrades, let's provide the device tree
as a kernel patch instead. As the patch adds the device tree in the
"microchip" directory, update the path to the included dtsi accordingly.

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../acqua-a5/at91-sama5d3_acqua.dts           | 340 -----------------
 ...M-dts-add-Acmesystems-Acqua-A5-board.patch | 359 ++++++++++++++++++
 configs/acmesystems_acqua_a5_256mb_defconfig  |   2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig  |   2 +-
 4 files changed, 361 insertions(+), 342 deletions(-)
 delete mode 100644 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
 create mode 100644 board/acmesystems/acqua-a5/patches/linux/0001-ARM-dts-add-Acmesystems-Acqua-A5-board.patch

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
deleted file mode 100644
index 411d1942f5..0000000000
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ /dev/null
@@ -1,340 +0,0 @@
-/*
- * acme-acqua.dts - Device Tree file for Acqua A5 Board
- *
- *  Copyright (C) 2014 Atmel,
- *		  2014 Nicolas Ferre <nicolas.ferre@atmel.com>
- * 
- *	2022 Sergio Tanzilli <tanzilli@acmesystems.it>
- *
- * Licensed under GPLv2 or later.
- */
-/dts-v1/;
-#include "microchip/sama5d31.dtsi"
-
-/ {
-	model = "Acme Systems Acqua SOM";
-	compatible = "acme,acqua", "atmel,sama5d3", "atmel,sama5";
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-		bootargs = "mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait net.ifnames=0";
-	};
-
-	memory {
-		reg = <0x20000000 0x10000000>;
-	};
-
-	clocks {
-		slow_xtal {
-			clock-frequency = <32768>;
-		};
-
-		main_xtal {
-			clock-frequency = <12000000>;
-		};
-	};
-
-	ahb {
-		apb {
-			hlcdc: hlcdc@f0030000 {
-				status = "disabled";
-				hlcdc-display-controller {
-					pinctrl-names = "default";
-					pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888_alt>;
-					port@0 {
-						hlcdc_panel_output: endpoint@0 {
-							remote-endpoint = <&panel_input>;
-						};
-					};
-				};
-			};
-		
-			/* MicroSD mounted on the SOM */
-		
-			mmc0: mmc@f0000000 {
-				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_cd>;
-				status = "okay";
-				slot@0 {
-					reg = <0>;
-					bus-width = <4>;
-				};
-			};
-  
-  			/* Optional MicroSD to mount on the carrier board */
-  
-			mmc1: mmc@f8000000 {
-				pinctrl-0 = <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &pinctrl_mmc1_cd>;
-				status = "disabled";
-				slot@0 {
-					reg = <0>;
-					bus-width = <4>;
-					cd-gpios = <&pioE 1 GPIO_ACTIVE_LOW>;
-				};
-			};
-
-			spi0: spi@f0004000 {
-				cs-gpios = <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
-				status = "disabled";
-			};
-
-			can0: can@f000c000 {
-				status = "disabled";
-			};
-
-			tcb0: timer@f0010000 {
-				timer0: timer@0 {
-					compatible = "atmel,tcb-timer";
-					reg = <0>;
-				};
-
-				timer1: timer@1 {
-					compatible = "atmel,tcb-timer";
-					reg = <1>;
-				};
-			};
-
-			i2c0: i2c@f0014000 {
-				pinctrl-0 = <&pinctrl_i2c0_pu>;
-				status = "disabled";
-			};
-
-			i2c1: i2c@f0018000 {
-				status = "disabled";
-			};
-
-			macb1: ethernet@f802c000 {
-				compatible = "atmel,sama5d3-macb", "cdns,at91sam9260-macb", "cdns,macb";
-				
-				status = "okay";
-				phy-mode = "rmii";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				nvmem-cells = <&eth0_addr>;
-				nvmem-cell-names = "mac-address";
-
-                phy0: ethernet-phy@1 {
-                    interrupt-parent = <&pioE>;
-                    interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
-                    reg = <1>;
-                };
-
-				/*ethernet-phy@1 {
-					reg = <0x1>;
-				};*/
-			};
-
-			/* Bit banging internal I2C to manage the AT24MAC402 chip */
-
-			i2c3@ {
-				compatible = "i2c-gpio";
-
-				sda-gpios = <&pioE 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-				scl-gpios = <&pioE 2 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; 
-				
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_i2c3_gpio>;
-				
-				i2c-gpio,delay-us = <4>; /* ~178 kHz */
-				#address-cells = <1>;
-				#size-cells = <0>;
-				
-				/* EEPROM contains the eth0 MAC address */
-				
-				eeprom@58 {
-					compatible = "atmel,24mac402";
-					pagesize = <256>;
-					read-only;
-					reg = <0x58>;
-					#address-cells = <1>;
-					#size-cells = <1>;
-
-					nvmem-layout {
-						compatible = "fixed-layout";
-						#address-cells = <1>;
-						#size-cells = <1>;
-
-						eth0_addr: eth-mac-addr@9A {
-							reg = <0x0 0x06>;
-						};
-					};
-				};
-				
-			};
-
-			pwm0: pwm@f002c000 {
-				pinctrl-names = "default";
-				pinctrl-0 = <&pinctrl_pwm0_pwmh0_0 &pinctrl_pwm0_pwmh1_0>;
-				status = "disabled";
-			};
-
-			usart0: serial@f001c000 {
-				status = "okay";
-			};
-
-			usart1: serial@f0020000 {
-				pinctrl-0 = <&pinctrl_usart1 &pinctrl_usart1_rts_cts>;
-				status = "disabled";
-			};
-
-			uart0: serial@f0024000 {
-				status = "disabled";
-			};
-
-
-			spi1: spi@f8008000 {
-				cs-gpios = <&pioC 25 0>;
-				status = "disabled";
-			};
-
-			adc0: adc@f8018000 {
-				atmel,adc-vref = <3300>;
-				atmel,adc-channels-used = <0xfe>;
-				pinctrl-0 = <
-					&pinctrl_adc0_adtrg
-					&pinctrl_adc0_ad1
-					&pinctrl_adc0_ad2
-					&pinctrl_adc0_ad3
-					&pinctrl_adc0_ad4
-					&pinctrl_adc0_ad5
-					&pinctrl_adc0_ad6
-					&pinctrl_adc0_ad7
-					>;
-				status = "disabled";
-			};
-
-			i2c2: i2c@f801c000 {
-				dmas = <0>, <0>;	/* Do not use DMA for i2c2 */
-				pinctrl-0 = <&pinctrl_i2c2_pu>;
-				status = "disabled";
-			};
-
-
-			dbgu: serial@ffffee00 {
-				status = "okay";
-			};
-
-			pinctrl@fffff200 {
-
-				atmel,mux-mask = <
-					/*   A          B          C  */
-					0xffffffff 0xc0fc0000 0xc0ff0000	/* pioA */
-					0xffffffff 0x0ff8ffff 0x00000000	/* pioB */
-					0xffffffff 0xbc00f1ff 0x7c00fc00	/* pioC */
-					0xffffffff 0xc001c0e0 0x0001c1e0	/* pioD */
-					0xfffffff9 0xbf9f8000 0x18000000 	/* pioE */
-				/*	0xffffffff 0xb8000000 0x18000000 */	/* pioE */
-					>;
-
-				board {
-					pinctrl_i2c0_pu: i2c0_pu {
-						atmel,pins =
-							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>,
-							<AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
-					};
-
-					pinctrl_i2c2_pu: i2c2_pu {
-						atmel,pins =
-							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>,
-							<AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>;
-					};
-
-					pinctrl_i2c3_gpio: i2c3-gpio {
-						atmel,pins =
-							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
-							 AT91_PIOE 2 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
-					};
-
-
-					pinctrl_key_gpio: key_gpio_0 {
-						atmel,pins =
-							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
-					};
-
-					pinctrl_mmc0_cd: mmc0_cd {
-						atmel,pins =
-							<AT91_PIOE 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
-					};
-
-					pinctrl_mmc1_cd: mmc1_cd {
-						atmel,pins =
-							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
-					};
-
-					pinctrl_usba_vbus: usba_vbus {
-						atmel,pins =
-							<AT91_PIOE 9 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>;	/* PE9, conflicts with A9 */
-					};
-					
-					pinctrl_gpio_leds: gpio_leds_default {
-						atmel,pins =
-							<AT91_PIOE 3 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
-							 AT91_PIOE 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
-							 AT91_PIOE 5 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
-							 AT91_PIOE 6 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
-					};
-				};
-			};
-		};
-
-        usb0: gadget@500000 {
-            status = "disabled";
-        };
-
-        usb1: ohci@600000 {
-            status = "okay";
-        };
-
-        usb2: ehci@700000 {
-            status = "okay";
-        };
-		
-	};
-
-
-	panel: panel {
-		/* compatible = "acme,43inch", "simple-panel"; */
-		compatible = "acme,50inch", "simple-panel";
-		/* compatible = "acme,70inch", "simple-panel"; */
-		
-		status = "disable";
-
-		port@0 {
-			panel_input: endpoint@0 {
-				remote-endpoint = <&hlcdc_panel_output>;
-			};
-		};
-	};
-
- 
-	leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_gpio_leds>;
-
-		led0 {
-			label = "led0";
-			gpios = <&pioE 3 GPIO_ACTIVE_LOW>;
-			default-state = "off";
-		};
-
-		led1 {
-			label = "led1";
-			gpios = <&pioE 4 GPIO_ACTIVE_LOW>;
-			default-state = "off";
-		};
-
-		led2 {
-			label = "led2";
-			gpios = <&pioE 5 GPIO_ACTIVE_LOW>;
-			linux,default-trigger = "heartbeat";
-		};
-
-		led3 {
-			label = "led3";
-			gpios = <&pioE 6 GPIO_ACTIVE_LOW>;
-			linux,default-trigger = "mmc0";
-			default-state = "off";
-		};
-	};		
-};
diff --git a/board/acmesystems/acqua-a5/patches/linux/0001-ARM-dts-add-Acmesystems-Acqua-A5-board.patch b/board/acmesystems/acqua-a5/patches/linux/0001-ARM-dts-add-Acmesystems-Acqua-A5-board.patch
new file mode 100644
index 0000000000..b07077136e
--- /dev/null
+++ b/board/acmesystems/acqua-a5/patches/linux/0001-ARM-dts-add-Acmesystems-Acqua-A5-board.patch
@@ -0,0 +1,359 @@
+From 656e7627c07a2723b4d288cee4e350486129d467 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Fri, 28 Feb 2025 23:51:39 +0100
+Subject: [PATCH] ARM: dts: add Acmesystems Acqua A5 board
+
+---
+ .../boot/dts/microchip/at91-sama5d3_acqua.dts | 340 ++++++++++++++++++
+ 1 file changed, 340 insertions(+)
+ create mode 100644 arch/arm/boot/dts/microchip/at91-sama5d3_acqua.dts
+
+diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_acqua.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_acqua.dts
+new file mode 100644
+index 000000000000..60be8a67cdfd
+--- /dev/null
++++ b/arch/arm/boot/dts/microchip/at91-sama5d3_acqua.dts
+@@ -0,0 +1,340 @@
++/*
++ * acme-acqua.dts - Device Tree file for Acqua A5 Board
++ *
++ *  Copyright (C) 2014 Atmel,
++ *		  2014 Nicolas Ferre <nicolas.ferre@atmel.com>
++ * 
++ *	2022 Sergio Tanzilli <tanzilli@acmesystems.it>
++ *
++ * Licensed under GPLv2 or later.
++ */
++/dts-v1/;
++#include "sama5d31.dtsi"
++
++/ {
++	model = "Acme Systems Acqua SOM";
++	compatible = "acme,acqua", "atmel,sama5d3", "atmel,sama5";
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++		bootargs = "mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait net.ifnames=0";
++	};
++
++	memory {
++		reg = <0x20000000 0x10000000>;
++	};
++
++	clocks {
++		slow_xtal {
++			clock-frequency = <32768>;
++		};
++
++		main_xtal {
++			clock-frequency = <12000000>;
++		};
++	};
++
++	ahb {
++		apb {
++			hlcdc: hlcdc@f0030000 {
++				status = "disabled";
++				hlcdc-display-controller {
++					pinctrl-names = "default";
++					pinctrl-0 = <&pinctrl_lcd_base &pinctrl_lcd_rgb888_alt>;
++					port@0 {
++						hlcdc_panel_output: endpoint@0 {
++							remote-endpoint = <&panel_input>;
++						};
++					};
++				};
++			};
++		
++			/* MicroSD mounted on the SOM */
++		
++			mmc0: mmc@f0000000 {
++				pinctrl-0 = <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinctrl_mmc0_cd>;
++				status = "okay";
++				slot@0 {
++					reg = <0>;
++					bus-width = <4>;
++				};
++			};
++  
++  			/* Optional MicroSD to mount on the carrier board */
++  
++			mmc1: mmc@f8000000 {
++				pinctrl-0 = <&pinctrl_mmc1_clk_cmd_dat0 &pinctrl_mmc1_dat1_3 &pinctrl_mmc1_cd>;
++				status = "disabled";
++				slot@0 {
++					reg = <0>;
++					bus-width = <4>;
++					cd-gpios = <&pioE 1 GPIO_ACTIVE_LOW>;
++				};
++			};
++
++			spi0: spi@f0004000 {
++				cs-gpios = <&pioD 13 0>, <0>, <0>, <&pioD 16 0>;
++				status = "disabled";
++			};
++
++			can0: can@f000c000 {
++				status = "disabled";
++			};
++
++			tcb0: timer@f0010000 {
++				timer0: timer@0 {
++					compatible = "atmel,tcb-timer";
++					reg = <0>;
++				};
++
++				timer1: timer@1 {
++					compatible = "atmel,tcb-timer";
++					reg = <1>;
++				};
++			};
++
++			i2c0: i2c@f0014000 {
++				pinctrl-0 = <&pinctrl_i2c0_pu>;
++				status = "disabled";
++			};
++
++			i2c1: i2c@f0018000 {
++				status = "disabled";
++			};
++
++			macb1: ethernet@f802c000 {
++				compatible = "atmel,sama5d3-macb", "cdns,at91sam9260-macb", "cdns,macb";
++				
++				status = "okay";
++				phy-mode = "rmii";
++				#address-cells = <1>;
++				#size-cells = <0>;
++
++				nvmem-cells = <&eth0_addr>;
++				nvmem-cell-names = "mac-address";
++
++                phy0: ethernet-phy@1 {
++                    interrupt-parent = <&pioE>;
++                    interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
++                    reg = <1>;
++                };
++
++				/*ethernet-phy@1 {
++					reg = <0x1>;
++				};*/
++			};
++
++			/* Bit banging internal I2C to manage the AT24MAC402 chip */
++
++			i2c3@ {
++				compatible = "i2c-gpio";
++
++				sda-gpios = <&pioE 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
++				scl-gpios = <&pioE 2 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; 
++				
++				pinctrl-names = "default";
++				pinctrl-0 = <&pinctrl_i2c3_gpio>;
++				
++				i2c-gpio,delay-us = <4>; /* ~178 kHz */
++				#address-cells = <1>;
++				#size-cells = <0>;
++				
++				/* EEPROM contains the eth0 MAC address */
++				
++				eeprom@58 {
++					compatible = "atmel,24mac402";
++					pagesize = <256>;
++					read-only;
++					reg = <0x58>;
++					#address-cells = <1>;
++					#size-cells = <1>;
++
++					nvmem-layout {
++						compatible = "fixed-layout";
++						#address-cells = <1>;
++						#size-cells = <1>;
++
++						eth0_addr: eth-mac-addr@9A {
++							reg = <0x0 0x06>;
++						};
++					};
++				};
++				
++			};
++
++			pwm0: pwm@f002c000 {
++				pinctrl-names = "default";
++				pinctrl-0 = <&pinctrl_pwm0_pwmh0_0 &pinctrl_pwm0_pwmh1_0>;
++				status = "disabled";
++			};
++
++			usart0: serial@f001c000 {
++				status = "okay";
++			};
++
++			usart1: serial@f0020000 {
++				pinctrl-0 = <&pinctrl_usart1 &pinctrl_usart1_rts_cts>;
++				status = "disabled";
++			};
++
++			uart0: serial@f0024000 {
++				status = "disabled";
++			};
++
++
++			spi1: spi@f8008000 {
++				cs-gpios = <&pioC 25 0>;
++				status = "disabled";
++			};
++
++			adc0: adc@f8018000 {
++				atmel,adc-vref = <3300>;
++				atmel,adc-channels-used = <0xfe>;
++				pinctrl-0 = <
++					&pinctrl_adc0_adtrg
++					&pinctrl_adc0_ad1
++					&pinctrl_adc0_ad2
++					&pinctrl_adc0_ad3
++					&pinctrl_adc0_ad4
++					&pinctrl_adc0_ad5
++					&pinctrl_adc0_ad6
++					&pinctrl_adc0_ad7
++					>;
++				status = "disabled";
++			};
++
++			i2c2: i2c@f801c000 {
++				dmas = <0>, <0>;	/* Do not use DMA for i2c2 */
++				pinctrl-0 = <&pinctrl_i2c2_pu>;
++				status = "disabled";
++			};
++
++
++			dbgu: serial@ffffee00 {
++				status = "okay";
++			};
++
++			pinctrl@fffff200 {
++
++				atmel,mux-mask = <
++					/*   A          B          C  */
++					0xffffffff 0xc0fc0000 0xc0ff0000	/* pioA */
++					0xffffffff 0x0ff8ffff 0x00000000	/* pioB */
++					0xffffffff 0xbc00f1ff 0x7c00fc00	/* pioC */
++					0xffffffff 0xc001c0e0 0x0001c1e0	/* pioD */
++					0xfffffff9 0xbf9f8000 0x18000000 	/* pioE */
++				/*	0xffffffff 0xb8000000 0x18000000 */	/* pioE */
++					>;
++
++				board {
++					pinctrl_i2c0_pu: i2c0_pu {
++						atmel,pins =
++							<AT91_PIOA 30 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>,
++							<AT91_PIOA 31 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
++					};
++
++					pinctrl_i2c2_pu: i2c2_pu {
++						atmel,pins =
++							<AT91_PIOA 18 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>,
++							<AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>;
++					};
++
++					pinctrl_i2c3_gpio: i2c3-gpio {
++						atmel,pins =
++							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
++							 AT91_PIOE 2 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
++					};
++
++
++					pinctrl_key_gpio: key_gpio_0 {
++						atmel,pins =
++							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
++					};
++
++					pinctrl_mmc0_cd: mmc0_cd {
++						atmel,pins =
++							<AT91_PIOE 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
++					};
++
++					pinctrl_mmc1_cd: mmc1_cd {
++						atmel,pins =
++							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
++					};
++
++					pinctrl_usba_vbus: usba_vbus {
++						atmel,pins =
++							<AT91_PIOE 9 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>;	/* PE9, conflicts with A9 */
++					};
++					
++					pinctrl_gpio_leds: gpio_leds_default {
++						atmel,pins =
++							<AT91_PIOE 3 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
++							 AT91_PIOE 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
++							 AT91_PIOE 5 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
++							 AT91_PIOE 6 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
++					};
++				};
++			};
++		};
++
++        usb0: gadget@500000 {
++            status = "disabled";
++        };
++
++        usb1: ohci@600000 {
++            status = "okay";
++        };
++
++        usb2: ehci@700000 {
++            status = "okay";
++        };
++		
++	};
++
++
++	panel: panel {
++		/* compatible = "acme,43inch", "simple-panel"; */
++		compatible = "acme,50inch", "simple-panel";
++		/* compatible = "acme,70inch", "simple-panel"; */
++		
++		status = "disable";
++
++		port@0 {
++			panel_input: endpoint@0 {
++				remote-endpoint = <&hlcdc_panel_output>;
++			};
++		};
++	};
++
++ 
++	leds {
++		compatible = "gpio-leds";
++		pinctrl-names = "default";
++		pinctrl-0 = <&pinctrl_gpio_leds>;
++
++		led0 {
++			label = "led0";
++			gpios = <&pioE 3 GPIO_ACTIVE_LOW>;
++			default-state = "off";
++		};
++
++		led1 {
++			label = "led1";
++			gpios = <&pioE 4 GPIO_ACTIVE_LOW>;
++			default-state = "off";
++		};
++
++		led2 {
++			label = "led2";
++			gpios = <&pioE 5 GPIO_ACTIVE_LOW>;
++			linux,default-trigger = "heartbeat";
++		};
++
++		led3 {
++			label = "led3";
++			gpios = <&pioE 6 GPIO_ACTIVE_LOW>;
++			linux,default-trigger = "mmc0";
++			default-state = "off";
++		};
++	};		
++};
+-- 
+2.34.1
+
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index b102dde0ba..870c46c963 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-sama5d3_acqua"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index da54eaf620..7061a5e863 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/at91-sama5d3_acqua"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
