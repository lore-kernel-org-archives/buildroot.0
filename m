From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 30 Sep 2011 16:48:34 +0200
Subject: [Buildroot] [PATCH 2/2] gst-plugins-bad: add more config options
In-Reply-To: <1317394114-3335-1-git-send-email-s.neumann@raumfeld.com>
References: <1317394114-3335-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317394114-3335-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent update added some new plugins. This commit makes
them selectable in buildroot.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-bad/Config.in       |   10 ++++++++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |   19 +++++++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index cfd9b70..a8d01bc 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -54,6 +54,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	bool "debugutils"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK
+	bool "decklink"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 	bool "dtmf"
 
@@ -117,6 +120,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
 	bool "librfb"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LINSYS
+	bool "linsys"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER
 	bool "liveadder"
 
@@ -247,6 +253,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
 	bool "fbdev"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
+	bool "libmms"
+	select BR2_PACKAGE_LIBMMS
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 4cd2771..bebff40 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -100,6 +100,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-debugutils
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-decklink
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-decklink
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dtmf
 else
@@ -232,6 +238,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-librfb
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LINSYS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-linsys
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-linsys
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-liveadder
 else
@@ -484,6 +496,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-fbdev
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-libmms
+GST_PLUGINS_BAD_DEPENDENCIES += libmms
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-neon
 GST_PLUGINS_BAD_DEPENDENCIES += neon
-- 
1.7.4.1
