From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 22:30:33 +0100
Subject: [Buildroot] [git commit] packages: remove redundant
	INSTALL_TARGET=YES declarations
Message-ID: <20120311213936.CFD6590D42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ae23e391146914b3ae29294210e15d7be0e7b61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/at/at.mk                                   |    1 -
 package/atk/atk.mk                                 |    1 -
 package/avahi/avahi.mk                             |    1 -
 package/blackbox/blackbox.mk                       |    1 -
 package/dbus-python/dbus-python.mk                 |    1 -
 package/directfb-examples/directfb-examples.mk     |    1 -
 package/divine/divine.mk                           |    1 -
 package/docker/docker.mk                           |    1 -
 package/enchant/enchant.mk                         |    3 ---
 package/fltk/fltk.mk                               |    1 -
 package/fontconfig/fontconfig.mk                   |    1 -
 package/games/rubix/rubix.mk                       |    1 -
 package/gqview/gqview.mk                           |    2 --
 package/gtkperf/gtkperf.mk                         |    1 -
 package/gvfs/gvfs.mk                               |    1 -
 package/iperf/iperf.mk                             |    1 -
 package/ipkg/ipkg.mk                               |    1 -
 package/jpeg/jpeg.mk                               |    1 -
 package/leafpad/leafpad.mk                         |    2 --
 package/libarchive/libarchive.mk                   |    1 -
 package/libconfig/libconfig.mk                     |    1 -
 package/libdnet/libdnet.mk                         |    1 -
 package/libevent/libevent.mk                       |    1 -
 package/libgail/libgail.mk                         |    2 --
 package/librsvg/librsvg.mk                         |    1 -
 package/librsync/librsync.mk                       |    2 --
 package/libsexy/libsexy.mk                         |    1 -
 package/libsvgtiny/libsvgtiny.mk                   |    2 --
 package/libungif/libungif.mk                       |    2 --
 package/libusb-compat/libusb-compat.mk             |    1 -
 package/lite/lite.mk                               |    1 -
 package/lzma/lzma.mk                               |    1 -
 package/mdadm/mdadm.mk                             |    1 -
 package/midori/midori.mk                           |    2 --
 package/multimedia/alsa-lib/alsa-lib.mk            |    1 -
 package/multimedia/libcdaudio/libcdaudio.mk        |    1 -
 package/multimedia/libdvdnav/libdvdnav.mk          |    1 -
 package/multimedia/libdvdread/libdvdread.mk        |    1 -
 package/multimedia/live555/live555.mk              |    1 -
 package/multimedia/speex/speex.mk                  |    1 -
 package/mysql_client/mysql_client.mk               |    1 -
 package/netcat/netcat.mk                           |    1 -
 package/ngrep/ngrep.mk                             |    1 -
 package/pango/pango.mk                             |    1 -
 package/pcmanfm/pcmanfm.mk                         |    1 -
 package/readline/readline.mk                       |    3 ---
 package/samba/samba.mk                             |    1 -
 package/sdl_gfx/sdl_gfx.mk                         |    3 ---
 package/sdl_image/sdl_image.mk                     |    1 -
 package/sdl_sound/sdl_sound.mk                     |    1 -
 .../startup-notification/startup-notification.mk   |    2 --
 package/torsmo/torsmo.mk                           |    1 -
 package/x11r7/xapp_xman/xapp_xman.mk               |    1 -
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    1 -
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    1 -
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    1 -
 package/x11vnc/x11vnc.mk                           |    2 --
 package/xvkbd/xvkbd.mk                             |    1 -
 58 files changed, 0 insertions(+), 73 deletions(-)

diff --git a/package/at/at.mk b/package/at/at.mk
index 92fb838..c9d503a 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -9,7 +9,6 @@ AT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/a/at
 # missing deps for parsetime.l
 AT_MAKE = $(MAKE1)
 AT_AUTORECONF = YES
-AT_INSTALL_TARGET = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex)
 
 AT_CONF_OPT = \
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index d84d08c..4ac96ff 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -8,7 +8,6 @@ ATK_VERSION = $(ATK_VERSION_MAJOR).6
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_INSTALL_STAGING = YES
-ATK_INSTALL_TARGET = YES
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 3392614..32e3df7 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -14,7 +14,6 @@ AVAHI_VERSION = 0.6.31
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
-AVAHI_INSTALL_TARGET = YES
 
 AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index fd75255..600ba6c 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,7 +7,6 @@
 BLACKBOX_VERSION:=0.70.1
 BLACKBOX_SOURCE:=blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
-BLACKBOX_INSTALL_TARGET:=YES
 
 BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d027f2f..83e3aee 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -7,7 +7,6 @@ DBUS_PYTHON_VERSION = 0.83.0
 DBUS_PYTHON_SOURCE = dbus-python-$(DBUS_PYTHON_VERSION).tar.gz
 DBUS_PYTHON_SITE = http://dbus.freedesktop.org/releases/dbus-python/
 DBUS_PYTHON_INSTALL_STAGING = YES
-DBUS_PYTHON_INSTALL_TARGET = YES
 
 DBUS_PYTHON_CONF_ENV = am_cv_pathless_PYTHON=python \
 		ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python \
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index cea1eb2..d8e61f7 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -7,7 +7,6 @@ DIRECTFB_EXAMPLES_VERSION:=1.2.0
 DIRECTFB_EXAMPLES_SITE:=http://www.directfb.org/downloads/Extras
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
-DIRECTFB_EXAMPLES_INSTALL_TARGET = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
 DIRECTFB_EXAMPLES_TARGETS_ :=
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 0b60adc..3e8d093 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -8,7 +8,6 @@ DIVINE_VERSION := 0.4.0
 DIVINE_SITE := http://www.directfb.org/downloads/Extras
 DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
-DIVINE_INSTALL_TARGET = YES
 DIVINE_DEPENDENCIES = directfb
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index ce25e4d..fd12cce 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -6,7 +6,6 @@
 DOCKER_VERSION = 1.5
 DOCKER_SOURCE = docker-$(DOCKER_VERSION).tar.gz
 DOCKER_SITE = http://icculus.org/openbox/2/docker
-DOCKER_INSTALL_TARGET = YES
 
 DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
 					CFLAGS="-I$(STAGING_DIR)/usr/include \
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index e29137a..9d7ae0e 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -6,10 +6,7 @@
 ENCHANT_VERSION = 1.5.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
-
 ENCHANT_INSTALL_STAGING = YES
-ENCHANT_INSTALL_TARGET = YES
-
 ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index ea2bef0..1686a58 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -8,7 +8,6 @@ FLTK_VERSION = 1.1.7
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
 FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7/
 FLTK_INSTALL_STAGING = YES
-FLTK_INSTALL_TARGET = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 39815ed..329f819 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -8,7 +8,6 @@ FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
-FONTCONFIG_INSTALL_TARGET = YES
 # This package does not like using the target cflags for some reason.
 FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"
 
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 5248b9e..a66e6e1 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -6,7 +6,6 @@
 RUBIX_VERSION = 1.0.5
 RUBIX_SOURCE = rubix-$(RUBIX_VERSION).tar.bz2
 RUBIX_SITE = http://avr32linux.org/twiki/pub/Main/Rubix
-RUBIX_INSTALL_TARGET = YES
 RUBIX_INSTALL_TARGET_OPT = GAMESDIR=$(TARGET_DIR)/usr/games install
 
 RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB="-L$(STAGING_DIR)/usr/lib -lX11"
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index a86d895..b87ad76 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -6,8 +6,6 @@
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
-GQVIEW_INSTALL_TARGET = YES
-
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index cf13594..5459e69 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -6,7 +6,6 @@
 GTKPERF_VERSION:=0.40
 GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
-GTKPERF_INSTALL_TARGET = YES
 GTKPERF_DEPENDENCIES = libgtk2
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 05a54a3..f56c14a 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -9,7 +9,6 @@ GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_INSTALL_TARGET = YES
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 7f6b1b8..26cd3fb 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -6,7 +6,6 @@
 IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
-IPERF_INSTALL_TARGET = YES
 
 IPERF_CONF_ENV = \
 	ac_cv_func_malloc_0_nonnull=yes \
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 6d5ff5d..ecb97b6 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -8,6 +8,5 @@ IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
-IPKG_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index a882268..a652381 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -7,7 +7,6 @@ JPEG_VERSION = 8d
 JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
-JPEG_INSTALL_TARGET = YES
 
 define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 56c25df..7e4d179 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -6,8 +6,6 @@
 LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_INSTALL_TARGET = YES
-
 LEAFPAD_DEPENDENCIES = libgtk2
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index c9e5d07..087032d 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -7,7 +7,6 @@ LIBARCHIVE_VERSION = 2.8.5
 LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
-LIBARCHIVE_INSTALL_TARGET = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBARCHIVE_DEPENDENCIES = zlib
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 38e9a59..03825e1 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -7,7 +7,6 @@ LIBCONFIG_VERSION:=1.4.6
 LIBCONFIG_SOURCE:=libconfig-$(LIBCONFIG_VERSION).tar.gz
 LIBCONFIG_SITE:=http://www.hyperrealm.com/libconfig/
 LIBCONFIG_INSTALL_STAGING:=YES
-LIBCONFIG_INSTALL_TARGET:=YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT:=--disable-cxx
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 3786bb8..f351d6b 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -8,7 +8,6 @@ LIBDNET_VERSION = 1.11
 LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
 LIBDNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdnet/
 LIBDNET_INSTALL_STAGING = YES
-LIBDNET_INSTALL_TARGET = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPT = \
 	--with-gnu-ld \
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 73ad2b0..733e29d 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -7,7 +7,6 @@ LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
-LIBEVENT_INSTALL_TARGET = YES
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index cc3c2ff..3c42e6c 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -8,10 +8,8 @@ LIBGAIL_VERSION_MINOR = 3
 LIBGAIL_VERSION = $(LIBGAIL_VERSION_MAJOR).$(LIBGAIL_VERSION_MINOR)
 LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
 LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
-
 LIBGAIL_AUTORECONF = YES
 LIBGAIL_INSTALL_STAGING = YES
-LIBGAIL_INSTALL_TARGET = YES
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 LIBGAIL_CONF_OPT += --disable-x
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index de73f6e..f5c223e 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,7 +10,6 @@ LIBRSVG_VERSION:=$(LIBRSVG_VERSION_MAJOR).$(LIBRSVG_VERSION_MINOR)
 LIBRSVG_SOURCE:=librsvg-$(LIBRSVG_VERSION).tar.gz
 LIBRSVG_SITE:=http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_INSTALL_TARGET = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
 
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 5019af7..0d765ea 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -7,8 +7,6 @@ LIBRSYNC_VERSION:=0.9.7
 LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
 LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
 LIBRSYNC_INSTALL_STAGING = YES
-LIBRSYNC_INSTALL_TARGET = YES
-
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 9f33d29..905089b 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -8,7 +8,6 @@ LIBSEXY_VERSION = 0.1.11
 LIBSEXY_SOURCE = libsexy-$(LIBSEXY_VERSION).tar.gz
 LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
-LIBSEXY_INSTALL_TARGET = YES
 LIBSEXY_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 275ae74..f53f88f 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -6,9 +6,7 @@
 
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
 LIBSVGTINY_VERSION = 12121
-
 LIBSVGTINY_INSTALL_STAGING = YES
-LIBSVGTINY_INSTALL_TARGET = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkg-config
 
 define LIBSVGTINY_BUILD_CMDS
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 100c5b9..3484ec4 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -7,8 +7,6 @@ LIBUNGIF_VERSION:=4.1.4
 LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/giflib
 LIBUNGIF_INSTALL_STAGING = YES
-LIBUNGIF_INSTALL_TARGET = YES
-
 LIBUNGIF_CONF_OPT = --without-x
 
 LIBUNGIF_BINS = gif2epsn gif2ps gif2rgb gif2x11 gifasm gifbg gifburst gifclip \
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 4f16489..42a9aae 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -8,7 +8,6 @@ LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
-LIBUSB_COMPAT_INSTALL_TARGET = YES
 
 define LIBUSB_COMPAT_FIXUP_CONFIG
 	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 9b840e2..d331d9d 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -7,7 +7,6 @@ LITE_VERSION:=0.8.10
 LITE_SOURCE:=LiTE-$(LITE_VERSION).tar.gz
 LITE_SITE:=http://www.directfb.org/downloads/Libs
 LITE_INSTALL_STAGING = YES
-LITE_INSTALL_TARGET = YES
 LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 4614116..e195049 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -7,7 +7,6 @@ LZMA_VERSION:=4.32.7
 LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
 LZMA_SITE:=http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
-LZMA_INSTALL_TARGET = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 4d8e1af..39dbea0 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -6,7 +6,6 @@
 MDADM_VERSION:=2.6.9
 MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
-MDADM_INSTALL_TARGET = YES
 
 MDADM_MAKE_OPT = \
 	CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MDADM_DIR) mdadm
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 99b5a48..3e46b1a 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -7,8 +7,6 @@
 MIDORI_VERSION = 0.3.6
 MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.3/
-MIDORI_INSTALL_TARGET = YES
-
 MIDORI_DEPENDENCIES = host-pkg-config host-intltool webkit libsexy libgtk2
 
 ifneq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 62a3b1d..aa6ca51 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -7,7 +7,6 @@ ALSA_LIB_VERSION = 1.0.24.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_INSTALL_STAGING = YES
-ALSA_LIB_INSTALL_TARGET = YES
 
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 
diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/multimedia/libcdaudio/libcdaudio.mk
index d240c07..8ceb87a 100644
--- a/package/multimedia/libcdaudio/libcdaudio.mk
+++ b/package/multimedia/libcdaudio/libcdaudio.mk
@@ -10,6 +10,5 @@ LIBCDAUDIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/li
 LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
-LIBCDAUDIO_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
index 4e9a92b..7f68533 100644
--- a/package/multimedia/libdvdnav/libdvdnav.mk
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -9,7 +9,6 @@ LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
 LIBDVDNAV_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
-LIBDVDNAV_INSTALL_TARGET = YES
 
 LIBDVDNAV_DEPENDENCIES = libdvdread
 
diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/multimedia/libdvdread/libdvdread.mk
index 3f456ef..5226414 100644
--- a/package/multimedia/libdvdread/libdvdread.mk
+++ b/package/multimedia/libdvdread/libdvdread.mk
@@ -10,6 +10,5 @@ LIBDVDREAD_SITE = http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
 LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
-LIBDVDREAD_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/live555/live555.mk b/package/multimedia/live555/live555.mk
index 9e0ef14..c987fa2 100644
--- a/package/multimedia/live555/live555.mk
+++ b/package/multimedia/live555/live555.mk
@@ -8,7 +8,6 @@ LIVE555_VERSION = 2011.06.16
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 LIVE555_SITE = http://www.live555.com/liveMedia/public/
 LIVE555_INSTALL_STAGING = YES
-LIVE555_INSTALL_TARGET = YES
 
 define LIVE555_CONFIGURE_CMDS
 	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(TARGET_CFLAGS)' >> $(@D)/config.linux
diff --git a/package/multimedia/speex/speex.mk b/package/multimedia/speex/speex.mk
index 0aca871..c9d9ed3 100644
--- a/package/multimedia/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -7,7 +7,6 @@ SPEEX_VERSION=1.2rc1
 SPEEX_SOURCE=speex-$(SPEEX_VERSION).tar.gz
 SPEEX_SITE=http://downloads.us.xiph.org/releases/speex
 SPEEX_INSTALL_STAGING = YES
-SPEEX_INSTALL_TARGET = YES
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 9addf33..7097016 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -6,7 +6,6 @@
 MYSQL_CLIENT_VERSION = 5.1.53
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.mysql.com/archives/mysql-5.1/
-MYSQL_CLIENT_INSTALL_TARGET = YES
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
 MYSQL_CLIENT_AUTORECONF=YES
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index a668e9a..bc58af2 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -7,6 +7,5 @@
 NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
-NETCAT_INSTALL_TARGET:=YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index e4ee525..e9c640a 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -8,7 +8,6 @@ NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ngrep/ngrep/$(NGREP_VERSION)
 NGREP_INSTALL_STAGING = YES
-NGREP_INSTALL_TARGET = YES
 NGREP_CONF_ENV = LDFLAGS="-lpcre"
 NGREP_CONF_OPT =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 2691b88..f46bdc6 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -11,7 +11,6 @@ PANGO_SOURCE = pango-$(PANGO_VERSION).tar.bz2
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
-PANGO_INSTALL_TARGET = YES
 
 PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index d1d3377..f2112f0 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -6,7 +6,6 @@
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
-PCMANFM_INSTALL_TARGET = YES
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 03a5377..cd9946e 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -8,10 +8,7 @@ READLINE_VERSION = 6.2
 READLINE_SOURCE = readline-$(READLINE_VERSION).tar.gz
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
-READLINE_INSTALL_TARGET = YES
-
 READLINE_DEPENDENCIES = ncurses
-
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes
 
 define READLINE_INSTALL_TARGET_CMDS
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 5887065..c15efca 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -8,7 +8,6 @@ SAMBA_VERSION = 3.5.12
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-SAMBA_INSTALL_TARGET = YES
 
 
 SAMBA_DEPENDENCIES = \
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index b8c5d80..a25987d 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -7,10 +7,7 @@ SDL_GFX_VERSION:=2.0.19
 SDL_GFX_SOURCE:=SDL_gfx-$(SDL_GFX_VERSION).tar.gz
 SDL_GFX_SITE:=http://www.ferzkopp.net/Software/SDL_gfx-2.0/
 SDL_GFX_INSTALL_STAGING:=YES
-SDL_GFX_INSTALL_TARGET:=YES
-
 SDL_GFX_DEPENDENCIES:=sdl
-
 SDL_GFX_CONF_OPT = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 8dec472..b93dc08 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -7,7 +7,6 @@ SDL_IMAGE_VERSION:=1.2.6
 SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
 SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
 SDL_IMAGE_INSTALL_STAGING:=YES
-SDL_IMAGE_INSTALL_TARGET:=YES
 
 SDL_IMAGE_CONF_OPT:=--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 7075967..f95d6bc 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -7,7 +7,6 @@ SDL_SOUND_VERSION:=1.0.3
 SDL_SOUND_SOURCE:=SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE:=http://icculus.org/SDL_sound/downloads/
 SDL_SOUND_INSTALL_STAGING:=YES
-SDL_SOUND_INSTALL_TARGET:=YES
 SDL_SOUND_DEPENDENCIES = sdl
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index cbcaad3..60778ca 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -7,9 +7,7 @@ STARTUP_NOTIFICATION_VERSION = 0.9
 STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
 STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
-STARTUP_NOTIFICATION_INSTALL_TARGET = YES
 STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
-
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index fb97639..df97c5e 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -6,7 +6,6 @@
 TORSMO_VERSION = 0.18
 TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
 TORSMO_SITE = http://avr32linux.org/twiki/pub/Main/Torsmo
-TORSMO_INSTALL_TARGET = YES
 
 # help2man doesn't work when cross compiling
 TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 6caaf3f..c14a5ba 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -6,7 +6,6 @@
 XAPP_XMAN_VERSION:=1.0.3
 XAPP_XMAN_SOURCE:=xman-$(XAPP_XMAN_VERSION).tar.bz2
 XAPP_XMAN_SITE:=http://xorg.freedesktop.org/releases/individual/app
-XAPP_XMAN_INSTALL_TARGET = YES
 XAPP_XMAN_DEPENDENCIES = xlib_libXaw
 
 XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index b94531b..52b21ea 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -8,6 +8,5 @@ XDATA_XBITMAPS_VERSION = 1.1.0
 XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XBITMAPS_INSTALL_STAGING = YES
-XDATA_XBITMAPS_INSTALL_TARGET = YES
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index c954bec..08a8855 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -7,7 +7,6 @@ XDATA_XCURSOR_THEMES_VERSION = 1.0.2
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
-XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index fd3f02d..453f862 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -6,7 +6,6 @@
 XKEYBOARD_CONFIG_VERSION = 2.0
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-config/
-XKEYBOARD_CONFIG_INSTALL_TARGET = YES
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 0fc885c..f130e42 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -6,8 +6,6 @@
 X11VNC_VERSION = 0.9.3
 X11VNC_SOURCE = x11vnc-$(X11VNC_VERSION).tar.gz
 X11VNC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libvncserver
-X11VNC_INSTALL_TARGET = YES
-
 X11VNC_CONF_OPT = \
 	--without-avahi
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 7e03c93..8b03e65 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -6,7 +6,6 @@
 XVKBD_VERSION = 3.2
 XVKBD_SOURCE = xvkbd-$(XVKBD_VERSION).tar.gz
 XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
-XVKBD_INSTALL_TARGET = YES
 
 XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 				CFLAGS="-O2 -I$(STAGING_DIR)/usr/include" USRLIBDIR="$(STAGING_DIR)/usr/lib"
