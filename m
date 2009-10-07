From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 7 Oct 2009 14:52:19 +0200
Subject: [Buildroot] [git commit master] gst-plugins-base: update to new
	upstream release 0.10.25
Message-ID: <20091007125247.AAD867775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e7a4936cf5b6c52ed8ed6b7f2067cb3066e6bd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update gst-plugins-base to version 0.10.25. Also add new
config option to enable/disable the Pango font renderer
plug-in.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-base/Config.in      |    4 ++++
 .../gst-plugins-base/gst-plugins-base.mk           |    9 ++++++++-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 8883a43..f08be7e 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -72,6 +72,10 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 	bool "ogg (*.ogg audio/video)"
 	select BR2_PACKAGE_LIBOGG
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
+	bool "pango font renderer"
+	select BR2_PACKAGE_PANGO
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
 	select BR2_PACKAGE_LIBTHEORA
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 63f23cd..bd422be 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -3,7 +3,7 @@
 # gst-plugins-base
 #
 #############################################################
-GST_PLUGINS_BASE_VERSION = 0.10.23
+GST_PLUGINS_BASE_VERSION = 0.10.25
 GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -130,6 +130,13 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-ogg
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-pango
+GST_PLUGINS_BASE_DEPENDENCIES += pango
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-pango
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-theora
 GST_PLUGINS_BASE_DEPENDENCIES += libtheora
-- 
1.6.3.3
