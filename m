Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 17:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C712606F0;
	Thu,  1 Aug 2024 17:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdDLirhmx3YH; Thu,  1 Aug 2024 17:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530B4605DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530B4605DA;
	Thu,  1 Aug 2024 17:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE45B1BF3E5
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 17:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC24D81365
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 17:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBLmBJybWyLS for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 17:45:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F7B381764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F7B381764
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F7B381764
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 17:45:07 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B12F5B00563;
 Thu,  1 Aug 2024 19:45:00 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Aug 2024 19:44:53 +0200
Message-ID: <20240801174453.11300-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722534304;
 bh=3phszlg5hMU5Kd3GIj9b5pM4dOuOYxBOkd9e2YPLxpU=;
 h=From:To:Cc:Subject:Date:From;
 b=hSTZNELyHnmQUD4G+uRkPH4S9owQKL9RmQLN7ZT2H9URHsCJR0j7QXL1ix2XBvyoM
 PgsN5xNUunrxBpq7fX30Sjx0YnFycieRRlMgebkSJN6r9M7hyZpMks8cFDjffw+dcl
 YrkBzWw+UH0ykun+caQ34cVXjnmFsyWE3W516ZDbFdM+cLtc2APd1KIhXwYtw+ReDB
 ZFTOCjlyxDk8nKZtTk8FcqEq84Ny+fzimr75MCoV94qq8hxiM7dhDaIvckOnU7u/rh
 Ht+e44E1eChh2bHdM02te7jUesldunpWGtLuxvymW6GeiFiuph44gdOS0n8iw5zmi3
 ACph8drJ4DCkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hSTZNELy
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mpevk: bump BSP
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
 Stephane Viau <stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump ATF, U-Boot and Linux kernel to the NXP BSP lf-6.6.23-2.0.0
versions.

Also, since commit dc0f721 "package/gcc: switch to 13.x as default",
this freescale_imx8mpevk_defconfig is failing to build the Kernel
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
https://gitlab.com/buildroot.org/buildroot/-/jobs/7422089468

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                    |  1 -
 .../arm-trusted-firmware/arm-trusted-firmware.hash     |  2 ++
 .../imx8mpevk/patches/linux-headers/linux-headers.hash |  1 +
 board/freescale/imx8mpevk/patches/linux/linux.hash     |  2 ++
 board/freescale/imx8mpevk/patches/uboot/uboot.hash     |  2 ++
 configs/freescale_imx8mpevk_defconfig                  | 10 ++++++----
 6 files changed, 13 insertions(+), 5 deletions(-)
 create mode 100644 board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx8mpevk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx8mpevk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 028b63b4d3..d2b625c17c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -155,7 +155,6 @@ configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
-configs/freescale_imx8mpevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8qmmek_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_imx8qxpmek_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..0266b45d6a
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  37f0dee8b3b52d6c7f8a46c3bdd4138b528f9cc607015400e7cad0c206df41d7  imx-atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8mpevk/patches/linux/linux.hash b/board/freescale/imx8mpevk/patches/linux/linux.hash
new file mode 100644
index 0000000000..3c4223976b
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c70adedadce88f8685cb26d9703b930292c1349138e2c55ed9b4cd6e277de3bd  linux-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/imx8mpevk/patches/uboot/uboot.hash b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..4e0d729ca0
--- /dev/null
+++ b/board/freescale/imx8mpevk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  179b6531ef1d4ce681d139741ac7b4144220c90b7223297df28b61e98e8d37fc  uboot-imx-lf-6.6.23-2.0.0.tar.gz
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 2aed048482..0ced252cd0 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,12 +1,14 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mpevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.6.23-2.0.0)/linux-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -19,13 +21,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.23-2.0.0)/imx-atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
