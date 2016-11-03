From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:32 -0300
Subject: [Buildroot] [PATCH 06/14] gst1-plugins-bad: enable fdkaac plugin
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's new for 1.10.0, add an explicit option for the fdkaac plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 6 ++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 2f288ca..37731cf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -520,6 +520,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 	help
 	  Linux framebuffer video sink
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK
+	bool "fdkaac"
+	select BR2_PACKAGE_FDK_AAC
+	help
+	  MPEG AAC encoder/decoder
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
 	bool "gl"
 	default y
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ac99fcd..77f64e4 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -642,6 +642,14 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FDK),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-fdk_aac
+GST1_PLUGINS_BAD_DEPENDENCIES += fdk-aac
+GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-fdk_aac
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
 else
-- 
2.7.3
