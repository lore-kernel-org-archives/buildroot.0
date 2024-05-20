Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BF1C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 08:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 766094057B;
	Mon, 20 May 2024 08:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHB335-m8Srj; Mon, 20 May 2024 08:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53FE54056E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53FE54056E;
	Mon, 20 May 2024 08:39:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B21651C4646
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F0D960647
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 08:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqUc1k3AqPJY for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 08:39:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 224966061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 224966061A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 224966061A
 for <buildroot@buildroot.org>; Mon, 20 May 2024 08:39:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7C4F7B00565;
 Mon, 20 May 2024 10:39:50 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 10:39:42 +0200
Message-ID: <20240520083942.16646-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716194391;
 bh=D9zE0NKqahO+wWPbw/rk/ogUEVCpJMm/xoURd2nqsYc=;
 h=From:To:Cc:Subject:Date:From;
 b=ksU8Qe3rTLZAR1HJ1LlT0oUAJ6nOdMPStBt+KhC/dNoswrrgxMDE/TMwODEwPVrM2
 vKJB9Rv7R2oiGa1AdtKxkauCpnuNExp8q3Bt1pHOrYm9I0iEd2loFO9OLLfWlaEwsb
 Tqm1Bpy0pzKM7Q0xqILDNXzWRmlAQEEt33fzdg01vyGnvhX9+MG8JELUqz9bgUeKYU
 TB9fL0HzIw1PR5l7ovAS/EgwU8gQYLgleaL+fG9rExG5mQLAM7lLDoOJj3cGdA1iQb
 So8J+pXDjh6fszSJ8eckOC6tnWSI84Helc4eKJs17j9LhIpFcVH76YRQ5LXLG9ljPS
 mJZbqrsobc/jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ksU8Qe3r
Subject: [Buildroot] [PATCH 1/1] configs/imx8mmpico: bump bsp components to
 version tn-mickledore_6.1.55-2.2.0_20240417
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit bumps the BSP components (U-Boot, Arm Trusted Firmware
and Kernel) to version tn-mickledore_6.1.55-2.2.0_20240417.

While at it, it also enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the
defconfig, to check the archives of this new version. The necessary
hash files are also added. The BR2_GLOBAL_PATCH_DIR moved, due to a
defconfig refresh with a "make savedefconfig".

This commit also removes arm-truster-firmware package patches which
are no longer needed (since they are included in the new version).

Finally, this defconfig fail to build since commit dc0f721
"package/gcc: switch to 13.x as default". Those new BSP components
contains the patches to fix this build issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6865597270

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...low-lower-address-access-with-gcc-12.patch | 62 -------------------
 ...dd-support-for-new-binutils-versions.patch | 62 -------------------
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx8mmpico/patches/linux/linux.hash       |  2 +
 .../imx8mmpico/patches/uboot/uboot.hash       |  2 +
 configs/imx8mmpico_defconfig                  | 11 ++--
 7 files changed, 13 insertions(+), 129 deletions(-)
 delete mode 100644 board/technexion/imx8mmpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
 delete mode 100644 board/technexion/imx8mmpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
 create mode 100644 board/technexion/imx8mmpico/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/technexion/imx8mmpico/patches/linux-headers/linux-headers.hash
 create mode 100644 board/technexion/imx8mmpico/patches/linux/linux.hash
 create mode 100644 board/technexion/imx8mmpico/patches/uboot/uboot.hash

diff --git a/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch b/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
deleted file mode 100644
index 90e808cc8e5..00000000000
--- a/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
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
diff --git a/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch b/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
deleted file mode 100644
index d989bdb06be..00000000000
--- a/board/technexion/imx8mmpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
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
diff --git a/board/technexion/imx8mmpico/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/technexion/imx8mmpico/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 00000000000..98f425a89e4
--- /dev/null
+++ b/board/technexion/imx8mmpico/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cfb927722272897f850681c78d5f129b0883a8efaba9c52d30e029086524f7ff  imx-atf-lf-6.1.55-2.2.0.tar.gz
diff --git a/board/technexion/imx8mmpico/patches/linux-headers/linux-headers.hash b/board/technexion/imx8mmpico/patches/linux-headers/linux-headers.hash
new file mode 120000
index 00000000000..5808d92afe8
--- /dev/null
+++ b/board/technexion/imx8mmpico/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/technexion/imx8mmpico/patches/linux/linux.hash b/board/technexion/imx8mmpico/patches/linux/linux.hash
new file mode 100644
index 00000000000..d88a78c458f
--- /dev/null
+++ b/board/technexion/imx8mmpico/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  875716dc8fe6e0df55b40600877232d9a1d62f81950244e16d563621f636f16e  linux-tn-imx-tn-mickledore_6.1.55-2.2.0_20240417.tar.gz
diff --git a/board/technexion/imx8mmpico/patches/uboot/uboot.hash b/board/technexion/imx8mmpico/patches/uboot/uboot.hash
new file mode 100644
index 00000000000..0f48f6f10b7
--- /dev/null
+++ b/board/technexion/imx8mmpico/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fbcdf336960f38a14ac4e9a383c207952f8b81cf0b5fe38b53dfe6ad0e8fa089  u-boot-tn-imx-tn-mickledore_6.1.55-2.2.0_20240417.tar.gz
diff --git a/configs/imx8mmpico_defconfig b/configs/imx8mmpico_defconfig
index 711cdeb3907..d1836db61a9 100644
--- a/configs/imx8mmpico_defconfig
+++ b/configs/imx8mmpico_defconfig
@@ -1,11 +1,12 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/technexion/imx8mmpico/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-pico-pi.dtb"
-BR2_GLOBAL_PATCH_DIR="board/technexion/imx8mmpico/patches"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/linux-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-mickledore_6.1.55-2.2.0_20240417)/linux-tn-imx-tn-mickledore_6.1.55-2.2.0_20240417.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-pico-pi freescale/imx8mm-pico-pi-ili9881c"
@@ -19,13 +20,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.15.71-2.2.0)/imx-atf-lf-5.15.71-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.55-2.2.0)/imx-atf-lf-6.1.55-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-mickledore_6.1.55-2.2.0_20240417)/u-boot-tn-imx-tn-mickledore_6.1.55-2.2.0_20240417.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
