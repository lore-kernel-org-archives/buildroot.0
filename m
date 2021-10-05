Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFE4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:52:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC4461216
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 14:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FC4461216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B8183B53;
	Tue,  5 Oct 2021 14:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S5I9ly9MWm5N; Tue,  5 Oct 2021 14:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C50DD83DB9;
	Tue,  5 Oct 2021 14:52:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85DBD1BF215
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76D624086F
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 14:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRXEUlBrYZ5B for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 14:52:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A1364086D
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 14:52:08 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E800720009;
 Tue,  5 Oct 2021 14:52:05 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Tue,  5 Oct 2021 16:52:04 +0200
Message-Id: <20211005145205.27617-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/octavo_osd32mp1_brk_defconfig: Add
 support for octavo brk board
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
and Linux version from ST used by the Octavo constructor.

Reference:
    https://octavosystems.com/octavo_products/osd32mp1-brk/

The device tree blobs come from Octavo System:
    https://github.com/octavosystems/OSD32MP1-BRK-device-tree.git

The uboot patches come from Octavo System:
    https://github.com/octavosystems/BRK_Developer_Package_patches/tree/master/u-boot-v2020.01-stm32mp

It is licensed under BSD 2-Clause.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 DEVELOPERS                                    |    4 +
 board/octavo/brk/genimage.cfg                 |   23 +
 .../linux-dts/stm32mp157c-osd32mp1-brk.dts    | 1167 ++++++++++
 board/octavo/brk/linux.config                 |  841 +++++++
 .../brk/overlay/boot/extlinux/extlinux.conf   |    4 +
 board/octavo/brk/post-image.sh                |   39 +
 board/octavo/brk/tfa-dts/osd32mp1_ddr.dtsi    |  119 +
 .../brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts  |  581 +++++
 .../0006-osd32mpp1-BRK-board-added.patch      | 1989 +++++++++++++++++
 ...2MP1-BRK-features-and-fix-formatting.patch |  976 ++++++++
 .../0008-Fix-missing-DDR-include-file.patch   |  263 +++
 ...x-Cube-programmer-GPIO-default-level.patch |   25 +
 configs/octavo_osd32mp1_brk_defconfig         |   39 +
 13 files changed, 6070 insertions(+)
 create mode 100644 board/octavo/brk/genimage.cfg
 create mode 100644 board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
 create mode 100644 board/octavo/brk/linux.config
 create mode 100644 board/octavo/brk/overlay/boot/extlinux/extlinux.conf
 create mode 100755 board/octavo/brk/post-image.sh
 create mode 100644 board/octavo/brk/tfa-dts/osd32mp1_ddr.dtsi
 create mode 100644 board/octavo/brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
 create mode 100644 board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch
 create mode 100644 board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch
 create mode 100644 board/octavo/brk/uboot-patches/0008-Fix-missing-DDR-include-file.patch
 create mode 100644 board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch
 create mode 100644 configs/octavo_osd32mp1_brk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f977190ab..f0749be912 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1539,6 +1539,10 @@ N:	Koen Martens <gmc@sonologic.nl>
 F:	package/capnproto/
 F:	package/linuxconsoletools/
 
+N:	Kory Maincent <kory.maincent@bootlin.com
+F:	board/octavo/brk/
+F:	configs/octavo_osd32mp1_brk_defconfig
+
 N:	Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 F:	package/bcusdk/
 F:	package/libpthsem/
diff --git a/board/octavo/brk/genimage.cfg b/board/octavo/brk/genimage.cfg
new file mode 100644
index 0000000000..03fba8daf0
--- /dev/null
+++ b/board/octavo/brk/genimage.cfg
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
diff --git a/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts b/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
new file mode 100644
index 0000000000..d763b48945
--- /dev/null
+++ b/board/octavo/brk/linux-dts/stm32mp157c-osd32mp1-brk.dts
@@ -0,0 +1,1167 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (C) Octavo Systems LLC 2020 - All Rights Reserved
+ */
+
+/* For more information on Device Tree configuration, please refer to
+ * https://wiki.st.com/stm32mpu/wiki/Category:Device_tree_configuration
+ */
+
+/dts-v1/;
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp157-m4-srm.dtsi"
+#include <dt-bindings/mfd/st,stpmic1.h>
+#include <dt-bindings/rtc/rtc-stm32.h>
+
+/ {
+	model = "Octavo OSD32MP1 BRK board";
+	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2:mcuram2@10000000{
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0:vdev0vring0@10040000{
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1:vdev0vring1@10041000{
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer:vdev0buffer@10042000{
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram:mcuram@30000000{
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram:retram@38000000{
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved:gpu@da000000{
+			reg = <0xda000000 0x4000000>;
+			no-map;
+		};
+
+		optee_memory:optee@0xde000000{
+			reg = <0xde000000 0x02000000>;
+			no-map;
+			status = "okay";
+		};
+	};
+
+	led{
+		compatible = "gpio-leds";
+
+		red1{
+			label = "LED1_RED";
+			gpios = <&gpioz 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			status = "okay";
+			default-state = "off";
+		};
+
+		green1{
+			label = "LED1_GRN";
+			gpios = <&gpioz 7 GPIO_ACTIVE_LOW>;
+			status = "okay";
+			default-state = "on";
+		};
+
+		red2{
+			label = "LED2_RED";
+			gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+			status = "okay";
+			default-state = "off";
+		};
+
+		green2{
+			label = "LED2_GRN";
+			gpios = <&gpioi 9 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+		};
+	};
+
+	usb_phy_tuning:usb-phy-tuning{
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
+	vin:vin{
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	aliases{
+		serial0 = &uart4;
+    serial2 = &usart2;
+    serial5 = &uart5;
+    serial7 = &uart7;
+    serial1 = &uart8;
+	};
+
+	chosen{
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+
+#ifndef CONFIG_STM32MP1_TRUSTED
+		clk_lsi: clk-lsi {
+			clock-frequency = <32000>;
+		};
+		clk_hsi: clk-hsi {
+			clock-frequency = <64000000>;
+		};
+		clk_csi: clk-csi {
+			clock-frequency = <4000000>;
+		};
+		clk_lse: clk-lse {
+			clock-frequency = <32768>;
+		};
+		clk_hse: clk-hse {
+			clock-frequency = <24000000>;
+		};
+#endif	/*CONFIG_STM32MP1_TRUSTED*/
+	};
+
+}; /*root*/
+
+&pinctrl {
+	u-boot,dm-pre-reloc;
+
+  i2c1_pins_mx: i2c1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, AF5)>, /* I2C1_SCL */
+				 <STM32_PINMUX('H', 12, AF5)>; /* I2C1_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c1_pins_sleep_mx: i2c1-1 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 11, ANALOG)>, /* I2C1_SCL */
+				 <STM32_PINMUX('H', 12, ANALOG)>; /* I2C1_SDA */
+		};
+	};
+
+  i2c2_pins_mx: i2c2-0 {
+    pins {
+      pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
+         <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
+      bias-disable;
+      drive-open-drain;
+      slew-rate = <0>;
+    };
+  };
+
+  i2c2_pins_sleep_mx: i2c2-1 {
+    pins {
+      pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
+         <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
+    };
+  };
+
+  i2c5_pins_mx: i2c5-0 {
+    pins {
+      pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
+         <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
+      bias-disable;
+      drive-open-drain;
+      slew-rate = <0>;
+    };
+  };
+
+  i2c5_pins_sleep_mx: i2c5-1 {
+    pins {
+      pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
+         <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
+    };
+  };
+
+  spi2_pins_mx: spi2-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
+         <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
+      bias-disable;
+      drive-push-pull;
+      slew-rate = <1>;
+    };
+
+    pins2 {
+      pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
+      bias-disable;
+    };
+  };
+
+  spi2_sleep_pins_mx: spi2-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
+         <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
+         <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
+    };
+  };
+
+  spi4_pins_mx: spi4-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+         <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
+      bias-disable;
+      drive-push-pull;
+      slew-rate = <1>;
+    };
+
+    pins2 {
+      pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+      bias-disable;
+    };
+  };
+
+  spi4_sleep_pins_mx: spi4-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
+         <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
+         <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
+    };
+  };
+
+  usart2_pins_mx: usart2-0 {
+      pins1 {
+        pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
+        bias-disable;
+        drive-push-pull;
+        slew-rate = <0>;
+      };
+      pins2 {
+        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
+        bias-disable;
+      };
+    };
+
+    usart2_idle_pins_mx: usart2-idle-0 {
+      pins1 {
+        pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
+      };
+      pins2 {
+        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
+        bias-disable;
+      };
+    };
+
+    usart2_sleep_pins_mx: usart2-sleep-0 {
+      pins {
+        pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
+           <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
+      };
+    };
+
+    uart5_pins_mx: uart5-0 {
+      pins1 {
+        pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
+        bias-disable;
+        drive-push-pull;
+        slew-rate = <0>;
+      };
+      pins2 {
+        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
+        bias-disable;
+      };
+    };
+
+    uart5_idle_pins_mx: uart5-idle-0 {
+      pins1 {
+        pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
+      };
+      pins2 {
+        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
+        bias-disable;
+      };
+    };
+
+    uart5_sleep_pins_mx: uart5-sleep-0 {
+      pins {
+        pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
+           <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
+      };
+    };
+
+    uart7_pins_mx: uart7-0 {
+      pins1 {
+        pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
+        bias-disable;
+        drive-push-pull;
+        slew-rate = <0>;
+      };
+      pins2 {
+        pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
+        bias-disable;
+      };
+    };
+
+  uart7_idle_pins_mx: uart7-idle-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
+    };
+    pins2 {
+      pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
+      bias-disable;
+    };
+  };
+
+  uart7_sleep_pins_mx: uart7-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
+        <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
+    };
+  };
+
+  uart8_pins_mx: uart8-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
+      bias-disable;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+    pins2 {
+      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
+      bias-disable;
+    };
+  };
+
+  uart8_idle_pins_mx: uart8-idle-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
+    };
+    pins2 {
+      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
+      bias-disable;
+    };
+  };
+
+  uart8_sleep_pins_mx: uart8-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
+        <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
+    };
+  };
+
+  m_can1_pins_mx: m-can1-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
+      slew-rate = <0>;
+      drive-push-pull;
+      bias-disable;
+    };
+    pins2 {
+      pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
+      bias-disable;
+    };
+  };
+
+  m_can1_sleep_pins_mx: m_can1-sleep@0 {
+    pins {
+      pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
+        <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
+    };
+  };
+
+  pwm1_pins_mx: pwm1-0 {
+    pins {
+      pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
+      bias-pull-down;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+  };
+
+  pwm1_sleep_pins_mx: pwm1-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
+    };
+  };
+
+  pwm3_pins_mx: pwm3-0 {
+    pins {
+      pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
+      bias-pull-down;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+  };
+
+  pwm3_sleep_pins_mx: pwm3-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
+    };
+  };
+
+  pwm4_pins_mx: pwm4-0 {
+    pins {
+      pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
+      bias-pull-down;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+  };
+
+  pwm4_sleep_pins_mx: pwm4-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
+    };
+  };
+
+  pwm8_pins_mx: pwm8-0 {
+    pins {
+      pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
+      bias-pull-down;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+  };
+
+  pwm8_sleep_pins_mx: pwm8-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
+    };
+  };
+
+
+  pwm12_pins_mx: pwm12-0 {
+    pins {
+      pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
+      bias-pull-down;
+      drive-push-pull;
+      slew-rate = <0>;
+    };
+  };
+
+  pwm12_sleep_pins_mx: pwm12-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
+    };
+  };
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
+			slew-rate = <2>;
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
+			slew-rate = <2>;
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
+	uart4_pins_mx: uart4_mx-0 {
+		u-boot,dm-pre-reloc;
+		pins1 {
+			u-boot,dm-pre-reloc;
+			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+      /* pull-up on rx to avoid floating level */
+      bias-pull-up;
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
+};
+
+&pinctrl_z {
+	u-boot,dm-pre-reloc;
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
+  spi6_pins_mx: spi6-0 {
+    pins1 {
+      pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
+         <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
+      bias-disable;
+      drive-push-pull;
+      slew-rate = <1>;
+    };
+
+    pins2 {
+      pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
+      bias-disable;
+    };
+  };
+
+  spi6_sleep_pins_mx: spi6-sleep-0 {
+    pins {
+      pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
+         <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
+         <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
+    };
+  };
+};
+
+&m4_rproc{
+	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	status = "okay";
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	wakeup-source;
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&bsec{
+	status = "okay";
+};
+
+&crc1{
+	status = "okay";
+};
+
+&cryp1{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&dma1{
+	status = "okay";
+	sram = <&dma_pool>;
+};
+
+&dma2{
+	status = "okay";
+	sram = <&dma_pool>;
+};
+
+&dmamux1{
+
+	dma-masters = <&dma1 &dma2>;
+	dma-channels = <16>;
+
+	status = "okay";
+};
+
+&dts{
+	status = "okay";
+};
+
+&gpu{
+	status = "okay";
+	contiguous-area = <&gpu_reserved>;
+};
+
+&hash1{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&hsem{
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_mx>;
+	pinctrl-1 = <&i2c1_pins_sleep_mx>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_mx>;
+	pinctrl-1 = <&i2c2_pins_sleep_mx>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c5 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c5_pins_mx>;
+	pinctrl-1 = <&i2c5_pins_sleep_mx>;
+	i2c-scl-rising-time-ns = <100>;
+	i2c-scl-falling-time-ns = <7>;
+	status = "okay";
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c4{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c4_pins_z_mx>;
+	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
+	status = "okay";
+
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+
+	pmic:stpmic@33{
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+
+		regulators{
+			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
+			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&vin>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
+			ldo5-supply = <&vin>;
+			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore:buck1{
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd_ddr:buck2{
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			vdd:buck3{
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+			};
+
+			v3v3:buck4{
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+			};
+
+			v1v8_audio:ldo1{
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO1 0>;
+			};
+
+			v3v3_hdmi:ldo2{
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO2 0>;
+			};
+
+			vtt_ddr:ldo3{
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			vdd_usb:ldo4{
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				interrupts = <IT_CURLIM_LDO4 0>;
+				regulator-always-on;
+			};
+
+			vdda:ldo5{
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				interrupts = <IT_CURLIM_LDO5 0>;
+				regulator-boot-on;
+			};
+
+			v1v2_hdmi:ldo6{
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				interrupts = <IT_CURLIM_LDO6 0>;
+			};
+
+			vref_ddr:vref_ddr{
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+			};
+
+			bst_out:boost{
+				regulator-name = "bst_out";
+				interrupts = <IT_OCP_BOOST 0>;
+			};
+
+			vbus_otg:pwr_sw1{
+				regulator-name = "vbus_otg";
+				interrupts = <IT_OCP_OTG 0>;
+			};
+
+			vbus_sw:pwr_sw2{
+				regulator-name = "vbus_sw";
+				interrupts = <IT_OCP_SWOUT 0>;
+				regulator-active-discharge = <1>;
+			};
+		};
+
+		onkey{
+			compatible = "st,stpmic1-onkey";
+			interrupts = <IT_PONKEY_F 0>, <IT_PONKEY_R 0>;
+			interrupt-names = "onkey-falling", "onkey-rising";
+			power-off-time-sec = <10>;
+			status = "okay";
+		};
+
+		watchdog {
+			compatible = "st,stpmic1-wdt";
+			status = "disabled";
+		};
+	};
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&ipcc{
+	status = "okay";
+};
+
+&iwdg2{
+	status = "okay";
+	timeout-sec = <32>;
+};
+
+&mdma1{
+	status = "okay";
+};
+
+&rcc{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&rng1{
+	status = "okay";
+};
+
+&rtc{
+	status = "okay";
+};
+
+&sdmmc1{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_pins_mx>;
+	pinctrl-1 = <&sdmmc1_opendrain_pins_mx>;
+	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
+	status = "okay";
+
+	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+};
+
+&tamp{
+	status = "okay";
+};
+
+&uart4{
+	u-boot,dm-pre-reloc;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&uart4_pins_mx>;
+	pinctrl-1 = <&uart4_sleep_pins_mx>;
+	status = "okay";
+
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+};
+
+&usbh_ehci{
+	status = "okay";
+	phys = <&usbphyc_port0>;
+};
+
+&usbh_ohci{
+	status = "okay";
+};
+
+&usbotg_hs{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+};
+
+&usbphyc{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&usbphyc_port0{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	phy-supply = <&vdd_usb>;
+	st,phy-tuning = <&usb_phy_tuning>;
+};
+
+&usbphyc_port1{
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	phy-supply = <&vdd_usb>;
+	st,phy-tuning = <&usb_phy_tuning>;
+};
+
+&adc {
+  vdd-supply = <&vdd>;
+  vdda-supply = <&vdda>;
+  vref-supply = <&vdda>;
+	status = "okay";
+  adc1: adc@0 {
+    st,min-sample-time-nsecs = <5000>;
+    st,adc-channels = <0 1>;
+    status = "okay";
+  };
+
+  adc2: adc@100 {
+    status = "okay";
+  };
+
+  adc_temp: temp {
+    status = "okay";
+  };
+};
+
+&usbh_ohci{
+	phys = <&usbphyc_port0>;
+};
+
+&cpu0{
+	cpu-supply = <&vddcore>;
+};
+
+&cpu1{
+	cpu-supply = <&vddcore>;
+};
+
+&sram{
+	dma_pool:dma_pool@0{
+		reg = <0x50000 0x10000>;
+		pool;
+	};
+};
+
+&optee{
+	status = "okay";
+};
+
+&spi2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi2_pins_mx>;
+	pinctrl-1 = <&spi2_sleep_pins_mx>;
+  cs-gpios = <&gpioi 0 0>;
+	status = "okay";
+
+  spidev2: spidev2@0{
+    compatible = "rohm,dh2228fv";
+    spi-max-frequency = <30000000>;
+    reg = <0>;
+  };
+};
+
+&spi4 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi4_pins_mx>;
+	pinctrl-1 = <&spi4_sleep_pins_mx>;
+  cs-gpios = <&gpioe 11 0>;
+	status = "okay";
+
+  spidev4: spidev4@0{
+    compatible = "rohm,dh2228fv";
+    spi-max-frequency = <30000000>;
+    reg = <0>;
+  };
+};
+
+&spi6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi6_pins_mx>;
+	pinctrl-1 = <&spi6_sleep_pins_mx>;
+  cs-gpios = <&gpioz 3 0>;
+	status = "okay";
+
+  spidev6: spidev6@0{
+    compatible = "rohm,dh2228fv";
+    spi-max-frequency = <30000000>;
+    reg = <0>;
+  };
+};
+
+&usart2 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart2_pins_mx>;
+	pinctrl-1 = <&usart2_sleep_pins_mx>;
+	pinctrl-2 = <&usart2_idle_pins_mx>;
+	status = "okay";
+};
+
+&uart5 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart5_pins_mx>;
+	pinctrl-1 = <&uart5_sleep_pins_mx>;
+	pinctrl-2 = <&uart5_idle_pins_mx>;
+	status = "okay";
+};
+
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_mx>;
+	pinctrl-1 = <&uart7_sleep_pins_mx>;
+	pinctrl-2 = <&uart7_idle_pins_mx>;
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart8_pins_mx>;
+	pinctrl-1 = <&uart8_sleep_pins_mx>;
+	pinctrl-2 = <&uart8_idle_pins_mx>;
+	status = "okay";
+};
+
+&m_can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&m_can1_pins_mx>;
+	status = "okay";
+  can-transceiver {
+    max-bitrate = <5000000>;
+  };
+};
+
+&timers1 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm1: pwm {
+    pinctrl-names = "default", "sleep";
+	  pinctrl-0 = <&pwm1_pins_mx>;
+	  pinctrl-1 = <&pwm1_sleep_pins_mx>;
+		status = "okay";
+	};
+};
+
+&timers3 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm3: pwm {
+    pinctrl-names = "default", "sleep";
+	  pinctrl-0 = <&pwm3_pins_mx>;
+	  pinctrl-1 = <&pwm3_sleep_pins_mx>;
+		status = "okay";
+	};
+};
+
+&timers4 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm4: pwm {
+    pinctrl-names = "default", "sleep";
+	  pinctrl-0 = <&pwm4_pins_mx>;
+	  pinctrl-1 = <&pwm4_sleep_pins_mx>;
+		status = "okay";
+	};
+};
+
+&timers8 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm8: pwm {
+    pinctrl-names = "default", "sleep";
+	  pinctrl-0 = <&pwm8_pins_mx>;
+	  pinctrl-1 = <&pwm8_sleep_pins_mx>;
+		status = "okay";
+	};
+};
+
+&timers12 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	pwm12: pwm {
+    pinctrl-names = "default", "sleep";
+	  pinctrl-0 = <&pwm12_pins_mx>;
+	  pinctrl-1 = <&pwm12_sleep_pins_mx>;
+		status = "okay";
+	};
+};
diff --git a/board/octavo/brk/linux.config b/board/octavo/brk/linux.config
new file mode 100644
index 0000000000..1a5a088de0
--- /dev/null
+++ b/board/octavo/brk/linux.config
@@ -0,0 +1,841 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_NAMESPACES=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EMBEDDED=y
+CONFIG_PROFILING=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_MACH_ASPEED_G6=y
+CONFIG_ARCH_MILBEAUT=y
+CONFIG_ARCH_MILBEAUT_M10V=y
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
+CONFIG_SMP=y
+CONFIG_SCHED_MC=y
+CONFIG_MCPM=y
+CONFIG_NR_CPUS=2
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+# CONFIG_ATAGS is not set
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+CONFIG_CPU_FREQ_GOV_USERSPACE=m
+CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
+CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
+CONFIG_CPUFREQ_DT=y
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_STM32_CPUIDLE=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+CONFIG_TRUSTED_FOUNDATIONS=y
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
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
+CONFIG_IPV6_ROUTER_PREF=y
+CONFIG_IPV6_OPTIMISTIC_DAD=y
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_IPV6_TUNNEL=m
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NET_DSA=m
+CONFIG_CAN=y
+CONFIG_CAN_FLEXCAN=m
+CONFIG_CAN_M_CAN=y
+CONFIG_CAN_M_CAN_PLATFORM=y
+CONFIG_BT=m
+CONFIG_BT_HCIUART=m
+CONFIG_BT_HCIUART_BCM=y
+CONFIG_BT_MRVL=m
+CONFIG_BT_MRVL_SDIO=m
+CONFIG_CFG80211=m
+CONFIG_MAC80211=m
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=y
+CONFIG_NFC=m
+CONFIG_NFC_DIGITAL=m
+CONFIG_NFC_NCI=m
+CONFIG_NFC_NCI_SPI=m
+CONFIG_NFC_NCI_UART=m
+CONFIG_NFC_HCI=m
+CONFIG_NFC_SHDLC=y
+CONFIG_NFC_S3FWRN5_I2C=m
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BRCMSTB_GISB_ARB=y
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_VEXPRESS_CONFIG=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_CFI=y
+CONFIG_MTD_CFI_INTELEXT=y
+CONFIG_MTD_PHYSMAP=y
+CONFIG_MTD_PHYSMAP_OF=y
+CONFIG_MTD_MCHP23K256=m
+CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_DENALI_DT=y
+CONFIG_MTD_NAND_BRCMNAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_SPI_ASPEED_SMC=m
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
+CONFIG_EEPROM_AT24=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_B53_SPI_DRIVER=m
+CONFIG_B53_MDIO_DRIVER=m
+CONFIG_B53_MMAP_DRIVER=m
+CONFIG_B53_SRAB_DRIVER=m
+CONFIG_B53_SERDES=m
+CONFIG_NET_DSA_BCM_SF2=m
+CONFIG_BCMGENET=m
+CONFIG_SYSTEMPORT=m
+CONFIG_MACB=y
+CONFIG_FTGMAC100=m
+CONFIG_HIX5HD2_GMAC=y
+CONFIG_MVMDIO=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_BROADCOM_PHY=y
+CONFIG_ICPLUS_PHY=y
+CONFIG_MARVELL_PHY=y
+CONFIG_MICREL_PHY=y
+CONFIG_AT803X_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_ROCKCHIP_PHY=y
+CONFIG_MDIO_BITBANG=y
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
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_QT1070=m
+CONFIG_KEYBOARD_GPIO=y
+CONFIG_KEYBOARD_SAMSUNG=m
+CONFIG_KEYBOARD_BCM=y
+CONFIG_MOUSE_PS2_ELANTECH=y
+CONFIG_MOUSE_CYAPA=m
+CONFIG_MOUSE_ELAN_I2C=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ADC=m
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
+CONFIG_TOUCHSCREEN_GOODIX=y
+CONFIG_TOUCHSCREEN_ELAN=m
+CONFIG_TOUCHSCREEN_MMS114=m
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_TOUCHSCREEN_ST1232=m
+CONFIG_TOUCHSCREEN_STMPE=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_MAX77693_HAPTIC=m
+CONFIG_INPUT_MAX8997_HAPTIC=m
+CONFIG_INPUT_CPCAP_PWRBUTTON=m
+CONFIG_INPUT_AXP20X_PEK=m
+CONFIG_INPUT_DA9063_ONKEY=m
+CONFIG_INPUT_ADXL34X=m
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=8
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_NONSTANDARD=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_ASPEED_KCS_IPMI_BMC=m
+CONFIG_ASPEED_BT_IPMI_BMC=m
+CONFIG_HW_RANDOM=y
+CONFIG_TCG_TPM=m
+CONFIG_TCG_TIS_I2C_INFINEON=m
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_ARB_GPIO_CHALLENGE=m
+CONFIG_I2C_MUX_PCA954x=y
+CONFIG_I2C_MUX_PINCTRL=y
+CONFIG_I2C_DEMUX_PINCTRL=y
+CONFIG_I2C_ASPEED=m
+CONFIG_I2C_NOMADIK=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_CADENCE=y
+CONFIG_SPI_GPIO=m
+CONFIG_SPI_PL022=y
+CONFIG_SPI_ROCKCHIP=m
+CONFIG_SPI_STM32=m
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_SPI_XILINX=y
+CONFIG_SPI_SPIDEV=y
+CONFIG_SPMI=y
+CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_PINCTRL_PALMAS=y
+CONFIG_GPIO_ASPEED_SGPIO=y
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
+CONFIG_BATTERY_ACT8945A=y
+CONFIG_BATTERY_CPCAP=m
+CONFIG_BATTERY_SBS=y
+CONFIG_BATTERY_BQ27XXX=m
+CONFIG_AXP20X_POWER=m
+CONFIG_BATTERY_MAX17040=m
+CONFIG_BATTERY_MAX17042=m
+CONFIG_CHARGER_GPIO=m
+CONFIG_CHARGER_MAX14577=m
+CONFIG_CHARGER_MAX77693=m
+CONFIG_CHARGER_MAX8997=m
+CONFIG_CHARGER_MAX8998=m
+CONFIG_CHARGER_TPS65090=y
+CONFIG_SENSORS_ASPEED=m
+CONFIG_SENSORS_IIO_HWMON=y
+CONFIG_SENSORS_LM90=y
+CONFIG_SENSORS_LM95245=y
+CONFIG_SENSORS_NTC_THERMISTOR=m
+CONFIG_SENSORS_PWM_FAN=m
+CONFIG_SENSORS_INA2XX=m
+CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
+CONFIG_ST_THERMAL_MEMMAP=y
+CONFIG_WATCHDOG_NOWAYOUT=y
+CONFIG_WATCHDOG_SYSFS=y
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
+CONFIG_MFD_WM8994=m
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ACT8865=y
+CONFIG_REGULATOR_ACT8945A=y
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
+CONFIG_REGULATOR_MAX8952=m
+CONFIG_REGULATOR_MAX8973=y
+CONFIG_REGULATOR_MAX8997=m
+CONFIG_REGULATOR_MAX8998=m
+CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_MAX77693=m
+CONFIG_REGULATOR_MAX77802=y
+CONFIG_REGULATOR_PALMAS=y
+CONFIG_REGULATOR_PWM=y
+CONFIG_REGULATOR_RK808=y
+CONFIG_REGULATOR_RN5T618=y
+CONFIG_REGULATOR_S2MPA01=m
+CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_S5M8767=y
+CONFIG_REGULATOR_STM32_BOOSTER=m
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
+CONFIG_CEC_STM32=m
+CONFIG_MEDIA_SUPPORT=m
+# CONFIG_DVB_NET is not set
+# CONFIG_DVB_DYNAMIC_MINORS is not set
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=m
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_ASPEED=m
+CONFIG_VIDEO_STM32_DCMI=m
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIDEO_VIVID=m
+CONFIG_VIDEO_ADV7180=m
+CONFIG_VIDEO_ADV7604=m
+CONFIG_VIDEO_ADV7604_CEC=y
+CONFIG_VIDEO_ML86V7667=m
+CONFIG_VIDEO_ST_MIPID02=m
+CONFIG_VIDEO_OV5640=m
+CONFIG_VIDEO_OV7670=m
+# CONFIG_CXD2880_SPI_DRV is not set
+# CONFIG_MEDIA_TUNER_SIMPLE is not set
+# CONFIG_MEDIA_TUNER_TDA18250 is not set
+# CONFIG_MEDIA_TUNER_TDA8290 is not set
+# CONFIG_MEDIA_TUNER_TDA827X is not set
+# CONFIG_MEDIA_TUNER_TDA18271 is not set
+# CONFIG_MEDIA_TUNER_TDA9887 is not set
+# CONFIG_MEDIA_TUNER_TEA5761 is not set
+# CONFIG_MEDIA_TUNER_TEA5767 is not set
+# CONFIG_MEDIA_TUNER_MSI001 is not set
+# CONFIG_MEDIA_TUNER_MT20XX is not set
+# CONFIG_MEDIA_TUNER_MT2060 is not set
+# CONFIG_MEDIA_TUNER_MT2063 is not set
+# CONFIG_MEDIA_TUNER_MT2266 is not set
+# CONFIG_MEDIA_TUNER_MT2131 is not set
+# CONFIG_MEDIA_TUNER_QT1010 is not set
+# CONFIG_MEDIA_TUNER_XC2028 is not set
+# CONFIG_MEDIA_TUNER_XC5000 is not set
+# CONFIG_MEDIA_TUNER_XC4000 is not set
+# CONFIG_MEDIA_TUNER_MXL5005S is not set
+# CONFIG_MEDIA_TUNER_MXL5007T is not set
+# CONFIG_MEDIA_TUNER_MC44S803 is not set
+# CONFIG_MEDIA_TUNER_MAX2165 is not set
+# CONFIG_MEDIA_TUNER_TDA18218 is not set
+# CONFIG_MEDIA_TUNER_FC0011 is not set
+# CONFIG_MEDIA_TUNER_FC0012 is not set
+# CONFIG_MEDIA_TUNER_FC0013 is not set
+# CONFIG_MEDIA_TUNER_TDA18212 is not set
+# CONFIG_MEDIA_TUNER_E4000 is not set
+# CONFIG_MEDIA_TUNER_FC2580 is not set
+# CONFIG_MEDIA_TUNER_M88RS6000T is not set
+# CONFIG_MEDIA_TUNER_TUA9001 is not set
+# CONFIG_MEDIA_TUNER_SI2157 is not set
+# CONFIG_MEDIA_TUNER_IT913X is not set
+# CONFIG_MEDIA_TUNER_R820T is not set
+# CONFIG_MEDIA_TUNER_MXL301RF is not set
+# CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
+# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
+# CONFIG_DVB_STB0899 is not set
+# CONFIG_DVB_STB6100 is not set
+# CONFIG_DVB_STV090x is not set
+# CONFIG_DVB_STV0910 is not set
+# CONFIG_DVB_STV6110x is not set
+# CONFIG_DVB_STV6111 is not set
+# CONFIG_DVB_MXL5XX is not set
+# CONFIG_DVB_M88DS3103 is not set
+# CONFIG_DVB_DRXK is not set
+# CONFIG_DVB_TDA18271C2DD is not set
+# CONFIG_DVB_SI2165 is not set
+# CONFIG_DVB_MN88472 is not set
+# CONFIG_DVB_MN88473 is not set
+# CONFIG_DVB_CX24110 is not set
+# CONFIG_DVB_CX24123 is not set
+# CONFIG_DVB_MT312 is not set
+# CONFIG_DVB_ZL10036 is not set
+# CONFIG_DVB_ZL10039 is not set
+# CONFIG_DVB_S5H1420 is not set
+# CONFIG_DVB_STV0288 is not set
+# CONFIG_DVB_STB6000 is not set
+# CONFIG_DVB_STV0299 is not set
+# CONFIG_DVB_STV6110 is not set
+# CONFIG_DVB_STV0900 is not set
+# CONFIG_DVB_TDA8083 is not set
+# CONFIG_DVB_TDA10086 is not set
+# CONFIG_DVB_TDA8261 is not set
+# CONFIG_DVB_VES1X93 is not set
+# CONFIG_DVB_TUNER_ITD1000 is not set
+# CONFIG_DVB_TUNER_CX24113 is not set
+# CONFIG_DVB_TDA826X is not set
+# CONFIG_DVB_TUA6100 is not set
+# CONFIG_DVB_CX24116 is not set
+# CONFIG_DVB_CX24117 is not set
+# CONFIG_DVB_CX24120 is not set
+# CONFIG_DVB_SI21XX is not set
+# CONFIG_DVB_TS2020 is not set
+# CONFIG_DVB_DS3000 is not set
+# CONFIG_DVB_MB86A16 is not set
+# CONFIG_DVB_TDA10071 is not set
+# CONFIG_DVB_SP8870 is not set
+# CONFIG_DVB_SP887X is not set
+# CONFIG_DVB_CX22700 is not set
+# CONFIG_DVB_CX22702 is not set
+# CONFIG_DVB_S5H1432 is not set
+# CONFIG_DVB_DRXD is not set
+# CONFIG_DVB_L64781 is not set
+# CONFIG_DVB_TDA1004X is not set
+# CONFIG_DVB_NXT6000 is not set
+# CONFIG_DVB_MT352 is not set
+# CONFIG_DVB_ZL10353 is not set
+# CONFIG_DVB_DIB3000MB is not set
+# CONFIG_DVB_DIB3000MC is not set
+# CONFIG_DVB_DIB7000M is not set
+# CONFIG_DVB_DIB7000P is not set
+# CONFIG_DVB_DIB9000 is not set
+# CONFIG_DVB_TDA10048 is not set
+# CONFIG_DVB_AF9013 is not set
+# CONFIG_DVB_EC100 is not set
+# CONFIG_DVB_STV0367 is not set
+# CONFIG_DVB_CXD2820R is not set
+# CONFIG_DVB_CXD2841ER is not set
+# CONFIG_DVB_RTL2830 is not set
+# CONFIG_DVB_RTL2832 is not set
+# CONFIG_DVB_RTL2832_SDR is not set
+# CONFIG_DVB_SI2168 is not set
+# CONFIG_DVB_ZD1301_DEMOD is not set
+# CONFIG_DVB_CXD2880 is not set
+# CONFIG_DVB_VES1820 is not set
+# CONFIG_DVB_TDA10021 is not set
+# CONFIG_DVB_TDA10023 is not set
+# CONFIG_DVB_STV0297 is not set
+# CONFIG_DVB_NXT200X is not set
+# CONFIG_DVB_OR51211 is not set
+# CONFIG_DVB_OR51132 is not set
+# CONFIG_DVB_BCM3510 is not set
+# CONFIG_DVB_LGDT330X is not set
+# CONFIG_DVB_LGDT3305 is not set
+# CONFIG_DVB_LGDT3306A is not set
+# CONFIG_DVB_LG2160 is not set
+# CONFIG_DVB_S5H1409 is not set
+# CONFIG_DVB_AU8522_DTV is not set
+# CONFIG_DVB_AU8522_V4L is not set
+# CONFIG_DVB_S5H1411 is not set
+# CONFIG_DVB_S921 is not set
+# CONFIG_DVB_DIB8000 is not set
+# CONFIG_DVB_MB86A20S is not set
+# CONFIG_DVB_TC90522 is not set
+# CONFIG_DVB_MN88443X is not set
+# CONFIG_DVB_PLL is not set
+# CONFIG_DVB_TUNER_DIB0070 is not set
+# CONFIG_DVB_TUNER_DIB0090 is not set
+# CONFIG_DVB_DRX39XYJ is not set
+# CONFIG_DVB_LNBH25 is not set
+# CONFIG_DVB_LNBH29 is not set
+# CONFIG_DVB_LNBP21 is not set
+# CONFIG_DVB_LNBP22 is not set
+# CONFIG_DVB_ISL6405 is not set
+# CONFIG_DVB_ISL6421 is not set
+# CONFIG_DVB_ISL6423 is not set
+# CONFIG_DVB_A8293 is not set
+# CONFIG_DVB_LGS8GL5 is not set
+# CONFIG_DVB_LGS8GXX is not set
+# CONFIG_DVB_ATBM8830 is not set
+# CONFIG_DVB_TDA665x is not set
+# CONFIG_DVB_IX2505V is not set
+# CONFIG_DVB_M88RS2000 is not set
+# CONFIG_DVB_AF9033 is not set
+# CONFIG_DVB_HORUS3A is not set
+# CONFIG_DVB_ASCOT2E is not set
+# CONFIG_DVB_HELENE is not set
+# CONFIG_DVB_CXD2099 is not set
+# CONFIG_DVB_SP2 is not set
+CONFIG_IMX_IPUV3_CORE=m
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
+CONFIG_DRM_NXP_PTN3460=m
+CONFIG_DRM_PARADE_PS8622=m
+CONFIG_DRM_SII902X=y
+CONFIG_DRM_SII9234=m
+CONFIG_DRM_SIMPLE_BRIDGE=m
+CONFIG_DRM_TOSHIBA_TC358764=m
+CONFIG_DRM_I2C_ADV7511=y
+CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_STI=m
+CONFIG_DRM_IMX=m
+CONFIG_DRM_IMX_PARALLEL_DISPLAY=m
+CONFIG_DRM_IMX_TVE=m
+CONFIG_DRM_IMX_LDB=m
+CONFIG_DRM_IMX_HDMI=m
+CONFIG_DRM_MXSFB=m
+CONFIG_DRM_PL111=m
+CONFIG_DRM_LIMA=m
+CONFIG_DRM_PANFROST=m
+CONFIG_DRM_ASPEED_GFX=m
+CONFIG_DRM_LEGACY=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_SIMPLE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_BACKLIGHT_AS3711=y
+CONFIG_BACKLIGHT_GPIO=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_SND_USB_AUDIO=m
+CONFIG_SND_SOC=m
+CONFIG_SND_ATMEL_SOC=m
+CONFIG_SND_SOC_FSL_SAI=m
+CONFIG_SND_SOC_STM32_SAI=m
+CONFIG_SND_SOC_STM32_I2S=m
+CONFIG_SND_SOC_STM32_SPDIFRX=m
+CONFIG_SND_SOC_STM32_DFSDM=m
+CONFIG_SND_SOC_AK4642=m
+CONFIG_SND_SOC_CPCAP=m
+CONFIG_SND_SOC_CS42L51_I2C=m
+CONFIG_SND_SOC_RT5631=m
+CONFIG_SND_SOC_SGTL5000=m
+CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SOC_TLV320AIC23_I2C=m
+CONFIG_SND_SOC_TS3A227E=m
+CONFIG_SND_SOC_WM8753=m
+CONFIG_SND_SOC_WM8903=m
+CONFIG_SND_SOC_WM8904=m
+CONFIG_SND_SOC_WM8978=m
+CONFIG_SND_SOC_WM8994=m
+CONFIG_SND_SIMPLE_CARD=m
+CONFIG_SND_AUDIO_GRAPH_CARD=m
+CONFIG_USB_CONN_GPIO=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_R8A66597_HCD=m
+CONFIG_USB_ACM=m
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
+CONFIG_USB_ASPEED_VHUB=m
+CONFIG_USB_CONFIGFS=m
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
+CONFIG_TYPEC=m
+CONFIG_TYPEC_STUSB160X=m
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
+CONFIG_LEDS_TRIGGER_AUDIO=m
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
+CONFIG_RTC_DRV_PCF85363=m
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
+CONFIG_RTC_DRV_PL031=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_RTC_DRV_CPCAP=m
+CONFIG_RTC_DRV_ASPEED=m
+CONFIG_DMADEVICES=y
+CONFIG_FSL_EDMA=y
+CONFIG_PL330_DMA=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_DW_DMAC=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_COMMON_CLK_MAX77686=y
+CONFIG_COMMON_CLK_RK808=m
+CONFIG_COMMON_CLK_SCMI=y
+CONFIG_COMMON_CLK_S2MPS11=m
+CONFIG_CLK_QORIQ=y
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_CLKSRC_STM32_LP=y
+CONFIG_ARM_SMC_MBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_REMOTEPROC_SRM_CORE=y
+CONFIG_REMOTEPROC_SRM_DEV=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_TTY=m
+CONFIG_ASPEED_LPC_CTRL=m
+CONFIG_ASPEED_LPC_SNOOP=m
+CONFIG_ASPEED_P2A_CTRL=m
+CONFIG_DEVFREQ_GOV_PASSIVE=m
+CONFIG_PM_DEVFREQ_EVENT=y
+CONFIG_EXTCON_MAX14577=m
+CONFIG_EXTCON_MAX77693=m
+CONFIG_EXTCON_MAX8997=m
+CONFIG_MEMORY=y
+CONFIG_STM32_FMC2_EBI=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_ASPEED_ADC=m
+CONFIG_CPCAP_ADC=m
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=m
+CONFIG_STM32_ADC=m
+CONFIG_STM32_DFSDM_ADC=m
+CONFIG_VF610_ADC=m
+CONFIG_XILINX_XADC=y
+CONFIG_STM32_DAC=m
+CONFIG_MPU3050_I2C=y
+CONFIG_CM36651=m
+CONFIG_SENSORS_ISL29018=y
+CONFIG_SENSORS_ISL29028=y
+CONFIG_AK8975=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=m
+CONFIG_PWM=y
+CONFIG_PWM_ATMEL_HLCDC_PWM=m
+CONFIG_PWM_FSL_FTM=m
+CONFIG_PWM_STM32=m
+CONFIG_PWM_STM32_LP=m
+CONFIG_RESET_BRCMSTB_RESCAL=y
+CONFIG_PHY_CPCAP_USB=m
+CONFIG_PHY_SAMSUNG_USB2=m
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_FSI=m
+CONFIG_FSI_MASTER_GPIO=m
+CONFIG_FSI_MASTER_HUB=m
+CONFIG_FSI_MASTER_ASPEED=m
+CONFIG_FSI_SCOM=m
+CONFIG_FSI_SBEFIFO=m
+CONFIG_FSI_OCC=m
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_COUNTER=m
+CONFIG_STM32_TIMER_CNT=m
+CONFIG_STM32_LPTIMER_CNT=m
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_OVERLAY_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_NTFS_FS=y
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
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_NFS_V4_1=y
+CONFIG_NFS_V4_2=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+CONFIG_CRYPTO_USER=m
+CONFIG_CRYPTO_XTS=m
+CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
+CONFIG_CRYPTO_USER_API_AEAD=m
+CONFIG_CRYPTO_DEV_STM32_CRC=m
+CONFIG_CRYPTO_DEV_STM32_HASH=m
+CONFIG_CRYPTO_DEV_STM32_CRYP=m
+CONFIG_CRYPTO_DEV_AMLOGIC_GXL=m
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DEBUG_INFO=y
+CONFIG_GDB_SCRIPTS=y
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_DEBUG_SECTION_MISMATCH=y
+# CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
+# CONFIG_SCHED_DEBUG is not set
+CONFIG_SAMPLES=y
+CONFIG_SAMPLE_RPMSG_CLIENT=m
diff --git a/board/octavo/brk/overlay/boot/extlinux/extlinux.conf b/board/octavo/brk/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..025eff9354
--- /dev/null
+++ b/board/octavo/brk/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp157c-dk2-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp157c-osd32mp1-brk.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/octavo/brk/post-image.sh b/board/octavo/brk/post-image.sh
new file mode 100755
index 0000000000..fc2fbd1134
--- /dev/null
+++ b/board/octavo/brk/post-image.sh
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
diff --git a/board/octavo/brk/tfa-dts/osd32mp1_ddr.dtsi b/board/octavo/brk/tfa-dts/osd32mp1_ddr.dtsi
new file mode 100644
index 0000000000..e8c9eebfc6
--- /dev/null
+++ b/board/octavo/brk/tfa-dts/osd32mp1_ddr.dtsi
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
+ * Save Date: 2020.08.27, save Time: 15:22:11
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
+#define DDR_DX0DQTR 0x00112121
+#define DDR_DX0DQSTR 0x3D200000
+#define DDR_DX1GCR 0x0000CE81
+#define DDR_DX1DLLCR 0x40000000
+#define DDR_DX1DQTR 0x11100121
+#define DDR_DX1DQSTR 0x3D200000
+#define DDR_DX2GCR 0x0000CE80
+#define DDR_DX2DLLCR 0x40000000
+#define DDR_DX2DQTR 0xFFFFFFFF
+#define DDR_DX2DQSTR 0x3DB02000
+#define DDR_DX3GCR 0x0000CE80
+#define DDR_DX3DLLCR 0x40000000
+#define DDR_DX3DQTR 0xFFFFFFFF
+#define DDR_DX3DQSTR 0x3DB02000
diff --git a/board/octavo/brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts b/board/octavo/brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
new file mode 100644
index 0000000000..1820c60160
--- /dev/null
+++ b/board/octavo/brk/tfa-dts/stm32mp157c-osd32mp1-brk.dts
@@ -0,0 +1,581 @@
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
+#include <dt-bindings/pinctrl/stm32-pinfunc.h>
+#include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include <dt-bindings/soc/st,stm32-etzpc.h>
+#include <dt-bindings/power/stm32mp1-power.h>
+
+#include "osd32mp1_ddr.dtsi"
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+#include "stm32mp15-ddr.dtsi"
+
+/ {
+	model = "Octavo OSD32MP1 BRK board";
+	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
+
+	memory@c0000000{
+		device_type = "memory";
+		reg = <0xc0000000 0x20000000>;
+	};
+
+	vin:vin{
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	aliases{
+		serial0 = &uart4;
+	};
+
+	chosen{
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		clk_lse: clk-lse {
+			st,drive = < LSEDRV_MEDIUM_HIGH >;
+		};
+	};
+
+};
+
+&clk_hse {
+	st,digbypass;
+};
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
+	/* USER CODE BEGIN pinctrl */
+	/* USER CODE END pinctrl */
+};
+
+&pinctrl_z {
+	i2c4_pins_z_mx: i2c4_mx-0 {
+		pins {
+			pinmux = <STM32_PINMUX('Z', 4, AF6)>, /* I2C4_SCL */
+					 <STM32_PINMUX('Z', 5, AF6)>; /* I2C4_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	/* USER CODE BEGIN pinctrl_z */
+	/* USER CODE END pinctrl_z */
+};
+
+&rcc {
+	st,hsi-cal;
+	st,csi-cal;
+	st,cal-sec = <60>;
+	st,clksrc = <
+	  CLK_MPU_PLL1P
+	  CLK_AXI_PLL2P
+	  CLK_MCU_PLL3P
+	  CLK_PLL12_HSE
+	  CLK_PLL3_HSE
+	  CLK_PLL4_HSE
+	  CLK_RTC_LSE
+	  CLK_MCO1_DISABLED
+	  CLK_MCO2_DISABLED
+	>;
+
+	st,clkdiv = <
+	  1 /*MPU*/
+	  0 /*AXI*/
+	  0 /*MCU*/
+	  1 /*APB1*/
+	  1 /*APB2*/
+	  1 /*APB3*/
+	  1 /*APB4*/
+	  2 /*APB5*/
+	  23 /*RTC*/
+	  0 /*MCO1*/
+	  0 /*MCO2*/
+	>;
+
+	st,pkcs = <
+	  CLK_CKPER_HSE
+	  CLK_FMC_ACLK
+	  CLK_QSPI_ACLK
+	  CLK_ETH_DISABLED
+	  CLK_SDMMC12_PLL4P
+	  CLK_DSI_DSIPLL
+	  CLK_STGEN_HSE
+	  CLK_USBPHY_HSE
+	  CLK_SPI2S1_PLL3Q
+	  CLK_SPI2S23_PLL3Q
+	  CLK_SPI45_HSI
+	  CLK_SPI6_HSI
+	  CLK_I2C46_HSI
+	  CLK_SDMMC3_PLL4P
+	  CLK_USBO_USBPHY
+	  CLK_ADC_CKPER
+	  CLK_CEC_LSE
+	  CLK_I2C12_HSI
+	  CLK_I2C35_HSI
+	  CLK_UART1_HSI
+	  CLK_UART24_HSI
+	  CLK_UART35_HSI
+	  CLK_UART6_HSI
+	  CLK_UART78_HSI
+	  CLK_SPDIF_PLL4P
+	  CLK_FDCAN_PLL4R
+	  CLK_SAI1_PLL3Q
+	  CLK_SAI2_PLL3Q
+	  CLK_SAI3_PLL3Q
+	  CLK_SAI4_PLL3Q
+	  CLK_RNG1_LSI
+	  CLK_RNG2_LSI
+	  CLK_LPTIM1_PCLK1
+	  CLK_LPTIM23_PCLK3
+	  CLK_LPTIM45_LSE
+	>;
+
+	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
+	pll2: st,pll@1 {
+	  compatible = "st,stm32mp1-pll";
+	  reg = <1>;
+	  cfg = <2 65 1 0 0 PQR(1,1,1)>;
+	  frac = <0x1400>;
+	};
+
+	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
+	pll3: st,pll@2 {
+	  compatible = "st,stm32mp1-pll";
+	  reg = <2>;
+	  cfg = <1 33 1 16 36 PQR(1,1,1)>;
+	  frac = <0x1a04>;
+	};
+
+	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
+	pll4: st,pll@3 {
+	  compatible = "st,stm32mp1-pll";
+	  reg = <3>;
+	  cfg = <3 98 5 7 7 PQR(1,1,1)>;
+	  };
+};
+
+&bsec{
+	board_id:board_id@ec{
+		reg = <0xec 0x4>;
+		st,non-secure-otp;
+	};
+};
+
+&cryp1{
+	status = "okay";
+
+	/* USER CODE BEGIN cryp1 */
+	/* USER CODE END cryp1 */
+};
+
+&etzpc{
+	st,decprot = <
+  DECPROT(STM32MP1_ETZPC_USART1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_SPI6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_I2C4_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_I2C6_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_RNG1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_HASH1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_CRYP1_ID, DECPROT_NS_RW, DECPROT_UNLOCK)
+  DECPROT(STM32MP1_ETZPC_DDRCTRL_ID, DECPROT_S_RW, DECPROT_LOCK)
+  DECPROT(STM32MP1_ETZPC_DDRPHYC_ID, DECPROT_S_RW, DECPROT_LOCK)
+  DECPROT(STM32MP1_ETZPC_STGENC_ID, DECPROT_S_RW, DECPROT_LOCK)
+  DECPROT(STM32MP1_ETZPC_BKPSRAM_ID, DECPROT_S_RW, DECPROT_LOCK)
+  DECPROT(STM32MP1_ETZPC_IWDG1_ID, DECPROT_S_RW, DECPROT_LOCK)
+	>;
+	secure-status = "okay";
+};
+
+&hash1{
+	status = "okay";
+};
+
+&i2c4{
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_z_mx>;
+	status = "okay";
+	secure-status = "okay";
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
+
+	pmic:stpmic@33{
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&exti_pwr 55 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "okay";
+    secure-status = "okay";
+
+		regulators{
+			compatible = "st,stpmic1-regulators";
+			buck1-supply = <&vin>;
+			buck2-supply = <&vin>;
+			buck3-supply = <&vin>;
+			buck4-supply = <&vin>;
+			ldo1-supply = <&v3v3>;
+			ldo2-supply = <&vin>;
+			ldo3-supply = <&vdd_ddr>;
+			ldo4-supply = <&vin>;
+			ldo5-supply = <&vin>;
+			ldo6-supply = <&v3v3>;
+			vref_ddr-supply = <&vin>;
+			boost-supply = <&vin>;
+			pwr_sw1-supply = <&bst_out>;
+			pwr_sw2-supply = <&bst_out>;
+
+			vddcore:buck1{
+				regulator-name = "vddcore";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop{
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1200000>;
+				};
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr:buck2{
+				regulator-name = "vdd_ddr";
+				regulator-min-microvolt = <1350000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-always-on;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop{
+					regulator-suspend-microvolt = <1350000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr{
+					regulator-suspend-microvolt = <1350000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd:buck3{
+				regulator-name = "vdd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				st,mask-reset;
+				regulator-initial-mode = <0>;
+				regulator-over-current-protection;
+				lp-stop{
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr{
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+			};
+
+			v3v3:buck4{
+				regulator-name = "v3v3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				regulator-initial-mode = <0>;
+				lp-stop{
+					regulator-suspend-microvolt = <3300000>;
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			v1v8_audio:ldo1{
+				regulator-name = "v1v8_audio";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			v3v3_hdmi:ldo2{
+				regulator-name = "v3v3_hdmi";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vtt_ddr:ldo3{
+				regulator-name = "vtt_ddr";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <750000>;
+				regulator-always-on;
+				regulator-over-current-protection;
+				lp-stop{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_usb:ldo4{
+				regulator-name = "vdd_usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				standby-ddr-sr{
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdda:ldo5{
+				regulator-name = "vdda";
+				regulator-min-microvolt = <2900000>;
+				regulator-max-microvolt = <2900000>;
+				regulator-boot-on;
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			v1v2_hdmi:ldo6{
+				regulator-name = "v1v2_hdmi";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				standby-ddr-sr{
+					regulator-off-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			vref_ddr:vref_ddr{
+				regulator-name = "vref_ddr";
+				regulator-always-on;
+				regulator-over-current-protection;
+				lp-stop{
+					regulator-on-in-suspend;
+				};
+				standby-ddr-sr{
+					regulator-on-in-suspend;
+				};
+				standby-ddr-off{
+					regulator-off-in-suspend;
+				};
+			};
+
+			bst_out:boost{
+				regulator-name = "bst_out";
+			};
+
+			vbus_otg:pwr_sw1{
+				regulator-name = "vbus_otg";
+			};
+
+			vbus_sw:pwr_sw2{
+				regulator-name = "vbus_sw";
+				regulator-active-discharge = <1>;
+			};
+		};
+	};
+	/* USER CODE END i2c4 */
+};
+
+&iwdg2{
+	status = "okay";
+	secure-status = "okay";
+	timeout-sec = <32>;
+};
+
+&rcc{
+	status = "okay";
+	secure-status = "okay";
+
+	/* USER CODE BEGIN rcc */
+	/* USER CODE END rcc */
+};
+
+&rng1{
+	status = "okay";
+	secure-status = "okay";
+};
+
+&rtc{
+	status = "okay";
+	secure-status = "okay";
+};
+
+&sdmmc1{
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc1_pins_mx>;
+	status = "okay";
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+};
+
+&tamp{
+	status = "okay";
+	secure-status = "okay";
+
+	/* USER CODE BEGIN tamp */
+	/* USER CODE END tamp */
+};
+
+&uart4{
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_mx>;
+	status = "okay";
+};
+
+&usbotg_hs{
+	status = "okay";
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	usb-role-switch;
+};
+
+&usbphyc{
+	status = "okay";
+};
+
+&usbphyc_port0{
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1{
+	phy-supply = <&vdd_usb>;
+};
+
+&cpu0{
+	cpu-supply = <&vddcore>;
+};
+
+&cpu1{
+	cpu-supply = <&vddcore>;
+};
+
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
+&nvmem_layout{
+	nvmem-cells = <&cfg0_otp>,
+			<&part_number_otp>,
+			<&monotonic_otp>,
+			<&nand_otp>,
+			<&uid_otp>,
+			<&package_otp>,
+			<&hw2_otp>,
+			<&pkh_otp>,
+			<&board_id>;
+
+	nvmem-cell-names = "cfg0_otp",
+			"part_number_otp",
+			"monotonic_otp",
+			"nand_otp",
+			"uid_otp",
+			"package_otp",
+			"hw2_otp",
+			"pkh_otp",
+			"board_id";
+};
+
+&timers15{
+	secure-status = "okay";
+	st,hsi-cal-input = <7>;
+	st,csi-cal-input = <8>;
+};
diff --git a/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch b/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch
new file mode 100644
index 0000000000..4ddfc5b982
--- /dev/null
+++ b/board/octavo/brk/uboot-patches/0006-osd32mpp1-BRK-board-added.patch
@@ -0,0 +1,1989 @@
+From 2efe6be348489dbdc856947eda6e5187494aefc8 Mon Sep 17 00:00:00 2001
+From: Martin Lesniak <martin.lesniak@st.com>
+Date: Thu, 27 Aug 2020 14:44:46 -0500
+Subject: [PATCH 1/4] osd32mpp1 BRK board added
+
+New board definition for Octavo's OSD32MP1-BRK
+
+Signed-off-by: neeraj.dantu <neeraj.dantu@octavosystems.com>
+---
+ arch/arm/dts/Makefile                         |   3 +-
+ arch/arm/dts/osd32mp1.dtsi                    | 119 +++
+ .../dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi  | 255 ++++++
+ arch/arm/dts/stm32mp157c-osd32mp1-brk.dts     | 756 ++++++++++++++++++
+ arch/arm/dts/stm32mp15xx-dkx.dtsi             |   3 +-
+ arch/arm/mach-stm32mp/Kconfig                 |  10 +-
+ board/octavo/osd32mp1-brk/Kconfig             |  13 +
+ board/octavo/osd32mp1-brk/MAINTAINERS         |   7 +
+ board/octavo/osd32mp1-brk/Makefile            |   9 +
+ board/octavo/osd32mp1-brk/board.c             | 547 +++++++++++++
+ configs/osd32mp1_brk_trusted_defconfig        | 148 ++++
+ 11 files changed, 1867 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/dts/osd32mp1.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+ create mode 100644 arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+ create mode 100644 board/octavo/osd32mp1-brk/Kconfig
+ create mode 100644 board/octavo/osd32mp1-brk/MAINTAINERS
+ create mode 100644 board/octavo/osd32mp1-brk/Makefile
+ create mode 100644 board/octavo/osd32mp1-brk/board.c
+ create mode 100644 configs/osd32mp1_brk_trusted_defconfig
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index c3fd89b8be..7494fca9bb 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -837,7 +837,8 @@ dtb-$(CONFIG_STM32MP15x) += \
+ 	stm32mp157f-dk2.dtb \
+ 	stm32mp157f-ed1.dtb \
+ 	stm32mp157f-ev1.dtb \
+-	stm32mp15xx-dhcom-pdk2.dtb
++	stm32mp15xx-dhcom-pdk2.dtb \
++	stm32mp157c-osd32mp1-brk.dtb
+ 
+ dtb-$(CONFIG_SOC_K3_AM6) += k3-am654-base-board.dtb k3-am654-r5-base-board.dtb
+ dtb-$(CONFIG_SOC_K3_J721E) += k3-j721e-common-proc-board.dtb \
+diff --git a/arch/arm/dts/osd32mp1.dtsi b/arch/arm/dts/osd32mp1.dtsi
+new file mode 100644
+index 0000000000..362f3281b8
+--- /dev/null
++++ b/arch/arm/dts/osd32mp1.dtsi
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
+index 0000000000..8f0e39f040
+--- /dev/null
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+@@ -0,0 +1,255 @@
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
++#include "osd32mp1.dtsi"
++
++#include "stm32mp15-u-boot.dtsi"
++#include "stm32mp15-ddr.dtsi"
++
++/* USER CODE BEGIN includes */
++/* USER CODE END includes */
++
++/ {
++
++	/* USER CODE BEGIN root */
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
++		u-boot,mmc-env-partition = "ssbl";
++		st,stm32prog-gpios = <&gpiod 9 GPIO_ACTIVE_LOW>;
++	};
++
++	/* USER CODE END root */
++
++	clocks {
++		u-boot,dm-pre-reloc;
++
++		/* USER CODE BEGIN clocks */
++		/* USER CODE END clocks */
++
++#ifndef CONFIG_STM32MP1_TRUSTED
++		clk_lsi: clk-lsi {
++			u-boot,dm-pre-reloc;
++
++			/* USER CODE BEGIN clk_lsi */
++			/* USER CODE END clk_lsi */
++		};
++		clk_hsi: clk-hsi {
++			u-boot,dm-pre-reloc;
++
++			/* USER CODE BEGIN clk_hsi */
++			/* USER CODE END clk_hsi */
++		};
++		clk_csi: clk-csi {
++			u-boot,dm-pre-reloc;
++			status = "disabled";
++
++			/* USER CODE BEGIN clk_csi */
++			/* USER CODE END clk_csi */
++		};
++		clk_lse: clk-lse {
++			u-boot,dm-pre-reloc;
++			st,drive = < LSEDRV_MEDIUM_HIGH >;
++
++			/* USER CODE BEGIN clk_lse */
++			/* USER CODE END clk_lse */
++		};
++		clk_hse: clk-hse {
++			u-boot,dm-pre-reloc;
++			st,digbypass;
++
++			/* USER CODE BEGIN clk_hse */
++			/* USER CODE END clk_hse */
++		};
++#endif	/*CONFIG_STM32MP1_TRUSTED*/
++	};
++
++}; /*root*/
++
++#ifndef CONFIG_STM32MP1_TRUSTED
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
++		CLK_ETH_DISABLED
++		CLK_SDMMC12_PLL4P
++		CLK_STGEN_HSE
++		CLK_USBPHY_HSE
++		CLK_SPI2S1_DISABLED
++		CLK_SPI2S23_DISABLED
++		CLK_SPI45_DISABLED
++		CLK_SPI6_DISABLED
++		CLK_I2C46_HSI
++		CLK_SDMMC3_DISABLED
++		CLK_USBO_USBPHY
++		CLK_ADC_DISABLED
++		CLK_CEC_DISABLED
++		CLK_I2C12_DISABLED
++		CLK_I2C35_DISABLED
++		CLK_UART1_DISABLED
++		CLK_UART24_HSI
++		CLK_UART35_DISABLED
++		CLK_UART6_DISABLED
++		CLK_UART78_DISABLED
++		CLK_SPDIF_DISABLED
++		CLK_SAI1_DISABLED
++		CLK_SAI2_DISABLED
++		CLK_SAI3_DISABLED
++		CLK_SAI4_DISABLED
++		CLK_RNG1_LSI
++		CLK_LPTIM1_DISABLED
++		CLK_LPTIM23_DISABLED
++		CLK_LPTIM45_DISABLED
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
++		cfg = < 1 33 1 16 36 PQR(1,0,0) >;
++		frac = < 0x1a04 >;
++		u-boot,dm-pre-reloc;
++	};
++	pll4:st,pll@3 {
++		compatible = "st,stm32mp1-pll";
++		reg = <3>;
++		cfg = < 3 98 5 7 7 PQR(1,0,0) >;
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN i2c4 */
++	/* USER CODE END i2c4 */
++};
++
++&sdmmc1{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN sdmmc1 */
++	/* USER CODE END sdmmc1 */
++};
++
++#endif	/*CONFIG_STM32MP1_TRUSTED*/
++
++&cryp1{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN cryp1 */
++	/* USER CODE END cryp1 */
++};
++
++&hash1{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN hash1 */
++	/* USER CODE END hash1 */
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN uart4 */
++	/* USER CODE END uart4 */
++};
++
++&usbotg_hs{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN usbotg_hs */
++	u-boot,force-b-session-valid;
++	hnp-srp-disable;
++	dr_mode = "peripheral";
++	/* USER CODE END usbotg_hs */
++};
++
++&usbphyc{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN usbphyc */
++	/* USER CODE END usbphyc */
++};
++
++&usbphyc_port0{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN usbphyc_port0 */
++	/* USER CODE END usbphyc_port0 */
++};
++
++&usbphyc_port1{
++	u-boot,dm-pre-reloc;
++
++	/* USER CODE BEGIN usbphyc_port1 */
++	/* USER CODE END usbphyc_port1 */
++};
++
++/* USER CODE BEGIN addons */
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
++
++/* USER CODE END addons */
++
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+new file mode 100644
+index 0000000000..51eff6e221
+--- /dev/null
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+@@ -0,0 +1,756 @@
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
++#include <dt-bindings/pinctrl/stm32-pinfunc.h>
++
++#include "stm32mp157.dtsi"
++#include "stm32mp15xc.dtsi"
++#include "stm32mp15xxac-pinctrl.dtsi"
++#include "stm32mp157-m4-srm.dtsi"
++
++/* USER CODE BEGIN includes */
++#include <dt-bindings/mfd/st,stpmic1.h>
++#include <dt-bindings/rtc/rtc-stm32.h>
++/* USER CODE END includes */
++
++/ {
++	model = "Octavo OSD32MP1 BRK board";
++	compatible = "st,stm32mp157c-osd32mp1-brk", "st,stm32mp157";
++
++	memory@c0000000 {
++		device_type = "memory";
++		reg = <0xc0000000 0x20000000>;
++
++		/* USER CODE BEGIN memory */
++		/* USER CODE END memory */
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		/* USER CODE BEGIN reserved-memory */
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
++		gpu_reserved:gpu@da000000{
++			reg = <0xda000000 0x4000000>;
++			no-map;
++		};
++
++		optee_memory:optee@0xde000000{
++			reg = <0xde000000 0x02000000>;
++			no-map;
++			status = "okay";
++		};
++		/* USER CODE END reserved-memory */
++	};
++
++	/* USER CODE BEGIN root */
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
++		ethernet0 = &ethernet0;
++		serial0 = &uart4;
++	};
++
++	chosen{
++		stdout-path = "serial0:115200n8";
++	};
++
++	/* USER CODE END root */
++
++	clocks {
++
++		/* USER CODE BEGIN clocks */
++		/* USER CODE END clocks */
++
++#ifndef CONFIG_STM32MP1_TRUSTED
++		clk_lsi: clk-lsi {
++			clock-frequency = <32000>;
++		};
++		clk_hsi: clk-hsi {
++			clock-frequency = <64000000>;
++		};
++		clk_csi: clk-csi {
++			clock-frequency = <4000000>;
++		};
++		clk_lse: clk-lse {
++			clock-frequency = <32768>;
++		};
++		clk_hse: clk-hse {
++			clock-frequency = <24000000>;
++		};
++#endif	/*CONFIG_STM32MP1_TRUSTED*/
++	};
++
++}; /*root*/
++
++&pinctrl {
++	u-boot,dm-pre-reloc;
++
++	rtc_pins_mx: rtc_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 8, ANALOG)>; /* RTC_LSCO */
++		};
++	};
++
++	rtc_sleep_pins_mx: rtc_sleep_mx-0 {
++		pins {
++			pinmux = <STM32_PINMUX('I', 8, ANALOG)>; /* RTC_LSCO */
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
++	/* USER CODE BEGIN pinctrl */
++	/* USER CODE END pinctrl */
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
++	/* USER CODE BEGIN pinctrl_z */
++	/* USER CODE END pinctrl_z */
++};
++
++&m4_rproc{
++	/*Restriction: "memory-region" property is not managed - please to use User-Section if needed*/
++	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
++	mbox-names = "vq0", "vq1", "shutdown";
++	status = "okay";
++
++	/* USER CODE BEGIN m4_rproc */
++	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++			<&vdev0vring1>, <&vdev0buffer>;
++	interrupt-parent = <&exti>;
++	interrupts = <68 1>;
++	wakeup-source;
++	/* USER CODE END m4_rproc */
++};
++
++&bsec{
++	status = "okay";
++
++	/* USER CODE BEGIN bsec */
++	/* USER CODE END bsec */
++};
++
++&crc1{
++	status = "okay";
++
++	/* USER CODE BEGIN crc1 */
++	/* USER CODE END crc1 */
++};
++
++&cryp1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN cryp1 */
++	/* USER CODE END cryp1 */
++};
++
++&dma1{
++	status = "okay";
++
++	/* USER CODE BEGIN dma1 */
++	sram = <&dma_pool>;
++	/* USER CODE END dma1 */
++};
++
++&dma2{
++	status = "okay";
++
++	/* USER CODE BEGIN dma2 */
++	sram = <&dma_pool>;
++	/* USER CODE END dma2 */
++};
++
++&dmamux1{
++
++	dma-masters = <&dma1 &dma2>;
++	dma-channels = <16>;
++
++	status = "okay";
++
++	/* USER CODE BEGIN dmamux1 */
++	/* USER CODE END dmamux1 */
++};
++
++&dts{
++	status = "okay";
++
++	/* USER CODE BEGIN dts */
++	/* USER CODE END dts */
++};
++
++&gpu{
++	status = "okay";
++
++	/* USER CODE BEGIN gpu */
++	contiguous-area = <&gpu_reserved>;
++	/* USER CODE END gpu */
++};
++
++&hash1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN hash1 */
++	/* USER CODE END hash1 */
++};
++
++&hsem{
++	status = "okay";
++
++	/* USER CODE BEGIN hsem */
++	/* USER CODE END hsem */
++};
++
++&i2c4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c4_pins_z_mx>;
++	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
++	status = "okay";
++
++	/* USER CODE BEGIN i2c4 */
++	i2c-scl-rising-time-ns = <185>;
++	i2c-scl-falling-time-ns = <20>;
++	clock-frequency = <100000>;
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
++				regulator-min-microvolt = <3300000>;
++				regulator-max-microvolt = <3300000>;
++				interrupts = <IT_CURLIM_LDO4 0>;
++				regulator-always-on;
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
++	/* USER CODE END i2c4 */
++};
++
++&ipcc{
++	status = "okay";
++
++	/* USER CODE BEGIN ipcc */
++	/* USER CODE END ipcc */
++};
++
++&iwdg2{
++	status = "okay";
++
++	/* USER CODE BEGIN iwdg2 */
++	timeout-sec = <32>;
++	/* USER CODE END iwdg2 */
++};
++
++&mdma1{
++	status = "okay";
++
++	/* USER CODE BEGIN mdma1 */
++	/* USER CODE END mdma1 */
++};
++
++&rcc{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN rcc */
++	/* USER CODE END rcc */
++};
++
++&rng1{
++	status = "okay";
++
++	/* USER CODE BEGIN rng1 */
++	/* USER CODE END rng1 */
++};
++
++&rtc{
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&rtc_pins_mx>;
++	pinctrl-1 = <&rtc_sleep_pins_mx>;
++	status = "okay";
++
++	/* USER CODE BEGIN rtc */
++	st,lsco = <RTC_OUT2_RMP>;
++	/* USER CODE END rtc */
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
++	/* USER CODE BEGIN sdmmc1 */
++	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	disable-wp;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&v3v3>;
++	/* USER CODE END sdmmc1 */
++};
++
++&tamp{
++	status = "okay";
++
++	/* USER CODE BEGIN tamp */
++	/* USER CODE END tamp */
++};
++
++&uart4{
++	u-boot,dm-pre-reloc;
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&uart4_pins_mx>;
++	pinctrl-1 = <&uart4_sleep_pins_mx>;
++	status = "okay";
++
++	/* USER CODE BEGIN uart4 */
++	/delete-property/ dmas;
++	/delete-property/ dma-names;
++	/* USER CODE END uart4 */
++};
++
++&usbh_ehci{
++	status = "okay";
++
++	/* USER CODE BEGIN usbh_ehci */
++	phys = <&usbphyc_port0>;
++	/* USER CODE END usbh_ehci */
++};
++
++&usbh_ohci{
++	status = "okay";
++
++	/* USER CODE BEGIN usbh_ohci */
++	/* USER CODE END usbh_ohci */
++};
++
++&usbotg_hs{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN usbotg_hs */
++	phys = <&usbphyc_port1 0>;
++	phy-names = "usb2-phy";
++	/* USER CODE END usbotg_hs */
++};
++
++&usbphyc{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN usbphyc */
++	/* USER CODE END usbphyc */
++};
++
++&usbphyc_port0{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN usbphyc_port0 */
++	phy-supply = <&vdd_usb>;
++	st,phy-tuning = <&usb_phy_tuning>;
++	/* USER CODE END usbphyc_port0 */
++};
++
++&usbphyc_port1{
++	u-boot,dm-pre-reloc;
++	status = "okay";
++
++	/* USER CODE BEGIN usbphyc_port1 */
++	phy-supply = <&vdd_usb>;
++	st,phy-tuning = <&usb_phy_tuning>;
++	/* USER CODE END usbphyc_port1 */
++};
++
++&vrefbuf{
++	status = "okay";
++
++	/* USER CODE BEGIN vrefbuf */
++	regulator-min-microvolt = <2500000>;
++	regulator-max-microvolt = <2500000>;
++	vdda-supply = <&vdd>;
++	/* USER CODE END vrefbuf */
++};
++
++/* USER CODE BEGIN addons */
++&adc {
++	status = "disabled";
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
++
++	dma_pool:dma_pool@0{
++		reg = <0x50000 0x10000>;
++		pool;
++	};
++};
++
++&optee{
++	status = "okay";
++};
++/* USER CODE END addons */
++
+diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
+index 35169385fd..f43c45bd3d 100644
+--- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
++++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
+@@ -572,7 +572,8 @@
+ 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+ 	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+ 	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+-	cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	//cd-gpios = <&gpiob 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
++	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+ 	disable-wp;
+ 	st,neg-edge;
+ 	bus-width = <4>;
+diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
+index f9f79437e4..ff54cb4cfa 100644
+--- a/arch/arm/mach-stm32mp/Kconfig
++++ b/arch/arm/mach-stm32mp/Kconfig
+@@ -85,6 +85,14 @@ config TARGET_DH_STM32MP1_PDK2
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
+ config STM32MP1_TRUSTED
+@@ -178,5 +186,5 @@ endif
+ 
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
+index 0000000000..5c4fc6eea2
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/MAINTAINERS
+@@ -0,0 +1,7 @@
++OCTAVO osd32mp1-brk BOARD
++M:	Martin Lesniak <martin.lesniak@st.com>
++S:	Maintained
++F:	arch/arm/dts/stm32mp157c-osd32mp1-brk*
++F:	board/Octavo/osd32mp1-brk/
++F:	configs/osd32mp1_brk_trusted_defconfig
++F:	include/configs/stm32mp1.h
+diff --git a/board/octavo/osd32mp1-brk/Makefile b/board/octavo/osd32mp1-brk/Makefile
+new file mode 100644
+index 0000000000..381579c590
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/Makefile
+@@ -0,0 +1,9 @@
++# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
++#
++# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
++#
++
++obj-y += ../../st/stm32mp1/board.o board.o
++
++obj-$(CONFIG_SYS_MTDPARTS_RUNTIME) += ../../st/common/stm32mp_mtdparts.o
++obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
+diff --git a/board/octavo/osd32mp1-brk/board.c b/board/octavo/osd32mp1-brk/board.c
+new file mode 100644
+index 0000000000..53325e87f6
+--- /dev/null
++++ b/board/octavo/osd32mp1-brk/board.c
+@@ -0,0 +1,547 @@
++// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
++/*
++ * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
++ */
++
++#include <common.h>
++#include <adc.h>
++#include <asm/arch/stm32.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/gpio.h>
++#include <asm/io.h>
++#include <bootm.h>
++#include <clk.h>
++#include <config.h>
++#include <dm.h>
++#include <dm/device.h>
++#include <dm/uclass.h>
++#include <env.h>
++#include <env_internal.h>
++#include <g_dnl.h>
++#include <generic-phy.h>
++#include <i2c.h>
++#include <i2c_eeprom.h>
++#include <init.h>
++#include <led.h>
++#include <memalign.h>
++#include <misc.h>
++#include <mtd.h>
++#include <mtd_node.h>
++#include <netdev.h>
++#include <phy.h>
++#include <power/regulator.h>
++#include <remoteproc.h>
++#include <reset.h>
++#include <syscon.h>
++#include <usb.h>
++#include <usb/dwc2_udc.h>
++#include <watchdog.h>
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
++	if (IS_ENABLED(CONFIG_STM32MP1_TRUSTED))
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
++#if defined(CONFIG_FASTBOOT) || defined(CONFIG_CMD_STM32PROG)
++	ofnode node;
++	struct gpio_desc gpio;
++	enum forced_boot_mode boot_mode = BOOT_NORMAL;
++
++	node = ofnode_path("/config");
++	if (!ofnode_valid(node)) {
++		debug("%s: no /config node?\n", __func__);
++		return;
++	}
++#ifdef CONFIG_FASTBOOT
++	if (gpio_request_by_name_nodev(node, "st,fastboot-gpios", 0,
++				       &gpio, GPIOD_IS_IN)) {
++		debug("%s: could not find a /config/st,fastboot-gpios\n",
++		      __func__);
++	} else {
++		if (dm_gpio_get_value(&gpio)) {
++			puts("Fastboot key pressed, ");
++			boot_mode = BOOT_FASTBOOT;
++		}
++
++		dm_gpio_free(NULL, &gpio);
++	}
++#endif
++#ifdef CONFIG_CMD_STM32PROG
++	if (gpio_request_by_name_nodev(node, "st,stm32prog-gpios", 0,
++				       &gpio, GPIOD_IS_IN)) {
++		debug("%s: could not find a /config/st,stm32prog-gpios\n",
++		      __func__);
++	} else {
++		if (dm_gpio_get_value(&gpio)) {
++			puts("STM32Programmer key pressed, ");
++			boot_mode = BOOT_STM32PROG;
++		}
++		dm_gpio_free(NULL, &gpio);
++	}
++#endif
++
++	if (boot_mode != BOOT_NORMAL) {
++		puts("entering download mode...\n");
++		clrsetbits_le32(TAMP_BOOT_CONTEXT,
++				TAMP_BOOT_FORCED_MASK,
++				boot_mode);
++	}
++#endif
++}
++
++#if defined(CONFIG_USB_GADGET) && defined(CONFIG_USB_GADGET_DWC2_OTG)
++
++#include <usb/dwc2_udc.h>
++int g_dnl_board_usb_cable_connected(void)
++{
++	struct udevice *dwc2_udc_otg;
++	int ret;
++
++	ret = uclass_get_device_by_driver(UCLASS_USB_GADGET_GENERIC,
++					  DM_GET_DRIVER(dwc2_udc_otg),
++					  &dwc2_udc_otg);
++	if (!ret)
++		debug("dwc2_udc_otg init failed\n");
++
++	return dwc2_udc_B_session_valid(dwc2_udc_otg);
++}
++
++#define STM32MP1_G_DNL_DFU_PRODUCT_NUM 0xdf11
++#define STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM 0x0afb
++
++int g_dnl_bind_fixup(struct usb_device_descriptor *dev, const char *name)
++{
++	if (!strcmp(name, "usb_dnl_dfu"))
++		put_unaligned(STM32MP1_G_DNL_DFU_PRODUCT_NUM, &dev->idProduct);
++	else if (!strcmp(name, "usb_dnl_fastboot"))
++		put_unaligned(STM32MP1_G_DNL_FASTBOOT_PRODUCT_NUM,
++			      &dev->idProduct);
++	else
++		put_unaligned(CONFIG_USB_GADGET_PRODUCT_NUM, &dev->idProduct);
++
++	return 0;
++}
++
++#endif /* CONFIG_USB_GADGET */
++
++#ifdef CONFIG_LED
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
++	ret = get_led(&dev, "u-boot,boot-led");
++	if (ret)
++		return ret;
++
++	ret = led_set_state(dev, cmd);
++	return ret;
++}
++#endif
++
++static void __maybe_unused led_error_blink(u32 nb_blink)
++{
++#ifdef CONFIG_LED
++	int ret;
++	struct udevice *led;
++	u32 i;
++#endif
++
++	if (!nb_blink)
++		return;
++
++#ifdef CONFIG_LED
++	ret = get_led(&led, "u-boot,error-led");
++	if (!ret) {
++		/* make u-boot,error-led blinking */
++		/* if U32_MAX and 125ms interval, for 17.02 years */
++		for (i = 0; i < 2 * nb_blink; i++) {
++			led_set_state(led, LEDST_TOGGLE);
++			mdelay(125);
++			WATCHDOG_RESET();
++		}
++	}
++#endif
++
++	/* infinite: the boot process must be stopped */
++	if (nb_blink == U32_MAX)
++		hang();
++}
++
++static void sysconf_init(void)
++{
++#ifndef CONFIG_STM32MP1_TRUSTED
++	u8 *syscfg;
++#ifdef CONFIG_DM_REGULATOR
++	struct udevice *pwr_dev;
++	struct udevice *pwr_reg;
++	struct udevice *dev;
++	int ret;
++	u32 otp = 0;
++#endif
++	u32 bootr;
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
++#ifdef CONFIG_DM_REGULATOR
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
++	if (!ret) {
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
++#endif
++
++	/* activate automatic I/O compensation
++	 * warning: need to ensure CSI enabled and ready in clock driver
++	 */
++	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg + SYSCFG_CMPENSETR);
++
++	while (!(readl(syscfg + SYSCFG_CMPCR) & SYSCFG_CMPCR_READY))
++		;
++	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
++#endif
++}
++
++/* board dependent setup after realloc */
++int board_init(void)
++{
++	struct udevice *dev;
++
++	/* address of boot parameters */
++	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
++
++	/* probe all PINCTRL for hog */
++	for (uclass_first_device(UCLASS_PINCTRL, &dev);
++	     dev;
++	     uclass_next_device(&dev)) {
++		pr_debug("probe pincontrol = %s\n", dev->name);
++	}
++
++	board_key_check();
++
++#ifdef CONFIG_DM_REGULATOR
++	regulators_enable_boot_on(_DEBUG);
++#endif
++
++	sysconf_init();
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
++#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
++	const void *fdt_compat;
++	int fdt_compat_len;
++
++	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
++				 &fdt_compat_len);
++	if (fdt_compat && fdt_compat_len) {
++		if (strncmp(fdt_compat, "st,", 3) != 0)
++			env_set("board_name", fdt_compat);
++		else
++			env_set("board_name", fdt_compat + 3);
++	}
++#endif
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
++#ifdef CONFIG_LED
++	setup_led(LEDST_OFF);
++#endif
++}
++
++/* eth init function : weak called in eqos driver */
++int board_interface_eth_init(struct udevice *dev,
++			     phy_interface_t interface_type)
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
++	if (prio)
++		return ENVL_UNKNOWN;
++
++#ifdef CONFIG_ENV_IS_IN_SPI_FLASH
++	return ENVL_SPI_FLASH;
++#else
++	return ENVL_NOWHERE;
++#endif
++}
++
++#if defined(CONFIG_OF_BOARD_SETUP)
++int ft_board_setup(void *blob, bd_t *bd)
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
++	if (!ret) {
++		rproc_start(id);
++		env_set("copro_state", "booted");
++	}
++}
++
++U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
+diff --git a/configs/osd32mp1_brk_trusted_defconfig b/configs/osd32mp1_brk_trusted_defconfig
+new file mode 100644
+index 0000000000..dd94f6155c
+--- /dev/null
++++ b/configs/osd32mp1_brk_trusted_defconfig
+@@ -0,0 +1,148 @@
++CONFIG_ARM=y
++CONFIG_ARCH_STM32MP=y
++CONFIG_SYS_MALLOC_F_LEN=0x3000
++CONFIG_ENV_OFFSET=0x280000
++# CONFIG_TARGET_ST_STM32MP15x=y
++CONFIG_TARGET_OCTAVO_OSD32MP1_BRK=y
++CONFIG_CMD_STM32PROG=y
++CONFIG_ENV_SECT_SIZE=0x40000
++CONFIG_ENV_OFFSET_REDUND=0x2C0000
++CONFIG_DISTRO_DEFAULTS=y
++CONFIG_FIT=y
++CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
++CONFIG_SYS_PROMPT="OSD32MP> "
++# CONFIG_CMD_BOOTD is not set
++CONFIG_CMD_DTIMG=y
++# CONFIG_CMD_ELF is not set
++# CONFIG_CMD_IMI is not set
++# CONFIG_CMD_XIMG is not set
++# CONFIG_CMD_EXPORTENV is not set
++# CONFIG_CMD_IMPORTENV is not set
++CONFIG_CMD_EEPROM=y
++CONFIG_CMD_ERASEENV=y
++CONFIG_CMD_MEMINFO=y
++CONFIG_CMD_MEMTEST=y
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
++CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-osd32mp1-brk"
++CONFIG_ENV_IS_NOWHERE=y
++CONFIG_ENV_IS_IN_MMC=y
++//CONFIG_ENV_IS_IN_SPI_FLASH=y
++CONFIG_ENV_IS_IN_UBI=y
++CONFIG_SYS_REDUNDAND_ENVIRONMENT=y
++CONFIG_ENV_UBI_PART="UBI"
++CONFIG_ENV_UBI_VOLUME="uboot_config"
++CONFIG_ENV_UBI_VOLUME_REDUND="uboot_config_r"
++CONFIG_SYS_RELOC_GD_ENV_ADDR=y
++CONFIG_STM32_ADC=y
++CONFIG_CLK_SCMI=y
++CONFIG_SET_DFU_ALT_INFO=y
++CONFIG_USB_FUNCTION_FASTBOOT=y
++CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
++CONFIG_FASTBOOT_BUF_SIZE=0x02000000
++CONFIG_FASTBOOT_USB_DEV=1
++CONFIG_FASTBOOT_FLASH=y
++CONFIG_FASTBOOT_FLASH_MMC_DEV=1
++CONFIG_FASTBOOT_MMC_BOOT_SUPPORT=y
++CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
++CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
++CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
++CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
++CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
++CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
++CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
++CONFIG_GPIO_HOG=y
++CONFIG_DM_HWSPINLOCK=y
++CONFIG_HWSPINLOCK_STM32=y
++CONFIG_DM_I2C=y
++CONFIG_SYS_I2C_STM32F7=y
++CONFIG_LED=y
++CONFIG_LED_GPIO=y
++CONFIG_DM_MAILBOX=y
++CONFIG_STM32_IPCC=y
++CONFIG_I2C_EEPROM=y
++CONFIG_ARM_SMC_MAILBOX=y
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
++CONFIG_DM_REGULATOR_FIXED=y
++CONFIG_DM_REGULATOR_GPIO=y
++CONFIG_DM_REGULATOR_STM32_VREFBUF=y
++CONFIG_DM_REGULATOR_STPMIC1=y
++CONFIG_REMOTEPROC_STM32_COPRO=y
++CONFIG_RESET_SCMI=y
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
++CONFIG_VIDEO_BPP8=y
++CONFIG_VIDEO_BPP16=y
++CONFIG_VIDEO_BPP32=y
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
+-- 
+2.17.1
+
diff --git a/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch b/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch
new file mode 100644
index 0000000000..ffa9505dad
--- /dev/null
+++ b/board/octavo/brk/uboot-patches/0007-Add-OSD32MP1-BRK-features-and-fix-formatting.patch
@@ -0,0 +1,976 @@
+From a473ef7f04c60d7a4a878a50890730cb0e788b40 Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
+Date: Tue, 22 Sep 2020 17:30:17 -0500
+Subject: [PATCH 2/4] Add OSD32MP1-BRK features and fix formatting
+
+---
+ ...tsi => stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi} |   0
+ arch/arm/dts/stm32mp157c-osd32mp1-brk.dts     | 667 ++++++++++++++----
+ 2 files changed, 539 insertions(+), 128 deletions(-)
+ rename arch/arm/dts/{osd32mp1.dtsi => stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi} (100%)
+
+diff --git a/arch/arm/dts/osd32mp1.dtsi b/arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+similarity index 100%
+rename from arch/arm/dts/osd32mp1.dtsi
+rename to arch/arm/dts/stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+index 51eff6e221..d763b48945 100644
+--- a/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk.dts
+@@ -1,7 +1,6 @@
+ /* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+ /*
+- * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
+- * Author: STM32CubeMX code generation for STMicroelectronics.
++ * Copyright (C) Octavo Systems LLC 2020 - All Rights Reserved
+  */
+ 
+ /* For more information on Device Tree configuration, please refer to
+@@ -15,11 +14,8 @@
+ #include "stm32mp15xc.dtsi"
+ #include "stm32mp15xxac-pinctrl.dtsi"
+ #include "stm32mp157-m4-srm.dtsi"
+-
+-/* USER CODE BEGIN includes */
+ #include <dt-bindings/mfd/st,stpmic1.h>
+ #include <dt-bindings/rtc/rtc-stm32.h>
+-/* USER CODE END includes */
+ 
+ / {
+ 	model = "Octavo OSD32MP1 BRK board";
+@@ -28,9 +24,6 @@
+ 	memory@c0000000 {
+ 		device_type = "memory";
+ 		reg = <0xc0000000 0x20000000>;
+-
+-		/* USER CODE BEGIN memory */
+-		/* USER CODE END memory */
+ 	};
+ 
+ 	reserved-memory {
+@@ -38,8 +31,6 @@
+ 		#size-cells = <1>;
+ 		ranges;
+ 
+-		/* USER CODE BEGIN reserved-memory */
+-
+ 		mcuram2:mcuram2@10000000{
+ 			compatible = "shared-dma-pool";
+ 			reg = <0x10000000 0x40000>;
+@@ -86,11 +77,8 @@
+ 			no-map;
+ 			status = "okay";
+ 		};
+-		/* USER CODE END reserved-memory */
+ 	};
+ 
+-	/* USER CODE BEGIN root */
+-
+ 	led{
+ 		compatible = "gpio-leds";
+ 
+@@ -101,21 +89,21 @@
+ 			status = "okay";
+ 			default-state = "off";
+ 		};
+-		
++
+ 		green1{
+ 			label = "LED1_GRN";
+ 			gpios = <&gpioz 7 GPIO_ACTIVE_LOW>;
+ 			status = "okay";
+ 			default-state = "on";
+ 		};
+-		
++
+ 		red2{
+ 			label = "LED2_RED";
+ 			gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+ 			status = "okay";
+ 			default-state = "off";
+ 		};
+-				
++
+ 		green2{
+ 			label = "LED2_GRN";
+ 			gpios = <&gpioi 9 GPIO_ACTIVE_LOW>;
+@@ -143,21 +131,19 @@
+ 	};
+ 
+ 	aliases{
+-		ethernet0 = &ethernet0;
+ 		serial0 = &uart4;
++    serial2 = &usart2;
++    serial5 = &uart5;
++    serial7 = &uart7;
++    serial1 = &uart8;
+ 	};
+ 
+ 	chosen{
+ 		stdout-path = "serial0:115200n8";
+ 	};
+ 
+-	/* USER CODE END root */
+-
+ 	clocks {
+ 
+-		/* USER CODE BEGIN clocks */
+-		/* USER CODE END clocks */
+-
+ #ifndef CONFIG_STM32MP1_TRUSTED
+ 		clk_lsi: clk-lsi {
+ 			clock-frequency = <32000>;
+@@ -182,18 +168,319 @@
+ &pinctrl {
+ 	u-boot,dm-pre-reloc;
+ 
+-	rtc_pins_mx: rtc_mx-0 {
++  i2c1_pins_mx: i2c1-0 {
+ 		pins {
+-			pinmux = <STM32_PINMUX('I', 8, ANALOG)>; /* RTC_LSCO */
++			pinmux = <STM32_PINMUX('H', 11, AF5)>, /* I2C1_SCL */
++				 <STM32_PINMUX('H', 12, AF5)>; /* I2C1_SDA */
++			bias-disable;
++			drive-open-drain;
++			slew-rate = <0>;
+ 		};
+ 	};
+ 
+-	rtc_sleep_pins_mx: rtc_sleep_mx-0 {
++	i2c1_pins_sleep_mx: i2c1-1 {
+ 		pins {
+-			pinmux = <STM32_PINMUX('I', 8, ANALOG)>; /* RTC_LSCO */
++			pinmux = <STM32_PINMUX('H', 11, ANALOG)>, /* I2C1_SCL */
++				 <STM32_PINMUX('H', 12, ANALOG)>; /* I2C1_SDA */
+ 		};
+ 	};
+ 
++  i2c2_pins_mx: i2c2-0 {
++    pins {
++      pinmux = <STM32_PINMUX('F', 1, AF4)>, /* I2C2_SCL */
++         <STM32_PINMUX('G', 15, AF4)>; /* I2C2_SDA */
++      bias-disable;
++      drive-open-drain;
++      slew-rate = <0>;
++    };
++  };
++
++  i2c2_pins_sleep_mx: i2c2-1 {
++    pins {
++      pinmux = <STM32_PINMUX('F', 1, ANALOG)>, /* I2C2_SCL */
++         <STM32_PINMUX('G', 15, ANALOG)>; /* I2C2_SDA */
++    };
++  };
++
++  i2c5_pins_mx: i2c5-0 {
++    pins {
++      pinmux = <STM32_PINMUX('D', 1, AF4)>, /* I2C5_SCL */
++         <STM32_PINMUX('D', 0, AF4)>; /* I2C5_SDA */
++      bias-disable;
++      drive-open-drain;
++      slew-rate = <0>;
++    };
++  };
++
++  i2c5_pins_sleep_mx: i2c5-1 {
++    pins {
++      pinmux = <STM32_PINMUX('D', 1, ANALOG)>, /* I2C5_SCL */
++         <STM32_PINMUX('D', 0, ANALOG)>; /* I2C5_SDA */
++    };
++  };
++
++  spi2_pins_mx: spi2-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('I', 1, AF5)>, /* SPI2_SCK */
++         <STM32_PINMUX('I', 3, AF5)>; /* SPI2_MOSI */
++      bias-disable;
++      drive-push-pull;
++      slew-rate = <1>;
++    };
++
++    pins2 {
++      pinmux = <STM32_PINMUX('I', 2, AF5)>; /* SPI2_MISO */
++      bias-disable;
++    };
++  };
++
++  spi2_sleep_pins_mx: spi2-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('I', 1, ANALOG)>, /* SPI2_SCK */
++         <STM32_PINMUX('I', 2, ANALOG)>, /* SPI2_MISO */
++         <STM32_PINMUX('I', 3, ANALOG)>; /* SPI2_MOSI */
++    };
++  };
++
++  spi4_pins_mx: spi4-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
++         <STM32_PINMUX('E', 14, AF5)>; /* SPI4_MOSI */
++      bias-disable;
++      drive-push-pull;
++      slew-rate = <1>;
++    };
++
++    pins2 {
++      pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
++      bias-disable;
++    };
++  };
++
++  spi4_sleep_pins_mx: spi4-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('E', 12, ANALOG)>, /* SPI2_SCK */
++         <STM32_PINMUX('E', 13, ANALOG)>, /* SPI2_MISO */
++         <STM32_PINMUX('E', 14, ANALOG)>; /* SPI2_MOSI */
++    };
++  };
++
++  usart2_pins_mx: usart2-0 {
++      pins1 {
++        pinmux = <STM32_PINMUX('F', 5, AF7)>; /* USART2_TX */
++        bias-disable;
++        drive-push-pull;
++        slew-rate = <0>;
++      };
++      pins2 {
++        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
++        bias-disable;
++      };
++    };
++
++    usart2_idle_pins_mx: usart2-idle-0 {
++      pins1 {
++        pinmux = <STM32_PINMUX('F', 5, ANALOG)>; /* USART2_TX */
++      };
++      pins2 {
++        pinmux = <STM32_PINMUX('F', 4, AF7)>; /* USART2_RX */
++        bias-disable;
++      };
++    };
++
++    usart2_sleep_pins_mx: usart2-sleep-0 {
++      pins {
++        pinmux = <STM32_PINMUX('F', 5, ANALOG)>, /* USART2_TX */
++           <STM32_PINMUX('F', 4, ANALOG)>; /* USART2_RX */
++      };
++    };
++
++    uart5_pins_mx: uart5-0 {
++      pins1 {
++        pinmux = <STM32_PINMUX('B', 13, AF14)>; /* USART5_TX */
++        bias-disable;
++        drive-push-pull;
++        slew-rate = <0>;
++      };
++      pins2 {
++        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
++        bias-disable;
++      };
++    };
++
++    uart5_idle_pins_mx: uart5-idle-0 {
++      pins1 {
++        pinmux = <STM32_PINMUX('B', 13, ANALOG)>; /* USART5_TX */
++      };
++      pins2 {
++        pinmux = <STM32_PINMUX('B', 12, AF14)>; /* USART5_RX */
++        bias-disable;
++      };
++    };
++
++    uart5_sleep_pins_mx: uart5-sleep-0 {
++      pins {
++        pinmux = <STM32_PINMUX('B', 13, ANALOG)>, /* USART5_TX */
++           <STM32_PINMUX('B', 12, ANALOG)>; /* USART5_RX */
++      };
++    };
++
++    uart7_pins_mx: uart7-0 {
++      pins1 {
++        pinmux = <STM32_PINMUX('A', 15, AF13)>; /* USART7_TX */
++        bias-disable;
++        drive-push-pull;
++        slew-rate = <0>;
++      };
++      pins2 {
++        pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
++        bias-disable;
++      };
++    };
++
++  uart7_idle_pins_mx: uart7-idle-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('A', 15, ANALOG)>; /* USART7_TX */
++    };
++    pins2 {
++      pinmux = <STM32_PINMUX('B', 3, AF13)>; /* USART7_RX */
++      bias-disable;
++    };
++  };
++
++  uart7_sleep_pins_mx: uart7-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('A', 15, ANALOG)>, /* USART7_TX */
++        <STM32_PINMUX('B', 3, ANALOG)>; /* USART7_RX */
++    };
++  };
++
++  uart8_pins_mx: uart8-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('E', 1, AF8)>; /* USART8_TX */
++      bias-disable;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++    pins2 {
++      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
++      bias-disable;
++    };
++  };
++
++  uart8_idle_pins_mx: uart8-idle-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('E', 1, ANALOG)>; /* USART8_TX */
++    };
++    pins2 {
++      pinmux = <STM32_PINMUX('E', 0, AF8)>; /* USART8_RX */
++      bias-disable;
++    };
++  };
++
++  uart8_sleep_pins_mx: uart8-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('E', 1, ANALOG)>, /* USART8_TX */
++        <STM32_PINMUX('E', 0, ANALOG)>; /* USART8_RX */
++    };
++  };
++
++  m_can1_pins_mx: m-can1-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
++      slew-rate = <0>;
++      drive-push-pull;
++      bias-disable;
++    };
++    pins2 {
++      pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
++      bias-disable;
++    };
++  };
++
++  m_can1_sleep_pins_mx: m_can1-sleep@0 {
++    pins {
++      pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
++        <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
++    };
++  };
++
++  pwm1_pins_mx: pwm1-0 {
++    pins {
++      pinmux = <STM32_PINMUX('A', 9, AF1)>; /* TIM1_CH2 */
++      bias-pull-down;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++  };
++
++  pwm1_sleep_pins_mx: pwm1-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('A', 9, ANALOG)>; /* TIM1_CH1 */
++    };
++  };
++
++  pwm3_pins_mx: pwm3-0 {
++    pins {
++      pinmux = <STM32_PINMUX('B', 5, AF2)>; /* TIM3_CH2 */
++      bias-pull-down;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++  };
++
++  pwm3_sleep_pins_mx: pwm3-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('B', 5, ANALOG)>; /* TIM3_CH2 */
++    };
++  };
++
++  pwm4_pins_mx: pwm4-0 {
++    pins {
++      pinmux = <STM32_PINMUX('B', 7, AF2)>; /* TIM4_CH2 */
++      bias-pull-down;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++  };
++
++  pwm4_sleep_pins_mx: pwm4-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('B', 7, ANALOG)>; /* TIM4_CH2 */
++    };
++  };
++
++  pwm8_pins_mx: pwm8-0 {
++    pins {
++      pinmux = <STM32_PINMUX('I', 6, AF3)>; /* TIM8_CH2 */
++      bias-pull-down;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++  };
++
++  pwm8_sleep_pins_mx: pwm8-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('I', 6, ANALOG)>; /* TIM8_CH2 */
++    };
++  };
++
++
++  pwm12_pins_mx: pwm12-0 {
++    pins {
++      pinmux = <STM32_PINMUX('H', 9, AF2)>; /* TIM12_CH2 */
++      bias-pull-down;
++      drive-push-pull;
++      slew-rate = <0>;
++    };
++  };
++
++  pwm12_sleep_pins_mx: pwm12-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('H', 9, ANALOG)>; /* TIM12_CH2 */
++    };
++  };
++
+ 	sdmmc1_pins_mx: sdmmc1_mx-0 {
+ 		u-boot,dm-pre-reloc;
+ 		pins1 {
+@@ -262,7 +549,8 @@
+ 		pins1 {
+ 			u-boot,dm-pre-reloc;
+ 			pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+-			bias-disable;
++      /* pull-up on rx to avoid floating level */
++      bias-pull-up;
+ 		};
+ 		pins2 {
+ 			u-boot,dm-pre-reloc;
+@@ -281,9 +569,6 @@
+ 					 <STM32_PINMUX('G', 11, ANALOG)>; /* UART4_TX */
+ 		};
+ 	};
+-
+-	/* USER CODE BEGIN pinctrl */
+-	/* USER CODE END pinctrl */
+ };
+ 
+ &pinctrl_z {
+@@ -310,8 +595,28 @@
+ 		};
+ 	};
+ 
+-	/* USER CODE BEGIN pinctrl_z */
+-	/* USER CODE END pinctrl_z */
++  spi6_pins_mx: spi6-0 {
++    pins1 {
++      pinmux = <STM32_PINMUX('Z', 0, AF8)>, /* SPI6_SCK */
++         <STM32_PINMUX('Z', 2, AF8)>; /* SPI6_MOSI */
++      bias-disable;
++      drive-push-pull;
++      slew-rate = <1>;
++    };
++
++    pins2 {
++      pinmux = <STM32_PINMUX('Z', 1, AF8)>; /* SPI6_MISO */
++      bias-disable;
++    };
++  };
++
++  spi6_sleep_pins_mx: spi6-sleep-0 {
++    pins {
++      pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* SPI6_SCK */
++         <STM32_PINMUX('Z', 1, ANALOG)>, /* SPI6_MISO */
++         <STM32_PINMUX('Z', 2, ANALOG)>; /* SPI6_MOSI */
++    };
++  };
+ };
+ 
+ &m4_rproc{
+@@ -319,52 +624,39 @@
+ 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+ 	mbox-names = "vq0", "vq1", "shutdown";
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN m4_rproc */
+ 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+ 			<&vdev0vring1>, <&vdev0buffer>;
+ 	interrupt-parent = <&exti>;
+ 	interrupts = <68 1>;
+ 	wakeup-source;
+-	/* USER CODE END m4_rproc */
++};
++
++&pwr_regulators {
++	vdd-supply = <&vdd>;
++	vdd_3v3_usbfs-supply = <&vdd_usb>;
+ };
+ 
+ &bsec{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN bsec */
+-	/* USER CODE END bsec */
+ };
+ 
+ &crc1{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN crc1 */
+-	/* USER CODE END crc1 */
+ };
+ 
+ &cryp1{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN cryp1 */
+-	/* USER CODE END cryp1 */
+ };
+ 
+ &dma1{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN dma1 */
+ 	sram = <&dma_pool>;
+-	/* USER CODE END dma1 */
+ };
+ 
+ &dma2{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN dma2 */
+ 	sram = <&dma_pool>;
+-	/* USER CODE END dma2 */
+ };
+ 
+ &dmamux1{
+@@ -373,39 +665,57 @@
+ 	dma-channels = <16>;
+ 
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN dmamux1 */
+-	/* USER CODE END dmamux1 */
+ };
+ 
+ &dts{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN dts */
+-	/* USER CODE END dts */
+ };
+ 
+ &gpu{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN gpu */
+ 	contiguous-area = <&gpu_reserved>;
+-	/* USER CODE END gpu */
+ };
+ 
+ &hash1{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN hash1 */
+-	/* USER CODE END hash1 */
+ };
+ 
+ &hsem{
+ 	status = "okay";
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
+ 
+-	/* USER CODE BEGIN hsem */
+-	/* USER CODE END hsem */
++&i2c5 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&i2c5_pins_mx>;
++	pinctrl-1 = <&i2c5_pins_sleep_mx>;
++	i2c-scl-rising-time-ns = <100>;
++	i2c-scl-falling-time-ns = <7>;
++	status = "okay";
++	/delete-property/dmas;
++	/delete-property/dma-names;
+ };
+ 
+ &i2c4{
+@@ -415,10 +725,9 @@
+ 	pinctrl-1 = <&i2c4_sleep_pins_z_mx>;
+ 	status = "okay";
+ 
+-	/* USER CODE BEGIN i2c4 */
+ 	i2c-scl-rising-time-ns = <185>;
+ 	i2c-scl-falling-time-ns = <20>;
+-	clock-frequency = <100000>;
++	clock-frequency = <400000>;
+ 	/delete-property/ dmas;
+ 	/delete-property/ dma-names;
+ 
+@@ -573,55 +882,32 @@
+ 		reg = <0x50>;
+ 		pagesize = <16>;
+ 	};
+-	/* USER CODE END i2c4 */
+ };
+ 
+ &ipcc{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN ipcc */
+-	/* USER CODE END ipcc */
+ };
+ 
+ &iwdg2{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN iwdg2 */
+ 	timeout-sec = <32>;
+-	/* USER CODE END iwdg2 */
+ };
+ 
+ &mdma1{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN mdma1 */
+-	/* USER CODE END mdma1 */
+ };
+ 
+ &rcc{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN rcc */
+-	/* USER CODE END rcc */
+ };
+ 
+ &rng1{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN rng1 */
+-	/* USER CODE END rng1 */
+ };
+ 
+ &rtc{
+-	pinctrl-names = "default", "sleep";
+-	pinctrl-0 = <&rtc_pins_mx>;
+-	pinctrl-1 = <&rtc_sleep_pins_mx>;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN rtc */
+-	st,lsco = <RTC_OUT2_RMP>;
+-	/* USER CODE END rtc */
+ };
+ 
+ &sdmmc1{
+@@ -632,20 +918,15 @@
+ 	pinctrl-2 = <&sdmmc1_sleep_pins_mx>;
+ 	status = "okay";
+ 
+-	/* USER CODE BEGIN sdmmc1 */
+ 	cd-gpios = <&gpiog 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+ 	disable-wp;
+ 	st,neg-edge;
+ 	bus-width = <4>;
+ 	vmmc-supply = <&v3v3>;
+-	/* USER CODE END sdmmc1 */
+ };
+ 
+ &tamp{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN tamp */
+-	/* USER CODE END tamp */
+ };
+ 
+ &uart4{
+@@ -655,78 +936,63 @@
+ 	pinctrl-1 = <&uart4_sleep_pins_mx>;
+ 	status = "okay";
+ 
+-	/* USER CODE BEGIN uart4 */
+ 	/delete-property/ dmas;
+ 	/delete-property/ dma-names;
+-	/* USER CODE END uart4 */
+ };
+ 
+ &usbh_ehci{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbh_ehci */
+ 	phys = <&usbphyc_port0>;
+-	/* USER CODE END usbh_ehci */
+ };
+ 
+ &usbh_ohci{
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbh_ohci */
+-	/* USER CODE END usbh_ohci */
+ };
+ 
+ &usbotg_hs{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbotg_hs */
+ 	phys = <&usbphyc_port1 0>;
+ 	phy-names = "usb2-phy";
+-	/* USER CODE END usbotg_hs */
+ };
+ 
+ &usbphyc{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbphyc */
+-	/* USER CODE END usbphyc */
+ };
+ 
+ &usbphyc_port0{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbphyc_port0 */
+ 	phy-supply = <&vdd_usb>;
+ 	st,phy-tuning = <&usb_phy_tuning>;
+-	/* USER CODE END usbphyc_port0 */
+ };
+ 
+ &usbphyc_port1{
+ 	u-boot,dm-pre-reloc;
+ 	status = "okay";
+-
+-	/* USER CODE BEGIN usbphyc_port1 */
+ 	phy-supply = <&vdd_usb>;
+ 	st,phy-tuning = <&usb_phy_tuning>;
+-	/* USER CODE END usbphyc_port1 */
+-};
+-
+-&vrefbuf{
+-	status = "okay";
+-
+-	/* USER CODE BEGIN vrefbuf */
+-	regulator-min-microvolt = <2500000>;
+-	regulator-max-microvolt = <2500000>;
+-	vdda-supply = <&vdd>;
+-	/* USER CODE END vrefbuf */
+ };
+ 
+-/* USER CODE BEGIN addons */
+ &adc {
+-	status = "disabled";
++  vdd-supply = <&vdd>;
++  vdda-supply = <&vdda>;
++  vref-supply = <&vdda>;
++	status = "okay";
++  adc1: adc@0 {
++    st,min-sample-time-nsecs = <5000>;
++    st,adc-channels = <0 1>;
++    status = "okay";
++  };
++
++  adc2: adc@100 {
++    status = "okay";
++  };
++
++  adc_temp: temp {
++    status = "okay";
++  };
+ };
+ 
+ &usbh_ohci{
+@@ -742,7 +1008,6 @@
+ };
+ 
+ &sram{
+-
+ 	dma_pool:dma_pool@0{
+ 		reg = <0x50000 0x10000>;
+ 		pool;
+@@ -752,5 +1017,151 @@
+ &optee{
+ 	status = "okay";
+ };
+-/* USER CODE END addons */
+ 
++&spi2 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi2_pins_mx>;
++	pinctrl-1 = <&spi2_sleep_pins_mx>;
++  cs-gpios = <&gpioi 0 0>;
++	status = "okay";
++
++  spidev2: spidev2@0{
++    compatible = "rohm,dh2228fv";
++    spi-max-frequency = <30000000>;
++    reg = <0>;
++  };
++};
++
++&spi4 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi4_pins_mx>;
++	pinctrl-1 = <&spi4_sleep_pins_mx>;
++  cs-gpios = <&gpioe 11 0>;
++	status = "okay";
++
++  spidev4: spidev4@0{
++    compatible = "rohm,dh2228fv";
++    spi-max-frequency = <30000000>;
++    reg = <0>;
++  };
++};
++
++&spi6 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&spi6_pins_mx>;
++	pinctrl-1 = <&spi6_sleep_pins_mx>;
++  cs-gpios = <&gpioz 3 0>;
++	status = "okay";
++
++  spidev6: spidev6@0{
++    compatible = "rohm,dh2228fv";
++    spi-max-frequency = <30000000>;
++    reg = <0>;
++  };
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
++  can-transceiver {
++    max-bitrate = <5000000>;
++  };
++};
++
++&timers1 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	pwm1: pwm {
++    pinctrl-names = "default", "sleep";
++	  pinctrl-0 = <&pwm1_pins_mx>;
++	  pinctrl-1 = <&pwm1_sleep_pins_mx>;
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
++    pinctrl-names = "default", "sleep";
++	  pinctrl-0 = <&pwm3_pins_mx>;
++	  pinctrl-1 = <&pwm3_sleep_pins_mx>;
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
++    pinctrl-names = "default", "sleep";
++	  pinctrl-0 = <&pwm4_pins_mx>;
++	  pinctrl-1 = <&pwm4_sleep_pins_mx>;
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
++    pinctrl-names = "default", "sleep";
++	  pinctrl-0 = <&pwm8_pins_mx>;
++	  pinctrl-1 = <&pwm8_sleep_pins_mx>;
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
++    pinctrl-names = "default", "sleep";
++	  pinctrl-0 = <&pwm12_pins_mx>;
++	  pinctrl-1 = <&pwm12_sleep_pins_mx>;
++		status = "okay";
++	};
++};
+-- 
+2.17.1
+
diff --git a/board/octavo/brk/uboot-patches/0008-Fix-missing-DDR-include-file.patch b/board/octavo/brk/uboot-patches/0008-Fix-missing-DDR-include-file.patch
new file mode 100644
index 0000000000..098ab8fe9f
--- /dev/null
+++ b/board/octavo/brk/uboot-patches/0008-Fix-missing-DDR-include-file.patch
@@ -0,0 +1,263 @@
+From 067c36c6e425a85113dc279f33174c315272a3ac Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
+Date: Wed, 23 Sep 2020 11:48:28 -0500
+Subject: [PATCH 3/4] Fix missing DDR include file
+
+---
+ .../dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi  | 130 ++++++------------
+ 1 file changed, 39 insertions(+), 91 deletions(-)
+
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+index 8f0e39f040..c061308628 100644
+--- a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+@@ -1,7 +1,6 @@
+ /* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause*/
+ /*
+- * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+- * Author: STM32CubeMX code generation for STMicroelectronics.
++ * Copyright (C) 2020, Octavo Systems LLC - All Rights Reserved
+  */
+ 
+ /* For more information on Device Tree configuration, please refer to
+@@ -9,18 +8,14 @@
+  */
+ 
+ #include <dt-bindings/clock/stm32mp1-clksrc.h>
+-#include "osd32mp1.dtsi"
++#include "stm32mp15-osd32mp1-ddr3-1x4Gb.dtsi"
+ 
+ #include "stm32mp15-u-boot.dtsi"
+ #include "stm32mp15-ddr.dtsi"
+ 
+-/* USER CODE BEGIN includes */
+-/* USER CODE END includes */
+ 
+ / {
+ 
+-	/* USER CODE BEGIN root */
+-
+ 	aliases{
+ 		i2c0 = &i2c4;
+ 		mmc0 = &sdmmc1;
+@@ -34,47 +29,27 @@
+ 		st,stm32prog-gpios = <&gpiod 9 GPIO_ACTIVE_LOW>;
+ 	};
+ 
+-	/* USER CODE END root */
+-
+ 	clocks {
+ 		u-boot,dm-pre-reloc;
+ 
+-		/* USER CODE BEGIN clocks */
+-		/* USER CODE END clocks */
+-
+ #ifndef CONFIG_STM32MP1_TRUSTED
+ 		clk_lsi: clk-lsi {
+ 			u-boot,dm-pre-reloc;
+-
+-			/* USER CODE BEGIN clk_lsi */
+-			/* USER CODE END clk_lsi */
+ 		};
+ 		clk_hsi: clk-hsi {
+ 			u-boot,dm-pre-reloc;
+-
+-			/* USER CODE BEGIN clk_hsi */
+-			/* USER CODE END clk_hsi */
+ 		};
+ 		clk_csi: clk-csi {
+ 			u-boot,dm-pre-reloc;
+ 			status = "disabled";
+-
+-			/* USER CODE BEGIN clk_csi */
+-			/* USER CODE END clk_csi */
+ 		};
+ 		clk_lse: clk-lse {
+ 			u-boot,dm-pre-reloc;
+ 			st,drive = < LSEDRV_MEDIUM_HIGH >;
+-
+-			/* USER CODE BEGIN clk_lse */
+-			/* USER CODE END clk_lse */
+ 		};
+ 		clk_hse: clk-hse {
+ 			u-boot,dm-pre-reloc;
+ 			st,digbypass;
+-
+-			/* USER CODE BEGIN clk_hse */
+-			/* USER CODE END clk_hse */
+ 		};
+ #endif	/*CONFIG_STM32MP1_TRUSTED*/
+ 	};
+@@ -110,36 +85,41 @@
+ 		0 		/*MCO2*/
+ 	>;
+ 	st,pkcs = <
+-		CLK_CKPER_DISABLED
+-		CLK_ETH_DISABLED
+-		CLK_SDMMC12_PLL4P
+-		CLK_STGEN_HSE
+-		CLK_USBPHY_HSE
+-		CLK_SPI2S1_DISABLED
+-		CLK_SPI2S23_DISABLED
+-		CLK_SPI45_DISABLED
+-		CLK_SPI6_DISABLED
+-		CLK_I2C46_HSI
+-		CLK_SDMMC3_DISABLED
+-		CLK_USBO_USBPHY
+-		CLK_ADC_DISABLED
+-		CLK_CEC_DISABLED
+-		CLK_I2C12_DISABLED
+-		CLK_I2C35_DISABLED
+-		CLK_UART1_DISABLED
+-		CLK_UART24_HSI
+-		CLK_UART35_DISABLED
+-		CLK_UART6_DISABLED
+-		CLK_UART78_DISABLED
+-		CLK_SPDIF_DISABLED
+-		CLK_SAI1_DISABLED
+-		CLK_SAI2_DISABLED
+-		CLK_SAI3_DISABLED
+-		CLK_SAI4_DISABLED
+-		CLK_RNG1_LSI
+-		CLK_LPTIM1_DISABLED
+-		CLK_LPTIM23_DISABLED
+-		CLK_LPTIM45_DISABLED
++    CLK_CKPER_HSE
++    CLK_FMC_ACLK
++    CLK_QSPI_ACLK
++    CLK_ETH_DISABLED
++    CLK_SDMMC12_PLL4P
++    CLK_DSI_DSIPLL
++    CLK_STGEN_HSE
++    CLK_USBPHY_HSE
++    CLK_SPI2S1_PLL3Q
++    CLK_SPI2S23_PLL3Q
++    CLK_SPI45_HSI
++    CLK_SPI6_HSI
++    CLK_I2C46_HSI
++    CLK_SDMMC3_PLL4P
++    CLK_USBO_USBPHY
++    CLK_ADC_CKPER
++    CLK_CEC_LSE
++    CLK_I2C12_HSI
++    CLK_I2C35_HSI
++    CLK_UART1_HSI
++    CLK_UART24_HSI
++    CLK_UART35_HSI
++    CLK_UART6_HSI
++    CLK_UART78_HSI
++    CLK_SPDIF_PLL4P
++    CLK_FDCAN_PLL4R
++    CLK_SAI1_PLL3Q
++    CLK_SAI2_PLL3Q
++    CLK_SAI3_PLL3Q
++    CLK_SAI4_PLL3Q
++    CLK_RNG1_LSI
++    CLK_RNG2_LSI
++    CLK_LPTIM1_PCLK1
++    CLK_LPTIM23_PCLK3
++    CLK_LPTIM45_LSE
+ 	>;
+ 	pll2:st,pll@1 {
+ 		compatible = "st,stm32mp1-pll";
+@@ -151,88 +131,59 @@
+ 	pll3:st,pll@2 {
+ 		compatible = "st,stm32mp1-pll";
+ 		reg = <2>;
+-		cfg = < 1 33 1 16 36 PQR(1,0,0) >;
++		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
+ 		frac = < 0x1a04 >;
+ 		u-boot,dm-pre-reloc;
+ 	};
+ 	pll4:st,pll@3 {
+ 		compatible = "st,stm32mp1-pll";
+ 		reg = <3>;
+-		cfg = < 3 98 5 7 7 PQR(1,0,0) >;
++		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
+ 		u-boot,dm-pre-reloc;
+ 	};
+ };
+ 
+ &i2c4{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN i2c4 */
+-	/* USER CODE END i2c4 */
+ };
+ 
+ &sdmmc1{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN sdmmc1 */
+-	/* USER CODE END sdmmc1 */
+ };
+ 
+ #endif	/*CONFIG_STM32MP1_TRUSTED*/
+ 
+ &cryp1{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN cryp1 */
+-	/* USER CODE END cryp1 */
+ };
+ 
+ &hash1{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN hash1 */
+-	/* USER CODE END hash1 */
+ };
+ 
+ &uart4{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN uart4 */
+-	/* USER CODE END uart4 */
+ };
+ 
+ &usbotg_hs{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN usbotg_hs */
+ 	u-boot,force-b-session-valid;
+ 	hnp-srp-disable;
+ 	dr_mode = "peripheral";
+-	/* USER CODE END usbotg_hs */
+ };
+ 
+ &usbphyc{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN usbphyc */
+-	/* USER CODE END usbphyc */
+ };
+ 
+ &usbphyc_port0{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN usbphyc_port0 */
+-	/* USER CODE END usbphyc_port0 */
+ };
+ 
+ &usbphyc_port1{
+ 	u-boot,dm-pre-reloc;
+-
+-	/* USER CODE BEGIN usbphyc_port1 */
+-	/* USER CODE END usbphyc_port1 */
+ };
+ 
+-/* USER CODE BEGIN addons */
+-
+ &adc{
+ 	status = "okay";
+ };
+@@ -250,6 +201,3 @@
+ 	clocks = <&rcc SAI2>, <&rcc PLL3_Q>, <&rcc PLL3_R>;
+ };
+ #endif /*CONFIG_STM32MP1_TRUSTED*/
+-
+-/* USER CODE END addons */
+-
+-- 
+2.17.1
+
diff --git a/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch b/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch
new file mode 100644
index 0000000000..522a55f300
--- /dev/null
+++ b/board/octavo/brk/uboot-patches/0009-Fix-Cube-programmer-GPIO-default-level.patch
@@ -0,0 +1,25 @@
+From 7c5db44f99c2945b510160269b73d305a4db3c96 Mon Sep 17 00:00:00 2001
+From: "neeraj.dantu" <neeraj.dantu@octavosystems.com>
+Date: Wed, 23 Sep 2020 18:29:52 -0500
+Subject: [PATCH 4/4] Fix Cube programmer GPIO default level
+
+---
+ arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+index c061308628..38a0458838 100644
+--- a/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
++++ b/arch/arm/dts/stm32mp157c-osd32mp1-brk-u-boot.dtsi
+@@ -26,7 +26,7 @@
+ 		u-boot,boot-led = "LED2_GRN";
+ 		u-boot,error-led = "LED2_RED";
+ 		u-boot,mmc-env-partition = "ssbl";
+-		st,stm32prog-gpios = <&gpiod 9 GPIO_ACTIVE_LOW>;
++		st,stm32prog-gpios = <&gpiod 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+ 	};
+ 
+ 	clocks {
+-- 
+2.17.1
+
diff --git a/configs/octavo_osd32mp1_brk_defconfig b/configs/octavo_osd32mp1_brk_defconfig
new file mode 100644
index 0000000000..3cb333441d
--- /dev/null
+++ b/configs/octavo_osd32mp1_brk_defconfig
@@ -0,0 +1,39 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_ROOTFS_OVERLAY="board/octavo/brk/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/octavo/brk/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v5.4-stm32mp-r1.1"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/octavo/brk/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-osd32mp1-brk"
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/octavo/brk/linux-dts/*"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.2-stm32mp-r2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/octavo/brk/tfa-dts/*"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-osd32mp1-brk.dtb STM32MP_USB_PROGRAMMER=1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/STMicroelectronics/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2020.01-stm32mp-r1.1"
+BR2_TARGET_UBOOT_PATCH="board/octavo/brk/uboot-patches/*.patch"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-osd32mp1-brk"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
