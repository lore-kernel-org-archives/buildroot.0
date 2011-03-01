From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2011 13:20:01 -0300
Subject: [Buildroot] [PATCH 4/4] gst-ffmpeg: bump to version 0.10.11
In-Reply-To: <1298996401-798-1-git-send-email-gustavo@zacarias.com.ar>
References: <1298996401-798-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1298996401-798-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/gst-ffmpeg/Config.in     |    6 +++---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |    7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index 17873f0..537101e 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -2,16 +2,16 @@ config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	help
 	  GStreamer plugin using FFmpeg.
 
 	  http://gstreamer.freedesktop.org/
 
-comment "gst-ffmpeg requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "gst-ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 6e91ad5..021ad00 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -3,11 +3,12 @@
 # gst-ffmpeg
 #
 #############################################################
-GST_FFMPEG_VERSION = 0.10.9
-GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
+
+GST_FFMPEG_VERSION = 0.10.11
+#GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg liboil
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
1.7.3.4
