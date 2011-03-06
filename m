From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Mar 2011 23:36:06 +0100
Subject: [Buildroot] [git commit master 1/1] gst-ffmpeg: bump to version
	0.10.11
Message-ID: <20110306223740.8D15B8E5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a064b48c9d1044b05aee65272f5af7f28879473
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-ffmpeg/Config.in     |    6 +++---
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |    5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

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
index 6e91ad5..ebe87dc 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -3,11 +3,12 @@
 # gst-ffmpeg
 #
 #############################################################
-GST_FFMPEG_VERSION = 0.10.9
+
+GST_FFMPEG_VERSION = 0.10.11
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg liboil
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
1.7.3.4
