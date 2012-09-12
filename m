From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Sep 2012 11:49:01 +0200
Subject: [Buildroot] [git commit] gst-plugin-bad: add musepack option
Message-ID: <20120912094932.B26FE99615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc8d6986e38d4b8f7847b72a707c693a24dcb5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cde3ab8..7784ad7 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -273,6 +273,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	select BR2_PACKAGE_LIBMMS
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK
+	bool "musepack"
+	select BR2_PACKAGE_MUSEPACK
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 6bdcf10..714c987 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -521,6 +521,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-musepack
+GST_PLUGINS_BAD_DEPENDENCIES += musepack
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-musepack
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-neon
 GST_PLUGINS_BAD_DEPENDENCIES += neon
