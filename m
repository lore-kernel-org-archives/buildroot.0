Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D6CC00528
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD6BC60C06;
	Sun,  6 Aug 2023 19:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD6BC60C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 491-0vQhtBj9; Sun,  6 Aug 2023 19:24:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D861460C0B;
	Sun,  6 Aug 2023 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D861460C0B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD9E1BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DD9960E73
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DD9960E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJGFfBCgw6Jq for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABC83605E3
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC83605E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99526845B7; Sun,  6 Aug 2023 19:23:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 21:23:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: beb74069ef890a0874e06be98690949492d83f3a
X-Git-Newrev: 03b228fd1a0bcc1905cd62c8f9167facdad2cd5a
X-Patchwork-Hint: ignore
Message-Id: <20230806192335.99526845B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_imx8dxlevk:
 new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=03b228fd1a0bcc1905cd62c8f9167facdad2cd5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  4 ++
 board/freescale/imx8dxlevk/readme.txt  | 69 ++++++++++++++++++++++++++++++++++
 configs/freescale_imx8dxlevk_defconfig | 39 +++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c9117146ea..0ae5f89d88 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2730,6 +2730,10 @@ F:	package/libvpx/
 F:	package/mesa3d-demos/
 F:	package/ti-gfx/
 
+N:	Stefan Nickl <Stefan.Nickl@gmail.com>
+F:	board/freescale/imx8dxlevk/
+F:	configs/freescale_imx8dxlevk_defconfig
+
 N:	Stefan Ott <stefan@ott.net>
 F:	package/unbound/
 
diff --git a/board/freescale/imx8dxlevk/readme.txt b/board/freescale/imx8dxlevk/readme.txt
new file mode 100644
index 0000000000..33ceb66931
--- /dev/null
+++ b/board/freescale/imx8dxlevk/readme.txt
@@ -0,0 +1,69 @@
+******************************
+Freescale i.MX8DXL WEVK board
+******************************
+
+This file documents the Buildroot support for the Freescale i.MX8DXL WEVK
+board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX8DXL WEVK board:
+
+  make freescale_imx8dxlevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - ahab-container.img
+  - bl31.bin
+  - boot.vfat
+  - Image
+  - imx8-boot-sd.bin
+  - imx8dxl-evk.dtb
+  - mkimg.commit
+  - mx8dxl-ddr3-evk-scfw-tcm.bin
+  - mx8dxl-evk-scfw-tcm.bin
+  - mx8dxl-phantom-mek-scfw-tcm.bin
+  - mx8dxl-val-scfw-tcm.bin
+  - rootfs.ext2
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot-atf.bin
+  - u-boot.bin
+  - u-boot-hash.bin
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
+board/freescale/common/imx/genimage.cfg.template_imx8.
+
+Boot the i.MX8DXL WEVK board
+============================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the boot switch as follows:
+SW1:	ON	ON	OFF	OFF
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/freescale_imx8dxlevk_defconfig b/configs/freescale_imx8dxlevk_defconfig
new file mode 100644
index 0000000000..bf59e64430
--- /dev/null
+++ b/configs/freescale_imx8dxlevk_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a35=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8dxl-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8dxl-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_SC_FIRMWARE=y
+BR2_PACKAGE_IMX_SECO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8dxl"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8dxl_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
