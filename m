Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCABFA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 181D660B89;
	Mon, 31 Oct 2022 12:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 181D660B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfgQpFDoA4Tj; Mon, 31 Oct 2022 12:08:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF2EF60B2B;
	Mon, 31 Oct 2022 12:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF2EF60B2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9A81BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 589D540249
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589D540249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KB3Y_6z5DhY5 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6D540252
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C6D540252
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F3D878D6; Mon, 31 Oct 2022 12:08:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:07:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bacbda92e1b1bff4689ad35beeba5d136dcc6dde
X-Git-Newrev: 89c245b97a1db31d0545face2d1d28de48beb488
X-Patchwork-Hint: ignore
Message-Id: <20221031120825.66F3D878D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_aarch64_ebbr: new defconfig
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
Content-Type: multipart/mixed; boundary="===============7675543609387027836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7675543609387027836==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=89c245b97a1db31d0545face2d1d28de48beb488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to build an AArch64 U-Boot based firmware implementing the
subset of UEFI defined by EBBR[1], as well as a Linux OS disk image booting
with UEFI, to run on Qemu.

The generated firmware binary can also be used to install or run another OS
supporting the EBBR specification.

We do not have Linux 5.19 headers at the moment therefore we rely on 5.17
in the defconfig.

[1]: https://github.com/ARM-software/ebbr

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                            |   4 ++
 board/qemu/aarch64-ebbr/genimage.cfg  |  31 ++++++++++
 board/qemu/aarch64-ebbr/grub.cfg      |   6 ++
 board/qemu/aarch64-ebbr/post-image.sh |  11 ++++
 board/qemu/aarch64-ebbr/readme.txt    | 103 ++++++++++++++++++++++++++++++++++
 board/qemu/aarch64-ebbr/u-boot.config |  34 +++++++++++
 configs/qemu_aarch64_ebbr_defconfig   |  50 +++++++++++++++++
 7 files changed, 239 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 64af4deb53..3ab4d65d67 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2989,6 +2989,10 @@ N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
 F:	package/utp_com/
 
+N:	Vincent Stehlé <vincent.stehle@arm.com>
+F:	board/qemu/aarch64-ebbr/
+F:	configs/qemu_aarch64_ebbr_defconfig
+
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
 F:	board/bananapi/bananapi-m2-zero/
 F:	configs/bananapi_m2_zero_defconfig
diff --git a/board/qemu/aarch64-ebbr/genimage.cfg b/board/qemu/aarch64-ebbr/genimage.cfg
new file mode 100644
index 0000000000..1ca8332b9c
--- /dev/null
+++ b/board/qemu/aarch64-ebbr/genimage.cfg
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
diff --git a/board/qemu/aarch64-ebbr/grub.cfg b/board/qemu/aarch64-ebbr/grub.cfg
new file mode 100644
index 0000000000..d99e19c4cd
--- /dev/null
+++ b/board/qemu/aarch64-ebbr/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=PARTLABEL=root rootwait
+}
diff --git a/board/qemu/aarch64-ebbr/post-image.sh b/board/qemu/aarch64-ebbr/post-image.sh
new file mode 100755
index 0000000000..c884a8b6f6
--- /dev/null
+++ b/board/qemu/aarch64-ebbr/post-image.sh
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
diff --git a/board/qemu/aarch64-ebbr/readme.txt b/board/qemu/aarch64-ebbr/readme.txt
new file mode 100644
index 0000000000..a2027dad44
--- /dev/null
+++ b/board/qemu/aarch64-ebbr/readme.txt
@@ -0,0 +1,103 @@
+Introduction
+============
+
+The qemu_aarch64_ebbr_defconfig is meant to illustrate some aspects of the Arm
+EBBR specification[1] and the Arm SystemReady IR[2] compliance program.
+It allows building an AArch64 U-Boot based firmware implementing the subset of
+UEFI defined by EBBR, as well as a Linux OS disk image booting with UEFI, to run
+on Qemu.
+
+Building
+========
+
+  $ make qemu_aarch64_ebbr_defconfig
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
+  qemu-system-aarch64 \
+      -M virt,secure=on \
+      -bios output/images/flash.bin \
+      -cpu cortex-a53 \
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
+      -smp 2 # qemu_aarch64_ebbr_defconfig
+
+The login prompt will appear in the terminal that started Qemu.
+
+Using the EBBR firmware to run another OS under Qemu
+----------------------------------------------------
+
+It is possible to use the generated firmware binary to install or run another OS
+supporting the EBBR specification.
+
+To run another OS on emulation using a live or pre-installed image, use the same
+Qemu command line as for the generated OS but adapt the OS image path in the
+-drive stanza.
+The image generated by the aarch64_efi_defconfig or the Arm ACS-IR images[3] are
+examples of pre-installed OS images.
+
+To install another OS using an installer iso image, prepare a destination disk
+image first with:
+
+  qemu-img create -f qcow2 disk.qcow2 10G
+
+Then run the OS installer iso image on emulation with:
+
+  qemu-system-aarch64 \
+      -M virt,secure=on \
+      -bios output/images/flash.bin \
+      -cpu cortex-a53 \
+      -device virtio-blk-device,drive=hd1 \
+      -device virtio-blk-device,drive=hd0 \
+      -device virtio-net-device,netdev=eth0 \
+      -device virtio-rng-device,rng=rng0 \
+      -drive file=<iso>,if=none,format=raw,readonly=on,id=hd0 \
+      -drive file=disk.qcow2,if=none,id=hd1 \
+      -m 1024 \
+      -netdev user,id=eth0 \
+      -no-acpi \
+      -nographic \
+      -object rng-random,filename=/dev/urandom,id=rng0 \
+      -rtc base=utc,clock=host \
+      -smp 2
+
+The installation medium will show up under the Linux OS installer as /dev/vda
+and the destination disk as /dev/vdb.
+To reboot into the installed OS, use the same Qemu command line as for the
+installation, but without the two stanzas
+referring to hd0.
+Linux distributions such as Debian, Fedora, openSUSE or Ubuntu provide an OS
+installer iso image.
+
+Miscellaneous
+=============
+
+This configuration is inspired by the qemu_aarch64_virt_defconfig, the
+aarch64_efi_defconfig and the Arm SystemReady IR IoT Integration, Test, and
+Certification Guide[4].
+
+Firmware update is currently not supported.
+
+[1]: https://github.com/ARM-software/ebbr
+[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
+[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
+[4]: https://developer.arm.com/documentation/DUI1101/1-1/?lang=en
diff --git a/board/qemu/aarch64-ebbr/u-boot.config b/board/qemu/aarch64-ebbr/u-boot.config
new file mode 100644
index 0000000000..94aae9d2aa
--- /dev/null
+++ b/board/qemu/aarch64-ebbr/u-boot.config
@@ -0,0 +1,34 @@
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
+CONFIG_TEE=y
diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch64_ebbr_defconfig
new file mode 100644
index 0000000000..15822e17a3
--- /dev/null
+++ b/configs/qemu_aarch64_ebbr_defconfig
@@ -0,0 +1,50 @@
+# Architecture
+BR2_aarch64=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-ebbr/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-ebbr/genimage.cfg"
+
+# Linux headers
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19.8"
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_armv8a"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm64"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-ebbr/u-boot.config"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Host tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============7675543609387027836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7675543609387027836==--
