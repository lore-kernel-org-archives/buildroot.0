Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0BCD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC5060E8F;
	Tue,  9 Apr 2024 20:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyyXHpUHNTJU; Tue,  9 Apr 2024 20:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C55960E9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C55960E9A;
	Tue,  9 Apr 2024 20:51:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C87CB1BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BB2D81751
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id We-qYqzZCwv0 for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71FE281770
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71FE281770
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6ECB685E31; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 14:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 364e153e6a25ff8c0de348b0c5244ef17b3a1b57
X-Git-Newrev: 1e6f6252fd260626273dbf68a65a1b553f3ffdde
X-Patchwork-Hint: ignore
Message-Id: <20240409205030.6ECB685E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-image-gen: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e6f6252fd260626273dbf68a65a1b553f3ffdde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ti-k3-image-gen tool is deprecated an replaced by binman [1].

All defconfig that was using it have been updated to use U-boot
binman tool instead.

So, we can safely remove ti-k3-image-gen package.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Cc: Anand Gadiyar <gadiyar@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                          |  7 +++
 DEVELOPERS                                |  2 -
 boot/Config.in                            |  1 -
 boot/ti-k3-image-gen/Config.in            | 77 -------------------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  3 --
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 54 ----------------------
 6 files changed, 7 insertions(+), 137 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4084ffa516..76af1da348 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen removed"
+	select BR2_LEGACY
+	help
+	  ti-k3-image-gen tool  has been removed and replaced by
+	  U-Boot binman tool (requires U-boot >= 2023.10).
+
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "u-boot TI K3 DM option has been renamed."
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index d78661cd60..399b2931ff 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -158,7 +158,6 @@ N:	Anand Gadiyar <gadiyar@ti.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
@@ -3193,7 +3192,6 @@ N:	Xuanhao Shi <X15000177@gmail.com>
 F:	board/ti/am62x-sk/
 F:	board/ti/am64x-sk/
 F:	boot/ti-k3-boot-firmware/
-F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 F:	configs/ti_am62x_sk_defconfig
 F:	configs/ti_am64x_sk_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index e5fdf7ad43..87e1b7c00e 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,7 +20,6 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
-source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
deleted file mode 100644
index d76cef82e9..0000000000
--- a/boot/ti-k3-image-gen/Config.in
+++ /dev/null
@@ -1,77 +0,0 @@
-config BR2_TARGET_TI_K3_IMAGE_GEN
-	bool "ti-k3-image-gen"
-	depends on BR2_TARGET_TI_K3_R5_LOADER
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	# We need FIT support in uboot-tools, which is why we select a
-	# host package
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
-	help
-	  Use TI's k3-image-gen to build a separate bare metal boot
-	  binary from a separate SPL that is running on the R5 core.
-
-	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
-
-if BR2_TARGET_TI_K3_IMAGE_GEN
-choice
-	prompt "SoC family"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	bool "am62ax"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	bool "am62x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	bool "am64x"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-	bool "am65x"
-
-endchoice
-
-choice
-	prompt "Security type"
-	help
-	  The target SoC security type option for image gen.  Valid
-	  options are "gp" for General Purpose devices, "hs-fs" for
-	  High Security - Field Securable devices, or "hs" for High
-	  Security - Security Enforcing devices.  Note for all High
-	  Security device variants the TI_SECURE_DEV_PKG environmental
-	  variable must be defined at build time pointing to a valid
-	  core-secdev-k3 folder location, otherwise the build will
-	  fail, see
-	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	bool "gp"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	bool "hs-fs"
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-	bool "hs"
-
-endchoice
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
-	string
-	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
-	string
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
-	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
-
-config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
-	string
-	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
-	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
-	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
-
-endif
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
deleted file mode 100644
index c968c5648f..0000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4  k3-image-gen-08.06.00.007.tar.gz
-sha256  f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845  LICENSE
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
deleted file mode 100644
index 64be9a18f2..0000000000
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ /dev/null
@@ -1,54 +0,0 @@
-################################################################################
-#
-# ti-k3-image-gen
-#
-################################################################################
-
-TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
-TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
-TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
-TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
-TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
-TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
-
-# - ti-k3-image-gen is used to build tiboot3.bin, using the
-#   r5-u-boot-spl.bin file from the ti-k3-r5-loader package. Hence the
-#   dependency on ti-k3-r5-loader.
-# - the ti-k3-image-gen makefiles seem to need some feature from Make
-#   v4.0, similar to u-boot.
-TI_K3_IMAGE_GEN_DEPENDENCIES = \
-	host-arm-gnu-toolchain \
-	host-python3 \
-	host-openssl \
-	host-uboot-tools \
-	ti-k3-r5-loader \
-	ti-k3-boot-firmware \
-	$(BR2_MAKE_HOST_DEPENDENCY)
-
-TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
-TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
-TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
-
-TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
-
-define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
-	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
-endef
-
-define TI_K3_IMAGE_GEN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) \
-	$(BR2_MAKE) -C $(@D) \
-		SOC=$(TI_K3_IMAGE_GEN_SOC) \
-		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
-		CONFIG=evm \
-		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
-		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-		O=$(@D)/tmp \
-		BIN_DIR=$(@D)
-endef
-
-define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
-	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
