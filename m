From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 18:58:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add
 TARGET_NLS_DEPENDENCIES
Message-ID: <20191016165819.2740-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst1-plugins-good uses TARGET_NLS_LIBS without depending on
TARGET_NLS_DEPENDENCIES, fix this mistake

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bb2daccc0a..a8dae1b7bb 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -27,7 +27,10 @@ GST1_PLUGINS_GOOD_CONF_OPTS += \
 	-Ddv=disabled \
 	-Ddv1394=disabled
 
-GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
+GST1_PLUGINS_GOOD_DEPENDENCIES = \
+	gstreamer1 \
+	gst1-plugins-base \
+	$(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_JACK),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Djack=enabled
-- 
2.23.0
