Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E392C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE74580CD7;
	Fri, 16 May 2025 15:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lvJwwUL3WMW7; Fri, 16 May 2025 15:18:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B197280DC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B197280DC6;
	Fri, 16 May 2025 15:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE5D185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D0B340983
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_2OREODHt-g for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:18:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=92.121.34.13;
 helo=inva020.nxp.com; envelope-from=juanpablo.monterocastro@nxp.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3E8A4093B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3E8A4093B
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3E8A4093B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:18:02 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 94AB41A04E6;
 Fri, 16 May 2025 17:18:00 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 92B5C1A0842;
 Fri, 16 May 2025 17:18:00 +0200 (CEST)
Received: from lsv051113.swis.nl-cdc01.nxp.com
 (lsv051113.swis.nl-cdc01.nxp.com [10.168.3.63])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id DEA4C202FD;
 Fri, 16 May 2025 17:17:59 +0200 (CEST)
From: Juan Pablo Montero Castro <juanpablo.monterocastro@nxp.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 17:16:14 +0200
Message-Id: <20250516151613.3222736-1-juanpablo.monterocastro@nxp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=nxp.com
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx91evk: new defconfig
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
Cc: ju.o@free.fr, Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>

This commit adds support for the i.MX 91 EVK board

Tested on board revision SCH-91080 REV A1

Signed-off-by: Juan Pablo MONTERO CASTRO <juanpablo.monterocastro@nxp.com>
---
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx91evk/patches/linux/linux.hash         |  2 +
 .../imx91evk/patches/uboot/uboot.hash         |  2 +
 board/freescale/imx91evk/readme.txt           | 76 +++++++++++++++++++
 configs/freescale_imx91evk_defconfig          | 41 ++++++++++
 package/freescale-imx/Config.in               | 15 ++++
 .../freescale-imx/firmware-ele-imx/Config.in  |  5 +-
 8 files changed, 141 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/imx91evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx91evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx91evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx91evk/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx91evk/readme.txt
 create mode 100644 configs/freescale_imx91evk_defconfig

diff --git a/board/freescale/imx91evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx91evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..da0200d9ac
--- /dev/null
+++ b/board/freescale/imx91evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a696ee1c75140cd5ddb9d4349c921952f80e2a8a21bc6bd92f905959a6b1798f  imx-atf-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx91evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx91evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx91evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx91evk/patches/linux/linux.hash b/board/freescale/imx91evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..b4f534dcc8
--- /dev/null
+++ b/board/freescale/imx91evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4c1147a9bbe4bf36fbcbd8b1e6b0d73ec0da3c454821c58a61d32d3879afc146  linux-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx91evk/patches/uboot/uboot.hash b/board/freescale/imx91evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..309a684c2d
--- /dev/null
+++ b/board/freescale/imx91evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a32d6c79538e4f90746674873b196f9c48be24caef0ab5c1bec920a1816825  uboot-imx-lf-6.12.3-1.0.0.tar.gz
diff --git a/board/freescale/imx91evk/readme.txt b/board/freescale/imx91evk/readme.txt
new file mode 100644
index 0000000000..bd2d7b7a74
--- /dev/null
+++ b/board/freescale/imx91evk/readme.txt
@@ -0,0 +1,76 @@
+*********************
+NXP i.MX91 EVK board
+*********************
+
+This file documents the Buildroot support for the i.MX 91 EVK board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 91 EVK board:
+
+  make freescale_imx91evk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - ddr_fw.bin
+  - Image
+  - imx91-11x11-evk.dtb
+  - imx9-boot-sd.bin
+  - lpddr4_pmu_train_fw.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf-container.img
+  - u-boot.bin
+  - u-boot-hash.bin
+  - u-boot-spl.bin
+  - u-boot-spl-ddr.bin
+  - u-boot-spl-padded.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx9.
+
+Boot the i.MX 91 EVK board
+===============================
+
+To boot your newly created system (refer to the i.MX 91 EVK Documentation[1] for guidance):
+- insert the SD card in the SD slot of the board;
+- Configure the switches as follows:
+SW1301: 0100 SW1301[1-4]
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Note: the debug USB connector presents 4 UARTs (for example /dev/ttyUSB[0-3]),
+the Cortex-A55 UART is the 3rd one (in the previous example, /dev/ttyUSB2).
+Refer to the documentation [1] for more details.
+
+Enjoy!
+
+References
+==========
+[1] https://www.nxp.com/document/guide/getting-started-with-the-i-mx-91-evk:GS-i.MX91EVK
diff --git a/configs/freescale_imx91evk_defconfig b/configs/freescale_imx91evk_defconfig
new file mode 100644
index 0000000000..479ff6a2e0
--- /dev/null
+++ b/configs/freescale_imx91evk_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx91evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.12.3-1.0.0)/linux-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx91-11x11-evk"
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.12.3-1.0.0)/imx-atf-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx91"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.12.3-1.0.0)/uboot-imx-lf-6.12.3-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx91_11x11_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 6d196a052d..0ba60e2c85 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -93,6 +93,21 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 
 endchoice
 
+choice
+        prompt "i.MX 91 Silicon Revision"
+        default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+        depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
+        help
+          Some packages related to the selected i.MX platform need to
+          know the silicon revision of the platform they will run on.
+
+          Note - mismatches may result in a failure to boot!
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+        bool "imx91a0"
+
+endchoice
+
 choice
 	prompt "i.MX 93 Silicon Revision"
 	default BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index e8369f0102..d8a55ed219 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -19,8 +19,7 @@ config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	default "mx8ulpa1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1
 	default "mx8ulpa2-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
-	default "mx93a1-ahab-container.img" if \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
+	default "mx91a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
 
 endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
