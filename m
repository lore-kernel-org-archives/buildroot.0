From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 May 2016 08:30:47 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add rtmp support
Message-ID: <20160505063137.7B51981F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b850c32541d7702163509726e0c4e02acb4d8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by sonnex on the mailing list.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 6 ++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 53ce589..facfe58 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,6 +382,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
+	bool "rtmp"
+	select BR2_PACKAGE_RTMPDUMP
+	help
+	  RTMP plugin
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
