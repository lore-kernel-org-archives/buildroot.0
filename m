From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add new dependency-less
	audiobuffersplit / audiomixmatrix plugins
Message-ID: <20170704113143.2BDC47FD23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55808056a7cd6dd9828be17fd0f4aeea8652efdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These plugins are new in 1.12.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 10 ++++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 35d3f16..96ab12b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -164,6 +164,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX
 	help
 	  ASF Muxer Plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOBUFFERSPLIT
+	bool "audiobuffersplit"
+	help
+	  Audio buffersplit plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	bool "audiofxbad"
 	help
@@ -174,6 +179,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
 	help
 	  Audio mixer plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
+	bool "audiomixmatrix"
+	help
+	  Audio N:M mixer plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
 	bool "compositor"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 5c8e8f2..6a66726 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -166,6 +166,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-asfmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOBUFFERSPLIT),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiobuffersplit
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiobuffersplit
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiofxbad
 else
@@ -178,6 +184,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixer
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixmatrix
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixmatrix
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-compositor
 else
