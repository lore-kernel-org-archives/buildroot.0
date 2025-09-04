Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF3DCA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1103740462;
	Thu,  4 Sep 2025 16:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXl9zeJNG2Q8; Thu,  4 Sep 2025 16:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913894045A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913894045A;
	Thu,  4 Sep 2025 16:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 123B2106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D8EA8078D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49XI2sJX91mO for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068D280774
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 068D280774
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0451C8617D; Thu,  4 Sep 2025 16:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 170c649dc412c7b964f95c001c83154d35829fe0
X-Git-Newrev: 159f7015560381460a641fb68b5967dd8fe111f1
X-Patchwork-Hint: ignore
Message-Id: <20250904161348.0451C8617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/chromebook_snow:
 remove defconfig, broken
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=159f7015560381460a641fb68b5967dd8fe111f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273111

It has been failing for over 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dchromebook_snow&kind=BUILD

It builds a 4.15 kernel, which is not even a maintained LTS kernel.

Unless a fix is provided, this defconfig will be removed.

Cc: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 9d1a7f52543dba79d014b9b230c0a4e3ae669895)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 .checkpackageignore                                |   1 -
 DEVELOPERS                                         |   2 -
 board/chromebook/snow/kernel.args                  |   1 -
 board/chromebook/snow/kernel.its                   |  37 ------
 board/chromebook/snow/linux-4.15.fragment          |   2 -
 .../snow/patches/linux-headers/linux-headers.hash  |   1 -
 .../patches/linux/0001-linux-4.15-dts-tpm.patch    |  30 -----
 board/chromebook/snow/patches/linux/linux.hash     |   2 -
 board/chromebook/snow/readme.txt                   | 137 ---------------------
 board/chromebook/snow/sign.sh                      |  41 ------
 configs/chromebook_snow_defconfig                  |  24 ----
 11 files changed, 278 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 966276c81a..e6fbb6f0c4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -22,7 +22,6 @@ board/bsh/imx8mn-bsh-smm-s2/post-build.sh Shellcheck
 board/canaan/k210-soc/post-build.sh Shellcheck
 board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
-board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upstream
 board/freescale/common/imx/imx8-bootloader-prepare.sh Shellcheck
 board/freescale/common/mxs/post-image.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index e9a6931ccc..7bc41a9de1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -99,8 +99,6 @@ F:	package/libzenoh-pico/
 F:	package/network-manager-openvpn/
 
 N:	Alex Suykov <alex.suykov@gmail.com>
-F:	board/chromebook/snow/
-F:	configs/chromebook_snow_defconfig
 F:	package/vboot-utils/
 
 N:	Alexander Clouter <alex+buildroot@digriz.org.uk>
diff --git a/board/chromebook/snow/kernel.args b/board/chromebook/snow/kernel.args
deleted file mode 100644
index 1220bf84ac..0000000000
--- a/board/chromebook/snow/kernel.args
+++ /dev/null
@@ -1 +0,0 @@
-console=tty1 clk_ignore_unused root=/dev/mmcblk1p2 rootfstype=ext4 ro
diff --git a/board/chromebook/snow/kernel.its b/board/chromebook/snow/kernel.its
deleted file mode 100644
index c8766ef9e8..0000000000
--- a/board/chromebook/snow/kernel.its
+++ /dev/null
@@ -1,37 +0,0 @@
-/dts-v1/;
-
-/ {
-    description = "Buildroot kernel for Chromebook Snow";
-    images {
-        kernel@1 {
-            description = "kernel";
-            data = /incbin/("zImage");
-            type = "kernel_noload";
-            arch = "arm";
-            os = "linux";
-            compression = "none";
-            load = <0>;
-            entry = <0>;
-            hash@1 {
-                algo = "sha1";
-            };
-        };
-        fdt@1{
-            description = "exynos5250-snow.dtb";
-            data = /incbin/("exynos5250-snow.dtb");
-            type = "flat_dt";
-            arch = "arm";
-            compression = "none";
-            hash@1 {
-                algo = "sha1";
-            };
-        };
-    };
-    configurations {
-        default = "conf@1";
-        conf@1{
-            kernel = "kernel@1";
-            fdt = "fdt@1";
-        };
-    };
-};
diff --git a/board/chromebook/snow/linux-4.15.fragment b/board/chromebook/snow/linux-4.15.fragment
deleted file mode 100644
index e2786dacba..0000000000
--- a/board/chromebook/snow/linux-4.15.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_SDIO=m
diff --git a/board/chromebook/snow/patches/linux-headers/linux-headers.hash b/board/chromebook/snow/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/chromebook/snow/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
deleted file mode 100644
index 01f452b563..0000000000
--- a/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Some versions of u-boot for this Chromebook check for tpm node
-in the device tree and fail badly (reboot) if it is not found.
-
-While not exactly correct, it is much easier to patch the mainline
-device tree to match u-boot expectations than to fix u-boot on
-this device.
-
-See https://code.google.com/p/chromium/issues/detail?id=220169
-and https://lkml.org/lkml/2013/3/4/242
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-Upstream: Not Applicable
-[yann.morin.1998@free.fr: add Upstream tag]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-
---- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
-+++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
-@@ -466,6 +466,11 @@
- 	status = "okay";
- 	samsung,i2c-sda-delay = <100>;
- 	samsung,i2c-max-bus-freq = <66000>;
-+
-+	tpm {
-+		compatible = "infineon,slb9635tt";
-+		reg = <0x20>;
-+	};
- };
- 
- &i2c_5 {
-
diff --git a/board/chromebook/snow/patches/linux/linux.hash b/board/chromebook/snow/patches/linux/linux.hash
deleted file mode 100644
index 1064af46aa..0000000000
--- a/board/chromebook/snow/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Localy computed
-sha256  5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769  linux-4.15.tar.xz
diff --git a/board/chromebook/snow/readme.txt b/board/chromebook/snow/readme.txt
deleted file mode 100644
index 1afd949829..0000000000
--- a/board/chromebook/snow/readme.txt
+++ /dev/null
@@ -1,137 +0,0 @@
-Samsung XE303C12 aka Chromebook Snow
-====================================
-
-This file describes booting the Chromebook from an SD card containing
-Buildroot kernel and rootfs, using the original bootloader. This is
-the least invasive way to get Buildroot onto the devices and a good
-starting point.
-
-The bootloader will only boot a kernel from a GPT partition marked
-bootable with cgpt tool from vboot-utils package.
-The kernel image must be signed using futility from the same package.
-The signing part is done by sign.sh script in this directory.
-
-It does not really matter where rootfs is as long as the kernel is able
-to find it, but this particular configuration assumes the kernel is on
-partition 1 and rootfs is on partition 2 of the SD card.
-Make sure to check kernel.args if you change this.
-
-Making the boot media
----------------------
-Start by configuring and building the images.
-
-	make chromebook_snow_defconfig
-	make menuconfig # if necessary
-	make
-
-The important files are:
-
-	uImage.kpart (kernel and device tree, signed)
-	rootfs.tar
-	bootsd.img (SD card image containing both kernel and rootfs)
-
-Write the image directly to some SD card.
-WARNING: make sure there is nothing important on that card,
-and double-check the device name!
-
-	SD=/dev/mmcblk1		# may be /dev/sdX on some hosts
-	dd if=output/images/bootsd.img of=$SD
-
-Switching to developer mode and booting from SD
------------------------------------------------
-Power Chromebook down, then power it up while holding Esc+F3.
-BEWARE: switching to developer mode deletes all user data.
-Create backups if you need them.
-
-While in developer mode, Chromebook will boot into a white screen saying
-"OS verification is off".
-
-Press Ctrl-D at this screen to boot Chromium OS from eMMC.
-Press Ctrl-U at this screen to boot from SD (or USB)
-Press Power to power it off.
-Do NOT press Space unless you mean it.
-This will switch it back to normal mode.
-
-The is no way to get rid of the white screen without re-flashing the bootloader.
-
-Troubleshooting
----------------
-Loud *BEEP* after pressing Ctrl-U means there's no valid partition to boot from.
-Which in turn means either bad GPT or improperly signed kernel.
-
-Return to the OS verification screen without any sounds means the code managed
-to reboot the board. May indicate properly signed but invalid image.
-
-Blank screen means the image is valid and properly signed but cannot boot
-for some reason, like missing or incorrect DT.
-
-In case the board becomes unresponsive:
-
-* Press Esc+F3+Power. The board should reboot instantly.
-  Remove SD card to prevent it from attempting a system recovery.
-
-* Hold Power button for around 10s. The board should shut down into
-  its soft-off mode. Press Power button again or open the lid to turn in on.
-
-* If that does not work, disconnect the charger and push a hidden
-  button on the underside with a pin of some sort. The board should shut
-  down completely. Opening the lid and pressing Power button will not work.
-  To turn it back on, connect the charger.
-
-Partitioning SD card manually
------------------------------
-Check mksd.sh for partitioning commands.
-
-Use parted and cgpt on a real device, and calculate the partition
-sizes properly. The kernel partition may be as small as 4MB, but
-you will probably want the rootfs to occupy the whole remaining space.
-
-cgpt may be used to check current layout:
-
-	output/host/bin/cgpt show $SD
-
-All sizes and all offsets are in 512-byte blocks.
-
-Writing kernel and rootfs to a partitioned SD card
---------------------------------------------------
-Write .kpart directly to the bootable partition:
-
-	dd if=output/images/uImage.kpart of=${SD}1
-
-Make a new filesystem on the rootfs partition, and unpack rootfs.tar there:
-
-	mkfs.ext4 ${SD}2
-	mount ${SD2} /mnt/<ROOTFS-PARTITION>
-	tar -xvf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
-	umount /mnt/<ROOTFS-PARTITION>
-
-This will require root permissions even if you can write to $SD.
-
-Kernel command line
--------------------
-The command line is taken from board/chromebook/snow/kernel.args and stored
-in the vboot header (which also holds the signature).
-
-The original bootloader prepends "cros_secure console= " to the supplied
-command line. The only way to suppress this is to enable CMDLINE_FORCE
-in the kernel config, disabling external command line completely.
-
-That's not necessary however. The mainline kernel ignores cros_secure,
-and supplying console=tty1 in kernel.args undoes the effect of console=
-
-Booting with console= suppresses all kernel output.
-As a side effect, it makes /dev/console unusable, which the init in use must
-be able to handle.
-
-WiFi card
----------
-Run modprobe mwifiex_sdio to load the driver.
-The name of the device should be mlan0.
-
-Further reading
----------------
-https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/samsung-arm-chromebook
-http://linux-exynos.org/wiki/Samsung_Chromebook_XE303C12/Installing_Linux
-http://archlinuxarm.org/platforms/armv7/samsung/samsung-chromebook
-http://www.de7ec7ed.com/2013/05/application-processor-ap-uart-samsung.html
-http://www.de7ec7ed.com/2013/05/embedded-controller-ec-uart-samsung.html
diff --git a/board/chromebook/snow/sign.sh b/board/chromebook/snow/sign.sh
deleted file mode 100755
index e8f111ff0a..0000000000
--- a/board/chromebook/snow/sign.sh
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# This script creates u-boot FIT image containing the kernel and the DT,
-# then signs it using futility from vboot-utils.
-# The resulting file is called uImage.kpart.
-
-BOARD_DIR=$(dirname $0)
-mkimage=$HOST_DIR/bin/mkimage
-futility=$HOST_DIR/bin/futility
-devkeys=$HOST_DIR/share/vboot/devkeys
-
-run() { echo "$@"; "$@"; }
-die() { echo "$@" >&2; exit 1; }
-test -f $BINARIES_DIR/zImage || \
-	die "No kernel image found"
-test -x $mkimage || \
-	die "No mkimage found (host-uboot-tools has not been built?)"
-test -x $futility || \
-	die "No futility found (host-vboot-utils has not been built?)"
-
-# kernel.its references zImage and exynos5250-snow.dtb, and all three
-# files must be in current directory for mkimage.
-run cp $BOARD_DIR/kernel.its $BINARIES_DIR/kernel.its || exit 1
-echo "# entering $BINARIES_DIR for the next command"
-(cd $BINARIES_DIR && run $mkimage -f kernel.its uImage.itb) || exit 1
-
-# futility requires non-empty file to be supplied with --bootloader
-# even if it does not make sense for the target platform.
-echo > $BINARIES_DIR/dummy.txt
-
-run $futility vbutil_kernel \
-	--keyblock $devkeys/kernel.keyblock \
-	--signprivate $devkeys/kernel_data_key.vbprivk \
-	--arch arm \
-	--version 1 \
-	--config $BOARD_DIR/kernel.args \
-	--vmlinuz $BINARIES_DIR/uImage.itb \
-	--bootloader $BINARIES_DIR/dummy.txt \
-	--pack $BINARIES_DIR/uImage.kpart || exit 1
-
-rm -f $BINARIES_DIR/kernel.its $BINARIES_DIR/dummy.txt
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
deleted file mode 100644
index 9a5bcce98b..0000000000
--- a/configs/chromebook_snow_defconfig
+++ /dev/null
@@ -1,24 +0,0 @@
-BR2_arm=y
-BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
-BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
-BR2_TARGET_GENERIC_GETTY_TERM="linux"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
-BR2_LINUX_KERNEL_DEFCONFIG="exynos"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.15.fragment"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_PACKAGE_HOST_PARTED=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-BR2_PACKAGE_HOST_VBOOT_UTILS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
