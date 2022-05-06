Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EC6C433EF
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 19:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CE9740576;
	Fri,  6 May 2022 19:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyme31CbGBtG; Fri,  6 May 2022 19:23:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9B7D4056C;
	Fri,  6 May 2022 19:23:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAEE1C11A9
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CC6560D6E
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCKAZoiARwIN for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 19:23:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6547560784
 for <buildroot@buildroot.org>; Fri,  6 May 2022 19:23:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56B8585C01; Fri,  6 May 2022 19:12:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 May 2022 21:18:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81253000885b3eaa2f521a998463c119a1c989ba
X-Git-Newrev: 45a67a2f83884044467cb764fce6282cd75b8128
X-Patchwork-Hint: ignore
Message-Id: <20220506191229.56B8585C01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/zynq_xxx_defconfig: bump to Xilinx
 2022.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45a67a2f83884044467cb764fce6282cd75b8128
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps configs/zynq_xxx_defconfigs to Xilinx software release 2022.1
which includes the following updates:
  - U-Boot bumped to 2022.01
  - Linux bumped to 5.15.19
  - rootfs changed from CPIO to EXT4
  - extlinux.conf for distro boot support
  - U-Boot migrated from git clone to tarball for faster builds

This patch has been build and run tested on a ZC706 evaluation board.
This patch has been build tested only for zed, microzed and qmtech boards.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynq/extlinux.conf           |  4 ++++
 board/zynq/genimage.cfg            | 11 ++++++++---
 board/zynq/microzed/uboot.fragment |  1 +
 board/zynq/post-build.sh           |  8 ++++++++
 board/zynq/post-image.sh           |  6 ++++--
 board/zynq/zc706/uboot.fragment    |  1 +
 board/zynq/zed/uboot.fragment      |  1 +
 configs/zynq_microzed_defconfig    | 22 +++++++++++-----------
 configs/zynq_qmtech_defconfig      |  7 ++++---
 configs/zynq_zc706_defconfig       | 20 ++++++++++----------
 configs/zynq_zed_defconfig         | 24 ++++++++++++------------
 11 files changed, 64 insertions(+), 41 deletions(-)

diff --git a/board/zynq/extlinux.conf b/board/zynq/extlinux.conf
new file mode 100644
index 0000000000..3c2ab4f46a
--- /dev/null
+++ b/board/zynq/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /uImage
+  devicetree /system.dtb
+  append console=ttyPS0,115200 root=/dev/mmcblk0p2 rw rootwait
diff --git a/board/zynq/genimage.cfg b/board/zynq/genimage.cfg
index 67baca795e..78eb9275dd 100644
--- a/board/zynq/genimage.cfg
+++ b/board/zynq/genimage.cfg
@@ -3,12 +3,12 @@ image boot.vfat {
 		files = {
 			"boot.bin",
 			"u-boot.img",
-			"devicetree.dtb",
+			"system.dtb",
 			"uImage"
 		}
 
-		file uramdisk.image.gz {
-			image = "rootfs.cpio.uboot"
+		file extlinux/extlinux.conf {
+			image = extlinux.conf
 		}
 	}
 
@@ -24,4 +24,9 @@ image sdcard.img {
 		bootable = "true"
 		image = "boot.vfat"
 	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
diff --git a/board/zynq/microzed/uboot.fragment b/board/zynq/microzed/uboot.fragment
new file mode 100644
index 0000000000..bc4dffaffa
--- /dev/null
+++ b/board/zynq/microzed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-microzed"
diff --git a/board/zynq/post-build.sh b/board/zynq/post-build.sh
new file mode 100755
index 0000000000..9fd8bbf2c8
--- /dev/null
+++ b/board/zynq/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+# genimage will need to find the extlinux.conf
+# in the binaries directory
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux.conf
diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 0cf92e0aa9..ac74286cf6 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -8,6 +8,8 @@ FIRST_DT=$(sed -n \
            's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
            ${BR2_CONFIG})
 
-[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/system.dtb
 
-support/scripts/genimage.sh -c board/zynq/genimage.cfg
+BOARD_DIR="$(dirname $0)"
+
+support/scripts/genimage.sh -c $BOARD_DIR/genimage.cfg
diff --git a/board/zynq/zc706/uboot.fragment b/board/zynq/zc706/uboot.fragment
new file mode 100644
index 0000000000..ad5efa6204
--- /dev/null
+++ b/board/zynq/zc706/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zc706"
diff --git a/board/zynq/zed/uboot.fragment b/board/zynq/zed/uboot.fragment
new file mode 100644
index 0000000000..d58fcd5439
--- /dev/null
+++ b/board/zynq/zed/uboot.fragment
@@ -0,0 +1 @@
+CONFIG_DEFAULT_DEVICE_TREE="zynq-zed"
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 1bb11fee7e..10a4f4095f 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-microzed"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_microzed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/microzed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_qmtech_defconfig b/configs/zynq_qmtech_defconfig
index 4db3f68b1f..f536b80f57 100644
--- a/configs/zynq_qmtech_defconfig
+++ b/configs/zynq_qmtech_defconfig
@@ -5,6 +5,7 @@ BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/qmtech/zynq/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
@@ -14,9 +15,9 @@ BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-qmtech"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index e8019177d2..82c47be7a5 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xilinx-v2017.3)/linux-xilinx-v2017.3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zc706"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zc706"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zc706/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index a215695b54..34e1b67184 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -2,26 +2,26 @@ BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/zynq/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.1)/xlnx_rebase_v5.15_LTS_2022.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2018.2"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.1)/xlnx_rebase_v2022.01_2022.1.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynq_virt"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/zynq/zed/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
