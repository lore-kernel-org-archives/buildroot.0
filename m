Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7572C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D0764004B;
	Fri, 12 Jul 2024 20:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el6EPkw4A_Tv; Fri, 12 Jul 2024 20:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3292941A36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3292941A36;
	Fri, 12 Jul 2024 20:23:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50A2B1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B16084684
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-uPCYP5DaVd for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA03884665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA03884665
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:23:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF3EB861AF; Fri, 12 Jul 2024 20:23:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ef51ec2cabff9fed9a3acc96d39cb1be456a11a
X-Git-Newrev: 61d04a0a738dd10bb2dd96a2e28ff3fd15e03476
X-Patchwork-Hint: ignore
Message-Id: <20240712202325.CF3EB861AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx8mpico: remove defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=61d04a0a738dd10bb2dd96a2e28ff3fd15e03476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig fail to build since commit dc0f721
"package/gcc: switch to 13.x as default".

This board is no longer listed in the supported platforms in the
latest BSPs from TechNexion:
https://developer.technexion.com/docs/release-notes-yp42-2024q2#supported-platforms-in-this-release

This commit removes this defconfig.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597285

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 DEVELOPERS                                         |  4 -
 ...ld-allow-lower-address-access-with-gcc-12.patch | 62 --------------
 ...ild-add-support-for-new-binutils-versions.patch | 62 --------------
 board/technexion/imx8mpico/readme.txt              | 99 ----------------------
 configs/imx8mpico_defconfig                        | 40 ---------
 6 files changed, 268 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 842b86bbc8..81cabcb308 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -192,7 +192,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
-configs/imx8mpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 1fa425f3ee..d878e86f0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1755,10 +1755,6 @@ F:	package/paho-mqtt-c
 N:	Julien Olivain <ju.o@free.fr>
 F:	board/qemu/riscv64-virt-efi/
 F:	board/spike/
-F:	board/technexion/imx8mmpico/
-F:	board/technexion/imx8mpico/
-F:	configs/imx8mmpico_defconfig
-F:	configs/imx8mpico_defconfig
 F:	configs/qemu_riscv64_virt_efi_defconfig
 F:	configs/spike_riscv32_defconfig
 F:	configs/spike_riscv64_defconfig
diff --git a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
deleted file mode 100644
index 90e808cc8e..0000000000
--- a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 078cbf942c86d77775a26d83fc87ca244de02d4c Mon Sep 17 00:00:00 2001
-From: Govindraj Raja <govindraj.raja@arm.com>
-Date: Fri, 5 May 2023 09:09:36 -0500
-Subject: [PATCH] fix(build): allow lower address access with gcc-12
-
-With gcc-12 any lower address access can trigger a warning/error
-this would be useful in other parts of system but in TF-A
-there are various reasons to access to the lower address ranges,
-example using mmio_read_*/writes_*
-
-So setup to allow access to lower addresses while using gcc-12
-
-Change-Id: Id1b4012b13bc6876d83b90a347fee12478a1921d
-Signed-off-by: Govindraj Raja <govindraj.raja@arm.com>
-Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/dea23e245fb890c6c06eff7d1aed8fffa981fc05
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile                     |  4 ++++
- make_helpers/build_macros.mk | 12 ++++++++++++
- 2 files changed, 16 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index dccf0121d..edd7f5886 100644
---- a/Makefile
-+++ b/Makefile
-@@ -385,6 +385,10 @@ ifeq ($(findstring clang,$(notdir $(CC))),)
- WARNINGS	+=		-Wunused-but-set-variable -Wmaybe-uninitialized	\
- 				-Wpacked-bitfield-compat -Wshift-overflow=2 \
- 				-Wlogical-op
-+
-+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
-+TF_CFLAGS		+= 	$(call cc_option, --param=min-pagesize=0)
-+
- else
- # using clang
- WARNINGS	+=		-Wshift-overflow -Wshift-sign-overflow \
-diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
-index 12aaee684..3a54bf67c 100644
---- a/make_helpers/build_macros.mk
-+++ b/make_helpers/build_macros.mk
-@@ -86,6 +86,18 @@ define assert_numerics
-     $(foreach num,$1,$(eval $(call assert_numeric,$(num))))
- endef
- 
-+# Convenience function to check for a given linker option. An call to
-+# $(call ld_option, --no-XYZ) will return --no-XYZ if supported by the linker
-+define ld_option
-+	$(shell if $(LD) $(1) -v >/dev/null 2>&1; then echo $(1); fi )
-+endef
-+
-+# Convenience function to check for a given compiler option. A call to
-+# $(call cc_option, --no-XYZ) will return --no-XYZ if supported by the compiler
-+define cc_option
-+	$(shell if $(CC) $(1) -c -x c /dev/null -o /dev/null >/dev/null 2>&1; then echo $(1); fi )
-+endef
-+
- # CREATE_SEQ is a recursive function to create sequence of numbers from 1 to
- # $(2) and assign the sequence to $(1)
- define CREATE_SEQ
--- 
-2.41.0
-
diff --git a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 100644
index d989bdb06b..0000000000
--- a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From cc14748257e07ed5b2caf5194c4c333a8d09a1f4 Mon Sep 17 00:00:00 2001
-From: Marco Felsch <m.felsch@pengutronix.de>
-Date: Wed, 9 Nov 2022 12:59:09 +0100
-Subject: [PATCH] feat(build): add support for new binutils versions
-
-Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
-of a new warning when linking the bl*.elf in the form:
-
-  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
-  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
-  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
-  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
-
-These new warnings are enbaled by default to secure elf binaries:
- - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
- - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
-
-Fix it in a similar way to what the Linux kernel does, see:
-https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
-
-Following the reasoning there, we set "-z noexecstack" for all linkers
-(although LLVM's LLD defaults to it) and optional add
---no-warn-rwx-segments since this a ld.bfd related.
-
-Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
-Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
-Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
-Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- Makefile | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index edd7f5886..4c0e1473e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -418,6 +418,8 @@ endif
- 
- GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
- 
-+TF_LDFLAGS		+=	-z noexecstack
-+
- # LD = armlink
- ifneq ($(findstring armlink,$(notdir $(LD))),)
- TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
-@@ -445,6 +447,12 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
- # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
- else
- TF_LDFLAGS		+=	--fatal-warnings -O1
-+
-+# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
-+# are not loaded by a elf loader.
-+TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
-+TF_LDFLAGS		+=	-O1
-+
- TF_LDFLAGS		+=	--gc-sections
- # ld.lld doesn't recognize the errata flags,
- # therefore don't add those in that case
--- 
-2.41.0
-
diff --git a/board/technexion/imx8mpico/readme.txt b/board/technexion/imx8mpico/readme.txt
deleted file mode 100644
index c20bfc0f44..0000000000
--- a/board/technexion/imx8mpico/readme.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-****************************
-Technexion i.MX8M Pico board
-****************************
-
-This file documents the Buildroot support for the Technexion i.MX8M
-Pico board. The Pico i.MX8M system-on-module [1] is present in
-development kits like the Pico Pi i.MX8M [2].
-
-Build
-=====
-
-First, configure Buildroot for the i.MX8M Pico board:
-
-  make imx8mpico_defconfig
-
-Build all components:
-
-  make
-
-You will find in output/images/ the following files:
-  - bl31.bin
-  - boot.vfat
-  - Image
-  - imx8-boot-sd.bin
-  - lpddr4_pmu_train_fw.bin
-  - pico-8m-dcss-ili9881c.dtb
-  - pico-8m.dtb
-  - rootfs.ext4
-  - sdcard.img
-  - signed_hdmi_imx8m.bin
-  - u-boot.imx
-
-Flashing sdcard.img on the eMMC
-===============================
-
-i.MX8M Pico board does not have a SD card slot. The storage is an
-eMMC. An easy way to flash the eMMC is to use the u-boot ums
-command. The boards are sold pre-flashed with such a u-boot. It is
-assumed here that the board has already a working u-boot on eMMC and
-jumpers are set to boot on eMMC. See [3].
-
-Jumper configuration for eMMC boot:
-J1: jumper on pins 4 and 6.
-J2: jumper on pins 2 and 4.
-
-In case the board was flashed with a wrong u-boot, or the eMMC is
-erased, u-boot can be loaded by USB Serial Download boot mode, using
-imx-usb-loader. See [3].
-
-For flashing:
-- Plug the micro USB cable from the Debug USB Port, to your computer
-- Plug the USB Type C to your computer, this will power up the board
-
-In the U-Boot prompt launch:
-
-=> ums 0 mmc ${mmcdev}
-
-This will mount the eMMC content in the host PC as a mass storage device.
-Note: the ${mmcdev} id may change from one uboot version to another. The
-actual id can be confirmed by running commands "mmc rescan" then
-"mmc list", to find the eMMC entry. Finally it's possible to enter
-directly the mmc device id, for example: "ums 0 mmc 2".
-
-To determine the device associated to the eMMC card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-If your system automatically mount some device partitions, make sure
-to unmount them.
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on the eMMC. Launch the following
-command as root:
-
-  dd bs=1M if=output/images/sdcard.img of=/dev/<your-sd-device>
-
-*** WARNING! This will destroy all the eMMC content. Use with care! ***
-
-This operation can take several minutes, depending on the image
-size. When tested, a 10MB/s transfer rate was observed. Note: the
-blocksize "bs=1M" parameter gives better transfer performances.
-
-For details about the medium image layout, see the definition in
-board/freescale/common/imx/genimage.cfg.template.
-
-Boot the i.MX8M Pico board
-==========================
-
-To boot your newly created system:
-- put a micro USB cable into the Debug USB Port and connect using a terminal
-  emulator at 115200 bps, 8n1;
-- power on the board, with USB Type C connector.
-
-Enjoy!
-
-[1]. https://www.technexion.com/products/system-on-modules/pico/pico-compute-modules/detail/PICO-IMX8M
-[2]. https://www.technexion.com/products/system-on-modules/evk/pico-pi-imx8m/
-[3]. https://developer.technexion.com/docs/pico-evaluation-kit-boot-mode-settings#picoimx8m-and-picoimx8mmini
diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
deleted file mode 100644
index dd0f0e7b65..0000000000
--- a/configs/imx8mpico_defconfig
+++ /dev/null
@@ -1,40 +0,0 @@
-BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-pico-pi.dtb"
-BR2_GLOBAL_PATCH_DIR="board/technexion/imx8mpico/patches"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/linux-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-pico-pi freescale/imx8mq-pico-pi-dcss-ili9881c"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_FREESCALE_IMX=y
-BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
-BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.15.71-2.2.0)/imx-atf-lf-5.15.71-2.2.0.tar.gz"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mq"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
-BR2_TARGET_UBOOT_SPL=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_IMX_MKIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
