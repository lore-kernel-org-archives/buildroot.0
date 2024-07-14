Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C825C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 22:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C3740444;
	Sun, 14 Jul 2024 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhERPiWSrHPQ; Sun, 14 Jul 2024 22:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A99940106
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A99940106;
	Sun, 14 Jul 2024 22:12:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF46B1BF47A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCC3360611
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 767eKYajVVUO for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 22:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938F96062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938F96062F
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 22:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CDCE86A91; Sun, 14 Jul 2024 22:12:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 00:11:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5513ded8ff80c6647401289a546c269c1cf2bff9
X-Git-Newrev: c85e291d40a88c318bf38b8f32793e2069c1039d
X-Patchwork-Hint: ignore
Message-Id: <20240714221238.7CDCE86A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am62ax_sk_defconfig: add
 support for Ti's am62ax-sk
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c85e291d40a88c318bf38b8f32793e2069c1039d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a board config to support the am62ax-sk reference board for TI's
AM62Ax SoC family.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Tested-by: Paresh Bhagat <p-bhagat@ti.com>
[Romain:
  - add Upstream: tag in the kernel patch
  - use BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62ax"
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                         |  1 +
 board/ti/am62ax-sk/genimage.cfg                    | 33 ++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 76 ++++++++++++++++++++++
 board/ti/am62ax-sk/patches/linux/linux.hash        |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +
 board/ti/am62ax-sk/patches/uboot/uboot.hash        |  2 +
 board/ti/am62ax-sk/readme.txt                      | 39 +++++++++++
 configs/ti_am62ax_sk_defconfig                     | 46 +++++++++++++
 10 files changed, 204 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eea9ba4a80..9539b60724 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -566,6 +566,7 @@ F:	board/beagleboard/beagleplay/
 F:	boot/ti-k3-boot-firmware/
 F:	boot/ti-k3-r5-loader/
 F:	configs/beagleplay_defconfig
+F:	configs/ti_am62ax_sk_defconfig
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
 
diff --git a/board/ti/am62ax-sk/genimage.cfg b/board/ti/am62ax-sk/genimage.cfg
new file mode 100644
index 0000000000..70d38faa58
--- /dev/null
+++ b/board/ti/am62ax-sk/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"k3-am62a7-sk.dtb",
+			"Image"
+		}
+
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..8f60864fbf
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  ba215404fe9db26e5f2cef3fdce17b7c8ed344a2a1d592dd01a5f1c5e72cfdbd  arm-trusted-firmware-lts-v2.10.4.tar.gz
diff --git a/board/ti/am62ax-sk/patches/linux-headers/linux-headers.hash b/board/ti/am62ax-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am62ax-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am62ax-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
new file mode 100644
index 0000000000..2f3d80c86d
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
@@ -0,0 +1,76 @@
+From 750cdf4cb6791c45d479ed73a97728100394fb32 Mon Sep 17 00:00:00 2001
+From: Udit Kumar <u-kumar1@ti.com>
+Date: Tue, 13 Feb 2024 13:56:40 +0530
+Subject: [PATCH] clk: keystone: sci-clk: Adding support for non contiguous
+ clocks
+X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=bb@ti.com;
+ h=from:subject; bh=CKSvD6FpqwRzx8blynhoCEc3XUR5TlwjFJdcgjQwpgg=;
+ b=owNCWmg5MUFZJlNZHYzOLwAAZP/////7puP/r7v/9q9s+8t7wa8/97UZO//d+XvPsvfv2/+wA
+ RsYHaQAAAAAAAAGg09IPUGmgAaAANBoAAAGmnqAPU9Q0DQ0HqMQDQ8ptTeqeogaABoPU0NAPUAA
+ 0GgDJ6gANAAMg0GmgNGgDEGh6jR6h6hp6mgepoPU2oDTIGho0IaHqA00yDQNBoGTRoDTRkAZNAD
+ AmTIBkGjIGmQyAZDRkAaANAYIxBk0DQAAHODcFn1CAGBsJeG8ZtU3FQCBdLH7LjDIouHeAszY1j
+ AFkqjaWIFXEVi8NV3giRplb1JjCYunXimTaK06SgQRYsUGRSbKOVQP2t1LlAYS93QjOMWF6CHXK
+ 69KzHyBDpXR2mHAAkHcHX0X3SAYJkxPElwJ1ZnHK1RfDKRfJcRQKzxnryM+4x2mCxpIFIIjpVLk
+ nItd1Vl1SEF2QiWZIYV4b0lawcUqLGgTQZ0+qpJ5QORYrvPXE4DR89JlJYBU4DjxAoyACH6KN0o
+ AiaknqZTfMwmF8iREpU4SgDEVun3X3OFlkBp3hBO+Ynb12GJoLSFBSz9IWE2ooLKFalh5XJMZfl
+ +GthEEOnlrMQHOF8qCr+JAKqXEqSrwLGuEIMFbnGEjJYruo4ENGOmGVlkvW+kLRp5ibCXAAcDMM
+ TPOUZ/i7kinChIDsZnF4A==
+X-Developer-Key: i=bb@ti.com; a=openpgp;
+ fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
+
+Most of clocks and their parents are defined in contiguous range,
+But in few cases, there is gap in clock numbers[0].
+Driver assumes clocks to be in contiguous range, and add their clock
+ids incrementally.
+
+New firmware started returning error while calling get_freq and is_on
+API for non-available clock ids.
+
+In this fix, driver checks and adds only valid clock ids.
+
+[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
+Section Clocks for NAVSS0_CPTS_0 Device, clock id 12-15 not present.
+
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ad3ac13c6ec318b43e769cc9ffde67528e58e555
+
+Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
+Signed-off-by: Udit Kumar <u-kumar1@ti.com>
+Reviewed-by: Nishanth Menon <nm@ti.com>
+Signed-off-by: Bryan Brattlof <bb@ti.com>
+---
+ drivers/clk/keystone/sci-clk.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
+index 35fe197dd303c..eb2ef44869b23 100644
+--- a/drivers/clk/keystone/sci-clk.c
++++ b/drivers/clk/keystone/sci-clk.c
+@@ -516,6 +516,7 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+ 	struct sci_clk *sci_clk, *prev;
+ 	int num_clks = 0;
+ 	int num_parents;
++	bool state;
+ 	int clk_id;
+ 	const char * const clk_names[] = {
+ 		"clocks", "assigned-clocks", "assigned-clock-parents", NULL
+@@ -586,6 +587,15 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
+ 				clk_id = args.args[1] + 1;
+ 
+ 				while (num_parents--) {
++					/* Check if this clock id is valid */
++					ret = provider->ops->is_auto(provider->sci,
++						sci_clk->dev_id, clk_id, &state);
++
++					if (ret) {
++						clk_id++;
++						continue;
++					}
++
+ 					sci_clk = devm_kzalloc(dev,
+ 							       sizeof(*sci_clk),
+ 							       GFP_KERNEL);
+
+base-commit: 9fbb5fcb41e7e96fb8769a9f5a12a35a984c23bd
+-- 
+2.43.2
+
diff --git a/board/ti/am62ax-sk/patches/linux/linux.hash b/board/ti/am62ax-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..2e9aad399e
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
diff --git a/board/ti/am62ax-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62ax-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..75de6acf93
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am62ax-sk/patches/uboot/uboot.hash b/board/ti/am62ax-sk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..6f8624c3cc
--- /dev/null
+++ b/board/ti/am62ax-sk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am62ax-sk/readme.txt b/board/ti/am62ax-sk/readme.txt
new file mode 100644
index 0000000000..d7d529c180
--- /dev/null
+++ b/board/ti/am62ax-sk/readme.txt
@@ -0,0 +1,39 @@
+Texas Instuments SK-AM62A Test and Development Board
+
+Description
+===========
+
+This configuration will build a complete image for the TI SK-AM62A
+board: https://www.ti.com/tool/SK-AM62A-LP
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make ti_am62ax_sk_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+IMPORTANT: make sure to use the tiboot3 firmware that match with the TI
+K3 SoC boot ROM (tiboot3-am62ax-{gp/hs-fs/hs}-evm.bin) used on the board.
+Use the BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN to name which tiboot3.bin
+security variant we want to use.
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the SK-AM62A board, and power it up through the
+USB Type-C connector. The system should come up. You can use a
+micro-USB cable to connect to the connector labeled UART to
+communicate with the board.
diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
new file mode 100644
index 0000000000..25735c28ab
--- /dev/null
+++ b/configs/ti_am62ax_sk_defconfig
@@ -0,0 +1,46 @@
+BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am62ax-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am62a7-sk.dtb -l am62ax-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
+BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62ax-sk/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am62a7-sk"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.4"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62ax"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62ax_evm_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62ax_evm_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
