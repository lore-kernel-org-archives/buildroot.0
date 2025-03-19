Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB56C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 23:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AAD16109D;
	Wed, 19 Mar 2025 23:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kdk6H-Rp2zu1; Wed, 19 Mar 2025 23:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074DB61099
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074DB61099;
	Wed, 19 Mar 2025 23:15:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB98CD
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF9CB4143B
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5hU4CRcNqnv for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 23:15:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC7E641437
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC7E641437
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 23:15:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A71BC881CD; Wed, 19 Mar 2025 23:15:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Mar 2025 23:45:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9958ed8fb0686ac69b636e7f57cf9b20979cc59
X-Git-Newrev: 572197f6d9cc079d73c57da91381191671ed8564
X-Patchwork-Hint: ignore
Message-Id: <20250319231552.A71BC881CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rockpro64_ebbr: new defconfig
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
Content-Type: multipart/mixed; boundary="===============4491201295117134575=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4491201295117134575==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=572197f6d9cc079d73c57da91381191671ed8564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a defconfig to build an AArch64 disk image with a U-Boot based
firmware implementing the subset of UEFI defined by EBBR[1], as well as
a Linux OS booting with UEFI, to run on the ROCKPro64 from Pine64.

The generated firmware binary can also be used to install or run another
OS supporting the EBBR specification.

[1] https://github.com/ARM-software/ebbr

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 board/pine64/rockpro64-ebbr/genimage.cfg           |  43 ++++++++
 board/pine64/rockpro64-ebbr/grub.cfg               |   6 ++
 board/pine64/rockpro64-ebbr/linux.fragment         |   6 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |   2 +
 .../patches/linux-headers/linux-headers.hash       |   1 +
 .../pine64/rockpro64-ebbr/patches/linux/linux.hash |   2 +
 .../patches/optee-client/optee-client.hash         |   2 +
 .../rockpro64-ebbr/patches/optee-os/optee-os.hash  |   2 +
 .../pine64/rockpro64-ebbr/patches/uboot/uboot.hash |   2 +
 board/pine64/rockpro64-ebbr/post-build.sh          |   6 ++
 board/pine64/rockpro64-ebbr/post-image.sh          |   7 ++
 board/pine64/rockpro64-ebbr/readme.txt             | 116 +++++++++++++++++++++
 board/pine64/rockpro64-ebbr/u-boot.fragment        |  19 ++++
 configs/rockpro64_ebbr_defconfig                   |  62 +++++++++++
 15 files changed, 278 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c6d7532f8..c1bcceda9b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3332,11 +3332,13 @@ F:	package/utp_com/
 
 N:	Vincent Stehlé <vincent.stehle@arm.com>
 F:	board/arm/fvp-ebbr/
+F:	board/pine64/rockpro64-ebbr/
 F:	board/qemu/aarch64-ebbr/
 F:	board/qemu/arm-ebbr/
 F:	configs/arm_fvp_ebbr_defconfig
 F:	configs/qemu_aarch64_ebbr_defconfig
 F:	configs/qemu_arm_ebbr_defconfig
+F:	configs/rockpro64_ebbr_defconfig
 F:	package/edk2-non-osi/
 
 N:	Vincent Stehlé <vincent.stehle@laposte.net>
diff --git a/board/pine64/rockpro64-ebbr/genimage.cfg b/board/pine64/rockpro64-ebbr/genimage.cfg
new file mode 100644
index 0000000000..be1aadbaf8
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/genimage.cfg
@@ -0,0 +1,43 @@
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
+	partition loader1 {
+		image = "idbloader.img"
+		partition-type-uuid = 8DA63339-0007-60C0-C436-083AC8230908
+		offset = 32K
+	}
+
+	partition loader2 {
+		image = "u-boot.itb"
+		partition-type-uuid = 8DA63339-0007-60C0-C436-083AC8230908
+		offset = 8M
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = esp
+		offset = 16M
+		bootable = true
+	}
+
+	partition root {
+		partition-type-uuid = root-arm64
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/pine64/rockpro64-ebbr/grub.cfg b/board/pine64/rockpro64-ebbr/grub.cfg
new file mode 100644
index 0000000000..d99e19c4cd
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /Image root=PARTLABEL=root rootwait
+}
diff --git a/board/pine64/rockpro64-ebbr/linux.fragment b/board/pine64/rockpro64-ebbr/linux.fragment
new file mode 100644
index 0000000000..cc5ceeafad
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/linux.fragment
@@ -0,0 +1,6 @@
+CONFIG_BLK_DEV_NVME=y
+CONFIG_DWMAC_ROCKCHIP=y
+CONFIG_PCIE_ROCKCHIP_HOST=y
+CONFIG_PHY_ROCKCHIP_PCIE=y
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
diff --git a/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..b5898cba3f
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash b/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/pine64/rockpro64-ebbr/patches/linux/linux.hash b/board/pine64/rockpro64-ebbr/patches/linux/linux.hash
new file mode 100644
index 0000000000..7635b8ccb3
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
diff --git a/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash b/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash
new file mode 100644
index 0000000000..e1f486e7a5
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash b/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..3e981c142d
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  43c389f0505e8bc21d6fbaa8ea83ec67d1746ed14a537e3f505cd0e5b4cc2db9  optee-os-4.5.0.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash b/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..50674352d7
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/pine64/rockpro64-ebbr/post-build.sh b/board/pine64/rockpro64-ebbr/post-build.sh
new file mode 100755
index 0000000000..344251be12
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+set -eu
+
+# Copy the firmware for the SPI NOR flash into the filesystem.
+install -v -D -m 0644 "$BINARIES_DIR/u-boot-rockchip-spi.bin" \
+	"$TARGET_DIR/lib/firmware/u-boot-rockchip-spi.bin"
diff --git a/board/pine64/rockpro64-ebbr/post-image.sh b/board/pine64/rockpro64-ebbr/post-image.sh
new file mode 100755
index 0000000000..5a3222fcf7
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/post-image.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+set -eu
+
+BOARD_DIR=$(dirname "$0")
+
+# Override the default GRUB configuration file with our own.
+cp -vf "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/pine64/rockpro64-ebbr/readme.txt b/board/pine64/rockpro64-ebbr/readme.txt
new file mode 100644
index 0000000000..6c2e0eec3f
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/readme.txt
@@ -0,0 +1,116 @@
+Introduction
+============
+
+The rockpro64_ebbr_defconfig is meant to illustrate some aspects of the Arm EBBR
+specification[1] and the Arm SystemReady Devicetree band[2].
+It allows building an AArch64 disk image with a U-Boot based firmware
+implementing the subset of UEFI defined by EBBR, as well as a Linux OS booting
+with UEFI, to run on the PINE64 ROCKPro64. [3]
+
+Building
+========
+
+  $ make rockpro64_ebbr_defconfig
+  $ make
+
+Generated files under output/images:
+
+* disk.img: An eMMC or SD card disk image comprising TF-A, OP-TEE, the U-Boot
+  bootloader, the GRUB bootloader, the Linux kernel and the root filesystem.
+
+* u-boot-rockchip-spi.bin: A firmware image suitable for flashing in SPI NOR
+  comprising TF-A, OP-TEE and the U-Boot bootloader (also included in the
+  root filesystem).
+
+Running
+=======
+
+Create a bootable SD card:
+
+  # dd if=output/images/disk.img of=<sdcard device> ; sync
+
+Connect to the UART console; the pin layout for serial console on PI-2 GPIO Bus
+is as follows:
+
+  Pin  Signal
+  ---  ------
+    6  GND
+    8  Tx out of RK3399
+   10  Rx into RK3399
+
+Voltage is 3V3, baudrate is 1500000.
+
+If necessary, connect a jumper between pins 23 and 25 to force SD card boot. [4]
+
+Flashing the firmware to SPI NOR
+--------------------------------
+
+It is possible to flash the firmware into the embedded SPI NOR, which makes the
+SD card fully available to the OS and also allows to boot from USB2 or NVMe.
+
+The SPI image and the mtd tools are included in the root filesystem; flash the
+firmware from Linux with the following command:
+
+  # flashcp -v /lib/firmware/u-boot-rockchip-spi.bin /dev/mtd0
+
+With the firmware in SPI NOR, it is possible to install or run another OS
+supporting the EBBR specification.
+
+The image generated by the aarch64_efi_defconfig, the images from Linux
+distributions such as Debian, Fedora, openSUSE or Ubuntu, and the Arm ACS
+Devicetree images[5] are examples of compatible OS images.
+
+Firmware details
+================
+
+Noteworthy firmware features:
+
+- TF-A, OP-TEE & U-Boot
+- UEFI, with EFI variables stored on disk in the ESP
+- Support for ethernet, USB2 and NVMe
+- RTC emulation
+- U-Boot environment in SPI NOR
+
+Architecture diagram:
+
+              Non-Secure       :   Secure
+                               :
+       +---------------------+ :
+  EL0  |       Busybox       | :
+       +---------------------+ : +--------+
+  EL1  | U-Boot, GRUB, Linux | : | OP-TEE |  S-EL1
+       +---------------------+ : +--------+
+  .............................:
+       +----------------------------------+
+       |    ROM, U-Boot TPL, SPL, TF-A    |  EL3
+       +----------------------------------+
+
+Boot flow:
+
+  ROM -+-> TPL
+       `-> SPL -> TF-A -+-> OP-TEE
+                        `-> U-Boot -> GRUB -> Linux -> Busybox
+
+The ROM loads U-Boot TPL and SPL. [7][8]
+U-Boot TPL does the DRAM setup, goes back to the ROM, which calls SPL.
+U-Boot SPL loads the fit image with TF-A, OP-TEE, U-Boot and the Devicetree.
+OP-TEE amends the Devicetree, calls back TF-A to go to normal world.
+U-Boot loads GRUB with UEFI, boots Linux.
+
+Miscellaneous
+=============
+
+This configuration is inspired by the rockpro64_defconfig, the other
+configurations related with EBBR and the Arm SystemReady Devicetree Band
+Integration and Testing Guide[6].
+
+Firmware update, eMMC and battery-backed RTC are currently not supported.
+
+[1] https://github.com/ARM-software/ebbr
+[2] https://www.arm.com/architecture/system-architectures/systemready-compliance-program/systemready-devicetree-band
+[3] https://www.pine64.org/rockpro64/
+[4] https://pine64.org/documentation/ROCKPro64/Getting_started/
+[5] https://github.com/ARM-software/arm-systemready/tree/main/SystemReady-devicetree-band/prebuilt_images
+[6] https://developer.arm.com/documentation/DUI1101/latest/
+[7] https://wiki.pine64.org/wiki/RK3399_boot_sequence
+[8] https://opensource.rock-chips.com/wiki_Boot_option
diff --git a/board/pine64/rockpro64-ebbr/u-boot.fragment b/board/pine64/rockpro64-ebbr/u-boot.fragment
new file mode 100644
index 0000000000..d943343df6
--- /dev/null
+++ b/board/pine64/rockpro64-ebbr/u-boot.fragment
@@ -0,0 +1,19 @@
+# CONFIG_SPL_ATF_NO_PLATFORM_PARAM is not set
+CONFIG_BOOTM_OPTEE=y
+CONFIG_CMD_BOOTEFI_HELLO=y
+CONFIG_CMD_BOOTEFI_SELFTEST=y
+CONFIG_CMD_DATE=y
+CONFIG_CMD_EFIDEBUG=y
+CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_RNG=y
+CONFIG_CMD_RTC=y
+CONFIG_CMD_SETEXPR=y
+CONFIG_DM_RTC=y
+CONFIG_EFI_HTTP_BOOT=y
+CONFIG_EFI_RT_VOLATILE_STORE=y
+CONFIG_EFI_SET_TIME=y
+CONFIG_OPTEE=y
+CONFIG_OPTEE_LIB=y
+CONFIG_OPTEE_TZDRAM_SIZE=0x02000000
+CONFIG_RTC_EMULATION=y
+CONFIG_TEE=y
diff --git a/configs/rockpro64_ebbr_defconfig b/configs/rockpro64_ebbr_defconfig
new file mode 100644
index 0000000000..4d94d61d1f
--- /dev/null
+++ b/configs/rockpro64_ebbr_defconfig
@@ -0,0 +1,62 @@
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/rockpro64-ebbr/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64-ebbr/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pine64/rockpro64-ebbr/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64-ebbr/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64-ebbr/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop lsefisystab lsefimmap lsefi efifwsetup efitextmode efinet"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.5.0"
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="rockchip-rk3399"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_LOG_LEVEL=2 CFG_DT=y CFG_DTB_MAX_SIZE=0x100000"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64-ebbr/u-boot.fragment"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE=y
+BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE_BIN=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb u-boot-rockchip-spi.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============4491201295117134575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4491201295117134575==--
