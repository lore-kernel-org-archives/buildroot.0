Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA2CCF2EE
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82E08404F;
	Mon, 19 Jan 2026 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQawoVZCScT9; Mon, 19 Jan 2026 20:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E168484043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768853233;
	bh=1rE0mk1TwAWrQiM+oZRpXBxhDxJRBF2zNBEFHKwRfMo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SByFaqKnuGE10thJXS2ad+HvJWKEMGwyv1YToJn/vGFvd2tSZj5NnB3G4du36tYYx
	 q8wGGM9S1uCvYWajouiIoSfijA+XkAheC1oW1IbWBUnEWZHcr1/ksNCbqYHbDUbcZl
	 /TiTVqf8YpLTqHKwk32802yKjWB8suoAdbYJ8gzZ+gSlqXCn22A/ZIkgkDGW5vEMrk
	 5kT2Hc06q9KbnKxkcnpyrij4zA+Agc8xOwkYU+PwZWpYjD5wKmD/NJg4DFDv8rBuSm
	 oF/uTwQeczs++LPKceU/xNqWGnYeD/iYI/2dNYPpdXNYqpahsznprfiEYLSCp3boOc
	 gfAoYpSEPvMCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E168484043;
	Mon, 19 Jan 2026 20:07:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C412D122
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B99C4615B8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lq3kM6euxlEJ for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 20:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDC19615B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC19615B7
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 20:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9F298868E; Mon, 19 Jan 2026 20:07:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Jan 2026 20:46:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c654e2b7c5c8ad267493142597fd7231bdd74248
X-Git-Newrev: c5f5ac1cbb5b9a05f2680b04d368b1da4a17ffd2
X-Patchwork-Hint: ignore
Message-Id: <20260119200710.B9F298868E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32h747_disco_sd: new defconfig
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5f5ac1cbb5b9a05f2680b04d368b1da4a17ffd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support STM32h747i-disco board. It includes an STM32H747XI SoC with the
following resources:

 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 ++
 .../stm32h747-disco/extlinux.conf                  |  4 +++
 .../stmicroelectronics/stm32h747-disco/flash_sd.sh | 18 ++++++++++++
 .../stm32h747-disco/genimage.cfg                   | 10 +++++++
 .../stm32h747-disco/linux-sd.fragment              |  1 +
 .../stm32h747-disco/patches/linux/linux.hash       |  2 ++
 .../stm32h747-disco/patches/uboot/uboot.hash       |  2 ++
 .../stm32h747-disco/post-build.sh                  |  9 ++++++
 .../stmicroelectronics/stm32h747-disco/readme.txt  | 32 ++++++++++++++++++++++
 configs/stm32h747_disco_sd_defconfig               | 32 ++++++++++++++++++++++
 10 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ed4bdb0a0..08c98ec53b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -800,12 +800,14 @@ N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	board/stmicroelectronics/stm32h747-disco/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	configs/stm32h747_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
diff --git a/board/stmicroelectronics/stm32h747-disco/extlinux.conf b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
new file mode 100644
index 0000000000..36f60e346b
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32h747i-disco-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32h747i-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32h747-disco/flash_sd.sh b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
new file mode 100755
index 0000000000..6f2e421aba
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32h747i-disco.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32h747-disco/genimage.cfg b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
new file mode 100644
index 0000000000..e911a94e46
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
@@ -0,0 +1,10 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
new file mode 100644
index 0000000000..846229d0d4
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
@@ -0,0 +1 @@
+# CONFIG_XIP_KERNEL is not set
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
new file mode 100644
index 0000000000..9f5d285c35
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/stmicroelectronics/stm32h747-disco/post-build.sh b/board/stmicroelectronics/stm32h747-disco/post-build.sh
new file mode 100755
index 0000000000..293bf30cb3
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR="$(dirname "$0")"
+
+# Kernel is built without devpts support
+sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32h747-disco/readme.txt b/board/stmicroelectronics/stm32h747-disco/readme.txt
new file mode 100644
index 0000000000..5c565de211
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/readme.txt
@@ -0,0 +1,32 @@
+STM32H747 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32H747 Discovery evaluation platform.
+
+Building
+--------
+
+  make stm32h747_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32h747-disco/flash_sd.sh output/
+
+It will flash the U-Boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32h747-disco/genimage.cfg.
+
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
new file mode 100644
index 0000000000..92cd23196b
--- /dev/null
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7M_UCLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32h747-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32h747-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32h747i-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_EVTEST=y
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
