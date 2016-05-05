From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 May 2016 08:29:33 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: remove rtp plugin option
Message-ID: <20160505063137.58D5A81EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c956f2df9b8d2ab3909fee1b610105082974f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin was moved from -bad to -good so remove the option.
Support in -good was added via 301e8ffb.
Add legacy entry to notify users of this, however we can't automatically
select the good variant since good might be disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                        | 7 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           | 3 ---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9901cf6..5317dde 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
+	bool "gst1-plugins-bad rtp plugin moved to good"
+	select BR2_LEGACY
+	help
+	  The rtp plugin has been moved from gst1-plugins-base to
+	  gst1-plugins-good.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
 	bool "gst1-plugins-bad mpg123 plugin moved to ugly"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 16bb36d..53ce589 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,9 +382,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
-	bool "rtp"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 80bdee8..6d8cac7 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -479,12 +479,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
