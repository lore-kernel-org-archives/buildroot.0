From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 16:11:05 +0100
Subject: [Buildroot] [git commit] configs/liteboard: Bump to kernel 4.10
Message-ID: <20170301170423.A782C7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c75f0a4d69db655bb523fbab30e0f4656bc5fb71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imx6ul-liteboard dts patches have been upstreamed in kernel 4.10,
so bump to this version and remove the local patches

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch | 113 ------------
 ...0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch | 190 ---------------------
 configs/grinn_liteboard_defconfig                  |   5 +-
 3 files changed, 2 insertions(+), 306 deletions(-)

diff --git a/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch b/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
deleted file mode 100644
index b6ea1b6..0000000
--- a/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 8cbabc57257bdbf5f1cf039a265c875da8ddc2e9 Mon Sep 17 00:00:00 2001
-From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Fri, 21 Oct 2016 17:07:16 +0200
-Subject: [PATCH 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
-
-This is a SOM (System on Module), so it will be part of another boards.
-Hence, this is a "dtsi" file that will be included from another device
-tree files.
-
-Hardware specification:
- * Freescale i.MX6UL SoC
- * up to 512 MB RAM
- * eMMC on uSDHC2
-
-Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
-Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
-Signed-off-by: Shawn Guo <shawnguo@kernel.org>
----
- arch/arm/boot/dts/imx6ul-litesom.dtsi | 82 +++++++++++++++++++++++++++++++++++
- 1 file changed, 82 insertions(+)
- create mode 100644 arch/arm/boot/dts/imx6ul-litesom.dtsi
-
-diff --git a/arch/arm/boot/dts/imx6ul-litesom.dtsi b/arch/arm/boot/dts/imx6ul-litesom.dtsi
-new file mode 100644
-index 000000000000..461292d33417
---- /dev/null
-+++ b/arch/arm/boot/dts/imx6ul-litesom.dtsi
-@@ -0,0 +1,82 @@
-+/*
-+ * Copyright 2016 Grinn
-+ *
-+ * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
-+ *
-+ * This file is dual-licensed: you can use it either under the terms
-+ * of the GPL or the X11 license, at your option. Note that this dual
-+ * licensing only applies to this file, and not this project as a
-+ * whole.
-+ *
-+ *  a) This file is free software; you can redistribute it and/or
-+ *     modify it under the terms of the GNU General Public License
-+ *     version 2 as published by the Free Software Foundation.
-+ *
-+ *     This file is distributed in the hope that it will be useful
-+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *     GNU General Public License for more details.
-+ *
-+ * Or, alternatively
-+ *
-+ *  b) Permission is hereby granted, free of charge, to any person
-+ *     obtaining a copy of this software and associated documentation
-+ *     files (the "Software"), to deal in the Software without
-+ *     restriction, including without limitation the rights to use
-+ *     copy, modify, merge, publish, distribute, sublicense, and/or
-+ *     sell copies of the Software, and to permit persons to whom the
-+ *     Software is furnished to do so, subject to the following
-+ *     conditions:
-+ *
-+ *     The above copyright notice and this permission notice shall be
-+ *     included in all copies or substantial portions of the Software.
-+ *
-+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
-+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
-+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-+ *     OTHER DEALINGS IN THE SOFTWARE.
-+ */
-+
-+#include "imx6ul.dtsi"
-+
-+/ {
-+	model = "Grinn i.MX6UL liteSOM";
-+	compatible = "grinn,imx6ul-litesom", "fsl,imx6ul";
-+
-+	memory {
-+		reg = <0x80000000 0x20000000>;
-+	};
-+};
-+
-+&iomuxc {
-+	pinctrl_usdhc2: usdhc2grp {
-+		fsl,pins = <
-+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK	    0x10069
-+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD	    0x17059
-+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0 0x17059
-+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1 0x17059
-+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2 0x17059
-+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3 0x17059
-+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4 0x17059
-+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5 0x17059
-+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6 0x17059
-+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7 0x17059
-+			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B  0x17059
-+		>;
-+	};
-+};
-+
-+&usdhc2 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_usdhc2>;
-+	no-1-8-v;
-+	non-removable;
-+	keep-power-in-suspend;
-+	wakeup-source;
-+	bus-width = <8>;
-+	status = "okay";
-+};
--- 
-2.11.0
-
diff --git a/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch b/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
deleted file mode 100644
index c73cd4f..0000000
--- a/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From 35a8bca870bedebb9d37ad58b905863cba780f9f Mon Sep 17 00:00:00 2001
-From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Fri, 21 Oct 2016 17:07:17 +0200
-Subject: [PATCH 2/2] ARM: dts: imx6ul: Add DTS for liteBoard
-
-liteBoard is a development board which uses liteSOM as its base.
-
-Hardware specification:
- * liteSOM (i.MX6UL, DRAM, eMMC)
- * Ethernet PHY (id 0)
- * USB host (usb_otg1)
- * MicroSD slot (uSDHC1)
-
-Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
-Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
-Signed-off-by: Shawn Guo <shawnguo@kernel.org>
----
- arch/arm/boot/dts/Makefile             |   1 +
- arch/arm/boot/dts/imx6ul-liteboard.dts | 147 +++++++++++++++++++++++++++++++++
- 2 files changed, 148 insertions(+)
- create mode 100644 arch/arm/boot/dts/imx6ul-liteboard.dts
-
-diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
-index c558ba75cbcc..a587ce231f83 100644
---- a/arch/arm/boot/dts/Makefile
-+++ b/arch/arm/boot/dts/Makefile
-@@ -420,6 +420,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
- dtb-$(CONFIG_SOC_IMX6UL) += \
- 	imx6ul-14x14-evk.dtb \
- 	imx6ul-geam-kit.dtb \
-+	imx6ul-liteboard.dtb \
- 	imx6ul-pico-hobbit.dtb \
- 	imx6ul-tx6ul-0010.dtb \
- 	imx6ul-tx6ul-0011.dtb \
-diff --git a/arch/arm/boot/dts/imx6ul-liteboard.dts b/arch/arm/boot/dts/imx6ul-liteboard.dts
-new file mode 100644
-index 000000000000..6e04cb9202f4
---- /dev/null
-+++ b/arch/arm/boot/dts/imx6ul-liteboard.dts
-@@ -0,0 +1,147 @@
-+/*
-+ * Copyright 2016 Grinn
-+ *
-+ * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
-+ *
-+ * This file is dual-licensed: you can use it either under the terms
-+ * of the GPL or the X11 license, at your option. Note that this dual
-+ * licensing only applies to this file, and not this project as a
-+ * whole.
-+ *
-+ *  a) This file is free software; you can redistribute it and/or
-+ *     modify it under the terms of the GNU General Public License
-+ *     version 2 as published by the Free Software Foundation.
-+ *
-+ *     This file is distributed in the hope that it will be useful
-+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *     GNU General Public License for more details.
-+ *
-+ * Or, alternatively
-+ *
-+ *  b) Permission is hereby granted, free of charge, to any person
-+ *     obtaining a copy of this software and associated documentation
-+ *     files (the "Software"), to deal in the Software without
-+ *     restriction, including without limitation the rights to use
-+ *     copy, modify, merge, publish, distribute, sublicense, and/or
-+ *     sell copies of the Software, and to permit persons to whom the
-+ *     Software is furnished to do so, subject to the following
-+ *     conditions:
-+ *
-+ *     The above copyright notice and this permission notice shall be
-+ *     included in all copies or substantial portions of the Software.
-+ *
-+ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
-+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
-+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-+ *     OTHER DEALINGS IN THE SOFTWARE.
-+ */
-+
-+/dts-v1/;
-+
-+#include "imx6ul-litesom.dtsi"
-+
-+/ {
-+	model = "Grinn i.MX6UL liteBoard";
-+	compatible = "grinn,imx6ul-liteboard", "grinn,imx6ul-litesom",
-+		     "fsl,imx6ul";
-+
-+	chosen {
-+		stdout-path = &uart1;
-+	};
-+
-+	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
-+		compatible = "regulator-fixed";
-+		pinctrl-names = "default";
-+		pinctrl-0 = <&pinctrl_usb_otg1_vbus>;
-+		regulator-name = "usb_otg1_vbus";
-+		regulator-min-microvolt = <5000000>;
-+		regulator-max-microvolt = <5000000>;
-+		gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
-+	};
-+};
-+
-+&iomuxc {
-+	pinctrl_enet1: enet1grp {
-+		fsl,pins = <
-+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
-+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
-+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
-+			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
-+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00 0x1b0b0
-+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01 0x1b0b0
-+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
-+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00 0x1b0b0
-+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01 0x1b0b0
-+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
-+		>;
-+	};
-+
-+	pinctrl_uart1: uart1grp {
-+		fsl,pins = <
-+			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
-+			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
-+		>;
-+	};
-+
-+	pinctrl_usdhc1: usdhc1grp {
-+		fsl,pins = <
-+			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x17059
-+			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
-+			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10071
-+			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
-+			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
-+			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
-+			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
-+		>;
-+	};
-+
-+	pinctrl_usb_otg1_vbus: usb-otg1-vbus {
-+		fsl,pins = <
-+			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x79
-+		>;
-+	};
-+};
-+
-+&fec1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_enet1>;
-+	phy-mode = "rmii";
-+	phy-handle = <&ethphy0>;
-+	status = "okay";
-+
-+	mdio {
-+		#address-cells = <1>;
-+		#size-cells = <0>;
-+
-+		ethphy0: ethernet-phy at 0 {
-+			reg = <0>;
-+		};
-+	};
-+};
-+
-+&uart1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_uart1>;
-+	status = "okay";
-+};
-+
-+&usbotg1 {
-+	vbus-supply = <&reg_usb_otg1_vbus>;
-+	dr_mode = "host";
-+	status = "okay";
-+};
-+
-+&usdhc1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&pinctrl_usdhc1>;
-+	cd-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
-+	no-1-8-v;
-+	keep-power-in-suspend;
-+	wakeup-source;
-+	status = "okay";
-+};
--- 
-2.11.0
-
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index 11c240f..70ec296 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,13 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_GLOBAL_PATCH_DIR="board/grinn/liteboard/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
