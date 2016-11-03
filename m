From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Nov 2016 06:58:34 -0300
Subject: [Buildroot] [PATCH 08/14] gst1-plugins-bad: add new timecode plugin
In-Reply-To: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1478167120-3285-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new explicit option for the dependency-less timecode plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 3 +++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1d28a66..ac081b5 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -419,6 +419,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
 	bool "stereo"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
+	bool "timecode"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
 	bool "tta"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 3352f1a..a42bb0c 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -517,6 +517,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-stereo
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-timecode
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-timecode
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-tta
 else
-- 
2.7.3
