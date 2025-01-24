Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1FDC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C875A706F2;
	Fri, 28 Feb 2025 17:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diXyzy8h5jLZ; Fri, 28 Feb 2025 17:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C9C703B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C9C703B7;
	Fri, 28 Feb 2025 17:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B129711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57F4542E7E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5FM-b3g794yp for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A5E142693
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A5E142693
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 808F6818ED; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 19:24:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bfd91965dde86cf348c1c79ce045f2320d4e1e46
X-Git-Newrev: 1cbd22215010660116263ccb8f666ec6dfd601cd
X-Patchwork-Hint: ignore
Message-Id: <20250228163017.808F6818ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-embeddedsw: new
 boot package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1cbd22215010660116263ccb8f666ec6dfd601cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch adds a new boot package to Buildroot for building boot firmware
applications from the https://github.com/Xilinx/embeddedsw repo.

If a user chooses to build a boot firmware application, it will not be
installed by the xilinx-prebuilt package since it will come from the
xilinx-embeddedsw package.  In this way, users can mix and match applications
to be built by the xilinx-embeddedsw package and applications to be copied
from the xilinx-prebuilt package.  This is necessary for the versal platform
because the pdi file can only be built by AMD Vivado.

Support for additional applications in the https://github.com/Xilinx/embeddedsw
repo can always be added to this package as needed or requested.

The xilinx-embeddedsw package replaces previous solutions including
zynqmp-firmware, versal-firmware and xilinx-source.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Luca: Tested on Kria KV260 starter kit]
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 boot/Config.in                                |  1 +
 boot/xilinx-embeddedsw/Config.in              | 68 +++++++++++++++++++++++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.hash |  5 ++
 boot/xilinx-embeddedsw/xilinx-embeddedsw.mk   | 80 +++++++++++++++++++++++++++
 boot/xilinx-prebuilt/Config.in                |  8 +++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk       | 21 ++++++-
 7 files changed, 181 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 059383d364..bb8866e8c5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2426,6 +2426,7 @@ F:	board/versal/
 F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/xilinx-embeddedsw/
 F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/versal_vek280_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 5c8d0e7ee5..f167346cdf 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -19,6 +19,7 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/xilinx-embeddedsw/Config.in"
 source "boot/xilinx-prebuilt/Config.in"
 
 endmenu
diff --git a/boot/xilinx-embeddedsw/Config.in b/boot/xilinx-embeddedsw/Config.in
new file mode 100644
index 0000000000..757ff59e35
--- /dev/null
+++ b/boot/xilinx-embeddedsw/Config.in
@@ -0,0 +1,68 @@
+config BR2_TARGET_XILINX_EMBEDDEDSW
+	bool "xilinx-embeddedsw"
+	depends on BR2_aarch64
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH = "microblazeel-xilinx-elf"
+	help
+	  Build boot firmware applications from source for Xilinx
+	  boards. Users can mix and match applications to be built
+	  by xilinx-embeddedsw and applications to be copied by
+	  xilinx-prebuilt. If a xilinx-embeddedsw application is
+	  selected, it will be built and installed from the Xilinx
+	  embeddedsw repo, and it will not be copied from the
+	  xilinx-prebuilt repo.
+
+	  Applications can be found on the Xilinx embeddedsw repo:
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps
+
+comment "xilinx-embeddedsw needs a bare metal toolchain for tuple microblazeel-xilinx-elf"
+	depends on BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH != "microblazeel-xilinx-elf"
+
+if BR2_TARGET_XILINX_EMBEDDEDSW
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSION
+	string "xilinx-embeddedsw version"
+	default "xilinx_v2024.2"
+	help
+	  Release version of Xilinx/embeddedsw.
+	  Must be xilinx_v2023.1 or newer.
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+	bool "versal plm"
+	help
+	  Build versal plm application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the plm.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_plm
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+	bool "versal psmfw"
+	help
+	  Build versal psmfw application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the psmfw.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/versal_psmfw
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	bool "zynqmp pmufw"
+	help
+	  Build zynqmp pmufw application from Xilinx/embeddedsw repo.
+	  If selected, the xilinx-prebuilt package will not install
+	  the pmufw.elf since it will come from the xilinx-embeddedsw
+	  package.
+
+	  https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_pmufw
+
+config BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS
+	string "xilinx-embeddedsw optional zynqmp_pmufw user cflags"
+	depends on BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+	help
+	  Add optional cflags when building xilinx zynqmp_pmufw.
+
+	  Example cflag options can be found here:
+	  https://github.com/Xilinx/embeddedsw/blob/master/lib/sw_apps/zynqmp_pmufw/src/xpfw_config.h
+
+endif # BR2_TARGET_XILINX_EMBEDDEDSW
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
new file mode 100644
index 0000000000..f9eb6f7984
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  550ba0b206848adb0085bc1ca5a6b6731681335c92912afb4a6a8dbb4c489a0c  xilinx-embeddedsw-xilinx_v2024.2.tar.gz
+
+# Locally calculated
+sha256  12bf8dad928a59644758825758b0c9d42d54478f5b04c8beb714d6f792450849  license.txt
diff --git a/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
new file mode 100644
index 0000000000..7d4fcf8b8f
--- /dev/null
+++ b/boot/xilinx-embeddedsw/xilinx-embeddedsw.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# xilinx-embeddedsw
+#
+################################################################################
+
+XILINX_EMBEDDEDSW_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_VERSION))
+XILINX_EMBEDDEDSW_SITE = $(call github,Xilinx,embeddedsw,$(XILINX_EMBEDDEDSW_VERSION))
+XILINX_EMBEDDEDSW_LICENSE = MIT
+XILINX_EMBEDDEDSW_LICENSE_FILES = license.txt
+XILINX_EMBEDDEDSW_INSTALL_TARGET = NO
+XILINX_EMBEDDEDSW_INSTALL_IMAGES = YES
+XILINX_EMBEDDEDSW_DEPENDENCIES = toolchain-bare-metal-buildroot
+
+# ZYNQMP_PMUFW application allows users to add cflags
+XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS = \
+	$(call qstrip,$(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS))
+XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS = \
+	"-Os -flto -ffat-lto-objects $(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_USER_CFLAGS)"
+
+XILINX_EMBEDDEDSW_CFLAGS = "-Os -flto -ffat-lto-objects"
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_plm/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_plm/src/versal/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
+define XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW
+	$(MAKE) -C $(@D)/lib/sw_apps/versal_psmfw/src/versal \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/versal_psmfw/src/versal/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+
+ifeq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW
+	$(MAKE) -C $(@D)/lib/sw_apps/zynqmp_pmufw/src \
+		COMPILER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		ARCHIVER=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc-ar \
+		CC=$(HOST_DIR)/bin/microblazeel-xilinx-elf-gcc \
+		CFLAGS=$(XILINX_EMBEDDEDSW_ZYNQMP_PMUFW_CFLAGS)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW
+	$(INSTALL) -D -m 0755 $(@D)/lib/sw_apps/zynqmp_pmufw/src/executable.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
+
+define XILINX_EMBEDDEDSW_BUILD_CMDS
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PLM)
+	$(XILINX_EMBEDDEDSW_BUILD_VERSAL_PSMFW)
+	$(XILINX_EMBEDDEDSW_BUILD_ZYNQMP_PMUFW)
+endef
+
+define XILINX_EMBEDDEDSW_INSTALL_IMAGES_CMDS
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PLM)
+	$(XILINX_EMBEDDEDSW_INSTALL_VERSAL_PSMFW)
+	$(XILINX_EMBEDDEDSW_INSTALL_ZYNQMP_PMUFW)
+endef
+
+$(eval $(generic-package))
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
index 94ef3dd111..793baa116f 100644
--- a/boot/xilinx-prebuilt/Config.in
+++ b/boot/xilinx-prebuilt/Config.in
@@ -4,6 +4,14 @@ config BR2_TARGET_XILINX_PREBUILT
 	help
 	  Pre-built firmware files for Xilinx boards.
 
+	  The pre-built firmware applications will only be installed
+	  if they are not being built by the xilinx-embeddedsw
+	  package.
+
+	  Users can mix and match applications to build with
+	  xilinx-embeddedsw and applications to simply install with
+	  xilinx-prebuilt.
+
 	  https://github.com/Xilinx/soc-prebuilt-firmware
 
 if BR2_TARGET_XILINX_PREBUILT
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
index 9f36ee7285..d0817d3cc7 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.mk
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -46,23 +46,38 @@ XILINX_PREBUILT_PSMFW = $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf
 XILINX_PREBUILT_PDI = $(XILINX_PREBUILT_BOARD_DIR)/*.pdi
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL_XSA
 
-define XILINX_PREBUILT_INSTALL
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM),y)
+define XILINX_PREBUILT_INSTALL_VERSAL_PLM
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PLM) \
 		$(BINARIES_DIR)/plm.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PLM
+
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW),y)
+define XILINX_PREBUILT_INSTALL_VERSAL_PSMFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PSMFW) \
 		$(BINARIES_DIR)/psmfw.elf
+endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_VERSAL_PSMFW
+
+define XILINX_PREBUILT_INSTALL_VERSAL_PDI
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_PDI) \
 		$(BINARIES_DIR)/vpl_gen_fixed.pdi
 endef
 else # BR2_TARGET_XILINX_PREBUILT_VERSAL
-define XILINX_PREBUILT_INSTALL
+ifneq ($(BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW),y)
+define XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW
 	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
 		$(BINARIES_DIR)/pmufw.elf
 endef
+endif # !BR2_TARGET_XILINX_EMBEDDEDSW_ZYNQMP_PMUFW
 endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
 
 define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
-	$(XILINX_PREBUILT_INSTALL)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PLM)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PSMFW)
+	$(XILINX_PREBUILT_INSTALL_VERSAL_PDI)
+	$(XILINX_PREBUILT_INSTALL_ZYNQMP_PMUFW)
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
