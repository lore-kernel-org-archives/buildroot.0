Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA07C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 20:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 018408175C;
	Tue, 11 Mar 2025 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ih2wc9UvTsu3; Tue, 11 Mar 2025 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C4381755
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C4381755;
	Tue, 11 Mar 2025 20:07:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D58D01DB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B974840118
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzKO-Q5au7Yw for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 20:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E00FD4098F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E00FD4098F
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 20:07:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3B8C87F59; Tue, 11 Mar 2025 20:07:05 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Mar 2025 19:22:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 29861832a38976911d931256e8e5a3aad526e761
X-Git-Newrev: 1ab37899ae7c7595d3fc1ab70b67388e67e70c33
X-Patchwork-Hint: ignore
Message-Id: <20250311200705.B3B8C87F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/sipeed_licheepi_4a:
 add new board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ab37899ae7c7595d3fc1ab70b67388e67e70c33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for the LicheePi 4A with mainline component:
 - Linux Kernel 6.12

The following components are provided by vendor:
 - U-Boot 2020.01
 - OpenSBI v0.9

Board homepage and more usable wiki:
 - https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/1_intro.html

th1520-boot-firmware is selected from the package sipeed-lpi4abin.
This is inspired from lone0's fork of buildroot for th1520.[1]

[1] https://github.com/lone0/buildroot-th1520

Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
[Julien: Tested on cpu board version 51601
  on base board version 51602]
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien:
  - add Signed-off-by line in commit log
  - reorder defconfig entries with "make savedefconfig"
  - fixed post-image.sh shellcheck warnings
    (found with "make check-package")
  - add extra info in readme.txt
  - change linux-headers.hash to a symlink
  - change linux.hash comment to take hash from upstream
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 board/sipeed/licheepi_4a/extlinux/extlinux.conf    |  4 +
 board/sipeed/licheepi_4a/genimage.cfg              |  7 ++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/sipeed/licheepi_4a/patches/linux/linux.hash  |  2 +
 .../licheepi_4a/patches/opensbi/opensbi.hash       |  2 +
 board/sipeed/licheepi_4a/patches/uboot/uboot.hash  |  2 +
 board/sipeed/licheepi_4a/post-image.sh             | 24 ++++++
 board/sipeed/licheepi_4a/readme.txt                | 97 ++++++++++++++++++++++
 configs/sipeed_licheepi_4a_defconfig               | 42 ++++++++++
 10 files changed, 183 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b28fd9167c..0c6d7532f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2056,6 +2056,8 @@ F:	package/libqb/
 F:	package/usbguard/
 
 N:	Kanak Shilledar <kanakshilledar@gmail.com>
+F:	board/sipeed/licheepi_4a/
+F:	configs/sipeed_licheepi_4a_defconfig
 F:	package/sipeed-lpi4abin/
 
 N:	Karoly Kasza <kaszak@gmail.com>
diff --git a/board/sipeed/licheepi_4a/extlinux/extlinux.conf b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
new file mode 100644
index 0000000000..add3954184
--- /dev/null
+++ b/board/sipeed/licheepi_4a/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /th1520-lichee-pi-4a.dtb
+  append console=ttyS0,115200 root=/dev/mmcblk0p4 rootfstype=ext4 rootwait rw earlycon clk_ignore_unused init=/sbin/init
diff --git a/board/sipeed/licheepi_4a/genimage.cfg b/board/sipeed/licheepi_4a/genimage.cfg
new file mode 100644
index 0000000000..54cef1db9b
--- /dev/null
+++ b/board/sipeed/licheepi_4a/genimage.cfg
@@ -0,0 +1,7 @@
+image boot.ext4 {
+	ext4 {
+		label = "boot"
+	}
+
+	size = 64M
+}
diff --git a/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash b/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/sipeed/licheepi_4a/patches/linux/linux.hash b/board/sipeed/licheepi_4a/patches/linux/linux.hash
new file mode 100644
index 0000000000..7835000bc9
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
diff --git a/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..5ced5c95cc
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  2510c0e867b4f8c28579def9a21e97fa2e8de95b8c7d66bb8b6642202bcee3b4  opensbi-61d7484c752a5e4c464d5dc18e21d9ac67fbbefa-git4.tar.gz
diff --git a/board/sipeed/licheepi_4a/patches/uboot/uboot.hash b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b63a8d79d4
--- /dev/null
+++ b/board/sipeed/licheepi_4a/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6158b9c6faee41a1e790ad4ba2e1b3e18a122ecdb5749fa77c7495a2d1c56262  uboot-b5ee6e549a7b5ff382a14021a5d6a3c94017bddd-git4.tar.gz
diff --git a/board/sipeed/licheepi_4a/post-image.sh b/board/sipeed/licheepi_4a/post-image.sh
new file mode 100755
index 0000000000..6d188d7994
--- /dev/null
+++ b/board/sipeed/licheepi_4a/post-image.sh
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+trap 'rm -rf "${ROOTPATH_TMP}"' EXIT
+ROOTPATH_TMP="$(mktemp -d)"
+rm -rf "${GENIMAGE_TMP}"
+
+cp "${BINARIES_DIR}"/Image "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/fw_dynamic.bin "${ROOTPATH_TMP}"
+cp -a "${BINARIES_DIR}"/bootbins/* "${ROOTPATH_TMP}"
+cp -a "${BOARD_DIR}"/extlinux "${ROOTPATH_TMP}"
+
+genimage \
+	--rootpath "${ROOTPATH_TMP}"   \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/sipeed/licheepi_4a/readme.txt b/board/sipeed/licheepi_4a/readme.txt
new file mode 100644
index 0000000000..90a0347046
--- /dev/null
+++ b/board/sipeed/licheepi_4a/readme.txt
@@ -0,0 +1,97 @@
+Intro
+=====
+
+This directory contains a Buildroot configuration for building a
+LicheePi 4A image. For more information, see the board wiki page [1].
+
+
+How to build it
+===============
+
+
+Configure Buildroot
+-------------------
+
+    make sipeed_licheepi_4a_defconfig
+
+
+Build the boot and rootfs
+-------------------------
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+You may now build your rootfs with:
+
+    make
+
+(This may take a while, consider getting yourself a coffee ;-) )
+
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- boot.ext4
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- rootfs.tar
+    +-- u-boot.bin
+    +-- u-boot-with-spl.bin
+    +-- fw_dynamic.bin
+    `-- Image
+
+
+How to flash the board
+======================
+
+Once the build process is finished you will have to flash the
+correspoding images to the respective partitions in the eMMC.
+LicheePi 4A uses fastboot to flash the images.
+
+The board needs to be booted in "Burning Mode". For that, check first
+the boot switches (SW1, SW2) on the base board are set up on the
+"eMMC" mode (this is the factory default). Then, boot the board while
+pressing the "BOOT" button. See [2].
+
+Note that the board can be booted by either:
+- attaching the USB-C power cable, or
+- pressing the "RESET" button (near the USB-C power connector) if the
+  power cable is already connected to the host computer.
+
+The board should be enumerated from the host computer. This can be
+confirmed with "lsusb". The board should be listed as:
+
+    ID 2345:7654 T-HEAD USB download gadget
+
+The device should also be listed by the "fastboot devices" command:
+
+    ????????????         Android Fastboot
+
+The board can be flashed with the commands:
+
+    fastboot flash ram output/images/u-boot-with-spl.bin
+    fastboot reboot
+    fastboot flash uboot output/images/u-boot-with-spl.bin
+    fastboot flash boot output/images/boot.ext4
+    fastboot flash root output/images/rootfs.ext2
+
+
+Boot the board
+==============
+
+Connect the console on the System Serial Port on pins
+U0-RX, U0-TX and GND. For more details, see [3].
+
+When resetting or powering up the board on the USB-C port, the U-Boot
+prompt and Linux console will appear on this System Serial Port.
+
+
+References
+==========
+
+[1] https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/1_intro.html
+[2] https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/4_burn_image.html#How-to-enter-burning-mode
+[3] https://wiki.sipeed.com/hardware/en/lichee/th1520/lpi4a/6_peripheral.html#System-Serial-Port
diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
new file mode 100644
index 0000000000..c7867ed05d
--- /dev/null
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -0,0 +1,42 @@
+BR2_riscv=y
+BR2_RISCV_ISA_RVC=y
+BR2_RISCV_ISA_RVV=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi 4A"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sipeed/licheepi_4a/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="thead/th1520-lichee-pi-4a"
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88=y
+BR2_PACKAGE_SIPEED_LPI4ABIN=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_REGDB=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_GIT=y
+BR2_TARGET_OPENSBI_CUSTOM_REPO_URL="https://github.com/revyos/thead-opensbi.git"
+BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION="61d7484c752a5e4c464d5dc18e21d9ac67fbbefa"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="light_lpi4a"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/revyos/thead-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b5ee6e549a7b5ff382a14021a5d6a3c94017bddd"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
