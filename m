Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D6CC6FA8B
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 07:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10DFB832EA;
	Thu, 22 Sep 2022 07:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10DFB832EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WNLieQahd8eH; Thu, 22 Sep 2022 07:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC1A832DB;
	Thu, 22 Sep 2022 07:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC1A832DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0C961BF2C2
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 07:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A002F610A6
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 07:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A002F610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jDxclP-RJiV for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 07:42:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90C1860D4B
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90C1860D4B
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 07:42:54 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 53F913520684; Thu, 22 Sep 2022 09:42:51 +0200 (CEST)
Date: Thu, 22 Sep 2022 09:42:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YywR+1YTnzQtkCrC@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-18-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1663832571; bh=VafUs7EWTvLEE3dhjCWCta/afzgXwvFUnHHEU1eDRTA=;
 h=Date:From:To:Subject:From;
 b=GrYtAzXw54DiPTN7vyjCxCHYnMs451e0Y54QP1lI8JEW1zDcNdgRxjYXKmypS8+2I
 /Wi56Kn/19Hn8H+BL0vHKNF7WD2Y/HPgtQ1/H9h/LnERNg5XmIv2S2ioM9QZj6Flg2
 PuJaW4rz1WmIzrFVWHk6YDtLYErskdLyB1CrfdSSn1YaHi4QOpoA2OWr/T9xRqBOuY
 CqBNXenYExcXQKuChIfmJC5o/kA8Xvvb8t2iYcQXYbh6rJ/1vcykMzBjB7zbR4nJVZ
 sOVivm+zTymF2i81VgBhfSxoElAY/WUyZDLExxKg8EGsbn5fFj5qP7eOQvIEDj/LF4
 uAP2AqYOxEBew==
Subject: [Buildroot] [PATCH] configs/stm32f746g-disco: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for ST Microsystems STM32F746G-DISCO board.
See here for hardware details:
https://www.st.com/en/evaluation-tools/32f746gdiscovery.html

The LCD and Ethernet are _not_ yet supported by Linux upstream.
The RAM is very limited, so the init script is stolen from the
RISCV noMMU systems to support booting to a shell without crashing.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  2 +
 .../stm32f746g-disco/extlinux.conf            |  4 ++
 .../stm32f746g-disco/flash.sh                 | 18 ++++++++
 .../stm32f746g-disco/genimage.cfg             | 27 ++++++++++++
 .../stm32f746g-disco/linux.fragment           |  6 +++
 .../stm32f746g-disco/post-build.sh            |  4 ++
 .../stm32f746g-disco/readme.txt               | 31 ++++++++++++++
 .../stm32f746g-disco/rootfs_overlay/init      |  1 +
 .../stm32f746g-disco/rootfs_overlay/sbin/init | 41 +++++++++++++++++++
 configs/stm32f746g_disco_sd_defconfig         | 32 +++++++++++++++
 10 files changed, 166 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f746g-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746g-disco/flash.sh
 create mode 100644 board/stmicroelectronics/stm32f746g-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746g-disco/linux.fragment
 create mode 100755 board/stmicroelectronics/stm32f746g-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746g-disco/readme.txt
 create mode 120000 board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/init
 create mode 100755 board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init
 create mode 100644 configs/stm32f746g_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 14b91fca8d..484bb90bcf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3037,6 +3037,8 @@ F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
+F:	board/stmicroelectronics/stm32f746g-disco/
+F:	configs/stm32f746g_disco_sd_defconfig
 
 N:	Will Newton <will.newton@gmail.com>
 F:	package/enchant/
diff --git a/board/stmicroelectronics/stm32f746g-disco/extlinux.conf b/board/stmicroelectronics/stm32f746g-disco/extlinux.conf
new file mode 100644
index 0000000000..bb79c0b412
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32f746-disco-buildroot
+  kernel /zImage
+  devicetree /stm32f746-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootwait consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f746g-disco/flash.sh b/board/stmicroelectronics/stm32f746g-disco/flash.sh
new file mode 100755
index 0000000000..d4e98cc808
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/flash.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+${OUTPUT_DIR}/host/bin/openocd -f board/stm32f7discovery.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot-dtb.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f746g-disco/genimage.cfg b/board/stmicroelectronics/stm32f746g-disco/genimage.cfg
new file mode 100644
index 0000000000..6743d41972
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"stm32f746-disco.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32f746g-disco/linux.fragment b/board/stmicroelectronics/stm32f746g-disco/linux.fragment
new file mode 100644
index 0000000000..de2e14be6f
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/linux.fragment
@@ -0,0 +1,6 @@
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xC0000000
+CONFIG_DRAM_SIZE=0x01000000
+CONFIG_FLASH_MEM_BASE=0x08000000
+CONFIG_FLASH_SIZE=0x00200000
+# CONFIG_XIP_KERNEL is not set
diff --git a/board/stmicroelectronics/stm32f746g-disco/post-build.sh b/board/stmicroelectronics/stm32f746g-disco/post-build.sh
new file mode 100755
index 0000000000..ec20fca7d9
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32f746g-disco/readme.txt b/board/stmicroelectronics/stm32f746g-disco/readme.txt
new file mode 100644
index 0000000000..d312840ea3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/readme.txt
@@ -0,0 +1,31 @@
+STM32F746G-DISCO
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F746G-DISCO evaluation platform.
+
+Building
+--------
+
+  make stm32f746g_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f746-disco/flash.sh output/
+
+It will flash the U-boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32f746-disco/genimage.cfg.
diff --git a/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/init b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/init
new file mode 120000
index 0000000000..a0b71977c0
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/init
@@ -0,0 +1 @@
+/sbin/init
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init
new file mode 100755
index 0000000000..1285fd4420
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746g-disco/rootfs_overlay/sbin/init
@@ -0,0 +1,41 @@
+#!/bin/sh
+
+# This script replaces the default busybox init process to avoid having that
+# process staying alive and sleeping in the background, (uselessly) consuming
+# precious memory.
+
+# Mount procfs and sysfs
+/bin/mount -t proc proc /proc
+/bin/mount -t sysfs sysfs /sys
+
+# When the kernel is directly booted, devtmpfs is not automatically mounted.
+# Manually mount it if needed.
+devmnt=$(mount | grep -c devtmpfs)
+if [ ${devmnt} -eq 0 ]; then
+    /bin/mount -t devtmpfs devtmpfs /dev
+fi
+
+# Use the /dev/console device node from devtmpfs if possible to not
+# confuse glibc's ttyname_r().
+# This may fail (E.G. booted with console=), and errors from exec will
+# terminate the shell, so use a subshell for the test
+if (exec 0</dev/console) 2>/dev/null; then
+    exec 0</dev/console
+    exec 1>/dev/console
+    exec 2>/dev/console
+fi
+
+# Clear memory to reduce page fragmentation
+echo 3 > /proc/sys/vm/drop_caches
+
+# Print a fun logo :)
+echo "          __  _"
+echo "         / / (_) ____   _   _ __  __"
+echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
+echo "       / /___| || | | || |_| | >  < "
+echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
+echo "    ST Microsystems STM32F746G-DISCO NOMMU"
+echo ""
+
+# Finally, let's start an interactive shell
+exec /bin/sh
diff --git a/configs/stm32f746g_disco_sd_defconfig b/configs/stm32f746g_disco_sd_defconfig
new file mode 100644
index 0000000000..7061a8a6ed
--- /dev/null
+++ b/configs/stm32f746g_disco_sd_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746g-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746g-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19.9"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746g-disco/linux.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f746-disco"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10-rc5"
+BR2_TARGET_UBOOT_BOARDNAME="stm32f746-disco"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_OPENOCD=y
+BR2_INIT_NONE=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32f746g-disco/rootfs_overlay"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
