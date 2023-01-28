Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A061DC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4930F60E4A;
	Sat, 28 Jan 2023 21:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4930F60E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-vHZbIDNvyq; Sat, 28 Jan 2023 21:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6450660D55;
	Sat, 28 Jan 2023 21:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6450660D55
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF7151BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6C9560D55
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C9560D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mferss0l_T2o for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:22:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B03E860C15
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03E860C15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D18887E35; Sat, 28 Jan 2023 21:22:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:22:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e75f402ba6dbba26f4f35e0b064b269d75c9f6f2
X-Git-Newrev: e84d84886daab3208dc209f362aabb4436ba00a6
X-Patchwork-Hint: ignore
Message-Id: <20230128212237.9D18887E35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e84d84886daab3208dc209f362aabb4436ba00a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The updated device tree is provided by Acme Systems:

    https://www.acmesystems.it/compile_kernel_5_15

It is released under GPLv2 or later.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 51 +++++++++++++++++++----
 configs/acmesystems_acqua_a5_256mb_defconfig      |  4 +-
 configs/acmesystems_acqua_a5_512mb_defconfig      |  4 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
