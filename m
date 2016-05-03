From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 May 2016 16:44:16 -0300
Subject: [Buildroot] [PATCH 3/3] gst1-plugins-bad: add rtmp support
In-Reply-To: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1462304656-17156-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As pointed by sonnex on the mailing list.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 6 ++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 53ce589..5248c4d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,6 +382,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
+	bool "rtmp"
+	select BR2_PACKAGE_RTMPDUMP
+	help
+	  RTMP plugni
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 6d8cac7..e2446a3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -479,6 +479,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtmp
+GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
-- 
2.7.3
