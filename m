From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon,  4 Jul 2011 15:54:40 +0200
Subject: [Buildroot] [PATCH 1/6] gst-plugins-base: add option for
	dependency-less plugin
In-Reply-To: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
References: <1309787685-22269-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1309787685-22269-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the build of the dependency-less plugin 'encoding' optional.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/multimedia/gst-plugins-base/Config.in      |    3 +++
 .../gst-plugins-base/gst-plugins-base.mk           |    6 ++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 09c243c..3ac4dac 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -30,6 +30,9 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC
 	bool "audiotestsrc"
 
+config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING
+	bool "encoding"
+
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE
 	bool "ffmpegcolorspace (mandatory for video playback)"
 	default y
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 1d0b19d..7218873 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -69,6 +69,12 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-audiotestsrc
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING),y)
+GST_PLUGINS_BASE_CONF_OPT += --enable-encoding
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-encoding
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-ffmpegcolorspace
 else
-- 
1.7.1
