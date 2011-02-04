From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Feb 2011 22:26:55 +0100
Subject: [Buildroot] [git commit master 1/1] gst-ffmpeg: needs liboil
Message-ID: <20110204214750.85A988F3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d7c595749dcbbb14bb5cb4ab7100ece8931e6068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-ffmpeg/Config.in     |    1 +
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index f5d01b9..17873f0 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 557c146..d424aa3 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,7 +8,7 @@ GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
 GST_FFMPEG_LIBTOOL_PATCH = NO
-GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg liboil
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-- 
1.7.3.4
