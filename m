From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 12:19:10 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version to 1.12.0
Message-ID: <20170704113142.1A9937FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b006fe1c45b8f04551ed7ec87e19494e03a1d960
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove non-existant configure options:

  --enable-mad:
    https://github.com/GStreamer/gst-plugins-ugly/commit/2f767fb24ac8ee001bde7e1452b46a4f8fe3a719

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                            |  4 ++++
 package/gstreamer1/gst1-plugins-ugly/Config.in              |  7 -------
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash |  4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 10 +---------
 4 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ddb0ffe..b8fe028 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,10 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
+	bool "mad (*.mp3 audio) removed"
+	select BR2_LEGACY
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
 	bool "gst1-plugins-bad webrtc renamed to webrtcdsp"
 	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
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
