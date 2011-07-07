From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  7 Jul 2011 09:39:01 +0200
Subject: [Buildroot] [PATCH 2/9] gst-plugins: ivborbis (aka tremor) moved to
	gst-plugins-base
In-Reply-To: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1310024348-3575-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The integer vorbis decoder moved from gst-plugins-bad to
gst-plugins-base.
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ----
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 -------
 package/multimedia/gst-plugins-base/Config.in      |    4 ++++
 .../gst-plugins-base/gst-plugins-base.mk           |    7 +++++++
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index e25b756..23d5916 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -192,10 +192,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR
-	bool "tremor"
-	select BR2_PACKAGE_TREMOR
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 31d998f..5bbb53a 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -355,13 +355,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-ivorbis
-GST_PLUGINS_BAD_DEPENDENCIES += tremor
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-ivorbis
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
 else
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 3ac4dac..851337b 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -86,6 +86,10 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
 	select BR2_PACKAGE_LIBTHEORA
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_TREMOR
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS
 	bool "vorbis (*.ogg audio)"
 	select BR2_PACKAGE_LIBVORBIS
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 7218873..79ced30 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -156,6 +156,13 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-theora
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TREMOR),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-ivorbis
+GST_PLUGINS_BASE_DEPENDENCIES += tremor
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-ivorbis
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-vorbis
 GST_PLUGINS_BASE_DEPENDENCIES += libvorbis
-- 
1.7.1
