From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:07 -0300
Subject: [Buildroot] [PATCH 03/10] gst1-plugins-base: add opus support
In-Reply-To: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458910214-10963-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-base/Config.in            | 6 ++++++
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index b19fa59..22541e1 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -126,6 +126,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG
 	help
 	  ogg stream manipulation (info about ogg: http://xiph.org)
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS
+	bool "opus"
+	select BR2_PACKAGE_OPUS
+	help
+	  Opus codec for speech and audio.
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 9490296..d7feb7c 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -176,6 +176,13 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS),y)
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-opus
+GST1_PLUGINS_BASE_DEPENDENCIES += opus
+else
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-opus
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
 GST1_PLUGINS_BASE_CONF_OPTS += --enable-ogg
 GST1_PLUGINS_BASE_DEPENDENCIES += libogg
-- 
2.7.3
