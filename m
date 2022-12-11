Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE0BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A06B0813E9;
	Sun, 11 Dec 2022 20:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06B0813E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNOnEfzj5byD; Sun, 11 Dec 2022 20:14:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48BF813DC;
	Sun, 11 Dec 2022 20:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C48BF813DC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E87B1BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17A2E80FAC
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A2E80FAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uc54ld-5USK9 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CEAF80EE3
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CEAF80EE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDBEF8655E; Sun, 11 Dec 2022 20:14:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 21:14:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93d982207b43f9e741e190a71317901972175796
X-Git-Newrev: 0189bcb47c7733c36fcbcb88fbf26f57958db576
X-Patchwork-Hint: ignore
Message-Id: <20221211201432.EDBEF8655E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-r5-loader: new package
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
Content-Type: multipart/mixed; boundary="===============5998089440024555278=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5998089440024555278==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0189bcb47c7733c36fcbcb88fbf26f57958db576
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a separate U-Boot package that allows to build the
intermediate SPL binary for the Cortex-R5 core on TI's k3
platforms. Usually, the resulting SPL will be used for k3-image-gen to
build the full R5 boot binary tiboot3.bin.

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Bryan Brattlof <bb@ti.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  6 ++++
 boot/Config.in                            |  1 +
 boot/ti-k3-r5-loader/Config.in            | 35 ++++++++++++++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  3 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 49 +++++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 29dffaadf1..8e9a743c70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -128,6 +128,9 @@ F:	package/dcron/
 F:	package/libxmlrpc/
 F:	package/python-docopt/
 
+N:	Anand Gadiyar <gadiyar@ti.com>
+F:	boot/ti-k3-r5-loader/
+
 N:	André Zwing <nerv@dawncrow.de>
 F:	package/libkrb5/
 F:	package/openal/
@@ -3005,6 +3008,9 @@ F:	package/python-pyusb/
 N:	Wojciech Niziński <niziak@spox.org>
 F:	package/fwup/
 
+N:	Xuanhao Shi <X15000177@gmail.com>
+F:	boot/ti-k3-r5-loader/
+
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
 F:	package/gloox/
diff --git a/boot/Config.in b/boot/Config.in
index 40472ae07d..ce17b2df6b 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/sun20i-d1-spl/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
 
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
new file mode 100644
index 0000000000..10602c8df3
--- /dev/null
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -0,0 +1,35 @@
+config BR2_TARGET_TI_K3_R5_LOADER
+	bool "ti-k3-r5-loader"
+	depends on BR2_aarch64
+	help
+	  Separate U-Boot build for R5 cores on TI's k3 boards.
+	  Usually used to build tiboot3.bin with k3-image-gen.
+
+if BR2_TARGET_TI_K3_R5_LOADER
+
+choice
+	prompt "Configuration"
+	default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
+
+config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
+	bool "Using an in-tree board defconfig file"
+
+config BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG
+	bool "Using a custom board (def)config file"
+
+endchoice
+
+config BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG
+	string "Board defconfig"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
+	help
+	  Name of the board for which TI K3 R5 Loader should be
+	  built, without the _defconfig suffix.
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG
+	help
+	  Path to the TI K3 R5 Loader configuration file.
+
+endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..c5d1cb8e09
--- /dev/null
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
new file mode 100644
index 0000000000..422ab20d71
--- /dev/null
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# ti-k3-r5-loader
+#
+################################################################################
+
+TI_K3_R5_LOADER_VERSION = 2022.10
+TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
+TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
+TI_K3_R5_LOADER_LICENSE = GPL-2.0+
+TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
+TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
+TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
+TI_K3_R5_LOADER_INSTALL_IMAGES = YES
+TI_K3_R5_LOADER_DEPENDENCIES = \
+	host-pkgconf \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
+	host-arm-gnu-toolchain \
+	host-openssl
+
+TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
+TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
+TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES = \
+	host-arm-gnu-toolchain \
+	$(BR2_MAKE_HOST_DEPENDENCY) \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
+
+TI_K3_R5_LOADER_BOARD = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD))
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
+TI_K3_R5_LOADER_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
+TI_K3_R5_LOADER_KCONFIG_FILE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE))
+endif # BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
+TI_K3_R5_LOADER_MAKE_OPTS = \
+	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
+	ARCH=arm \
+	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
+	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+
+define TI_K3_R5_LOADER_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
+endef
+
+define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
+	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+endef
+
+$(eval $(kconfig-package))

--===============5998089440024555278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5998089440024555278==--
