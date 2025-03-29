Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BCC36011
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 12:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D82605A2;
	Sat, 29 Mar 2025 12:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72BEa8dCOZqi; Sat, 29 Mar 2025 12:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4817360B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4817360B05;
	Sat, 29 Mar 2025 12:38:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A9F519A
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F77B83FC3
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSxlWkVOwk_x for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8080B83F99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8080B83F99
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EB848386C; Sat, 29 Mar 2025 12:37:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Mar 2025 12:44:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec8120af81aa62e9ffd4e43867974ca7f60c37db
X-Git-Newrev: f9cc5dbd453c80790c1f2f7e9b19a85ded5979be
X-Patchwork-Hint: ignore
Message-Id: <20250329123758.6EB848386C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unmatched: new board
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9cc5dbd453c80790c1f2f7e9b19a85ded5979be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the HiFive Unmatched board. This includes
building the firmware, kernel and rootFS for the HiFive Unmatched.

The configuration is similar to the one for the HiFive Unleashed, this
is why most of it is shared in board/sifive/common.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
[Julien:
 - add missing BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 - change linux.hash comment to take hash from upstream
 - change linux-headers.hash file to a symlink
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/sifive/hifive-unmatched/boot.cmd             |   4 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../hifive-unmatched/patches/linux/linux.hash      |   2 +
 .../hifive-unmatched/patches/opensbi/opensbi.hash  |   2 +
 board/sifive/hifive-unmatched/readme.txt           | 100 +++++++++++++++++++++
 configs/hifive_unmatched_defconfig                 |  47 ++++++++++
 6 files changed, 156 insertions(+)

diff --git a/board/sifive/hifive-unmatched/boot.cmd b/board/sifive/hifive-unmatched/boot.cmd
new file mode 100644
index 0000000000..3f7b1d9ce3
--- /dev/null
+++ b/board/sifive/hifive-unmatched/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs earlycon=sbi root=/dev/mmcblk0p3 rootwait
+load mmc 0:3 ${kernel_addr_r} boot/Image
+load mmc 0:3 ${fdt_addr_r} boot/hifive-unmatched-a00.dtb
+booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/sifive/hifive-unmatched/patches/linux/linux.hash b/board/sifive/hifive-unmatched/patches/linux/linux.hash
new file mode 100644
index 0000000000..b356207dc4
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7  linux-6.12.20.tar.xz
diff --git a/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..1408f547b8
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/board/sifive/hifive-unmatched/readme.txt b/board/sifive/hifive-unmatched/readme.txt
new file mode 100644
index 0000000000..0a4ebcd2f1
--- /dev/null
+++ b/board/sifive/hifive-unmatched/readme.txt
@@ -0,0 +1,100 @@
+SiFive HiFive Unmatched
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unmatched board.
+
+Further information about the HiFive Unmatched board can be found
+at https://www.sifive.com/boards/hifive-unmatched
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make hifive_unmatched_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- boot.scr
+    +-- fw_dynamic.bin
+    +-- fw_dynamic.elf
+    +-- fw_jump.bin
+    +-- fw_jump.elf
+    +-- hifive-unmatched-a00.dtb
+    +-- Image
+    +-- rootfs.cpio
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- u-boot.bin
+    +-- u-boot.itb
+    +-- u-boot-spl.bin
+
+
+Creating a bootable SD card with genimage
+=========================================
+
+By default Buildroot builds a SD card image for you. All you need to do
+is dd the image to your SD card, which can be done with the following
+command on your development host:
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=4096
+
+The above example command assumes the SD card is accessed via a USB card
+reader and shows up as /dev/sdb on the host. Adjust it accordingly per
+your actual setup.
+
+Booting the SD card on the board
+================================
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1011), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unmatched Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
+
+You will get a warning reported by fdisk when you examine the SD card.
+This is because the genimage_sdcard.cfg file doesn't specify the SD card
+size (as people will naturally have different sized cards), so the
+secondary GPT header is placed after the rootfs rather than at the end
+of the disk where it is expected to be.
+
+You will see something like this at boot time:
+
+[    0.989458] mmc0: host does not support reading read-only switch, assuming write-enable
+[    0.996772] mmc0: new SDHC card on SPI
+[    1.001634] mmcblk0: mmc0:0000 SD8GB 7.28 GiB
+[    1.038079] GPT:Primary header thinks Alt. header is not at the end of the disk.
+[    1.044759] GPT:52389 != 15264767
+[    1.048051] GPT:Alternate GPT header not at the end of the disk.
+[    1.054015] GPT:52389 != 15264767
+[    1.057323] GPT: Use GNU Parted to correct GPT errors.
+[    1.062479]  mmcblk0: p1 p2 p3
+
+
+Testing under QEMU
+==================
+
+The SD card image can be tested using QEMU:
+
+$ qemu-system-riscv64 -M sifive_u,msel=11 -smp 5 -m 8G \
+    -display none -serial stdio -nic user \
+    -bios output/images/u-boot-spl.bin \
+    -drive file=output/images/sdcard.img,if=sd
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
new file mode 100644
index 0000000000..0b63ce15ff
--- /dev/null
+++ b/configs/hifive_unmatched_defconfig
@@ -0,0 +1,47 @@
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unmatched/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.20"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unmatched-a00"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unmatched"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sifive/hifive-unmatched/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
