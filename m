From: Nikolay Beloborodov <sonntex@gmail.com>
Date: Thu,  5 May 2016 04:35:46 +0300
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: add rtmp support
Message-ID: <1462412146-14959-1-git-send-email-sonntex@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Option for rtmp plugin from GStreamer 1 bad plugins has been added.

Signed-off-by: Nikolay Beloborodov <sonntex@gmail.com>
---
 Config.in.legacy                                        | 8 ++++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 ++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f694f8..9b63cd7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
+    bool "gst1-plugins-bad rtp plugin moved to gst1-plugins-good"
+    select BR2_LEGACY
+    select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP
+    help
+      The rtp plugin from GStreamer 1 bad plugins has been
+      moved to good plugins.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	bool "PowerPC Sourcery toolchain has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a9667af..afbe2bf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,8 +382,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
-	bool "rtp"
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
+	bool "rtmp"
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a92c4a6..30c4999 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -479,10 +479,11 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtmp
+GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
-- 
2.7.3
