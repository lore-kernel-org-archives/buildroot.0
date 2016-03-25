From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:12 -0300
Subject: [Buildroot] [PATCH 08/10] gst1-plugins-ugly: add mpg123 support
In-Reply-To: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458910214-10963-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in            | 6 ++++++
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index fbcb128..995835e 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -61,6 +61,12 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD
 	help
 	  mp3 decoding based on the mad library
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123
+	bool "mpg123 (*.mp3 audio)"
+	select BR2_PACKAGE_MPG123
+	help
+	  mp3 decoding based on the mpg123 library
+
 config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	bool "mpeg2dec"
 	select BR2_PACKAGE_LIBMPEG2
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index a45e670..16cfef2 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -81,6 +81,13 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mad
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123),y)
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpg123
+GST1_PLUGINS_UGLY_DEPENDENCIES += mpg123
+else
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpg123
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
-- 
2.7.3
