From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 11 Mar 2014 13:17:53 +0100
Subject: [Buildroot] [PATCH 1/6] barebox: fix coding style
In-Reply-To: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1394540278-28740-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in the buildroot user manual add just a single space before
and after a '=' sign.
Break long lines.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/barebox.mk | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 9324c25..f57d297 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,15 +4,15 @@
 #
 ################################################################################
 
-BAREBOX_VERSION    = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
+BAREBOX_VERSION = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
 
 ifeq ($(BAREBOX_VERSION),custom)
 # Handle custom Barebox tarballs as specified by the configuration
 BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
-BAREBOX_SITE    = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
-BAREBOX_SOURCE  = $(notdir $(BAREBOX_TARBALL))
+BAREBOX_SITE = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
+BAREBOX_SOURCE = $(notdir $(BAREBOX_TARBALL))
 else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
-BAREBOX_SITE        = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
+BAREBOX_SITE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 BAREBOX_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
@@ -26,7 +26,8 @@ BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(@D) \
+		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
 		barebox-$(BAREBOX_VERSION)-\*.patch
 endef
 
@@ -39,25 +40,29 @@ BAREBOX_INSTALL_TARGET = NO
 endif
 
 ifeq ($(KERNEL_ARCH),i386)
-BAREBOX_ARCH=x86
+BAREBOX_ARCH = x86
 else ifeq ($(KERNEL_ARCH),powerpc)
-BAREBOX_ARCH=ppc
+BAREBOX_ARCH = ppc
 else
-BAREBOX_ARCH=$(KERNEL_ARCH)
+BAREBOX_ARCH = $(KERNEL_ARCH)
 endif
 
-BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
+BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
+	$(TARGET_CROSS)"
 
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
 else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
 BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
 endif
 
 define BAREBOX_CONFIGURE_CMDS
-	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	cp $(BAREBOX_SOURCE_CONFIG) \
+		$(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) \
+		buildroot_defconfig
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
@@ -68,7 +73,8 @@ endef
 endif
 
 ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
-BAREBOX_ENV_NAME = $(notdir $(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
+BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
+	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
 define BAREBOX_BUILD_CUSTOM_ENV
 	$(@D)/scripts/bareboxenv -s \
 		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
-- 
1.8.3.2
