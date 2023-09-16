Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BD5CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B24AC4026E;
	Sat, 16 Sep 2023 14:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B24AC4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F4BIp7ASqi-a; Sat, 16 Sep 2023 14:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB7040C12;
	Sat, 16 Sep 2023 14:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB7040C12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90CC71BF863
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6700282B08
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6700282B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oeTkTtJrNTyN for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:03:17 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0A6382897
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0A6382897
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA83213F899;
 Sat, 16 Sep 2023 16:03:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 16:03:08 +0200
Message-ID: <20230916140308.1869279-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694872994;
 bh=xrgLsBuWI7AGhlsidZPvjJ7P006VWVF3p9jjHSI9FHQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ld9Fkffg/7JebrEKb1H6uvKWjidKbIErQ71ZtmNYXsmceC+ProXwo4qXKA4RuZMWl
 XAML+QJQA+ZDVF9QsrnHOYOV1Vw5CjV0o9vj4R5DGoBhq4PyXhQ3yIZ+sHrebOmqR+
 UCHpLD/TG/MFgnhVLhbLujQQNF+zo+Xd1oZagt7ZUNYQ9i9/tndI5CFZlk4p8SKfwb
 T4n/8xyE/s/7cQw38k/1ybH5cq0iEWOCzndvXFH/MZxV8kEt4vsIM9jbKhRnAWZMFy
 89+HLctYVIh+ROiD7BTPB9MdI47UAd0KoDrb3D274GCNqXpX3ncguLr5BaRZcw99Z8
 exYLzkSdQxNKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ld9Fkffg
Subject: [Buildroot] [PATCH 1/1] configs/imx8mpico: bump bsp components to
 version tn-kirkstone_5.15.71-2.2.0
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

Those components are aligned with NXP BSP lf-5.15.71-2.2.0.

This commit introduces arm-trusted-firmware upstream patches to
compile the needed version with newer gcc and binutils.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5083366622

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 971f8ad with commands:

    make check-package
    ...
    0 warnings generated

    make imx8mpico_defconfig
    make
---
 ...low-lower-address-access-with-gcc-12.patch | 62 +++++++++++++++++++
 ...dd-support-for-new-binutils-versions.patch | 62 +++++++++++++++++++
 configs/imx8mpico_defconfig                   |  9 +--
 3 files changed, 129 insertions(+), 4 deletions(-)
 create mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
 create mode 100644 board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch

diff --git a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
new file mode 100644
index 0000000000..90e808cc8e
--- /dev/null
+++ b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0001-fix-build-allow-lower-address-access-with-gcc-12.patch
@@ -0,0 +1,62 @@
+From 078cbf942c86d77775a26d83fc87ca244de02d4c Mon Sep 17 00:00:00 2001
+From: Govindraj Raja <govindraj.raja@arm.com>
+Date: Fri, 5 May 2023 09:09:36 -0500
+Subject: [PATCH] fix(build): allow lower address access with gcc-12
+
+With gcc-12 any lower address access can trigger a warning/error
+this would be useful in other parts of system but in TF-A
+there are various reasons to access to the lower address ranges,
+example using mmio_read_*/writes_*
+
+So setup to allow access to lower addresses while using gcc-12
+
+Change-Id: Id1b4012b13bc6876d83b90a347fee12478a1921d
+Signed-off-by: Govindraj Raja <govindraj.raja@arm.com>
+Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/dea23e245fb890c6c06eff7d1aed8fffa981fc05
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Makefile                     |  4 ++++
+ make_helpers/build_macros.mk | 12 ++++++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index dccf0121d..edd7f5886 100644
+--- a/Makefile
++++ b/Makefile
+@@ -385,6 +385,10 @@ ifeq ($(findstring clang,$(notdir $(CC))),)
+ WARNINGS	+=		-Wunused-but-set-variable -Wmaybe-uninitialized	\
+ 				-Wpacked-bitfield-compat -Wshift-overflow=2 \
+ 				-Wlogical-op
++
++# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
++TF_CFLAGS		+= 	$(call cc_option, --param=min-pagesize=0)
++
+ else
+ # using clang
+ WARNINGS	+=		-Wshift-overflow -Wshift-sign-overflow \
+diff --git a/make_helpers/build_macros.mk b/make_helpers/build_macros.mk
+index 12aaee684..3a54bf67c 100644
+--- a/make_helpers/build_macros.mk
++++ b/make_helpers/build_macros.mk
+@@ -86,6 +86,18 @@ define assert_numerics
+     $(foreach num,$1,$(eval $(call assert_numeric,$(num))))
+ endef
+ 
++# Convenience function to check for a given linker option. An call to
++# $(call ld_option, --no-XYZ) will return --no-XYZ if supported by the linker
++define ld_option
++	$(shell if $(LD) $(1) -v >/dev/null 2>&1; then echo $(1); fi )
++endef
++
++# Convenience function to check for a given compiler option. A call to
++# $(call cc_option, --no-XYZ) will return --no-XYZ if supported by the compiler
++define cc_option
++	$(shell if $(CC) $(1) -c -x c /dev/null -o /dev/null >/dev/null 2>&1; then echo $(1); fi )
++endef
++
+ # CREATE_SEQ is a recursive function to create sequence of numbers from 1 to
+ # $(2) and assign the sequence to $(1)
+ define CREATE_SEQ
+-- 
+2.41.0
+
diff --git a/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
new file mode 100644
index 0000000000..d989bdb06b
--- /dev/null
+++ b/board/technexion/imx8mpico/patches/arm-trusted-firmware/0002-feat-build-add-support-for-new-binutils-versions.patch
@@ -0,0 +1,62 @@
+From cc14748257e07ed5b2caf5194c4c333a8d09a1f4 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Wed, 9 Nov 2022 12:59:09 +0100
+Subject: [PATCH] feat(build): add support for new binutils versions
+
+Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
+of a new warning when linking the bl*.elf in the form:
+
+  ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
+  ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
+  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
+  ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions
+
+These new warnings are enbaled by default to secure elf binaries:
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
+ - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
+
+Fix it in a similar way to what the Linux kernel does, see:
+https://lore.kernel.org/all/20220810222442.2296651-1-ndesaulniers@google.com/
+
+Following the reasoning there, we set "-z noexecstack" for all linkers
+(although LLVM's LLD defaults to it) and optional add
+--no-warn-rwx-segments since this a ld.bfd related.
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+Change-Id: I9430f5fa5036ca88da46cd3b945754d62616b617
+Upstream: https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ Makefile | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index edd7f5886..4c0e1473e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -418,6 +418,8 @@ endif
+ 
+ GCC_V_OUTPUT		:=	$(shell $(CC) -v 2>&1)
+ 
++TF_LDFLAGS		+=	-z noexecstack
++
+ # LD = armlink
+ ifneq ($(findstring armlink,$(notdir $(LD))),)
+ TF_LDFLAGS		+=	--diag_error=warning --lto_level=O1
+@@ -445,6 +447,12 @@ TF_LDFLAGS		+=	$(subst --,-Xlinker --,$(TF_LDFLAGS_$(ARCH)))
+ # LD = gcc-ld (ld) or llvm-ld (ld.lld) or other
+ else
+ TF_LDFLAGS		+=	--fatal-warnings -O1
++
++# With ld.bfd version 2.39 and newer new warnings are added. Skip those since we
++# are not loaded by a elf loader.
++TF_LDFLAGS		+=	$(call ld_option, --no-warn-rwx-segments)
++TF_LDFLAGS		+=	-O1
++
+ TF_LDFLAGS		+=	--gc-sections
+ # ld.lld doesn't recognize the errata flags,
+ # therefore don't add those in that case
+-- 
+2.41.0
+
diff --git a/configs/imx8mpico_defconfig b/configs/imx8mpico_defconfig
index 1df8c104ec..3e3290b9dd 100644
--- a/configs/imx8mpico_defconfig
+++ b/configs/imx8mpico_defconfig
@@ -1,10 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-pico-pi.dtb"
+BR2_GLOBAL_PATCH_DIR="board/technexion/imx8mpico/patches"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/linux-tn-im-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,linux-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/linux-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="tn_imx8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-pico-pi freescale/imx8mq-pico-pi-dcss-ili9881c"
@@ -18,13 +19,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.10.72-2.2.0)/imx-atf-lf-5.10.72-2.2.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.15.71-2.2.0)/imx-atf-lf-5.15.71-2.2.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-hardknott_5.10.72-2.2.0_20220207)/u-boot-tn-imx-tn-hardknott_5.10.72-2.2.0_20220207.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,TechNexion,u-boot-tn-imx,tn-kirkstone_5.15.71-2.2.0_20230512)/u-boot-tn-imx-tn-kirkstone_5.15.71-2.2.0_20230512.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pico-imx8mq"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
