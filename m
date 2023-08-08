Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9392EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBDD82FD5;
	Thu,  7 Sep 2023 15:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBDD82FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXs7TMWOKoyg; Thu,  7 Sep 2023 15:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C5D83B9E;
	Thu,  7 Sep 2023 15:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C5D83B9E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3851BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30B4641D9C
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B4641D9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npxBEEaLHH2q for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2642441DBA
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2642441DBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F6B886A21; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 21:41:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac65841defece904e91afe1fb51419084c993dba
X-Git-Newrev: f47b5e39fb1347ecf7d60ca76cd525f00f11624a
X-Patchwork-Hint: ignore
Message-Id: <20230907145128.1F6B886A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/icnova-a20-adb4006: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=f47b5e39fb1347ecf7d60ca76cd525f00f11624a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig for ICnova A20 SomPi compute module on ADB4006
development board with Allwinner A20 chip and 512MB/1GB RAM.

Board support package includes the following components:
- mainline Linux kernel 6.1.35
- mainline U-Boot 2023.04
- custom dts & uboot defconfig
- default packages from buildoot

https://wiki.in-circuit.de/index.php5?title=ICnova_ADB4006
https://wiki.in-circuit.de/index.php5?title=ICnova_A20_SODIMM

The Linux DTS is already accepted upstream and will be part of Linux
6.5:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/boot/dts?id=de2bdfb7f79d5c655eb056d459e02be2c7f13c8b

The U-Boot DTS and defconfig have been submitted:
https://lists.denx.de/pipermail/u-boot/2023-May/518688.html

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |   4 +
 board/in-circuit/icnova-a20-adb4006/boot.cmd       |   5 +
 board/in-circuit/icnova-a20-adb4006/genimage.cfg   |  38 ++++++
 board/in-circuit/icnova-a20-adb4006/linux.fragment |   1 +
 .../sun7i-a20-icnova-a20-adb4006.dts               | 137 +++++++++++++++++++++
 .../sun7i-a20-icnova-a20-adb4006_uboot_defconfig   |  20 +++
 .../icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi   |  62 ++++++++++
 configs/icnova-a20-adb4006_defconfig               |  50 ++++++++
 8 files changed, 317 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b6010a556..478e32b08f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1948,6 +1948,10 @@ F:	package/python-simplejson/
 F:	package/python-versiontools/
 F:	package/wilc-firmware/
 
+N:	Ludwig Kormann <ludwig.kormann@ict42.de>
+F:	board/in-circuit/
+F:	configs/icnova*
+
 N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
 F:	board/freescale/imx8qmmek/
 F:	configs/freescale_imx8qmmek_defconfig
diff --git a/board/in-circuit/icnova-a20-adb4006/boot.cmd b/board/in-circuit/icnova-a20-adb4006/boot.cmd
new file mode 100644
index 0000000000..93d32a5e5f
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-icnova-a20-adb4006.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/in-circuit/icnova-a20-adb4006/genimage.cfg b/board/in-circuit/icnova-a20-adb4006/genimage.cfg
new file mode 100644
index 0000000000..4975d679be
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the ICnova A20 SomPi on ADB4006
+# Based in the Cubieboard2 genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-icnova-a20-adb4006.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/in-circuit/icnova-a20-adb4006/linux.fragment b/board/in-circuit/icnova-a20-adb4006/linux.fragment
new file mode 100644
index 0000000000..1c99df12e6
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/linux.fragment
@@ -0,0 +1 @@
+CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=y
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
new file mode 100644
index 0000000000..577ead1d02
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright (C) 2023 In-Circuit GmbH
+
+/dts-v1/;
+
+#include "sun7i-a20-icnova-a20.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "In-Circuit ICnova A20 ADB4006";
+	compatible = "incircuit,icnova-a20-adb4006", "incircuit,icnova-a20",
+		     "allwinner,sun7i-a20";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_YELLOW>;
+			gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* PH21 */
+			default-state = "on";
+		};
+
+		led-1 {
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>; /* PH20 */
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&ahci {
+	target-supply = <&reg_ahci_5v>;
+	status = "okay";
+};
+
+&codec {
+	status = "okay";
+};
+
+&de {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 1 GPIO_ACTIVE_LOW>; /* PH1 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&reg_ahci_5v {
+	status = "okay";
+};
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_usb1_vbus {
+	status = "okay";
+};
+
+&reg_usb2_vbus {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_vbus_det-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+	usb2_vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+};
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
new file mode 100644
index 0000000000..f70ffe45ab
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig
@@ -0,0 +1,20 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-icnova-a20-adb4006"
+CONFIG_SPL=y
+CONFIG_MACH_SUN7I=y
+CONFIG_DRAM_CLK=384
+CONFIG_AHCI=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SCSI_AHCI=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_ETH_DESIGNWARE=y
+CONFIG_MII=y
+CONFIG_SUN7I_GMAC=y
+CONFIG_AXP_ALDO4_VOLT=2800
+CONFIG_SCSI=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
diff --git a/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi
new file mode 100644
index 0000000000..46616c6bc8
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright (C) 2023 In-Circuit GmbH
+
+#include "sun7i-a20.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_mii_pins>;
+	phy-handle = <&phy1>;
+	phy-mode = "mii";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&gmac_mdio {
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
+
+#include "axp209.dtsi"
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1400000>;
+	regulator-name = "vdd-int-dll";
+};
+
+&reg_ldo1 {
+	regulator-name = "vdd-rtc";
+};
+
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "avcc";
+};
diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
new file mode 100644
index 0000000000..d572bbd0b5
--- /dev/null
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -0,0 +1,50 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 6.1 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="ICnova A20 ADB4006"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ICnova A20 ADB4006!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/in-circuit/icnova-a20-adb4006/genimage.cfg"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.35"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_USE_CUSTOM_CONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006_uboot_defconfig"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20.dtsi board/in-circuit/icnova-a20-adb4006/sun7i-a20-icnova-a20-adb4006.dts"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/in-circuit/icnova-a20-adb4006/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
