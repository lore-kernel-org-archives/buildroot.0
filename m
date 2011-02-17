From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Feb 2011 14:05:47 +0100
Subject: [Buildroot] [git commit master 1/1] package: apply libtool patch
	where possible
Message-ID: <20110217130822.2E5E78F5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0be744e49590c32a1fb9141f4a0ef617b62b27c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have libtool-2.2.x patch support, we can get rid of a bunch
of _LIBTOOL_PATH = NO, fixing (potential) cross link issues.

Notice: php not changed, as it uses a very old 1.5 version for the
embedded sqlite, where our buildroot-libtool-v1.5.patch doesn't apply.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk                                 |    1 -
 package/avahi/avahi.mk                             |    1 -
 package/cairo/cairo.mk                             |    1 -
 package/dbus/dbus.mk                               |    1 -
 package/enchant/enchant.mk                         |    1 -
 package/fakeroot/fakeroot.mk                       |    1 -
 package/gmpc/gmpc.mk                               |    1 -
 package/gpsd/gpsd.mk                               |    1 -
 package/gvfs/gvfs.mk                               |    1 -
 package/iperf/iperf.mk                             |    1 -
 package/jpeg/jpeg.mk                               |    1 -
 package/libarchive/libarchive.mk                   |    1 -
 package/libcgicc/libcgicc.mk                       |    1 -
 package/libdaemon/libdaemon.mk                     |    1 -
 package/libdrm/libdrm.mk                           |    1 -
 package/libevent/libevent.mk                       |    1 -
 package/libgail/libgail.mk                         |    1 -
 package/libglib2/libglib2.mk                       |    1 -
 package/libgpg-error/libgpg-error.mk               |    1 -
 package/libmicrohttpd/libmicrohttpd.mk             |    1 -
 package/librsvg/librsvg.mk                         |    1 -
 package/libsoup/libsoup.mk                         |    1 -
 package/libusb-compat/libusb-compat.mk             |    1 -
 package/libusb/libusb.mk                           |    1 -
 package/lighttpd/lighttpd.mk                       |    1 -
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    1 -
 .../matchbox-startup-monitor.mk                    |    1 -
 package/mdadm/mdadm.mk                             |    1 -
 package/nasm/nasm.mk                               |    1 -
 package/popt/popt.mk                               |    1 -
 package/quagga/quagga.mk                           |    1 -
 package/rpm/rpm.mk                                 |    1 -
 package/samba/samba.mk                             |    1 -
 package/sdl/sdl.mk                                 |    1 -
 package/sdl_gfx/sdl_gfx.mk                         |    1 -
 package/sdl_image/sdl_image.mk                     |    1 -
 package/sdl_mixer/sdl_mixer.mk                     |    1 -
 package/sdl_sound/sdl_sound.mk                     |    1 -
 package/sdl_ttf/sdl_ttf.mk                         |    1 -
 package/tcpreplay/tcpreplay.mk                     |    1 -
 package/tiff/tiff.mk                               |    1 -
 package/wpa_supplicant/wpa_supplicant.mk           |    1 -
 package/xz/xz.mk                                   |    1 -
 43 files changed, 0 insertions(+), 43 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 71937a9..0ac9b77 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -9,7 +9,6 @@ ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_TARGET = YES
-ATK_LIBTOOL_PATCH = NO
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 205554a..8c0d920 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -13,7 +13,6 @@
 AVAHI_VERSION = 0.6.27
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
-AVAHI_LIBTOOL_PATCH = NO
 AVAHI_INSTALL_STAGING = YES
 AVAHI_INSTALL_TARGET = YES
 
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 4f01493..7955e08 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -9,7 +9,6 @@ CAIRO_SITE = http://cairographics.org/releases
 CAIRO_AUTORECONF = NO
 CAIRO_INSTALL_STAGING = YES
 CAIRO_INSTALL_TARGET = YES
-CAIRO_LIBTOOL_PATCH = NO
 
 CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index f485ceb..153e72b 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,6 @@
 DBUS_VERSION = 1.2.24
 DBUS_SOURCE = dbus-$(DBUS_VERSION).tar.gz
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
-DBUS_LIBTOOL_PATCH = NO
 DBUS_INSTALL_STAGING = YES
 DBUS_INSTALL_TARGET = YES
 
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 9c12231..9be3f1a 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -9,7 +9,6 @@ ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_INSTALL_TARGET = YES
-ENCHANT_LIBTOOL_PATCH = NO
 
 ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index fd60dbe..347a641 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -6,7 +6,6 @@
 FAKEROOT_VERSION:=1.9.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://snapshot.debian.net/archive/2008/04/27/debian/pool/main/f/fakeroot/
-FAKEROOT_LIBTOOL_PATCH=NO
 
 define FAKEROOT_PATCH_FAKEROOT_IN
 	# If using busybox getopt, make it be quiet.
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 940f264..62c6427 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -6,7 +6,6 @@
 GMPC_VERSION = 0.17.0
 GMPC_SOURCE = gmpc-$(GMPC_VERSION).tar.gz
 GMPC_SITE = http://download.sarine.nl/download/Programs/gmpc/$(GMPC_VERSION)/
-GMPC_LIBTOOL_PATCH = NO
 GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
 		ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 35e2c7d..60f884b 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -8,7 +8,6 @@ GPSD_VERSION = 2.95
 GPSD_SITE = http://download.berlios.de/gpsd
 GPSD_INSTALL_STAGING = YES
 GPSD_CONF_OPT = --disable-static
-GPSD_LIBTOOL_PATCH = NO
 GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
 
 # Build libgpsmm if we've got C++
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 42c27fc..adfa966 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -12,7 +12,6 @@ GVFS_INSTALL_STAGING = NO
 GVFS_INSTALL_TARGET = YES
 GVFS_AUTORECONF = NO
 GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
-GVFS_LIBTOOL_PATCH = NO
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 843b53b..769923f 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -8,7 +8,6 @@ IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
 
 IPERF_AUTORECONF = NO
-FETCHMAIL_LIBTOOL_PATCH = NO
 
 IPERF_INSTALL_STAGING = NO
 IPERF_INSTALL_TARGET = YES
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 6baa64b..8919a3a 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -8,7 +8,6 @@ JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
-JPEG_LIBTOOL_PATCH = NO
 JPEG_CONF_OPT = --program-prefix=
 
 define JPEG_REMOVE_USELESS_TOOLS
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index efd1656..0038cd3 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -6,7 +6,6 @@
 LIBARCHIVE_VERSION = 2.7.1
 LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
-LIBARCHIVE_LIBTOOL_PATCH = NO
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_INSTALL_TARGET = YES
 
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index b281eed..dbc9073 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -7,7 +7,6 @@ LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_INSTALL_STAGING=YES
-LIBCGICC_LIBTOOL_PATCH=NO
 LIBCGICC_AUTORECONF=YES
 
 LIBCGICC_CONF_OPT = \
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 9a78bff..6972a71 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -8,7 +8,6 @@ LIBDAEMON_VERSION = 0.14
 LIBDAEMON_SOURCE = libdaemon-$(LIBDAEMON_VERSION).tar.gz
 LIBDAEMON_SITE = http://0pointer.de/lennart/projects/libdaemon/
 LIBDAEMON_AUTORECONF = NO
-LIBDAEMON_LIBTOOL_PATCH = NO
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 38cb636..fe7a46f 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -6,7 +6,6 @@
 LIBDRM_VERSION = 2.4.19
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm/
-LIBDRM_LIBTOOL_PATCH = NO
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = xproto_glproto xproto_xf86vidmodeproto xlib_libXxf86vm xlib_libXmu xproto_dri2proto pthread-stubs
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 4df6270..ba9769f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -8,7 +8,6 @@ LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = http://monkey.org/~provos/
 
 LIBEVENT_AUTORECONF = NO
-LIBEVENT_LIBTOOL_PATCH = NO
 LIBEVENT_INSTALL_STAGING = YES
 LIBEVENT_INSTALL_TARGET = YES
 
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index ef08b66..7e498f1 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -10,7 +10,6 @@ LIBGAIL_SOURCE = gail-$(LIBGAIL_VERSION).tar.bz2
 LIBGAIL_SITE = http://ftp.gnome.org/pub/gnome/sources/gail/$(LIBGAIL_VERSION_MAJOR)
 
 LIBGAIL_AUTORECONF = YES
-LIBGAIL_LIBTOOL_PATCH = NO
 LIBGAIL_INSTALL_STAGING = YES
 LIBGAIL_INSTALL_TARGET = YES
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 3f24d6d..57facfc 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -9,7 +9,6 @@ LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
-LIBGLIB2_LIBTOOL_PATCH = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 89ff24c..ab62d73 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -7,7 +7,6 @@ LIBGPG_ERROR_VERSION:=1.8
 LIBGPG_ERROR_SOURCE:=libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
 
-LIBGPG_ERROR_LIBTOOL_PATCH = NO
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package,libgpg-error))
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index b62f117..8273d90 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -6,7 +6,6 @@
 LIBMICROHTTPD_VERSION:=0.4.2
 LIBMICROHTTPD_SOURCE:=libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
 LIBMICROHTTPD_SITE:=$(BR2_GNU_MIRROR)/libmicrohttpd
-LIBMICROHTTPD_LIBTOOL_PATCH = NO
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
 LIBMICROHTTPD_DEPENDENCIES = libgcrypt
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 98bb25c..daa34ab 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -11,7 +11,6 @@ LIBRSVG_SOURCE:=librsvg-$(LIBRSVG_VERSION).tar.gz
 LIBRSVG_SITE:=http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)/
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_INSTALL_TARGET = YES
-LIBRSVG_LIBTOOL_PATCH = NO
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 2c9a486..132ea34 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -9,7 +9,6 @@ LIBSOUP_VERSION:=$(LIBSOUP_MAJOR_VERSION).2
 LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.bz2
 LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_MAJOR_VERSION)
 LIBSOUP_INSTALL_STAGING = YES
-LIBSOUP_LIBTOOL_PATCH = NO
 
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
 
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 6590e89..1668614 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -6,7 +6,6 @@
 LIBUSB_COMPAT_VERSION = 0.1.3
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
-LIBUSB_COMPAT_LIBTOOL_PATCH = NO
 LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_INSTALL_TARGET = YES
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 141633b..050e2ba 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -6,7 +6,6 @@
 LIBUSB_VERSION = 1.0.8
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
-LIBUSB_LIBTOOL_PATCH = NO
 LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 LIBUSB_INSTALL_TARGET = YES
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 7d8708a..67cd272 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -6,7 +6,6 @@
 
 LIGHTTPD_VERSION = 1.4.28
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
-LIGHTTPD_LIBTOOL_PATCH = NO
 
 LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index bcb6cc0..dc448b8 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -7,7 +7,6 @@
 MATCHBOX_FAKEKEY_VERSION = 0.1
 MATCHBOX_FAKEKEY_SOURCE = libfakekey-$(MATCHBOX_FAKEKEY_VERSION).tar.bz2
 MATCHBOX_FAKEKEY_SITE = http://matchbox-project.org/sources/libfakekey/$(MATCHBOX_FAKEKEY_VERSION)
-MATCHBOX_FAKEKEY_LIBTOOL_PATCH = NO
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
 MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 8f3d7ca..954709a 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -7,7 +7,6 @@
 MATCHBOX_STARTUP_MONITOR_VERSION = 0.1
 MATCHBOX_STARTUP_MONITOR_SOURCE = mb-applet-startup-monitor-$(MATCHBOX_STARTUP_MONITOR_VERSION).tar.bz2
 MATCHBOX_STARTUP_MONITOR_SITE = http://matchbox-project.org/sources/mb-applet-startup-monitor/$(MATCHBOX_STARTUP_MONITOR_VERSION)
-MATCHBOX_STARTUP_MONITOR_LIBTOOL_PATCH = NO
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
 MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 3b71724..fbd5f16 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -8,7 +8,6 @@ MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
 
 MDADM_AUTORECONF = NO
-MDADM_LIBTOOL_PATCH = NO
 
 MDADM_INSTALL_STAGING = NO
 MDADM_INSTALL_TARGET = YES
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 08983e1..03e8394 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -13,7 +13,6 @@
 NASM_VERSION=2.08.01
 NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
 NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
-NASM_LIBTOOL_PATCH=NO
 
 $(eval $(call AUTOTARGETS,package,nasm))
 $(eval $(call AUTOTARGETS,package,nasm,host))
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index ed8cddd..0f9d313 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -8,7 +8,6 @@ POPT_SITE:=http://rpm5.org/files/popt
 POPT_INSTALL_STAGING = YES
 POPT_INSTALL_TARGET = YES
 
-POPT_LIBTOOL_PATCH = NO
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index c1eeee8..d2b1444 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -8,7 +8,6 @@ QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download/
 
 QUAGGA_DEPENDENCIES = host-gawk
-QUAGGA_LIBTOOL_PATCH = NO
 QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
 
 ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 778982a..1a4c10b 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -6,7 +6,6 @@
 RPM_VERSION = 5.2.0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
 RPM_AUTORECONF = NO
-RPM_LIBTOOL_PATCH = NO
 
 RPM_DEPENDENCIES = zlib beecrypt neon popt
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index f6d2d53..f61444d 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -9,7 +9,6 @@ SAMBA_SITE:=http://samba.org/samba/ftp/stable/
 
 SAMBA_SUBDIR = source
 SAMBA_AUTORECONF = NO
-SAMBA_LIBTOOL_PATCH = NO
 
 SAMBA_INSTALL_STAGING = YES
 SAMBA_INSTALL_TARGET = YES
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 4fd3ad4..8d9d8ae 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -7,7 +7,6 @@ SDL_VERSION:=1.2.14
 SDL_SOURCE:=SDL-$(SDL_VERSION).tar.gz
 SDL_SITE:=http://www.libsdl.org/release
 
-SDL_LIBTOOL_PATCH = NO
 SDL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index bbfd99f..c5a6d7e 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -6,7 +6,6 @@
 SDL_GFX_VERSION:=2.0.19
 SDL_GFX_SOURCE:=SDL_gfx-$(SDL_GFX_VERSION).tar.gz
 SDL_GFX_SITE:=http://www.ferzkopp.net/Software/SDL_gfx-2.0/
-SDL_GFX_LIBTOOL_PATCH:=NO
 SDL_GFX_INSTALL_STAGING:=YES
 SDL_GFX_INSTALL_TARGET:=YES
 
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index 772bb86..ab838b1 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -6,7 +6,6 @@
 SDL_IMAGE_VERSION:=1.2.6
 SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
 SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
-SDL_IMAGE_LIBTOOL_PATCH:=NO
 SDL_IMAGE_INSTALL_STAGING:=YES
 SDL_IMAGE_INSTALL_TARGET:=YES
 
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index c7135ba..01129fa 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -7,7 +7,6 @@ SDL_MIXER_VERSION:=1.2.11
 SDL_MIXER_SOURCE:=SDL_mixer-$(SDL_MIXER_VERSION).tar.gz
 SDL_MIXER_SITE:=http://www.libsdl.org/projects/SDL_mixer/release/
 
-SDL_MIXER_LIBTOOL_PATCH = NO
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
 SDL_MIXER_CONF_OPT = \
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 6c45fcf..8f51e05 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -6,7 +6,6 @@
 SDL_SOUND_VERSION:=1.0.3
 SDL_SOUND_SOURCE:=SDL_sound-$(SDL_SOUND_VERSION).tar.gz
 SDL_SOUND_SITE:=http://icculus.org/SDL_sound/downloads/
-SDL_SOUND_LIBTOOL_PATCH:=NO
 SDL_SOUND_INSTALL_STAGING:=YES
 SDL_SOUND_INSTALL_TARGET:=YES
 SDL_SOUND_DEPENDENCIES = sdl
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 7ff5cb8..0a8a9e9 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -7,7 +7,6 @@ SDL_TTF_VERSION:=2.0.9
 SDL_TTF_SOURCE:=SDL_ttf-$(SDL_TTF_VERSION).tar.gz
 SDL_TTF_SITE:=http://www.libsdl.org/projects/SDL_ttf/release/
 
-SDL_TTF_LIBTOOL_PATCH = NO
 SDL_TTF_INSTALL_STAGING = YES
 SDL_TTF_DEPENDENCIES = sdl freetype
 SDL_TTF_CONF_OPT = --without-x \
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 52b0b35..f82867c 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -6,7 +6,6 @@
 
 TCPREPLAY_VERSION = 3.4.3
 TCPREPLAY_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/tcpreplay
-TCPREPLAY_LIBTOOL_PATCH = NO
 TCPREPLAY_CONF_ENV = tr_cv_libpcap_version=">= 0.7.0"
 TCPREPLAY_CONF_OPT = --program-prefix="" --with-libpcap=$(STAGING_DIR)/usr
 
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 748e58f..55acf24 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -6,7 +6,6 @@
 TIFF_VERSION:=3.9.4
 TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
 TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
-TIFF_LIBTOOL_PATCH = NO
 TIFF_INSTALL_STAGING = YES
 TIFF_INSTALL_TARGET = YES
 TIFF_CONF_OPT = \
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index bfd20ab..698e365 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -6,7 +6,6 @@
 
 WPA_SUPPLICANT_VERSION = 0.7.3
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
-WPA_SUPPLICANT_LIBTOOL_PATCH = NO
 WPA_SUPPLICANT_DEPENDENCIES =
 WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
 WPA_SUPPLICANT_SUBDIR = wpa_supplicant
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index a965d8a..2da8fcb 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -7,7 +7,6 @@ XZ_VERSION = 5.0.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
-XZ_LIBTOOL_PATCH = NO
 
 $(eval $(call AUTOTARGETS,package,xz))
 $(eval $(call AUTOTARGETS,package,xz,host))
-- 
1.7.3.4
