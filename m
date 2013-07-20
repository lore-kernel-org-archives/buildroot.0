From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Jul 2013 21:13:57 +0200
Subject: [Buildroot] [git commit] fix white spaces
Message-ID: <20130720191900.325E49A69B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0d9d33cc220159bd238bdbab1f32fca1e842e05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/iso9660/iso9660.mk                              |    4 +-
 fs/tar/tar.mk                                      |    2 +-
 linux/linux.mk                                     |    2 +-
 package/cloop/cloop.mk                             |    6 +-
 package/cramfs/cramfs.mk                           |    6 +-
 package/ctorrent/ctorrent.mk                       |    6 +-
 package/cvs/cvs.mk                                 |    8 +-
 package/dialog/dialog.mk                           |    2 +-
 package/ezxml/ezxml.mk                             |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk             |    4 +-
 package/genromfs/genromfs.mk                       |    6 +-
 package/ipsec-tools/ipsec-tools.mk                 |   28 +++---
 package/libargtable2/libargtable2.mk               |    2 +-
 package/libcgicc/libcgicc.mk                       |   12 +-
 package/libdvbsi/libdvbsi.mk                       |    2 +-
 package/libelf/libelf.mk                           |    6 +-
 package/libfuse/libfuse.mk                         |    2 +-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    6 +-
 .../matchbox-keyboard/matchbox-keyboard.mk         |    4 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |   26 ++--
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    6 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |   18 ++--
 package/multimedia/gst-omapfb/gst-omapfb.mk        |    6 +-
 package/multimedia/madplay/madplay.mk              |    4 +-
 package/netplug/netplug.mk                         |    6 +-
 package/nss-mdns/nss-mdns.mk                       |    4 +-
 package/pkg-download.mk                            |   24 ++--
 package/rpm/rpm.mk                                 |    8 +-
 package/sdl/sdl.mk                                 |   18 ++--
 package/squashfs/squashfs.mk                       |    6 +-
 package/squashfs3/squashfs3.mk                     |    6 +-
 package/xfsprogs/xfsprogs.mk                       |    2 +-
 support/dependencies/dependencies.mk               |    2 +-
 system/system.mk                                   |   16 ++--
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 toolchain/toolchain-external/ext-tool.mk           |  124 ++++++++++----------
 36 files changed, 194 insertions(+), 194 deletions(-)

diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index 36e6388..317314a 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -7,8 +7,8 @@
 #
 ################################################################################
 
-ISO9660_TARGET_DIR=$(BUILD_DIR)/iso9660
-ISO9660_BOOT_MENU:=$(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
+ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
+ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
 ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_GZIP)  = .gz
 ISO9660_CPIO_EXT-$(BR2_TARGET_ROOTFS_CPIO_BZIP2) = .bz2
diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
index 9fecf73..c93888c 100644
--- a/fs/tar/tar.mk
+++ b/fs/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_OPTS:=$(BR2_TARGET_ROOTFS_TAR_OPTIONS)
+TAR_OPTS := $(BR2_TARGET_ROOTFS_TAR_OPTIONS)
 
 define ROOTFS_TAR_CMD
  tar -c$(TAR_OPTS)f $@ -C $(TARGET_DIR) .
diff --git a/linux/linux.mk b/linux/linux.mk
index 2ab437d..17e9838 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_LICENSE = GPLv2
 LINUX_LICENSE_FILES = COPYING
 
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 1e9b723..adbd69a 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION=2.634-1
-CLOOP_SOURCE=cloop_$(CLOOP_VERSION).tar.gz
-CLOOP_SITE=http://debian-knoppix.alioth.debian.org/packages/sources/cloop
+CLOOP_VERSION = 2.634-1
+CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.gz
+CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
 
 HOST_CLOOP_DEPENDENCIES = host-zlib
 
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 19ecde4..f38ac1a 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CRAMFS_VERSION=1.1
-CRAMFS_SOURCE=cramfs-$(CRAMFS_VERSION).tar.gz
-CRAMFS_SITE=http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
+CRAMFS_VERSION = 1.1
+CRAMFS_SOURCE = cramfs-$(CRAMFS_VERSION).tar.gz
+CRAMFS_SITE = http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
 
 CRAMFS_DEPENDENCIES = zlib
 
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index 65e327e..d4f6b98 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -11,10 +11,10 @@ CTORRENT_LICENSE = GPLv2
 CTORRENT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CTORRENT_CONF_OPT+=--with-ssl=yes
-CTORRENT_DEPENDENCIES+=openssl
+CTORRENT_CONF_OPT += --with-ssl=yes
+CTORRENT_DEPENDENCIES += openssl
 else
-CTORRENT_CONF_OPT+=--with-ssl=no
+CTORRENT_CONF_OPT += --with-ssl=no
 endif
 
 $(eval $(autotools-package))
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index e48be41..7371644 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -12,14 +12,14 @@ CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
 
-CVS_CONFIGURE_ARGS=--disable-old-info-format-support
+CVS_CONFIGURE_ARGS = --disable-old-info-format-support
 ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-CVS_CONFIGURE_ARGS+=--enable-server
+CVS_CONFIGURE_ARGS += --enable-server
 else
-CVS_CONFIGURE_ARGS+=--disable-server
+CVS_CONFIGURE_ARGS += --disable-server
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-CVS_CONFIGURE_ARGS+=--with-external-zlib
+CVS_CONFIGURE_ARGS += --with-external-zlib
 endif
 
 CVS_CONF_OPT = $(CVS_CONFIGURE_ARGS)
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index c6ea023..06379f2 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -14,7 +14,7 @@ DIALOG_LICENSE = LGPLv2.1
 DIALOG_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-DIALOG_DEPENDENCIES+=libiconv
+DIALOG_DEPENDENCIES += libiconv
 endif
 
 define DIALOG_INSTALL_TARGET_CMDS
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index de86305..83a4fa9 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -7,7 +7,7 @@
 EZXML_VERSION = 0.8.6
 EZXML_SOURCE = ezxml-$(EZXML_VERSION).tar.gz
 EZXML_SITE = http://downloads.sourceforge.net/project/ezxml/ezXML/ezXML%20$(EZXML_VERSION)
-EZXML_INSTALL_STAGING=YES
+EZXML_INSTALL_STAGING = YES
 
 define EZXML_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" AR=$(TARGET_AR) \
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 2ff50ca..341ce67 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GADGETFS_TEST_SOURCE=gadgetfs-test.tar.bz2
-GADGETFS_TEST_SITE=http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
+GADGETFS_TEST_SOURCE = gadgetfs-test.tar.bz2
+GADGETFS_TEST_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
 
 GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
 
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 119d660..9e7c2ff 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GENROMFS_VERSION=0.5.2
-GENROMFS_SOURCE=genromfs-$(GENROMFS_VERSION).tar.gz
-GENROMFS_SITE=http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
+GENROMFS_VERSION = 0.5.2
+GENROMFS_SOURCE = genromfs-$(GENROMFS_VERSION).tar.gz
+GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
 
 define GENROMFS_BUILD_CMDS
  $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 1458909..8eeef1b 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -21,49 +21,49 @@ IPSEC_TOOLS_CONF_OPT = \
 	  --with-kernel-headers=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
-IPSEC_TOOLS_CONF_OPT+= --enable-adminport
+IPSEC_TOOLS_CONF_OPT += --enable-adminport
 else
-IPSEC_TOOLS_CONF_OPT+= --disable-adminport
+IPSEC_TOOLS_CONF_OPT += --disable-adminport
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_NATT), y)
-IPSEC_TOOLS_CONF_OPT+= --enable-natt
+IPSEC_TOOLS_CONF_OPT += --enable-natt
 else
-IPSEC_TOOLS_CONF_OPT+= --disable-natt
+IPSEC_TOOLS_CONF_OPT += --disable-natt
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_FRAG), y)
-IPSEC_TOOLS_CONF_OPT+= --enable-frag
+IPSEC_TOOLS_CONF_OPT += --enable-frag
 else
-IPSEC_TOOLS_CONF_OPT+= --disable-frag
+IPSEC_TOOLS_CONF_OPT += --disable-frag
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_DPD), y)
-IPSEC_TOOLS_CONF_OPT+= --enable-dpd
+IPSEC_TOOLS_CONF_OPT += --enable-dpd
 else
-IPSEC_TOOLS_CONF_OPT+= --disable-dpd
+IPSEC_TOOLS_CONF_OPT += --disable-dpd
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS), y)
-IPSEC_TOOLS_CONF_OPT+= --enable-stats
+IPSEC_TOOLS_CONF_OPT += --enable-stats
 else
-IPSEC_TOOLS_CONF_OPT+= --disable-stats
+IPSEC_TOOLS_CONF_OPT += --disable-stats
 endif
 
 ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
-IPSEC_TOOLS_CONF_OPT+= --without-readline
+IPSEC_TOOLS_CONF_OPT += --without-readline
 else
 IPSEC_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
-IPSEC_TOOLS_CONF_OPT+= --enable-security-context=no
+IPSEC_TOOLS_CONF_OPT += --enable-security-context=no
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_ENABLE),y)
-IPSEC_TOOLS_CONF_OPT+= --enable-security-context=yes
+IPSEC_TOOLS_CONF_OPT += --enable-security-context=yes
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
-IPSEC_TOOLS_CONF_OPT+= --enable-security-context=kernel
+IPSEC_TOOLS_CONF_OPT += --enable-security-context=kernel
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index da94824..cdd6236 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -9,7 +9,7 @@ LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
 
 LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPT= --disable-example \
+LIBARGTABLE2_CONF_OPT = --disable-example \
 		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 4d8ae37..a3c64d2 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION=3.2.9
-LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
-LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
-LIBCGICC_LICENSE=LGPLv3+
-LIBCGICC_INSTALL_STAGING=YES
-LIBCGICC_AUTORECONF=YES
+LIBCGICC_VERSION = 3.2.9
+LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
+LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_LICENSE = LGPLv3+
+LIBCGICC_INSTALL_STAGING = YES
+LIBCGICC_AUTORECONF = YES
 LIBCGICC_CONFIG_SCRIPTS = cgicc-config
 LIBCGICC_CONF_OPT = \
 	--disable-demos \
diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index 3e99177..2151691 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -12,6 +12,6 @@ LIBDVBSI_LICENSE = LGPLv2.1
 LIBDVBSI_LICENSE_FILES = COPYING
 
 # sometimes no Makefile is in the archive, just (re)generate
-LIBDVBSI_AUTORECONF=YES
+LIBDVBSI_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 5f788b2..b5aff56 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBELF_VERSION=0.8.12
-LIBELF_SOURCE=libelf-$(LIBELF_VERSION).tar.gz
-LIBELF_SITE=http://www.mr511.de/software/
+LIBELF_VERSION = 0.8.12
+LIBELF_SOURCE = libelf-$(LIBELF_VERSION).tar.gz
+LIBELF_SITE = http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index d422504..6057077 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -11,7 +11,7 @@ LIBFUSE_LICENSE = GPLv2 LGPLv2.1
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBFUSE_CONF_OPT= --disable-nls \
+LIBFUSE_CONF_OPT = --disable-nls \
 		--disable-example \
 		--disable-kernel-module \
 		--enable-lib \
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 9e1e055..7780bb6 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -21,10 +21,10 @@ MATCHBOX_DESKTOP_AUTORECONF = YES
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_DESKTOP_CONF_OPT+=--enable-startup-notification
-  MATCHBOX_DESKTOP_DEPENDENCIES+=startup-notification
+  MATCHBOX_DESKTOP_CONF_OPT += --enable-startup-notification
+  MATCHBOX_DESKTOP_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_DESKTOP_CONF_OPT+=--disable-startup-notification
+  MATCHBOX_DESKTOP_CONF_OPT += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 94782df..5b0f691 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -23,9 +23,9 @@ MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FI
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_PANGO),y)
-  MATCHBOX_PKEYBOARD_CONF_OPT+=--enable-pango
+  MATCHBOX_PKEYBOARD_CONF_OPT += --enable-pango
 else
-  MATCHBOX_KEYBOARD_DEPENDENCIES+=xlib_libXft
+  MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 768f29e..b4c378c 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -24,36 +24,36 @@ MATCHBOX_LIB_POST_INSTALL_STAGING_HOOKS += MATCHBOX_LIB_POST_INSTALL_FIXES
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_LIB_DEPENDENCIES+=xlib_libXpm
+  MATCHBOX_LIB_DEPENDENCIES += xlib_libXpm
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-  MATCHBOX_LIB_CONF_OPT+=--enable-jpeg
-  MATCHBOX_LIB_DEPENDENCIES+=jpeg
+  MATCHBOX_LIB_CONF_OPT += --enable-jpeg
+  MATCHBOX_LIB_DEPENDENCIES += jpeg
 else
-  MATCHBOX_LIB_CONF_OPT+=--disable-jpeg
+  MATCHBOX_LIB_CONF_OPT += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-  MATCHBOX_LIB_CONF_OPT+=--enable-png
-  MATCHBOX_LIB_DEPENDENCIES+=libpng
+  MATCHBOX_LIB_CONF_OPT += --enable-png
+  MATCHBOX_LIB_DEPENDENCIES += libpng
 else
-  MATCHBOX_LIB_CONF_OPT+=--disable-png
+  MATCHBOX_LIB_CONF_OPT += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_PANGO)$(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyy)
-  MATCHBOX_LIB_CONF_OPT+=--enable-pango
-  MATCHBOX_LIB_DEPENDENCIES+=pango
+  MATCHBOX_LIB_CONF_OPT += --enable-pango
+  MATCHBOX_LIB_DEPENDENCIES += pango
 else
-  MATCHBOX_LIB_CONF_OPT+=--disable-pango
+  MATCHBOX_LIB_CONF_OPT += --disable-pango
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-  MATCHBOX_LIB_CONF_OPT+=--enable-xft
-  MATCHBOX_LIB_DEPENDENCIES+=xlib_libXft
+  MATCHBOX_LIB_CONF_OPT += --enable-xft
+  MATCHBOX_LIB_DEPENDENCIES += xlib_libXft
 else
-  MATCHBOX_LIB_CONF_OPT+=--disable-xft
+  MATCHBOX_LIB_CONF_OPT += --disable-xft
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index bf145d4..655b20f 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -16,10 +16,10 @@ MATCHBOX_PANEL_CONF_OPT = --enable-expat
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_PANEL_CONF_OPT+=--enable-startup-notification
-  MATCHBOX_PANEL_DEPENDENCIES+=startup-notification matchbox-startup-monitor
+  MATCHBOX_PANEL_CONF_OPT += --enable-startup-notification
+  MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
 else
-  MATCHBOX_PANEL_CONF_OPT+=--disable-startup-notification
+  MATCHBOX_PANEL_CONF_OPT += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 3438d32..0f10c89 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -20,24 +20,24 @@ MATCHBOX_WM_CONF_ENV = expat=yes
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_WM_CONF_OPT+=--enable-composite
-  MATCHBOX_WM_DEPENDENCIES+=xlib_libXcomposite
-  MATCHBOX_WM_DEPENDENCIES+=xlib_libXpm
+  MATCHBOX_WM_CONF_OPT += --enable-composite
+  MATCHBOX_WM_DEPENDENCIES += xlib_libXcomposite
+  MATCHBOX_WM_DEPENDENCIES += xlib_libXpm
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-  #MATCHBOX_WM_OPTS+=--enable-standalone-xft
-  MATCHBOX_WM_DEPENDENCIES+=xlib_libXft
+  #MATCHBOX_WM_OPTS += --enable-standalone-xft
+  MATCHBOX_WM_DEPENDENCIES += xlib_libXft
 else
-  #MATCHBOX_WM_OPTS+=--disable-standalone-xft
+  #MATCHBOX_WM_OPTS += --disable-standalone-xft
 endif
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_WM_CONF_OPT+=--enable-startup-notification
-  MATCHBOX_WM_DEPENDENCIES+=startup-notification
+  MATCHBOX_WM_CONF_OPT += --enable-startup-notification
+  MATCHBOX_WM_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_WM_CONF_OPT+=--disable-startup-notification
+  MATCHBOX_WM_CONF_OPT += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index 7b8b128..bfcaa5d 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GST_OMAPFB_VERSION=1.0
-GST_OMAPFB_SOURCE=gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
-GST_OMAPFB_SITE=http://gst-dsp.googlecode.com/files/
+GST_OMAPFB_VERSION = 1.0
+GST_OMAPFB_SOURCE = gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
+GST_OMAPFB_SITE = http://gst-dsp.googlecode.com/files/
 
 define GST_OMAPFB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index 8dbb4c0..19ab13f 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -15,8 +15,8 @@ MADPLAY_DEPENDENCIES = libmad libid3tag
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
-MADPLAY_CONF_OPT+=--with-alsa
-MADPLAY_DEPENDENCIES+=alsa-lib
+MADPLAY_CONF_OPT += --with-alsa
+MADPLAY_DEPENDENCIES += alsa-lib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 7460b66..fbc7a2d 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NETPLUG_VERSION=1.2.9.2
-NETPLUG_SOURCE=netplug-$(NETPLUG_VERSION).tar.bz2
-NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
+NETPLUG_VERSION = 1.2.9.2
+NETPLUG_SOURCE = netplug-$(NETPLUG_VERSION).tar.bz2
+NETPLUG_SITE = http://www.red-bean.com/~bos/netplug
 
 define NETPLUG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 83d9a2a..9887256 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NSS_MDNS_VERSION=0.10
-NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
+NSS_MDNS_VERSION = 0.10
+NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
 
 NSS_MDNS_CONF_OPT += --localstatedir=/var
 
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 8f6fe3d..97c9226 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -8,14 +8,14 @@
 ################################################################################
 
 # Download method commands
-WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
-SVN:=$(call qstrip,$(BR2_SVN))
-BZR:=$(call qstrip,$(BR2_BZR))
-GIT:=$(call qstrip,$(BR2_GIT))
-HG:=$(call qstrip,$(BR2_HG)) $(QUIET)
-SCP:=$(call qstrip,$(BR2_SCP)) $(QUIET)
-SSH:=$(call qstrip,$(BR2_SSH)) $(QUIET)
-LOCALFILES:=$(call qstrip,$(BR2_LOCALFILES))
+WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
+SVN := $(call qstrip,$(BR2_SVN))
+BZR := $(call qstrip,$(BR2_BZR))
+GIT := $(call qstrip,$(BR2_GIT))
+HG := $(call qstrip,$(BR2_HG)) $(QUIET)
+SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
+SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
+LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
@@ -24,17 +24,17 @@ DL_MODE=DOWNLOAD
 
 # Override BR2_DL_DIR if shell variable defined
 ifneq ($(BUILDROOT_DL_DIR),)
-DL_DIR:=$(BUILDROOT_DL_DIR)
+DL_DIR := $(BUILDROOT_DL_DIR)
 else
-DL_DIR:=$(call qstrip,$(BR2_DL_DIR))
+DL_DIR := $(call qstrip,$(BR2_DL_DIR))
 endif
 
 ifeq ($(DL_DIR),)
-DL_DIR:=$(TOPDIR)/dl
+DL_DIR := $(TOPDIR)/dl
 endif
 
 # ensure it exists and a absolute path
-DL_DIR:=$(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
+DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
 
 #
 # URI scheme helper functions
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 32a949f..89ce70e 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -34,16 +34,16 @@ RPM_CONF_OPT += --with-file=no
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
-RPM_CONF_OPT+=--with-xz
+RPM_CONF_OPT += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
-RPM_CONF_OPT+=--with-bzip2
-RPM_DEPENDENCIES+=bzip2
+RPM_CONF_OPT += --with-bzip2
+RPM_DEPENDENCIES += bzip2
 endif
 
 RPM_MAKE = $(MAKE1)
 
-RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
+RPM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) program_transform_name= install
 
 $(eval $(autotools-package))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 76cc413..716bb62 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -12,33 +12,33 @@ SDL_LICENSE_FILES = COPYING
 SDL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
-SDL_CONF_OPT+=--enable-video-fbcon=yes
+SDL_CONF_OPT += --enable-video-fbcon=yes
 else
-SDL_CONF_OPT+=--enable-video-fbcon=no
+SDL_CONF_OPT += --enable-video-fbcon=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
-SDL_CONF_OPT+=--enable-video-directfb=yes
+SDL_CONF_OPT += --enable-video-directfb=yes
 SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
-SDL_CONF_OPT=--enable-video-directfb=no
+SDL_CONF_OPT = --enable-video-directfb=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-SDL_CONF_OPT+=--enable-video-qtopia=yes
+SDL_CONF_OPT += --enable-video-qtopia=yes
 SDL_DEPENDENCIES += qt
 else
-SDL_CONF_OPT+=--enable-video-qtopia=no
+SDL_CONF_OPT += --enable-video-qtopia=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
-SDL_CONF_OPT+=--enable-video-x11=yes
+SDL_CONF_OPT += --enable-video-x11=yes
 SDL_DEPENDENCIES += xlib_libX11 xlib_libXext \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
 else
-SDL_CONF_OPT+=--enable-video-x11=no
+SDL_CONF_OPT += --enable-video-x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
@@ -67,6 +67,6 @@ define SDL_FIXUP_SDL_CONFIG
 		$(STAGING_DIR)/usr/bin/sdl-config
 endef
 
-SDL_POST_INSTALL_STAGING_HOOKS+=SDL_FIXUP_SDL_CONFIG
+SDL_POST_INSTALL_STAGING_HOOKS += SDL_FIXUP_SDL_CONFIG
 
 $(eval $(autotools-package))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 1341402..04a26c6 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION=4.2
-SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
-SQUASHFS_SITE=http://downloads.sourceforge.net/projct/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
+SQUASHFS_VERSION = 4.2
+SQUASHFS_SOURCE = squashfs$(SQUASHFS_VERSION).tar.gz
+SQUASHFS_SITE = http://downloads.sourceforge.net/projct/squashfs/squashfs/squashfs$(SQUASHFS_VERSION)
 
 # no libattr in BR
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=0
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 956dbd6..4df1af6 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUASHFS3_VERSION=3.4
-SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
-SQUASHFS3_SITE=http://downloads.sourceforge.net/project/squashfs/squashfs/$(SQUASHFS3_VERSION)
+SQUASHFS3_VERSION = 3.4
+SQUASHFS3_SOURCE = squashfs$(SQUASHFS3_VERSION).tar.gz
+SQUASHFS3_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/$(SQUASHFS3_VERSION)
 
 SQUASHFS3_DEPENDENCIES = zlib
 
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 132b8d5..4437e38 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XFSPROGS_VERSION = 3.1.11
-XFSPROGS_SITE=ftp://oss.sgi.com/projects/xfs/cmd_tars
+XFSPROGS_SITE = ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
 
diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index c93dcb4..a2d229c 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -5,7 +5,7 @@
 #
 ################################################################################
 
-DEPENDENCIES_HOST_PREREQ:=
+DEPENDENCIES_HOST_PREREQ := 
 
 # suitable-host-pkg: calls check-host-$(1).sh shell script. Parameter (2)
 # can be the candidate to be checked. If not present, the check-host-$(1).sh
diff --git a/system/system.mk b/system/system.mk
index 50c86ad..df8c802 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -1,13 +1,13 @@
-TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-TARGET_GENERIC_ISSUE:=$(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
-TARGET_GENERIC_ROOT_PASSWD:=$(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
-TARGET_GENERIC_PASSWD_METHOD:=$(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
+TARGET_GENERIC_HOSTNAME := $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
+TARGET_GENERIC_ISSUE := $(call qstrip,$(BR2_TARGET_GENERIC_ISSUE))
+TARGET_GENERIC_ROOT_PASSWD := $(call qstrip,$(BR2_TARGET_GENERIC_ROOT_PASSWD))
+TARGET_GENERIC_PASSWD_METHOD := $(call qstrip,$(BR2_TARGET_GENERIC_PASSWD_METHOD))
 ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-TARGET_GENERIC_ROOT_PASSWD_HASH=$(shell mkpasswd -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
+TARGET_GENERIC_ROOT_PASSWD_HASH = $(shell mkpasswd -m "$(TARGET_GENERIC_PASSWD_METHOD)" "$(TARGET_GENERIC_ROOT_PASSWD)")
 endif
-TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
-TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
-TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
+TARGET_GENERIC_GETTY := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
+TARGET_GENERIC_GETTY_BAUDRATE := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
+TARGET_GENERIC_GETTY_TERM := $(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 
 target-generic-securetty:
 	grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 7130536..19e8761 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -11,7 +11,7 @@
 CTNG_DIR := $(BUILD_DIR)/build-toolchain
 
 CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/package/uclibc/uClibc-0.9.33.config
-CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
+CTNG_CONFIG_FILE := $(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
 # make options, such as -C, which makes it uneeded to chdir prior
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8aac50e..07dda0a 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -113,12 +113,12 @@ endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_DIR),)
 # if no path set, figure it out from path
-TOOLCHAIN_EXTERNAL_BIN:=$(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
+TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
 else
 ifeq ($(BR2_bfin),y)
-TOOLCHAIN_EXTERNAL_BIN:=$(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
+TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/$(TOOLCHAIN_EXTERNAL_PREFIX)/bin
 else
-TOOLCHAIN_EXTERNAL_BIN:=$(TOOLCHAIN_EXTERNAL_DIR)/bin
+TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_DIR)/bin
 endif
 endif
 
@@ -207,76 +207,76 @@ TOOLCHAIN_EXTERNAL_DEPENDENCIES = $(TOOLCHAIN_EXTERNAL_DIR)/.extracted
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE = arm-2011.09-70-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE = arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
-TOOLCHAIN_EXTERNAL_SOURCE=arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/
+TOOLCHAIN_EXTERNAL_SOURCE = arm-2013.05-24-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109),y)
-TOOLCHAIN_EXTERNAL_SITE=http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
-TOOLCHAIN_EXTERNAL_SOURCE=arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv7a-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv7a/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109),y)
-TOOLCHAIN_EXTERNAL_SITE=http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
-TOOLCHAIN_EXTERNAL_SOURCE=arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://software-dl.ti.com/sdoemb/sdoemb_public_sw/arago_toolchain/2011_09/exports/
+TOOLCHAIN_EXTERNAL_SOURCE = arago-2011.09-armv5te-linux-gnueabi-sdk.tar.bz2
 define TOOLCHAIN_EXTERNAL_FIXUP_CMDS
 	mv $(@D)/arago-2011.09/armv5te/* $(@D)/
 	rm -rf $(@D)/arago-2011.09/
 endef
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.04/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.04/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.05_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_06),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.06/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.03-63-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=mips-2013.05-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209),y)
-TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SOURCE = renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
-TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-uclinux/
+TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-36-sh-uclinux-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109),y)
-TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = ia32-2011.09-24-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.03-27-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209),y)
-TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
-TOOLCHAIN_EXTERNAL_SOURCE=ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
+TOOLCHAIN_EXTERNAL_SITE = https://sourcery.mentor.com/public/gnu_toolchain/i686-pc-linux-gnu/
+TOOLCHAIN_EXTERNAL_SOURCE = ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1),y)
 TOOLCHAIN_EXTERNAL_SITE_1   = http://blackfin.uclinux.org/gf/download/frsrelease/559/9858/
 TOOLCHAIN_EXTERNAL_SOURCE_1 = blackfin-toolchain-2012R1-RC2.i386.tar.bz2
@@ -290,36 +290,36 @@ TOOLCHAIN_EXTERNAL_SITE_2   = http://blackfin.uclinux.org/gf/download/frsrelease
 TOOLCHAIN_EXTERNAL_SOURCE_2 = blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNAL_SOURCE_2)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SOURCE = microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
+TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
+TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.04/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.04-20130415_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.04/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.7-2013.04-20130415_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.8-2013.05_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.05_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.06/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.8-2013.06_linux.tar.xz
+TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.06_linux.tar.xz
 else
 # Custom toolchain
-TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-TOOLCHAIN_EXTERNAL_SOURCE=$(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 
 # A value must be set (even if unused), otherwise the
 # $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) rule would override the main
 # $(DL_DIR) rule
 ifeq (,$(TOOLCHAIN_EXTERNAL_SOURCE))
-TOOLCHAIN_EXTERNAL_SOURCE=none
+TOOLCHAIN_EXTERNAL_SOURCE = none
 endif
 endif
 
