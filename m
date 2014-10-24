From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Oct 2014 01:11:26 +0200
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141024232206.D4A46B0BC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=774ff0d13f5e954a76e2f2a1646fad37349803f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk                                     |    4 +-
 package/celt051/celt051.mk                         |   16 ++++++------
 package/ecryptfs-utils/ecryptfs-utils.mk           |    4 +-
 package/genromfs/genromfs.mk                       |    4 +-
 package/libaio/libaio.mk                           |    6 ++--
 package/libcec/libcec.mk                           |    2 +-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    6 ++--
 .../matchbox-keyboard/matchbox-keyboard.mk         |    6 ++--
 package/matchbox/matchbox-lib/matchbox-lib.mk      |   26 ++++++++++----------
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    6 ++--
 package/matchbox/matchbox-wm/matchbox-wm.mk        |   18 +++++++-------
 package/spice/spice.mk                             |   10 ++++----
 support/dependencies/check-host-tar.mk             |    4 +-
 support/dependencies/check-host-xzcat.mk           |    4 +-
 14 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2b862ec..8122741 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -72,8 +72,8 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 ifneq ($(words $(KERNEL_DTS_NAME)),1)
-$(error Kernel with appended device tree needs exactly one DTS source.\
-  Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
+$(error Kernel with appended device tree needs exactly one DTS source. \
+	Check BR2_LINUX_KERNEL_INTREE_DTS_NAME or BR2_LINUX_KERNEL_CUSTOM_DTS_PATH.)
 endif
 endif
 
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
index 280634d..9e25781 100644
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -18,13 +18,13 @@ CELT051_DEPENDENCIES = libogg
 # if target is the same kind as host (ie. same arch, same bitness,
 # same endianness, so that /usr/lib contains libraries linkable by
 # our cross-compiler)
-CELT051_CONF_OPTS =                  \
-  --enable-fixed-point              \
-  --disable-fixed-point-debug       \
-  --disable-experimental-postfilter \
-  --disable-static-modes            \
-  --disable-assertions              \
-  --disable-oggtest                 \
-  --with-ogg=$(STAGING_DIR)/usr     \
+CELT051_CONF_OPTS =                       \
+	--enable-fixed-point              \
+	--disable-fixed-point-debug       \
+	--disable-experimental-postfilter \
+	--disable-static-modes            \
+	--disable-assertions              \
+	--disable-oggtest                 \
+	--with-ogg=$(STAGING_DIR)/usr     \
 
 $(eval $(autotools-package))
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index e58bd8e..40cda06 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -15,8 +15,8 @@ ECRYPTFS_UTILS_CONF_OPTS = --disable-pywrap --disable-pam
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
-  NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
-  NSS_LIBS="-lnss3"
+	NSS_CFLAGS="-I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr" \
+	NSS_LIBS="-lnss3"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 4b64f39..8db0899 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -21,11 +21,11 @@ define GENROMFS_INSTALL_TARGET_CMDS
 endef
 
 define HOST_GENROMFS_BUILD_CMDS
-  $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_GENROMFS_INSTALL_CMDS
-  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 545a299..3988d65 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -12,15 +12,15 @@ LIBAIO_LICENSE = LGPLv2.1+
 LIBAIO_LICENSE_FILES = COPYING
 
 define LIBAIO_BUILD_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define LIBAIO_INSTALL_STAGING_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBAIO_INSTALL_TARGET_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 1a086b3..5a889b9 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 LIBCEC_CONF_OPTS = --enable-rpi \
-   --with-rpi-include-path=$(STAGING_DIR)/usr/include
+	--with-rpi-include-path=$(STAGING_DIR)/usr/include
 LIBCEC_DEPENDENCIES += rpi-userland
 LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
 else
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index d0bac32..2ea8866 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -21,10 +21,10 @@ MATCHBOX_DESKTOP_AUTORECONF = YES
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
-  MATCHBOX_DESKTOP_DEPENDENCIES += startup-notification
+MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
+MATCHBOX_DESKTOP_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_DESKTOP_CONF_OPTS += --disable-startup-notification
+MATCHBOX_DESKTOP_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 44943b3..ebf23e4 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -23,10 +23,10 @@ MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FI
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
-  MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
-  MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
+MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
+MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
-  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
+MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 183b360..3149bbb 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -24,36 +24,36 @@ MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_LIB_DEPENDENCIES += xlib_libXpm
+MATCHBOX_LIB_DEPENDENCIES += xlib_libXpm
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-  MATCHBOX_LIB_CONF_OPTS += --enable-jpeg
-  MATCHBOX_LIB_DEPENDENCIES += jpeg
+MATCHBOX_LIB_CONF_OPTS += --enable-jpeg
+MATCHBOX_LIB_DEPENDENCIES += jpeg
 else
-  MATCHBOX_LIB_CONF_OPTS += --disable-jpeg
+MATCHBOX_LIB_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-  MATCHBOX_LIB_CONF_OPTS += --enable-png
-  MATCHBOX_LIB_DEPENDENCIES += libpng
+MATCHBOX_LIB_CONF_OPTS += --enable-png
+MATCHBOX_LIB_DEPENDENCIES += libpng
 else
-  MATCHBOX_LIB_CONF_OPTS += --disable-png
+MATCHBOX_LIB_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_PANGO)$(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyy)
-  MATCHBOX_LIB_CONF_OPTS += --enable-pango
-  MATCHBOX_LIB_DEPENDENCIES += pango
+MATCHBOX_LIB_CONF_OPTS += --enable-pango
+MATCHBOX_LIB_DEPENDENCIES += pango
 else
-  MATCHBOX_LIB_CONF_OPTS += --disable-pango
+MATCHBOX_LIB_CONF_OPTS += --disable-pango
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-  MATCHBOX_LIB_CONF_OPTS += --enable-xft
-  MATCHBOX_LIB_DEPENDENCIES += xlib_libXft
+MATCHBOX_LIB_CONF_OPTS += --enable-xft
+MATCHBOX_LIB_DEPENDENCIES += xlib_libXft
 else
-  MATCHBOX_LIB_CONF_OPTS += --disable-xft
+MATCHBOX_LIB_CONF_OPTS += --disable-xft
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index b4b1778..72ee286 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -16,10 +16,10 @@ MATCHBOX_PANEL_CONF_OPTS = --enable-expat
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
-  MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
+MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
+MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
 else
-  MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
+MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index a3a4326..2ccb16e 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -20,24 +20,24 @@ MATCHBOX_WM_CONF_ENV = expat=yes
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_WM_CONF_OPTS += --enable-composite
-  MATCHBOX_WM_DEPENDENCIES += xlib_libXcomposite
-  MATCHBOX_WM_DEPENDENCIES += xlib_libXpm
+MATCHBOX_WM_CONF_OPTS += --enable-composite
+MATCHBOX_WM_DEPENDENCIES += xlib_libXcomposite
+MATCHBOX_WM_DEPENDENCIES += xlib_libXpm
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-  #MATCHBOX_WM_OPTS += --enable-standalone-xft
-  MATCHBOX_WM_DEPENDENCIES += xlib_libXft
+#MATCHBOX_WM_OPTS += --enable-standalone-xft
+MATCHBOX_WM_DEPENDENCIES += xlib_libXft
 else
-  #MATCHBOX_WM_OPTS += --disable-standalone-xft
+#MATCHBOX_WM_OPTS += --disable-standalone-xft
 endif
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_WM_CONF_OPTS += --enable-startup-notification
-  MATCHBOX_WM_DEPENDENCIES += startup-notification
+MATCHBOX_WM_CONF_OPTS += --enable-startup-notification
+MATCHBOX_WM_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_WM_CONF_OPTS += --disable-startup-notification
+MATCHBOX_WM_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 0c0af6f..52a265e 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -21,11 +21,11 @@ SPICE_DEPENDENCIES =    \
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
-SPICE_CONF_OPTS =           \
-  --disable-opengl          \
-  --disable-smartcard       \
-  --disable-automated-tests \
-  --without-sasl            \
+SPICE_CONF_OPTS =                 \
+	--disable-opengl          \
+	--disable-smartcard       \
+	--disable-automated-tests \
+	--without-sasl            \
 
 SPICE_DEPENDENCIES += host-pkgconf
 
diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
index 010bde7..9729507 100644
--- a/support/dependencies/check-host-tar.mk
+++ b/support/dependencies/check-host-tar.mk
@@ -1,8 +1,8 @@
 TAR ?= tar
 
 ifeq (,$(call suitable-host-package,tar,$(TAR)))
-  DEPENDENCIES_HOST_PREREQ += host-tar
-  TAR = $(HOST_DIR)/usr/bin/tar
+DEPENDENCIES_HOST_PREREQ += host-tar
+TAR = $(HOST_DIR)/usr/bin/tar
 endif
 
 # Since TAR is at least 1.17, it will certainly support --strip-components
diff --git a/support/dependencies/check-host-xzcat.mk b/support/dependencies/check-host-xzcat.mk
index 24286ef..5e08b6e 100644
--- a/support/dependencies/check-host-xzcat.mk
+++ b/support/dependencies/check-host-xzcat.mk
@@ -2,6 +2,6 @@
 # If it is not present, build our own host-xzcat
 
 ifeq (,$(call suitable-host-package,xzcat,$(XZCAT)))
-  DEPENDENCIES_HOST_PREREQ += host-xz
-  XZCAT = $(HOST_DIR)/usr/bin/xzcat
+DEPENDENCIES_HOST_PREREQ += host-xz
+XZCAT = $(HOST_DIR)/usr/bin/xzcat
 endif
