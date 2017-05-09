From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 18:21:17 +0100
Subject: [Buildroot] [PATCH next 09/11] gst1-plugins-ugly: bump version to
	1.12.0
In-Reply-To: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509172119.33642-9-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove non-existant configure options:

  --enable-mad:
    https://github.com/GStreamer/gst-plugins-ugly/commit/2f767fb24ac8ee001bde7e1452b46a4f8fe3a719

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in              |  7 -------
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash |  4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 10 +---------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index f30163a..c997411 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -50,13 +50,6 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME
 	help
 	  Encode MP3s with LAME
 
-config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
-	bool "mad (*.mp3 audio)"
-	select BR2_PACKAGE_LIBID3TAG
-	select BR2_PACKAGE_LIBMAD
-	help
-	  mp3 decoding based on the mad library
-
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123
 	bool "mpg123 (*.mp3 audio)"
 	select BR2_PACKAGE_MPG123
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 9567d9c..5d211ce 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.10.4.tar.xz.sha256sum
-sha256 6386c77ca8459cba431ed0b63da780c7062c7cc48055d222024d8eaf198ffa59  gst-plugins-ugly-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.12.0.tar.xz.sha256sum
+sha256 5e68ba5046e83ee87b17d7a13931e6091466fd771e1338c5b929ee0944d40ad6  gst-plugins-ugly-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index b0d9a65..4266ced 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.10.4
+GST1_PLUGINS_UGLY_VERSION = 1.12.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -77,14 +77,6 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-lame
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD),y)
-GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mad
-GST1_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
-GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
-else
-GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mad
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpg123
 GST1_PLUGINS_UGLY_DEPENDENCIES += mpg123
-- 
2.10.2
