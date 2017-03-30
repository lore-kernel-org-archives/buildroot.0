From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:37 +0530
Subject: [Buildroot] [PATCH 08/21] package: use SPDX short identifier for
	LGPLv2/LGPLv2+
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-9-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for LGPLv2/LGPLv2+ is LGPL-2.0/LGPL-2.0+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/LGPLv2(\+)?/LGPL-2.0\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/argp-standalone/argp-standalone.mk                | 2 +-
 package/atk/atk.mk                                        | 2 +-
 package/cairomm/cairomm.mk                                | 2 +-
 package/cups/cups.mk                                      | 2 +-
 package/fltk/fltk.mk                                      | 2 +-
 package/gamin/gamin.mk                                    | 2 +-
 package/gdb/gdb.mk                                        | 2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                          | 2 +-
 package/glib-networking/glib-networking.mk                | 2 +-
 package/gssdp/gssdp.mk                                    | 2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk                | 2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk      | 2 +-
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk    | 2 +-
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk    | 2 +-
 package/gstreamer1/gst1-imx/gst1-imx.mk                   | 2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 2 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk               | 2 +-
 package/gupnp-av/gupnp-av.mk                              | 2 +-
 package/gupnp-dlna/gupnp-dlna.mk                          | 2 +-
 package/gupnp/gupnp.mk                                    | 2 +-
 package/gvfs/gvfs.mk                                      | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk                  | 2 +-
 package/lame/lame.mk                                      | 2 +-
 package/lesstif/lesstif.mk                                | 2 +-
 package/libargtable2/libargtable2.mk                      | 2 +-
 package/libart/libart.mk                                  | 2 +-
 package/libcddb/libcddb.mk                                | 2 +-
 package/libftdi1/libftdi1.mk                              | 2 +-
 package/libglade/libglade.mk                              | 2 +-
 package/libglib2/libglib2.mk                              | 2 +-
 package/libgtk2/libgtk2.mk                                | 2 +-
 package/libgtk3/libgtk3.mk                                | 2 +-
 package/libiconv/libiconv.mk                              | 2 +-
 package/liblockfile/liblockfile.mk                        | 2 +-
 package/libmbim/libmbim.mk                                | 2 +-
 package/libmhash/libmhash.mk                              | 2 +-
 package/libqmi/libqmi.mk                                  | 2 +-
 package/librsvg/librsvg.mk                                | 2 +-
 package/libshout/libshout.mk                              | 2 +-
 package/libsoup/libsoup.mk                                | 2 +-
 package/libsvg/libsvg.mk                                  | 2 +-
 package/libxmlpp/libxmlpp.mk                              | 2 +-
 package/mariadb/mariadb.mk                                | 2 +-
 package/modem-manager/modem-manager.mk                    | 2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk                  | 2 +-
 package/monolite/monolite.mk                              | 2 +-
 package/mxml/mxml.mk                                      | 2 +-
 package/neon/neon.mk                                      | 2 +-
 package/network-manager/network-manager.mk                | 2 +-
 package/ntfs-3g/ntfs-3g.mk                                | 2 +-
 package/openal/openal.mk                                  | 2 +-
 package/openipmi/openipmi.mk                              | 2 +-
 package/owfs/owfs.mk                                      | 2 +-
 package/pango/pango.mk                                    | 2 +-
 package/pppd/pppd.mk                                      | 2 +-
 package/procps-ng/procps-ng.mk                            | 2 +-
 package/rpm/rpm.mk                                        | 2 +-
 package/shapelib/shapelib.mk                              | 2 +-
 package/startup-notification/startup-notification.mk      | 2 +-
 package/ustr/ustr.mk                                      | 2 +-
 package/yasm/yasm.mk                                      | 2 +-
 63 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index b87b923..7a7028c 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -7,7 +7,7 @@
 ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
-ARGP_STANDALONE_LICENSE = LGPLv2+
+ARGP_STANDALONE_LICENSE = LGPL-2.0+
 
 ARGP_STANDALONE_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -fPIC"
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 90d329a..88cf5fb 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -8,7 +8,7 @@ ATK_VERSION_MAJOR = 2.22
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-ATK_LICENSE = LGPLv2+
+ATK_LICENSE = LGPL-2.0+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 7a56a68..07aae97 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -6,7 +6,7 @@
 
 CAIROMM_VERSION_MAJOR = 1.12
 CAIROMM_VERSION = $(CAIROMM_VERSION_MAJOR).0
-CAIROMM_LICENSE = LGPLv2+
+CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
 CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
 CAIROMM_SITE = http://ftp.gnome.org/pub/gnome/sources/cairomm/$(CAIROMM_VERSION_MAJOR)
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4ffe6f7..292d87e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -7,7 +7,7 @@
 CUPS_VERSION = 2.2.3
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
-CUPS_LICENSE = GPL-2.0, LGPLv2
+CUPS_LICENSE = GPL-2.0, LGPL-2.0
 CUPS_LICENSE_FILES = LICENSE.txt
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 9b67bd3..7ad717b 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -19,7 +19,7 @@ FLTK_CONF_OPTS = --enable-threads --with-x --disable-gl \
 	--libdir=/usr/lib
 FLTK_DEPENDENCIES = jpeg libpng xlib_libX11 xlib_libXext xlib_libXt
 FLTK_CONFIG_SCRIPTS = fltk-config
-FLTK_LICENSE = LGPLv2 with exceptions
+FLTK_LICENSE = LGPL-2.0 with exceptions
 FLTK_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index d908b90..4621b16 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -8,7 +8,7 @@ GAMIN_VERSION = 0.1.10
 GAMIN_SITE = http://www.gnome.org/~veillard/gamin/sources
 GAMIN_AUTORECONF = YES
 GAMIN_INSTALL_STAGING = YES
-GAMIN_LICENSE = LGPLv2+
+GAMIN_LICENSE = LGPL-2.0+
 GAMIN_LICENSE_FILES = COPYING
 
 # python support broken
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8fc8bb7..7036b4c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -20,7 +20,7 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-GDB_LICENSE = GPL-2.0+, LGPLv2+, GPL-3.0+, LGPL-3.0+
+GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 
 # We only want gdbserver and not the entire debugger.
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index bf83b19..a060f82 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -8,7 +8,7 @@ GDK_PIXBUF_VERSION_MAJOR = 2.36
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).6
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
-GDK_PIXBUF_LICENSE = LGPLv2+
+GDK_PIXBUF_LICENSE = LGPL-2.0+
 GDK_PIXBUF_LICENSE_FILES = COPYING
 GDK_PIXBUF_INSTALL_STAGING = YES
 GDK_PIXBUF_DEPENDENCIES = \
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index d3077e9..eb75c86 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -16,7 +16,7 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	libglib2
 GLIB_NETWORKING_CONF_OPTS = \
 	--with-ca-certificates=/etc/ssl/certs/ca-certificates.crt
-GLIB_NETWORKING_LICENSE = LGPLv2+
+GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
 	GIO_MODULE_DIR=/usr/lib/gio/modules install
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index fa44a2c..e94c924 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -8,7 +8,7 @@ GSSDP_VERSION_MAJOR = 1.0
 GSSDP_VERSION = $(GSSDP_VERSION_MAJOR).1
 GSSDP_SOURCE = gssdp-$(GSSDP_VERSION).tar.xz
 GSSDP_SITE = http://ftp.gnome.org/pub/gnome/sources/gssdp/$(GSSDP_VERSION_MAJOR)
-GSSDP_LICENSE = LGPLv2+
+GSSDP_LICENSE = LGPL-2.0+
 GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index b04eecb..22911cd 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -16,7 +16,7 @@ GST_FFMPEG_LICENSE = GPL-2.0+ (gst-ffmpeg), GPL-2.0+/GPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2 gst-libs/ext/libav/COPYING.GPLv3
 else
 GST_FFMPEG_CONF_OPTS += --enable-lgpl
-GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPL-2.1+/LGPL-3.0+ (libav)
+GST_FFMPEG_LICENSE = LGPL-2.0+ (gst-ffmpeg), LGPL-2.1+/LGPL-3.0+ (libav)
 GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-libs/ext/libav/COPYING.LGPLv3
 endif
 
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 6940901..967893f 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -9,7 +9,7 @@ GST_FSL_PLUGINS_SITE = $(FREESCALE_IMX_SITE)
 
 # Most is LGPLv2+, but some sources are copied from upstream and are
 # LGPLv2.1+, which essentially makes it LGPLv2.1+
-GST_FSL_PLUGINS_LICENSE = LGPLv2+, LGPL-2.1+, PROPRIETARY (asf.h)
+GST_FSL_PLUGINS_LICENSE = LGPL-2.0+, LGPL-2.1+, PROPRIETARY (asf.h)
 GST_FSL_PLUGINS_LICENSE_FILES = COPYING-LGPL-2.1 COPYING-LGPL-2
 
 GST_FSL_PLUGINS_INSTALL_STAGING = YES
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index d1738c5..fc3b203 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -8,7 +8,7 @@ GST_PLUGINS_BASE_VERSION = 0.10.36
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
-GST_PLUGINS_BASE_LICENSE = GPL-2.0+, LGPLv2+
+GST_PLUGINS_BASE_LICENSE = GPL-2.0+, LGPL-2.0+
 GST_PLUGINS_BASE_LICENSE_FILES = COPYING COPYING.LIB
 
 # freetype is only used by examples, but if it is not found
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index d145430..a61ab6e 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -10,7 +10,7 @@ GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST_PLUGINS_UGLY_PATCH = http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-ugly0.10/cdio-cd-text-api.patch
 # COPYING is in fact LGPLv2.1, but all of the code is v2+
 # (except for one test, xingmux)
-GST_PLUGINS_UGLY_LICENSE = LGPLv2+, GPL-2.0+ (synaesthesia)
+GST_PLUGINS_UGLY_LICENSE = LGPL-2.0+, GPL-2.0+ (synaesthesia)
 GST_PLUGINS_UGLY_LICENSE_FILES = COPYING
 
 GST_PLUGINS_UGLY_CONF_OPTS = \
diff --git a/package/gstreamer1/gst1-imx/gst1-imx.mk b/package/gstreamer1/gst1-imx/gst1-imx.mk
index 88429ae..a21e282 100644
--- a/package/gstreamer1/gst1-imx/gst1-imx.mk
+++ b/package/gstreamer1/gst1-imx/gst1-imx.mk
@@ -7,7 +7,7 @@
 GST1_IMX_VERSION = 0.12.3
 GST1_IMX_SITE = $(call github,Freescale,gstreamer-imx,$(GST1_IMX_VERSION))
 
-GST1_IMX_LICENSE = LGPLv2+
+GST1_IMX_LICENSE = LGPL-2.0+
 GST1_IMX_LICENSE_FILES = LICENSE
 
 GST1_IMX_INSTALL_STAGING = YES
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 71ebd48..ffc9ab4 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -11,7 +11,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
 # Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
 # enabled.
-GST1_PLUGINS_BAD_LICENSE = LGPLv2+, LGPL-2.1+
+GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index acb475a..8da1f42 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -9,7 +9,7 @@ GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
 GST1_PLUGINS_BASE_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BASE_LICENSE = LGPLv2+, LGPL-2.1+
+GST1_PLUGINS_BASE_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index bfdd4c4..5ab00d0 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -7,7 +7,7 @@
 GST1_RTSP_SERVER_VERSION = 1.10.4
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
-GST1_RTSP_SERVER_LICENSE = LGPLv2+
+GST1_RTSP_SERVER_LICENSE = LGPL-2.0+
 GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
 GST1_RTSP_SERVER_INSTALL_STAGING = YES
 GST1_RTSP_SERVER_DEPENDENCIES = \
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 08a736d..fc756c3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -9,7 +9,7 @@ GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
-GSTREAMER1_LICENSE = LGPLv2+, LGPL-2.1+
+GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
 
 GSTREAMER1_CONF_OPTS = \
 	--disable-examples \
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 40e6c8c..0940db7 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -8,7 +8,7 @@ GUPNP_AV_VERSION_MAJOR = 0.12
 GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).10
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
-GUPNP_AV_LICENSE = LGPLv2+
+GUPNP_AV_LICENSE = LGPL-2.0+
 GUPNP_AV_LICENSE_FILES = COPYING
 GUPNP_AV_INSTALL_STAGING = YES
 GUPNP_AV_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index 58b5735..2d072be 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -10,7 +10,7 @@ GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
 GUPNP_DLNA_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
 # COPYING contains LGPLv2.1 but all source files contain LPGLv2+
-GUPNP_DLNA_LICENSE = LGPLv2+
+GUPNP_DLNA_LICENSE = LGPL-2.0+
 GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 764f527..0636632 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -8,7 +8,7 @@ GUPNP_VERSION_MAJOR = 1.0
 GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
-GUPNP_LICENSE = LGPLv2+
+GUPNP_LICENSE = LGPL-2.0+
 GUPNP_LICENSE_FILES = COPYING
 GUPNP_INSTALL_STAGING = YES
 GUPNP_DEPENDENCIES = host-pkgconf libglib2 libxml2 gssdp util-linux
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f3b5fc4..d6211fd 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -10,7 +10,7 @@ GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
 GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
-GVFS_LICENSE = LGPLv2+
+GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
 
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 0ddb017..3a5d0fd 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -7,7 +7,7 @@
 KVM_UNIT_TESTS_VERSION = 5731572b2ac23eb410732110b93425b5bb7f27dd
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
-KVM_UNIT_TESTS_LICENSE = LGPLv2
+KVM_UNIT_TESTS_LICENSE = LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_arm),y)
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 9345799..2d44f88 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -12,7 +12,7 @@ LAME_AUTORECONF = YES
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
-LAME_LICENSE = LGPLv2+
+LAME_LICENSE = LGPL-2.0+
 LAME_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
index fb04a9e..3d381ff 100644
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -11,7 +11,7 @@ LESSTIF_DEPENDENCIES = \
 	xlib_libXt \
 	xlib_libXext \
 	freetype
-LESSTIF_LICENSE = LGPLv2+
+LESSTIF_LICENSE = LGPL-2.0+
 LESSTIF_LICENSE_FILES = COPYING.LIB
 LESSTIF_CONF_OPTS = \
 	--with-gnu-ld \
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 6b42cc0..8215f55 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -13,7 +13,7 @@ LIBARGTABLE2_CONF_OPTS = \
 	--disable-kernel-module \
 	--enable-lib \
 	--enable-util
-LIBARGTABLE2_LICENSE = LGPLv2+
+LIBARGTABLE2_LICENSE = LGPL-2.0+
 LIBARGTABLE2_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 85ee37c..b3c6176 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -11,7 +11,7 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSIO
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
-LIBART_LICENSE = LGPLv2+
+LIBART_LICENSE = LGPL-2.0+
 LIBART_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libcddb/libcddb.mk b/package/libcddb/libcddb.mk
index 96b265a..952a879 100644
--- a/package/libcddb/libcddb.mk
+++ b/package/libcddb/libcddb.mk
@@ -7,7 +7,7 @@
 LIBCDDB_VERSION = 1.3.2
 LIBCDDB_SOURCE = libcddb-$(LIBCDDB_VERSION).tar.bz2
 LIBCDDB_SITE = http://downloads.sourceforge.net/libcddb
-LIBCDDB_LICENSE = LGPLv2+
+LIBCDDB_LICENSE = LGPL-2.0+
 LIBCDDB_LICENSE_FILES = COPYING
 LIBCDDB_INSTALL_STAGING = YES
 
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 1f058bd..deeff39 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -9,7 +9,7 @@ LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = libusb
-LIBFTDI1_LICENSE = LGPLv2 (libftdi1), GPL-2.0 with exception (ftdipp1)
+LIBFTDI1_LICENSE = LGPL-2.0 (libftdi1), GPL-2.0 with exception (ftdipp1)
 LIBFTDI1_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LIB
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index a6eea09..32fa595 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -10,7 +10,7 @@ LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/$(LIBGLADE_VERSION_MAJOR)
 LIBGLADE_INSTALL_STAGING = YES
 LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
-LIBGLADE_LICENSE = LGPLv2+
+LIBGLADE_LICENSE = LGPL-2.0+
 LIBGLADE_LICENSE_FILES = COPYING
 
 define LIBGLADE_INSTALL_FIX
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index faf6b3c..47d9f63 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -8,7 +8,7 @@ LIBGLIB2_VERSION_MAJOR = 2.50
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-LIBGLIB2_LICENSE = LGPLv2+
+LIBGLIB2_LICENSE = LGPL-2.0+
 LIBGLIB2_LICENSE_FILES = COPYING
 
 LIBGLIB2_INSTALL_STAGING = YES
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index cf8b2f4..83f69ac 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -9,7 +9,7 @@ LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).31
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-LIBGTK2_LICENSE = LGPLv2+
+LIBGTK2_LICENSE = LGPL-2.0+
 LIBGTK2_LICENSE_FILES = COPYING
 # For 0001-reduce-dependencies.patch
 LIBGTK2_AUTORECONF = YES
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index ca88e30..ed843fc 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -8,7 +8,7 @@ LIBGTK3_VERSION_MAJOR = 3.22
 LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).11
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
-LIBGTK3_LICENSE = LGPLv2+
+LIBGTK3_LICENSE = LGPL-2.0+
 LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_INSTALL_STAGING = YES
 LIBGTK3_AUTORECONF = YES
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 26fa154..af8f345 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -7,7 +7,7 @@
 LIBICONV_VERSION = 1.14
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
-LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPLv2+ (library)
+LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Don't build the preloadable library, as we don't need it (it's only
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index a940f21..0710868 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -9,7 +9,7 @@ LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile
 LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-6.debian.tar.bz2
 
-LIBLOCKFILE_LICENSE = LGPLv2+, GPL-2.0+ (dotlockfile)
+LIBLOCKFILE_LICENSE = LGPL-2.0+, GPL-2.0+ (dotlockfile)
 LIBLOCKFILE_LICENSE_FILES = COPYRIGHT
 
 LIBLOCKFILE_INSTALL_STAGING = YES
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 733722f..d85f589 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -7,7 +7,7 @@
 LIBMBIM_VERSION = 1.14.0
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
-LIBMBIM_LICENSE = LGPLv2+ (library), GPL-2.0+ (programs)
+LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
 
diff --git a/package/libmhash/libmhash.mk b/package/libmhash/libmhash.mk
index f7b8e72..f2da10e 100644
--- a/package/libmhash/libmhash.mk
+++ b/package/libmhash/libmhash.mk
@@ -8,7 +8,7 @@ LIBMHASH_VERSION = 0.9.9.9
 LIBMHASH_SITE = http://downloads.sourceforge.net/project/mhash/mhash/$(LIBMHASH_VERSION)
 LIBMHASH_SOURCE = mhash-$(LIBMHASH_VERSION).tar.bz2
 LIBMHASH_INSTALL_STAGING = YES
-LIBMHASH_LICENSE = LGPLv2
+LIBMHASH_LICENSE = LGPL-2.0
 LIBMHASH_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 9151d6d..caa4398 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -7,7 +7,7 @@
 LIBQMI_VERSION = 1.16.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
-LIBQMI_LICENSE = LGPLv2+ (library), GPL-2.0+ (programs)
+LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING
 LIBQMI_INSTALL_STAGING = YES
 
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index db57193..07c1e3a 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -14,7 +14,7 @@ HOST_LIBRSVG_CONF_OPTS = --enable-introspection=no
 LIBRSVG_DEPENDENCIES = cairo host-gdk-pixbuf gdk-pixbuf libcroco libglib2 libxml2 pango \
 	$(if $(BR2_PACKAGE_LIBGTK3),libgtk3)
 HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libcroco host-libglib2 host-libxml2 host-pango
-LIBRSVG_LICENSE = LGPLv2+
+LIBRSVG_LICENSE = LGPL-2.0+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index bf85595..8fd850f 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -6,7 +6,7 @@
 
 LIBSHOUT_VERSION = 2.4.1
 LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
-LIBSHOUT_LICENSE = LGPLv2+
+LIBSHOUT_LICENSE = LGPL-2.0+
 LIBSHOUT_LICENSE_FILES = COPYING
 LIBSHOUT_INSTALL_STAGING = YES
 LIBSHOUT_DEPENDENCIES = host-pkgconf libogg libvorbis
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index f6e92f8..1c27138 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -8,7 +8,7 @@ LIBSOUP_VERSION_MAJOR = 2.56
 LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
-LIBSOUP_LICENSE = LGPLv2+
+LIBSOUP_LICENSE = LGPL-2.0+
 LIBSOUP_LICENSE_FILES = COPYING
 LIBSOUP_INSTALL_STAGING = YES
 LIBSOUP_CONF_ENV = ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
index 8b85d5a..45d730d 100644
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -8,7 +8,7 @@ LIBSVG_VERSION = 0.1.4
 LIBSVG_SITE = http://cairographics.org/snapshots
 LIBSVG_DEPENDENCIES = host-pkgconf libpng jpeg
 LIBSVG_INSTALL_STAGING = YES
-LIBSVG_LICENSE = LGPLv2+
+LIBSVG_LICENSE = LGPL-2.0+
 LIBSVG_LICENSE_FILES = COPYING
 
 # libsvg needs at last a XML parser
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index cbedf61..d0f6329 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -6,7 +6,7 @@
 
 LIBXMLPP_VERSION_MAJOR = 2.40
 LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
-LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPLv2+ (examples)
+LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
 LIBXMLPP_SITE = http://ftp.gnome.org/pub/GNOME/sources/libxml++/$(LIBXMLPP_VERSION_MAJOR)
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index a17f746..5a1f06d 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -6,7 +6,7 @@
 
 MARIADB_VERSION = 10.1.22
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
-MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPLv2 (LGPL client library)
+MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 MARIADB_LICENSE_FILES = README COPYING COPYING.LESSER
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index ecb7d3f..1eea355 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -7,7 +7,7 @@
 MODEM_MANAGER_VERSION = 1.6.4
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
-MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPLv2+ (libmm-glib)
+MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
diff --git a/package/mono-gtksharp3/mono-gtksharp3.mk b/package/mono-gtksharp3/mono-gtksharp3.mk
index cccfcde..9ddf932 100644
--- a/package/mono-gtksharp3/mono-gtksharp3.mk
+++ b/package/mono-gtksharp3/mono-gtksharp3.mk
@@ -8,7 +8,7 @@ MONO_GTKSHARP3_VERSION_MAJOR = 2.99
 MONO_GTKSHARP3_VERSION = $(MONO_GTKSHARP3_VERSION_MAJOR).3
 MONO_GTKSHARP3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk-sharp/$(MONO_GTKSHARP3_VERSION_MAJOR)
 MONO_GTKSHARP3_SOURCE = gtk-sharp-$(MONO_GTKSHARP3_VERSION).tar.xz
-MONO_GTKSHARP3_LICENSE = LGPLv2, MIT (cairo)
+MONO_GTKSHARP3_LICENSE = LGPL-2.0, MIT (cairo)
 MONO_GTKSHARP3_LICENSE_FILES = COPYING
 MONO_GTKSHARP3_INSTALL_STAGING = YES
 MONO_GTKSHARP3_DEPENDENCIES = mono libgtk3
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index d50d9f2..6b982b3 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -7,7 +7,7 @@
 MONOLITE_VERSION = 149
 MONOLITE_SITE = http://download.mono-project.com/monolite/
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
-MONOLITE_LICENSE = LGPLv2 or commercial
+MONOLITE_LICENSE = LGPL-2.0 or commercial
 
 define HOST_MONOLITE_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/usr/lib/monolite
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index f36c75c..7c48380 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -6,7 +6,7 @@
 
 MXML_VERSION = 2.10
 MXML_SITE = http://www.msweet.org/files/project3
-MXML_LICENSE = LGPLv2+ with exceptions
+MXML_LICENSE = LGPL-2.0+ with exceptions
 MXML_LICENSE_FILES = COPYING
 MXML_INSTALL_STAGING = YES
 
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 6a517a9..1b8eb36 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,7 +6,7 @@
 
 NEON_VERSION = 0.30.2
 NEON_SITE = http://www.webdav.org/neon
-NEON_LICENSE = LGPLv2+ (library), GPL-2.0+ (manual and tests)
+NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6e82d30..0815bdd 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -11,7 +11,7 @@ NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(N
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
-NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPLv2+ (libnm-util)
+NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm-util)
 NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
 
 NETWORK_MANAGER_CONF_ENV = \
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 0aabde7..5f23eae 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -10,7 +10,7 @@ NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
-NTFS_3G_LICENSE = GPL-2.0+, LGPLv2+
+NTFS_3G_LICENSE = GPL-2.0+, LGPL-2.0+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 6384104..72ebee2 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -12,7 +12,7 @@ OPENAL_PATCH = \
 	https://github.com/kcat/openal-soft/commit/a52cfc804813aef8e4b304e20cf843fa6907af6c.patch \
 	https://github.com/kcat/openal-soft/commit/c3c283a0b5d0130afafaa2a5b6ce6fbc30b6e6a1.patch \
 	https://github.com/kcat/openal-soft/commit/46b3e1d08ca10e809eb2e20b6371812958b97e1f.patch
-OPENAL_LICENSE = LGPLv2+
+OPENAL_LICENSE = LGPL-2.0+
 OPENAL_LICENSE_FILES = COPYING
 OPENAL_INSTALL_STAGING = YES
 
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 25bd7fd..33c63c2 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -9,7 +9,7 @@ OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_PATCH = \
 	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
-OPENIPMI_LICENSE = LGPLv2+, GPL-2.0+, BSD-3c
+OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
 # Patching Makefile.am
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index a7f9ed0..ee37a30 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -13,7 +13,7 @@ OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
 OWFS_AUTORECONF = YES
 
 # owtcl license is declared in module/ownet/c/src/include/ow_functions.h
-OWFS_LICENSE = GPL-2.0+, LGPLv2 (owtcl)
+OWFS_LICENSE = GPL-2.0+, LGPL-2.0 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
 OWFS_INSTALL_STAGING = YES
 
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index d4957f9..2f2d580 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -10,7 +10,7 @@ PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_AUTORECONF = YES
 PANGO_INSTALL_STAGING = YES
-PANGO_LICENSE = LGPLv2+
+PANGO_LICENSE = LGPL-2.0+
 PANGO_LICENSE_FILES = COPYING
 
 PANGO_CONF_OPTS = --enable-explicit-deps=no
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 722146c..da957c0 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -7,7 +7,7 @@
 PPPD_VERSION = 2.4.7
 PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
 PPPD_SITE = https://download.samba.org/pub/ppp
-PPPD_LICENSE = LGPLv2+, LGPL, BSD-4c, BSD-3c, GPL-2.0+
+PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4c, BSD-3c, GPL-2.0+
 PPPD_LICENSE_FILES = \
 	pppd/tdb.c pppd/plugins/pppoatm/COPYING \
 	pppdump/bsd-comp.c pppd/ccp.c pppd/plugins/passprompt.c
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index d5a140b..0ab3139 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -7,7 +7,7 @@
 PROCPS_NG_VERSION = 3.3.12
 PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
-PROCPS_NG_LICENSE = GPL-2.0+, LGPLv2+ (libproc and libps)
+PROCPS_NG_LICENSE = GPL-2.0+, LGPL-2.0+ (libproc and libps)
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
 PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index d57dd70..fdaf27c 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -9,7 +9,7 @@ RPM_VERSION = $(RPM_VERSION_MAJOR).0.1
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
 RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
-RPM_LICENSE = GPL-2.0 or LGPLv2 (library only)
+RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
 RPM_LICENSE_FILES = COPYING
 RPM_PATCH = \
 	https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch \
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 2e8fe6d..34b6253 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -6,7 +6,7 @@
 
 SHAPELIB_VERSION = 1.3.0
 SHAPELIB_SITE = http://download.osgeo.org/shapelib
-SHAPELIB_LICENSE = MIT or LGPLv2
+SHAPELIB_LICENSE = MIT or LGPL-2.0
 SHAPELIB_LICENSE_FILES = web/license.html LICENSE.LGPL
 SHAPELIB_INSTALL_STAGING = YES
 
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index e8dd0a3..b331408 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -12,7 +12,7 @@ STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
 STARTUP_NOTIFICATION_CONF_OPTS = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
-STARTUP_NOTIFICATION_LICENSE = LGPLv2
+STARTUP_NOTIFICATION_LICENSE = LGPL-2.0
 STARTUP_NOTIFICATION_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index 715914c..0051b89 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -9,7 +9,7 @@
 USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
-USTR_LICENSE = BSD-2c, MIT, LGPLv2+
+USTR_LICENSE = BSD-2c, MIT, LGPL-2.0+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 USTR_AUTORECONF = YES
 USTR_PATCH = \
diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
index 25f11de..babf2dd 100644
--- a/package/yasm/yasm.mk
+++ b/package/yasm/yasm.mk
@@ -6,7 +6,7 @@
 
 YASM_VERSION = 1.3.0
 YASM_SITE = http://www.tortall.net/projects/yasm/releases
-YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPL-2.0, LGPLv2
+YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPL-2.0, LGPL-2.0
 YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
 
 # This sed prevents it compiling 2 programs (vsyasm and ytasm)
-- 
2.6.2
