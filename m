Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC6ACD128A
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F324860EC0;
	Tue,  9 Apr 2024 20:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NSFsvFaigEa; Tue,  9 Apr 2024 20:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2F560EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C2F560EC7;
	Tue,  9 Apr 2024 20:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26D821BF3A4
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C6040637
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luR6NRZgfPNp for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 883DB40642
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883DB40642
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82EEB85E36; Tue,  9 Apr 2024 20:50:30 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 9 Apr 2024 14:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e6f6252fd260626273dbf68a65a1b553f3ffdde
X-Git-Newrev: e5d8cd5173f5a703ab1a34cd13b66a9fada8408e
X-Patchwork-Hint: ignore
Message-Id: <20240409205030.82EEB85E36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: remove
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5d8cd5173f5a703ab1a34cd13b66a9fada8408e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since all AM62 and AM64 defconfig has been updated to use binman
and ti-k3-image-gen has been removed, binman is now mandatory
for all TI K3 SoC. So remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
option since since it can't be disabled anymore.

We can remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN without
legacy handling since this option is not part of any Buildroot
release.

While at it, add one more like to binman dependencies in comments.

Reviewed-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-r5-loader/Config.in          | 11 ++---------
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 31 +++++++++++++------------------
 configs/ti_am62x_sk_defconfig           |  1 -
 configs/ti_am64x_sk_defconfig           |  1 -
 4 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 707f22ab4e..6d1adbeac3 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,8 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
 	  Usually used to build tiboot3.bin with k3-image-gen.
@@ -93,15 +95,6 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
-config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
-	bool "ti-k3-r5-loader use binman"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
-	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	help
-	  Use binman tool for generation and signing of boot images.
-
-	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
-
 config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
 	string "tiboot3.bin binary name"
 	default "tiboot3.bin"
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 36f87e577e..0fb07f2d65 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -35,11 +35,21 @@ TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
 TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
 TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
 TI_K3_R5_LOADER_INSTALL_IMAGES = YES
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# Make sure that all binman requirements are built before ti-k3-r5-loader.
 TI_K3_R5_LOADER_DEPENDENCIES = \
 	host-pkgconf \
 	$(BR2_MAKE_HOST_DEPENDENCY) \
 	host-arm-gnu-toolchain \
-	host-openssl
+	host-openssl \
+	host-python3 \
+	host-python-jsonschema \
+	host-python-pyelftools \
+	host-python-pylibfdt \
+	host-python-pyyaml \
+	host-python-setuptools \
+	ti-k3-boot-firmware
 
 TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
 TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
@@ -58,21 +68,8 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 	ARCH=arm \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
-
-ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
-TI_K3_R5_LOADER_DEPENDENCIES += \
-	host-python-jsonschema \
-	host-python-pyyaml \
-	ti-k3-boot-firmware
-# Make sure that all binman requirements are build before ti-k3-r5-loader.
-TI_K3_R5_LOADER_DEPENDENCIES += \
-	host-python3 \
-	host-python-pyelftools \
-	host-python-pylibfdt \
-	host-python-setuptools
-TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
+	BINMAN_INDIRS=$(BINARIES_DIR)
 
 TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
 
@@ -90,8 +87,6 @@ define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
 	fi
 endef
 
-endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
-
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b62f624d82..fa2c008d4c 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
-BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 56e1b23335..f7c6d16b35 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
 BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
-BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
