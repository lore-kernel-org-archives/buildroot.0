Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B9BCF45BF
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 17:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D375660B99;
	Mon, 12 Jan 2026 17:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K04g1I8t3abs; Mon, 12 Jan 2026 17:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83BE060638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768240671;
	bh=uxSjsKWGD9rSgTK7N6W6fWtb9xJN2HF8BuC4md18G84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tDNKwKZFO0GQqDK2CxuVDji+6ah1qq87CP5tKMl2Fw03dMvswkdpsDHVvgg9ZZDC+
	 7ss1QCSjG0i+2TOwU4r7PvIngBUxTGG90hxpRZwf+taEWNX/xMlZ6Us4FhQ422r3cz
	 mY8AVtTZytKYhyb/bL4wyMPngII5GJGhFo8HckSzGjLF6i6YaExROKSKS6hEMEQHa4
	 yeIWLUe6eP2CyDRlIZI4Tx9pzd8gfybAlMalAZnkEMZMKaQc3Xgif4a28xr9maXo4u
	 +tAJPYqlIY/YKmnzgk9uhpQB1eUuRPonaPr0cJvy6FSpL3guL7EeMNwL2Q42QBgqE1
	 9rmPxWqpjiqGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83BE060638;
	Mon, 12 Jan 2026 17:57:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D767818D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9F8D40DC1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNcLSGzVftZX for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 17:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0021E40DC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0021E40DC0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 17:57:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E40B38852B; Mon, 12 Jan 2026 17:57:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 18:56:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a37c958238c0e81b0fbeb9322a443e089c26a682
X-Git-Newrev: ae4b42ba6429fa768d5f4b6633aaa3066f5bcf3e
X-Patchwork-Hint: ignore
Message-Id: <20260112175748.E40B38852B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rockpro64_ebbr: update components
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
Content-Type: multipart/mixed; boundary="===============0594674728053924636=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0594674728053924636==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ae4b42ba6429fa768d5f4b6633aaa3066f5bcf3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit:
- updates the Kernel from 6.12.18 to 6.18.4
- updates arm-trusted-firmware from v2.12 to v2.14
- updates optee-os and clients from 4.5.0 to 4.8.0
- updates U-Boot from 2025.01 to 2026.01
- switches to Bootlin external glibc stable toolchain
- removes hash for linux-headers (no longer needed)

Those changes aligns components version of this defconfig
with rockpro64_defconfig.

Tested on board Rockpro64_V2.1 2018-07-02.

Cc: Vincent Stehlé <vincent.stehle@arm.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash   |  2 +-
 .../rockpro64-ebbr/patches/linux-headers/linux-headers.hash  |  1 -
 board/pine64/rockpro64-ebbr/patches/linux/linux.hash         |  2 +-
 .../rockpro64-ebbr/patches/optee-client/optee-client.hash    |  2 +-
 board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash   |  2 +-
 board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash         |  2 +-
 configs/rockpro64_ebbr_defconfig                             | 12 +++++++-----
 7 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index b5898cba3f..0bf70b5542 100644
--- a/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/pine64/rockpro64-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
+sha256  6fd749e53c455aec3418288630544e7552bbffab4442ddc48b20ebef9aee87ff  arm-trusted-firmware-v2.14-git4.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash b/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/pine64/rockpro64-ebbr/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/pine64/rockpro64-ebbr/patches/linux/linux.hash b/board/pine64/rockpro64-ebbr/patches/linux/linux.hash
index 7635b8ccb3..5810d3d580 100644
--- a/board/pine64/rockpro64-ebbr/patches/linux/linux.hash
+++ b/board/pine64/rockpro64-ebbr/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
+sha256  f850139ca5f79c1bf6bb8b32f92e212aadca97bdaef8a83a7cf4ac4d6a525fab  linux-6.18.4.tar.xz
diff --git a/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash b/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash
index e1f486e7a5..6c61615dbe 100644
--- a/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash
+++ b/board/pine64/rockpro64-ebbr/patches/optee-client/optee-client.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ac6dc2c0c253ea228ea230e537211a45475771050faf4e66fe64321de3a0a652  optee-client-4.5.0.tar.gz
+sha256  464b3bf5bc4a61830357dbf81a0e5b89414d3bca1c2a752570cb0e40d2f1e637  optee-client-4.8.0.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash b/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash
index 3e981c142d..80b30de9ea 100644
--- a/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash
+++ b/board/pine64/rockpro64-ebbr/patches/optee-os/optee-os.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  43c389f0505e8bc21d6fbaa8ea83ec67d1746ed14a537e3f505cd0e5b4cc2db9  optee-os-4.5.0.tar.gz
+sha256  5222cd553f5edb69ae4ec7cb99b2bfec2c47a47c0be1865b49744701918e8b4d  optee-os-4.8.0.tar.gz
diff --git a/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash b/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash
index 50674352d7..b6a925ea4e 100644
--- a/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash
+++ b/board/pine64/rockpro64-ebbr/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/rockpro64_ebbr_defconfig b/configs/rockpro64_ebbr_defconfig
index 4d94d61d1f..0a8fc46e58 100644
--- a/configs/rockpro64_ebbr_defconfig
+++ b/configs/rockpro64_ebbr_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/pine64/rockpro64-ebbr/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -9,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pine64/rockpro64-ebbr/post-image.sh support/
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64-ebbr/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -22,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.14"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
@@ -31,7 +33,7 @@ BR2_TARGET_GRUB2=y
 BR2_TARGET_GRUB2_BUILTIN_MODULES_EFI="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop lsefisystab lsefimmap lsefi efifwsetup efitextmode efinet"
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_CUSTOM_VERSION=y
-BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.5.0"
+BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE="4.8.0"
 BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
 BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
 BR2_TARGET_OPTEE_OS_PLATFORM="rockchip-rk3399"
@@ -39,7 +41,7 @@ BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_LOG_LEVEL=2 CFG_DT=y CFG_
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/pine64/rockpro64-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y

--===============0594674728053924636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0594674728053924636==--
