Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A3AC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10DD260611;
	Sun, 14 Jul 2024 14:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCc87GLeO45h; Sun, 14 Jul 2024 14:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF9360621
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF9360621;
	Sun, 14 Jul 2024 14:52:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B13721BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E0C660621
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-fAvdYtluy8 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 14:52:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F83C60611
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F83C60611
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 14:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23FD5867C9; Sun, 14 Jul 2024 14:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 16:52:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 654e35951237015cf4d5d48a30ed0cc9bdd33138
X-Git-Newrev: 54be84cb5f7c1d9788a645baba0f600912325bfe
X-Patchwork-Hint: ignore
Message-Id: <20240714145242.23FD5867C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_fvp_ebbr: new defconfig
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
Content-Type: multipart/mixed; boundary="===============3221357035603577914=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3221357035603577914==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=54be84cb5f7c1d9788a645baba0f600912325bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to build an AArch64 U-Boot based firmware implementing
the subset of UEFI defined by EBBR[1], as well as a Linux OS disk image
booting with UEFI, to run on the Arm A-Profile Base RevC AEM FVP.

The generated firmware binaries can also be used to run another OS
supporting the EBBR specification.

[1]: https://github.com/ARM-software/ebbr

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/arm/fvp-ebbr/fvp-config.txt                  | 15 +++++
 board/arm/fvp-ebbr/fvp-ebbr.dts                    | 18 ++++++
 board/arm/fvp-ebbr/genimage.cfg                    | 31 +++++++++
 board/arm/fvp-ebbr/grub.cfg                        |  6 ++
 .../0001-feat-fvp-add-stdout-path.patch            | 45 +++++++++++++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/arm/fvp-ebbr/patches/linux/linux.hash        |  2 +
 board/arm/fvp-ebbr/patches/uboot/uboot.hash        |  2 +
 board/arm/fvp-ebbr/post-image.sh                   |  7 +++
 board/arm/fvp-ebbr/readme.txt                      | 73 ++++++++++++++++++++++
 board/arm/fvp-ebbr/u-boot.fragment                 | 49 +++++++++++++++
 configs/arm_fvp_ebbr_defconfig                     | 56 +++++++++++++++++
 14 files changed, 309 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e48ba20aa4..37725596f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3212,8 +3212,10 @@ F:	package/nss-myhostname/
 F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
+F:	board/arm/fvp-ebbr/
 F:	board/qemu/aarch64-ebbr/
 F:	board/qemu/arm-ebbr/
+F:	configs/arm_fvp_ebbr_defconfig
 F:	configs/qemu_aarch64_ebbr_defconfig
 F:	configs/qemu_arm_ebbr_defconfig
 F:	package/edk2-non-osi/
diff --git a/board/arm/fvp-ebbr/fvp-config.txt b/board/arm/fvp-ebbr/fvp-config.txt
new file mode 100644
index 0000000000..61e040015b
--- /dev/null
+++ b/board/arm/fvp-ebbr/fvp-config.txt
@@ -0,0 +1,15 @@
+# Arm A-Profile Base RevC AEM FVP config
+bp.secure_memory=1
+bp.ve_sysregs.exit_on_shutdown=1
+cache_state_modelled=0
+cluster0.NUM_CORES=4
+cluster0.cpu0.enable_crc32=1
+cluster0.cpu1.enable_crc32=1
+cluster0.cpu2.enable_crc32=1
+cluster0.cpu3.enable_crc32=1
+cluster1.NUM_CORES=4
+cluster1.cpu0.enable_crc32=1
+cluster1.cpu1.enable_crc32=1
+cluster1.cpu2.enable_crc32=1
+cluster1.cpu3.enable_crc32=1
+pctl.startup=0.0.0.0
diff --git a/board/arm/fvp-ebbr/fvp-ebbr.dts b/board/arm/fvp-ebbr/fvp-ebbr.dts
new file mode 100644
index 0000000000..45e4b47200
--- /dev/null
+++ b/board/arm/fvp-ebbr/fvp-ebbr.dts
@@ -0,0 +1,18 @@
+/*
+ * Copyright (c) 2024, ARM Limited and Contributors. All rights reserved.
+ *
+ * SPDX-License-Identifier: BSD-3-Clause
+ */
+
+#include "fvp-base-gicv3-psci-1t.dts"
+
+/* The TF-A Devicetree does not have the OP-TEE node; let's add it. */
+
+/ {
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+};
diff --git a/board/arm/fvp-ebbr/genimage.cfg b/board/arm/fvp-ebbr/genimage.cfg
new file mode 100644
index 0000000000..1ca8332b9c
--- /dev/null
+++ b/board/arm/fvp-ebbr/genimage.cfg
@@ -0,0 +1,31 @@
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
+	size = 128M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = U
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/arm/fvp-ebbr/grub.cfg b/board/arm/fvp-ebbr/grub.cfg
new file mode 100644
index 0000000000..d99e19c4cd
--- /dev/null
+++ b/board/arm/fvp-ebbr/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=PARTLABEL=root rootwait
+}
diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch
new file mode 100644
index 0000000000..0a04c02240
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch
@@ -0,0 +1,45 @@
+From 8c30a0c7fe0162de0618b26fb34cc91ea582e5f7 Mon Sep 17 00:00:00 2001
+From: Debbie Martin <Debbie.Martin@arm.com>
+Date: Wed, 27 Sep 2023 18:05:26 +0100
+Subject: [PATCH] feat(fvp): add stdout-path
+
+Add stdout-path to the fvp-base devicetree to be passed to BL33 (U-Boot)
+and then to the Linux kernel to be compliant to Arm SystemReady IR:
+https://developer.arm.com/documentation/DUI1101/2-0/
+Configure-U-Boot-for-SystemReady/Adapt-the-Devicetree
+
+This has been tested by booting fvp-base to Linux and ensuring the
+console is accessible.
+
+Change-Id: Iae98630f18f735ce344c1158f41f358c2a49eeb6
+Signed-off-by: Diego Sueiro <Diego.Sueiro@arm.com>
+Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+Upstream: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/+/8c30a0c7fe0162de0618b26fb34cc91ea582e5f7%5E!/
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ fdts/fvp-base-psci-common.dtsi | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/fdts/fvp-base-psci-common.dtsi b/fdts/fvp-base-psci-common.dtsi
+index 79cf37d3b0..ff31ba7616 100644
+--- a/fdts/fvp-base-psci-common.dtsi
++++ b/fdts/fvp-base-psci-common.dtsi
+@@ -27,11 +27,12 @@
+ 	#address-cells = <2>;
+ 	#size-cells = <2>;
+ 
++	chosen {
++		stdout-path = "serial0:115200n8";
+ #if (ENABLE_RME == 1)
+-	chosen { bootargs = "console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda ip=on";};
+-#else
+-	chosen {};
++		bootargs = "console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda ip=on";
+ #endif
++	};
+ 
+ 	aliases {
+ 		serial0 = &v2m_serial0;
+-- 
+2.43.0
+
diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..02714d06a0
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/arm/fvp-ebbr/patches/linux-headers/linux-headers.hash b/board/arm/fvp-ebbr/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/arm/fvp-ebbr/patches/linux/linux.hash b/board/arm/fvp-ebbr/patches/linux/linux.hash
new file mode 100644
index 0000000000..04e69e882a
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b78dcd09f6b725872a2c0c87a70a064b0fbbcccfe5ce60aa46c669934a9e28b6  linux-6.8.11.tar.xz
diff --git a/board/arm/fvp-ebbr/patches/uboot/uboot.hash b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..9f554d5c68
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  077cf8ca283411103ad274a3724dacb5068ede824de749beff9c9e5b531b43ea  u-boot-2024.07-rc3.tar.bz2
diff --git a/board/arm/fvp-ebbr/post-image.sh b/board/arm/fvp-ebbr/post-image.sh
new file mode 100755
index 0000000000..72b156eb33
--- /dev/null
+++ b/board/arm/fvp-ebbr/post-image.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR=$(dirname "$0")
+
+# Override the default GRUB configuration file with our own.
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/arm/fvp-ebbr/readme.txt b/board/arm/fvp-ebbr/readme.txt
new file mode 100644
index 0000000000..8115bfbdfb
--- /dev/null
+++ b/board/arm/fvp-ebbr/readme.txt
@@ -0,0 +1,73 @@
+Introduction
+============
+
+The arm_fvp_ebbr_defconfig is meant to illustrate some aspects of the Arm EBBR
+specification[1] and the Arm SystemReady IR[2] compliance program.
+It allows building an AArch64 U-Boot based firmware implementing the subset of
+UEFI defined by EBBR, as well as a Linux OS disk image booting with UEFI, to run
+on the Arm A-Profile Base RevC AEM FVP.
+
+Building
+========
+
+  $ make arm_fvp_ebbr_defconfig
+  $ make
+
+Generated files under output/images:
+
+* bl1.bin: A ROM image built from TF-A.
+* fip.bin: A firmware image comprising TF-A, OP-TEE and the U-Boot bootloader.
+* disk.img: An OS disk image comprising the GRUB bootloader, the Linux kernel
+  and the root filesystem.
+
+Running on the FVP
+==================
+
+Download the FVP from one of the following sources, corresponding to your host
+computer:
+
+- https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/FVP_Base_RevC-2xAEMvA_11.25_15_Linux64.tgz
+- https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/FVP_Base_RevC-2xAEMvA_11.25_15_Linux64_armv8l.tgz
+
+The FVP will be located under one of the corresponding folders:
+
+- Base_RevC_AEMvA_pkg/models/Linux64_GCC-9.3
+- Base_RevC_AEMvA_pkg/models/Linux64_armv8l_GCC-9.3
+
+Run the simulation with:
+
+  FVP_Base_RevC-2xAEMvA \
+      --config-file board/arm/fvp-ebbr/fvp-config.txt \
+      -C bp.secureflashloader.fname="output/images/bl1.bin" \
+      -C bp.flashloader0.fname="output/images/fip.bin" \
+      -C bp.virtioblockdevice.image_path="output/images/disk.img"
+
+The login prompt will appear in a new X terminal.
+
+Using the EBBR firmware to run another OS on the FVP
+----------------------------------------------------
+
+It is possible to use the generated firmware binaries to run another OS
+supporting the EBBR specification.
+
+To run another OS on simulation using a live or pre-installed image, use the
+same FVP command line as for the generated OS but adapt the OS image path in the
+virtioblockdevice stanza.
+The image generated by the aarch64_efi_defconfig or the Arm ACS-IR images[3] are
+examples of pre-installed OS images.
+Linux distributions such as Debian, Fedora, openSUSE or Ubuntu provide a
+pre-installed OS image.
+
+Miscellaneous
+=============
+
+This configuration is inspired by the arm_foundationv8_defconfig, the
+qemu_aarch64_virt_defconfig and the Arm SystemReady IR IoT Integration, Test,
+and Certification Guide[4].
+
+Firmware update, MMC and network are currently not supported.
+
+[1]: https://github.com/ARM-software/ebbr
+[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
+[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
+[4]: https://developer.arm.com/documentation/DUI1101/latest/
diff --git a/board/arm/fvp-ebbr/u-boot.fragment b/board/arm/fvp-ebbr/u-boot.fragment
new file mode 100644
index 0000000000..abbf8395be
--- /dev/null
+++ b/board/arm/fvp-ebbr/u-boot.fragment
@@ -0,0 +1,49 @@
+# CONFIG_USE_BOOTCOMMAND is not set
+CONFIG_BOOTCOMMAND="bootflow scan -lb"
+CONFIG_BOOTMETH_DISTRO=y
+CONFIG_BOOTM_EFI=y
+CONFIG_BOOTSTD_BOOTCOMMAND=y
+CONFIG_BOOTSTD_DEFAULTS=y
+CONFIG_BOOTSTD_FULL=y
+CONFIG_CMD_BOOTDEV=y
+CONFIG_CMD_BOOTEFI=y
+CONFIG_CMD_BOOTEFI_HELLO=y
+CONFIG_CMD_BOOTEFI_HELLO_COMPILE=y
+CONFIG_CMD_BOOTEFI_SELFTEST=y
+CONFIG_CMD_BOOTMETH=y
+CONFIG_CMD_DM=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_EFI_VARIABLE_FILE_STORE=y
+CONFIG_CMD_GETTIME=y
+CONFIG_CMD_GPT=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_RTC=y
+CONFIG_CMD_TIME=y
+CONFIG_DM_RNG=y
+CONFIG_DM_RTC=y
+CONFIG_EFI_DEVICE_PATH_TO_TEXT=y
+CONFIG_EFI_GET_TIME=y
+CONFIG_EFI_HAVE_RUNTIME_RESET=y
+CONFIG_EFI_LOADER=y
+CONFIG_EFI_LOADER_HII=y
+CONFIG_EFI_MM_COMM_TEE=y
+CONFIG_EFI_PARTITION=y
+CONFIG_EFI_SECURE_BOOT=y
+CONFIG_EFI_SET_TIME=y
+CONFIG_EFI_UNICODE_CAPITALIZATION=y
+CONFIG_EFI_UNICODE_COLLATION_PROTOCOL2=y
+CONFIG_EFI_VARIABLE_FILE_STORE=y
+CONFIG_FAT_WRITE=y
+CONFIG_FIT=y
+CONFIG_FS_FAT=y
+CONFIG_ISO_PARTITION=y
+CONFIG_MISC=y
+CONFIG_OF_CONTROL=y
+CONFIG_OF_LIBFDT=y
+CONFIG_OPTEE=y
+CONFIG_PARTITION_TYPE_GUID=y
+CONFIG_RNG_OPTEE=y
+CONFIG_TEE=y
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_VEXPRESS_CONFIG=y
diff --git a/configs/arm_fvp_ebbr_defconfig b/configs/arm_fvp_ebbr_defconfig
new file mode 100644
index 0000000000..57b671d5f7
--- /dev/null
+++ b/configs/arm_fvp_ebbr_defconfig
@@ -0,0 +1,56 @@
+# Architecture
+BR2_aarch64=y
+
+# Image
+BR2_GLOBAL_PATCH_DIR="board/arm/fvp-ebbr/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arm/fvp-ebbr/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/arm/fvp-ebbr/genimage.cfg"
+
+# Linux headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.11"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Packages
+BR2_PACKAGE_OPTEE_CLIENT=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Firmware and bootloader
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="fvp"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/arm/fvp-ebbr/fvp-ebbr.dts"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ARM_TSP_RAM_LOCATION=tdram FVP_DT_PREFIX=fvp-ebbr"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-fvp"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_ARM_GICV3=y"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07-rc3"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vexpress_fvp"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/arm/fvp-ebbr/u-boot.fragment"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Host tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============3221357035603577914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3221357035603577914==--
