Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3412BD4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67A60842D0;
	Fri, 12 Dec 2025 07:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnbzfX5Q3TjC; Fri, 12 Dec 2025 07:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D99842D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526331;
	bh=RtzzrYV6SIcq3QDMuu5kknLTiCsR25COaG0ZZZ1ucW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N2dnfbVLWEn3pX1HngqCIn4SpqBRD7kH27SLw0cvlqBQXmf6iSk9H1VHqT3S/e6UE
	 FDugTI9XyQpO7qDsHZ651fu4MiC9CYQPgqa5SJvZfRdC1Qo6YWdjfRBqTsY7oPPgCS
	 9hChQ4G46/PB3LEt/5EIIAnhpFunZPUALRt5lUbvEkm+MVXEPhNuaf/VaPTa90PB53
	 pvQC0ThyIWYwIxS1mkz89U9ul3mkG1NIqeycSw8b/i6xrp/MptLLcbNW2I1iOJkmEL
	 5Mg/kVBa5pwjkr6YsJ1KIyYQc+acs6ka4hAdNMuT27UxAqYosFkGuGeRnS/NN4GP8V
	 AerLC0HMdRaSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D99842D3;
	Fri, 12 Dec 2025 07:58:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01957E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4433E41185
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHRuHcjj-zAO for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F61141189
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F61141189
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E5A7807F9; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 20:39:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e77ee474de92cb68f85b1a3e510174695c7266d8
X-Git-Newrev: 2bb8ea3ff11dd032a6cede3a101cfe129c7023d6
X-Patchwork-Hint: ignore
Message-Id: <20251212075538.8E5A7807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_fvp_ebbr: bump Linux, U-Boot,
 OP-TEE, TF-A and FVP
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
Content-Type: multipart/mixed; boundary="===============8939597937495781584=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8939597937495781584==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2bb8ea3ff11dd032a6cede3a101cfe129c7023d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to 6.18.
- Bump U-Boot to 2025.10. Add the dependency on GNU TLS. Refresh the
  config fragment: add smc & poweroff commands, add ESRT and dummy
  capsule update, add SMCCC features discovery.
- Bump OP-TEE to 4.8.0. Add the dependency on python-cryptography. Lock
  optee-client version to be the same as optee-os. Add a patch to output
  logs to the same UART as all the other components and increase log
  level. Remove the unnecessary dependency on dtc.
- Bump TF-A to v2.14.0.
- Bump FVP to 11.30_27. Disable terminal 1, now that all the logs go to
  a single terminal. Enable virtio network. Rate limit the simulation
  by default, for convenience at U-Boot and GRUB countdown, and for more
  realistic delays inside the simulation.
- Switch to Bootlin pre-built toolchain.
- Add more modules to GRUB, to have more commands available: efi
  commands, plus reboot & halt.
- Add eudev to probe Linux modules during boot, for LCD support.
- Configure eth0 with DHCP automatically during boot.
- Refresh the documentation.

This configuration has been tested on an x86 and on an AArch64 machine.

The firmware and FVP of this configuration have also been tested
successfully with other OSes: Debian Live, openSUSE Tumbleweed, Yocto,
OpenWrt, Buildroot AArch64 EFI and FreeBSD.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/arm/fvp-ebbr/fvp-config.txt                  |  4 ++
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/arm/fvp-ebbr/patches/linux/linux.hash        |  4 +-
 .../patches/optee-client/optee-client.hash         |  2 +
 ...1-plat-vexpress-redirect-console-to-uart0.patch | 34 +++++++++++
 board/arm/fvp-ebbr/patches/optee-os/optee-os.hash  |  2 +
 board/arm/fvp-ebbr/patches/uboot/uboot.hash        |  2 +-
 board/arm/fvp-ebbr/readme.txt                      | 65 +++++++++++++++++-----
 board/arm/fvp-ebbr/u-boot.fragment                 |  5 +-
 configs/arm_fvp_ebbr_defconfig                     | 20 +++++--
 10 files changed, 115 insertions(+), 25 deletions(-)

diff --git a/board/arm/fvp-ebbr/fvp-config.txt b/board/arm/fvp-ebbr/fvp-config.txt
index 61e040015b..5c68bb638e 100644
--- a/board/arm/fvp-ebbr/fvp-config.txt
+++ b/board/arm/fvp-ebbr/fvp-config.txt
@@ -1,6 +1,10 @@
 # Arm A-Profile Base RevC AEM FVP config
 bp.secure_memory=1
+bp.terminal_1.start_telnet=0
 bp.ve_sysregs.exit_on_shutdown=1
+bp.virtio_net.enabled=1
+bp.virtio_net.hostbridge.userNetworking=1
+bp.vis.rate_limit-enable=1
 cache_state_modelled=0
 cluster0.NUM_CORES=4
 cluster0.cpu0.enable_crc32=1
diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..b52b00722f 100644
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  a899100d9d92ceb1290fd4d61f5dd3b8af6b0e937cebc3c711cb514ac5acfaed  arm-trusted-firmware-v2.14.0-git4.tar.gz
diff --git a/board/arm/fvp-ebbr/patches/linux/linux.hash b/board/arm/fvp-ebbr/patches/linux/linux.hash
index 20941a269b..a4cc7bd3f6 100644
--- a/board/arm/fvp-ebbr/patches/linux/linux.hash
+++ b/board/arm/fvp-ebbr/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  524858852f5869a9ef17de8b1e6e7faf05bcb2c462bc96b3c24dbf82ede373cf  linux-6.10.12.tar.xz
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
diff --git a/board/arm/fvp-ebbr/patches/optee-client/optee-client.hash b/board/arm/fvp-ebbr/patches/optee-client/optee-client.hash
new file mode 100644
index 0000000000..6c61615dbe
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/optee-client/optee-client.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  464b3bf5bc4a61830357dbf81a0e5b89414d3bca1c2a752570cb0e40d2f1e637  optee-client-4.8.0.tar.gz
diff --git a/board/arm/fvp-ebbr/patches/optee-os/0001-plat-vexpress-redirect-console-to-uart0.patch b/board/arm/fvp-ebbr/patches/optee-os/0001-plat-vexpress-redirect-console-to-uart0.patch
new file mode 100644
index 0000000000..aa61594088
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/optee-os/0001-plat-vexpress-redirect-console-to-uart0.patch
@@ -0,0 +1,34 @@
+From 1debd0c8bd46255f8c22b128ec16586ef9154869 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
+Date: Tue, 2 Dec 2025 15:53:23 +0100
+Subject: [PATCH] plat-vexpress: redirect console to uart0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For consistency with TF-A, U-Boot and Linux.
+
+Upstream: Not applicable. Buildroot specific.
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ core/arch/arm/plat-vexpress/platform_config.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/core/arch/arm/plat-vexpress/platform_config.h b/core/arch/arm/plat-vexpress/platform_config.h
+index 9231f3048..76c7fdb36 100644
+--- a/core/arch/arm/plat-vexpress/platform_config.h
++++ b/core/arch/arm/plat-vexpress/platform_config.h
+@@ -23,8 +23,8 @@
+ 
+ #define IT_UART1		38
+ 
+-#define CONSOLE_UART_BASE	UART1_BASE
+-#define IT_CONSOLE_UART		IT_UART1
++#define CONSOLE_UART_BASE	UART0_BASE
++#undef IT_CONSOLE_UART
+ 
+ #elif defined(PLATFORM_FLAVOR_juno)
+ 
+-- 
+2.51.0
+
diff --git a/board/arm/fvp-ebbr/patches/optee-os/optee-os.hash b/board/arm/fvp-ebbr/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..80b30de9ea
--- /dev/null
+++ b/board/arm/fvp-ebbr/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5222cd553f5edb69ae4ec7cb99b2bfec2c47a47c0be1865b49744701918e8b4d  optee-os-4.8.0.tar.gz
diff --git a/board/arm/fvp-ebbr/patches/uboot/uboot.hash b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
index fe9b4f53dc..98a5c53aaf 100644
--- a/board/arm/fvp-ebbr/patches/uboot/uboot.hash
+++ b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/board/arm/fvp-ebbr/readme.txt b/board/arm/fvp-ebbr/readme.txt
index fe7d4de5c5..6edfed20df 100644
--- a/board/arm/fvp-ebbr/readme.txt
+++ b/board/arm/fvp-ebbr/readme.txt
@@ -2,7 +2,7 @@ Introduction
 ============
 
 The arm_fvp_ebbr_defconfig is meant to illustrate some aspects of the Arm EBBR
-specification[1] and the Arm SystemReady IR[2] compliance program.
+specification[1] and the Arm SystemReady Devicetree band[2].
 It allows building an AArch64 U-Boot based firmware implementing the subset of
 UEFI defined by EBBR, as well as a Linux OS disk image booting with UEFI, to run
 on the Arm A-Profile Base RevC AEM FVP.
@@ -26,8 +26,8 @@ Running on the FVP
 Download the FVP from one of the following sources, corresponding to your host
 computer:
 
-- https://developer.arm.com/-/cdn-downloads/permalink/Fixed-Virtual-Platforms/FM-11.27/FVP_Base_RevC-2xAEMvA_11.27_19_Linux64.tgz
-- https://developer.arm.com/-/cdn-downloads/permalink/Fixed-Virtual-Platforms/FM-11.27/FVP_Base_RevC-2xAEMvA_11.27_19_Linux64_armv8l.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.30/FVP_Base_RevC-2xAEMvA_11.30_27_Linux64.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/FVPs-Architecture/FM-11.30/FVP_Base_RevC-2xAEMvA_11.30_27_Linux64_armv8l.tgz
 
 The FVP will be located under one of the corresponding folders:
 
@@ -53,21 +53,58 @@ supporting the EBBR specification.
 To run another OS on simulation using a live or pre-installed image, use the
 same FVP command line as for the generated OS but adapt the OS image path in the
 virtioblockdevice stanza.
-The image generated by the aarch64_efi_defconfig or the Arm ACS-IR images[3] are
-examples of pre-installed OS images.
-Linux distributions such as Debian, Fedora, openSUSE or Ubuntu provide a
-pre-installed OS image.
+The image generated by the aarch64_efi_defconfig or the Arm ACS Devicetree
+images[3] are examples of pre-installed OS images.
+Linux distributions such as Debian, Fedora, openSUSE or Ubuntu, or FreeBSD
+provide live or pre-installed OS image.
+
+Firmware details
+================
+
+Noteworthy firmware features:
+
+- TF-A, OP-TEE & U-Boot
+- UEFI, with EFI variables stored on disk in the ESP
+- Support for ethernet, RTC and LCD
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
+       |                   TF-A                 |  EL3
+       +----------------------------------------+
+
+Boot flow:
+
+  TF-A -+-> OP-TEE
+        `-> U-Boot -> GRUB -> Linux -> Busybox
+
+TF-A BL1 loads the fit image with the remaining pieces of TF-A, OP-TEE and
+U-Boot.
+OP-TEE boots, calls back TF-A to go to normal world.
+U-Boot loads GRUB with UEFI, boots Linux at EL2.
+
+In this configuration, the Devicetree is static and fully contained in TF-A.
 
 Miscellaneous
 =============
 
 This configuration is inspired by the arm_foundationv8_defconfig, the
-qemu_aarch64_virt_defconfig and the Arm SystemReady IR IoT Integration, Test,
-and Certification Guide[4].
+qemu_aarch64_virt_defconfig and the Arm SystemReady Devicetree Band Integration
+and Testing Guide[4].
 
-Firmware update, MMC and network are currently not supported.
+Firmware update, GOP, MMC and RNG are currently not supported.
 
-[1]: https://github.com/ARM-software/ebbr
-[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
-[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
-[4]: https://developer.arm.com/documentation/DUI1101/latest/
+[1] https://github.com/ARM-software/ebbr
+[2] https://www.arm.com/architecture/system-architectures/systemready-compliance-program/systemready-devicetree-band
+[3] https://github.com/ARM-software/arm-systemready/tree/main/SystemReady-devicetree-band/prebuilt_images
+[4] https://developer.arm.com/documentation/DUI1101/latest/
diff --git a/board/arm/fvp-ebbr/u-boot.fragment b/board/arm/fvp-ebbr/u-boot.fragment
index abbf8395be..37d98bcdf0 100644
--- a/board/arm/fvp-ebbr/u-boot.fragment
+++ b/board/arm/fvp-ebbr/u-boot.fragment
@@ -1,4 +1,4 @@
-# CONFIG_USE_BOOTCOMMAND is not set
+CONFIG_ARM_SMCCC_FEATURES=y
 CONFIG_BOOTCOMMAND="bootflow scan -lb"
 CONFIG_BOOTMETH_DISTRO=y
 CONFIG_BOOTM_EFI=y
@@ -17,8 +17,10 @@ CONFIG_CMD_EFI_VARIABLE_FILE_STORE=y
 CONFIG_CMD_GETTIME=y
 CONFIG_CMD_GPT=y
 CONFIG_CMD_NVEDIT_EFI=y
+CONFIG_CMD_POWEROFF=y
 CONFIG_CMD_RNG=y
 CONFIG_CMD_RTC=y
+CONFIG_CMD_SMC=y
 CONFIG_CMD_TIME=y
 CONFIG_DM_RNG=y
 CONFIG_DM_RTC=y
@@ -29,6 +31,7 @@ CONFIG_EFI_LOADER=y
 CONFIG_EFI_LOADER_HII=y
 CONFIG_EFI_MM_COMM_TEE=y
 CONFIG_EFI_PARTITION=y
+CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=y
 CONFIG_EFI_SECURE_BOOT=y
 CONFIG_EFI_SET_TIME=y
 CONFIG_EFI_UNICODE_CAPITALIZATION=y
diff --git a/configs/arm_fvp_ebbr_defconfig b/configs/arm_fvp_ebbr_defconfig
index 5aa1727889..665f59c130 100644
--- a/configs/arm_fvp_ebbr_defconfig
+++ b/configs/arm_fvp_ebbr_defconfig
@@ -1,12 +1,16 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/arm/fvp-ebbr/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arm/fvp-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/arm/fvp-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
@@ -17,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.14.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="fvp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/arm/fvp-ebbr/fvp-ebbr.dts"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
@@ -26,17 +30,21 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="ARM_TSP_RAM_LOCATION=tdram FVP_DT_PREFIX=fvp-ebbr"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot efi_gop efifwsetup efinet efitextmode ext2 fat halt help linux lsefi lsefimmap lsefisystab minicmd normal part_gpt part_msdos reboot squash4"
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.8.0"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-fvp"
-BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_ARM_GICV3=y"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_ARM_GICV3=y CFG_TEE_CORE_LOG_LEVEL=2 CFG_TEE_TA_LOG_LEVEL=2"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vexpress_fvp"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/arm/fvp-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y

--===============8939597937495781584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8939597937495781584==--
