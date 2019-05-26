From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:20:01 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 audiolatency plugin option
Message-ID: <20190602201236.2FADC8EDF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65b5b613f09e9397fb0b24278d7ebace25bd5af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This plugin was introduced in 1.16.0. It is dependencyless and
provides a way to measure audio latency.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c53ff66272..35d6bddd05 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -46,6 +46,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	help
 	  Audio filters plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY
+	bool "audiolatency"
+	help
+	  Audio latency plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
 	bool "audiomixmatrix"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d6414f9daa..ad1adbc385 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -132,6 +132,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiofxbad
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiolatency
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiolatency
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixmatrix
 else
