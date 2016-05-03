From: sonntex <sonntex@gmail.com>
Date: Tue, 3 May 2016 15:14:05 +0300
Subject: [Buildroot] How to enable rtmp support in gst1-plugins-bad?
Message-ID: <CAPeTicPDug8fDDk=_z7esK-txLUC0w36xPh+d3-b0FNGrOs_MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did not find rtmp support in gst1-plugins-bad. There is only rtp support.
So, I think that it is a misprint. Is it? Patch looks like:

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
b/package/gstreamer1/gst1-plugins-bad/Config.in
index a9667af..afbe2bf 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,8 +382,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
        help
          Removes silence from an audio stream

-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
-       bool "rtp"
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
+       bool "rtmp"

 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
        bool "sdi"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
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
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160503/d6c11040/attachment.html>
