Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27295C54E94
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0EF60D59;
	Tue, 24 Jan 2023 20:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C0EF60D59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCo4xwDkjEsX; Tue, 24 Jan 2023 20:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC6460F48;
	Tue, 24 Jan 2023 20:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC6460F48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E721BF3F6
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 20:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A76D409C3
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 20:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A76D409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNgLrjLGZeV9 for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 20:36:49 +0000 (UTC)
X-Greylist: delayed 00:09:51 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 179FC4098E
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 179FC4098E
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 20:36:48 +0000 (UTC)
Received: from [IPV6:2a01:e0a:947:6e20:1472:c12:bc4f:6ddd] (unknown
 [IPv6:2a01:e0a:947:6e20:1472:c12:bc4f:6ddd])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 00D3FBFA60;
 Tue, 24 Jan 2023 21:26:50 +0100 (CET)
Message-ID: <fa36862a-c276-2e36-4c2c-d2ce7284816e@grenoble.cnrs.fr>
Date: Tue, 24 Jan 2023 21:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1674592011;
 bh=mVYMb0G5cW/jyn8GwuW9lXKX1N46BxWNCC+XoTo7ghA=;
 h=Date:To:Cc:From:Subject:From;
 b=jrtxO9JkttMY4HldUu80Qq6VQtu8mgfP+mwF6tG4hCJRRQZwyqkWYl06FGm5jHAC2
 McDCPO6ou8Ndp7O0iADcBzx/tVFM1LOwRfO/S+MqA4Irh6yYo6lYy5rGNt69KFQMxM
 Ge4mMUVuTY+o6oh9UP32LX1ca4/TU+nMtdsn9vGQsTAhNvYa3fCKJxhKALwAeZqRt3
 6MdqTR1mcKwLA3Q/BN4RtndkAVDt313SzhpuqaXfhfu8GaWhw7BFBKo1+Fmk4jpBJ6
 X3hPPYy1UFrvCrosd6LdgjpkADn0qPw5+k8I08giqNUWJ2YZw5ItMQ7tdFq1D0+q4f
 05UClKuKgdVBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=jrtxO9Jk
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_acqua_a5_*: bump to
 Linux v5.15
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
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The updated device tree is provided by Acme Systems:

    https://www.acmesystems.it/compile_kernel_5_15

It is released under GPLv2 or later.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../acqua-a5/at91-sama5d3_acqua.dts           | 51 +++++++++++++++----
 configs/acmesystems_acqua_a5_256mb_defconfig  |  4 +-
 configs/acmesystems_acqua_a5_512mb_defconfig  |  4 +-
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
index 264af29809..39fa4df1b1 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
@@ -4,7 +4,7 @@
  *  Copyright (C) 2014 Atmel,
  *		  2014 Nicolas Ferre <nicolas.ferre@atmel.com>
  * 
- *	2020 Sergio Tanzilli <tanzilli@acmesystems.it>
+ *	2022 Sergio Tanzilli <tanzilli@acmesystems.it>
  *
  * Licensed under GPLv2 or later.
  */
@@ -17,7 +17,7 @@
 
 	chosen {
 		stdout-path = "serial0:115200n8";
-		bootargs = "mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait consoleblank=0";
+		bootargs = "mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait net.ifnames=0";
 	};
 
 	memory {
@@ -128,15 +128,19 @@
 
 			i2c3@ {
 				compatible = "i2c-gpio";
-				gpios = <&pioE 1 0 /* SDA */
-						 &pioE 2 0 /* SCK */
-						>;
-				i2c-gpio,delay-us = <4>;    /* ~178 kHz */
+
+				sda-gpios = <&pioE 1 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+				scl-gpios = <&pioE 2 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; 
+				
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_i2c3_gpio>;
+				
+				i2c-gpio,delay-us = <4>; /* ~178 kHz */
 				#address-cells = <1>;
 				#size-cells = <0>;
-			
+				
 				/* EEPROM contains the eth0 MAC address */
-				 
+				
 				eeprom@58 {
 					compatible = "atmel,24mac402";
 					pagesize = <256>;
@@ -149,6 +153,7 @@
 						reg = <0x0 0x06>;
 					};
 				};
+				
 			};
 
 			pwm0: pwm@f002c000 {
@@ -204,6 +209,17 @@
 			};
 
 			pinctrl@fffff200 {
+
+				atmel,mux-mask = <
+					/*   A          B          C  */
+					0xffffffff 0xc0fc0000 0xc0ff0000	/* pioA */
+					0xffffffff 0x0ff8ffff 0x00000000	/* pioB */
+					0xffffffff 0xbc00f1ff 0x7c00fc00	/* pioC */
+					0xffffffff 0xc001c0e0 0x0001c1e0	/* pioD */
+					0xfffffff9 0xbf9f8000 0x18000000 	/* pioE */
+				/*	0xffffffff 0xb8000000 0x18000000 */	/* pioE */
+					>;
+
 				board {
 					pinctrl_i2c0_pu: i2c0_pu {
 						atmel,pins =
@@ -217,6 +233,13 @@
 							<AT91_PIOA 19 AT91_PERIPH_B AT91_PINCTRL_PULL_UP>;
 					};
 
+					pinctrl_i2c3_gpio: i2c3-gpio {
+						atmel,pins =
+							<AT91_PIOE 1 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+							 AT91_PIOE 2 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+					};
+
+
 					pinctrl_key_gpio: key_gpio_0 {
 						atmel,pins =
 							<AT91_PIOE 29 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH>;
@@ -236,12 +259,20 @@
 						atmel,pins =
 							<AT91_PIOE 9 AT91_PERIPH_GPIO AT91_PINCTRL_DEGLITCH>;	/* PE9, conflicts with A9 */
 					};
+					
+					pinctrl_gpio_leds: gpio_leds_default {
+						atmel,pins =
+							<AT91_PIOE 3 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+							 AT91_PIOE 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+							 AT91_PIOE 5 AT91_PERIPH_GPIO AT91_PINCTRL_NONE
+							 AT91_PIOE 6 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+					};
 				};
 			};
 		};
 
         usb0: gadget@500000 {
-            status = "okay";
+            status = "disabled";
         };
 
         usb1: ohci@600000 {
@@ -272,6 +303,8 @@
  
 	leds {
 		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_leds>;
 
 		led0 {
 			label = "led0";
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index f8129f3780..5a5b9559d6 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,13 +2,13 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.90"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index e399d4a9ff..bb5bb1964e 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,13 +2,13 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.107"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.90"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
