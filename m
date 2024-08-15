Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A736E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E47E18179A;
	Fri,  6 Sep 2024 20:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nW-KoHIxiiMI; Fri,  6 Sep 2024 20:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C4D84476
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C4D84476;
	Fri,  6 Sep 2024 20:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13DD81BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 108AB60A88
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cm3AGl7brxgY for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F47260787
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F47260787
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6840286EE4; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 22:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e12bce591115c8735ee52162e9c0aeed0afb13c
X-Git-Newrev: 5598920390da361b0bea4d07e2c05eb8b0d69ea6
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.6840286EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ti_am64x_sk: bump tfa,
 uboot and linux versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=5598920390da361b0bea4d07e2c05eb8b0d69ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the tfa, uboot and linux kernel versions used by the am64x-sk
reference board to pull in the latest bug fixes and feature additions

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 75 ----------------------
 board/ti/am64x-sk/patches/linux/linux.hash         |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 board/ti/am64x-sk/patches/uboot/uboot.hash         |  2 +-
 configs/ti_am64x_sk_defconfig                      | 12 ++--
 6 files changed, 10 insertions(+), 86 deletions(-)

diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index d68ac4bd30..8b77e1f165 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
deleted file mode 100644
index 788b6439d8..0000000000
--- a/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 750cdf4cb6791c45d479ed73a97728100394fb32 Mon Sep 17 00:00:00 2001
-From: Udit Kumar <u-kumar1@ti.com>
-Date: Tue, 13 Feb 2024 13:56:40 +0530
-Subject: [PATCH] clk: keystone: sci-clk: Adding support for non contiguous
- clocks
-X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=bb@ti.com;
- h=from:subject; bh=CKSvD6FpqwRzx8blynhoCEc3XUR5TlwjFJdcgjQwpgg=;
- b=owNCWmg5MUFZJlNZHYzOLwAAZP/////7puP/r7v/9q9s+8t7wa8/97UZO//d+XvPsvfv2/+wA
- RsYHaQAAAAAAAAGg09IPUGmgAaAANBoAAAGmnqAPU9Q0DQ0HqMQDQ8ptTeqeogaABoPU0NAPUAA
- 0GgDJ6gANAAMg0GmgNGgDEGh6jR6h6hp6mgepoPU2oDTIGho0IaHqA00yDQNBoGTRoDTRkAZNAD
- AmTIBkGjIGmQyAZDRkAaANAYIxBk0DQAAHODcFn1CAGBsJeG8ZtU3FQCBdLH7LjDIouHeAszY1j
- AFkqjaWIFXEVi8NV3giRplb1JjCYunXimTaK06SgQRYsUGRSbKOVQP2t1LlAYS93QjOMWF6CHXK
- 69KzHyBDpXR2mHAAkHcHX0X3SAYJkxPElwJ1ZnHK1RfDKRfJcRQKzxnryM+4x2mCxpIFIIjpVLk
- nItd1Vl1SEF2QiWZIYV4b0lawcUqLGgTQZ0+qpJ5QORYrvPXE4DR89JlJYBU4DjxAoyACH6KN0o
- AiaknqZTfMwmF8iREpU4SgDEVun3X3OFlkBp3hBO+Ynb12GJoLSFBSz9IWE2ooLKFalh5XJMZfl
- +GthEEOnlrMQHOF8qCr+JAKqXEqSrwLGuEIMFbnGEjJYruo4ENGOmGVlkvW+kLRp5ibCXAAcDMM
- TPOUZ/i7kinChIDsZnF4A==
-X-Developer-Key: i=bb@ti.com; a=openpgp;
- fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
-
-Most of clocks and their parents are defined in contiguous range,
-But in few cases, there is gap in clock numbers[0].
-Driver assumes clocks to be in contiguous range, and add their clock
-ids incrementally.
-
-New firmware started returning error while calling get_freq and is_on
-API for non-available clock ids.
-
-In this fix, driver checks and adds only valid clock ids.
-
-[0] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html
-Section Clocks for NAVSS0_CPTS_0 Device, clock id 12-15 not present.
-
-Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
-Signed-off-by: Udit Kumar <u-kumar1@ti.com>
-Reviewed-by: Nishanth Menon <nm@ti.com>
-Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad3ac13c6ec318b43e769cc9ffde67528e58e555
-Signed-off-by: Bryan Brattlof <bb@ti.com>
----
- drivers/clk/keystone/sci-clk.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
-index 35fe197dd303c..eb2ef44869b23 100644
---- a/drivers/clk/keystone/sci-clk.c
-+++ b/drivers/clk/keystone/sci-clk.c
-@@ -516,6 +516,7 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
- 	struct sci_clk *sci_clk, *prev;
- 	int num_clks = 0;
- 	int num_parents;
-+	bool state;
- 	int clk_id;
- 	const char * const clk_names[] = {
- 		"clocks", "assigned-clocks", "assigned-clock-parents", NULL
-@@ -586,6 +587,15 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
- 				clk_id = args.args[1] + 1;
- 
- 				while (num_parents--) {
-+					/* Check if this clock id is valid */
-+					ret = provider->ops->is_auto(provider->sci,
-+						sci_clk->dev_id, clk_id, &state);
-+
-+					if (ret) {
-+						clk_id++;
-+						continue;
-+					}
-+
- 					sci_clk = devm_kzalloc(dev,
- 							       sizeof(*sci_clk),
- 							       GFP_KERNEL);
-
-base-commit: 9fbb5fcb41e7e96fb8769a9f5a12a35a984c23bd
--- 
-2.43.2
-
diff --git a/board/ti/am64x-sk/patches/linux/linux.hash b/board/ti/am64x-sk/patches/linux/linux.hash
index 2e9aad399e..53eb143894 100644
--- a/board/ti/am64x-sk/patches/linux/linux.hash
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
deleted file mode 100644
index 97a2b4eaf9..0000000000
--- a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 120000
index 0000000000..b89e91d3e8
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+../uboot/uboot.hash
\ No newline at end of file
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
index 97a2b4eaf9..fe9b4f53dc 100644
--- a/board/ti/am64x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 1e8b8c9c02..a9ec5e3d53 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,14 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
-BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.4"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -27,12 +27,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
