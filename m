From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 21:50:02 +0100
Subject: [Buildroot] [git commit] gst-plugins-base: Bump version to 0.10.23.
Message-ID: <20090618085945.203E77777D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11e7857989303acbd4b5143297e615bc8cf3754a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Also add a config option for the app plugin that was moved from
to gst-plugins-base from gst-plugins-bad in version 0.10.22.

Closes #393.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/multimedia/gst-plugins-base/Config.in      |    3 +++
 .../gst-plugins-base/gst-plugins-base.mk           |    8 +++++++-
 2 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 5e267f2..8883a43 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -14,6 +14,9 @@ comment "dependency-less plugins"
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER
 	bool "adder"
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
+	bool "app"
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
 	bool "audioconvert (mandatory for audio playback)"
 	default y
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 58b7bce..88c68e1 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,7 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.22
+GST_PLUGINS_BASE_VERSION = 0.10.23
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -28,6 +28,12 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-adder
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-app
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-app
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-audioconvert
 else
-- 
1.6.0.6
