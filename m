Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC7C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5ED81F15;
	Thu,  8 Aug 2024 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx7XxoF65qOw; Thu,  8 Aug 2024 20:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6168B81F0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6168B81F0E;
	Thu,  8 Aug 2024 20:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DA2C1BF86C
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B30A605E1
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 20:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEEhnG37vOzi for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 20:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F80960618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F80960618
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F80960618
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 20:35:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 478KZIew021009;
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 478KZIdK003995
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Aug 2024 15:35:18 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Aug 2024 15:35:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Aug 2024 15:35:18 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 478KZI6M046249;
 Thu, 8 Aug 2024 15:35:18 -0500
Date: Thu, 8 Aug 2024 15:35:15 -0500
MIME-Version: 1.0
Message-ID: <20240808-bsp-bump-v1-4-9e1c6f3c2592@ti.com>
References: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
In-Reply-To: <20240808-bsp-bump-v1-0-9e1c6f3c2592@ti.com>
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9008; i=bb@ti.com;
 h=from:subject:message-id; bh=ErZnAK6pu7SAigk8GHfJ6Fpz/dfStDlSdLBbCYE1Nr4=;
 b=owNCWmg5MUFZJlNZ9n8FYQAAaH///3/5v3vk+byff+WrX53b6vs26Rz/7/9d5o2L6rD8/3ywA
 RsYIepoB6jR6gAAAAANDQAMg0AA0ANAD1D1APUDQ9QaDamj1G1DQD1GNR6ZDKIA0ZGgaeoZBoNM
 hkADIAAaNNGQxBoAAG0Q/UmmRkZNBo0GmmIz1QaMmjQGIZIYTQwgAaaGmjTQ0BiZDIaAaBowhiZ
 NANNGhkGgDATBDRiAZMjRpiaNADBhA9+HC560IJDCuElSkQshFmHh2VmRQB+XI7Gj3gtcmBB/jf
 dVYY7yr+f89QUNxi88OKkUSpUEdV9DfW20sskeRBPiEuztGFlBxU9XxaALjT66ZnokcLxWPHd/l
 kF/lAJp2TpGpQrm21JKr1xGu0fBmufkDnAegNLTQGBjzrir9eIF94cqdrAMFBTpdQuGse0sDmsX
 7XcNvhPdbbVCIjH8kxffgt0lQh9FNVMhb8JD+ZsHrbX7Ogj6TDokq9GIWJHSe+NIKyR7OhnTn04
 LFDWinwaSP/U5SW5LvESAFkyQUwgKGe2pC1LuUmt3A2rW1L2FpM9s0mjXA5WcqYDGVh1+U8L/dX
 As1icAloxVJGIEqM0Df7Ug0I8Cqajy4jJQoaXuuHhmN8B8I+BebgQbmNfQVYwbAgTh6PHQXPx6G
 b/i7kinChIez+CsIA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1723149318;
 bh=tzJQKoU7qL6QPUW6w07T3kkxfNM3Ktk9ADlGmH/VGF0=;
 h=From:Date:Subject:References:In-Reply-To:To:CC;
 b=OZYs18Vz8NSgudFH4KFu3tRrSI2A9K2ZrCFIGhuKXE4FptF+HIG20rZAxAlYj0VKC
 2o3KSLKcRZamoRC+9TnTB7Jy9+lXLRDifEH7W0kp93oNtoPf9xJ9rY4VKdYbsYbrf1
 +uZYZDvbsrul2/FIr9KA4XM3B5DKa89mdDYI6MWc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=OZYs18Vz
Subject: [Buildroot] [PATCH 4/4] configs/ti_am64x_sk_defconfig: bump tfa,
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the tfa, uboot and linux kernel versions used by the am64x-sk
reference board to pull in the latest bug fixes and feature additions

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 ...e-sci-clk-Adding-support-for-non-contiguo.patch | 75 ----------------------
 board/ti/am64x-sk/patches/linux/linux.hash         |  2 +-
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  3 +-
 board/ti/am64x-sk/patches/uboot/uboot.hash         |  2 +-
 configs/ti_am64x_sk_defconfig                      | 12 ++--
 6 files changed, 10 insertions(+), 86 deletions(-)

diff --git a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index d68ac4bd30db3..8b77e1f1653a4 100644
--- a/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/ti/am64x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7194687d13335f832a48c1b87ad4f15ffb983365ca2aba4afda57843fb01cb6  arm-trusted-firmware-lts-v2.10.4-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch b/board/ti/am64x-sk/patches/linux/0001-clk-keystone-sci-clk-Adding-support-for-non-contiguo.patch
deleted file mode 100644
index 788b6439d898f..0000000000000
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
index 2e9aad399ebe3..53eb1438945bc 100644
--- a/board/ti/am64x-sk/patches/linux/linux.hash
+++ b/board/ti/am64x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1c4cdcb9d560fad1fb95db2cb8afbedc922f9ead848371fe40363b13f9f631ba  linux-6.8.8.tar.xz
+sha256  774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226  linux-6.10.tar.xz
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
deleted file mode 100644
index 97a2b4eaf95ba..0000000000000
--- a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 120000
index 0000000000000..b89e91d3e8819
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+../uboot/uboot.hash
\ No newline at end of file
diff --git a/board/ti/am64x-sk/patches/uboot/uboot.hash b/board/ti/am64x-sk/patches/uboot/uboot.hash
index 97a2b4eaf95ba..fe9b4f53dc639 100644
--- a/board/ti/am64x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am64x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 1e8b8c9c02222..a9ec5e3d536fd 100644
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

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
