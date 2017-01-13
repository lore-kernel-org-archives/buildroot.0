From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:17:49 +0100
Subject: [Buildroot] [git commit] configs/liteboard: Bump Linux to 4.9.2
Message-ID: <20170113152114.95E507F87B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5094506f7b8f4933fc0c7550b42b343f9299729d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches from 4.8 version don't apply. Update them by backporting
liteBoard support from Linux master branch.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch |  9 +++--
 ...0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch | 45 ++++++++++------------
 configs/grinn_liteboard_defconfig                  |  4 +-
 3 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch b/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
index 0f124b2..b6ea1b6 100644
--- a/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
+++ b/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
@@ -1,6 +1,6 @@
-From 35d7c23bde44d18205a2730df9acf75d83220c3a Mon Sep 17 00:00:00 2001
+From 8cbabc57257bdbf5f1cf039a265c875da8ddc2e9 Mon Sep 17 00:00:00 2001
 From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Wed, 7 Sep 2016 15:10:45 +0200
+Date: Fri, 21 Oct 2016 17:07:16 +0200
 Subject: [PATCH 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
 
 This is a SOM (System on Module), so it will be part of another boards.
@@ -14,6 +14,7 @@ Hardware specification:
 
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
 ---
  arch/arm/boot/dts/imx6ul-litesom.dtsi | 82 +++++++++++++++++++++++++++++++++++
  1 file changed, 82 insertions(+)
@@ -21,7 +22,7 @@ Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
 
 diff --git a/arch/arm/boot/dts/imx6ul-litesom.dtsi b/arch/arm/boot/dts/imx6ul-litesom.dtsi
 new file mode 100644
-index 0000000..461292d
+index 000000000000..461292d33417
 --- /dev/null
 +++ b/arch/arm/boot/dts/imx6ul-litesom.dtsi
 @@ -0,0 +1,82 @@
@@ -108,5 +109,5 @@ index 0000000..461292d
 +	status = "okay";
 +};
 -- 
-2.10.0
+2.11.0
 
diff --git a/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch b/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
index 3455cbb..c73cd4f 100644
--- a/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
+++ b/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
@@ -1,6 +1,6 @@
-From 58669b4a74343673c6e75c5312e87b24634773fb Mon Sep 17 00:00:00 2001
+From 35a8bca870bedebb9d37ad58b905863cba780f9f Mon Sep 17 00:00:00 2001
 From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Wed, 7 Sep 2016 15:10:53 +0200
+Date: Fri, 21 Oct 2016 17:07:17 +0200
 Subject: [PATCH 2/2] ARM: dts: imx6ul: Add DTS for liteBoard
 
 liteBoard is a development board which uses liteSOM as its base.
@@ -13,30 +13,31 @@ Hardware specification:
 
 Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
 ---
  arch/arm/boot/dts/Makefile             |   1 +
- arch/arm/boot/dts/imx6ul-liteboard.dts | 153 +++++++++++++++++++++++++++++++++
- 2 files changed, 154 insertions(+)
+ arch/arm/boot/dts/imx6ul-liteboard.dts | 147 +++++++++++++++++++++++++++++++++
+ 2 files changed, 148 insertions(+)
  create mode 100644 arch/arm/boot/dts/imx6ul-liteboard.dts
 
 diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
-index faacd52..b149313 100644
+index c558ba75cbcc..a587ce231f83 100644
 --- a/arch/arm/boot/dts/Makefile
 +++ b/arch/arm/boot/dts/Makefile
-@@ -407,6 +407,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
- 	imx6sx-sdb.dtb
+@@ -420,6 +420,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
  dtb-$(CONFIG_SOC_IMX6UL) += \
  	imx6ul-14x14-evk.dtb \
+ 	imx6ul-geam-kit.dtb \
 +	imx6ul-liteboard.dtb \
  	imx6ul-pico-hobbit.dtb \
  	imx6ul-tx6ul-0010.dtb \
  	imx6ul-tx6ul-0011.dtb \
 diff --git a/arch/arm/boot/dts/imx6ul-liteboard.dts b/arch/arm/boot/dts/imx6ul-liteboard.dts
 new file mode 100644
-index 0000000..f2e04f2
+index 000000000000..6e04cb9202f4
 --- /dev/null
 +++ b/arch/arm/boot/dts/imx6ul-liteboard.dts
-@@ -0,0 +1,153 @@
+@@ -0,0 +1,147 @@
 +/*
 + * Copyright 2016 Grinn
 + *
@@ -93,20 +94,14 @@ index 0000000..f2e04f2
 +		stdout-path = &uart1;
 +	};
 +
-+	regulators {
-+		compatible = "simple-bus";
-+		#address-cells = <1>;
-+		#size-cells = <0>;
-+
-+		reg_usb_otg1_vbus: usb_otg1_regulator {
-+			compatible = "regulator-fixed";
-+			pinctrl-names = "default";
-+			pinctrl-0 = <&pinctrl_usb_otg1_vbus>;
-+			regulator-name = "usb_otg1_vbus";
-+			regulator-min-microvolt = <5000000>;
-+			regulator-max-microvolt = <5000000>;
-+			gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
-+		};
++	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
++		compatible = "regulator-fixed";
++		pinctrl-names = "default";
++		pinctrl-0 = <&pinctrl_usb_otg1_vbus>;
++		regulator-name = "usb_otg1_vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
 +	};
 +};
 +
@@ -145,7 +140,7 @@ index 0000000..f2e04f2
 +		>;
 +	};
 +
-+	pinctrl_usb_otg1_vbus: usb_otg1_vbus {
++	pinctrl_usb_otg1_vbus: usb-otg1-vbus {
 +		fsl,pins = <
 +			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x79
 +		>;
@@ -191,5 +186,5 @@ index 0000000..f2e04f2
 +	status = "okay";
 +};
 -- 
-2.10.0
+2.11.0
 
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index c5fb5f0..11c240f 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_GLOBAL_PATCH_DIR="board/grinn/liteboard/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.2"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
