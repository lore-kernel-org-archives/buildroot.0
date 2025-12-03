Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415E6D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C26FA83F50;
	Fri, 12 Dec 2025 07:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4i-UwcXWw-a4; Fri, 12 Dec 2025 07:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE66D83DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526243;
	bh=ntRMeVwoQ5C9/hLuDcoc2MfMlyW1Ta4JB3ZZSd3Z8vM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M7EYKgTDC2KX/ePW0Soz10sOIsF3XuL3qv9158Wlgj800m2BNUJQnJ7FAnhDYFxCc
	 amQfshXi24hZymSFqOAHvW+PJYYBFqp7IkXp+KQ6Rc0iOBV3RepS8ZwPZfV10CmjD2
	 QcPxt71tgRIrusso55H9tVaW/yINotPZsUzPNU9R4WXFD3KztJ7OtUeSJ1VrI4pHKR
	 0zFWFG/4uoJr8MbAOGVw9QYTuNWdVU0VKETId4J6AS9MY3xegfvzpcatU407CTjxCo
	 F1EKbXtMwxpOZhJ4Kek4doEEnkK0+t4Q1M2ydx3jXqKT7GlNFfuUZrJ//c8wGs0yXH
	 Oi7RjWKrfieog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE66D83DA3;
	Fri, 12 Dec 2025 07:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D6F2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E06B4115D
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-5OxjQ21DAn for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C64D04114F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C64D04114F
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C551D7FB20; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Dec 2025 19:27:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1609e853229553243b4feda455a403a2158e66a2
X-Git-Newrev: f2222ca745a42990a28eff437d36c7a333c88730
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.C551D7FB20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/versal2: add versal2 vek385 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2222ca745a42990a28eff437d36c7a333c88730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an example config for the Versal2 VEK385 evaluation board. This board has
the superset 2VE3858 device of the Versal AI Edge Gen 2 family with
8 Cortex-A78AE cores, 10 Cortex-R52 cores, 144 AIE-ML tiles and over 500k LUTs.

With this patch, Buildroot is capable to build a full image for the VEK385
evaluation board along with all the necessary firmware components.

More information about the VEK385 evaluation board can be found here:
https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek385.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                       |   2 +
 board/versal2/genimage.cfg       |   1 +
 board/versal2/post-build.sh      |   1 +
 board/versal2/post-image.sh      |  28 ++++++
 board/versal2/readme.txt         | 181 +++++++++++++++++++++++++++++++++++++++
 configs/versal2_vek385_defconfig |  49 +++++++++++
 6 files changed, 262 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62d1e7f914..45229ecf41 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2482,6 +2482,7 @@ F:	package/libgudev/
 
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
+F:	board/versal2/
 F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
@@ -2490,6 +2491,7 @@ F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
 F:	configs/versal_vpk180_defconfig
+F:	configs/versal2_vek385_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_kria_kd240_defconfig
diff --git a/board/versal2/genimage.cfg b/board/versal2/genimage.cfg
new file mode 120000
index 0000000000..3aa5543165
--- /dev/null
+++ b/board/versal2/genimage.cfg
@@ -0,0 +1 @@
+../versal/genimage.cfg
\ No newline at end of file
diff --git a/board/versal2/post-build.sh b/board/versal2/post-build.sh
new file mode 120000
index 0000000000..0130ff23d2
--- /dev/null
+++ b/board/versal2/post-build.sh
@@ -0,0 +1 @@
+../zynqmp/post-build.sh
\ No newline at end of file
diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
new file mode 100755
index 0000000000..36cd2eda19
--- /dev/null
+++ b/board/versal2/post-image.sh
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "system.dtb", and
+# with versal2, the Linux DTB is the same as the U-Boot DTB, so
+# let's use a symlink since the DTB is the same.
+ln -fs "${BINARIES_DIR}/u-boot.dtb" "${BINARIES_DIR}/system.dtb"
+
+BOARD_DIR="$(dirname "$0")"
+
+cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
+	the_ROM_image:
+	{
+	  image {
+	    { type=bootimage, file=${BINARIES_DIR}/boot.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
+	    { core=asu, file=${BINARIES_DIR}/asufw.elf }
+	  }
+	  image {
+	    id = 0x1c000000, name=apu_subsystem
+	    { type=raw, load=0x01000000, file=${BINARIES_DIR}/u-boot.dtb }
+	    { core=a78-0, cluster=0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a78-0, cluster=0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
+	  }
+	}
+	__HEADER_EOF
+
+"${HOST_DIR}/bin/bootgen" -arch versal_2ve_2vm -image "${BINARIES_DIR}/bootgen.bif" -o "${BINARIES_DIR}/boot.bin" -w on
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/versal2/readme.txt b/board/versal2/readme.txt
new file mode 100644
index 0000000000..fd7d092cc4
--- /dev/null
+++ b/board/versal2/readme.txt
@@ -0,0 +1,181 @@
+This document describes the Buildroot support for the following
+Xilinx Versal Gen2 boards:
+
+******************************************
+Supported Versal Gen2 Boards:
+Xilinx VEK385 board
+******************************************
+
+Evaluation board features can be found here with the links below.
+
+VEK385:
+https://www.amd.com/en/products/adaptive-socs-and-fpgas/evaluation-boards/vek385.html
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make versal2_vek385_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- asufw.elf
+    +-- bl31.elf
+    +-- boot.bin
+    +-- bootgen.bif
+    +-- boot.pdi
+    +-- boot.vfat
+    +-- extlinux.conf
+    +-- Image
+    +-- plm.elf
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- system.dtb -> u-boot.dtb
+    +-- u-boot.dtb
+    `-- u-boot.elf
+
+How to write the SD card
+========================
+
+WARNING! This will destroy all the card content. Use with care!
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to an SD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the SD.
+
+Eject the SD card, insert it in the board, and power it up.
+
+Support for other boards:
+=========================
+
+If you want to build a system for other boards based on the same SoC, and the
+board is already supported by the upstream kernel, U-Boot, and
+xilinx-prebuilt, you simply need to change the following Buildroot options:
+
+ - U-Boot (BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=<dts file name>")
+ - xilinx-prebuilt (BR2_TARGET_XILINX_PREBUILT_BOARD)
+
+Custom versal2 board support:
+
+To generate a boot.bin image, Versal2 boards require a PDI (Programmable Device
+Image) generated by Xilinx Vivado which contains all the hardware specific
+boot information, such as clock, MIO and DDR initializations as well as any
+customizations in the programmable logic. Since this PDI can only be generated
+by Xilinx Vivado, Buildroot needs access to the prebuilt image. The Buildroot
+xilinx-prebuilt package has support for Versal2 XSA files exported from Xilinx
+Vivado.
+
+Using the option BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA, Buildroot can obtain
+the prebuilt PDI from the XSA file.
+
+1) Start with a defconfig supported by Buildroot (e.g. VEK385)
+    make versal2_vek385_defconfig
+
+2) make menuconfig
+    Visit the following menu and enable BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            [*] download a prebuilt Versal XSA
+
+3) Within the same menuconfig, configure location of XSA. It can be in the
+   local file system or downloadable from an https:// location.
+
+    Bootloaders  --->
+        xilinx-prebuilt  --->
+            (<path to XSA>) URL of custom XSA
+
+4) make
+
+The resulting output/images will contain a boot.bin that includes the custom
+PDI file extracted from the Xilinx Vivado exported XSA file.
+
+How to write boot.bin to VEK385 OSPI boot flash
+=======================================================
+
+The VEK385 cannot be configured to boot from the SD card directly because it
+is connected to the 2VE3858 by a USB to SD card bridge and not connected
+directly. For this reason, the boot.bin needs to be in the OSPI flash for
+booting the first boot stage, and u-boot can then boot Linux and the file
+system from the SD card.
+
+For writing the boot.bin file to the OSPI flash the first time, it is
+recommended to use the board system controller with the instructions on the
+wiki page below:
+https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2273738753/Versal+Evaluation+Board+-+System+Controller+-+Update+7
+
+Once the first boot.bin has been flashed and the VEK385 is able to boot into
+u-boot, u-boot can then be used for subsequent updates to the OSPI flash using
+the instructions below.
+
+VEK385 U-Boot Flashing Instructions:
+    $ usb start
+    $ sf probe
+    $ fatload usb 0 0x40000000 boot.bin
+    $ sf erase 0x0 +$filesize
+    $ sf write 0x40000000 0x0 $filesize
+
+If a valid boot.bin is already in the OSPI flash, it is possible to boot the
+Buildroot generated SD card image without updating the OSPI boot.bin image, so
+this is an optional step when just updating Linux and the file system.
+
+IMPORTANT NOTES for the VEK385
+=======================================================
+
+1) The base-design.pdi on the https://github.com/Xilinx/soc-prebuilt-firmware
+repo is designed for revB of the VEK385 and will not work properly on revA.
+Users should either create their own Vivado XSA file if they have a revA
+board, or make sure to get a VEK385 revB or newer board.
+
+2) The default u-boot bootcmd is not the distro_bootcmd that buildroot
+expects. When booting for the first time, please stop the boot in u-boot
+and run the following commands:
+    $ setenv bootcmd 'run distro_bootcmd'
+    $ saveenv
+    $ boot
+
+3) When using the 2025.2 release, the default u-boot env value for fdt_addr_r
+is 0x21000000 which overlaps with the OS image causing the following boot
+failure:
+
+Found /extlinux/extlinux.conf
+Retrieving file: /extlinux/extlinux.conf
+1:      linux
+Retrieving file: /Image
+append: console="ttyAMA1,115200" root="/dev/sdd2" rw rootwait
+Retrieving file: /system.dtb
+## Flattened Device Tree blob at 21000000
+   Booting using the fdt blob at 0x21000000
+ERROR: FDT image overlaps OS image (OS=20200000..21cf0000)
+EXTLINUX FAILED: continuing...
+
+This will be fixed with 2026.1 and future releases, but for 2025.2, users
+must run the following u-boot commands to change the default value.
+    $ setenv fdt_addr_r 0x31000000
+    $ saveenv
+
+4) Depending on the device tree used, the USB->SD card interface may not be
+probed as /dev/sdd as the probing order can vary based on the device tree
+configuration. To deal with this, users will need to change the last
+parameter of BR2_ROOTFS_POST_SCRIPT_ARGS to sda2, sdb2 or sdc2 depending on
+which corresponds to their configuration's USB->SD card.
+
+For example, the default value in the versal2_vek385_defconfig:
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
+
+If the USB->SD card interface probed first, this would need to be changed to:
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sda2"
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
new file mode 100644
index 0000000000..a2d57a0976
--- /dev/null
+++ b/configs/versal2_vek385_defconfig
@@ -0,0 +1,49 @@
+BR2_aarch64=y
+BR2_cortex_a78=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT=y
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH="microblazeel-buildroot-elf riscv32-buildroot-elf"
+BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB=y
+BR2_GLOBAL_PATCH_DIR="board/xilinx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal2/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA1,115200 sdd2"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.12_LTS_2025.2)/xlnx_rebase_v6.12_LTS_2025.2.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_XILINX_FPGAUTIL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.12_2025.2)/xlnx_rebase_v2.12_2025.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2025.01_2025.2)/xlnx_rebase_v2025.01_2025.2.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amd_versal2_virt"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_DTB=y
+BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal2-vek385-revB"
+BR2_TARGET_XILINX_EMBEDDEDSW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_ASUFW=y
+BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL2_PLM=y
+BR2_TARGET_XILINX_PREBUILT=y
+BR2_PACKAGE_HOST_BOOTGEN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
