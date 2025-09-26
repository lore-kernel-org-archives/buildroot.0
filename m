Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3098CAC5B8
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 16:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7424B8384B;
	Fri, 26 Sep 2025 16:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRTCPHsQWQDA; Fri, 26 Sep 2025 16:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E81C82CF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E81C82CF1;
	Fri, 26 Sep 2025 16:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA9E198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C13F941F88
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrMb5gfsiDhz for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 16:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B71F415FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B71F415FD
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 16:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34C35864AA; Fri, 26 Sep 2025 16:54:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 18:30:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 981efdb8ca9033656e272e1de447c5e2359f7bc0
X-Git-Newrev: c584135c0e9a2144ca2ecb09b2b21a1aa7178438
X-Patchwork-Hint: ignore
Message-Id: <20250926165443.34C35864AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/iot-gate-imx8_ebbr: new defconfig
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
Content-Type: multipart/mixed; boundary="===============0307396246572663972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0307396246572663972==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c584135c0e9a2144ca2ecb09b2b21a1aa7178438
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to build an AArch64 disk image with a U-Boot based
firmware implementing the subset of UEFI defined by EBBR[1], as well as
a Linux OS booting with UEFI, to run on the IOT-GATE-iMX8 from Compulab.

The generated firmware binary can also be used to install or run another
OS supporting the EBBR specification.

This configuration is based on the work of Paul Liu[2] and is not related
with the official BSP from Compulab.

This has been tested on actual hardware.

While at it, add this defconfig to myself in DEVELOPERS.

[1] https://github.com/ARM-software/ebbr
[2] https://git.linaro.org/plugins/gitiles/people/paul.liu/systemready/build-scripts

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Ying-Chun Liu (Paul Liu) <paul.liu@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 board/compulab/iot-gate-imx8-ebbr/genimage.cfg     |  45 +++++++
 board/compulab/iot-gate-imx8-ebbr/grub.cfg         |   6 +
 .../arm-trusted-firmware/arm-trusted-firmware.hash |   2 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../iot-gate-imx8-ebbr/patches/linux/linux.hash    |   2 +
 .../patches/optee-client/optee-client.hash         |   2 +
 .../patches/optee-os/optee-os.hash                 |   2 +
 .../iot-gate-imx8-ebbr/patches/uboot/uboot.hash    |   2 +
 board/compulab/iot-gate-imx8-ebbr/post-image.sh    |  69 +++++++++++
 board/compulab/iot-gate-imx8-ebbr/readme.txt       | 131 +++++++++++++++++++++
 board/compulab/iot-gate-imx8-ebbr/u-boot.fragment  |   6 +
 configs/iot-gate-imx8_ebbr_defconfig               |  62 ++++++++++
 13 files changed, 332 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fc561eb1ea..c074923650 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3348,10 +3348,12 @@ F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
 F:	board/arm/fvp-ebbr/
+F:	board/compulab/iot-gate-imx8-ebbr/
 F:	board/pine64/rockpro64-ebbr/
 F:	board/qemu/aarch64-ebbr/
 F:	board/qemu/arm-ebbr/
 F:	configs/arm_fvp_ebbr_defconfig
+F:	configs/iot-gate-imx8_ebbr_defconfig
 F:	configs/qemu_aarch64_ebbr_defconfig
 F:	configs/qemu_arm_ebbr_defconfig
 F:	configs/rockpro64_ebbr_defconfig
diff --git a/board/compulab/iot-gate-imx8-ebbr/genimage.cfg b/board/compulab/iot-gate-imx8-ebbr/genimage.cfg
new file mode 100644
index 0000000000..feda4c7c09
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/genimage.cfg
@@ -0,0 +1,45 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 64M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	# When in eMMC user data, this protects U-Boot environment
+	partition env {
+		partition-type-uuid = u-boot-env
+		offset = 17K
+		size = 16K
+	}
+
+	# This allows to boot from recovery SD card
+	partition firmware {
+		image = "flash.bin"
+		# Linux reserved
+		partition-type-uuid = 8DA63339-0007-60C0-C436-083AC8230908
+		offset = 33K
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = esp
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = root-arm64
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/compulab/iot-gate-imx8-ebbr/grub.cfg b/board/compulab/iot-gate-imx8-ebbr/grub.cfg
new file mode 100644
index 0000000000..d99e19c4cd
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=PARTLABEL=root rootwait
+}
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/compulab/iot-gate-imx8-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..49079ecd7e
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e11880bf39dabfcb5945b58e848ddba661a1cd92425a997c626dec62b2dac6a9  arm-trusted-firmware-v2.13-git4.tar.gz
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/linux-headers/linux-headers.hash b/board/compulab/iot-gate-imx8-ebbr/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/linux/linux.hash b/board/compulab/iot-gate-imx8-ebbr/patches/linux/linux.hash
new file mode 100644
index 0000000000..3f3de0911f
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  231311bd7084dc3129944d26bb43be6ff837da82fb2104a67704aebca8bfa69f  linux-6.16.8.tar.xz
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/optee-client/optee-client.hash b/board/compulab/iot-gate-imx8-ebbr/patches/optee-client/optee-client.hash
new file mode 100644
index 0000000000..e82a2dff1d
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e6c6b93e2be417df57ceb05a2eb6505744e3fbdd3b2ae5e5bf79bf6028b6f84d  optee-client-4.7.0.tar.gz
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/optee-os/optee-os.hash b/board/compulab/iot-gate-imx8-ebbr/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..672e2a9203
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  976b9c184678516038d4e79766608e81d10bf136f76fd0db2dc48f90f994fbd9  optee-os-4.7.0.tar.gz
diff --git a/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash b/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/board/compulab/iot-gate-imx8-ebbr/post-image.sh b/board/compulab/iot-gate-imx8-ebbr/post-image.sh
new file mode 100755
index 0000000000..4e60504300
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/post-image.sh
@@ -0,0 +1,69 @@
+#!/bin/sh
+set -eux
+
+BOARD_DIR=$(dirname "$0")
+
+# Override the default GRUB configuration file with our own.
+cp -vf "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
+
+BINMAN_DIR="$BINARIES_DIR/binman"
+BINMAN_DTB="$BINMAN_DIR/u-boot.dtb"
+UBOOT_DIR=$(find "$BUILD_DIR" -maxdepth 1 -type d -name 'uboot-*')
+
+# Adjust binman dtb.
+rm -fr "$BINMAN_DIR"
+mkdir -v "$BINMAN_DIR"
+cp -v "$UBOOT_DIR/u-boot.dtb" "$BINMAN_DTB"
+# Add the fip image to the list of loadables.
+fdtput -t s "$BINMAN_DTB" /binman/section/fit/configurations/@config-SEQ loadables atf fip
+# Remove the tee node to avoid duplicate, as it is in the FIP image.
+fdtput --remove "$BINMAN_DTB" /binman/section/fit/images/tee
+
+# Generate flash image with binman.
+# We do this here to break the build dependency loop involving tf-a, op-tee, and
+# u-boot.
+# We use BL2 instead of BL31 in this configuration.
+(cd "${UBOOT_DIR}" && \
+./tools/binman/binman \
+	--toolpath ./tools \
+	-v5 \
+	build \
+	-u \
+	-d "$BINMAN_DTB" \
+	-O . \
+	-m \
+	--allow-missing \
+	--fake-ext-blobs \
+	-I "$BINMAN_DIR" \
+	-I . \
+	-I ./board/compulab/imx8mm-cl-iot-gate \
+	-I arch/arm/dts \
+	-a of-list="imx8mm-cl-iot-gate-optee" \
+	-I "$BINARIES_DIR" \
+	-a atf-bl31-path=bl2.bin \
+	-a tee-os-path= \
+	-a ti-dm-path= \
+	-a opensbi-path= \
+	-a default-dt="imx8mm-cl-iot-gate-optee" \
+	-a scp-path= \
+	-a rockchip-tpl-path= \
+	-a spl-bss-pad= \
+	-a tpl-bss-pad=1 \
+	-a vpl-bss-pad=1 \
+	-a spl-dtb=y \
+	-a tpl-dtb= \
+	-a vpl-dtb= \
+	-a pre-load-key-path= \
+	-a of-spl-remove-props="interrupt-parent interrupts" \
+	)
+
+# Copy the flash image.
+cp -v "$UBOOT_DIR/flash.bin" "$BINARIES_DIR/"
+
+# Verify that it will fit in the eMMC boot partition.
+size=$(du -b "$BINARIES_DIR/flash.bin" |cut -f 1)
+
+if [ "$size" -gt 4160512 ]; then
+	echo "Flash image is too big! (${size} bytes)" >&2
+	exit 1
+fi
diff --git a/board/compulab/iot-gate-imx8-ebbr/readme.txt b/board/compulab/iot-gate-imx8-ebbr/readme.txt
new file mode 100644
index 0000000000..2b6183e13f
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/readme.txt
@@ -0,0 +1,131 @@
+Introduction
+============
+
+The iot-gate-imx8_ebbr_defconfig is meant to illustrate some aspects of the Arm
+EBBR specification[1] and the Arm SystemReady Devicetree band[2].
+It allows building an AArch64 disk image with a U-Boot based firmware
+implementing the subset of UEFI defined by EBBR, as well as a Linux OS booting
+with UEFI, to run on the Compulab IOT-GATE-iMX8. [3]
+
+This configuration is not related with the official BSP from Compulab. [4]
+
+Building
+========
+
+  $ make iot-gate-imx8_ebbr_defconfig
+  $ make
+
+Generated files under output/images/:
+
+* disk.img: An eMMC or USB key disk image comprising TF-A, OP-TEE, the U-Boot
+  bootloader, the GRUB bootloader, the Linux kernel and the root filesystem.
+
+* flash.bin: A firmware image suitable for flashing in eMMC boot partition
+  comprising TF-A, OP-TEE and the U-Boot bootloader.
+
+Running
+=======
+
+Before flashing the firmware to eMMC, make sure that you have the IOTG-ACC-M2SD
+M.2 to SD adapter for recovery and prepare a recovery SD card. [5]
+Insert the SD card and the M.2 adapter.
+
+Prepare a USB key on a PC:
+
+  # dd if=output/images/disk.img of=<USB key device> ; sync
+
+Insert the USB key, close jumper E1 on the board to select recovery boot,
+connect to the UART console on the micro USB connector (a Silicon Labs CP2104
+UART bridge) with baudrate 115200, power on the board and break to U-Boot
+prompt.
+
+Flash the firmware from the USB key to the eMMC boot partition:
+
+  u-boot=> usb start
+  u-boot=> usb dev 0
+  u-boot=> usb read ${loadaddr} 0x42 0x1fbe
+  u-boot=> mmc dev 2 1
+  u-boot=> mmc write ${loadaddr} 0x42 0x1fbe
+  u-boot=> mmc partconf 2 0 1 0
+
+Power off the board, remove jumper E1 and the M.2 SD card adapter, then restart
+the board; it should boot to Linux, with the root filesystem on the USB key.
+
+Other setups are also possible, with the firmware and/or the root filesystem in
+the eMMC user data. The firmware binary is also available as flash.bin for
+convenience, to allow network download for example.
+
+With the firmware in the eMMC boot partition, it is possible to install or run
+another OS supporting the EBBR specification.
+
+The image generated by the aarch64_efi_defconfig, the images from Linux
+distributions such as Debian, Fedora, openSUSE, Ubuntu, OpenWrt and Yocto, and
+the Arm ACS Devicetree images[6] are examples of compatible OS images.
+
+When installing other OSes to eMMC, it is recommended to protect the first 32KB
+of the user data with a partition, as this is where the U-Boot environment can
+be saved.
+
+Firmware details
+================
+
+Noteworthy firmware features:
+
+- TF-A, OP-TEE & U-Boot
+- UEFI, with EFI variables stored on disk in the ESP
+- Support for ethernet, USB and RTC
+- U-Boot environment in eMMC user data (starting from byte 0x4400)
+
+Architecture diagram:
+
+                 Non-Secure          :   Secure
+                                     :
+       +---------------------------+ :
+  EL0  |          Busybox          | :
+       +---------------------------+ : +--------+
+  EL1  |           Linux           | : | OP-TEE |  S-EL1
+       +---------------------------+ : +--------+
+  EL2  | U-Boot, GRUB, Linux (kvm) | :
+       +---------------------------+ :
+  ...................................:
+       +----------------------------------------+
+       |          ROM, U-Boot SPL, TF-A         |  EL3
+       +----------------------------------------+
+
+Boot flow:
+
+  ROM -+-> SPL -> TF-A -+-> OP-TEE
+                        `-> U-Boot -> GRUB -> Linux -> Busybox
+
+The ROM loads U-Boot SPL.
+U-Boot SPL does the DRAM setup, loads the fit image with TF-A, OP-TEE, U-Boot
+and the Devicetree.
+In this configuration TF-A is booting with BL2 and BL31.
+OP-TEE amends the Devicetree, calls back TF-A to go to normal world.
+U-Boot loads GRUB with UEFI, boots Linux at EL2.
+
+Miscellaneous
+=============
+
+This configuration is based on the work of Paul Liu[7] and is inspired by the
+other configurations related with EBBR, and the Arm SystemReady Devicetree Band
+Integration and Testing Guide[8].
+
+To avoid a circular build dependency, we skip the binman step during U-Boot
+build:
+
+  BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="cmd_binman=:"
+
+Then we run binman manually in the post-image script.
+
+Firmware update and UEFI Secure Boot are currently not supported.
+The disk image cannot be used for SD card recovery at this point.
+
+[1] https://github.com/ARM-software/ebbr
+[2] https://www.arm.com/architecture/system-architectures/systemready-compliance-program/systemready-devicetree-band
+[3] https://www.compulab.com/products/iot-gateways/iot-gate-imx8-industrial-arm-iot-gateway/
+[4] https://mediawiki.compulab.com/w/index.php?title=Building_IOT-GATE-iMX8_and_SBC-IOT-iMX8_Yocto_Linux_images
+[5] https://mediawiki.compulab.com/w/index.php?title=IOT-GATE-iMX8_and_SBC-IOT-iMX8:_U-Boot:_Recovery
+[6] https://github.com/ARM-software/arm-systemready/tree/main/SystemReady-devicetree-band/prebuilt_images
+[7] https://git.linaro.org/plugins/gitiles/people/paul.liu/systemready/build-scripts
+[8] https://developer.arm.com/documentation/DUI1101/latest/
diff --git a/board/compulab/iot-gate-imx8-ebbr/u-boot.fragment b/board/compulab/iot-gate-imx8-ebbr/u-boot.fragment
new file mode 100644
index 0000000000..d72664dc5c
--- /dev/null
+++ b/board/compulab/iot-gate-imx8-ebbr/u-boot.fragment
@@ -0,0 +1,6 @@
+CONFIG_ARCH_MISC_INIT=y
+CONFIG_CMD_RNG=y
+CONFIG_DM_REGULATOR_ANATOP=y
+CONFIG_DM_RNG=y
+CONFIG_FSL_CAAM=y
+CONFIG_PHY_ANEG_TIMEOUT=5000
diff --git a/configs/iot-gate-imx8_ebbr_defconfig b/configs/iot-gate-imx8_ebbr_defconfig
new file mode 100644
index 0000000000..ff646e8adc
--- /dev/null
+++ b/configs/iot-gate-imx8_ebbr_defconfig
@@ -0,0 +1,62 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/compulab/iot-gate-imx8-ebbr/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/compulab/iot-gate-imx8-ebbr/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/compulab/iot-gate-imx8-ebbr/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.16.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.13"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="bl2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_BASE=0x7e000000 IMX_BOOT_UART_BASE=0x30880000 NEED_BL2=yes BL2_CFLAGS=-DIMX_FIP_MMAP"
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot efi_gop efifwsetup efinet efitextmode ext2 fat help linux lsefi lsefimmap lsefisystab normal part_gpt part_msdos reboot squash4"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.7.0"
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="imx"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="mx8mm_cl_iot_gate"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_TA_LOG_LEVEL=2 CFG_EXTERNAL_DTB_OVERLAY=y CFG_DT=y CFG_DT_ADDR=0x52000000"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm-cl-iot-gate-optee"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/compulab/iot-gate-imx8-ebbr/u-boot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="cmd_binman=:"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

--===============0307396246572663972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0307396246572663972==--
