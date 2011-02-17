From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Feb 2011 14:05:47 +0100
Subject: [Buildroot] [git commit master 1/1] package/multimedia: apply
	libtool patch where possible
Message-ID: <20110217130821.B65768F5C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6cdced39937cdb4b171f3505cc208758c80dc2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have libtool-2.2.x patch support, we can get rid of a bunch
of _LIBTOOL_PATH = NO, fixing (potential) cross link issues.

Notice: libmad/libid3tag/madplay/taglib not changed, as they use a very
old 1.5 version, where our buildroot-libtool-v1.5.patch doesn't apply.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    1 -
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    1 -
 .../gst-plugins-base/gst-plugins-base.mk           |    1 -
 .../gst-plugins-good/gst-plugins-good.mk           |    1 -
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    1 -
 package/multimedia/gstreamer/gstreamer.mk          |    1 -
 package/multimedia/libmms/libmms.mk                |    1 -
 package/multimedia/swfdec/swfdec.mk                |    1 -
 8 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index d424aa3..6e91ad5 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -7,7 +7,6 @@ GST_FFMPEG_VERSION = 0.10.9
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_LIBTOOL_PATCH = NO
 GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg liboil
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index c300256..357acf3 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -6,7 +6,6 @@
 GST_PLUGINS_BAD_VERSION = 0.10.21
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
-GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_BAD_CONF_OPT = \
 		--disable-examples
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 828d156..1d0b19d 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -7,7 +7,6 @@ GST_PLUGINS_BASE_VERSION = 0.10.32
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
-GST_PLUGINS_BASE_LIBTOOL_PATCH = NO
 
 # freetype is only used by examples, but if it is not found
 # and the host has a freetype-config script, then the host
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 7a67dc5..10044e7 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -6,7 +6,6 @@
 GST_PLUGINS_GOOD_VERSION = 0.10.27
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
-GST_PLUGINS_GOOD_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-debug \
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 4eb02e5..a173df1 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -6,7 +6,6 @@
 GST_PLUGINS_UGLY_VERSION = 0.10.17
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
-GST_PLUGINS_UGLY_LIBTOOL_PATCH = NO
 
 GST_PLUGINS_UGLY_CONF_OPT = \
 		--disable-examples
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 558d476..db5ccaf 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -7,7 +7,6 @@ GSTREAMER_VERSION = 0.10.32
 GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
-GSTREAMER_LIBTOOL_PATCH = NO
 
 # Checking if unaligned memory access works correctly cannot be done when cross
 # compiling. For the following architectures there is no information available
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
index a8f4527..d11f0be 100644
--- a/package/multimedia/libmms/libmms.mk
+++ b/package/multimedia/libmms/libmms.mk
@@ -8,7 +8,6 @@ LIBMMS_SOURCE = libmms-$(LIBMMS_VERSION).tar.gz
 LIBMMS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libmms
 
 LIBMMS_AUTORECONF = NO
-LIBMMS_LIBTOOL_PATCH = NO
 LIBMMS_INSTALL_STAGING = YES
 LIBMMS_INSTALL_TARGET = YES
 
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
index 58bfd15..9b4b729 100644
--- a/package/multimedia/swfdec/swfdec.mk
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -12,7 +12,6 @@ SWFDEC_MAKE_OPT = \
 	GLIB_MKENUMS=$(HOST_DIR)/usr/bin/glib-mkenums \
 	GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal
 
-SWFDEC_LIBTOOL_PATCH = NO
 SWFDEC_INSTALL_STAGING = YES
 SWFDEC_INSTALL_TARGET = YES
 
-- 
1.7.3.4
