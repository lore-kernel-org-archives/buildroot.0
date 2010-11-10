From: Phil Edworthy <phil.edworthy@renesas.com>
Date: Wed, 10 Nov 2010 13:02:18 +0000
Subject: [Buildroot] [PATCH] gst-plugins-good: Add option for v4l2
Message-ID: <1289394138-14059-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 package/multimedia/gst-plugins-good/Config.in      |    3 +++
 .../gst-plugins-good/gst-plugins-good.mk           |    7 ++++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 3b37b5e..dd293e9 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -159,6 +159,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M
 	bool "y4m"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2
+	bool "v4l2"
+
 comment "plugins with external dependencies"
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c44bdff..62d9d47 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -15,7 +15,6 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-sunaudio \
 		--disable-osx_audio \
 		--disable-osx_video \
-		--disable-gst_v4l2 \
 		--disable-x \
 		--disable-xshm \
 		--disable-xvideo \
@@ -290,6 +289,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-y4m
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-gst_v4l2
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-gst_v4l2
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-annodex
 GST_PLUGINS_GOOD_DEPENDENCIES += libxml2
-- 
1.7.1
