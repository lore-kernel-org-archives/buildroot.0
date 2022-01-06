Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050AEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 18:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49194293C;
	Thu,  6 Jan 2022 18:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJO1MwWzGDGF; Thu,  6 Jan 2022 18:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76CEC4294F;
	Thu,  6 Jan 2022 18:02:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D83DD1BF2F9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D240E4293C
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 18:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxZIMMrifujJ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 18:02:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 550CB42938
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 18:02:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 26246832B2; Thu,  6 Jan 2022 17:56:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 6 Jan 2022 19:01:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d164df0aefc121d4954d74d68491968a43ff73d6
X-Git-Newrev: 6a7a652b143dfe8003c65e41ccb6914472023ee0
X-Patchwork-Hint: ignore
Message-Id: <20220106175627.26246832B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a7a652b143dfe8003c65e41ccb6914472023ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides Mali libraries for Sunxi Mali Utgard GPUs. The
trailing -mainline is historical and was used at a time when there was
two packages providing these libraries. The "non-upstream" package has
been removed some time ago so before adding new packages bringing
support for other ARM Mali GPU versions or implementations, rename
sunxi-mali-mainline into sunxi-mali-utgard.

Add a legacy entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: rebase on master. Rename SUNXI_MALI_MAINLINE_REV to
SUNXI_MALI_UTGARD_REV in sunxi-mali-mailine-driver.mk and
BR2_PACKAGE_SUNXI_MALI_MAINLINE to BR2_PACKAGE_SUNXI_UTGARD in
sunxi-mali-mainline-driver/Config.in to respect bisectability]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
[Build tested only]
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Arnout: also update existing select in Config.in.legacy]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   | 32 +++++++++++++-
 DEVELOPERS                                         |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig       |  4 +-
 configs/olimex_a20_olinuxino_lime_defconfig        |  4 +-
 docs/manual/adding-packages-virtual.txt            |  2 +-
 package/Config.in                                  |  2 +-
 package/glslsandbox-player/Config.in               |  4 +-
 package/glslsandbox-player/glslsandbox-player.mk   |  2 +-
 package/qt5/qt5base/qt5base.mk                     |  2 +-
 package/sunxi-mali-mainline-driver/Config.in       |  4 +-
 .../sunxi-mali-mainline-driver.mk                  |  6 +--
 package/sunxi-mali-mainline/Config.in              | 42 -------------------
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 49 ----------------------
 package/sunxi-mali-utgard/Config.in                | 43 +++++++++++++++++++
 .../egl.pc                                         |  0
 .../glesv2.pc                                      |  0
 .../sunxi-mali-utgard.hash}                        |  2 +-
 package/sunxi-mali-utgard/sunxi-mali-utgard.mk     | 49 ++++++++++++++++++++++
 18 files changed, 140 insertions(+), 109 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 004506e4bb..ad5c43fb62 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,36 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	bool "sunxi-mali-mainline package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD
+	help
+	  Since the removal of the sunxi-mali package, the
+	  sunxi-mali-mainline package that coexisted became the only
+	  package to provide Mali blobs. The "-mainline" suffix being
+	  undescriptive nowadays and before adding new packages bringing
+	  Mali support for other SoCs/GPU flavors, it is clearer to
+	  rename it SUNXI_MALI_UTGARD.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	bool "sunxi-mali-mainline-r6p2 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
+	bool "sunxi-mali-mainline-r8p1 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
 config BR2_PACKAGE_QT5WEBKIT_EXAMPLES
 	bool "qt5webkit-examples removed"
 	select BR2_LEGACY
@@ -1451,7 +1481,7 @@ config BR2_PACKAGE_LIBUMP
 config BR2_PACKAGE_SUNXI_MALI
 	bool "sunxi-mali package removed"
 	select BR2_LEGACY
-	select BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD
 	help
 	  The sunxi-mali package was removed, as the
 	  sunxi-mali-mainline package replaces it for mainline
diff --git a/DEVELOPERS b/DEVELOPERS
index 03918e4205..fcc94a5cd8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1082,8 +1082,8 @@ F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
-F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	package/sunxi-mali-utgard/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index ed279326bc..319ac48c58 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -8,7 +8,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Toolchain
-# glibc is needed for sunxi-mali-mainline-package.
+# glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
 # System configuration
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index cd88a2d19a..4cec5689ca 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -8,7 +8,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Toolchain
-# glibc is needed for sunxi-mali-mainline-package.
+# glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
 # System configuration
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 6326bb5455..722e6e3771 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -13,7 +13,7 @@ the provider used in the rootfs.
 For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
 The implementation of this API is different for the 'Allwinner Tech Sunxi' and
 the 'Texas Instruments OMAP35xx' platforms. So +libgles+ will be a virtual
-package and +sunxi-mali+ and +ti-gfx+ will be the providers.
+package and +sunxi-mali-utgard+ and +ti-gfx+ will be the providers.
 
 ==== +virtual-package+ tutorial
 
diff --git a/package/Config.in b/package/Config.in
index 3c7340e27c..a45a652c87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,8 +571,8 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali-mainline-driver/Config.in"
+	source "package/sunxi-mali-utgard/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 02d4c442ed..2d15a7e270 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -55,7 +55,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 
 choice
 	prompt "Native windowing system"
-	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_UTGARD
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
@@ -73,7 +73,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
 	bool "ARM/Mali T76x Frame Buffer"
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 1578608a42..c5fbf062b7 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
-GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-utgard
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ba2971dc08..ec5264bfc9 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -271,7 +271,7 @@ endif
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
 endif
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 90bc308bc5..236470db53 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -1,11 +1,11 @@
 comment "sunxi-mali-mainline-driver needs a Linux kernel to be built"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	bool "sunxi-mali-mainline-driver"
 	default y
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE # runtime
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD # runtime
 	depends on BR2_LINUX_KERNEL
 	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index feffaa7ae6..6782ca7fc2 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -15,7 +15,7 @@ SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	KDIR=$(LINUX_DIR)
 
 define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
+	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
 	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
 		$(@D)/build.sh
 endef
@@ -24,12 +24,12 @@ SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_AP
 
 define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -b
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -b
 endef
 
 define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -i
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -i
 endef
 
 define SUNXI_MALI_MAINLINE_DRIVER_LINUX_CONFIG_FIXUPS
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
deleted file mode 100644
index a2fb95bd79..0000000000
--- a/package/sunxi-mali-mainline/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE
-	bool "sunxi-mali-mainline"
-	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	help
-	  Install userspace Allwinner OpenGL libraries.
-
-	  https://github.com/bootlin/mali-blobs
-
-if BR2_PACKAGE_SUNXI_MALI_MAINLINE
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "sunxi-mali-mainline"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "sunxi-mali-mainline"
-
-choice
-	prompt "Version"
-	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	help
-	  Select the version of the userspace module.
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	bool "r6p2"
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-	bool "r8p1"
-
-endchoice
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
-	string
-	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-
-endif
-
-comment "sunxi-mali needs an EABIhf glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
deleted file mode 100644
index b46f572311..0000000000
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# sunxi-mali-mainline
-#
-################################################################################
-
-SUNXI_MALI_MAINLINE_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
-SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
-SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
-SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
-SUNXI_MALI_MAINLINE_LICENSE = Allwinner End User Licence Agreement
-SUNXI_MALI_MAINLINE_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
-SUNXI_MALI_MAINLINE_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
-SUNXI_MALI_MAINLINE_LICENSE_FILES = $(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-
-SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
-
-ifeq ($(BR2_arm),y)
-SUNXI_MALI_MAINLINE_ARCH=arm
-else ifeq ($(BR2_aarch64),y)
-SUNXI_MALI_MAINLINE_ARCH=arm64
-endif
-
-define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
-
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
-
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
-endef
-
-define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(TARGET_DIR)/usr/lib/
-endef
-
-define SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-	mv $(@D)/$(SUNXI_MALI_MAINLINE_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-endef
-
-SUNXI_MALI_MAINLINE_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-
-$(eval $(generic-package))
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
new file mode 100644
index 0000000000..ff49ea03f1
--- /dev/null
+++ b/package/sunxi-mali-utgard/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_SUNXI_MALI_UTGARD
+	bool "sunxi-mali-utgard"
+	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Install userspace Allwinner OpenGL libraries for Mali
+	  Utgard GPUs.
+
+	  https://github.com/bootlin/mali-blobs
+
+if BR2_PACKAGE_SUNXI_MALI_UTGARD
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "sunxi-mali-utgard"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "sunxi-mali-utgard"
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  Select the version of the userspace module.
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	bool "r6p2"
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	bool "r8p1"
+
+endchoice
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
+	string
+	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+
+endif
+
+comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/egl.pc b/package/sunxi-mali-utgard/egl.pc
similarity index 100%
rename from package/sunxi-mali-mainline/egl.pc
rename to package/sunxi-mali-utgard/egl.pc
diff --git a/package/sunxi-mali-mainline/glesv2.pc b/package/sunxi-mali-utgard/glesv2.pc
similarity index 100%
rename from package/sunxi-mali-mainline/glesv2.pc
rename to package/sunxi-mali-utgard/glesv2.pc
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
similarity index 70%
rename from package/sunxi-mali-mainline/sunxi-mali-mainline.hash
rename to package/sunxi-mali-utgard/sunxi-mali-utgard.hash
index 96d8251f16..c86b927ea5 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-mainline-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
+sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-utgard-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
 sha256  8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
new file mode 100644
index 0000000000..f693667955
--- /dev/null
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sunxi-mali-utgard
+#
+################################################################################
+
+SUNXI_MALI_UTGARD_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
+SUNXI_MALI_UTGARD_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_UTGARD_VERSION))
+SUNXI_MALI_UTGARD_INSTALL_STAGING = YES
+SUNXI_MALI_UTGARD_PROVIDES = libegl libgles
+SUNXI_MALI_UTGARD_LICENSE = Allwinner End User Licence Agreement
+SUNXI_MALI_UTGARD_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
+SUNXI_MALI_UTGARD_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
+SUNXI_MALI_UTGARD_LICENSE_FILES = $(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+
+SUNXI_MALI_UTGARD_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION))
+
+ifeq ($(BR2_arm),y)
+SUNXI_MALI_UTGARD_ARCH=arm
+else ifeq ($(BR2_aarch64),y)
+SUNXI_MALI_UTGARD_ARCH=arm64
+endif
+
+define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
+
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(STAGING_DIR)/usr/lib/
+	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+define SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+	mv $(@D)/$(SUNXI_MALI_UTGARD_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+endef
+
+SUNXI_MALI_UTGARD_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
