Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0509CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B6F9846C6;
	Thu, 21 Aug 2025 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7WdavX3xpSA; Thu, 21 Aug 2025 21:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC298468B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC298468B;
	Thu, 21 Aug 2025 21:11:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0058E1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE148464A
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRJ0k1bcY5F6 for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 21:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C461C84591
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C461C84591
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 21:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE4D58781C; Thu, 21 Aug 2025 21:11:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 23:11:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 070d91ed04a2a3c462dbd5ad1878ce47c2433986
X-Git-Newrev: a80b13fc633dc593e1015de4ab4a8e6822185e15
X-Patchwork-Hint: ignore
Message-Id: <20250821211139.BE4D58781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_pitx_imx8m: remove
 defconfig, broken
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
Content-Type: multipart/mixed; boundary="===============8728351631108039381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8728351631108039381==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a80b13fc633dc593e1015de4ab4a8e6822185e15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273666

It has been broken for over 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dkontron_pitx_imx8m&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-By: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  3 -
 DEVELOPERS                                         |  2 -
 board/kontron/pitx-imx8m/extlinux.conf             |  4 --
 board/kontron/pitx-imx8m/genimage.cfg              | 17 -----
 ...capsule-use-pkg-config-to-get-luuid-and-l.patch | 33 ----------
 board/kontron/pitx-imx8m/post-build.sh             |  7 --
 board/kontron/pitx-imx8m/readme.txt                | 74 ----------------------
 configs/kontron_pitx_imx8m_defconfig               | 45 -------------
 8 files changed, 185 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b9a9def55a..d5f5c5f751 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -35,8 +35,6 @@ board/intel/galileo/patches/linux/0001-x86-relocs-Make-per_cpu_load_addr-static.
 board/intel/galileo/post-build.sh Shellcheck
 board/intel/galileo/rootfs_overlay/etc/init.d/S09modload Shellcheck lib_sysv.Variables
 board/kontron/bl-imx8mm/post-build.sh Shellcheck
-board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch lib_patch.NumberedSubject lib_patch.Upstream
-board/kontron/pitx-imx8m/post-build.sh Shellcheck
 board/kontron/smarc-sal28/post-build.sh Shellcheck
 board/lego/ev3/post-image.sh Shellcheck
 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch lib_patch.Upstream
@@ -159,7 +157,6 @@ configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
-configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 3efad36d70..8915eb6738 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1408,10 +1408,8 @@ F:	package/volk/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	board/kontron/bl-imx8mm/
 F:	board/kontron/smarc-sal28/
-F:	board/kontron/pitx-imx8m/
 F:	configs/kontron_bl_imx8mm_defconfig
 F:	configs/kontron_smarc_sal28_defconfig
-F:	configs/kontron_pitx_imx8m_defconfig
 F:	package/altera-stapl/
 F:	package/blake3/
 F:	package/ipmitool/
diff --git a/board/kontron/pitx-imx8m/extlinux.conf b/board/kontron/pitx-imx8m/extlinux.conf
deleted file mode 100644
index 2911acec59..0000000000
--- a/board/kontron/pitx-imx8m/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label buildroot
-  kernel /boot/Image
-  devicetree /boot/freescale/imx8mq-kontron-pitx-imx8m.dtb
-  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
deleted file mode 100644
index bc100b171d..0000000000
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ /dev/null
@@ -1,17 +0,0 @@
-image sdcard.img {
-	hdimage {
-		partition-table-type = "gpt"
-	}
-
-	partition imx-boot {
-		in-partition-table = "no"
-		image = "flash.bin"
-		offset = 33K
-	}
-
-	partition rootfs {
-		offset = 8M
-		image = "rootfs.ext4"
-		partition-uuid = %PARTUUID%
-	}
-}
diff --git a/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch b/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
deleted file mode 100644
index 9530a45efe..0000000000
--- a/board/kontron/pitx-imx8m/patches/uboot/2022.04/0001-tools-mkeficapsule-use-pkg-config-to-get-luuid-and-l.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From f3523977e8f5f6b2173708777001332431ebc609 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Tue, 19 Jul 2022 16:17:09 +0200
-Subject: [PATCH 1/2] tools: mkeficapsule: use pkg-config to get -luuid and -lgnutls
-
-Instead of hardcoding -luuid -lgnutls as the flags needed to build
-mkeficapsule, use pkg-config when available.
-
-We gracefully fallback on the previous behavior of hardcoding -luuid
--lgnutls if pkg-config is not available or fails with an error.
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- tools/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/Makefile b/tools/Makefile
-index 9f2339666a..9f6b282ad8 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -242,7 +242,8 @@ hostprogs-$(CONFIG_MIPS) += mips-relocs
- hostprogs-$(CONFIG_ASN1_COMPILER)	+= asn1_compiler
- HOSTCFLAGS_asn1_compiler.o = -idirafter $(srctree)/include
- 
--HOSTLDLIBS_mkeficapsule += -lgnutls -luuid
-+HOSTLDLIBS_mkeficapsule += \
-+	$(shell pkg-config --libs gnutls uuid 2> /dev/null || echo "-lgnutls -luuid")
- hostprogs-$(CONFIG_TOOLS_MKEFICAPSULE) += mkeficapsule
- 
- # We build some files with extra pedantic flags to try to minimize things
--- 
-2.30.2
-
diff --git a/board/kontron/pitx-imx8m/post-build.sh b/board/kontron/pitx-imx8m/post-build.sh
deleted file mode 100755
index bf8861f6a9..0000000000
--- a/board/kontron/pitx-imx8m/post-build.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-PARTUUID="$($HOST_DIR/bin/uuidgen)"
-
-install -d "$TARGET_DIR/boot/extlinux/"
-sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
-sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/kontron/pitx-imx8m/readme.txt b/board/kontron/pitx-imx8m/readme.txt
deleted file mode 100644
index 7c85dd4377..0000000000
--- a/board/kontron/pitx-imx8m/readme.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Kontron pitx-imx8m
-==================
-
-https://www.kontron.com/produkte/pitx-imx8m/p155258
-
-
-How to build it
-===============
-
-Configure buildroot:
-
-  $ make kontron_pitx_imx8m_defconfig
-
-Change settings to fit your needs (optional):
-
-  $ make menuconfig
-
-Compile everything and buildr the rootfs image:
-
-  $ make
-
-
-Result of the build
-===================
-
-After building, the output/images directory contains:
-
-  output/images/
-    ├── bl31.bin
-    ├── boot.scr
-    ├── ddr_fw.bin
-    ├── Image
-    ├── imx8-boot-sd.bin
-    ├── imx8mq-kontron-pitx-imx8m.dtb
-    ├── lpddr4_pmu_train_fw.bin
-    ├── rootfs.ext2
-    ├── rootfs.ext4 -> rootfs.ext2
-    ├── rootfs.tar
-    ├── sdcard.img
-    ├── signed_hdmi_imx8m.bin
-    ├── u-boot.bin
-    ├── u-boot.itb
-    ├── u-boot-nodtb.bin
-    ├── u-boot-spl.bin
-    └── u-boot-spl-ddr.bin
-
-
-Flashing the SD card image
-==========================
-
-To install the image on a SDCard simply copy sdcard.img to the storage (e.g. SD, eMMC)
-
-  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>
-
-
-Preparing the board
-===================
-
- * Connect a serial line to the board
- * Insert the SD card
- * Make sure the boot source selection DIP switches are set correctly
-  * SW1 1-4 OFF
-  * SW1 2-3 OFF
- * Power-up the board
-
-
-Booting the board
-=================
-
-By default the bootloader will search for the first valid image, starting
-with the internal eMMC. To make sure the bootloader loads bootscript from
-the correct location (SD card) set the boot_targets environment variable:
-
-  $ setenv boot_targets mmc1
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
deleted file mode 100644
index 47d33f11ed..0000000000
--- a/configs/kontron_pitx_imx8m_defconfig
+++ /dev/null
@@ -1,45 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
-BR2_GLOBAL_PATCH_DIR="board/kontron/pitx-imx8m/patches"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/pitx-imx8m/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.17.7"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
-BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_FREESCALE_IMX=y
-BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
-BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_pitx_imx8m"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_IMX_MKIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y

--===============8728351631108039381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8728351631108039381==--
