From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  4 Dec 2009 00:02:03 +0100
Subject: [Buildroot] [PATCH 3/3] gst-plugins-bad: allow the build of
	ivorbisdec plugin
In-Reply-To: <1259881323-4308-2-git-send-email-s.neumann@raumfeld.com>
References: <1259881323-4308-1-git-send-email-s.neumann@raumfeld.com>
	<1259881323-4308-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1259881323-4308-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to select the ivorbisdec plugin using the tremor
fixed-point Ogg Vorbis decoder.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index c7ebe2a..66335a8 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -176,6 +176,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_TREMOR
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 9a0955f..bd5b633 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -336,6 +336,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-ivorbis
+GST_PLUGINS_BAD_DEPENDENCIES += tremor
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-ivorbis
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
 else
-- 
1.6.5.3
