Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D544C83F27
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 16:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052A261124;
	Tue, 22 Jul 2025 16:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiEwDIHoY9Ci; Tue, 22 Jul 2025 16:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3291611F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3291611F4;
	Tue, 22 Jul 2025 16:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5422BE0
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39258807B9
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLHrJUx804tQ for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 16:59:09 +0000 (UTC)
X-Greylist: delayed 429 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 22 Jul 2025 16:59:08 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05894807BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05894807BB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=92.121.34.21;
 helo=inva021.nxp.com; envelope-from=juanpablo.monterocastro@nxp.com;
 receiver=<UNKNOWN> 
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05894807BB
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:59:08 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 589DF201176;
 Tue, 22 Jul 2025 18:51:57 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C1C7200084;
 Tue, 22 Jul 2025 18:51:57 +0200 (CEST)
Received: from lsv051113.swis.nl-cdc01.nxp.com
 (lsv051113.swis.nl-cdc01.nxp.com [10.168.3.63])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 1CF2420340;
 Tue, 22 Jul 2025 18:51:56 +0200 (CEST)
From: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr, Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
Date: Tue, 22 Jul 2025 18:51:19 +0200
Message-Id: <20250722165119.1789576-1-juanpablo.monterocastro@nxp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nxp.com
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx91frdm: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds support for the i.MX 91 FRDM (Freedom) board.

The i.MX91 FRDM development board is a low-cost and compact
development board featuring the i.MX91 applications processor.

See: https://nxp.com/FRDM-IMX91

This defconfig is based on freescale_imx93frmd_defconfig, introduced in
commit https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8

Compared to the original freescale_imx93_frmd_defconfig, this defconfig
uses a Bootlin glibc stable external toolchain, to follow guidelines
from: https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
---
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx91frdm/patches/linux/linux.hash        |  2 +
 .../imx91frdm/patches/uboot/uboot.hash        |  2 +
 board/freescale/imx91frdm/readme.txt          | 74 +++++++++++++++++++
 configs/freescale_imx91frdm_defconfig         | 43 +++++++++++
 6 files changed, 124 insertions(+)
 create mode 100644 board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx91frdm/patches/linux/linux.hash
 create mode 100644 board/freescale/imx91frdm/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx91frdm/readme.txt
 create mode 100644 configs/freescale_imx91frdm_defconfig

diff --git a/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..7561385cb8
--- /dev/null
+++ b/board/freescale/imx91frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8cfe0afc903ebbc03f27e4874aa9ce82be78843a8b42ed4c906871e7f311b510  imx-atf-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx91frdm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx91frdm/patches/linux/linux.hash b/board/freescale/imx91frdm/patches/linux/linux.hash
new file mode 100644
index 0000000000..f03ffd5b55
--- /dev/null
+++ b/board/freescale/imx91frdm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3f5017e85ba6c490be597670033a7eaba14e3c34af4e53d24dc3762c3deece83  linux-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz
diff --git a/board/freescale/imx91frdm/patches/uboot/uboot.hash b/board/freescale/imx91frdm/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..f285dff490
--- /dev/null
+++ b/board/freescale/imx91frdm/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f7d9a6e99825926d0bc597e0fdfeafffcc76ad6267f1d4e9aae1fe9a8d400c22  uboot-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz
diff --git a/board/freescale/imx91frdm/readme.txt b/board/freescale/imx91frdm/readme.txt
new file mode 100644
index 0000000000..ec839b1dca
--- /dev/null
+++ b/board/freescale/imx91frdm/readme.txt
@@ -0,0 +1,74 @@
+**********************
+NXP i.MX 91 FRDM board
+**********************
+
+This file documents the Buildroot support for the i.MX 91 FRDM
+(Freedom) board. For more information on this board, see [1].
+
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 91 FRDM board:
+
+    make freescale_imx91frdm_defconfig
+
+Build all components:
+
+    make
+
+When this command completes, the generated image containing everything
+to boot from the SD card is located in "output/images/sdcard.img".
+
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+    cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx9.
+
+
+Boot the i.MX 91 FRDM board
+===========================
+
+To boot your newly created system (refer to the i.MX 91 FRDM
+Documentation [2] for guidance):
+- insert the SD card in the SD slot (P13) of the board;
+- Configure the SW1 boot switches as follows:
+  SW1: 1100 SW1[1-4] ("USDHC2 4-bit SD3.0" Boot Mode)
+- connect a USB Type-C cable into the P16 Debug USB Port and connect
+  using a terminal emulator at 115200 bps, 8n1;
+- power on the board by connecting a USB Type-C cable into the P1
+  Power USB Port.
+
+Note 1: the board boot switches default configuration is:
+SW1: 0100 SW1[1-4] ("USDHC1 8-bit eMMC 5.1" Boot Mode)
+and the board is also pre-flashed with a reference Linux demo
+image. It is important to change the boot config switches to make
+sure the system will boot on the SD Card.
+
+Note 2: the debug USB connector presents 2 UARTs (for example
+/dev/ttyACM[0-1]), the Cortex-A55 UART should be the 1st one (in the
+previous example, /dev/ttyACM0). Refer to the documentation [2] for
+more details.
+
+Enjoy!
+
+
+References
+==========
+[1] https://www.nxp.com/FRDM-IMX91
+[2] https://www.nxp.com/document/guide/getting-started-with-frdm-imx91:GS-FRDM-IMX91
diff --git a/configs/freescale_imx91frdm_defconfig b/configs/freescale_imx91frdm_defconfig
new file mode 100644
index 0000000000..8a233afb50
--- /dev/null
+++ b/configs/freescale_imx91frdm_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx91frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,linux-imx,lf-6.6.36-2.1.0-imx91frdm)/linux-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.36-2.1.0)/imx-atf-lf-6.6.36-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,uboot-imx,lf-6.6.36-2.1.0-imx91frdm)/uboot-imx-lf-6.6.36-2.1.0-imx91frdm.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_frdm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
