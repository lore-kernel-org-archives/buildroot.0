From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  3 Oct 2011 12:10:33 +0200
Subject: [Buildroot] [PATCH 3/4] Add lame support in gstreamer
In-Reply-To: <cover.1317636624.git.maxime.ripard@free-electrons.com>
References: <cover.1317636624.git.maxime.ripard@free-electrons.com>
Message-ID: <e2016538064470f088a919a8dd8d30925317c24c.1317636624.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime@free-electrons.com>

Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
---
 package/multimedia/gst-plugins-ugly/Config.in      |    4 ++++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index 94e2b9d..c0046e4 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -38,6 +38,10 @@ config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA
 
 comment "plugins with external dependencies (there may be more available)"
 
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio)"
 	select BR2_PACKAGE_LIBID3TAG
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index ab557a3..7acf0da 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -60,6 +60,13 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-synaesthesia
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST_PLUGINS_UGLY_DEPENDENCIES += lame
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-lame
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
 GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
-- 
1.7.4.1
