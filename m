From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Mar 2012 23:06:01 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
Message-ID: <20120314220942.45BAA90D92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b593af83c0eece47899f0bf7871376e784b1f0cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |   24 ++++++--
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |   56 +++++++++++++-------
 2 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index e772930..cb50fbd 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -27,6 +27,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
+	bool "audiovisualizers"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
 	bool "bayer"
 
@@ -70,6 +73,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FACEOVERLAY
+	bool "faceoverlay"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
 	bool "festival"
 
@@ -79,6 +85,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
 	bool "freeze"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
+	bool "freeverb"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R
 	bool "frei0r"
 
@@ -103,12 +112,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG
 	bool "id3tag"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTER
+	bool "inter"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE
 	bool "interlace"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE
-	bool "invtelecine"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE
 	bool "ivfparse"
 
@@ -142,9 +151,6 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX
 	bool "mpegtsmux"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE
-	bool "mpeg4videoparse"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE
 	bool "mpegvideoparse"
 
@@ -175,6 +181,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
 	bool "real"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REMOVESILENCE
+	bool "removesilence"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
 	bool "rtpmux"
 
@@ -196,6 +205,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
 	bool "siren"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH
+	bool "smooth"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
 	bool "speed"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 20aad76..a737bef 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.22
+GST_PLUGINS_BAD_VERSION = 0.10.23
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
@@ -40,6 +40,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-audiovisualizers
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
 else
@@ -124,6 +130,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-faceoverlay
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-faceoverlay
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-festival
 else
@@ -142,6 +154,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-freeverb
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-freeverb
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-frei0r
 else
@@ -190,22 +208,16 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-id3tag
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-inter
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-interlace
+GST_PLUGINS_BAD_CONF_OPT += --disable-inter
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INVTELECINE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-invtelecine
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-invtelecine
+GST_PLUGINS_BAD_CONF_OPT += --disable-interlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
@@ -274,12 +286,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpeg4videoparse
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpeg4videoparse
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegvideoparse
 else
@@ -340,6 +346,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-real
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-removesilence
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-removesilence
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
 else
@@ -382,6 +394,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-siren
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-smooth
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-smooth
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-speed
 else
