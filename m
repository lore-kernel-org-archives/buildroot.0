Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C952C001DE
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B1E4022B;
	Mon,  7 Aug 2023 22:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B1E4022B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OcuZWsUYtRx; Mon,  7 Aug 2023 22:07:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153F24038C;
	Mon,  7 Aug 2023 22:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153F24038C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7899F1BF28E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8C37401BE
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8C37401BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5wDxnvpeRji for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:07:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4510E401F0
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4510E401F0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 333C984754; Mon,  7 Aug 2023 22:07:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 00:07:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b831bac16a2a61caf1d738e9dbfa9f89797f2296
X-Git-Newrev: 5582d4b5ebc57e6ecf71193ca62bc69e8038aad2
X-Patchwork-Hint: ignore
Message-Id: <20230807220741.333C984754@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/versal_vck190_defconfig: bump to xilinx-v2023.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5582d4b5ebc57e6ecf71193ca62bc69e8038aad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps the versal_vck190_defconfig to xilinx-v2023.1 which includes
the following updates:

- Linux v6.1.5
- U-Boot v2023.01
- TF-A v2.8 (including mainline patches)
- PLM xilinx_v2023.1
- PSMFW xilinx_v2023.1
- versal-firmware uses new github.com/Xilinx/soc-prebuilt-firmware repo

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eat-build-add-support-for-new-binutils-versions.patch |  2 +-
 .../0002-build-tools-avoid-unnecessary-link.patch        |  1 +
 board/versal/post-build.sh                               |  2 +-
 board/versal/post-image.sh                               |  7 +++----
 board/versal/uboot.fragment                              |  1 -
 configs/versal_vck190_defconfig                          | 16 ++++++++--------
 package/versal-firmware/Config.in                        |  4 ++--
 package/versal-firmware/versal-firmware.mk               |  8 ++++----
 8 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
index 695cc80b94..8ad996914b 120000
--- a/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
+++ b/board/versal/patches/arm-trusted-firmware/0001-feat-build-add-support-for-new-binutils-versions.patch
@@ -1 +1 @@
-../../../../boot/arm-trusted-firmware/v2.6/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
+../../../../boot/arm-trusted-firmware/v2.8/0001-feat-build-add-support-for-new-binutils-versions.patch
\ No newline at end of file
diff --git a/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
new file mode 120000
index 0000000000..fecdee5449
--- /dev/null
+++ b/board/versal/patches/arm-trusted-firmware/0002-build-tools-avoid-unnecessary-link.patch
@@ -0,0 +1 @@
+../../../../boot/arm-trusted-firmware/v2.8/0002-build-tools-avoid-unnecessary-link.patch
\ No newline at end of file
diff --git a/board/versal/post-build.sh b/board/versal/post-build.sh
index ed08ea2d49..faa75a0de3 100755
--- a/board/versal/post-build.sh
+++ b/board/versal/post-build.sh
@@ -11,5 +11,5 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/extlinux.conf"
 	label linux
 	  kernel /Image
 	  devicetree /system.dtb
-	  append console=${CONSOLE} clk_ignore_unused root=/dev/${ROOT} rw rootwait
+	  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
 	__HEADER_EOF
diff --git a/board/versal/post-image.sh b/board/versal/post-image.sh
index 1d9802c34d..22367d5028 100755
--- a/board/versal/post-image.sh
+++ b/board/versal/post-image.sh
@@ -11,16 +11,15 @@ FIRST_DT=$(sed -nr \
 [ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
 
 BOARD_DIR="$(dirname "$0")"
-BOARD_NAME="$4"
 
 mkdir -p "${BINARIES_DIR}"
 cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	the_ROM_image:
 	{
 	  image {
-	    { type=bootimage, file=${BINARIES_DIR}/${BOARD_NAME}_vpl_gen_fixed.pdi }
-	    { type=bootloader, file=${BINARIES_DIR}/${BOARD_NAME}_plm.elf }
-	    { core=psm, file=${BINARIES_DIR}/${BOARD_NAME}_psmfw.elf }
+	    { type=bootimage, file=${BINARIES_DIR}/vpl_gen_fixed.pdi }
+	    { type=bootloader, file=${BINARIES_DIR}/plm.elf }
+	    { core=psm, file=${BINARIES_DIR}/psmfw.elf }
 	  }
 	  image {
 	    id = 0x1c000000, name=apu_subsystem
diff --git a/board/versal/uboot.fragment b/board/versal/uboot.fragment
deleted file mode 100644
index 6f71907379..0000000000
--- a/board/versal/uboot.fragment
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_OF_SEPARATE=y
diff --git a/configs/versal_vck190_defconfig b/configs/versal_vck190_defconfig
index fab41a2991..e30bb35b74 100644
--- a/configs/versal_vck190_defconfig
+++ b/configs/versal_vck190_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/versal/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/versal/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2 vck190"
+BR2_ROOTFS_POST_SCRIPT_ARGS="ttyAMA0,115200 mmcblk0p2"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v5.15_LTS_2022.2)/xlnx_rebase_v5.15_LTS_2022.2.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="xilinx_versal"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,linux-xlnx,xlnx_rebase_v6.1_LTS_2023.1)/xlnx_rebase_v6.1_LTS_2023.1.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/versal-vck190-rev1.1"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.6_2022.2)/xlnx_rebase_v2.6_2022.2.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,arm-trusted-firmware,xlnx_rebase_v2.8_2023.1)/xlnx_rebase_v2.8_2023.1.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -24,16 +24,16 @@ BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2022.01_2022.2)/xlnx_rebase_v2022.01_2022.2.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,u-boot-xlnx,xlnx_rebase_v2023.01_2023.1)/xlnx_rebase_v2023.01_2023.1.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_versal_virt"
-BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/versal/uboot.fragment"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=versal-vck190-rev1.1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_REMAKE_ELF=y
 BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_VERSAL_FIRMWARE=y
-BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="2022.2_br_1"
+BR2_PACKAGE_VERSAL_FIRMWARE_VERSION="xilinx_v2023.1"
 BR2_PACKAGE_VERSAL_FIRMWARE_BOARD="vck190"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
index b4b63282d8..01daefd204 100644
--- a/package/versal-firmware/Config.in
+++ b/package/versal-firmware/Config.in
@@ -4,13 +4,13 @@ config BR2_PACKAGE_VERSAL_FIRMWARE
 	help
 	  Pre-built firmware files for Xilinx Versal boards.
 
-	  https://github.com/nealfrager/buildroot-firmware
+	  https://github.com/Xilinx/soc-prebuilt-firmware
 
 if BR2_PACKAGE_VERSAL_FIRMWARE
 
 config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
 	string "firmware version"
-	default "2022.2_br_1"
+	default "xilinx_v2023.1"
 	help
 	  Release version of Versal firmware.
 
diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
index 0bc5a00bc6..1ced259be1 100644
--- a/package/versal-firmware/versal-firmware.mk
+++ b/package/versal-firmware/versal-firmware.mk
@@ -5,16 +5,16 @@
 ################################################################################
 
 VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_SITE = $(call github,Xilinx,ubuntu-firmware,$(VERSAL_FIRMWARE_VERSION))
-VERSAL_FIRMWARE_LICENSE = Xilinx-Binary-Only
+VERSAL_FIRMWARE_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(VERSAL_FIRMWARE_VERSION))
+VERSAL_FIRMWARE_LICENSE = MIT
 VERSAL_FIRMWARE_LICENSE_FILES = LICENSE
 VERSAL_FIRMWARE_INSTALL_TARGET = NO
 VERSAL_FIRMWARE_INSTALL_IMAGES = YES
 
 define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(foreach f,plm.elf psmfw.elf vpl_gen_fixed.pdi,\
-		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f) \
-			$(BINARIES_DIR)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)_$(f)
+		$(INSTALL) -D -m 0755 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)-versal/$(f) \
+			$(BINARIES_DIR)/$(f)
 	)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
