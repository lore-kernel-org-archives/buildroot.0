Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35116C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E37A941DFD;
	Mon,  4 Dec 2023 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37A941DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IukR_QLg5UlF; Mon,  4 Dec 2023 20:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0181A42082;
	Mon,  4 Dec 2023 20:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0181A42082
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B47AD1BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B416C60FF6
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B416C60FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNT9QEvsJ2Li for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A7A60FC8
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A7A60FC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96D8A879B8; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 17:56:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 593c259cde9ac646b70281a71336b6465dd39b37
X-Git-Newrev: 8e9681c52e448902c335418b9199cc6d9e23b726
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.96D8A879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/orangepi_zero: bump BSP versions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8e9681c52e448902c335418b9199cc6d9e23b726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to the new Linux LTS release 6.6.3. Switch to the
latest U-Boot 2023.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch  | 8 ++++----
 .../linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch        | 8 ++++----
 .../patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch | 8 ++++----
 .../patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch   | 8 ++++----
 configs/orangepi_zero_defconfig                                   | 8 ++++----
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
index 16207afcb1..6a5aa0bb63 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -13,13 +13,13 @@ This commit specifies XR819 interrupt configuration for the driver.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 3 +++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index b7ca916d871d..4e1a9050c6b4 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -125,6 +125,9 @@
  	 */
  	xr819: sdio_wifi@1 {
diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
index e4c52ab911..ff0a1db223 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -10,13 +10,13 @@ For more information see:
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index 4e1a9050c6b4..cdf19821b1f3 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -161,3 +161,19 @@
  	/* USB VBUS is always on */
  	status = "okay";
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
index ae0ed9ba3b..04d43c344f 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -8,13 +8,13 @@ This patch enables spidev driver for SPI1.
 
 Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
  1 file changed, 11 insertions(+)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index cdf19821b1f3..7242aaecb14f 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -59,6 +59,7 @@
  		serial0 = &uart0;
  		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
diff --git a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
index 839bc16087..41c23209ce 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0004-ARM-dts-orange-pi-zero-enable-uart.patch
@@ -7,13 +7,13 @@ Enable uart1 and uart2 on orange-pi-zero board.
 
 Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
 ---
- arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
+ arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 index f19ed981da9d..03acf166ab70 100644
---- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
-+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 @@ -184,13 +184,13 @@ &uart0 {
  &uart1 {
  	pinctrl-names = "default";
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index e286f0b7f1..596805bd47 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -8,16 +8,16 @@ BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_SYSTEM_DHCP="eth0"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
