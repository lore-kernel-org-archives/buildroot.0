Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DE0C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Oct 2022 07:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B5640287;
	Wed,  5 Oct 2022 07:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41B5640287
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9c1ujmQnzZzH; Wed,  5 Oct 2022 07:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 494AF4029B;
	Wed,  5 Oct 2022 07:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 494AF4029B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28B0B1BF2BC
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 07:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02262606E6
 for <buildroot@lists.busybox.net>; Wed,  5 Oct 2022 07:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02262606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avPNRNRD5b2C for <buildroot@lists.busybox.net>;
 Wed,  5 Oct 2022 07:58:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6440060D57
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6440060D57
 for <buildroot@buildroot.org>; Wed,  5 Oct 2022 07:58:22 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF46F1BF208;
 Wed,  5 Oct 2022 07:58:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  5 Oct 2022 09:58:14 +0200
Message-Id: <20221005075815.305236-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005075815.305236-1-kory.maincent@bootlin.com>
References: <20221005075815.305236-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664956698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EznQA+IIP9AgKGcDrpw4ccqbVFPXJUgQodd+bmp5T9c=;
 b=ZzmlCiwct9OsCVqNagQDIvR4YjVU7I8vqsyskS8XQmULHzBDK6Q4f/SKlDyANqjmIVaz1n
 87l7o2uAg3sE5mwZqkB1ldttB1KKELfHmAdhWdTbc9D91rsu0R2aoWkLcrVmyKi5an3vXG
 ZY5vUrp3PSUIwnCVBBCYShATmSN6uGsQspRKESvM4alZ1lBwHsf4MtPFKpnZ9b6GtPyLgk
 JbefnMpz3VAt4sUcHxm/YcNQAlgZmzELCJ/P7k/nZbFh2qdqwNy7Wy/lwPXgeOng0+dCRI
 ydKMLMw7M2Sf99sX/1QH4ie5v9mZTQ7/I3Pv1syiTqvGYZosvAYWNe/FRSSDRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZzmlCiwc
Subject: [Buildroot] [PATCH 2/2] board/octavo/osd32mp1-brk: update BSP
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

  https://octavosystems.com/octavo_products/osd32mp1-brk/

The device tree blobs, and the U-boot patches come from Octavo System:

  https://github.com/octavosystems/meta-octavo-osd32mp1

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 board/octavo/osd32mp1-brk/genimage.cfg        |    4 +-
 .../linux-dts/stm32mp157c-osd32mp1-brk.dts    |  809 +++---
 ...Add-OSD32MP1-BRK-device-tree-support.patch | 1509 +++++++++++
 .../uboot/0001-osd32mp1-BRK-board-added.patch | 2349 -----------------
 .../0002-Add-OSD32MP1-BRK-build-config.patch  |  881 +++++++
 ...32mp1_ddr.dtsi => osd32mp1_ddr_1x4Gb.dtsi} |    2 +
 .../stm32mp157c-osd32mp1-brk-fw-config.dts    |    6 +
 .../tfa-dts/stm32mp157c-osd32mp1-brk.dts      |  502 ++--
 configs/octavo_osd32mp1_brk_defconfig         |   20 +-
 9 files changed, 3027 insertions(+), 3055 deletions(-)
 create mode 100644 board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-support.patch
 delete mode 100644 board/octavo/osd32mp1-brk/patches/uboot/0001-osd32mp1-BRK-board-added.patch
 create mode 100644 board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch
 rename board/octavo/osd32mp1-brk/tfa-dts/{osd32mp1_ddr.dtsi => osd32mp1_ddr_1x4Gb.dtsi} (99%)
 create mode 100644 board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk-fw-config.dts

diff --git a/board/octavo/osd32mp1-brk/genimage.cfg b/board/octavo/osd32mp1-brk/genimage.cfg
index c632090efd..40bde81e86 100644
--- a/board/octavo/osd32mp1-brk/genimage.cfg
+++ b/board/octavo/osd32mp1-brk/genimage.cfg
@@ -11,8 +11,8 @@ image sdcard.img {
 		image = "tf-a-stm32mp157c-osd32mp1-brk.stm32"
 	}
 
-	partition ssbl {
-		image = "u-boot.stm32"
+	partition fip {
+		image = "fip.bin"
 		size = 2M
 	}
 
diff --git a/board/octavo/osd32mp1-brk/linux-dts/stm32mp157c-osd32mp1-brk.dts b/board/octavo/osd32mp1-brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
index 48ae3bfab7..d5f2793f54 100644
--- a/board/octavo/osd32mp1-brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
+++ b/board/octavo/osd32mp1-brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
@@ -9,12 +9,12 @@
 
 /dts-v1/;
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
-
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp157-m4-srm.dtsi"
+#include "stm32mp15-m4-srm.dtsi"
 #include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/rtc/rtc-stm32.h>
 
 / {
@@ -67,16 +67,10 @@
 			no-map;
 		};
 
-		gpu_reserved:gpu@da000000{
-			reg = <0xda000000 0x4000000>;
+		gpu_reserved:gpu@d4000000{
+			reg = <0xd4000000 0x4000000>;
 			no-map;
 		};
-
-		optee_memory:optee@0xde000000{
-			reg = <0xde000000 0x02000000>;
-			no-map;
-			status = "okay";
-		};
 	};
 
 	led{
@@ -132,43 +126,21 @@
 
 	aliases{
 		serial0 = &uart4;
-		serial2 = &usart2;
-		serial5 = &uart5;
-		serial7 = &uart7;
-		serial1 = &uart8;
+    		serial2 = &usart2;
+    		serial5 = &uart5;
+    		serial7 = &uart7;
+    		serial1 = &uart8;
 	};
 
 	chosen{
 		stdout-path = "serial0:115200n8";
 	};
 
-	clocks {
-
-#ifndef CONFIG_STM32MP1_TRUSTED
-		clk_lsi: clk-lsi {
-			clock-frequency = <32000>;
-		};
-		clk_hsi: clk-hsi {
-			clock-frequency = <64000000>;
-		};
-		clk_csi: clk-csi {
-			clock-frequency = <4000000>;
-		};
-		clk_lse: clk-lse {
-			clock-frequency = <32768>;
-		};
-		clk_hse: clk-hse {
-			clock-frequency = <24000000>;
-		};
-#endif	/*CONFIG_STM32MP1_TRUSTED*/
-	};
-
 }; /*root*/
 
 &pinctrl {
 	u-boot,dm-pre-reloc;
-
-  i2c1_pins_mx: i2c1-0 {
+	i2c1_pins_mx: i2c1-0 {
 		pins {
 			pinmux = <STM32_PINMUX('H', 11, AF5)>, /* I2C1_SCL */
 				 <STM32_PINMUX('H', 12, AF5)>; /* I2C1_SDA */
@@ -185,301 +157,301 @@
 		};
 	};
 
-  i2c2_pins_mx: i2c2-0 {
-    pins {
-      pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
-         <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
-      bias-disable;
-      drive-open-drain;
-      slew-rate = <0>;
-    };
-  };
-
-  i2c2_pins_sleep_mx: i2c2-1 {
-    pins {
-      pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
-         <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
-    };
-  };
-
-  i2c5_pins_mx: i2c5-0 {
-    pins {
-      pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
-         <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
-      bias-disable;
-      drive-open-drain;
-      slew-rate = <0>;
-    };
-  };
-
-  i2c5_pins_sleep_mx: i2c5-1 {
-    pins {
-      pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
-         <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
-    };
-  };
-
-  spi2_pins_mx: spi2-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
-         <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
-      bias-disable;
-      drive-push-pull;
-      slew-rate = <1>;
-    };
-
-    pins2 {
-      pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
-      bias-disable;
-    };
-  };
-
-  spi2_sleep_pins_mx: spi2-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
-         <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
-         <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
-    };
-  };
-
-  spi4_pins_mx: spi4-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
-         <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
-      bias-disable;
-      drive-push-pull;
-      slew-rate = <1>;
-    };
-
-    pins2 {
-      pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
-      bias-disable;
-    };
-  };
-
-  spi4_sleep_pins_mx: spi4-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
-         <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
-         <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
-    };
-  };
-
-  usart2_pins_mx: usart2-0 {
-      pins1 {
-        pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
-        bias-disable;
-        drive-push-pull;
-        slew-rate = <0>;
-      };
-      pins2 {
-        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
-        bias-disable;
-      };
-    };
-
-    usart2_idle_pins_mx: usart2-idle-0 {
-      pins1 {
-        pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
-      };
-      pins2 {
-        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
-        bias-disable;
-      };
-    };
-
-    usart2_sleep_pins_mx: usart2-sleep-0 {
-      pins {
-        pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-           <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
-      };
-    };
-
-    uart5_pins_mx: uart5-0 {
-      pins1 {
-        pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
-        bias-disable;
-        drive-push-pull;
-        slew-rate = <0>;
-      };
-      pins2 {
-        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
-        bias-disable;
-      };
-    };
-
-    uart5_idle_pins_mx: uart5-idle-0 {
-      pins1 {
-        pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
-      };
-      pins2 {
-        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
-        bias-disable;
-      };
-    };
-
-    uart5_sleep_pins_mx: uart5-sleep-0 {
-      pins {
-        pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
-           <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
-      };
-    };
-
-    uart7_pins_mx: uart7-0 {
-      pins1 {
-        pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
-        bias-disable;
-        drive-push-pull;
-        slew-rate = <0>;
-      };
-      pins2 {
-        pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
-        bias-disable;
-      };
-    };
-
-  uart7_idle_pins_mx: uart7-idle-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
-    };
-    pins2 {
-      pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
-      bias-disable;
-    };
-  };
-
-  uart7_sleep_pins_mx: uart7-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
-        <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
-    };
-  };
-
-  uart8_pins_mx: uart8-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
-      bias-disable;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-    pins2 {
-      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
-      bias-disable;
-    };
-  };
-
-  uart8_idle_pins_mx: uart8-idle-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
-    };
-    pins2 {
-      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
-      bias-disable;
-    };
-  };
-
-  uart8_sleep_pins_mx: uart8-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
-        <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
-    };
-  };
-
-  m_can1_pins_mx: m-can1-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-      slew-rate = <0>;
-      drive-push-pull;
-      bias-disable;
-    };
-    pins2 {
-      pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
-      bias-disable;
-    };
-  };
-
-  m_can1_sleep_pins_mx: m_can1-sleep@0 {
-    pins {
-      pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
-        <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
-    };
-  };
-
-  pwm1_pins_mx: pwm1-0 {
-    pins {
-      pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
-      bias-pull-down;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-  };
-
-  pwm1_sleep_pins_mx: pwm1-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
-    };
-  };
-
-  pwm3_pins_mx: pwm3-0 {
-    pins {
-      pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
-      bias-pull-down;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-  };
-
-  pwm3_sleep_pins_mx: pwm3-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
-    };
-  };
-
-  pwm4_pins_mx: pwm4-0 {
-    pins {
-      pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
-      bias-pull-down;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-  };
-
-  pwm4_sleep_pins_mx: pwm4-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
-    };
-  };
-
-  pwm8_pins_mx: pwm8-0 {
-    pins {
-      pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
-      bias-pull-down;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-  };
-
-  pwm8_sleep_pins_mx: pwm8-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
-    };
-  };
-
-
-  pwm12_pins_mx: pwm12-0 {
-    pins {
-      pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
-      bias-pull-down;
-      drive-push-pull;
-      slew-rate = <0>;
-    };
-  };
-
-  pwm12_sleep_pins_mx: pwm12-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
-    };
-  };
+	i2c2_pins_mx: i2c2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
+				 <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_pins_sleep_mx: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
+	i2c5_pins_mx: i2c5-0 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
+				 <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c5_pins_sleep_mx: i2c5-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
+				 <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
+		};
+	};
+
+	spi2_pins_mx: spi2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
+			bias-disable;
+		};
+	};
+
+	spi2_sleep_pins_mx: spi2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
+				 <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
+				 <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
+		};
+	};
+
+	spi4_pins_mx: spi4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+			bias-disable;
+		};
+	};
+
+	spi4_sleep_pins_mx: spi4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
+				 <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
+				 <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
+		};
+	};
+
+	usart2_pins_mx: usart2-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_idle_pins_mx: usart2-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
+			bias-disable;
+		};
+	};
+
+	usart2_sleep_pins_mx: usart2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+				 <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
+		};
+	};
+
+	uart5_pins_mx: uart5-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
+			bias-disable;
+		};
+	};
+
+	uart5_idle_pins_mx: uart5-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
+			bias-disable;
+		};
+	};
+
+	uart5_sleep_pins_mx: uart5-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
+				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
+		};
+	};
+
+	uart7_pins_mx: uart7-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_idle_pins_mx: uart7-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
+			bias-disable;
+		};
+	};
+
+	uart7_sleep_pins_mx: uart7-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
+				 <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
+		};
+	};
+
+	uart8_pins_mx: uart8-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
+			bias-disable;
+		};
+	};
+
+	uart8_idle_pins_mx: uart8-idle-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
+			bias-disable;
+		};
+	};
+
+	uart8_sleep_pins_mx: uart8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
+				 <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
+		};
+	};
+
+	m_can1_pins_mx: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
+			slew-rate = <0>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	m_can1_sleep_pins_mx: m_can1-sleep@0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
+	pwm1_pins_mx: pwm1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm1_sleep_pins_mx: pwm1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
+		};
+	};
+
+	pwm3_pins_mx: pwm3-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm3_sleep_pins_mx: pwm3-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
+		};
+	};
+
+	pwm4_pins_mx: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm4_sleep_pins_mx: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
+		};
+	};
+
+	pwm8_pins_mx: pwm8-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm8_sleep_pins_mx: pwm8-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
+		};
+	};
+
+
+	pwm12_pins_mx: pwm12-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm12_sleep_pins_mx: pwm12-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
+		};
+	};
 
 	sdmmc1_pins_mx: sdmmc1_mx-0 {
 		u-boot,dm-pre-reloc;
@@ -595,40 +567,39 @@
 		};
 	};
 
-  spi6_pins_mx: spi6-0 {
-    pins1 {
-      pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
-         <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
-      bias-disable;
-      drive-push-pull;
-      slew-rate = <1>;
-    };
-
-    pins2 {
-      pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
-      bias-disable;
-    };
-  };
-
-  spi6_sleep_pins_mx: spi6-sleep-0 {
-    pins {
-      pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
-         <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
-         <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
-    };
-  };
+	spi6_pins_mx: spi6-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
+				 <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+
+		pins2 {
+			pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
+			bias-disable;
+		};
+	};
+
+	spi6_sleep_pins_mx: spi6-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
+				 <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
+				 <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
+		};
+	};
 };
 
 &m4_rproc{
-	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
-	mbox-names = "vq0", "vq1", "shutdown";
-	status = "okay";
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	wakeup-source;
+	status = "okay";
 };
 
 &pwr_regulators {
@@ -636,9 +607,6 @@
 	vdd_3v3_usbfs-supply = <&vdd_usb>;
 };
 
-&bsec{
-	status = "okay";
-};
 
 &crc1{
 	status = "okay";
@@ -659,14 +627,6 @@
 	sram = <&dma_pool>;
 };
 
-&dmamux1{
-
-	dma-masters = <&dma1 &dma2>;
-	dma-channels = <16>;
-
-	status = "okay";
-};
-
 &dts{
 	status = "okay";
 };
@@ -819,10 +779,7 @@
 
 			vdd_usb:ldo4{
 				regulator-name = "vdd_usb";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
 				interrupts = <IT_CURLIM_LDO4 0>;
-				regulator-always-on;
 			};
 
 			vdda:ldo5{
@@ -976,23 +933,23 @@
 };
 
 &adc {
-  vdd-supply = <&vdd>;
-  vdda-supply = <&vdda>;
-  vref-supply = <&vdda>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vdda>;
 	status = "okay";
-  adc1: adc@0 {
-    st,min-sample-time-nsecs = <5000>;
-    st,adc-channels = <0 1>;
-    status = "okay";
-  };
-
-  adc2: adc@100 {
-    status = "okay";
-  };
-
-  adc_temp: temp {
-    status = "okay";
-  };
+	adc1: adc@0 {
+		st,min-sample-time-nsecs = <5000>;
+		st,adc-channels = <0 1>;
+		status = "okay";
+	};
+
+	adc2: adc@100 {
+		status = "okay";
+	};
+
+	adc_temp: temp {
+		status = "okay";
+	};
 };
 
 &usbh_ohci{
@@ -1014,50 +971,46 @@
 	};
 };
 
-&optee{
-	status = "okay";
-};
-
 &spi2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi2_pins_mx>;
 	pinctrl-1 = <&spi2_sleep_pins_mx>;
-  cs-gpios = <&gpioi 0 0>;
+	cs-gpios = <&gpioi 0 0>;
 	status = "okay";
 
-  spidev2: spidev2@0{
-    compatible = "rohm,dh2228fv";
-    spi-max-frequency = <30000000>;
-    reg = <0>;
-  };
+	spidev2: spidev2@0{
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <30000000>;
+		reg = <0>;
+	};
 };
 
 &spi4 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi4_pins_mx>;
 	pinctrl-1 = <&spi4_sleep_pins_mx>;
-  cs-gpios = <&gpioe 11 0>;
+	cs-gpios = <&gpioe 11 0>;
 	status = "okay";
 
-  spidev4: spidev4@0{
-    compatible = "rohm,dh2228fv";
-    spi-max-frequency = <30000000>;
-    reg = <0>;
-  };
+	spidev4: spidev4@0{
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <30000000>;
+		reg = <0>;
+	};
 };
 
 &spi6 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi6_pins_mx>;
 	pinctrl-1 = <&spi6_sleep_pins_mx>;
-  cs-gpios = <&gpioz 3 0>;
+	cs-gpios = <&gpioz 3 0>;
 	status = "okay";
 
-  spidev6: spidev6@0{
-    compatible = "rohm,dh2228fv";
-    spi-max-frequency = <30000000>;
-    reg = <0>;
-  };
+	spidev6: spidev6@0{
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <30000000>;
+		reg = <0>;
+	};
 };
 
 &usart2 {
@@ -1096,9 +1049,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&m_can1_pins_mx>;
 	status = "okay";
-  can-transceiver {
-    max-bitrate = <5000000>;
-  };
+	can-transceiver {
+		max-bitrate = <5000000>;
+	};
 };
 
 &timers1 {
@@ -1107,9 +1060,9 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pwm1: pwm {
-    pinctrl-names = "default", "sleep";
-	  pinctrl-0 = <&pwm1_pins_mx>;
-	  pinctrl-1 = <&pwm1_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm1_pins_mx>;
+		pinctrl-1 = <&pwm1_sleep_pins_mx>;
 		status = "okay";
 	};
 };
@@ -1120,9 +1073,9 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pwm3: pwm {
-    pinctrl-names = "default", "sleep";
-	  pinctrl-0 = <&pwm3_pins_mx>;
-	  pinctrl-1 = <&pwm3_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm3_pins_mx>;
+		pinctrl-1 = <&pwm3_sleep_pins_mx>;
 		status = "okay";
 	};
 };
@@ -1133,9 +1086,9 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pwm4: pwm {
-    pinctrl-names = "default", "sleep";
-	  pinctrl-0 = <&pwm4_pins_mx>;
-	  pinctrl-1 = <&pwm4_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm4_pins_mx>;
+		pinctrl-1 = <&pwm4_sleep_pins_mx>;
 		status = "okay";
 	};
 };
@@ -1146,9 +1099,9 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pwm8: pwm {
-    pinctrl-names = "default", "sleep";
-	  pinctrl-0 = <&pwm8_pins_mx>;
-	  pinctrl-1 = <&pwm8_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm8_pins_mx>;
+		pinctrl-1 = <&pwm8_sleep_pins_mx>;
 		status = "okay";
 	};
 };
@@ -1159,9 +1112,9 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	pwm12: pwm {
-    pinctrl-names = "default", "sleep";
-	  pinctrl-0 = <&pwm12_pins_mx>;
-	  pinctrl-1 = <&pwm12_sleep_pins_mx>;
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm12_pins_mx>;
+		pinctrl-1 = <&pwm12_sleep_pins_mx>;
 		status = "okay";
 	};
 };
diff --git a/board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-support.patch b/board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-support.patch
new file mode 100644
index 0000000000..3e4b6de235
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/uboot/0001-Add-OSD32MP1-BRK-device-tree-support.patch
@@ -0,0 +1,1509 @@
+From 4731b1f73e0bfe3e3539f6b7c17e0f5366996a98 Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <dantuguf14105@gmail.com>
+Date: Sun, 21 Nov 2021 23:26:05 -0600
+Subject: [PATCH 1/2] Add OSD32MP1-BRK device tree support
+
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ arch/arm/dts/Makefile                         |    3 +-
+ .../dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi    |  119 ++
+ .../dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi  |  219 ++++
+ arch/arm/dts/stm32mp157c-osd32mp1-brk.dts     | 1120 +++++++++++++++++
+ 4 files changed, 1460 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 83677c3d4f..6e67c6d18a 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -959,7 +959,8 @@ dtb-$(CONFIG_STM32MP15x) += \
+ 	stm32mp157f-ed1.dtb \
+ 	stm32mp157f-ev1.dtb \
+ 	stm32mp15xx-dhcom-pdk2.dtb \
+-	stm32mp15xx-dhcor-avenger96.dtb
++	stm32mp15xx-dhcor-avenger96.dtb \
++	stm32mp157c-osd32mp1-brk.dtb
+ 
+ dtb-$(CONFIG_SOC_K3_AM6) += k3-am654-base-board.dtb k3-am654-r5-base-board.dtb
+ dtb-$(CONFIG_SOC_K3_J721E) += k3-j721e-common-proc-board.dtb \
+diff --git a/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+new file mode 100644
+index 0000000000..362f3281b8
+--- /dev/null
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
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+new file mode 100644
+index 0000000000..b7284f3028
+--- /dev/null
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+@@ -0,0 +1,219 @@
++/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause*/
++/*
++ * Copyright (C) 2020, Octavo Systems LLC - All Rights Reserved
++ */
++
++/* For more information on Device Tree configuration, please refer to
++ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
++ */
++
++#include <dt-bindings/clock/stm32mp1-clksrc.h>
++#include "stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi"
++#include "stm32mp15-u-boot.dtsi"
++#include "stm32mp15-ddr.dtsi"
++
++
++/ {
++
++	aliases{
++		i2c0 = &i2c4;
++		mmc0 = &sdmmc1;
++		usb0 = &usbotg_hs;
++	};
++
++	config{
++		u-boot,boot-led = "LED2_GRN";
++		u-boot,error-led = "LED2_RED";
++		u-boot,mmc-env-partition = "fip";
++		st,stm32prog-gpios = <&gpiod 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	};
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
++}; /*root*/
++
++#ifndef CONFIG_TFABOOT
++
++&clk_hse {
++	st,digbypass;
++};
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
++		CLK_CKPER_HSE
++		CLK_FMC_ACLK
++		CLK_QSPI_ACLK
++		CLK_ETH_DISABLED
++		CLK_SDMMC12_PLL4P
++		CLK_DSI_DSIPLL
++		CLK_STGEN_HSE
++		CLK_USBPHY_HSE
++		CLK_SPI2S1_PLL3Q
++		CLK_SPI2S23_PLL3Q
++		CLK_SPI45_HSI
++		CLK_SPI6_HSI
++		CLK_I2C46_HSI
++		CLK_SDMMC3_PLL4P
++		CLK_USBO_USBPHY
++		CLK_ADC_CKPER
++		CLK_CEC_LSE
++		CLK_I2C12_HSI
++		CLK_I2C35_HSI
++		CLK_UART1_HSI
++		CLK_UART24_HSI
++		CLK_UART35_HSI
++		CLK_UART6_HSI
++		CLK_UART78_HSI
++		CLK_SPDIF_PLL4P
++		CLK_FDCAN_PLL4R
++		CLK_SAI1_PLL3Q
++		CLK_SAI2_PLL3Q
++		CLK_SAI3_PLL3Q
++		CLK_SAI4_PLL3Q
++		CLK_RNG1_LSI
++		CLK_RNG2_LSI
++		CLK_LPTIM1_PCLK1
++		CLK_LPTIM23_PCLK3
++		CLK_LPTIM45_LSE
++	>;
++	pll2:st,pll@1 {
++		compatible = "st,stm32mp1-pll";
++		reg = <1>;
++		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
++		frac = < 0x1400 >;
++		u-boot,dm-pre-reloc;
++	};
++	pll3:st,pll@2 {
++		compatible = "st,stm32mp1-pll";
++		reg = <2>;
++		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
++		frac = < 0x1a04 >;
++		u-boot,dm-pre-reloc;
++	};
++	pll4:st,pll@3 {
++		compatible = "st,stm32mp1-pll";
++		reg = <3>;
++		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++};
++
++&i2c4_pins_z_mx {
++	u-boot,dm-pre-reloc;
++	pins {
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&sdmmc1{
++	u-boot,dm-pre-reloc;
++};
++
++&sdmmc1_pins_mx {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
++};
++
++#endif	/*CONFIG_TFABOOT*/
++
++&cryp1{
++	u-boot,dm-pre-reloc;
++};
++
++&hash1{
++	u-boot,dm-pre-reloc;
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++};
++
++&usbotg_hs{
++	u-boot,dm-pre-reloc;
++	u-boot,force-b-session-valid;
++	hnp-srp-disable;
++	dr_mode = "peripheral";
++};
++
++&usbphyc{
++	u-boot,dm-pre-reloc;
++};
++
++&usbphyc_port0{
++	u-boot,dm-pre-reloc;
++};
++
++&usbphyc_port1{
++	u-boot,dm-pre-reloc;
++};
++
++&adc{
++	status = "okay";
++};
++
++#ifndef CONFIG_STM32MP1_TRUSTED
++&i2s2{
++	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
++};
++
++&pmic{
++	u-boot,dm-pre-reloc;
++};
++
++&sai2{
++	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
++};
++#endif /*CONFIG_STM32MP1_TRUSTED*/
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+new file mode 100644
+index 0000000000..d5f2793f54
+--- /dev/null
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+@@ -0,0 +1,1120 @@
++/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
++/*
++ * Copyright (C) Octavo Systems LLC 2020 - All Rights Reserved
++ */
++
++/* For more information on Device Tree configuration, please refer to
++ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
++ */
++
++/dts-v1/;
++#include <dt-bindings/pinctrl/stm32-pinfunc.h>
++#include "stm32mp157.dtsi"
++#include "stm32mp15xc.dtsi"
++#include "stm32mp15xxac-pinctrl.dtsi"
++#include "stm32mp15-m4-srm.dtsi"
++#include <dt-bindings/mfd/st,stpmic1.h>
++#include <dt-bindings/gpio/gpio.h>
++#include <dt-bindings/rtc/rtc-stm32.h>
++
++/ {
++	model = "Octavo OSD32MP1 BRK board";
++	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
++
++	memory@c0000000 {
++		device_type = "memory";
++		reg = <0xc0000000 0x20000000>;
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		mcuram2:mcuram2@10000000{
++			compatible = "shared-dma-pool";
++			reg = <0x10000000 0x40000>;
++			no-map;
++		};
++
++		vdev0vring0:vdev0vring0@10040000{
++			compatible = "shared-dma-pool";
++			reg = <0x10040000 0x1000>;
++			no-map;
++		};
++
++		vdev0vring1:vdev0vring1@10041000{
++			compatible = "shared-dma-pool";
++			reg = <0x10041000 0x1000>;
++			no-map;
++		};
++
++		vdev0buffer:vdev0buffer@10042000{
++			compatible = "shared-dma-pool";
++			reg = <0x10042000 0x4000>;
++			no-map;
++		};
++
++		mcuram:mcuram@30000000{
++			compatible = "shared-dma-pool";
++			reg = <0x30000000 0x40000>;
++			no-map;
++		};
++
++		retram:retram@38000000{
++			compatible = "shared-dma-pool";
++			reg = <0x38000000 0x10000>;
++			no-map;
++		};
++
++		gpu_reserved:gpu@d4000000{
++			reg = <0xd4000000 0x4000000>;
++			no-map;
++		};
++	};
++
++	led{
++		compatible = "gpio-leds";
++
++		red1{
++			label = "LED1_RED";
++			gpios = <&gpioz 6 GPIO_ACTIVE_LOW>;
++			linux,default-trigger = "heartbeat";
++			status = "okay";
++			default-state = "off";
++		};
++
++		green1{
++			label = "LED1_GRN";
++			gpios = <&gpioz 7 GPIO_ACTIVE_LOW>;
++			status = "okay";
++			default-state = "on";
++		};
++
++		red2{
++			label = "LED2_RED";
++			gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
++			status = "okay";
++			default-state = "off";
++		};
++
++		green2{
++			label = "LED2_GRN";
++			gpios = <&gpioi 9 GPIO_ACTIVE_LOW>;
++			default-state = "off";
++		};
++	};
++
++	usb_phy_tuning:usb-phy-tuning{
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
++	vin:vin{
++		compatible = "regulator-fixed";
++		regulator-name = "vin";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		regulator-always-on;
++	};
++
++	aliases{
++		serial0 = &uart4;
++    		serial2 = &usart2;
++    		serial5 = &uart5;
++    		serial7 = &uart7;
++    		serial1 = &uart8;
++	};
++
++	chosen{
++		stdout-path = "serial0:115200n8";
++	};
++
++}; /*root*/
++
++&pinctrl {
++	u-boot,dm-pre-reloc;
++	i2c1_pins_mx: i2c1-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 11, AF5)>, /* I2C1_SCL */
++				 <STM32_PINMUX('H', 12, AF5)>; /* I2C1_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c1_pins_sleep_mx: i2c1-1 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 11, ANALOG)>, /* I2C1_SCL */
++				 <STM32_PINMUX('H', 12, ANALOG)>; /* I2C1_SDA */
++		};
++	};
++
++	i2c2_pins_mx: i2c2-0 {
++		pins {
++			pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
++				 <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c2_pins_sleep_mx: i2c2-1 {
++		pins {
++			pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
++				 <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
++		};
++	};
++
++	i2c5_pins_mx: i2c5-0 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
++				 <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
++		};
++	};
++
++	i2c5_pins_sleep_mx: i2c5-1 {
++		pins {
++			pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
++				 <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
++		};
++	};
++
++	spi2_pins_mx: spi2-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
++				 <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++
++		pins2 {
++			pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
++			bias-disable;
++		};
++	};
++
++	spi2_sleep_pins_mx: spi2-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
++				 <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
++				 <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
++		};
++	};
++
++	spi4_pins_mx: spi4-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
++				 <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++
++		pins2 {
++			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
++			bias-disable;
++		};
++	};
++
++	spi4_sleep_pins_mx: spi4-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
++				 <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
++				 <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
++		};
++	};
++
++	usart2_pins_mx: usart2-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
++			bias-disable;
++		};
++	};
++
++	usart2_idle_pins_mx: usart2-idle-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
++			bias-disable;
++		};
++	};
++
++	usart2_sleep_pins_mx: usart2-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
++				 <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
++		};
++	};
++
++	uart5_pins_mx: uart5-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
++			bias-disable;
++		};
++	};
++
++	uart5_idle_pins_mx: uart5-idle-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
++			bias-disable;
++		};
++	};
++
++	uart5_sleep_pins_mx: uart5-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
++				 <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
++		};
++	};
++
++	uart7_pins_mx: uart7-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
++			bias-disable;
++		};
++	};
++
++	uart7_idle_pins_mx: uart7-idle-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
++			bias-disable;
++		};
++	};
++
++	uart7_sleep_pins_mx: uart7-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
++				 <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
++		};
++	};
++
++	uart8_pins_mx: uart8-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
++			bias-disable;
++		};
++	};
++
++	uart8_idle_pins_mx: uart8-idle-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
++			bias-disable;
++		};
++	};
++
++	uart8_sleep_pins_mx: uart8-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
++				 <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
++		};
++	};
++
++	m_can1_pins_mx: m-can1-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
++			slew-rate = <0>;
++			drive-push-pull;
++			bias-disable;
++		};
++		pins2 {
++			pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
++			bias-disable;
++		};
++	};
++
++	m_can1_sleep_pins_mx: m_can1-sleep@0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
++				 <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
++		};
++	};
++
++	pwm1_pins_mx: pwm1-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
++			bias-pull-down;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	pwm1_sleep_pins_mx: pwm1-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
++		};
++	};
++
++	pwm3_pins_mx: pwm3-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
++			bias-pull-down;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	pwm3_sleep_pins_mx: pwm3-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
++		};
++	};
++
++	pwm4_pins_mx: pwm4-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
++			bias-pull-down;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	pwm4_sleep_pins_mx: pwm4-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
++		};
++	};
++
++	pwm8_pins_mx: pwm8-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
++			bias-pull-down;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	pwm8_sleep_pins_mx: pwm8-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
++		};
++	};
++
++
++	pwm12_pins_mx: pwm12-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
++			bias-pull-down;
++			drive-push-pull;
++			slew-rate = <0>;
++		};
++	};
++
++	pwm12_sleep_pins_mx: pwm12-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
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
++			slew-rate = <2>;
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
++			slew-rate = <2>;
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
++	uart4_pins_mx: uart4_mx-0 {
++		u-boot,dm-pre-reloc;
++		pins1 {
++			u-boot,dm-pre-reloc;
++			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
++      /* pull-up on rx to avoid floating level */
++      bias-pull-up;
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
++};
++
++&pinctrl_z {
++	u-boot,dm-pre-reloc;
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
++	spi6_pins_mx: spi6-0 {
++		pins1 {
++			pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
++				 <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
++			bias-disable;
++			drive-push-pull;
++			slew-rate = <1>;
++		};
++
++		pins2 {
++			pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
++			bias-disable;
++		};
++	};
++
++	spi6_sleep_pins_mx: spi6-sleep-0 {
++		pins {
++			pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
++				 <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
++				 <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
++		};
++	};
++};
++
++&m4_rproc{
++	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++			<&vdev0vring1>, <&vdev0buffer>;
++	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
++	mbox-names = "vq0", "vq1", "shutdown";
++	interrupt-parent = <&exti>;
++	interrupts = <68 1>;
++	wakeup-source;
++	status = "okay";
++};
++
++&pwr_regulators {
++	vdd-supply = <&vdd>;
++	vdd_3v3_usbfs-supply = <&vdd_usb>;
++};
++
++
++&crc1{
++	status = "okay";
++};
++
++&cryp1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++};
++
++&dma1{
++	status = "okay";
++	sram = <&dma_pool>;
++};
++
++&dma2{
++	status = "okay";
++	sram = <&dma_pool>;
++};
++
++&dts{
++	status = "okay";
++};
++
++&gpu{
++	status = "okay";
++	contiguous-area = <&gpu_reserved>;
++};
++
++&hash1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++};
++
++&hsem{
++	status = "okay";
++};
++
++&i2c1 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c1_pins_mx>;
++	pinctrl-1 = <&i2c1_pins_sleep_mx>;
++	i2c-scl-rising-time-ns = <100>;
++	i2c-scl-falling-time-ns = <7>;
++	status = "okay";
++	/delete-property/dmas;
++	/delete-property/dma-names;
++};
++
++&i2c2 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c2_pins_mx>;
++	pinctrl-1 = <&i2c2_pins_sleep_mx>;
++	i2c-scl-rising-time-ns = <100>;
++	i2c-scl-falling-time-ns = <7>;
++	status = "okay";
++	/delete-property/dmas;
++	/delete-property/dma-names;
++};
++
++&i2c5 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c5_pins_mx>;
++	pinctrl-1 = <&i2c5_pins_sleep_mx>;
++	i2c-scl-rising-time-ns = <100>;
++	i2c-scl-falling-time-ns = <7>;
++	status = "okay";
++	/delete-property/dmas;
++	/delete-property/dma-names;
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c4_pins_z_mx>;
++	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
++	status = "okay";
++
++	i2c-scl-rising-time-ns = <185>;
++	i2c-scl-falling-time-ns = <20>;
++	clock-frequency = <400000>;
++	/delete-property/ dmas;
++	/delete-property/ dma-names;
++
++	pmic:stpmic@33{
++		compatible = "st,stpmic1";
++		reg = <0x33>;
++		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
++		interrupt-controller;
++		#interrupt-cells = <2>;
++		status = "okay";
++
++		regulators{
++			compatible = "st,stpmic1-regulators";
++			buck1-supply = <&vin>;
++			buck2-supply = <&vin>;
++			buck3-supply = <&vin>;
++			buck4-supply = <&vin>;
++			ldo1-supply = <&v3v3>;
++			ldo2-supply = <&vin>;
++			ldo3-supply = <&vdd_ddr>;
++			ldo4-supply = <&vin>;
++			ldo5-supply = <&vin>;
++			ldo6-supply = <&v3v3>;
++			vref_ddr-supply = <&vin>;
++			boost-supply = <&vin>;
++			pwr_sw1-supply = <&bst_out>;
++			pwr_sw2-supply = <&bst_out>;
++
++			vddcore:buck1{
++				regulator-name = "vddcore";
++				regulator-min-microvolt = <1200000>;
++				regulator-max-microvolt = <1350000>;
++				regulator-always-on;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			vdd_ddr:buck2{
++				regulator-name = "vdd_ddr";
++				regulator-min-microvolt = <1350000>;
++				regulator-max-microvolt = <1350000>;
++				regulator-always-on;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			vdd:buck3{
++				regulator-name = "vdd";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				st,mask-reset;
++				regulator-initial-mode = <0>;
++				regulator-over-current-protection;
++			};
++
++			v3v3:buck4{
++				regulator-name = "v3v3";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				regulator-over-current-protection;
++				regulator-initial-mode = <0>;
++			};
++
++			v1v8_audio:ldo1{
++				regulator-name = "v1v8_audio";
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <1800000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO1 0>;
++			};
++
++			v3v3_hdmi:ldo2{
++				regulator-name = "v3v3_hdmi";
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO2 0>;
++			};
++
++			vtt_ddr:ldo3{
++				regulator-name = "vtt_ddr";
++				regulator-min-microvolt = <500000>;
++				regulator-max-microvolt = <750000>;
++				regulator-always-on;
++				regulator-over-current-protection;
++			};
++
++			vdd_usb:ldo4{
++				regulator-name = "vdd_usb";
++				interrupts = <IT_CURLIM_LDO4 0>;
++			};
++
++			vdda:ldo5{
++				regulator-name = "vdda";
++				regulator-min-microvolt = <2900000>;
++				regulator-max-microvolt = <2900000>;
++				interrupts = <IT_CURLIM_LDO5 0>;
++				regulator-boot-on;
++			};
++
++			v1v2_hdmi:ldo6{
++				regulator-name = "v1v2_hdmi";
++				regulator-min-microvolt = <1200000>;
++				regulator-max-microvolt = <1200000>;
++				regulator-always-on;
++				interrupts = <IT_CURLIM_LDO6 0>;
++			};
++
++			vref_ddr:vref_ddr{
++				regulator-name = "vref_ddr";
++				regulator-always-on;
++				regulator-over-current-protection;
++			};
++
++			bst_out:boost{
++				regulator-name = "bst_out";
++				interrupts = <IT_OCP_BOOST 0>;
++			};
++
++			vbus_otg:pwr_sw1{
++				regulator-name = "vbus_otg";
++				interrupts = <IT_OCP_OTG 0>;
++			};
++
++			vbus_sw:pwr_sw2{
++				regulator-name = "vbus_sw";
++				interrupts = <IT_OCP_SWOUT 0>;
++				regulator-active-discharge = <1>;
++			};
++		};
++
++		onkey{
++			compatible = "st,stpmic1-onkey";
++			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
++			interrupt-names = "onkey-falling", "onkey-rising";
++			power-off-time-sec = <10>;
++			status = "okay";
++		};
++
++		watchdog {
++			compatible = "st,stpmic1-wdt";
++			status = "disabled";
++		};
++	};
++	eeprom@50 {
++		compatible = "atmel,24c02";
++		reg = <0x50>;
++		pagesize = <16>;
++	};
++};
++
++&ipcc{
++	status = "okay";
++};
++
++&iwdg2{
++	status = "okay";
++	timeout-sec = <32>;
++};
++
++&mdma1{
++	status = "okay";
++};
++
++&rcc{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++};
++
++&rng1{
++	status = "okay";
++};
++
++&rtc{
++	status = "okay";
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
++	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	disable-wp;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&v3v3>;
++};
++
++&tamp{
++	status = "okay";
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&uart4_pins_mx>;
++	pinctrl-1 = <&uart4_sleep_pins_mx>;
++	status = "okay";
++
++	/delete-property/ dmas;
++	/delete-property/ dma-names;
++};
++
++&usbh_ehci{
++	status = "okay";
++	phys = <&usbphyc_port0>;
++};
++
++&usbh_ohci{
++	status = "okay";
++};
++
++&usbotg_hs{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++	phys = <&usbphyc_port1 0>;
++	phy-names = "usb2-phy";
++};
++
++&usbphyc{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++};
++
++&usbphyc_port0{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++	phy-supply = <&vdd_usb>;
++	st,phy-tuning = <&usb_phy_tuning>;
++};
++
++&usbphyc_port1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++	phy-supply = <&vdd_usb>;
++	st,phy-tuning = <&usb_phy_tuning>;
++};
++
++&adc {
++	vdd-supply = <&vdd>;
++	vdda-supply = <&vdda>;
++	vref-supply = <&vdda>;
++	status = "okay";
++	adc1: adc@0 {
++		st,min-sample-time-nsecs = <5000>;
++		st,adc-channels = <0 1>;
++		status = "okay";
++	};
++
++	adc2: adc@100 {
++		status = "okay";
++	};
++
++	adc_temp: temp {
++		status = "okay";
++	};
++};
++
++&usbh_ohci{
++	phys = <&usbphyc_port0>;
++};
++
++&cpu0{
++	cpu-supply = <&vddcore>;
++};
++
++&cpu1{
++	cpu-supply = <&vddcore>;
++};
++
++&sram{
++	dma_pool:dma_pool@0{
++		reg = <0x50000 0x10000>;
++		pool;
++	};
++};
++
++&spi2 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi2_pins_mx>;
++	pinctrl-1 = <&spi2_sleep_pins_mx>;
++	cs-gpios = <&gpioi 0 0>;
++	status = "okay";
++
++	spidev2: spidev2@0{
++		compatible = "rohm,dh2228fv";
++		spi-max-frequency = <30000000>;
++		reg = <0>;
++	};
++};
++
++&spi4 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi4_pins_mx>;
++	pinctrl-1 = <&spi4_sleep_pins_mx>;
++	cs-gpios = <&gpioe 11 0>;
++	status = "okay";
++
++	spidev4: spidev4@0{
++		compatible = "rohm,dh2228fv";
++		spi-max-frequency = <30000000>;
++		reg = <0>;
++	};
++};
++
++&spi6 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi6_pins_mx>;
++	pinctrl-1 = <&spi6_sleep_pins_mx>;
++	cs-gpios = <&gpioz 3 0>;
++	status = "okay";
++
++	spidev6: spidev6@0{
++		compatible = "rohm,dh2228fv";
++		spi-max-frequency = <30000000>;
++		reg = <0>;
++	};
++};
++
++&usart2 {
++	pinctrl-names = "default", "sleep", "idle";
++	pinctrl-0 = <&usart2_pins_mx>;
++	pinctrl-1 = <&usart2_sleep_pins_mx>;
++	pinctrl-2 = <&usart2_idle_pins_mx>;
++	status = "okay";
++};
++
++&uart5 {
++	pinctrl-names = "default", "sleep", "idle";
++	pinctrl-0 = <&uart5_pins_mx>;
++	pinctrl-1 = <&uart5_sleep_pins_mx>;
++	pinctrl-2 = <&uart5_idle_pins_mx>;
++	status = "okay";
++};
++
++&uart7 {
++	pinctrl-names = "default", "sleep", "idle";
++	pinctrl-0 = <&uart7_pins_mx>;
++	pinctrl-1 = <&uart7_sleep_pins_mx>;
++	pinctrl-2 = <&uart7_idle_pins_mx>;
++	status = "okay";
++};
++
++&uart8 {
++	pinctrl-names = "default", "sleep", "idle";
++	pinctrl-0 = <&uart8_pins_mx>;
++	pinctrl-1 = <&uart8_sleep_pins_mx>;
++	pinctrl-2 = <&uart8_idle_pins_mx>;
++	status = "okay";
++};
++
++&m_can1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&m_can1_pins_mx>;
++	status = "okay";
++	can-transceiver {
++		max-bitrate = <5000000>;
++	};
++};
++
++&timers1 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm1: pwm {
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&pwm1_pins_mx>;
++		pinctrl-1 = <&pwm1_sleep_pins_mx>;
++		status = "okay";
++	};
++};
++
++&timers3 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm3: pwm {
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&pwm3_pins_mx>;
++		pinctrl-1 = <&pwm3_sleep_pins_mx>;
++		status = "okay";
++	};
++};
++
++&timers4 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm4: pwm {
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&pwm4_pins_mx>;
++		pinctrl-1 = <&pwm4_sleep_pins_mx>;
++		status = "okay";
++	};
++};
++
++&timers8 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm8: pwm {
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&pwm8_pins_mx>;
++		pinctrl-1 = <&pwm8_sleep_pins_mx>;
++		status = "okay";
++	};
++};
++
++&timers12 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm12: pwm {
++		pinctrl-names = "default", "sleep";
++		pinctrl-0 = <&pwm12_pins_mx>;
++		pinctrl-1 = <&pwm12_sleep_pins_mx>;
++		status = "okay";
++	};
++};
+-- 
+2.25.1
+
diff --git a/board/octavo/osd32mp1-brk/patches/uboot/0001-osd32mp1-BRK-board-added.patch b/board/octavo/osd32mp1-brk/patches/uboot/0001-osd32mp1-BRK-board-added.patch
deleted file mode 100644
index aaf89b761a..0000000000
--- a/board/octavo/osd32mp1-brk/patches/uboot/0001-osd32mp1-BRK-board-added.patch
+++ /dev/null
@@ -1,2349 +0,0 @@
-From 64aed58135378718dc3afd5072278a3648d997ec Mon Sep 17 00:00:00 2001
-From: Martin Lesniak <martin.lesniak@st.com>
-Date: Thu, 27 Aug 2020 14:44:46 -0500
-Subject: [PATCH] osd32mp1 BRK board added
-
-New board definition for Octavo's OSD32MP1-BRK
-Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>
-[Kory: taken from https://github.com/octavosystems/BRK_Developer_Package_patches/tree/master/u-boot-v2020.01-stm32mp]
-Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
----
- arch/arm/dts/Makefile                         |    3 +-
- .../dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi    |  119 ++
- .../dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi  |  203 +++
- arch/arm/dts/stm32mp157c-osd32mp1-brk.dts     | 1167 +++++++++++++++++
- arch/arm/dts/stm32mp15xx-dkx.dtsi             |    3 +-
- arch/arm/mach-stm32mp/Kconfig                 |   10 +-
- board/octavo/osd32mp1-brk/Kconfig             |   13 +
- board/octavo/osd32mp1-brk/MAINTAINERS         |    7 +
- board/octavo/osd32mp1-brk/Makefile            |    9 +
- board/octavo/osd32mp1-brk/board.c             |  547 ++++++++
- configs/osd32mp1_brk_trusted_defconfig        |  148 +++
- 11 files changed, 2226 insertions(+), 3 deletions(-)
- create mode 100644 arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
- create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
- create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
- create mode 100644 board/octavo/osd32mp1-brk/Kconfig
- create mode 100644 board/octavo/osd32mp1-brk/MAINTAINERS
- create mode 100644 board/octavo/osd32mp1-brk/Makefile
- create mode 100644 board/octavo/osd32mp1-brk/board.c
- create mode 100644 configs/osd32mp1_brk_trusted_defconfig
-
-diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index c3fd89b8be..7494fca9bb 100644
---- a/arch/arm/dts/Makefile
-+++ b/arch/arm/dts/Makefile
-@@ -837,7 +837,8 @@ dtb-$(CONFIG_STM32MP15x) += \
- 	stm32mp157f-dk2.dtb \
- 	stm32mp157f-ed1.dtb \
- 	stm32mp157f-ev1.dtb \
--	stm32mp15xx-dhcom-pdk2.dtb
-+	stm32mp15xx-dhcom-pdk2.dtb \
-+	stm32mp157c-osd32mp1-brk.dtb
- 
- dtb-$(CONFIG_SOC_K3_AM6) += k3-am654-base-board.dtb k3-am654-r5-base-board.dtb
- dtb-$(CONFIG_SOC_K3_J721E) += k3-j721e-common-proc-board.dtb \
-diff --git a/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
-new file mode 100644
-index 0000000000..362f3281b8
---- /dev/null
-+++ b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
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
-+ * Save Date: 2020.08.20, save Time: 10:57:25
-+ */
-+
-+#define DDR_MEM_NAME	"DDR3-DDR3L 16bits 533000Khz"
-+#define DDR_MEM_SPEED	533000
-+#define DDR_MEM_SIZE	0x20000000
-+
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
-diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
-new file mode 100644
-index 0000000000..38a0458838
---- /dev/null
-+++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
-@@ -0,0 +1,203 @@
-+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause*/
-+/*
-+ * Copyright (C) 2020, Octavo Systems LLC - All Rights Reserved
-+ */
-+
-+/* For more information on Device Tree configuration, please refer to
-+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
-+ */
-+
-+#include <dt-bindings/clock/stm32mp1-clksrc.h>
-+#include "stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi"
-+
-+#include "stm32mp15-u-boot.dtsi"
-+#include "stm32mp15-ddr.dtsi"
-+
-+
-+/ {
-+
-+	aliases{
-+		i2c0 = &i2c4;
-+		mmc0 = &sdmmc1;
-+		usb0 = &usbotg_hs;
-+	};
-+
-+	config{
-+		u-boot,boot-led = "LED2_GRN";
-+		u-boot,error-led = "LED2_RED";
-+		u-boot,mmc-env-partition = "ssbl";
-+		st,stm32prog-gpios = <&gpiod 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-+	};
-+
-+	clocks {
-+		u-boot,dm-pre-reloc;
-+
-+#ifndef CONFIG_STM32MP1_TRUSTED
-+		clk_lsi: clk-lsi {
-+			u-boot,dm-pre-reloc;
-+		};
-+		clk_hsi: clk-hsi {
-+			u-boot,dm-pre-reloc;
-+		};
-+		clk_csi: clk-csi {
-+			u-boot,dm-pre-reloc;
-+			status = "disabled";
-+		};
-+		clk_lse: clk-lse {
-+			u-boot,dm-pre-reloc;
-+			st,drive = < LSEDRV_MEDIUM_HIGH >;
-+		};
-+		clk_hse: clk-hse {
-+			u-boot,dm-pre-reloc;
-+			st,digbypass;
-+		};
-+#endif	/*CONFIG_STM32MP1_TRUSTED*/
-+	};
-+
-+}; /*root*/
-+
-+#ifndef CONFIG_STM32MP1_TRUSTED
-+
-+&rcc {
-+	u-boot,dm-pre-reloc;
-+	st,clksrc = <
-+		CLK_MPU_PLL1P
-+		CLK_AXI_PLL2P
-+		CLK_MCU_PLL3P
-+		CLK_PLL12_HSE
-+		CLK_PLL3_HSE
-+		CLK_PLL4_HSE
-+		CLK_RTC_LSE
-+		CLK_MCO1_DISABLED
-+		CLK_MCO2_DISABLED
-+	>;
-+	st,clkdiv = <
-+		1 		/*MPU*/
-+		0 		/*AXI*/
-+		0 		/*MCU*/
-+		1 		/*APB1*/
-+		1 		/*APB2*/
-+		1 		/*APB3*/
-+		1 		/*APB4*/
-+		2 		/*APB5*/
-+		23 		/*RTC*/
-+		0 		/*MCO1*/
-+		0 		/*MCO2*/
-+	>;
-+	st,pkcs = <
-+    CLK_CKPER_HSE
-+    CLK_FMC_ACLK
-+    CLK_QSPI_ACLK
-+    CLK_ETH_DISABLED
-+    CLK_SDMMC12_PLL4P
-+    CLK_DSI_DSIPLL
-+    CLK_STGEN_HSE
-+    CLK_USBPHY_HSE
-+    CLK_SPI2S1_PLL3Q
-+    CLK_SPI2S23_PLL3Q
-+    CLK_SPI45_HSI
-+    CLK_SPI6_HSI
-+    CLK_I2C46_HSI
-+    CLK_SDMMC3_PLL4P
-+    CLK_USBO_USBPHY
-+    CLK_ADC_CKPER
-+    CLK_CEC_LSE
-+    CLK_I2C12_HSI
-+    CLK_I2C35_HSI
-+    CLK_UART1_HSI
-+    CLK_UART24_HSI
-+    CLK_UART35_HSI
-+    CLK_UART6_HSI
-+    CLK_UART78_HSI
-+    CLK_SPDIF_PLL4P
-+    CLK_FDCAN_PLL4R
-+    CLK_SAI1_PLL3Q
-+    CLK_SAI2_PLL3Q
-+    CLK_SAI3_PLL3Q
-+    CLK_SAI4_PLL3Q
-+    CLK_RNG1_LSI
-+    CLK_RNG2_LSI
-+    CLK_LPTIM1_PCLK1
-+    CLK_LPTIM23_PCLK3
-+    CLK_LPTIM45_LSE
-+	>;
-+	pll2:st,pll@1 {
-+		compatible = "st,stm32mp1-pll";
-+		reg = <1>;
-+		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
-+		frac = < 0x1400 >;
-+		u-boot,dm-pre-reloc;
-+	};
-+	pll3:st,pll@2 {
-+		compatible = "st,stm32mp1-pll";
-+		reg = <2>;
-+		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
-+		frac = < 0x1a04 >;
-+		u-boot,dm-pre-reloc;
-+	};
-+	pll4:st,pll@3 {
-+		compatible = "st,stm32mp1-pll";
-+		reg = <3>;
-+		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
-+		u-boot,dm-pre-reloc;
-+	};
-+};
-+
-+&i2c4{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&sdmmc1{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+#endif	/*CONFIG_STM32MP1_TRUSTED*/
-+
-+&cryp1{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&hash1{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&uart4{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&usbotg_hs{
-+	u-boot,dm-pre-reloc;
-+	u-boot,force-b-session-valid;
-+	hnp-srp-disable;
-+	dr_mode = "peripheral";
-+};
-+
-+&usbphyc{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&usbphyc_port0{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&usbphyc_port1{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&adc{
-+	status = "okay";
-+};
-+
-+#ifndef CONFIG_STM32MP1_TRUSTED
-+&i2s2{
-+	clocks = <&rcc SPI2>, <&rcc SPI2_K>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-+};
-+
-+&pmic{
-+	u-boot,dm-pre-reloc;
-+};
-+
-+&sai2{
-+	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
-+};
-+#endif /*CONFIG_STM32MP1_TRUSTED*/
-diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
-new file mode 100644
-index 0000000000..d763b48945
---- /dev/null
-+++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
-@@ -0,0 +1,1167 @@
-+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
-+/*
-+ * Copyright (C) Octavo Systems LLC 2020 - All Rights Reserved
-+ */
-+
-+/* For more information on Device Tree configuration, please refer to
-+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
-+ */
-+
-+/dts-v1/;
-+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
-+
-+#include "stm32mp157.dtsi"
-+#include "stm32mp15xc.dtsi"
-+#include "stm32mp15xxac-pinctrl.dtsi"
-+#include "stm32mp157-m4-srm.dtsi"
-+#include <dt-bindings/mfd/st,stpmic1.h>
-+#include <dt-bindings/rtc/rtc-stm32.h>
-+
-+/ {
-+	model = "Octavo OSD32MP1 BRK board";
-+	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
-+
-+	memory@c0000000 {
-+		device_type = "memory";
-+		reg = <0xc0000000 0x20000000>;
-+	};
-+
-+	reserved-memory {
-+		#address-cells = <1>;
-+		#size-cells = <1>;
-+		ranges;
-+
-+		mcuram2:mcuram2@10000000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x10000000 0x40000>;
-+			no-map;
-+		};
-+
-+		vdev0vring0:vdev0vring0@10040000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x10040000 0x1000>;
-+			no-map;
-+		};
-+
-+		vdev0vring1:vdev0vring1@10041000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x10041000 0x1000>;
-+			no-map;
-+		};
-+
-+		vdev0buffer:vdev0buffer@10042000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x10042000 0x4000>;
-+			no-map;
-+		};
-+
-+		mcuram:mcuram@30000000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x30000000 0x40000>;
-+			no-map;
-+		};
-+
-+		retram:retram@38000000{
-+			compatible = "shared-dma-pool";
-+			reg = <0x38000000 0x10000>;
-+			no-map;
-+		};
-+
-+		gpu_reserved:gpu@da000000{
-+			reg = <0xda000000 0x4000000>;
-+			no-map;
-+		};
-+
-+		optee_memory:optee@0xde000000{
-+			reg = <0xde000000 0x02000000>;
-+			no-map;
-+			status = "okay";
-+		};
-+	};
-+
-+	led{
-+		compatible = "gpio-leds";
-+
-+		red1{
-+			label = "LED1_RED";
-+			gpios = <&gpioz 6 GPIO_ACTIVE_LOW>;
-+			linux,default-trigger = "heartbeat";
-+			status = "okay";
-+			default-state = "off";
-+		};
-+
-+		green1{
-+			label = "LED1_GRN";
-+			gpios = <&gpioz 7 GPIO_ACTIVE_LOW>;
-+			status = "okay";
-+			default-state = "on";
-+		};
-+
-+		red2{
-+			label = "LED2_RED";
-+			gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
-+			status = "okay";
-+			default-state = "off";
-+		};
-+
-+		green2{
-+			label = "LED2_GRN";
-+			gpios = <&gpioi 9 GPIO_ACTIVE_LOW>;
-+			default-state = "off";
-+		};
-+	};
-+
-+	usb_phy_tuning:usb-phy-tuning{
-+		st,hs-dc-level = <2>;
-+		st,fs-rftime-tuning;
-+		st,hs-rftime-reduction;
-+		st,hs-current-trim = <15>;
-+		st,hs-impedance-trim = <1>;
-+		st,squelch-level = <3>;
-+		st,hs-rx-offset = <2>;
-+		st,no-lsfs-sc;
-+	};
-+
-+	vin:vin{
-+		compatible = "regulator-fixed";
-+		regulator-name = "vin";
-+		regulator-min-microvolt = <5000000>;
-+		regulator-max-microvolt = <5000000>;
-+		regulator-always-on;
-+	};
-+
-+	aliases{
-+		serial0 = &uart4;
-+    serial2 = &usart2;
-+    serial5 = &uart5;
-+    serial7 = &uart7;
-+    serial1 = &uart8;
-+	};
-+
-+	chosen{
-+		stdout-path = "serial0:115200n8";
-+	};
-+
-+	clocks {
-+
-+#ifndef CONFIG_STM32MP1_TRUSTED
-+		clk_lsi: clk-lsi {
-+			clock-frequency = <32000>;
-+		};
-+		clk_hsi: clk-hsi {
-+			clock-frequency = <64000000>;
-+		};
-+		clk_csi: clk-csi {
-+			clock-frequency = <4000000>;
-+		};
-+		clk_lse: clk-lse {
-+			clock-frequency = <32768>;
-+		};
-+		clk_hse: clk-hse {
-+			clock-frequency = <24000000>;
-+		};
-+#endif	/*CONFIG_STM32MP1_TRUSTED*/
-+	};
-+
-+}; /*root*/
-+
-+&pinctrl {
-+	u-boot,dm-pre-reloc;
-+
-+  i2c1_pins_mx: i2c1-0 {
-+		pins {
-+			pinmux = <STM32_PINMUX('H', 11, AF5)>, /* I2C1_SCL */
-+				 <STM32_PINMUX('H', 12, AF5)>; /* I2C1_SDA */
-+			bias-disable;
-+			drive-open-drain;
-+			slew-rate = <0>;
-+		};
-+	};
-+
-+	i2c1_pins_sleep_mx: i2c1-1 {
-+		pins {
-+			pinmux = <STM32_PINMUX('H', 11, ANALOG)>, /* I2C1_SCL */
-+				 <STM32_PINMUX('H', 12, ANALOG)>; /* I2C1_SDA */
-+		};
-+	};
-+
-+  i2c2_pins_mx: i2c2-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
-+         <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
-+      bias-disable;
-+      drive-open-drain;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  i2c2_pins_sleep_mx: i2c2-1 {
-+    pins {
-+      pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
-+         <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
-+    };
-+  };
-+
-+  i2c5_pins_mx: i2c5-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
-+         <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
-+      bias-disable;
-+      drive-open-drain;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  i2c5_pins_sleep_mx: i2c5-1 {
-+    pins {
-+      pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
-+         <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
-+    };
-+  };
-+
-+  spi2_pins_mx: spi2-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
-+         <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
-+      bias-disable;
-+      drive-push-pull;
-+      slew-rate = <1>;
-+    };
-+
-+    pins2 {
-+      pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
-+      bias-disable;
-+    };
-+  };
-+
-+  spi2_sleep_pins_mx: spi2-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
-+         <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
-+         <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
-+    };
-+  };
-+
-+  spi4_pins_mx: spi4-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
-+         <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
-+      bias-disable;
-+      drive-push-pull;
-+      slew-rate = <1>;
-+    };
-+
-+    pins2 {
-+      pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
-+      bias-disable;
-+    };
-+  };
-+
-+  spi4_sleep_pins_mx: spi4-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
-+         <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
-+         <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
-+    };
-+  };
-+
-+  usart2_pins_mx: usart2-0 {
-+      pins1 {
-+        pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
-+        bias-disable;
-+        drive-push-pull;
-+        slew-rate = <0>;
-+      };
-+      pins2 {
-+        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
-+        bias-disable;
-+      };
-+    };
-+
-+    usart2_idle_pins_mx: usart2-idle-0 {
-+      pins1 {
-+        pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
-+      };
-+      pins2 {
-+        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
-+        bias-disable;
-+      };
-+    };
-+
-+    usart2_sleep_pins_mx: usart2-sleep-0 {
-+      pins {
-+        pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
-+           <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
-+      };
-+    };
-+
-+    uart5_pins_mx: uart5-0 {
-+      pins1 {
-+        pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
-+        bias-disable;
-+        drive-push-pull;
-+        slew-rate = <0>;
-+      };
-+      pins2 {
-+        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
-+        bias-disable;
-+      };
-+    };
-+
-+    uart5_idle_pins_mx: uart5-idle-0 {
-+      pins1 {
-+        pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
-+      };
-+      pins2 {
-+        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
-+        bias-disable;
-+      };
-+    };
-+
-+    uart5_sleep_pins_mx: uart5-sleep-0 {
-+      pins {
-+        pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
-+           <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
-+      };
-+    };
-+
-+    uart7_pins_mx: uart7-0 {
-+      pins1 {
-+        pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
-+        bias-disable;
-+        drive-push-pull;
-+        slew-rate = <0>;
-+      };
-+      pins2 {
-+        pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
-+        bias-disable;
-+      };
-+    };
-+
-+  uart7_idle_pins_mx: uart7-idle-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
-+    };
-+    pins2 {
-+      pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
-+      bias-disable;
-+    };
-+  };
-+
-+  uart7_sleep_pins_mx: uart7-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
-+        <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
-+    };
-+  };
-+
-+  uart8_pins_mx: uart8-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
-+      bias-disable;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+    pins2 {
-+      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
-+      bias-disable;
-+    };
-+  };
-+
-+  uart8_idle_pins_mx: uart8-idle-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
-+    };
-+    pins2 {
-+      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
-+      bias-disable;
-+    };
-+  };
-+
-+  uart8_sleep_pins_mx: uart8-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
-+        <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
-+    };
-+  };
-+
-+  m_can1_pins_mx: m-can1-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
-+      slew-rate = <0>;
-+      drive-push-pull;
-+      bias-disable;
-+    };
-+    pins2 {
-+      pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
-+      bias-disable;
-+    };
-+  };
-+
-+  m_can1_sleep_pins_mx: m_can1-sleep@0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
-+        <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
-+    };
-+  };
-+
-+  pwm1_pins_mx: pwm1-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
-+      bias-pull-down;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  pwm1_sleep_pins_mx: pwm1-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
-+    };
-+  };
-+
-+  pwm3_pins_mx: pwm3-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
-+      bias-pull-down;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  pwm3_sleep_pins_mx: pwm3-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
-+    };
-+  };
-+
-+  pwm4_pins_mx: pwm4-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
-+      bias-pull-down;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  pwm4_sleep_pins_mx: pwm4-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
-+    };
-+  };
-+
-+  pwm8_pins_mx: pwm8-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
-+      bias-pull-down;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  pwm8_sleep_pins_mx: pwm8-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
-+    };
-+  };
-+
-+
-+  pwm12_pins_mx: pwm12-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
-+      bias-pull-down;
-+      drive-push-pull;
-+      slew-rate = <0>;
-+    };
-+  };
-+
-+  pwm12_sleep_pins_mx: pwm12-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
-+    };
-+  };
-+
-+	sdmmc1_pins_mx: sdmmc1_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins1 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-+					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-+					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-+					 <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
-+					 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-+			bias-disable;
-+			drive-push-pull;
-+			slew-rate = <1>;
-+		};
-+		pins2 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-+			bias-disable;
-+			drive-push-pull;
-+			slew-rate = <2>;
-+		};
-+	};
-+
-+	sdmmc1_opendrain_pins_mx: sdmmc1_opendrain_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins1 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
-+					 <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
-+					 <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
-+					 <STM32_PINMUX('C', 11, AF12)>; /* SDMMC1_D3 */
-+			bias-disable;
-+			drive-push-pull;
-+			slew-rate = <1>;
-+		};
-+		pins2 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
-+			bias-disable;
-+			drive-push-pull;
-+			slew-rate = <2>;
-+		};
-+		pins3 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
-+			bias-disable;
-+			drive-open-drain;
-+			slew-rate = <1>;
-+		};
-+	};
-+
-+	sdmmc1_sleep_pins_mx: sdmmc1_sleep_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
-+					 <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
-+					 <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
-+					 <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
-+					 <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
-+					 <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
-+		};
-+	};
-+
-+	uart4_pins_mx: uart4_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins1 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
-+      /* pull-up on rx to avoid floating level */
-+      bias-pull-up;
-+		};
-+		pins2 {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
-+			bias-disable;
-+			drive-push-pull;
-+			slew-rate = <0>;
-+		};
-+	};
-+
-+	uart4_sleep_pins_mx: uart4_sleep_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('B', 2, ANALOG)>, /* UART4_RX */
-+					 <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
-+		};
-+	};
-+};
-+
-+&pinctrl_z {
-+	u-boot,dm-pre-reloc;
-+
-+	i2c4_pins_z_mx: i2c4_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-+					 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
-+			bias-disable;
-+			drive-open-drain;
-+			slew-rate = <0>;
-+		};
-+	};
-+
-+	i2c4_sleep_pins_z_mx: i2c4_sleep_mx-0 {
-+		u-boot,dm-pre-reloc;
-+		pins {
-+			u-boot,dm-pre-reloc;
-+			pinmux = <STM32_PINMUX('Z', 4, ANALOG)>, /* I2C4_SCL */
-+					 <STM32_PINMUX('Z', 5, ANALOG)>; /* I2C4_SDA */
-+		};
-+	};
-+
-+  spi6_pins_mx: spi6-0 {
-+    pins1 {
-+      pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
-+         <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
-+      bias-disable;
-+      drive-push-pull;
-+      slew-rate = <1>;
-+    };
-+
-+    pins2 {
-+      pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
-+      bias-disable;
-+    };
-+  };
-+
-+  spi6_sleep_pins_mx: spi6-sleep-0 {
-+    pins {
-+      pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
-+         <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
-+         <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
-+    };
-+  };
-+};
-+
-+&m4_rproc{
-+	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
-+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
-+	mbox-names = "vq0", "vq1", "shutdown";
-+	status = "okay";
-+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
-+			<&vdev0vring1>, <&vdev0buffer>;
-+	interrupt-parent = <&exti>;
-+	interrupts = <68 1>;
-+	wakeup-source;
-+};
-+
-+&pwr_regulators {
-+	vdd-supply = <&vdd>;
-+	vdd_3v3_usbfs-supply = <&vdd_usb>;
-+};
-+
-+&bsec{
-+	status = "okay";
-+};
-+
-+&crc1{
-+	status = "okay";
-+};
-+
-+&cryp1{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+};
-+
-+&dma1{
-+	status = "okay";
-+	sram = <&dma_pool>;
-+};
-+
-+&dma2{
-+	status = "okay";
-+	sram = <&dma_pool>;
-+};
-+
-+&dmamux1{
-+
-+	dma-masters = <&dma1 &dma2>;
-+	dma-channels = <16>;
-+
-+	status = "okay";
-+};
-+
-+&dts{
-+	status = "okay";
-+};
-+
-+&gpu{
-+	status = "okay";
-+	contiguous-area = <&gpu_reserved>;
-+};
-+
-+&hash1{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+};
-+
-+&hsem{
-+	status = "okay";
-+};
-+
-+&i2c1 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&i2c1_pins_mx>;
-+	pinctrl-1 = <&i2c1_pins_sleep_mx>;
-+	i2c-scl-rising-time-ns = <100>;
-+	i2c-scl-falling-time-ns = <7>;
-+	status = "okay";
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+};
-+
-+&i2c2 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&i2c2_pins_mx>;
-+	pinctrl-1 = <&i2c2_pins_sleep_mx>;
-+	i2c-scl-rising-time-ns = <100>;
-+	i2c-scl-falling-time-ns = <7>;
-+	status = "okay";
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+};
-+
-+&i2c5 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&i2c5_pins_mx>;
-+	pinctrl-1 = <&i2c5_pins_sleep_mx>;
-+	i2c-scl-rising-time-ns = <100>;
-+	i2c-scl-falling-time-ns = <7>;
-+	status = "okay";
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+};
-+
-+&i2c4{
-+	u-boot,dm-pre-reloc;
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&i2c4_pins_z_mx>;
-+	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
-+	status = "okay";
-+
-+	i2c-scl-rising-time-ns = <185>;
-+	i2c-scl-falling-time-ns = <20>;
-+	clock-frequency = <400000>;
-+	/delete-property/ dmas;
-+	/delete-property/ dma-names;
-+
-+	pmic:stpmic@33{
-+		compatible = "st,stpmic1";
-+		reg = <0x33>;
-+		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
-+		interrupt-controller;
-+		#interrupt-cells = <2>;
-+		status = "okay";
-+
-+		regulators{
-+			compatible = "st,stpmic1-regulators";
-+			buck1-supply = <&vin>;
-+			buck2-supply = <&vin>;
-+			buck3-supply = <&vin>;
-+			buck4-supply = <&vin>;
-+			ldo1-supply = <&v3v3>;
-+			ldo2-supply = <&vin>;
-+			ldo3-supply = <&vdd_ddr>;
-+			ldo4-supply = <&vin>;
-+			ldo5-supply = <&vin>;
-+			ldo6-supply = <&v3v3>;
-+			vref_ddr-supply = <&vin>;
-+			boost-supply = <&vin>;
-+			pwr_sw1-supply = <&bst_out>;
-+			pwr_sw2-supply = <&bst_out>;
-+
-+			vddcore:buck1{
-+				regulator-name = "vddcore";
-+				regulator-min-microvolt = <1200000>;
-+				regulator-max-microvolt = <1350000>;
-+				regulator-always-on;
-+				regulator-initial-mode = <0>;
-+				regulator-over-current-protection;
-+			};
-+
-+			vdd_ddr:buck2{
-+				regulator-name = "vdd_ddr";
-+				regulator-min-microvolt = <1350000>;
-+				regulator-max-microvolt = <1350000>;
-+				regulator-always-on;
-+				regulator-initial-mode = <0>;
-+				regulator-over-current-protection;
-+			};
-+
-+			vdd:buck3{
-+				regulator-name = "vdd";
-+				regulator-min-microvolt = <3300000>;
-+				regulator-max-microvolt = <3300000>;
-+				regulator-always-on;
-+				st,mask-reset;
-+				regulator-initial-mode = <0>;
-+				regulator-over-current-protection;
-+			};
-+
-+			v3v3:buck4{
-+				regulator-name = "v3v3";
-+				regulator-min-microvolt = <3300000>;
-+				regulator-max-microvolt = <3300000>;
-+				regulator-always-on;
-+				regulator-over-current-protection;
-+				regulator-initial-mode = <0>;
-+			};
-+
-+			v1v8_audio:ldo1{
-+				regulator-name = "v1v8_audio";
-+				regulator-min-microvolt = <1800000>;
-+				regulator-max-microvolt = <1800000>;
-+				regulator-always-on;
-+				interrupts = <IT_CURLIM_LDO1 0>;
-+			};
-+
-+			v3v3_hdmi:ldo2{
-+				regulator-name = "v3v3_hdmi";
-+				regulator-min-microvolt = <3300000>;
-+				regulator-max-microvolt = <3300000>;
-+				regulator-always-on;
-+				interrupts = <IT_CURLIM_LDO2 0>;
-+			};
-+
-+			vtt_ddr:ldo3{
-+				regulator-name = "vtt_ddr";
-+				regulator-min-microvolt = <500000>;
-+				regulator-max-microvolt = <750000>;
-+				regulator-always-on;
-+				regulator-over-current-protection;
-+			};
-+
-+			vdd_usb:ldo4{
-+				regulator-name = "vdd_usb";
-+				regulator-min-microvolt = <3300000>;
-+				regulator-max-microvolt = <3300000>;
-+				interrupts = <IT_CURLIM_LDO4 0>;
-+				regulator-always-on;
-+			};
-+
-+			vdda:ldo5{
-+				regulator-name = "vdda";
-+				regulator-min-microvolt = <2900000>;
-+				regulator-max-microvolt = <2900000>;
-+				interrupts = <IT_CURLIM_LDO5 0>;
-+				regulator-boot-on;
-+			};
-+
-+			v1v2_hdmi:ldo6{
-+				regulator-name = "v1v2_hdmi";
-+				regulator-min-microvolt = <1200000>;
-+				regulator-max-microvolt = <1200000>;
-+				regulator-always-on;
-+				interrupts = <IT_CURLIM_LDO6 0>;
-+			};
-+
-+			vref_ddr:vref_ddr{
-+				regulator-name = "vref_ddr";
-+				regulator-always-on;
-+				regulator-over-current-protection;
-+			};
-+
-+			bst_out:boost{
-+				regulator-name = "bst_out";
-+				interrupts = <IT_OCP_BOOST 0>;
-+			};
-+
-+			vbus_otg:pwr_sw1{
-+				regulator-name = "vbus_otg";
-+				interrupts = <IT_OCP_OTG 0>;
-+			};
-+
-+			vbus_sw:pwr_sw2{
-+				regulator-name = "vbus_sw";
-+				interrupts = <IT_OCP_SWOUT 0>;
-+				regulator-active-discharge = <1>;
-+			};
-+		};
-+
-+		onkey{
-+			compatible = "st,stpmic1-onkey";
-+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
-+			interrupt-names = "onkey-falling", "onkey-rising";
-+			power-off-time-sec = <10>;
-+			status = "okay";
-+		};
-+
-+		watchdog {
-+			compatible = "st,stpmic1-wdt";
-+			status = "disabled";
-+		};
-+	};
-+	eeprom@50 {
-+		compatible = "atmel,24c02";
-+		reg = <0x50>;
-+		pagesize = <16>;
-+	};
-+};
-+
-+&ipcc{
-+	status = "okay";
-+};
-+
-+&iwdg2{
-+	status = "okay";
-+	timeout-sec = <32>;
-+};
-+
-+&mdma1{
-+	status = "okay";
-+};
-+
-+&rcc{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+};
-+
-+&rng1{
-+	status = "okay";
-+};
-+
-+&rtc{
-+	status = "okay";
-+};
-+
-+&sdmmc1{
-+	u-boot,dm-pre-reloc;
-+	pinctrl-names = "default", "opendrain", "sleep";
-+	pinctrl-0 = <&sdmmc1_pins_mx>;
-+	pinctrl-1 = <&sdmmc1_opendrain_pins_mx>;
-+	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
-+	status = "okay";
-+
-+	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-+	disable-wp;
-+	st,neg-edge;
-+	bus-width = <4>;
-+	vmmc-supply = <&v3v3>;
-+};
-+
-+&tamp{
-+	status = "okay";
-+};
-+
-+&uart4{
-+	u-boot,dm-pre-reloc;
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&uart4_pins_mx>;
-+	pinctrl-1 = <&uart4_sleep_pins_mx>;
-+	status = "okay";
-+
-+	/delete-property/ dmas;
-+	/delete-property/ dma-names;
-+};
-+
-+&usbh_ehci{
-+	status = "okay";
-+	phys = <&usbphyc_port0>;
-+};
-+
-+&usbh_ohci{
-+	status = "okay";
-+};
-+
-+&usbotg_hs{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+	phys = <&usbphyc_port1 0>;
-+	phy-names = "usb2-phy";
-+};
-+
-+&usbphyc{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+};
-+
-+&usbphyc_port0{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+	phy-supply = <&vdd_usb>;
-+	st,phy-tuning = <&usb_phy_tuning>;
-+};
-+
-+&usbphyc_port1{
-+	u-boot,dm-pre-reloc;
-+	status = "okay";
-+	phy-supply = <&vdd_usb>;
-+	st,phy-tuning = <&usb_phy_tuning>;
-+};
-+
-+&adc {
-+  vdd-supply = <&vdd>;
-+  vdda-supply = <&vdda>;
-+  vref-supply = <&vdda>;
-+	status = "okay";
-+  adc1: adc@0 {
-+    st,min-sample-time-nsecs = <5000>;
-+    st,adc-channels = <0 1>;
-+    status = "okay";
-+  };
-+
-+  adc2: adc@100 {
-+    status = "okay";
-+  };
-+
-+  adc_temp: temp {
-+    status = "okay";
-+  };
-+};
-+
-+&usbh_ohci{
-+	phys = <&usbphyc_port0>;
-+};
-+
-+&cpu0{
-+	cpu-supply = <&vddcore>;
-+};
-+
-+&cpu1{
-+	cpu-supply = <&vddcore>;
-+};
-+
-+&sram{
-+	dma_pool:dma_pool@0{
-+		reg = <0x50000 0x10000>;
-+		pool;
-+	};
-+};
-+
-+&optee{
-+	status = "okay";
-+};
-+
-+&spi2 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&spi2_pins_mx>;
-+	pinctrl-1 = <&spi2_sleep_pins_mx>;
-+  cs-gpios = <&gpioi 0 0>;
-+	status = "okay";
-+
-+  spidev2: spidev2@0{
-+    compatible = "rohm,dh2228fv";
-+    spi-max-frequency = <30000000>;
-+    reg = <0>;
-+  };
-+};
-+
-+&spi4 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&spi4_pins_mx>;
-+	pinctrl-1 = <&spi4_sleep_pins_mx>;
-+  cs-gpios = <&gpioe 11 0>;
-+	status = "okay";
-+
-+  spidev4: spidev4@0{
-+    compatible = "rohm,dh2228fv";
-+    spi-max-frequency = <30000000>;
-+    reg = <0>;
-+  };
-+};
-+
-+&spi6 {
-+	pinctrl-names = "default", "sleep";
-+	pinctrl-0 = <&spi6_pins_mx>;
-+	pinctrl-1 = <&spi6_sleep_pins_mx>;
-+  cs-gpios = <&gpioz 3 0>;
-+	status = "okay";
-+
-+  spidev6: spidev6@0{
-+    compatible = "rohm,dh2228fv";
-+    spi-max-frequency = <30000000>;
-+    reg = <0>;
-+  };
-+};
-+
-+&usart2 {
-+	pinctrl-names = "default", "sleep", "idle";
-+	pinctrl-0 = <&usart2_pins_mx>;
-+	pinctrl-1 = <&usart2_sleep_pins_mx>;
-+	pinctrl-2 = <&usart2_idle_pins_mx>;
-+	status = "okay";
-+};
-+
-+&uart5 {
-+	pinctrl-names = "default", "sleep", "idle";
-+	pinctrl-0 = <&uart5_pins_mx>;
-+	pinctrl-1 = <&uart5_sleep_pins_mx>;
-+	pinctrl-2 = <&uart5_idle_pins_mx>;
-+	status = "okay";
-+};
-+
-+&uart7 {
-+	pinctrl-names = "default", "sleep", "idle";
-+	pinctrl-0 = <&uart7_pins_mx>;
-+	pinctrl-1 = <&uart7_sleep_pins_mx>;
-+	pinctrl-2 = <&uart7_idle_pins_mx>;
-+	status = "okay";
-+};
-+
-+&uart8 {
-+	pinctrl-names = "default", "sleep", "idle";
-+	pinctrl-0 = <&uart8_pins_mx>;
-+	pinctrl-1 = <&uart8_sleep_pins_mx>;
-+	pinctrl-2 = <&uart8_idle_pins_mx>;
-+	status = "okay";
-+};
-+
-+&m_can1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&m_can1_pins_mx>;
-+	status = "okay";
-+  can-transceiver {
-+    max-bitrate = <5000000>;
-+  };
-+};
-+
-+&timers1 {
-+	status = "okay";
-+	/* spare dmas for other usage */
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+	pwm1: pwm {
-+    pinctrl-names = "default", "sleep";
-+	  pinctrl-0 = <&pwm1_pins_mx>;
-+	  pinctrl-1 = <&pwm1_sleep_pins_mx>;
-+		status = "okay";
-+	};
-+};
-+
-+&timers3 {
-+	status = "okay";
-+	/* spare dmas for other usage */
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+	pwm3: pwm {
-+    pinctrl-names = "default", "sleep";
-+	  pinctrl-0 = <&pwm3_pins_mx>;
-+	  pinctrl-1 = <&pwm3_sleep_pins_mx>;
-+		status = "okay";
-+	};
-+};
-+
-+&timers4 {
-+	status = "okay";
-+	/* spare dmas for other usage */
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+	pwm4: pwm {
-+    pinctrl-names = "default", "sleep";
-+	  pinctrl-0 = <&pwm4_pins_mx>;
-+	  pinctrl-1 = <&pwm4_sleep_pins_mx>;
-+		status = "okay";
-+	};
-+};
-+
-+&timers8 {
-+	status = "okay";
-+	/* spare dmas for other usage */
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+	pwm8: pwm {
-+    pinctrl-names = "default", "sleep";
-+	  pinctrl-0 = <&pwm8_pins_mx>;
-+	  pinctrl-1 = <&pwm8_sleep_pins_mx>;
-+		status = "okay";
-+	};
-+};
-+
-+&timers12 {
-+	status = "okay";
-+	/* spare dmas for other usage */
-+	/delete-property/dmas;
-+	/delete-property/dma-names;
-+	pwm12: pwm {
-+    pinctrl-names = "default", "sleep";
-+	  pinctrl-0 = <&pwm12_pins_mx>;
-+	  pinctrl-1 = <&pwm12_sleep_pins_mx>;
-+		status = "okay";
-+	};
-+};
-diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
-index 35169385fd..f43c45bd3d 100644
---- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
-+++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
-@@ -572,7 +572,8 @@
- 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
- 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
- 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
--	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-+	//cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
-+	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
- 	disable-wp;
- 	st,neg-edge;
- 	bus-width = <4>;
-diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
-index f9f79437e4..ff54cb4cfa 100644
---- a/arch/arm/mach-stm32mp/Kconfig
-+++ b/arch/arm/mach-stm32mp/Kconfig
-@@ -85,6 +85,14 @@ config TARGET_DH_STM32MP1_PDK2
- 	help
- 		Target the DH PDK2 development kit with STM32MP15x SoM.
- 
-+config TARGET_OCTAVO_OSD32MP1_BRK
-+	bool "Octavo OSD32MP1 BRK"
-+	select STM32MP15x
-+	imply BOOTCOUNT_LIMIT
-+	imply CMD_BOOTCOUNT
-+	help
-+		Target the Octavo BRK board based on OSD32MP1 SiP.
-+
- endchoice
- 
- config STM32MP1_TRUSTED
-@@ -178,5 +186,5 @@ endif
- 
- source "board/st/stm32mp1/Kconfig"
- source "board/dhelectronics/dh_stm32mp1/Kconfig"
--
-+source "board/octavo/osd32mp1-brk/Kconfig"
- endif
-diff --git a/board/octavo/osd32mp1-brk/Kconfig b/board/octavo/osd32mp1-brk/Kconfig
-new file mode 100644
-index 0000000000..907a09c170
---- /dev/null
-+++ b/board/octavo/osd32mp1-brk/Kconfig
-@@ -0,0 +1,13 @@
-+if TARGET_OCTAVO_OSD32MP1_BRK
-+
-+config SYS_BOARD
-+	default "osd32mp1-brk"
-+
-+config SYS_VENDOR
-+	default "octavo"
-+
-+config SYS_CONFIG_NAME
-+	default "stm32mp1"
-+
-+source "board/st/common/Kconfig"
-+endif
-diff --git a/board/octavo/osd32mp1-brk/MAINTAINERS b/board/octavo/osd32mp1-brk/MAINTAINERS
-new file mode 100644
-index 0000000000..5c4fc6eea2
---- /dev/null
-+++ b/board/octavo/osd32mp1-brk/MAINTAINERS
-@@ -0,0 +1,7 @@
-+OCTAVO osd32mp1-brk BOARD
-+M:	Martin Lesniak <martin.lesniak@st.com>
-+S:	Maintained
-+F:	arch/arm/dts/stm32mp157c-osd32mp1-brk*
-+F:	board/Octavo/osd32mp1-brk/
-+F:	configs/osd32mp1_brk_trusted_defconfig
-+F:	include/configs/stm32mp1.h
-diff --git a/board/octavo/osd32mp1-brk/Makefile b/board/octavo/osd32mp1-brk/Makefile
-new file mode 100644
-index 0000000000..381579c590
---- /dev/null
-+++ b/board/octavo/osd32mp1-brk/Makefile
-@@ -0,0 +1,9 @@
-+# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-+#
-+# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
-+#
-+
-+obj-y += ../../st/stm32mp1/board.o board.o
-+
-+obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
-+obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
-diff --git a/board/octavo/osd32mp1-brk/board.c b/board/octavo/osd32mp1-brk/board.c
-new file mode 100644
-index 0000000000..53325e87f6
---- /dev/null
-+++ b/board/octavo/osd32mp1-brk/board.c
-@@ -0,0 +1,547 @@
-+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-+/*
-+ * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
-+ */
-+
-+#include <common.h>
-+#include <adc.h>
-+#include <asm/arch/stm32.h>
-+#include <asm/arch/sys_proto.h>
-+#include <asm/gpio.h>
-+#include <asm/io.h>
-+#include <bootm.h>
-+#include <clk.h>
-+#include <config.h>
-+#include <dm.h>
-+#include <dm/device.h>
-+#include <dm/uclass.h>
-+#include <env.h>
-+#include <env_internal.h>
-+#include <g_dnl.h>
-+#include <generic-phy.h>
-+#include <i2c.h>
-+#include <i2c_eeprom.h>
-+#include <init.h>
-+#include <led.h>
-+#include <memalign.h>
-+#include <misc.h>
-+#include <mtd.h>
-+#include <mtd_node.h>
-+#include <netdev.h>
-+#include <phy.h>
-+#include <power/regulator.h>
-+#include <remoteproc.h>
-+#include <reset.h>
-+#include <syscon.h>
-+#include <usb.h>
-+#include <usb/dwc2_udc.h>
-+#include <watchdog.h>
-+
-+/* SYSCFG registers */
-+#define SYSCFG_BOOTR		0x00
-+#define SYSCFG_PMCSETR		0x04
-+#define SYSCFG_IOCTRLSETR	0x18
-+#define SYSCFG_ICNR		0x1C
-+#define SYSCFG_CMPCR		0x20
-+#define SYSCFG_CMPENSETR	0x24
-+#define SYSCFG_PMCCLRR		0x44
-+
-+#define SYSCFG_BOOTR_BOOT_MASK		GENMASK(2, 0)
-+#define SYSCFG_BOOTR_BOOTPD_SHIFT	4
-+
-+#define SYSCFG_IOCTRLSETR_HSLVEN_TRACE		BIT(0)
-+#define SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI	BIT(1)
-+#define SYSCFG_IOCTRLSETR_HSLVEN_ETH		BIT(2)
-+#define SYSCFG_IOCTRLSETR_HSLVEN_SDMMC		BIT(3)
-+#define SYSCFG_IOCTRLSETR_HSLVEN_SPI		BIT(4)
-+
-+#define SYSCFG_CMPCR_SW_CTRL		BIT(1)
-+#define SYSCFG_CMPCR_READY		BIT(8)
-+
-+#define SYSCFG_CMPENSETR_MPU_EN		BIT(0)
-+
-+#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
-+#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
-+
-+#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
-+
-+#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
-+#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
-+#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
-+#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
-+
-+/*
-+ * Get a global data pointer
-+ */
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+int setup_mac_address(void)
-+{
-+	struct udevice *dev;
-+	ofnode eeprom;
-+	unsigned char enetaddr[6];
-+	int ret;
-+
-+	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
-+	if (ret)	/* ethaddr is already set */
-+		return 0;
-+
-+	eeprom = ofnode_path("/soc/i2c@5c002000/eeprom@50");
-+	if (!ofnode_valid(eeprom)) {
-+		printf("Invalid hardware path to EEPROM!\n");
-+		return -ENODEV;
-+	}
-+
-+	ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, eeprom, &dev);
-+	if (ret) {
-+		printf("Cannot find EEPROM!\n");
-+		return ret;
-+	}
-+
-+	ret = i2c_eeprom_read(dev, 0xfa, enetaddr, 0x6);
-+	if (ret) {
-+		printf("Error reading configuration EEPROM!\n");
-+		return ret;
-+	}
-+
-+	if (is_valid_ethaddr(enetaddr))
-+		eth_env_set_enetaddr("ethaddr", enetaddr);
-+
-+	return 0;
-+}
-+
-+int checkboard(void)
-+{
-+	char *mode;
-+	const char *fdt_compat;
-+	int fdt_compat_len;
-+
-+	if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
-+		mode = "trusted";
-+	else
-+		mode = "basic";
-+
-+	printf("Board: stm32mp1 in %s mode", mode);
-+	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-+				 &fdt_compat_len);
-+	if (fdt_compat && fdt_compat_len)
-+		printf(" (%s)", fdt_compat);
-+	puts("\n");
-+
-+	return 0;
-+}
-+
-+static void board_key_check(void)
-+{
-+#if defined(CONFIG_FASTBOOT) || defined(CONFIG_CMD_STM32PROG)
-+	ofnode node;
-+	struct gpio_desc gpio;
-+	enum forced_boot_mode boot_mode = BOOT_NORMAL;
-+
-+	node = ofnode_path("/config");
-+	if (!ofnode_valid(node)) {
-+		debug("%s: no /config node?\n", __func__);
-+		return;
-+	}
-+#ifdef CONFIG_FASTBOOT
-+	if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
-+				       &gpio, GPIOD_IS_IN)) {
-+		debug("%s: could not find a /config/st,fastboot-gpios\n",
-+		      __func__);
-+	} else {
-+		if (dm_gpio_get_value(&gpio)) {
-+			puts("Fastboot key pressed, ");
-+			boot_mode = BOOT_FASTBOOT;
-+		}
-+
-+		dm_gpio_free(NULL, &gpio);
-+	}
-+#endif
-+#ifdef CONFIG_CMD_STM32PROG
-+	if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
-+				       &gpio, GPIOD_IS_IN)) {
-+		debug("%s: could not find a /config/st,stm32prog-gpios\n",
-+		      __func__);
-+	} else {
-+		if (dm_gpio_get_value(&gpio)) {
-+			puts("STM32Programmer key pressed, ");
-+			boot_mode = BOOT_STM32PROG;
-+		}
-+		dm_gpio_free(NULL, &gpio);
-+	}
-+#endif
-+
-+	if (boot_mode != BOOT_NORMAL) {
-+		puts("entering download mode...\n");
-+		clrsetbits_le32(TAMP_BOOT_CONTEXT,
-+				TAMP_BOOT_FORCED_MASK,
-+				boot_mode);
-+	}
-+#endif
-+}
-+
-+#if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
-+
-+#include <usb/dwc2_udc.h>
-+int g_dnl_board_usb_cable_connected(void)
-+{
-+	struct udevice *dwc2_udc_otg;
-+	int ret;
-+
-+	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
-+					  DM_GET_DRIVER(dwc2_udc_otg),
-+					  &dwc2_udc_otg);
-+	if (!ret)
-+		debug("dwc2_udc_otg init failed\n");
-+
-+	return dwc2_udc_B_session_valid(dwc2_udc_otg);
-+}
-+
-+#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
-+#define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
-+
-+int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
-+{
-+	if (!strcmp(name, "usb_dnl_dfu"))
-+		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
-+	else if (!strcmp(name, "usb_dnl_fastboot"))
-+		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
-+			      &dev->idProduct);
-+	else
-+		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev->idProduct);
-+
-+	return 0;
-+}
-+
-+#endif /* CONFIG_USB_GADGET */
-+
-+#ifdef CONFIG_LED
-+static int get_led(struct udevice **dev, char *led_string)
-+{
-+	char *led_name;
-+	int ret;
-+
-+	led_name = fdtdec_get_config_string(gd->fdt_blob, led_string);
-+	if (!led_name) {
-+		pr_debug("%s: could not find %s config string\n",
-+			 __func__, led_string);
-+		return -ENOENT;
-+	}
-+	ret = led_get_by_label(led_name, dev);
-+	if (ret) {
-+		debug("%s: get=%d\n", __func__, ret);
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+static int setup_led(enum led_state_t cmd)
-+{
-+	struct udevice *dev;
-+	int ret;
-+
-+	ret = get_led(&dev, "u-boot,boot-led");
-+	if (ret)
-+		return ret;
-+
-+	ret = led_set_state(dev, cmd);
-+	return ret;
-+}
-+#endif
-+
-+static void __maybe_unused led_error_blink(u32 nb_blink)
-+{
-+#ifdef CONFIG_LED
-+	int ret;
-+	struct udevice *led;
-+	u32 i;
-+#endif
-+
-+	if (!nb_blink)
-+		return;
-+
-+#ifdef CONFIG_LED
-+	ret = get_led(&led, "u-boot,error-led");
-+	if (!ret) {
-+		/* make u-boot,error-led blinking */
-+		/* if U32_MAX and 125ms interval, for 17.02 years */
-+		for (i = 0; i < 2 * nb_blink; i++) {
-+			led_set_state(led, LEDST_TOGGLE);
-+			mdelay(125);
-+			WATCHDOG_RESET();
-+		}
-+	}
-+#endif
-+
-+	/* infinite: the boot process must be stopped */
-+	if (nb_blink == U32_MAX)
-+		hang();
-+}
-+
-+static void sysconf_init(void)
-+{
-+#ifndef CONFIG_STM32MP1_TRUSTED
-+	u8 *syscfg;
-+#ifdef CONFIG_DM_REGULATOR
-+	struct udevice *pwr_dev;
-+	struct udevice *pwr_reg;
-+	struct udevice *dev;
-+	int ret;
-+	u32 otp = 0;
-+#endif
-+	u32 bootr;
-+
-+	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-+
-+	/* interconnect update : select master using the port 1 */
-+	/* LTDC = AXI_M9 */
-+	/* GPU  = AXI_M8 */
-+	/* today information is hardcoded in U-Boot */
-+	writel(BIT(9), syscfg + SYSCFG_ICNR);
-+
-+	/* disable Pull-Down for boot pin connected to VDD */
-+	bootr = readl(syscfg + SYSCFG_BOOTR);
-+	bootr &= ~(SYSCFG_BOOTR_BOOT_MASK << SYSCFG_BOOTR_BOOTPD_SHIFT);
-+	bootr |= (bootr & SYSCFG_BOOTR_BOOT_MASK) << SYSCFG_BOOTR_BOOTPD_SHIFT;
-+	writel(bootr, syscfg + SYSCFG_BOOTR);
-+
-+#ifdef CONFIG_DM_REGULATOR
-+	/* High Speed Low Voltage Pad mode Enable for SPI, SDMMC, ETH, QSPI
-+	 * and TRACE. Needed above ~50MHz and conditioned by AFMUX selection.
-+	 * The customer will have to disable this for low frequencies
-+	 * or if AFMUX is selected but the function not used, typically for
-+	 * TRACE. Otherwise, impact on power consumption.
-+	 *
-+	 * WARNING:
-+	 *   enabling High Speed mode while VDD>2.7V
-+	 *   with the OTP product_below_2v5 (OTP 18, BIT 13)
-+	 *   erroneously set to 1 can damage the IC!
-+	 *   => U-Boot set the register only if VDD < 2.7V (in DT)
-+	 *      but this value need to be consistent with board design
-+	 */
-+	ret = uclass_get_device_by_driver(UCLASS_PMIC,
-+					  DM_GET_DRIVER(stm32mp_pwr_pmic),
-+					  &pwr_dev);
-+	if (!ret) {
-+		ret = uclass_get_device_by_driver(UCLASS_MISC,
-+						  DM_GET_DRIVER(stm32mp_bsec),
-+						  &dev);
-+		if (ret) {
-+			pr_err("Can't find stm32mp_bsec driver\n");
-+			return;
-+		}
-+
-+		ret = misc_read(dev, STM32_BSEC_SHADOW(18), &otp, 4);
-+		if (ret > 0)
-+			otp = otp & BIT(13);
-+
-+		/* get VDD = vdd-supply */
-+		ret = device_get_supply_regulator(pwr_dev, "vdd-supply",
-+						  &pwr_reg);
-+
-+		/* check if VDD is Low Voltage */
-+		if (!ret) {
-+			if (regulator_get_value(pwr_reg) < 2700000) {
-+				writel(SYSCFG_IOCTRLSETR_HSLVEN_TRACE |
-+				       SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI |
-+				       SYSCFG_IOCTRLSETR_HSLVEN_ETH |
-+				       SYSCFG_IOCTRLSETR_HSLVEN_SDMMC |
-+				       SYSCFG_IOCTRLSETR_HSLVEN_SPI,
-+				       syscfg + SYSCFG_IOCTRLSETR);
-+
-+				if (!otp)
-+					pr_err("product_below_2v5=0: HSLVEN protected by HW\n");
-+			} else {
-+				if (otp)
-+					pr_err("product_below_2v5=1: HSLVEN update is destructive, no update as VDD>2.7V\n");
-+			}
-+		} else {
-+			debug("VDD unknown");
-+		}
-+	}
-+#endif
-+
-+	/* activate automatic I/O compensation
-+	 * warning: need to ensure CSI enabled and ready in clock driver
-+	 */
-+	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg + SYSCFG_CMPENSETR);
-+
-+	while (!(readl(syscfg + SYSCFG_CMPCR) & SYSCFG_CMPCR_READY))
-+		;
-+	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
-+#endif
-+}
-+
-+/* board dependent setup after realloc */
-+int board_init(void)
-+{
-+	struct udevice *dev;
-+
-+	/* address of boot parameters */
-+	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
-+
-+	/* probe all PINCTRL for hog */
-+	for (uclass_first_device(UCLASS_PINCTRL, &dev);
-+	     dev;
-+	     uclass_next_device(&dev)) {
-+		pr_debug("probe pincontrol = %s\n", dev->name);
-+	}
-+
-+	board_key_check();
-+
-+#ifdef CONFIG_DM_REGULATOR
-+	regulators_enable_boot_on(_DEBUG);
-+#endif
-+
-+	sysconf_init();
-+
-+	if (CONFIG_IS_ENABLED(LED))
-+		led_default_state();
-+
-+	return 0;
-+}
-+
-+int board_late_init(void)
-+{
-+	char *boot_device;
-+#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
-+	const void *fdt_compat;
-+	int fdt_compat_len;
-+
-+	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
-+				 &fdt_compat_len);
-+	if (fdt_compat && fdt_compat_len) {
-+		if (strncmp(fdt_compat, "st,", 3) != 0)
-+			env_set("board_name", fdt_compat);
-+		else
-+			env_set("board_name", fdt_compat + 3);
-+	}
-+#endif
-+
-+	/* Check the boot-source to disable bootdelay */
-+	boot_device = env_get("boot_device");
-+	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
-+		env_set("bootdelay", "0");
-+
-+	return 0;
-+}
-+
-+void board_quiesce_devices(void)
-+{
-+#ifdef CONFIG_LED
-+	setup_led(LEDST_OFF);
-+#endif
-+}
-+
-+/* eth init function : weak called in eqos driver */
-+int board_interface_eth_init(struct udevice *dev,
-+			     phy_interface_t interface_type)
-+{
-+	u8 *syscfg;
-+	u32 value;
-+	bool eth_clk_sel_reg = false;
-+	bool eth_ref_clk_sel_reg = false;
-+
-+	/* Gigabit Ethernet 125MHz clock selection. */
-+	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
-+
-+	/* Ethernet 50Mhz RMII clock selection */
-+	eth_ref_clk_sel_reg =
-+		dev_read_bool(dev, "st,eth_ref_clk_sel");
-+
-+	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-+
-+	if (!syscfg)
-+		return -ENODEV;
-+
-+	switch (interface_type) {
-+	case PHY_INTERFACE_MODE_MII:
-+		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-+			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-+		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
-+		break;
-+	case PHY_INTERFACE_MODE_GMII:
-+		if (eth_clk_sel_reg)
-+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
-+				SYSCFG_PMCSETR_ETH_CLK_SEL;
-+		else
-+			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
-+		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
-+		break;
-+	case PHY_INTERFACE_MODE_RMII:
-+		if (eth_ref_clk_sel_reg)
-+			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
-+				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
-+		else
-+			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
-+		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
-+		break;
-+	case PHY_INTERFACE_MODE_RGMII:
-+	case PHY_INTERFACE_MODE_RGMII_ID:
-+	case PHY_INTERFACE_MODE_RGMII_RXID:
-+	case PHY_INTERFACE_MODE_RGMII_TXID:
-+		if (eth_clk_sel_reg)
-+			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
-+				SYSCFG_PMCSETR_ETH_CLK_SEL;
-+		else
-+			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
-+		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
-+		break;
-+	default:
-+		debug("%s: Do not manage %d interface\n",
-+		      __func__, interface_type);
-+		/* Do not manage others interfaces */
-+		return -EINVAL;
-+	}
-+
-+	/* clear and set ETH configuration bits */
-+	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
-+	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
-+	       syscfg + SYSCFG_PMCCLRR);
-+	writel(value, syscfg + SYSCFG_PMCSETR);
-+
-+	return 0;
-+}
-+
-+enum env_location env_get_location(enum env_operation op, int prio)
-+{
-+	if (prio)
-+		return ENVL_UNKNOWN;
-+
-+#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
-+	return ENVL_SPI_FLASH;
-+#else
-+	return ENVL_NOWHERE;
-+#endif
-+}
-+
-+#if defined(CONFIG_OF_BOARD_SETUP)
-+int ft_board_setup(void *blob, bd_t *bd)
-+{
-+	return 0;
-+}
-+#endif
-+
-+static void board_copro_image_process(ulong fw_image, size_t fw_size)
-+{
-+	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
-+
-+	if (!rproc_is_initialized())
-+		if (rproc_init()) {
-+			printf("Remote Processor %d initialization failed\n",
-+			       id);
-+			return;
-+		}
-+
-+	ret = rproc_load(id, fw_image, fw_size);
-+	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
-+	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
-+
-+	if (!ret) {
-+		rproc_start(id);
-+		env_set("copro_state", "booted");
-+	}
-+}
-+
-+U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
-diff --git a/configs/osd32mp1_brk_trusted_defconfig b/configs/osd32mp1_brk_trusted_defconfig
-new file mode 100644
-index 0000000000..dd94f6155c
---- /dev/null
-+++ b/configs/osd32mp1_brk_trusted_defconfig
-@@ -0,0 +1,148 @@
-+CONFIG_ARM=y
-+CONFIG_ARCH_STM32MP=y
-+CONFIG_SYS_MALLOC_F_LEN=0x3000
-+CONFIG_ENV_OFFSET=0x280000
-+# CONFIG_TARGET_ST_STM32MP15x=y
-+CONFIG_TARGET_OCTAVO_OSD32MP1_BRK=y
-+CONFIG_CMD_STM32PROG=y
-+CONFIG_ENV_SECT_SIZE=0x40000
-+CONFIG_ENV_OFFSET_REDUND=0x2C0000
-+CONFIG_DISTRO_DEFAULTS=y
-+CONFIG_FIT=y
-+CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
-+CONFIG_SYS_PROMPT="OSD32MP> "
-+# CONFIG_CMD_BOOTD is not set
-+CONFIG_CMD_DTIMG=y
-+# CONFIG_CMD_ELF is not set
-+# CONFIG_CMD_IMI is not set
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EXPORTENV is not set
-+# CONFIG_CMD_IMPORTENV is not set
-+CONFIG_CMD_EEPROM=y
-+CONFIG_CMD_ERASEENV=y
-+CONFIG_CMD_MEMINFO=y
-+CONFIG_CMD_MEMTEST=y
-+CONFIG_CMD_ADC=y
-+CONFIG_CMD_CLK=y
-+CONFIG_CMD_DFU=y
-+CONFIG_CMD_FUSE=y
-+CONFIG_CMD_GPIO=y
-+CONFIG_CMD_I2C=y
-+CONFIG_CMD_MMC=y
-+CONFIG_CMD_REMOTEPROC=y
-+CONFIG_CMD_SPI=y
-+CONFIG_CMD_USB=y
-+CONFIG_CMD_USB_MASS_STORAGE=y
-+CONFIG_CMD_BMP=y
-+CONFIG_CMD_CACHE=y
-+CONFIG_CMD_TIME=y
-+CONFIG_CMD_TIMER=y
-+CONFIG_CMD_PMIC=y
-+CONFIG_CMD_REGULATOR=y
-+CONFIG_CMD_EXT4_WRITE=y
-+CONFIG_CMD_MTDPARTS=y
-+CONFIG_CMD_UBI=y
-+CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-osd32mp1-brk"
-+CONFIG_ENV_IS_NOWHERE=y
-+CONFIG_ENV_IS_IN_MMC=y
-+//CONFIG_ENV_IS_IN_SPI_FLASH=y
-+CONFIG_ENV_IS_IN_UBI=y
-+CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
-+CONFIG_ENV_UBI_PART="UBI"
-+CONFIG_ENV_UBI_VOLUME="uboot_config"
-+CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
-+CONFIG_SYS_RELOC_GD_ENV_ADDR=y
-+CONFIG_STM32_ADC=y
-+CONFIG_CLK_SCMI=y
-+CONFIG_SET_DFU_ALT_INFO=y
-+CONFIG_USB_FUNCTION_FASTBOOT=y
-+CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
-+CONFIG_FASTBOOT_BUF_SIZE=0x02000000
-+CONFIG_FASTBOOT_USB_DEV=1
-+CONFIG_FASTBOOT_FLASH=y
-+CONFIG_FASTBOOT_FLASH_MMC_DEV=1
-+CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
-+CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
-+CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
-+CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
-+CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
-+CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
-+CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
-+CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
-+CONFIG_GPIO_HOG=y
-+CONFIG_DM_HWSPINLOCK=y
-+CONFIG_HWSPINLOCK_STM32=y
-+CONFIG_DM_I2C=y
-+CONFIG_SYS_I2C_STM32F7=y
-+CONFIG_LED=y
-+CONFIG_LED_GPIO=y
-+CONFIG_DM_MAILBOX=y
-+CONFIG_STM32_IPCC=y
-+CONFIG_I2C_EEPROM=y
-+CONFIG_ARM_SMC_MAILBOX=y
-+CONFIG_DM_MMC=y
-+CONFIG_SUPPORT_EMMC_BOOT=y
-+CONFIG_STM32_SDMMC2=y
-+CONFIG_MTD=y
-+CONFIG_DM_MTD=y
-+CONFIG_SYS_MTDPARTS_RUNTIME=y
-+CONFIG_MTD_RAW_NAND=y
-+CONFIG_NAND_STM32_FMC2=y
-+CONFIG_MTD_SPI_NAND=y
-+CONFIG_DM_SPI_FLASH=y
-+CONFIG_SPI_FLASH_MACRONIX=y
-+CONFIG_SPI_FLASH_SPANSION=y
-+CONFIG_SPI_FLASH_STMICRO=y
-+CONFIG_SPI_FLASH_WINBOND=y
-+# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
-+CONFIG_SPI_FLASH_MTD=y
-+CONFIG_PHY_REALTEK=y
-+CONFIG_DM_ETH=y
-+CONFIG_DWC_ETH_QOS=y
-+CONFIG_PHY=y
-+CONFIG_PHY_STM32_USBPHYC=y
-+CONFIG_PINCONF=y
-+CONFIG_PINCTRL_STMFX=y
-+CONFIG_DM_PMIC=y
-+CONFIG_PMIC_STPMIC1=y
-+CONFIG_DM_REGULATOR_FIXED=y
-+CONFIG_DM_REGULATOR_GPIO=y
-+CONFIG_DM_REGULATOR_STM32_VREFBUF=y
-+CONFIG_DM_REGULATOR_STPMIC1=y
-+CONFIG_REMOTEPROC_STM32_COPRO=y
-+CONFIG_RESET_SCMI=y
-+CONFIG_DM_RTC=y
-+CONFIG_RTC_STM32=y
-+CONFIG_SERIAL_RX_BUFFER=y
-+CONFIG_SPI=y
-+CONFIG_DM_SPI=y
-+CONFIG_STM32_QSPI=y
-+CONFIG_STM32_SPI=y
-+CONFIG_TEE=y
-+CONFIG_OPTEE=y
-+# CONFIG_OPTEE_TA_AVB is not set
-+CONFIG_USB=y
-+CONFIG_DM_USB=y
-+CONFIG_DM_USB_GADGET=y
-+CONFIG_USB_EHCI_HCD=y
-+CONFIG_USB_EHCI_GENERIC=y
-+CONFIG_USB_GADGET=y
-+CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
-+CONFIG_USB_GADGET_VENDOR_NUM=0x0483
-+CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
-+CONFIG_USB_GADGET_DWC2_OTG=y
-+CONFIG_DM_VIDEO=y
-+CONFIG_BACKLIGHT_GPIO=y
-+CONFIG_VIDEO_BPP8=y
-+CONFIG_VIDEO_BPP16=y
-+CONFIG_VIDEO_BPP32=y
-+CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
-+CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
-+CONFIG_VIDEO_STM32=y
-+CONFIG_VIDEO_STM32_DSI=y
-+CONFIG_VIDEO_STM32_MAX_XRES=1280
-+CONFIG_VIDEO_STM32_MAX_YRES=800
-+CONFIG_WDT=y
-+CONFIG_WDT_STM32MP=y
-+CONFIG_ERRNO_STR=y
-+CONFIG_FDT_FIXUP_PARTITIONS=y
--- 
-2.25.1
-
diff --git a/board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch b/board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch
new file mode 100644
index 0000000000..ff323562e6
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/patches/uboot/0002-Add-OSD32MP1-BRK-build-config.patch
@@ -0,0 +1,881 @@
+From cbe33390a338428d74a4549cb28e25af42d7f7d9 Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <dantuguf14105@gmail.com>
+Date: Sun, 21 Nov 2021 23:31:02 -0600
+Subject: [PATCH 2/2] Add OSD32MP1-BRK build config
+
+Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
+---
+ arch/arm/mach-stm32mp/Kconfig          |  10 +-
+ board/octavo/osd32mp1-brk/Kconfig      |  13 +
+ board/octavo/osd32mp1-brk/MAINTAINERS  |   8 +
+ board/octavo/osd32mp1-brk/Makefile     |   9 +
+ board/octavo/osd32mp1-brk/board.c      | 631 +++++++++++++++++++++++++
+ configs/osd32mp1_brk_trusted_defconfig | 141 ++++++
+ 6 files changed, 811 insertions(+), 1 deletion(-)
+ create mode 100644 board/octavo/osd32mp1-brk/Kconfig
+ create mode 100644 board/octavo/osd32mp1-brk/MAINTAINERS
+ create mode 100644 board/octavo/osd32mp1-brk/Makefile
+ create mode 100644 board/octavo/osd32mp1-brk/board.c
+ create mode 100644 configs/osd32mp1_brk_trusted_defconfig
+
+diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
+index 44bfac9000..006855acad 100644
+--- a/arch/arm/mach-stm32mp/Kconfig
++++ b/arch/arm/mach-stm32mp/Kconfig
+@@ -92,6 +92,14 @@ config TARGET_DH_STM32MP1_PDK2
+ 	help
+ 		Target the DH PDK2 development kit with STM32MP15x SoM.
+ 
++config TARGET_OCTAVO_OSD32MP1_BRK
++	bool "Octavo OSD32MP1 BRK"
++	select STM32MP15x
++	imply BOOTCOUNT_LIMIT
++	imply CMD_BOOTCOUNT
++	help
++		Target the Octavo BRK board based on OSD32MP1 SiP.
++
+ endchoice
+ 
+ config SYS_TEXT_BASE
+@@ -172,5 +180,5 @@ endif
+ source "arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig"
+ source "board/st/stm32mp1/Kconfig"
+ source "board/dhelectronics/dh_stm32mp1/Kconfig"
+-
++source "board/octavo/osd32mp1-brk/Kconfig"
+ endif
+diff --git a/board/octavo/osd32mp1-brk/Kconfig b/board/octavo/osd32mp1-brk/Kconfig
+new file mode 100644
+index 0000000000..907a09c170
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/Kconfig
+@@ -0,0 +1,13 @@
++if TARGET_OCTAVO_OSD32MP1_BRK
++
++config SYS_BOARD
++	default "osd32mp1-brk"
++
++config SYS_VENDOR
++	default "octavo"
++
++config SYS_CONFIG_NAME
++	default "stm32mp1"
++
++source "board/st/common/Kconfig"
++endif
+diff --git a/board/octavo/osd32mp1-brk/MAINTAINERS b/board/octavo/osd32mp1-brk/MAINTAINERS
+new file mode 100644
+index 0000000000..9c0addbc21
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/MAINTAINERS
+@@ -0,0 +1,8 @@
++OCTAVO osd32mp1-brk BOARD
++M:	Martin Lesniak <martin.lesniak@st.com>
++M:	Neeraj Dantu <neeraj.dantu@octavosystems.com>
++S:	Maintained
++F:	arch/arm/dts/stm32mp157c-osd32mp1-brk*
++F:	board/Octavo/osd32mp1-brk/
++F:	configs/osd32mp1_brk_trusted_defconfig
++F:	include/configs/stm32mp1.h
+diff --git a/board/octavo/osd32mp1-brk/Makefile b/board/octavo/osd32mp1-brk/Makefile
+new file mode 100644
+index 0000000000..b368b396a4
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/Makefile
+@@ -0,0 +1,9 @@
++# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
++#
++# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
++#
++
++obj-y += ../../st/common/stpmic1.o board.o
++
++obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
++obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
+diff --git a/board/octavo/osd32mp1-brk/board.c b/board/octavo/osd32mp1-brk/board.c
+new file mode 100644
+index 0000000000..fd97c9a390
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/board.c
+@@ -0,0 +1,631 @@
++// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
++/*
++ * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
++ */
++#include <common.h>
++#include <adc.h>
++#include <bootm.h>
++#include <clk.h>
++#include <config.h>
++#include <dm.h>
++#include <env.h>
++#include <env_internal.h>
++#include <fdt_support.h>
++#include <g_dnl.h>
++#include <generic-phy.h>
++#include <hang.h>
++#include <i2c.h>
++#include <i2c_eeprom.h>
++#include <init.h>
++#include <led.h>
++#include <log.h>
++#include <malloc.h>
++#include <misc.h>
++#include <mtd_node.h>
++#include <net.h>
++#include <netdev.h>
++#include <phy.h>
++#include <remoteproc.h>
++#include <reset.h>
++#include <syscon.h>
++#include <usb.h>
++#include <watchdog.h>
++#include <asm/io.h>
++#include <asm/gpio.h>
++#include <asm/arch/stm32.h>
++#include <asm/arch/sys_proto.h>
++#include <jffs2/load_kernel.h>
++#include <linux/bitops.h>
++#include <linux/delay.h>
++#include <linux/err.h>
++#include <linux/iopoll.h>
++#include <power/regulator.h>
++#include <usb/dwc2_udc.h>
++
++/* SYSCFG registers */
++#define SYSCFG_BOOTR		0x00
++#define SYSCFG_PMCSETR		0x04
++#define SYSCFG_IOCTRLSETR	0x18
++#define SYSCFG_ICNR		0x1C
++#define SYSCFG_CMPCR		0x20
++#define SYSCFG_CMPENSETR	0x24
++#define SYSCFG_PMCCLRR		0x44
++
++#define SYSCFG_BOOTR_BOOT_MASK		GENMASK(2, 0)
++#define SYSCFG_BOOTR_BOOTPD_SHIFT	4
++
++#define SYSCFG_IOCTRLSETR_HSLVEN_TRACE		BIT(0)
++#define SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI	BIT(1)
++#define SYSCFG_IOCTRLSETR_HSLVEN_ETH		BIT(2)
++#define SYSCFG_IOCTRLSETR_HSLVEN_SDMMC		BIT(3)
++#define SYSCFG_IOCTRLSETR_HSLVEN_SPI		BIT(4)
++
++#define SYSCFG_CMPCR_SW_CTRL		BIT(1)
++#define SYSCFG_CMPCR_READY		BIT(8)
++
++#define SYSCFG_CMPENSETR_MPU_EN		BIT(0)
++
++#define SYSCFG_PMCSETR_ETH_CLK_SEL	BIT(16)
++#define SYSCFG_PMCSETR_ETH_REF_CLK_SEL	BIT(17)
++
++#define SYSCFG_PMCSETR_ETH_SELMII	BIT(20)
++
++#define SYSCFG_PMCSETR_ETH_SEL_MASK	GENMASK(23, 21)
++#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII	0
++#define SYSCFG_PMCSETR_ETH_SEL_RGMII	BIT(21)
++#define SYSCFG_PMCSETR_ETH_SEL_RMII	BIT(23)
++
++/*
++ * Get a global data pointer
++ */
++DECLARE_GLOBAL_DATA_PTR;
++
++int setup_mac_address(void)
++{
++	struct udevice *dev;
++	ofnode eeprom;
++	unsigned char enetaddr[6];
++	int ret;
++
++	ret = eth_env_get_enetaddr("ethaddr", enetaddr);
++	if (ret)	/* ethaddr is already set */
++		return 0;
++
++	eeprom = ofnode_path("/soc/i2c@5c002000/eeprom@50");
++	if (!ofnode_valid(eeprom)) {
++		printf("Invalid hardware path to EEPROM!\n");
++		return -ENODEV;
++	}
++
++	ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, eeprom, &dev);
++	if (ret) {
++		printf("Cannot find EEPROM!\n");
++		return ret;
++	}
++
++	ret = i2c_eeprom_read(dev, 0xfa, enetaddr, 0x6);
++	if (ret) {
++		printf("Error reading configuration EEPROM!\n");
++		return ret;
++	}
++
++	if (is_valid_ethaddr(enetaddr))
++		eth_env_set_enetaddr("ethaddr", enetaddr);
++
++	return 0;
++}
++
++int checkboard(void)
++{
++	char *mode;
++	const char *fdt_compat;
++	int fdt_compat_len;
++
++	if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
++		mode = "trusted - stm32image";
++	else if (IS_ENABLED(CONFIG_TFABOOT))
++		mode = "trusted";
++	else
++		mode = "basic";
++
++	printf("Board: stm32mp1 in %s mode", mode);
++	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
++				 &fdt_compat_len);
++	if (fdt_compat && fdt_compat_len)
++		printf(" (%s)", fdt_compat);
++	puts("\n");
++
++	return 0;
++}
++
++static void board_key_check(void)
++{
++	ofnode node;
++	struct gpio_desc gpio;
++	enum forced_boot_mode boot_mode = BOOT_NORMAL;
++
++	if (!IS_ENABLED(CONFIG_FASTBOOT) && !IS_ENABLED(CONFIG_CMD_STM32PROG))
++		return;
++
++	node = ofnode_path("/config");
++	if (!ofnode_valid(node)) {
++		debug("%s: no /config node?\n", __func__);
++		return;
++	}
++	if (IS_ENABLED(CONFIG_FASTBOOT)) {
++		if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
++					       &gpio, GPIOD_IS_IN)) {
++			debug("%s: could not find a /config/st,fastboot-gpios\n",
++			      __func__);
++		} else {
++			if (dm_gpio_get_value(&gpio)) {
++				puts("Fastboot key pressed, ");
++				boot_mode = BOOT_FASTBOOT;
++			}
++
++			dm_gpio_free(NULL, &gpio);
++		}
++	}
++	if (IS_ENABLED(CONFIG_CMD_STM32PROG)) {
++		if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
++					       &gpio, GPIOD_IS_IN)) {
++			debug("%s: could not find a /config/st,stm32prog-gpios\n",
++			      __func__);
++		} else {
++			if (dm_gpio_get_value(&gpio)) {
++				puts("STM32Programmer key pressed, ");
++				boot_mode = BOOT_STM32PROG;
++			}
++			dm_gpio_free(NULL, &gpio);
++		}
++	}
++	if (boot_mode != BOOT_NORMAL) {
++		puts("entering download mode...\n");
++		clrsetbits_le32(TAMP_BOOT_CONTEXT,
++				TAMP_BOOT_FORCED_MASK,
++				boot_mode);
++	}
++}
++
++int g_dnl_board_usb_cable_connected(void)
++{
++	struct udevice *dwc2_udc_otg;
++	int ret;
++
++	if (!IS_ENABLED(CONFIG_USB_GADGET_DWC2_OTG))
++		return -ENODEV;
++	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
++					  DM_GET_DRIVER(dwc2_udc_otg),
++					  &dwc2_udc_otg);
++	if (!ret)
++		debug("dwc2_udc_otg init failed\n");
++
++	return dwc2_udc_B_session_valid(dwc2_udc_otg);
++}
++
++#ifdef CONFIG_USB_GADGET_DOWNLOAD
++#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
++#define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
++
++int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
++{
++	if (IS_ENABLED(CONFIG_DFU_OVER_USB) &&
++	    !strcmp(name, "usb_dnl_dfu"))
++		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
++	else if (IS_ENABLED(CONFIG_FASTBOOT) &&
++		 !strcmp(name, "usb_dnl_fastboot"))
++		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
++			      &dev->idProduct);
++	else
++		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev->idProduct);
++
++	return 0;
++}
++#endif /* CONFIG_USB_GADGET_DOWNLOAD */
++
++static int get_led(struct udevice **dev, char *led_string)
++{
++	char *led_name;
++	int ret;
++
++	led_name = fdtdec_get_config_string(gd->fdt_blob, led_string);
++	if (!led_name) {
++		pr_debug("%s: could not find %s config string\n",
++			 __func__, led_string);
++		return -ENOENT;
++	}
++	ret = led_get_by_label(led_name, dev);
++	if (ret) {
++		debug("%s: get=%d\n", __func__, ret);
++		return ret;
++	}
++
++	return 0;
++}
++
++static int setup_led(enum led_state_t cmd)
++{
++	struct udevice *dev;
++	int ret;
++
++	if (!CONFIG_IS_ENABLED(LED))
++		return 0;
++
++	ret = get_led(&dev, "u-boot,boot-led");
++	if (ret)
++		return ret;
++
++	ret = led_set_state(dev, cmd);
++	return ret;
++}
++
++static void __maybe_unused led_error_blink(u32 nb_blink)
++{
++	int ret;
++	struct udevice *led;
++	u32 i;
++
++	if (!nb_blink)
++		return;
++
++	if (CONFIG_IS_ENABLED(LED)) {
++		ret = get_led(&led, "u-boot,error-led");
++		if (!ret) {
++			/* make u-boot,error-led blinking */
++			/* if U32_MAX and 125ms interval, for 17.02 years */
++			for (i = 0; i < 2 * nb_blink; i++) {
++				led_set_state(led, LEDST_TOGGLE);
++				mdelay(125);
++				WATCHDOG_RESET();
++			}
++			led_set_state(led, LEDST_ON);
++		}
++	}
++
++	/* infinite: the boot process must be stopped */
++	if (nb_blink == U32_MAX)
++		hang();
++}
++
++static void sysconf_init(void)
++{
++	u8 *syscfg;
++	struct udevice *pwr_dev;
++	struct udevice *pwr_reg;
++	struct udevice *dev;
++	u32 otp = 0;
++	int ret;
++	u32 bootr, val;
++
++	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
++
++	/* interconnect update : select master using the port 1 */
++	/* LTDC = AXI_M9 */
++	/* GPU  = AXI_M8 */
++	/* today information is hardcoded in U-Boot */
++	writel(BIT(9), syscfg + SYSCFG_ICNR);
++
++	/* disable Pull-Down for boot pin connected to VDD */
++	bootr = readl(syscfg + SYSCFG_BOOTR);
++	bootr &= ~(SYSCFG_BOOTR_BOOT_MASK << SYSCFG_BOOTR_BOOTPD_SHIFT);
++	bootr |= (bootr & SYSCFG_BOOTR_BOOT_MASK) << SYSCFG_BOOTR_BOOTPD_SHIFT;
++	writel(bootr, syscfg + SYSCFG_BOOTR);
++
++	/* High Speed Low Voltage Pad mode Enable for SPI, SDMMC, ETH, QSPI
++	 * and TRACE. Needed above ~50MHz and conditioned by AFMUX selection.
++	 * The customer will have to disable this for low frequencies
++	 * or if AFMUX is selected but the function not used, typically for
++	 * TRACE. Otherwise, impact on power consumption.
++	 *
++	 * WARNING:
++	 *   enabling High Speed mode while VDD>2.7V
++	 *   with the OTP product_below_2v5 (OTP 18, BIT 13)
++	 *   erroneously set to 1 can damage the IC!
++	 *   => U-Boot set the register only if VDD < 2.7V (in DT)
++	 *      but this value need to be consistent with board design
++	 */
++	ret = uclass_get_device_by_driver(UCLASS_PMIC,
++					  DM_GET_DRIVER(stm32mp_pwr_pmic),
++					  &pwr_dev);
++	if (!ret && IS_ENABLED(CONFIG_DM_REGULATOR)) {
++		ret = uclass_get_device_by_driver(UCLASS_MISC,
++						  DM_GET_DRIVER(stm32mp_bsec),
++						  &dev);
++		if (ret) {
++			pr_err("Can't find stm32mp_bsec driver\n");
++			return;
++		}
++
++		ret = misc_read(dev, STM32_BSEC_SHADOW(18), &otp, 4);
++		if (ret > 0)
++			otp = otp & BIT(13);
++
++		/* get VDD = vdd-supply */
++		ret = device_get_supply_regulator(pwr_dev, "vdd-supply",
++						  &pwr_reg);
++
++		/* check if VDD is Low Voltage */
++		if (!ret) {
++			if (regulator_get_value(pwr_reg) < 2700000) {
++				writel(SYSCFG_IOCTRLSETR_HSLVEN_TRACE |
++				       SYSCFG_IOCTRLSETR_HSLVEN_QUADSPI |
++				       SYSCFG_IOCTRLSETR_HSLVEN_ETH |
++				       SYSCFG_IOCTRLSETR_HSLVEN_SDMMC |
++				       SYSCFG_IOCTRLSETR_HSLVEN_SPI,
++				       syscfg + SYSCFG_IOCTRLSETR);
++
++				if (!otp)
++					pr_err("product_below_2v5=0: HSLVEN protected by HW\n");
++			} else {
++				if (otp)
++					pr_err("product_below_2v5=1: HSLVEN update is destructive, no update as VDD>2.7V\n");
++			}
++		} else {
++			debug("VDD unknown");
++		}
++	}
++
++	/* activate automatic I/O compensation
++	 * warning: need to ensure CSI enabled and ready in clock driver
++	 */
++	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg + SYSCFG_CMPENSETR);
++
++	/* poll until ready (1s timeout) */
++	ret = readl_poll_timeout(syscfg + SYSCFG_CMPCR, val,
++				 val & SYSCFG_CMPCR_READY,
++				 1000000);
++	if (ret) {
++		pr_err("SYSCFG: I/O compensation failed, timeout.\n");
++		led_error_blink(10);
++	}
++
++	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
++}
++
++/* board dependent setup after realloc */
++int board_init(void)
++{
++	/* address of boot parameters */
++	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
++
++	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
++		gpio_hog_probe_all();
++
++	board_key_check();
++
++	if (IS_ENABLED(CONFIG_DM_REGULATOR))
++		regulators_enable_boot_on(_DEBUG);
++
++	if (!IS_ENABLED(CONFIG_TFABOOT))
++		sysconf_init();
++
++	if (CONFIG_IS_ENABLED(LED))
++		led_default_state();
++
++	return 0;
++}
++
++int board_late_init(void)
++{
++	char *boot_device;
++	const void *fdt_compat;
++	int fdt_compat_len;
++	int ret;
++	u32 otp;
++	struct udevice *dev;
++	char buf[10];
++	char dtb_name[256];
++	int buf_len;
++
++	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
++		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
++					 &fdt_compat_len);
++		if (fdt_compat && fdt_compat_len) {
++			if (strncmp(fdt_compat, "st,", 3) != 0) {
++				env_set("board_name", fdt_compat);
++			} else {
++				env_set("board_name", fdt_compat + 3);
++
++				buf_len = sizeof(dtb_name);
++				strncpy(dtb_name, fdt_compat + 3, buf_len);
++				buf_len -= strlen(fdt_compat + 3);
++				strncat(dtb_name, ".dtb", buf_len);
++				env_set("fdtfile", dtb_name);
++			}
++		}
++		ret = uclass_get_device_by_driver(UCLASS_MISC,
++						  DM_GET_DRIVER(stm32mp_bsec),
++						  &dev);
++
++		if (!ret)
++			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
++					&otp, sizeof(otp));
++		if (ret > 0 && otp) {
++			snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
++			env_set("board_id", buf);
++
++			snprintf(buf, sizeof(buf), "0x%04x",
++				 ((otp >> 8) & 0xF) - 1 + 0xA);
++			env_set("board_rev", buf);
++		}
++	}
++
++	/* Check the boot-source to disable bootdelay */
++	boot_device = env_get("boot_device");
++	if (!strcmp(boot_device, "serial") || !strcmp(boot_device, "usb"))
++		env_set("bootdelay", "0");
++
++	return 0;
++}
++
++void board_quiesce_devices(void)
++{
++	setup_led(LEDST_OFF);
++}
++
++/* eth init function : weak called in eqos driver */
++int board_interface_eth_init(struct udevice *dev,
++			     phy_interface_t interface_type, ulong rate)
++{
++	u8 *syscfg;
++	u32 value;
++	bool eth_clk_sel_reg = false;
++	bool eth_ref_clk_sel_reg = false;
++
++	/* Gigabit Ethernet 125MHz clock selection. */
++	eth_clk_sel_reg = dev_read_bool(dev, "st,eth_clk_sel");
++
++	/* Ethernet 50Mhz RMII clock selection */
++	eth_ref_clk_sel_reg =
++		dev_read_bool(dev, "st,eth_ref_clk_sel");
++
++	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
++
++	if (!syscfg)
++		return -ENODEV;
++
++	switch (interface_type) {
++	case PHY_INTERFACE_MODE_MII:
++		value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
++			SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
++		debug("%s: PHY_INTERFACE_MODE_MII\n", __func__);
++		break;
++	case PHY_INTERFACE_MODE_GMII:
++		if (eth_clk_sel_reg)
++			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
++				SYSCFG_PMCSETR_ETH_CLK_SEL;
++		else
++			value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
++		debug("%s: PHY_INTERFACE_MODE_GMII\n", __func__);
++		break;
++	case PHY_INTERFACE_MODE_RMII:
++		if (eth_ref_clk_sel_reg)
++			value = SYSCFG_PMCSETR_ETH_SEL_RMII |
++				SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
++		else
++			value = SYSCFG_PMCSETR_ETH_SEL_RMII;
++		debug("%s: PHY_INTERFACE_MODE_RMII\n", __func__);
++		break;
++	case PHY_INTERFACE_MODE_RGMII:
++	case PHY_INTERFACE_MODE_RGMII_ID:
++	case PHY_INTERFACE_MODE_RGMII_RXID:
++	case PHY_INTERFACE_MODE_RGMII_TXID:
++		if (eth_clk_sel_reg)
++			value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
++				SYSCFG_PMCSETR_ETH_CLK_SEL;
++		else
++			value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
++		debug("%s: PHY_INTERFACE_MODE_RGMII\n", __func__);
++		break;
++	default:
++		debug("%s: Do not manage %d interface\n",
++		      __func__, interface_type);
++		/* Do not manage others interfaces */
++		return -EINVAL;
++	}
++
++	/* clear and set ETH configuration bits */
++	writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
++	       SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
++	       syscfg + SYSCFG_PMCCLRR);
++	writel(value, syscfg + SYSCFG_PMCSETR);
++
++	return 0;
++}
++
++enum env_location env_get_location(enum env_operation op, int prio)
++{
++	u32 bootmode = get_bootmode();
++
++	if (prio)
++		return ENVL_UNKNOWN;
++
++	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
++	case BOOT_FLASH_SD:
++	case BOOT_FLASH_EMMC:
++		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
++			return ENVL_MMC;
++		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
++			return ENVL_EXT4;
++		else
++			return ENVL_NOWHERE;
++
++	case BOOT_FLASH_NAND:
++	case BOOT_FLASH_SPINAND:
++		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
++			return ENVL_UBI;
++		else
++			return ENVL_NOWHERE;
++
++	case BOOT_FLASH_NOR:
++		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
++			return ENVL_SPI_FLASH;
++		else
++			return ENVL_NOWHERE;
++
++	default:
++		return ENVL_NOWHERE;
++	}
++}
++
++const char *env_ext4_get_intf(void)
++{
++	u32 bootmode = get_bootmode();
++
++	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
++	case BOOT_FLASH_SD:
++	case BOOT_FLASH_EMMC:
++		return "mmc";
++	default:
++		return "";
++	}
++}
++
++const char *env_ext4_get_dev_part(void)
++{
++	static char *const dev_part[] = {"0:auto", "1:auto", "2:auto"};
++	u32 bootmode = get_bootmode();
++
++	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
++}
++
++int mmc_get_env_dev(void)
++{
++	u32 bootmode;
++
++	if (CONFIG_SYS_MMC_ENV_DEV >= 0)
++		return CONFIG_SYS_MMC_ENV_DEV;
++
++	bootmode = get_bootmode();
++
++	/* use boot instance to select the correct mmc device identifier */
++	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
++}
++
++#if defined(CONFIG_OF_BOARD_SETUP)
++int ft_board_setup(void *blob, struct bd_info *bd)
++{
++	return 0;
++}
++#endif
++
++static void board_copro_image_process(ulong fw_image, size_t fw_size)
++{
++	int ret, id = 0; /* Copro id fixed to 0 as only one coproc on mp1 */
++
++	if (!rproc_is_initialized())
++		if (rproc_init()) {
++			printf("Remote Processor %d initialization failed\n",
++			       id);
++			return;
++		}
++
++	ret = rproc_load(id, fw_image, fw_size);
++	printf("Load Remote Processor %d with data@addr=0x%08lx %u bytes:%s\n",
++	       id, fw_image, fw_size, ret ? " Failed!" : " Success!");
++
++	if (!ret)
++		rproc_start(id);
++}
++
++U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
+diff --git a/configs/osd32mp1_brk_trusted_defconfig b/configs/osd32mp1_brk_trusted_defconfig
+new file mode 100644
+index 0000000000..6d41af8886
+--- /dev/null
++++ b/configs/osd32mp1_brk_trusted_defconfig
+@@ -0,0 +1,141 @@
++CONFIG_ARM=y
++CONFIG_ARCH_STM32MP=y
++CONFIG_TFABOOT=y
++CONFIG_SYS_MALLOC_F_LEN=0x3000
++CONFIG_ENV_OFFSET=0x480000
++CONFIG_ENV_SECT_SIZE=0x40000
++# CONFIG_TARGET_ST_STM32MP15x=y
++CONFIG_TARGET_OCTAVO_OSD32MP1_BRK=y
++CONFIG_CMD_STM32PROG=y
++CONFIG_ENV_OFFSET_REDUND=0x4C0000
++CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-osd32mp1-brk"
++CONFIG_DISTRO_DEFAULTS=y
++CONFIG_FIT=y
++CONFIG_BOOTDELAY=1
++CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
++CONFIG_SYS_PROMPT="OSD32MP> "
++# CONFIG_CMD_BOOTD is not set
++CONFIG_CMD_ADTIMG=y
++# CONFIG_CMD_ELF is not set
++CONFIG_CMD_EEPROM=y
++CONFIG_CMD_ERASEENV=y
++CONFIG_CMD_MEMINFO=y
++CONFIG_CMD_MEMTEST=y
++CONFIG_SYS_MEMTEST_START=0xc0000000
++CONFIG_SYS_MEMTEST_END=0xc4000000
++CONFIG_CMD_ADC=y
++CONFIG_CMD_CLK=y
++CONFIG_CMD_DFU=y
++CONFIG_CMD_FUSE=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_I2C=y
++CONFIG_CMD_MMC=y
++CONFIG_CMD_REMOTEPROC=y
++CONFIG_CMD_SPI=y
++CONFIG_CMD_USB=y
++CONFIG_CMD_USB_MASS_STORAGE=y
++CONFIG_CMD_BMP=y
++CONFIG_CMD_CACHE=y
++CONFIG_CMD_TIME=y
++CONFIG_CMD_TIMER=y
++CONFIG_CMD_PMIC=y
++CONFIG_CMD_REGULATOR=y
++CONFIG_CMD_EXT4_WRITE=y
++CONFIG_CMD_MTDPARTS=y
++CONFIG_CMD_UBI=y
++CONFIG_ENV_IS_NOWHERE=y
++CONFIG_ENV_IS_IN_MMC=y
++CONFIG_ENV_IS_IN_UBI=y
++CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
++CONFIG_ENV_UBI_PART="UBI"
++CONFIG_ENV_UBI_VOLUME="uboot_config"
++CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
++CONFIG_SYS_RELOC_GD_ENV_ADDR=y
++CONFIG_SYS_MMC_ENV_DEV=-1
++CONFIG_STM32_ADC=y
++CONFIG_CLK_SCMI=y
++CONFIG_SET_DFU_ALT_INFO=y
++CONFIG_USB_FUNCTION_FASTBOOT=y
++CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
++CONFIG_FASTBOOT_BUF_SIZE=0x02000000
++CONFIG_FASTBOOT_USB_DEV=1
++CONFIG_FASTBOOT_FLASH=y
++CONFIG_FASTBOOT_FLASH_MMC_DEV=1
++CONFIG_GPIO_HOG=y
++CONFIG_DM_HWSPINLOCK=y
++CONFIG_HWSPINLOCK_STM32=y
++CONFIG_DM_I2C=y
++CONFIG_SYS_I2C_STM32F7=y
++CONFIG_LED=y
++CONFIG_LED_GPIO=y
++CONFIG_DM_MAILBOX=y
++CONFIG_STM32_IPCC=y
++CONFIG_STM32_FMC2_EBI=y
++CONFIG_I2C_EEPROM=y
++CONFIG_DM_MMC=y
++CONFIG_SUPPORT_EMMC_BOOT=y
++CONFIG_STM32_SDMMC2=y
++CONFIG_MTD=y
++CONFIG_DM_MTD=y
++CONFIG_SYS_MTDPARTS_RUNTIME=y
++CONFIG_MTD_RAW_NAND=y
++CONFIG_NAND_STM32_FMC2=y
++CONFIG_MTD_SPI_NAND=y
++CONFIG_DM_SPI_FLASH=y
++CONFIG_SPI_FLASH_MACRONIX=y
++CONFIG_SPI_FLASH_SPANSION=y
++CONFIG_SPI_FLASH_STMICRO=y
++CONFIG_SPI_FLASH_WINBOND=y
++# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
++CONFIG_SPI_FLASH_MTD=y
++CONFIG_PHY_REALTEK=y
++CONFIG_DM_ETH=y
++CONFIG_DWC_ETH_QOS=y
++CONFIG_PHY=y
++CONFIG_PHY_STM32_USBPHYC=y
++CONFIG_PINCONF=y
++CONFIG_PINCTRL_STMFX=y
++CONFIG_DM_PMIC=y
++CONFIG_PMIC_STPMIC1=y
++CONFIG_DM_REGULATOR=y
++CONFIG_DM_REGULATOR_FIXED=y
++CONFIG_DM_REGULATOR_GPIO=y
++CONFIG_DM_REGULATOR_STM32_VREFBUF=y
++CONFIG_DM_REGULATOR_STPMIC1=y
++CONFIG_REMOTEPROC_STM32_COPRO=y
++CONFIG_RESET_SCMI=y
++CONFIG_DM_RNG=y
++CONFIG_RNG_STM32MP1=y
++CONFIG_DM_RTC=y
++CONFIG_RTC_STM32=y
++CONFIG_SERIAL_RX_BUFFER=y
++CONFIG_SPI=y
++CONFIG_DM_SPI=y
++CONFIG_STM32_QSPI=y
++CONFIG_STM32_SPI=y
++CONFIG_TEE=y
++CONFIG_OPTEE=y
++# CONFIG_OPTEE_TA_AVB is not set
++CONFIG_USB=y
++CONFIG_DM_USB=y
++CONFIG_DM_USB_GADGET=y
++CONFIG_USB_EHCI_HCD=y
++CONFIG_USB_EHCI_GENERIC=y
++CONFIG_USB_GADGET=y
++CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
++CONFIG_USB_GADGET_VENDOR_NUM=0x0483
++CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
++CONFIG_USB_GADGET_DWC2_OTG=y
++CONFIG_DM_VIDEO=y
++CONFIG_BACKLIGHT_GPIO=y
++CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
++CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
++CONFIG_VIDEO_STM32=y
++CONFIG_VIDEO_STM32_DSI=y
++CONFIG_VIDEO_STM32_MAX_XRES=1280
++CONFIG_VIDEO_STM32_MAX_YRES=800
++CONFIG_WDT=y
++CONFIG_WDT_STM32MP=y
++CONFIG_ERRNO_STR=y
++CONFIG_FDT_FIXUP_PARTITIONS=y
++CONFIG_LMB_RESERVED_REGIONS=16
+-- 
+2.25.1
+
diff --git a/board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr.dtsi b/board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
similarity index 99%
rename from board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr.dtsi
rename to board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
index e8c9eebfc6..3cd2c3f5d1 100644
--- a/board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr.dtsi
+++ b/board/octavo/osd32mp1-brk/tfa-dts/osd32mp1_ddr_1x4Gb.dtsi
@@ -117,3 +117,5 @@
 #define DDR_DX3DLLCR 0x40000000
 #define DDR_DX3DQTR 0xFFFFFFFF
 #define DDR_DX3DQSTR 0x3DB02000
+
+#include "stm32mp15-ddr.dtsi"
diff --git a/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk-fw-config.dts b/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk-fw-config.dts
new file mode 100644
index 0000000000..256d0db935
--- /dev/null
+++ b/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk-fw-config.dts
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (c) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+#include "stm32mp15-ddr-512m-fw-config.dts"
diff --git a/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts b/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
index 1820c60160..4f21a21158 100644
--- a/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
+++ b/board/octavo/osd32mp1-brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
@@ -4,32 +4,31 @@
  * Author: STM32CubeMX code generation for STMicroelectronics.
  */
 
-/* For more information on Device Tree configuration, please refer to
- * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
- */
-
 /dts-v1/;
 #include <dt-bindings/pinctrl/stm32-pinfunc.h>
 #include <dt-bindings/clock/stm32mp1-clksrc.h>
 #include <dt-bindings/soc/st,stm32-etzpc.h>
 #include <dt-bindings/power/stm32mp1-power.h>
 
-#include "osd32mp1_ddr.dtsi"
 #include "stm32mp157.dtsi"
 #include "stm32mp15xc.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
-#include "stm32mp15-ddr.dtsi"
+#include "osd32mp1_ddr_1x4Gb.dtsi"
 
 / {
 	model = "Octavo OSD32MP1 BRK board";
 	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
 
-	memory@c0000000{
+	aliases {
+		serial0 = &uart4;
+	};
+
+	memory@c0000000 {
 		device_type = "memory";
 		reg = <0xc0000000 0x20000000>;
 	};
 
-	vin:vin{
+	vin: vin {
 		compatible = "regulator-fixed";
 		regulator-name = "vin";
 		regulator-min-microvolt = <5000000>;
@@ -37,225 +36,76 @@
 		regulator-always-on;
 	};
 
-	aliases{
-		serial0 = &uart4;
-	};
-
-	chosen{
+	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+};
 
-	clocks {
-		clk_lse: clk-lse {
-			st,drive = < LSEDRV_MEDIUM_HIGH >;
-		};
+&bsec {
+	board_id: board_id@ec {
+		reg = <0xec 0x4>;
+		st,non-secure-otp;
 	};
-
 };
 
 &clk_hse {
 	st,digbypass;
 };
 
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
-			slew-rate = <2>;
-		};
-	};
-
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
-	};
-
-	/* USER CODE BEGIN pinctrl */
-	/* USER CODE END pinctrl */
-};
-
-&pinctrl_z {
-	i2c4_pins_z_mx: i2c4_mx-0 {
-		pins {
-			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
-					 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
-			bias-disable;
-			drive-open-drain;
-			slew-rate = <0>;
-		};
-	};
-
-	/* USER CODE BEGIN pinctrl_z */
-	/* USER CODE END pinctrl_z */
+&cpu0 {
+	cpu-supply = <&vddcore>;
 };
 
-&rcc {
-	st,hsi-cal;
-	st,csi-cal;
-	st,cal-sec = <60>;
-	st,clksrc = <
-	  CLK_MPU_PLL1P
-	  CLK_AXI_PLL2P
-	  CLK_MCU_PLL3P
-	  CLK_PLL12_HSE
-	  CLK_PLL3_HSE
-	  CLK_PLL4_HSE
-	  CLK_RTC_LSE
-	  CLK_MCO1_DISABLED
-	  CLK_MCO2_DISABLED
-	>;
-
-	st,clkdiv = <
-	  1 /*MPU*/
-	  0 /*AXI*/
-	  0 /*MCU*/
-	  1 /*APB1*/
-	  1 /*APB2*/
-	  1 /*APB3*/
-	  1 /*APB4*/
-	  2 /*APB5*/
-	  23 /*RTC*/
-	  0 /*MCO1*/
-	  0 /*MCO2*/
-	>;
-
-	st,pkcs = <
-	  CLK_CKPER_HSE
-	  CLK_FMC_ACLK
-	  CLK_QSPI_ACLK
-	  CLK_ETH_DISABLED
-	  CLK_SDMMC12_PLL4P
-	  CLK_DSI_DSIPLL
-	  CLK_STGEN_HSE
-	  CLK_USBPHY_HSE
-	  CLK_SPI2S1_PLL3Q
-	  CLK_SPI2S23_PLL3Q
-	  CLK_SPI45_HSI
-	  CLK_SPI6_HSI
-	  CLK_I2C46_HSI
-	  CLK_SDMMC3_PLL4P
-	  CLK_USBO_USBPHY
-	  CLK_ADC_CKPER
-	  CLK_CEC_LSE
-	  CLK_I2C12_HSI
-	  CLK_I2C35_HSI
-	  CLK_UART1_HSI
-	  CLK_UART24_HSI
-	  CLK_UART35_HSI
-	  CLK_UART6_HSI
-	  CLK_UART78_HSI
-	  CLK_SPDIF_PLL4P
-	  CLK_FDCAN_PLL4R
-	  CLK_SAI1_PLL3Q
-	  CLK_SAI2_PLL3Q
-	  CLK_SAI3_PLL3Q
-	  CLK_SAI4_PLL3Q
-	  CLK_RNG1_LSI
-	  CLK_RNG2_LSI
-	  CLK_LPTIM1_PCLK1
-	  CLK_LPTIM23_PCLK3
-	  CLK_LPTIM45_LSE
-	>;
-
-	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
-	pll2: st,pll@1 {
-	  compatible = "st,stm32mp1-pll";
-	  reg = <1>;
-	  cfg = <2 65 1 0 0 PQR(1,1,1)>;
-	  frac = <0x1400>;
-	};
-
-	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
-	pll3: st,pll@2 {
-	  compatible = "st,stm32mp1-pll";
-	  reg = <2>;
-	  cfg = <1 33 1 16 36 PQR(1,1,1)>;
-	  frac = <0x1a04>;
-	};
-
-	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
-	pll4: st,pll@3 {
-	  compatible = "st,stm32mp1-pll";
-	  reg = <3>;
-	  cfg = <3 98 5 7 7 PQR(1,1,1)>;
-	  };
+&cpu1 {
+	cpu-supply = <&vddcore>;
 };
 
-&bsec{
-	board_id:board_id@ec{
-		reg = <0xec 0x4>;
-		st,non-secure-otp;
-	};
+&hash1 {
+	status = "okay";
 };
 
-&cryp1{
+&cryp1 {
 	status = "okay";
-
-	/* USER CODE BEGIN cryp1 */
-	/* USER CODE END cryp1 */
 };
 
-&etzpc{
+&etzpc {
 	st,decprot = <
-  DECPROT(STM32MP1_ETZPC_USART1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_SPI6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_I2C6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_RNG1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_HASH1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_CRYP1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
-  DECPROT(STM32MP1_ETZPC_DDRCTRL_ID, DECPROT_S_RW, DECPROT_LOCK)
-  DECPROT(STM32MP1_ETZPC_DDRPHYC_ID, DECPROT_S_RW, DECPROT_LOCK)
-  DECPROT(STM32MP1_ETZPC_STGENC_ID, DECPROT_S_RW, DECPROT_LOCK)
-  DECPROT(STM32MP1_ETZPC_BKPSRAM_ID, DECPROT_S_RW, DECPROT_LOCK)
-  DECPROT(STM32MP1_ETZPC_IWDG1_ID, DECPROT_S_RW, DECPROT_LOCK)
+		DECPROT(STM32MP1_ETZPC_USART1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_SPI6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+		DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
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
-	secure-status = "okay";
 };
 
-&hash1{
-	status = "okay";
-};
 
-&i2c4{
+
+&i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_z_mx>;
-	status = "okay";
-	secure-status = "okay";
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	clock-frequency = <400000>;
+	status = "okay";
+	secure-status = "okay";
 
-	pmic:stpmic@33{
+	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
 		reg = <0x33>;
 		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		status = "okay";
-    secure-status = "okay";
+		secure-status = "okay";
 
-		regulators{
+		regulators {
 			compatible = "st,stpmic1-regulators";
 			buck1-supply = <&vin>;
 			buck2-supply = <&vin>;
@@ -272,7 +122,7 @@
 			pwr_sw1-supply = <&bst_out>;
 			pwr_sw2-supply = <&bst_out>;
 
-			vddcore:buck1{
+			vddcore: buck1 {
 				regulator-name = "vddcore";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1350000>;
@@ -291,7 +141,7 @@
 				};
 			};
 
-			vdd_ddr:buck2{
+			vdd_ddr: buck2 {
 				regulator-name = "vdd_ddr";
 				regulator-min-microvolt = <1350000>;
 				regulator-max-microvolt = <1350000>;
@@ -311,7 +161,7 @@
 				};
 			};
 
-			vdd:buck3{
+			vdd: buck3 {
 				regulator-name = "vdd";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -333,7 +183,7 @@
 				};
 			};
 
-			v3v3:buck4{
+			v3v3: buck4 {
 				regulator-name = "v3v3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -352,7 +202,7 @@
 				};
 			};
 
-			v1v8_audio:ldo1{
+			v1v8_ldo1: ldo1 {
 				regulator-name = "v1v8_audio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -365,7 +215,7 @@
 				};
 			};
 
-			v3v3_hdmi:ldo2{
+			v3v3_ldo2: ldo2 {
 				regulator-name = "v3v3_hdmi";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -378,7 +228,7 @@
 				};
 			};
 
-			vtt_ddr:ldo3{
+			vtt_ddr: ldo3 {
 				regulator-name = "vtt_ddr";
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <750000>;
@@ -395,7 +245,7 @@
 				};
 			};
 
-			vdd_usb:ldo4{
+			vdd_usb: ldo4 {
 				regulator-name = "vdd_usb";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
@@ -408,7 +258,7 @@
 				};
 			};
 
-			vdda:ldo5{
+			vdda: ldo5 {
 				regulator-name = "vdda";
 				regulator-min-microvolt = <2900000>;
 				regulator-max-microvolt = <2900000>;
@@ -421,8 +271,8 @@
 				};
 			};
 
-			v1v2_hdmi:ldo6{
-				regulator-name = "v1v2_hdmi";
+			v1v2_ldo6: ldo6 {
+				regulator-name = "v1v2_ldo6";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
@@ -434,7 +284,7 @@
 				};
 			};
 
-			vref_ddr:vref_ddr{
+			vref_ddr: vref_ddr {
 				regulator-name = "vref_ddr";
 				regulator-always-on;
 				regulator-over-current-protection;
@@ -449,133 +299,249 @@
 				};
 			};
 
-			bst_out:boost{
+			bst_out: boost {
 				regulator-name = "bst_out";
 			};
 
-			vbus_otg:pwr_sw1{
+			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 			};
 
-			vbus_sw:pwr_sw2{
+			vbus_sw: pwr_sw2 {
 				regulator-name = "vbus_sw";
 				regulator-active-discharge = <1>;
 			};
 		};
 	};
-	/* USER CODE END i2c4 */
 };
 
-&iwdg2{
+&iwdg2 {
+	timeout-sec = <32>;
+	secure-timeout-sec = <5>;
 	status = "okay";
 	secure-status = "okay";
-	timeout-sec = <32>;
 };
 
-&rcc{
-	status = "okay";
-	secure-status = "okay";
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
 
-	/* USER CODE BEGIN rcc */
-	/* USER CODE END rcc */
+	nvmem-cell-names = "cfg0_otp",
+			   "part_number_otp",
+			   "monotonic_otp",
+			   "nand_otp",
+			   "uid_otp",
+			   "package_otp",
+			   "hw2_otp",
+			   "pkh_otp",
+			   "board_id";
 };
 
-&rng1{
+&pwr_regulators {
+	system_suspend_supported_soc_modes = <
+		STM32_PM_CSLEEP_RUN
+		STM32_PM_CSTOP_ALLOW_LP_STOP
+		STM32_PM_CSTOP_ALLOW_STANDBY_DDR_SR
+	>;
+	system_off_soc_mode = <STM32_PM_CSTOP_ALLOW_STANDBY_DDR_OFF>;
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
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
+
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
+
+	st,pkcs = <
+		CLK_CKPER_HSE
+		CLK_FMC_ACLK
+		CLK_QSPI_ACLK
+		CLK_ETH_DISABLED
+		CLK_SDMMC12_PLL4P
+		CLK_DSI_DSIPLL
+		CLK_STGEN_HSE
+		CLK_USBPHY_HSE
+		CLK_SPI2S1_PLL3Q
+		CLK_SPI2S23_PLL3Q
+		CLK_SPI45_HSI
+		CLK_SPI6_HSI
+		CLK_I2C46_HSI
+		CLK_SDMMC3_PLL4P
+		CLK_USBO_USBPHY
+		CLK_ADC_CKPER
+		CLK_CEC_LSE
+		CLK_I2C12_HSI
+		CLK_I2C35_HSI
+		CLK_UART1_HSI
+		CLK_UART24_HSI
+		CLK_UART35_HSI
+		CLK_UART6_HSI
+		CLK_UART78_HSI
+		CLK_SPDIF_PLL4P
+		CLK_FDCAN_PLL4R
+		CLK_SAI1_PLL3Q
+		CLK_SAI2_PLL3Q
+		CLK_SAI3_PLL3Q
+		CLK_SAI4_PLL3Q
+		CLK_RNG1_LSI
+		CLK_RNG2_LSI
+		CLK_LPTIM1_PCLK1
+		CLK_LPTIM23_PCLK3
+		CLK_LPTIM45_LSE
+	>;
+
+	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
+	pll2: st,pll@1 {
+		compatible = "st,stm32mp1-pll";
+		reg = <1>;
+		cfg = <2 65 1 0 0 PQR(1,1,1)>;
+		frac = <0x1400>;
+	};
+
+	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
+	pll3: st,pll@2 {
+		compatible = "st,stm32mp1-pll";
+		reg = <2>;
+		cfg = <1 33 1 16 36 PQR(1,1,1)>;
+		frac = <0x1a04>;
+	};
+
+	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
+	pll4: st,pll@3 {
+		compatible = "st,stm32mp1-pll";
+		reg = <3>;
+		cfg = <3 98 5 7 7 PQR(1,1,1)>;
+	};
+};
+
+&rng1 {
 	status = "okay";
 	secure-status = "okay";
 };
 
-&rtc{
+&rtc {
 	status = "okay";
 	secure-status = "okay";
 };
 
-&sdmmc1{
+&sdmmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc1_pins_mx>;
-	status = "okay";
 	disable-wp;
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&v3v3>;
+	status = "okay";
 };
 
-&tamp{
-	status = "okay";
+&timers15 {
 	secure-status = "okay";
-
-	/* USER CODE BEGIN tamp */
-	/* USER CODE END tamp */
+	st,hsi-cal-input = <7>;
+	st,csi-cal-input = <8>;
 };
-
-&uart4{
+&uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_mx>;
 	status = "okay";
 };
 
-&usbotg_hs{
-	status = "okay";
+&usbotg_hs {
 	phys = <&usbphyc_port1 0>;
 	phy-names = "usb2-phy";
 	usb-role-switch;
+	status = "okay";
 };
 
-&usbphyc{
+&usbphyc {
 	status = "okay";
 };
 
-&usbphyc_port0{
+&usbphyc_port0 {
 	phy-supply = <&vdd_usb>;
 };
 
-&usbphyc_port1{
+&usbphyc_port1 {
 	phy-supply = <&vdd_usb>;
 };
 
-&cpu0{
-	cpu-supply = <&vddcore>;
-};
 
-&cpu1{
-	cpu-supply = <&vddcore>;
-};
 
-&pwr_regulators {
-	system_suspend_supported_soc_modes = <
-		STM32_PM_CSLEEP_RUN
-		STM32_PM_CSTOP_ALLOW_LP_STOP
-		STM32_PM_CSTOP_ALLOW_STANDBY_DDR_SR
-	>;
-	system_off_soc_mode = <STM32_PM_CSTOP_ALLOW_STANDBY_DDR_OFF>;
-	vdd-supply = <&vdd>;
-	vdd_3v3_usbfs-supply = <&vdd_usb>;
-};
 
-&nvmem_layout{
-	nvmem-cells = <&cfg0_otp>,
-			<&part_number_otp>,
-			<&monotonic_otp>,
-			<&nand_otp>,
-			<&uid_otp>,
-			<&package_otp>,
-			<&hw2_otp>,
-			<&pkh_otp>,
-			<&board_id>;
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
 
-	nvmem-cell-names = "cfg0_otp",
-			"part_number_otp",
-			"monotonic_otp",
-			"nand_otp",
-			"uid_otp",
-			"package_otp",
-			"hw2_otp",
-			"pkh_otp",
-			"board_id";
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
 };
 
-&timers15{
-	secure-status = "okay";
-	st,hsi-cal-input = <7>;
-	st,csi-cal-input = <8>;
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
 };
diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
index 5f00c2ee55..9a8ec8aa01 100644
--- a/configs/octavo_osd32mp1_brk_defconfig
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a7=y
 # global patch directory
 BR2_GLOBAL_PATCH_DIR="board/octavo/osd32mp1-brk/patches"
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # rootfs overlay
 BR2_ROOTFS_OVERLAY="board/octavo/osd32mp1-brk/overlay/"
@@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/octavo/osd32mp1-brk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.4-stm32mp-r1.1"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.10-stm32mp-r2.1"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/fragment-01-multiv7_cleanup.config $(LINUX_DIR)/arch/arm/configs/fragment-02-multiv7_addons.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -38,11 +38,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2-stm32mp-r2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4-stm32mp-r1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/octavo/osd32mp1-brk/tfa-dts/*"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-osd32mp1-brk.dtb STM32MP_USB_PROGRAMMER=1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-osd32mp1-brk.dtb STM32MP_USB_PROGRAMMER=1 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32 fip.bin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 
 # U-Boot
@@ -50,10 +53,11 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2020.01-stm32mp-r1.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2020.10-stm32mp-r2.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="osd32mp1_brk_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-osd32mp1-brk"
 
 # Package needed to generate the image
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
