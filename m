Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898FC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB0C409D8;
	Mon, 30 Jan 2023 21:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB0C409D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBhHhjZk5AKq; Mon, 30 Jan 2023 21:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CEB440C07;
	Mon, 30 Jan 2023 21:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CEB440C07
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5DE1BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F394F409EB
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F394F409EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53Wat0Ib4xQM for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:55:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C008408E4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C008408E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4717882624; Mon, 30 Jan 2023 21:55:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:54:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faa299ff8c94bea11345071a3d1d05c2681c2cdd
X-Git-Newrev: 7115ab39189a6c660745267d8bf0bf41cf8b3db7
X-Patchwork-Hint: ignore
Message-Id: <20230130215527.4717882624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_arm_ebbr: new defconfig
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
Content-Type: multipart/mixed; boundary="===============4145198286100998539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4145198286100998539==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7115ab39189a6c660745267d8bf0bf41cf8b3db7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to build a 32b ARMv7-A U-Boot based firmware implementing
the subset of UEFI defined by EBBR[1], as well as a Linux OS disk image
booting with UEFI, to run on Qemu.

The generated firmware binary can also be used to install or run another OS
supporting the EBBR specification.

[1]: https://github.com/ARM-software/ebbr

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                          |  2 ++
 board/qemu/arm-ebbr/genimage.cfg    | 31 ++++++++++++++++
 board/qemu/arm-ebbr/grub.cfg        |  6 ++++
 board/qemu/arm-ebbr/linux.fragment  |  2 ++
 board/qemu/arm-ebbr/post-image.sh   | 11 ++++++
 board/qemu/arm-ebbr/readme.txt      | 71 +++++++++++++++++++++++++++++++++++++
 board/qemu/arm-ebbr/u-boot.fragment | 35 ++++++++++++++++++
 configs/qemu_arm_ebbr_defconfig     | 57 +++++++++++++++++++++++++++++
 8 files changed, 215 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 706ee80ece..e19087c577 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2986,7 +2986,9 @@ F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
 F:	board/qemu/aarch64-ebbr/
+F:	board/qemu/arm-ebbr/
 F:	configs/qemu_aarch64_ebbr_defconfig
+F:	configs/qemu_arm_ebbr_defconfig
 F:	package/edk2-non-osi/
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
diff --git a/board/qemu/arm-ebbr/genimage.cfg b/board/qemu/arm-ebbr/genimage.cfg
new file mode 100644
index 0000000000..3d4c9cff1a
--- /dev/null
+++ b/board/qemu/arm-ebbr/genimage.cfg
@@ -0,0 +1,31 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+
+		file zImage {
+			image = "zImage"
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
+		partition-type-uuid = 69dad710-2ce4-4e3c-b16c-21a1d49abed3
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/qemu/arm-ebbr/grub.cfg b/board/qemu/arm-ebbr/grub.cfg
new file mode 100644
index 0000000000..ab3a6ec26b
--- /dev/null
+++ b/board/qemu/arm-ebbr/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /zImage root=PARTLABEL=root rootwait
+}
diff --git a/board/qemu/arm-ebbr/linux.fragment b/board/qemu/arm-ebbr/linux.fragment
new file mode 100644
index 0000000000..07554cf843
--- /dev/null
+++ b/board/qemu/arm-ebbr/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_TEE=y
+CONFIG_OPTEE=y
diff --git a/board/qemu/arm-ebbr/post-image.sh b/board/qemu/arm-ebbr/post-image.sh
new file mode 100755
index 0000000000..c884a8b6f6
--- /dev/null
+++ b/board/qemu/arm-ebbr/post-image.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR=$(dirname "$0")
+
+# Create flash.bin TF-A FIP image from bl1.bin and fip.bin
+dd if="${BINARIES_DIR}/bl1.bin" of="${BINARIES_DIR}/flash.bin" bs=1M
+dd if="${BINARIES_DIR}/fip.bin" of="${BINARIES_DIR}/flash.bin" seek=64 bs=4096 conv=notrunc
+
+# Override the default GRUB configuration file with our own.
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/qemu/arm-ebbr/readme.txt b/board/qemu/arm-ebbr/readme.txt
new file mode 100644
index 0000000000..085e723fe6
--- /dev/null
+++ b/board/qemu/arm-ebbr/readme.txt
@@ -0,0 +1,71 @@
+Introduction
+============
+
+The qemu_arm_ebbr_defconfig is meant to illustrate some aspects of the Arm
+EBBR specification[1] and the Arm SystemReady IR[2] compliance program.
+It allows building a 32b ARMv7-A U-Boot based firmware implementing the subset
+of UEFI defined by EBBR, as well as a Linux OS disk image booting with UEFI, to
+run on Qemu.
+
+Building
+========
+
+  $ make qemu_arm_ebbr_defconfig
+  $ make
+
+Generated files under output/images:
+
+* flash.bin: A firmware image comprising TF-A, OP-TEE and the U-Boot bootloader.
+
+* disk.img: An OS disk image comprising the GRUB bootloader, the Linux kernel
+  and the root filesystem.
+
+Running under Qemu
+==================
+
+Run the emulation with:
+
+  qemu-system-arm \
+      -M virt,secure=on \
+      -bios output/images/flash.bin \
+      -cpu cortex-a15 \
+      -device virtio-blk-device,drive=hd0 \
+      -device virtio-net-device,netdev=eth0 \
+      -device virtio-rng-device,rng=rng0 \
+      -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+      -m 1024 \
+      -netdev user,id=eth0 \
+      -no-acpi \
+      -nographic \
+      -object rng-random,filename=/dev/urandom,id=rng0 \
+      -rtc base=utc,clock=host \
+      -smp 2 # qemu_arm_ebbr_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
+
+Using the EBBR firmware to run another OS under Qemu
+----------------------------------------------------
+
+It is possible to use the generated firmware binary to run another OS
+supporting the EBBR specification.
+
+To run another OS on emulation using a live or pre-installed image, use the same
+Qemu command line as for the generated OS but adapt the OS image path in the
+-drive stanza.
+The 32b Arm ACS-IR image[3] is an example of a pre-installed OS image.
+Linux distributions such as Debian or openSUSE provide a pre-installed OS
+image.
+
+Miscellaneous
+=============
+
+This configuration is inspired by the qemu_arm_vexpress_tz_defconfig, the
+qemu_aarch64_ebbr_defconfig and the Arm SystemReady IR IoT Integration, Test,
+and Certification Guide[4].
+
+Firmware update is currently not supported.
+
+[1]: https://github.com/ARM-software/ebbr
+[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
+[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
+[4]: https://developer.arm.com/documentation/DUI1101/1-1/?lang=en
diff --git a/board/qemu/arm-ebbr/u-boot.fragment b/board/qemu/arm-ebbr/u-boot.fragment
new file mode 100644
index 0000000000..bfc382cde9
--- /dev/null
+++ b/board/qemu/arm-ebbr/u-boot.fragment
@@ -0,0 +1,35 @@
+CONFIG_BOOTM_EFI=y
+CONFIG_CMD_BOOTEFI=y
+CONFIG_CMD_BOOTEFI_HELLO=y
+CONFIG_CMD_BOOTEFI_HELLO_COMPILE=y
+CONFIG_CMD_BOOTEFI_SELFTEST=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_EFI_VARIABLE_FILE_STORE=y
+CONFIG_CMD_GPT=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_RTC=y
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
+CONFIG_OF_LIBFDT=y
+CONFIG_OPTEE=y
+CONFIG_PARTITION_TYPE_GUID=y
+CONFIG_RNG_OPTEE=y
+CONFIG_RTC_EMULATION=y
+CONFIG_SCMI_FIRMWARE=y
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_TEE=y
diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
new file mode 100644
index 0000000000..f3e2d42a54
--- /dev/null
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -0,0 +1,57 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/arm-ebbr/genimage.cfg"
+
+# Linux headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.0.9"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_ARM_EFI=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/u-boot.fragment"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Host tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

--===============4145198286100998539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4145198286100998539==--
