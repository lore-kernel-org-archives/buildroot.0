From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Sep 2012 23:21:56 +0200
Subject: [Buildroot] [git commit] gst-plugin-bad: add opus option
Message-ID: <20120912073359.AD11B99621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5df8e364d00840ab8ea2d8ee0cfe574034b54c3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cb50fbd..cde3ab8 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -277,6 +277,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
+	bool "opus"
+	select BR2_PACKAGE_OPUS
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_PACKAGE_LIBGTK2
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index ad8b509..6bdcf10 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -528,6 +528,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-neon
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-opus
+GST_PLUGINS_BAD_DEPENDENCIES += opus
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-opus
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rsvg
 GST_PLUGINS_BAD_DEPENDENCIES += librsvg
