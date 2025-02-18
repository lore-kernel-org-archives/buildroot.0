Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303E0C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD4074EEEC;
	Fri, 28 Feb 2025 17:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsPZsMyYwlEf; Fri, 28 Feb 2025 17:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18DB50AA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D18DB50AA2;
	Fri, 28 Feb 2025 17:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1138668
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D55034695D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2g8h0R9X-_P for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE11146D76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE11146D76
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D092580807; Fri, 28 Feb 2025 16:30:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 21:29:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 25b6a6eceeb8b13ba1827649a0d6586dd65f11aa
X-Git-Newrev: bcc79932833405e4a2b2e0c9b00eb7c360b43c80
X-Patchwork-Hint: ignore
Message-Id: <20250228163043.D092580807@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/polyhex_debix_model_a_defconfig: new defconfig
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
Content-Type: multipart/mixed; boundary="===============6980095899840140095=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6980095899840140095==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bcc79932833405e4a2b2e0c9b00eb7c360b43c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This configuration builds an image for the Polyhex Debix Model A SBC

DEBIX Model A is an industrial grade single board computer
powered by NXP i.MX 8M Plus applications processor

https://www.debix.io/hardware/model-a.html

- Linux Kernel: Upstream version 6.12.14
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/polyhex/debix-model-a/extlinux.conf.in       |   4 +
 board/polyhex/debix-model-a/genimage.cfg.in        |  17 ++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |   2 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../polyhex/debix-model-a/patches/linux/linux.hash |   2 +
 .../polyhex/debix-model-a/patches/uboot/uboot.hash |   2 +
 board/polyhex/debix-model-a/post-build.sh          |   7 ++
 board/polyhex/debix-model-a/readme.txt             | 112 +++++++++++++++++++++
 configs/polyhex_debix_model_a_defconfig            |  47 +++++++++
 9 files changed, 194 insertions(+)

diff --git a/board/polyhex/debix-model-a/extlinux.conf.in b/board/polyhex/debix-model-a/extlinux.conf.in
new file mode 100644
index 0000000000..ed6b881772
--- /dev/null
+++ b/board/polyhex/debix-model-a/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mp-debix-model-a.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/polyhex/debix-model-a/genimage.cfg.in b/board/polyhex/debix-model-a/genimage.cfg.in
new file mode 100644
index 0000000000..10c52548cd
--- /dev/null
+++ b/board/polyhex/debix-model-a/genimage.cfg.in
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
diff --git a/board/polyhex/debix-model-a/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/polyhex/debix-model-a/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..b5898cba3f
--- /dev/null
+++ b/board/polyhex/debix-model-a/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/polyhex/debix-model-a/patches/linux-headers/linux-headers.hash b/board/polyhex/debix-model-a/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/polyhex/debix-model-a/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/polyhex/debix-model-a/patches/linux/linux.hash b/board/polyhex/debix-model-a/patches/linux/linux.hash
new file mode 100644
index 0000000000..47eab71641
--- /dev/null
+++ b/board/polyhex/debix-model-a/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
diff --git a/board/polyhex/debix-model-a/patches/uboot/uboot.hash b/board/polyhex/debix-model-a/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/polyhex/debix-model-a/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/polyhex/debix-model-a/post-build.sh b/board/polyhex/debix-model-a/post-build.sh
new file mode 100755
index 0000000000..604f387768
--- /dev/null
+++ b/board/polyhex/debix-model-a/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/polyhex/debix-model-a/readme.txt b/board/polyhex/debix-model-a/readme.txt
new file mode 100644
index 0000000000..bea204520e
--- /dev/null
+++ b/board/polyhex/debix-model-a/readme.txt
@@ -0,0 +1,112 @@
+Polyhex Debix Model A
+=====================
+
+DEBIX Model A is an industrial grade single board computer
+powered by NXP i.MX 8M Plus applications processor
+
+https://www.debix.io/hardware/model-a.html
+User Manual: [1]
+
+
+How to build it
+===============
+
+Configure buildroot:
+
+  $ make polyhex_debix_model_a_defconfig
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
+===================
+
+After building, the output/images directory contains:
+
+output/images/
+├── bl31.bin
+├── ddr_fw.bin -> /home/gilles/buildroot-dev/output/images/lpddr4_pmu_train_fw.bin
+├── flash.bin
+├── freescale
+│   └── imx8mp-debix-model-a.dtb
+├── genimage.cfg
+├── Image
+├── lpddr4_dmem_1d_v202201.bin
+├── lpddr4_dmem_2d_v202201.bin
+├── lpddr4_dmem_qb_v202201.bin
+├── lpddr4_imem_1d_v202201.bin
+├── lpddr4_imem_2d_v202201.bin
+├── lpddr4_imem_qb_v202201.bin
+├── lpddr4_pmu_train_1d_dmem_201904.bin
+├── lpddr4_pmu_train_1d_dmem_202006.bin
+├── lpddr4_pmu_train_1d_dmem.bin
+├── lpddr4_pmu_train_1d_dmem_pad.bin
+├── lpddr4_pmu_train_1d_fw.bin
+├── lpddr4_pmu_train_1d_imem_201904.bin
+├── lpddr4_pmu_train_1d_imem_202006.bin
+├── lpddr4_pmu_train_1d_imem.bin
+├── lpddr4_pmu_train_1d_imem_pad.bin
+├── lpddr4_pmu_train_2d_dmem_201904.bin
+├── lpddr4_pmu_train_2d_dmem_202006.bin
+├── lpddr4_pmu_train_2d_dmem.bin
+├── lpddr4_pmu_train_2d_dmem_pad.bin
+├── lpddr4_pmu_train_2d_fw.bin
+├── lpddr4_pmu_train_2d_imem_201904.bin
+├── lpddr4_pmu_train_2d_imem_202006.bin
+├── lpddr4_pmu_train_2d_imem.bin
+├── lpddr4_pmu_train_2d_imem_pad.bin
+├── lpddr4_pmu_train_fw.bin
+├── lpddr4x_dmem_qb_v202306.bin
+├── lpddr4x_dmem_qb_v202311.bin
+├── lpddr4x_dmem_v202306.bin
+├── lpddr4x_dmem_v202311.bin
+├── lpddr4x_imem_qb_v202306.bin
+├── lpddr4x_imem_qb_v202311.bin
+├── lpddr4x_imem_v202306.bin
+├── lpddr4x_imem_v202311.bin
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot-spl.bin
+
+
+Flashing the SD card image
+==========================
+
+To install the image on a SDCard simply copy sdcard.img to the storage (e.g. SD, eMMC)
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>
+
+
+Booting the board
+=================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- if you use a Debix I/O daughter card, follow the instructions provided
+in [2], section 3.1 for the hardware connection between the main board
+and the I/O daughter card. Then, put a micro USB cable into the I/0 daughter card
+Debug USB Port and connect using a terminal emulator at 115200 bps, 8n1;
+- if you do not use a Debix I/O daughter card, connect a USB-to-TTL serial cable to
+the 40-pin header (J2) on the main board, the following way:
+    USB-to-TTL cable GND pin to J2 pin 05
+    USB-to-TTL cable TX pin to J2 pin 09
+    USB-to-TTL cable RX pin to J2 pin 11
+    connect using a terminal emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+
+References
+==========
+[1] https://www.debix.io/Uploads/Temp/file/20250207/DEBIX%20User%20Manual-V3.5.pdf
+[2] https://www.debix.io/Uploads/Temp/file/20241225/DEBIX%20IO%20Board%20User%20Manual-V1.1.pdf
diff --git a/configs/polyhex_debix_model_a_defconfig b/configs/polyhex_debix_model_a_defconfig
new file mode 100644
index 0000000000..97348b7b33
--- /dev/null
+++ b/configs/polyhex_debix_model_a_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/polyhex/debix-model-a/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/polyhex/debix-model-a/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-debix-model-a"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_debix_model_a"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

--===============6980095899840140095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6980095899840140095==--
