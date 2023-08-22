Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE59EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CECC281372;
	Thu,  7 Sep 2023 15:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CECC281372
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bcuyteeWkXCz; Thu,  7 Sep 2023 15:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1E9A81375;
	Thu,  7 Sep 2023 15:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E9A81375
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 312F81BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA97F6129E
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA97F6129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFSzxa-9gRhQ for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882516128E
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882516128E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 867AF86A25; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 12:01:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2389c76a95725b91ba538b56fb7da70877c7d3ad
X-Git-Newrev: 6134872d2878f46f8f2800c81baf917281bc79b0
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.867AF86A25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-image-gen: new package
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
Content-Type: multipart/mixed; boundary="===============7656776162862356402=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7656776162862356402==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6134872d2878f46f8f2800c81baf917281bc79b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the image generator that builds the initial boot binary,
tiboot3.bin, for the R5 core on TI's K3 family of devices.

This requires the R5 SPL output from the ti-k3-r5-loader package as
well as some boot firmware from ti-k3-boot-firmware.

Signed-off-by: Xuanhao Shi <x-shi@ti.com>
Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Bryan Brattlof <bb@ti.com>
Cc: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  2 +
 boot/Config.in                            |  1 +
 boot/ti-k3-image-gen/Config.in            | 77 +++++++++++++++++++++++++++++++
 boot/ti-k3-image-gen/ti-k3-image-gen.hash |  3 ++
 boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 54 ++++++++++++++++++++++
 5 files changed, 137 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b60189c77..2a10bb44cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -133,6 +133,7 @@ F:	package/python-docopt/
 
 N:	Anand Gadiyar <gadiyar@ti.com>
 F:	boot/ti-k3-boot-firmware/
+F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 
 N:	André Zwing <nerv@dawncrow.de>
@@ -3116,6 +3117,7 @@ F:	package/fwup/
 
 N:	Xuanhao Shi <X15000177@gmail.com>
 F:	boot/ti-k3-boot-firmware/
+F:	boot/ti-k3-image-gen/
 F:	boot/ti-k3-r5-loader/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
diff --git a/boot/Config.in b/boot/Config.in
index 87e1b7c00e..e5fdf7ad43 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -20,6 +20,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ti-k3-boot-firmware/Config.in"
+source "boot/ti-k3-image-gen/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
new file mode 100644
index 0000000000..d76cef82e9
--- /dev/null
+++ b/boot/ti-k3-image-gen/Config.in
@@ -0,0 +1,77 @@
+config BR2_TARGET_TI_K3_IMAGE_GEN
+	bool "ti-k3-image-gen"
+	depends on BR2_TARGET_TI_K3_R5_LOADER
+	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	# We need FIT support in uboot-tools, which is why we select a
+	# host package
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT
+	help
+	  Use TI's k3-image-gen to build a separate bare metal boot
+	  binary from a separate SPL that is running on the R5 core.
+
+	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
+
+if BR2_TARGET_TI_K3_IMAGE_GEN
+choice
+	prompt "SoC family"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+	bool "am62ax"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	bool "am62x"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+	bool "am64x"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+	bool "am65x"
+
+endchoice
+
+choice
+	prompt "Security type"
+	help
+	  The target SoC security type option for image gen.  Valid
+	  options are "gp" for General Purpose devices, "hs-fs" for
+	  High Security - Field Securable devices, or "hs" for High
+	  Security - Security Enforcing devices.  Note for all High
+	  Security device variants the TI_SECURE_DEV_PKG environmental
+	  variable must be defined at build time pointing to a valid
+	  core-secdev-k3 folder location, otherwise the build will
+	  fail, see
+	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
+	bool "gp"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
+	bool "hs-fs"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+	bool "hs"
+
+endchoice
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
+	string
+	default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+	default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+	default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
+	string
+	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+	default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+	default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
+	string
+	default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
+	default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
+	default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+
+endif
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
new file mode 100644
index 0000000000..c968c5648f
--- /dev/null
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4  k3-image-gen-08.06.00.007.tar.gz
+sha256  f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845  LICENSE
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
new file mode 100644
index 0000000000..64be9a18f2
--- /dev/null
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# ti-k3-image-gen
+#
+################################################################################
+
+TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
+TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
+TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
+TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
+TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
+TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
+
+# - ti-k3-image-gen is used to build tiboot3.bin, using the
+#   r5-u-boot-spl.bin file from the ti-k3-r5-loader package. Hence the
+#   dependency on ti-k3-r5-loader.
+# - the ti-k3-image-gen makefiles seem to need some feature from Make
+#   v4.0, similar to u-boot.
+TI_K3_IMAGE_GEN_DEPENDENCIES = \
+	host-arm-gnu-toolchain \
+	host-python3 \
+	host-openssl \
+	host-uboot-tools \
+	ti-k3-r5-loader \
+	ti-k3-boot-firmware \
+	$(BR2_MAKE_HOST_DEPENDENCY)
+
+TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
+TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
+
+TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
+
+define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
+	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
+endef
+
+define TI_K3_IMAGE_GEN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) \
+	$(BR2_MAKE) -C $(@D) \
+		SOC=$(TI_K3_IMAGE_GEN_SOC) \
+		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
+		CONFIG=evm \
+		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
+		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
+		O=$(@D)/tmp \
+		BIN_DIR=$(@D)
+endef
+
+define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
+	cp $(@D)/tiboot3.bin $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))

--===============7656776162862356402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7656776162862356402==--
