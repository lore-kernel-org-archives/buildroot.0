Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFF5CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBAC82112;
	Wed,  2 Oct 2024 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EIWAVwJVadZ; Wed,  2 Oct 2024 20:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D823A818DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D823A818DC;
	Wed,  2 Oct 2024 20:35:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4890B1BF282
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBBC5407BB
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSx7xdUAppuN for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEF4D40C7F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEF4D40C7F
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E482584701; Wed,  2 Oct 2024 20:35:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:34:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34e0130bc3d895a0b05bf997026e28248892b66f
X-Git-Newrev: b62dc002066c673da6f598842fa62294ecb2d0ae
X-Patchwork-Hint: ignore
Message-Id: <20241002203511.E482584701@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32f746_disco_sd: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=b62dc002066c673da6f598842fa62294ecb2d0ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit adds support for STM32F746G-DISCO board. The discovery kit is
a complete demonstration and development platform for STMicroelectronics
Arm Cortex-M7-core-based STM32F746NG.

Board support package includes the following components:
- mainline Linux kernel 5.15.165
- mainline U-Boot 2024.07
- default packages from buildroot

Link: https://www.st.com/en/evaluation-tools/32f746gdiscovery.html
Co-Developed-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 +++
 .../stm32f746-disco/extlinux.conf                  |  4 +++
 .../stmicroelectronics/stm32f746-disco/flash_sd.sh | 22 +++++++++++++++
 .../stm32f746-disco/genimage.cfg                   | 10 +++++++
 .../stm32f746-disco/linux.fragment                 | 13 +++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../stm32f746-disco/patches/linux/linux.hash       |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash       |  2 ++
 .../stm32f746-disco/post-build.sh                  |  4 +++
 .../stmicroelectronics/stm32f746-disco/readme.txt  | 31 ++++++++++++++++++++++
 configs/stm32f746_disco_sd_defconfig               | 31 ++++++++++++++++++++++
 11 files changed, 124 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ea4ee3377f..44b1947487 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -788,10 +788,12 @@ F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
+F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
+F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
 F:	package/armadillo/
 F:	package/babeld/
@@ -3304,7 +3306,9 @@ F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	board/qemu/riscv32-virt/
+F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
+F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
diff --git a/board/stmicroelectronics/stm32f746-disco/extlinux.conf b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
new file mode 100644
index 0000000000..40fc04dd10
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32f746-disco-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32f746-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootwait consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f746-disco/flash_sd.sh b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
new file mode 100755
index 0000000000..b4858cb9da
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
@@ -0,0 +1,22 @@
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
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f746g-disco.cfg \
+    -c "init" \
+    -c "reset init" \
+    -c "flash probe 0" \
+    -c "flash info 0" \
+    -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+    -c "reset run" \
+    -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f746-disco/genimage.cfg b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
new file mode 100644
index 0000000000..e911a94e46
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
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
diff --git a/board/stmicroelectronics/stm32f746-disco/linux.fragment b/board/stmicroelectronics/stm32f746-disco/linux.fragment
new file mode 100644
index 0000000000..625fdced9e
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/linux.fragment
@@ -0,0 +1,13 @@
+# CONFIG_PREEMPT is not set
+# CONFIG_MULTIUSER is not set
+# CONFIG_TIMERFD is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xC0000000
+CONFIG_DRAM_SIZE=0x01000000
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_PROC_SYSCTL is not set
+# CONFIG_CRYPTO is not set
+CONFIG_RCU_TRACE=y
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
new file mode 100644
index 0000000000..7f78b950f3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
new file mode 100755
index 0000000000..03e9dcae82
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32f746-disco/readme.txt b/board/stmicroelectronics/stm32f746-disco/readme.txt
new file mode 100644
index 0000000000..4ac16da331
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/readme.txt
@@ -0,0 +1,31 @@
+STM32F746-DISCO
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F746-DISCO evaluation platform.
+
+Building
+--------
+
+  make stm32f746_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f746-disco/flash_sd.sh output/
+
+It will flash the U-boot bootloader.
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
+definition in board/stmicroelectronics/stm32f746-disco/genimage.cfg.
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
new file mode 100644
index 0000000000..0a8a1ad4bb
--- /dev/null
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_BINFMT_FDPIC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f746-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_INIT_TINYINIT=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.165"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f746-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
