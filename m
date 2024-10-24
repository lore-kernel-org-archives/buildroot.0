Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757DBD10376
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2877160C2B;
	Thu, 24 Oct 2024 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9zrWPr2HJQ-v; Thu, 24 Oct 2024 21:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9FC060B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FC060B14;
	Thu, 24 Oct 2024 21:07:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A8512316
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B02440151
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbhgy4X5HVML for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D269B4012A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D269B4012A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9B5883730; Thu, 24 Oct 2024 21:07:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 23:06:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcd0e6f4c208b1697dd783add6ed5a02181de5d2
X-Git-Newrev: d37bad00401a6565553d5243129860eab4c69874
X-Patchwork-Hint: ignore
Message-Id: <20241024210710.C9B5883730@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/arm_fvp_ebbr: bump Linux, U-Boot,
 TF-A and FVP
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1981246317497555340=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1981246317497555340==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d37bad00401a6565553d5243129860eab4c69874
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump Linux kernel to 6.10.12 and add the dependency on host-python3.
- Bump U-Boot to 2024.07.
- Bump TF-A to v2.11. Remove the stdout patch, which is present
  upstream. Remove our hash file now that the arm-trusted-firmware
  package centralises those.
- Bump FVP to 11.27.19 in the documentation.
- Convert to `make savedefconfig' format.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-feat-fvp-add-stdout-path.patch            | 45 ----------------------
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 -
 board/arm/fvp-ebbr/patches/linux/linux.hash        |  4 +-
 board/arm/fvp-ebbr/patches/uboot/uboot.hash        |  2 +-
 board/arm/fvp-ebbr/readme.txt                      |  4 +-
 configs/arm_fvp_ebbr_defconfig                     |  9 +++--
 6 files changed, 10 insertions(+), 56 deletions(-)

diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch
deleted file mode 100644
index 0a04c02240..0000000000
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/0001-feat-fvp-add-stdout-path.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8c30a0c7fe0162de0618b26fb34cc91ea582e5f7 Mon Sep 17 00:00:00 2001
-From: Debbie Martin <Debbie.Martin@arm.com>
-Date: Wed, 27 Sep 2023 18:05:26 +0100
-Subject: [PATCH] feat(fvp): add stdout-path
-
-Add stdout-path to the fvp-base devicetree to be passed to BL33 (U-Boot)
-and then to the Linux kernel to be compliant to Arm SystemReady IR:
-https://developer.arm.com/documentation/DUI1101/2-0/
-Configure-U-Boot-for-SystemReady/Adapt-the-Devicetree
-
-This has been tested by booting fvp-base to Linux and ensuring the
-console is accessible.
-
-Change-Id: Iae98630f18f735ce344c1158f41f358c2a49eeb6
-Signed-off-by: Diego Sueiro <Diego.Sueiro@arm.com>
-Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
-Upstream: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/+/8c30a0c7fe0162de0618b26fb34cc91ea582e5f7%5E!/
-Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
----
- fdts/fvp-base-psci-common.dtsi | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/fdts/fvp-base-psci-common.dtsi b/fdts/fvp-base-psci-common.dtsi
-index 79cf37d3b0..ff31ba7616 100644
---- a/fdts/fvp-base-psci-common.dtsi
-+++ b/fdts/fvp-base-psci-common.dtsi
-@@ -27,11 +27,12 @@
- 	#address-cells = <2>;
- 	#size-cells = <2>;
- 
-+	chosen {
-+		stdout-path = "serial0:115200n8";
- #if (ENABLE_RME == 1)
--	chosen { bootargs = "console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda ip=on";};
--#else
--	chosen {};
-+		bootargs = "console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda ip=on";
- #endif
-+	};
- 
- 	aliases {
- 		serial0 = &v2m_serial0;
--- 
-2.43.0
-
diff --git a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 6f02bfbb22..0000000000
--- a/board/arm/fvp-ebbr/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/arm/fvp-ebbr/patches/linux/linux.hash b/board/arm/fvp-ebbr/patches/linux/linux.hash
index 04e69e882a..20941a269b 100644
--- a/board/arm/fvp-ebbr/patches/linux/linux.hash
+++ b/board/arm/fvp-ebbr/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  b78dcd09f6b725872a2c0c87a70a064b0fbbcccfe5ce60aa46c669934a9e28b6  linux-6.8.11.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  524858852f5869a9ef17de8b1e6e7faf05bcb2c462bc96b3c24dbf82ede373cf  linux-6.10.12.tar.xz
diff --git a/board/arm/fvp-ebbr/patches/uboot/uboot.hash b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
index 9f554d5c68..fe9b4f53dc 100644
--- a/board/arm/fvp-ebbr/patches/uboot/uboot.hash
+++ b/board/arm/fvp-ebbr/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  077cf8ca283411103ad274a3724dacb5068ede824de749beff9c9e5b531b43ea  u-boot-2024.07-rc3.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/arm/fvp-ebbr/readme.txt b/board/arm/fvp-ebbr/readme.txt
index 8115bfbdfb..fe7d4de5c5 100644
--- a/board/arm/fvp-ebbr/readme.txt
+++ b/board/arm/fvp-ebbr/readme.txt
@@ -26,8 +26,8 @@ Running on the FVP
 Download the FVP from one of the following sources, corresponding to your host
 computer:
 
-- https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/FVP_Base_RevC-2xAEMvA_11.25_15_Linux64.tgz
-- https://developer.arm.com/-/media/Files/downloads/ecosystem-models/FM_11_25/FVP_Base_RevC-2xAEMvA_11.25_15_Linux64_armv8l.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/Fixed-Virtual-Platforms/FM-11.27/FVP_Base_RevC-2xAEMvA_11.27_19_Linux64.tgz
+- https://developer.arm.com/-/cdn-downloads/permalink/Fixed-Virtual-Platforms/FM-11.27/FVP_Base_RevC-2xAEMvA_11.27_19_Linux64_armv8l.tgz
 
 The FVP will be located under one of the corresponding folders:
 
diff --git a/configs/arm_fvp_ebbr_defconfig b/configs/arm_fvp_ebbr_defconfig
index 9191676a28..5aa1727889 100644
--- a/configs/arm_fvp_ebbr_defconfig
+++ b/configs/arm_fvp_ebbr_defconfig
@@ -1,14 +1,15 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/arm/fvp-ebbr/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arm/fvp-ebbr/post-image.sh support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/arm/fvp-ebbr/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.12"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_OPTEE_CLIENT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -16,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="fvp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_DTS_PATH="board/arm/fvp-ebbr/fvp-ebbr.dts"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
@@ -32,7 +33,7 @@ BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_ARM_GICV3=y"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07-rc3"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vexpress_fvp"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/arm/fvp-ebbr/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

--===============1981246317497555340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1981246317497555340==--
