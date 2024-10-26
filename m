Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4A5D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0ADA605E3;
	Sat, 26 Oct 2024 14:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNS5UDHH0BPO; Sat, 26 Oct 2024 14:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB4BD60617
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB4BD60617;
	Sat, 26 Oct 2024 14:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25FBB5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070B481EFD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iAG6cW76z-G for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B01A81EFF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B01A81EFF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 149BF83CD3; Sat, 26 Oct 2024 14:48:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:46:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0344e5dae647c5cc23eea11fcbeddd7fec776d75
X-Git-Newrev: 7cbc240ac2c3a5d7cbbec9826fb99854bdd156a7
X-Patchwork-Hint: ignore
Message-Id: <20241026144835.149BF83CD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1028ardb: update to Linux 6.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7cbc240ac2c3a5d7cbbec9826fb99854bdd156a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update Linux, U-Boot, and TF-A to the latest versions used by NXP's
Yocto project.

Drop the patches from board/freescale/common as the TF-A patches are
upstream.

Switch the Linux defconfig to the default ARM64 defconfig, as is done by
the NXP Yocto build.

The updated Linux kernel increases the rootfs size to 122MB so we bump
the rootfs size slightly to match.

See: https://github.com/nxp-qoriq/yocto-sdk/tree/scarthgap

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash |  2 +-
 board/freescale/ls1028ardb/patches/linux/linux.hash        |  2 +-
 board/freescale/ls1028ardb/patches/uboot/uboot.hash        |  2 +-
 board/freescale/ls1028ardb/readme.txt                      |  6 +++---
 configs/ls1028ardb_defconfig                               | 14 +++++++-------
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 17c409530d..f9af28ab3c 100644
--- a/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1028ardb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0dda154c335e1a50c727601e698b6a0827e3f92308873b373449fb888df5acfd  atf-LSDK-21.08.tar.gz
+sha256  4f4dc78bfb5b7391a65ae0f83856661071f666ac2bf6a9380fddbe376a8bdaaa  atf-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/linux/linux.hash b/board/freescale/ls1028ardb/patches/linux/linux.hash
index bd5e29d026..e038c22862 100644
--- a/board/freescale/ls1028ardb/patches/linux/linux.hash
+++ b/board/freescale/ls1028ardb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6db58cf91b98f7fc279f341279a5d43d4069fb56a660a34209aba6af53ea2b57  linux-LSDK-21.08.tar.gz
+sha256  6d592722e004516309f8ce33e654f1322e4d1f0f33567acb86ca19229176fd9e  linux-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/patches/uboot/uboot.hash b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
index d0cc110fdd..a5ccd82b2b 100644
--- a/board/freescale/ls1028ardb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1028ardb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6279c161ad8a218b549e6631be969b74f358cf01a20103953ccaf3bb14185ac2  u-boot-LSDK-21.08.tar.gz
+sha256  a2bcd7a34d4908ffbadfea731d0f0fd20f19a31cff6ff6310980e7f6743ceb24  u-boot-lf-6.6.23-2.0.0.tar.gz
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index cfd1c8c490..af6af65757 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -13,10 +13,10 @@ for the software NXP LSDK (Layerscape Software Development Kit), see
 
 the components from NXP are:
   - rcw, LSDK 21.08
-  - atf (fork), LSDK 21.08
-  - uboot (fork), LSDK 21.08
+  - atf (fork), lf-6.6.23-2.0.0
+  - uboot (fork), lf-6.6.23-2.0.0
   - cadence-dp-firmware (blob), LSDK 20.12
-  - linux (fork), LSDK 21.08
+  - linux (fork), lf-6.6.23-2.0.0
 
 Build
 =====
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 3a4e7287b8..0d1843bf5f 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
-BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches board/freescale/common/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/ls1028ardb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
@@ -12,8 +12,8 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,LSDK-21.08)/linux-LSDK-21.08.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.6.23-2.0.0)/linux-lf-6.6.23-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
@@ -21,11 +21,11 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,LSDK-21.08)/atf-LSDK-21.08.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.6.23-2.0.0)/atf-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -35,7 +35,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,LSDK-21.08)/u-boot-LSDK-21.08.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.6.23-2.0.0)/u-boot-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
