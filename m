Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05961C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 19:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCE5581EFA;
	Thu,  1 Aug 2024 19:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJLwESCjKEDX; Thu,  1 Aug 2024 19:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D40981FE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D40981FE6;
	Thu,  1 Aug 2024 19:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2F901BF401
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDF5C81FE6
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 19:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0cDD2NldqXDu for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 19:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C3FA81EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3FA81EFA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C3FA81EFA
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 19:56:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 766FAB00571;
 Thu,  1 Aug 2024 21:56:53 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 21:56:48 +0200
Message-ID: <20240801195648.61942-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722542216;
 bh=Eji6cMIFFcPK6jEqTIo8gtY9xAF2m/u1Qc1p1TJDi8E=;
 h=From:To:Cc:Subject:Date:From;
 b=euAifbazcvK+RLNgYtBS0aWvYLuDOOQ5HdIIMNByzUd6q5xJ+TytFiOuyZ1GLbTVb
 ZNeDdYJ+Hnma1LLGvxbni0XkBq7EKBPywYkRZm9aSi5L85o9Y7f8RQYPmceihUbnhl
 nLSnFugEClnCDyigDjgRgH9nGH8bYOPV3MZbOXE/WYGRUc2NWx6A45yMzOCcaKZUeB
 w6HFvocLWRtidbnqjDW3txf5U0Bm6tAev7x62jYufH6TpUfzLqAv9GVJqYdJzyzMej
 B1SKpa9Gx675v/T+/tDJWCY/QQLS0TL0qAZ7RILhgCPM6czsnS6aWLkqBXRCwPgvKh
 ItBYJYrbPm4jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=euAifbaz
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8dxlevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>,
 Stefan Nickl <Stefan.Nickl@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
versions.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
this freescale_imx8dxlevk_defconfig is failing to build the Kernel
with output:

    drivers/mxc/gpu-viv/hal/os/linux/kernel/gc_hal_kernel_os.c:5675:1: error: conflicting types for '_QuerySignal' due to enum/integer mismatch; have 'gceSTATUS(struct _gckOS *, void *)' {aka 'enum _gceSTATUS(struct _gckOS *, void *)'} [-Werror=enum-int-mismatch]
     5675 | _QuerySignal(IN gckOS Os, IN gctSIGNAL Signal)
          | ^~~~~~~~~~~~

This commit fixes the issue by updating the Kernel.

This commit also adds the custom version package hashes. Therefore,
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is added in the defconfig, a
BR2_GLOBAL_PATCH_DIR is also added in the board specific directory and
the hash files are added.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089463

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                    |  1 -
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/freescale/imx8dxlevk/patches/linux/linux.hash    |  2 ++
 board/freescale/imx8dxlevk/patches/uboot/uboot.hash    |  2 ++
 configs/freescale_imx8dxlevk_defconfig                 | 10 ++++++----
 6 files changed, 13 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx8dxlevk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx8dxlevk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx8dxlevk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 028b63b4d3..e5ebf95451 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -152,7 +152,6 @@ configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mpevk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..0266b45d6a
--- /dev/null
+++ b/board/freescale/imx8dxlevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8dxlevk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx8dxlevk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8dxlevk/patches/linux/linux.hash b/board/freescale/imx8dxlevk/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx8dxlevk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8dxlevk/patches/uboot/uboot.hash b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx8dxlevk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
index 0f4caa0ea9..1ee1413eb0 100644
--- a/configs/freescale_imx8dxlevk_defconfig
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -1,13 +1,15 @@
 BR2_aarch64=y
 BR2_cortex_a35=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8dxlevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
@@ -22,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
