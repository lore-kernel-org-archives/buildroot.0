Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00146C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C002A4F4CF;
	Fri, 28 Feb 2025 16:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWvdMkEwHkWY; Fri, 28 Feb 2025 16:39:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CE04F590
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0CE04F590;
	Fri, 28 Feb 2025 16:39:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A05868
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8E2D4254F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTE34chm50y0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED8A424B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED8A424B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A05F844AB; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 22:43:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 668084d5cb035373af07d4237839cc9ec0e44601
X-Git-Newrev: 3ef5975b795271a723b694160c8d50c62d518e8e
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.7A05F844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/orangepi_zero: bump
 BSP versions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ef5975b795271a723b694160c8d50c62d518e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to the new Linux LTS release 6.12.3 and to the latest U-Boot
2024.10. Tune the patch for xr819 interrupts for the new kernel.
Add hashes for Linux kernel/headers and U-Boot. Finally, add
BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Julien:
  - add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
  - remove .checkpackageignore entry
  - change linux.hash comment to use upstream hashes
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                         |  1 -
 .../orangepi-zero/patches/linux-headers/linux-headers.hash  |  1 +
 ...-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch | 13 ++++++-------
 board/orangepi/orangepi-zero/patches/linux/linux.hash       |  2 ++
 board/orangepi/orangepi-zero/patches/uboot/uboot.hash       |  2 ++
 configs/orangepi_zero_defconfig                             |  8 +++++---
 6 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f24859bf49..f8997bac55 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -206,7 +206,6 @@ configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
index 6a5aa0bb63..600fd0f5b3 100644
--- a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -1,8 +1,7 @@
-From 321faaf4b78d46a0c77782c1798856746f0619e9 Mon Sep 17 00:00:00 2001
+From 7a24ce9f5045ac6faf66a08bbb814f3a82c919b1 Mon Sep 17 00:00:00 2001
 From: Sergey Matyukevich <geomatsi@gmail.com>
 Date: Fri, 19 May 2017 23:39:48 +0300
-Subject: [PATCH] ARM: dts: orange-pi-zero: specify XR819 WiFi chip
- interrupts
+Subject: [PATCH] ARM: dts: orange-pi-zero: specify XR819 WiFi chip interrupts
 
 The orange-pi-zero board has Allwinner XR819 SDIO wifi chip. The board
 dts file provides a node enabling mmc1 controller. Together with an
@@ -17,12 +16,12 @@ Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-index b7ca916d871d..4e1a9050c6b4 100644
+index 2a45770f7b83..667038973bb7 100644
 --- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
 +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
-@@ -125,6 +125,9 @@
+@@ -152,6 +152,9 @@ &mmc1 {
  	 */
- 	xr819: sdio_wifi@1 {
+ 	xr819: wifi@1 {
  		reg = <1>;
 +		compatible = "xradio,xr819";
 +		interrupt-parent = <&pio>;
@@ -31,5 +30,5 @@ index b7ca916d871d..4e1a9050c6b4 100644
  };
  
 -- 
-2.11.0
+2.47.1
 
diff --git a/board/orangepi/orangepi-zero/patches/linux/linux.hash b/board/orangepi/orangepi-zero/patches/linux/linux.hash
new file mode 100644
index 0000000000..aea771e7bf
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-zero/patches/uboot/uboot.hash b/board/orangepi/orangepi-zero/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index b48c28102e..6372564e72 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -1,8 +1,9 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -12,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -34,11 +35,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
