From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:45:47 +0100
Subject: [Buildroot] [PATCH 1/2] packages: remove all := signs
Message-ID: <1358711148-2283-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally get rid of all := used for variable definitions in packages,
as we suggest in our manual and during the review of new packages.

While I was at it, I also sometimes added a few missing new lines
between the header and the first variable definition.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/argus/argus.mk                             |   11 ++++++-----
 package/autoconf/autoconf.mk                       |    6 +++---
 package/blackbox/blackbox.mk                       |    8 ++++----
 package/ctorrent/ctorrent.mk                       |    7 ++++---
 package/dbus-glib/dbus-glib.mk                     |    2 +-
 package/directfb-examples/directfb-examples.mk     |   15 ++++++++-------
 package/directfb/directfb.mk                       |   14 +++++++-------
 package/divine/divine.mk                           |    4 ++--
 package/dmalloc/dmalloc.mk                         |   17 +++++++++--------
 package/dmraid/dmraid.mk                           |    9 +++++----
 package/fbdump/fbdump.mk                           |    7 ++++---
 package/fbv/fbv.mk                                 |    7 ++++---
 package/genext2fs/genext2fs.mk                     |    6 +++---
 package/gob2/gob2.mk                               |    2 +-
 package/gtkperf/gtkperf.mk                         |    7 ++++---
 package/libglib2/libglib2.mk                       |    2 +-
 package/libid3tag/libid3tag.mk                     |   12 ++++++------
 package/liblockfile/liblockfile.mk                 |    9 +++++----
 package/librsvg/librsvg.mk                         |   10 +++++-----
 package/librsync/librsync.mk                       |    7 ++++---
 package/libsysfs/libsysfs.mk                       |    8 ++++----
 package/libtool/libtool.mk                         |    4 ++--
 package/libungif/libungif.mk                       |    7 ++++---
 package/libxml-parser-perl/libxml-parser-perl.mk   |    7 ++++---
 package/libxml2/libxml2.mk                         |    2 +-
 package/lite/lite.mk                               |    7 ++++---
 package/lmbench/lmbench.mk                         |    7 ++++---
 package/lrzsz/lrzsz.mk                             |    6 +++---
 package/lzma/lzma.mk                               |    9 +++++----
 package/make/make.mk                               |    7 ++++---
 package/mdadm/mdadm.mk                             |    7 ++++---
 package/multimedia/madplay/madplay.mk              |   11 ++++++-----
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    6 +++---
 package/netcat/netcat.mk                           |    6 +++---
 package/olsr/olsr.mk                               |   18 +++++++++---------
 package/openocd/openocd.mk                         |    3 ++-
 package/qt/qt.mk                                   |    4 ++--
 package/sdl_image/sdl_image.mk                     |   13 +++++++------
 package/shared-mime-info/shared-mime-info.mk       |    2 +-
 package/udpcast/udpcast.mk                         |    7 ++++---
 package/vtun/vtun.mk                               |    7 ++++---
 package/zlib/zlib.mk                               |    8 ++++----
 42 files changed, 170 insertions(+), 148 deletions(-)

diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index a4b5330..ba69794 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -3,11 +3,12 @@
 # argus
 #
 #############################################################
-ARGUS_VERSION:=3.0.0.rc.34
-ARGUS_SOURCE:=argus_$(ARGUS_VERSION).orig.tar.gz
-ARGUS_PATCH:=argus_$(ARGUS_VERSION)-1.diff.gz
-ARGUS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
-ARGUS_DEPENDENCIES=libpcap
+
+ARGUS_VERSION = 3.0.0.rc.34
+ARGUS_SOURCE = argus_$(ARGUS_VERSION).orig.tar.gz
+ARGUS_PATCH = argus_$(ARGUS_VERSION)-1.diff.gz
+ARGUS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/argus/
+ARGUS_DEPENDENCIES = libpcap
 ARGUS_LICENSE = GPLv2+
 ARGUS_LICENSE_FILES = COPYING
 
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8807c10..0c36b66 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -24,6 +24,6 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
-AUTOHEADER:=$(HOST_DIR)/usr/bin/autoheader
-AUTORECONF=$(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
+AUTOCONF = $(HOST_DIR)/usr/bin/autoconf
+AUTOHEADER = $(HOST_DIR)/usr/bin/autoheader
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true $(HOST_DIR)/usr/bin/autoreconf -f -i -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 43cd747..7e5c73a 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-BLACKBOX_VERSION:=0.70.1
-BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
-BLACKBOX_SITE:=http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
+BLACKBOX_VERSION = 0.70.1
+BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
+BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
 
-BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
+BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 
 BLACKBOX_DEPENDENCIES = xlib_libX11
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index d83011e..e67fbe9 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -3,9 +3,10 @@
 # enhanced ctorrent
 #
 #############################################################
-CTORRENT_VERSION:=dnh3.3.2
-CTORRENT_SOURCE:=ctorrent-$(CTORRENT_VERSION).tar.gz
-CTORRENT_SITE:=http://www.rahul.net/dholmes/ctorrent/
+
+CTORRENT_VERSION = dnh3.3.2
+CTORRENT_SOURCE = ctorrent-$(CTORRENT_VERSION).tar.gz
+CTORRENT_SITE = http://www.rahul.net/dholmes/ctorrent/
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CTORRENT_CONF_OPT+=--with-ssl=yes
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 318e1b9..6a4aab2 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -36,4 +36,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # dbus-glib for the host
-DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
+DBUS_GLIB_HOST_BINARY = $(HOST_DIR)/usr/bin/dbus-binding-tool
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 8d03898..26cc499 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -3,14 +3,15 @@
 # directfb examples
 #
 #############################################################
-DIRECTFB_EXAMPLES_VERSION:=1.2.0
-DIRECTFB_EXAMPLES_SITE:=http://www.directfb.org/downloads/Extras
+
+DIRECTFB_EXAMPLES_VERSION = 1.2.0
+DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
-DIRECTFB_EXAMPLES_TARGETS_ :=
-DIRECTFB_EXAMPLES_TARGETS_y :=
+DIRECTFB_EXAMPLES_TARGETS_ =
+DIRECTFB_EXAMPLES_TARGETS_y =
 
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/bin/df_andi
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD) += usr/bin/df_bltload
@@ -37,8 +38,8 @@ DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/bin/df_v
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/bin/df_video_particle
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/bin/df_window
 
-DIRECTFB_EXAMPLES_DATA_ :=
-DIRECTFB_EXAMPLES_DATA_y :=
+DIRECTFB_EXAMPLES_DATA_ =
+DIRECTFB_EXAMPLES_DATA_y =
 
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/destination_mask.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/tux.png
@@ -77,7 +78,7 @@ DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/sh
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/desktop.png
 DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/dfblogo.png
 
-DIRECTFB_EXAMPLES_FONT_y :=
+DIRECTFB_EXAMPLES_FONT_y =
 ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS),y)
 DIRECTFB_EXAMPLES_FONT_y = usr/share/directfb-examples/fonts/*
 endif
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 1ccffc5..05a6c50 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -52,7 +52,7 @@ else
 DIRECTFB_CONF_OPT += --disable-unique
 endif
 
-DIRECTFB_GFX := \
+DIRECTFB_GFX = \
 	$(if $(BR2_PACKAGE_DIRECTFB_ATI128),ati128) \
 	$(if $(BR2_PACKAGE_DIRECTFB_CLE266),cle266) \
 	$(if $(BR2_PACKAGE_DIRECTFB_CYBER5K),cyber5k) \
@@ -63,14 +63,14 @@ DIRECTFB_GFX := \
 	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
-DIRECTFB_GFX:=none
+DIRECTFB_GFX = none
 else
-DIRECTFB_GFX:=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
+DIRECTFB_GFX = $(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
 endif
 
 DIRECTFB_CONF_OPT += --with-gfxdrivers=$(DIRECTFB_GFX)
 
-DIRECTFB_INPUT := \
+DIRECTFB_INPUT = \
 	$(if $(BR2_PACKAGE_DIRECTFB_LINUXINPUT),linuxinput) \
 	$(if $(BR2_PACKAGE_DIRECTFB_KEYBOARD),keyboard) \
 	$(if $(BR2_PACKAGE_DIRECTFB_PS2MOUSE),ps2mouse) \
@@ -82,9 +82,9 @@ DIRECTFB_DEPENDENCIES += tslib
 endif
 
 ifeq ($(strip $(DIRECTFB_INPUT)),)
-DIRECTFB_INPUT:=none
+DIRECTFB_INPUT = none
 else
-DIRECTFB_INPUT:=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
+DIRECTFB_INPUT = $(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
 endif
 
 DIRECTFB_CONF_OPT += --with-inputdrivers=$(DIRECTFB_INPUT)
@@ -146,4 +146,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # directfb-csource for the host
-DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
+DIRECTFB_HOST_BINARY = $(HOST_DIR)/usr/bin/directfb-csource
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 7c7585f..1fd27d2 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-DIVINE_VERSION := 0.4.0
-DIVINE_SITE := http://www.directfb.org/downloads/Extras
+DIVINE_VERSION = 0.4.0
+DIVINE_SITE = http://www.directfb.org/downloads/Extras
 DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 42e2e64..8623829 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -3,27 +3,28 @@
 # dmalloc
 #
 #############################################################
-DMALLOC_VERSION:=5.4.3
-DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VERSION).tgz
-DMALLOC_SITE:=http://dmalloc.com/releases
+
+DMALLOC_VERSION = 5.4.3
+DMALLOC_SOURCE = dmalloc-$(DMALLOC_VERSION).tgz
+DMALLOC_SITE = http://dmalloc.com/releases
 
 DMALLOC_LICENSE = MIT-like
 # license is in each file, dmalloc.h.1 is the smallest one
 DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CONF_OPT:= --enable-shlib
+DMALLOC_CONF_OPT = --enable-shlib
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-DMALLOC_CONF_OPT+=--enable-cxx
+DMALLOC_CONF_OPT += --enable-cxx
 else
-DMALLOC_CONF_OPT+=--disable-cxx
+DMALLOC_CONF_OPT += --disable-cxx
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-DMALLOC_CONF_OPT+=--enable-threads
+DMALLOC_CONF_OPT += --enable-threads
 else
-DMALLOC_CONF_OPT+=--disable-threads
+DMALLOC_CONF_OPT += --disable-threads
 endif
 
 define DMALLOC_POST_PATCH
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 3fb2375..66a9d70 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -3,10 +3,11 @@
 # dmraid
 #
 #############################################################
-DMRAID_VERSION:=1.0.0.rc15
-DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
-DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
-DMRAID_SUBDIR:=$(DMRAID_VERSION)
+
+DMRAID_VERSION = 1.0.0.rc15
+DMRAID_SOURCE = dmraid-$(DMRAID_VERSION).tar.bz2
+DMRAID_SITE = http://people.redhat.com/~heinzm/sw/dmraid/src
+DMRAID_SUBDIR = $(DMRAID_VERSION)
 # lib and tools race with parallel make
 DMRAID_MAKE = $(MAKE1)
 DMRAID_INSTALL_STAGING = YES
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index 820ae96..f80cb1b 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -3,9 +3,10 @@
 # fbdump
 #
 #############################################################
-FBDUMP_VERSION:=0.4.2
-FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
-FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
+
+FBDUMP_VERSION = 0.4.2
+FBDUMP_SOURCE = fbdump-$(FBDUMP_VERSION).tar.gz
+FBDUMP_SITE = http://www.rcdrummond.net/fbdump
 FBDUMP_LICENSE = GPLv2
 FBDUMP_LICENSE_FILES = COPYING
 
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index f697fe8..2a4029e 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -3,9 +3,10 @@
 # fbv
 #
 #############################################################
-FBV_VERSION:=1.0b
-FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
-FBV_SITE:=http://s-tech.elsat.net.pl/fbv
+
+FBV_VERSION = 1.0b
+FBV_SOURCE = fbv-$(FBV_VERSION).tar.gz
+FBV_SITE = http://s-tech.elsat.net.pl/fbv
 
 FBV_LICENSE = GPLv2
 FBV_LICENSE_FILES = COPYING
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 6472811..6126a74 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-GENEXT2FS_VERSION=1.4.1
-GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
-GENEXT2FS_SITE:=http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
+GENEXT2FS_VERSION = 1.4.1
+GENEXT2FS_SOURCE = genext2fs-$(GENEXT2FS_VERSION).tar.gz
+GENEXT2FS_SITE = http://downloads.sourceforge.net/project/genext2fs/genext2fs/$(GENEXT2FS_VERSION)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index b64c0db..da208ac 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -13,4 +13,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # gob2 for the host
-GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
+GOB2_HOST_BINARY = $(HOST_DIR)/usr/bin/gob2
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index b2ad943..ac18f7b 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -3,9 +3,10 @@
 # GtkPerf
 #
 #############################################################
-GTKPERF_VERSION:=0.40
-GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
-GTKPERF_SITE:=http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
+
+GTKPERF_VERSION = 0.40
+GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
+GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
 GTKPERF_DEPENDENCIES = libgtk2
 
 $(eval $(autotools-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c3e510b..a368432 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -94,4 +94,4 @@ endif
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
+LIBGLIB2_HOST_BINARY = $(HOST_DIR)/usr/bin/glib-genmarshal
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index 1e78fca..fc22976 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-LIBID3TAG_VERSION:=0.15.1b
-LIBID3TAG_SOURCE:=libid3tag-$(LIBID3TAG_VERSION).tar.gz
-LIBID3TAG_SITE:=http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
-LIBID3TAG_INSTALL_STAGING=YES
-LIBID3TAG_DEPENDENCIES=zlib
-LIBID3TAG_LIBTOOL_PATCH=NO
+LIBID3TAG_VERSION = 0.15.1b
+LIBID3TAG_SOURCE = libid3tag-$(LIBID3TAG_VERSION).tar.gz
+LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
+LIBID3TAG_INSTALL_STAGING = YES
+LIBID3TAG_DEPENDENCIES = zlib
+LIBID3TAG_LIBTOOL_PATCH = NO
 
 $(eval $(autotools-package))
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 84b0212..568d010 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -3,10 +3,11 @@
 # liblockfile
 #
 #############################################################
-LIBLOCKFILE_VERSION=1.08
-LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
-LIBLOCKFILE_PATCH:=liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
+
+LIBLOCKFILE_VERSION = 1.08
+LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
+LIBLOCKFILE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
+LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
 # No license file included, it refers to the gnu.org website
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 745fcfa..c574f5a 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-LIBRSVG_VERSION_MAJOR:=2.26
-LIBRSVG_VERSION_MINOR:=3
-LIBRSVG_VERSION:=$(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
-LIBRSVG_SOURCE:=librsvg-$(LIBRSVG_VERSION).tar.gz
-LIBRSVG_SITE:=http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
+LIBRSVG_VERSION_MAJOR = 2.26
+LIBRSVG_VERSION_MINOR = 3
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
+LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.gz
+LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 45b715b..d80385c 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -3,9 +3,10 @@
 # librsync
 #
 #############################################################
-LIBRSYNC_VERSION:=0.9.7
-LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
-LIBRSYNC_SITE:=http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
+
+LIBRSYNC_VERSION = 0.9.7
+LIBRSYNC_SOURCE = librsync-$(LIBRSYNC_VERSION).tar.gz
+LIBRSYNC_SITE = http://downloads.sourceforge.net/project/librsync/librsync/$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPLv2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 4fbb195..04ad695 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -21,9 +21,9 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBSYSFS_VERSION:=2.1.0
-LIBSYSFS_SITE:=http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
-LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
-LIBSYSFS_INSTALL_STAGING=YES
+LIBSYSFS_VERSION = 2.1.0
+LIBSYSFS_SITE = http://downloads.sourceforge.net/project/linux-diag/sysfsutils/$(LIBSYSFS_VERSION)
+LIBSYSFS_SOURCE = sysfsutils-$(LIBSYSFS_VERSION).tar.gz
+LIBSYSFS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 0934ffe..6f0b904 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -16,5 +16,5 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
-LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
-LIBTOOLIZE:=$(HOST_DIR)/usr/bin/libtoolize
+LIBTOOL = $(HOST_DIR)/usr/bin/libtool
+LIBTOOLIZE = $(HOST_DIR)/usr/bin/libtoolize
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index de9dc12..d4d281a 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -3,9 +3,10 @@
 # libungif
 #
 #############################################################
-LIBUNGIF_VERSION:=4.1.4
-LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
-LIBUNGIF_SITE:=http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
+
+LIBUNGIF_VERSION = 4.1.4
+LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
+LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
 LIBUNGIF_CONF_OPT = --without-x
 
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index a6f8ae9..996b10d 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -3,9 +3,10 @@
 # libxml-parser-perl
 #
 #############################################################
-LIBXML_PARSER_PERL_VERSION:=2.36
-LIBXML_PARSER_PERL_SOURCE:=XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
-LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
+
+LIBXML_PARSER_PERL_VERSION = 2.36
+LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
+LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML/
 
 LIBXML_PARSER_PERL_DEPENDENCIES = expat
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0394e29..923a813 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -53,4 +53,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # libxml2 for the host
-LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
+LIBXML2_HOST_BINARY = $(HOST_DIR)/usr/bin/xmllint
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index cbdb02a..03d5eb6 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -3,9 +3,10 @@
 # LiTE
 #
 #############################################################
-LITE_VERSION:=0.8.10
-LITE_SOURCE:=LiTE-$(LITE_VERSION).tar.gz
-LITE_SITE:=http://www.directfb.org/downloads/Libs
+
+LITE_VERSION = 0.8.10
+LITE_SOURCE = LiTE-$(LITE_VERSION).tar.gz
+LITE_SITE = http://www.directfb.org/downloads/Libs
 LITE_INSTALL_STAGING = YES
 LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 1932adb..65ef62b 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -3,9 +3,10 @@
 # lmbench
 #
 #############################################################
-LMBENCH_VERSION:=3.0-a9
-LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
-LMBENCH_SITE:=http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)/
+
+LMBENCH_VERSION = 3.0-a9
+LMBENCH_SOURCE = lmbench-$(LMBENCH_VERSION).tgz
+LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbench-$(LMBENCH_VERSION)/
 LMBENCH_LICENSE =  lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 4757605..1f58e63 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -20,9 +20,9 @@
 # License along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
-LRZSZ_VERSION:=0.12.20
-LRZSZ_SITE:=http://www.ohse.de/uwe/releases
-LRZSZ_SOURCE:=lrzsz-$(LRZSZ_VERSION).tar.gz
+LRZSZ_VERSION = 0.12.20
+LRZSZ_SITE = http://www.ohse.de/uwe/releases
+LRZSZ_SOURCE = lrzsz-$(LRZSZ_VERSION).tar.gz
 
 LRZSR_CONF_OPT = --disable-timesync
 
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index c219dc8..110437c 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -3,13 +3,14 @@
 # lzma
 #
 #############################################################
-LZMA_VERSION:=4.32.7
-LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
-LZMA_SITE:=http://tukaani.org/lzma/
+
+LZMA_VERSION = 4.32.7
+LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.gz
+LZMA_SITE = http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-LZMA=$(HOST_DIR)/usr/bin/lzma
+LZMA = $(HOST_DIR)/usr/bin/lzma
diff --git a/package/make/make.mk b/package/make/make.mk
index 02b2741..b67f944 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -3,9 +3,10 @@
 # make
 #
 #############################################################
-MAKE_VERSION:=3.81
-MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
-MAKE_SITE:=$(BR2_GNU_MIRROR)/make
+
+MAKE_VERSION = 3.81
+MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
+MAKE_SITE = $(BR2_GNU_MIRROR)/make
 
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 460cae5..7e93449 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -3,9 +3,10 @@
 # mdadm
 #
 #############################################################
-MDADM_VERSION:=2.6.9
-MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
-MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
+
+MDADM_VERSION = 2.6.9
+MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
+MDADM_SITE = http://www.kernel.org/pub/linux/utils/raid/mdadm
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index 9055951..e80726c 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -3,11 +3,12 @@
 # madplay
 #
 #############################################################
-MADPLAY_VERSION:=0.15.2b
-MADPLAY_SOURCE:=madplay-$(MADPLAY_VERSION).tar.gz
-MADPLAY_SITE:=http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
-MADPLAY_LIBTOOL_PATCH=NO
-MADPLAY_DEPENDENCIES=libmad libid3tag
+
+MADPLAY_VERSION = 0.15.2b
+MADPLAY_SOURCE = madplay-$(MADPLAY_VERSION).tar.gz
+MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
+MADPLAY_LIBTOOL_PATCH = NO
+MADPLAY_DEPENDENCIES = libmad libid3tag
 
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 4019563..356baf4 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -1,6 +1,6 @@
-TIDSP_BINARIES_VERSION=23.i3.8
-TIDSP_BINARIES_SOURCE=tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
-TIDSP_BINARIES_SITE:=http://gst-dsp.googlecode.com/files/
+TIDSP_BINARIES_VERSION = 23.i3.8
+TIDSP_BINARIES_SOURCE = tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
+TIDSP_BINARIES_SITE = http://gst-dsp.googlecode.com/files/
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 7513686..5f6cc4d 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-NETCAT_VERSION:=0.7.1
-NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
-NETCAT_SITE=http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
+NETCAT_VERSION = 0.7.1
+NETCAT_SOURCE = netcat-$(NETCAT_VERSION).tar.gz
+NETCAT_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 7a2b49e..a43a90c 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -4,16 +4,16 @@
 #
 #############################################################
 
-OLSR_VERSION_MAJOR=0.5
-OLSR_VERSION_MINOR=6
-OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
-OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
-OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
-OLSR_BINARY:=olsrd
-OLSR_TARGET_BINARY:=usr/sbin/olsrd
+OLSR_VERSION_MAJOR = 0.5
+OLSR_VERSION_MINOR = 6
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
+OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
+OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
+OLSR_BINARY = olsrd
+OLSR_TARGET_BINARY = usr/sbin/olsrd
 #OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
-OLSR_PLUGINS=dot_draw dyn_gw secure
-OLSR_TARGET_PLUGIN=usr/lib/
+OLSR_PLUGINS = dot_draw dyn_gw secure
+OLSR_TARGET_PLUGIN = usr/lib/
 
 define OLSR_BUILD_CMDS
  $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 6354ab7..05876dc 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -3,7 +3,8 @@
 # openocd
 #
 #############################################################
-OPENOCD_VERSION:=0.5.0
+
+OPENOCD_VERSION = 0.5.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b436ad8..ee1a88b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -66,7 +66,7 @@ endif
 
 
 ### Pixel depths
-QT_PIXEL_DEPTHS := # empty
+QT_PIXEL_DEPTHS = # empty
 ifeq ($(BR2_PACKAGE_QT_PIXEL_DEPTH_1),y)
 QT_PIXEL_DEPTHS += 1
 endif
@@ -432,7 +432,7 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
-QT_QMAKE:=$(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 8ec6a33..46d5679 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -3,12 +3,13 @@
 # SDL_image addon for SDL
 #
 #############################################################
-SDL_IMAGE_VERSION:=1.2.6
-SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
-SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
-SDL_IMAGE_INSTALL_STAGING:=YES
 
-SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
+SDL_IMAGE_VERSION = 1.2.6
+SDL_IMAGE_SOURCE = SDL_image-$(SDL_IMAGE_VERSION).tar.gz
+SDL_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
+SDL_IMAGE_INSTALL_STAGING = YES
+
+SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
 		--disable-static \
@@ -28,7 +29,7 @@ SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
 		--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no) \
 
-SDL_IMAGE_DEPENDENCIES:=sdl \
+SDL_IMAGE_DEPENDENCIES = sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_JPEG),jpeg) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index a116840..49a8323 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -29,4 +29,4 @@ $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # shared-mime-info for the host
-SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
+SHARED_MIME_INFO_HOST_BINARY = $(HOST_DIR)/usr/bin/update-mime-database
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 734609c..f900b92 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -3,9 +3,10 @@
 # udpcast
 #
 #############################################################
-UDPCAST_VERSION:=20071228
-UDPCAST_SOURCE:=udpcast-$(UDPCAST_VERSION).tar.gz
-UDPCAST_SITE:=http://www.udpcast.linux.lu/download
+
+UDPCAST_VERSION = 20071228
+UDPCAST_SOURCE = udpcast-$(UDPCAST_VERSION).tar.gz
+UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_CONF_ENV = $(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
 
 define UDPCAST_REMOVE_UDP_SENDER
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 2b24c68..7bc0a81 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -6,9 +6,10 @@
 # to enable that within busybox
 #
 #############################################################
-VTUN_VERSION:=3.0.2
-VTUN_SOURCE:=vtun-$(VTUN_VERSION).tar.gz
-VTUN_SITE:=http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
+
+VTUN_VERSION = 3.0.2
+VTUN_SOURCE = vtun-$(VTUN_VERSION).tar.gz
+VTUN_SITE = http://downloads.sourceforge.net/project/vtun/vtun/$(VTUN_VERSION)
 VTUN_DEPENDENCIES = zlib lzo openssl
 
 VTUN_CONF_OPT = \
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index f127138..3723839 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -12,11 +12,11 @@ ZLIB_LICENSE_FILES = README
 ZLIB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-ZLIB_PIC :=
-ZLIB_SHARED := --static
+ZLIB_PIC =
+ZLIB_SHARED = --static
 else
-ZLIB_PIC := -fPIC
-ZLIB_SHARED := --shared
+ZLIB_PIC = -fPIC
+ZLIB_SHARED = --shared
 endif
 
 define ZLIB_CONFIGURE_CMDS
-- 
1.7.9.5
