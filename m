Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C24C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35687409FB;
	Sat, 28 Jan 2023 22:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35687409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjzuaagSqKkq; Sat, 28 Jan 2023 22:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A6940F4E;
	Sat, 28 Jan 2023 22:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A6940F4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE5F61BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94C50414CC
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C50414CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvDkS0ZPbS3s for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:18:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2AE840F4E
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2AE840F4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F95887FEB; Sat, 28 Jan 2023 22:18:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 23:18:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c65ab5fab325b5abfe34652c1236c3b8b10d752
X-Git-Newrev: 498797acce390a8c91b6a3c306a4655e83ae9f6f
X-Patchwork-Hint: ignore
Message-Id: <20230128221832.9F95887FEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mn_bsh_smm_s2_pro_defconfig:
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
Content-Type: multipart/mixed; boundary="===============1854197674299275070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1854197674299275070==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=498797acce390a8c91b6a3c306a4655e83ae9f6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BSH SMM S2 PRO (SystemMaster S2 Pro) Board is an add-on board which
provide input and output interfaces to a dedicated carrier board. It is
designed mainly to provide graphical/video and connectivity interfaces
to the appliance.

Board support package includes the following components:
- mainline Linux kernel 6.1.6
- mainline U-Boot 2022-07
- Default packages from buildroot

https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/

Add Ariel D'Alessandro and Dario Binacchi as co-maintainer, we work
together on platform mainline

Build and tested using:
docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314

Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 ++
 .../{ => common}/imx8mn-bsh-smm-s2/linux.fragment  |  0
 board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf      |  4 ++
 board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh           | 23 +++++++
 board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg       | 17 +++++
 board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh      |  7 +++
 board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh      |  3 +
 board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt         | 73 ++++++++++++++++++++++
 configs/imx8mn_bsh_smm_s2_defconfig                |  2 +-
 ...2_defconfig => imx8mn_bsh_smm_s2_pro_defconfig} | 19 +++---
 10 files changed, 142 insertions(+), 10 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2e187d7b03..e942b4b3f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -225,6 +225,8 @@ F:	configs/snps_archs38_haps_defconfig
 F:	configs/snps_archs38_hsdk_defconfig
 
 N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
+F:	board/bsh/
+F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	package/axfsutils/
 F:	package/mali-t76x/
 
@@ -688,6 +690,7 @@ F:	package/xinetd/
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
+F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	package/sscep/
 F:	package/uuu/
 
@@ -2122,6 +2125,7 @@ F:	package/python-pyzmq/
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
+F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	package/python-spidev/
 
 N:	Michael Vetter <jubalh@iodoru.org>
diff --git a/board/bsh/imx8mn-bsh-smm-s2/linux.fragment b/board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
similarity index 100%
rename from board/bsh/imx8mn-bsh-smm-s2/linux.fragment
rename to board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
new file mode 100644
index 0000000000..9111354742
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
new file mode 100755
index 0000000000..17b20f0097
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+if [ $# -eq 0 ]; then
+    OUTPUT_DIR=output
+else
+    OUTPUT_DIR=$1
+fi
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    echo ""
+    echo "Arguments:"
+    echo "    OUTPUT_DIR    The Buildroot output directory."
+    exit 1
+fi
+
+IMAGES_DIR=${OUTPUT_DIR}/images
+
+${OUTPUT_DIR}/host/bin/uuu -v -b emmc_all \
+  ${IMAGES_DIR}/flash.bin \
+  ${IMAGES_DIR}/sdcard.img
+
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
new file mode 100644
index 0000000000..10c52548cd
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/genimage.cfg
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 32K
+	}
+
+	partition rootfs {
+		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
new file mode 100755
index 0000000000..bf8861f6a9
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh b/board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
new file mode 100755
index 0000000000..3452fd4501
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
diff --git a/board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt b/board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
new file mode 100644
index 0000000000..5763f164fe
--- /dev/null
+++ b/board/bsh/imx8mn-bsh-smm-s2-pro/readme.txt
@@ -0,0 +1,73 @@
+i.MX8MN BSH SMM S2 PRO
+======================
+
+How to build it
+---------------
+
+Configure buildroot:
+
+  $ make imx8mn_bsh_smm_s2_pro_defconfig
+
+Change settings to fit your needs (optional):
+
+  $ make menuconfig
+
+Compile everything and build the rootfs image:
+
+  $ make
+
+
+Result of the build
+-------------------
+
+After building, the output/images directory contains:
+
+  output/images/
+    ├── bl31.bin
+    ├── Image
+    ├── flash.bin
+    ├── ddr3*
+    ├── rootfs.ext2
+    ├── rootfs.ext4 -> rootfs.ext2
+    ├── rootfs.tar
+    ├── sdcard.img
+    ├── u-boot.bin
+    ├── u-boot-nodtb.bin
+    └── u-boot-spl.bin
+
+
+Preparing the board
+-------------------
+
+Plug the USB type A to micro B cable into the USB Debug
+Connector (DBG UART). Use serial port settings 115200 8N1
+to access the debug console.
+
+Plug another USB type A to micro B cable into the USB-OTG
+Connector (USB1). This connection is used to flash the board
+firmware using the Freescale/NXP UUU tool.
+
+Connect the power supply/adaptor to the DC Power Jack (labelled
++5V).
+
+
+Flashing the emmc card image
+----------------------------
+
+Power up the board by switching on the Power ON Switch, which is
+placed right next to the DC Jack.
+
+Enter the following U-Boot commands on the debug serial console:
+
+  $ fastboot usb 0
+
+Flash the images on eMMC. On your computer, run:
+
+  $ board/bsh/imx8mn-bsh-smm-s2-pro/flash.sh output/
+
+
+Booting the board
+-----------------
+
+By default the bootloader will search for the first valid image,
+starting with the internal eMMC.
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 4b03d2e89e..9b8ac8bfe2 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/imx8mn-bsh-smm-s2/linux.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-bsh-smm-s2"
 BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
similarity index 69%
copy from configs/imx8mn_bsh_smm_s2_defconfig
copy to configs/imx8mn_bsh_smm_s2_pro_defconfig
index 4b03d2e89e..ebef4e5932 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,35 +1,35 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-BR2_GLOBAL_PATCH_DIR="board/bsh/imx8mn-bsh-smm-s2/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.6"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/imx8mn-bsh-smm-s2/linux.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/bsh/common/imx8mn-bsh-smm-s2/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-bsh-smm-s2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-bsh-smm-s2pro"
 BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
 BR2_PACKAGE_FIRMWARE_IMX=y
 BR2_PACKAGE_FIRMWARE_IMX_DDR3=y
-BR2_TARGET_ROOTFS_UBIFS=y
-BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
-BR2_TARGET_ROOTFS_UBIFS_RT_NONE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30a60000"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_bsh_smm_s2pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -38,4 +38,5 @@ BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UUU=y

--===============1854197674299275070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1854197674299275070==--
