From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:55:02 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good: add
 TARGET_NLS_DEPENDENCIES
Message-ID: <20191016194905.8C0968114E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2896312aed5536abf9a96c1c10cd8841dc97d200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-plugins-good uses TARGET_NLS_LIBS without depending on
TARGET_NLS_DEPENDENCIES, fix this mistake

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
