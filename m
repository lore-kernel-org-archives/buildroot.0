From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 21:02:14 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: bump version
Message-ID: <20110929190334.639708DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30f416cc86c115c34984b0499b76a00c8482abeb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And sort options alphabetically.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |   84 ++++++++---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  161 +++++++++++++++-----
 2 files changed, 186 insertions(+), 59 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 5ccaa16..cd9249a 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -24,38 +24,30 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX
 	bool "asfmux"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
-	bool "apexsink"
-	select BR2_PACKAGE_OPENSSL
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS
 	bool "audioparsers"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
 	bool "autoconvert"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
+	bool "bayer"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN
 	bool "camerabin"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2
+	bool "camerabin2"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
+	bool "cdxaparse"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS
 	bool "coloreffects"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE
 	bool "colorspace"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
-	bool "legacyresample"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
-	bool "bayer"
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
-	bool "cdaudio"
-	select BR2_PACKAGE_LIBCDAUDIO
-
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
-	bool "cdxaparse"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC
 	bool "dataurisrc"
 
@@ -77,6 +69,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
 	bool "festival"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
+	bool "fieldanalysis"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
 	bool "freeze"
 
@@ -98,6 +93,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE
 	bool "hdvparse"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS
+	bool "hls"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG
+	bool "id3tag"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE
 	bool "interlace"
 
@@ -113,6 +114,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT
 	bool "jpegformat"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
+	bool "legacyresample"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
 	bool "librfb"
 
@@ -125,6 +129,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX
 	bool "mpegpsmux"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	bool "mpegtsdemux"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX
 	bool "mpegtsmux"
 
@@ -146,15 +153,15 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX
 	bool "nuvdemux"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PATCHDETECT
+	bool "patchdetect"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE
 	bool "pcapparse"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM
 	bool "pnm"
 
-config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX
-	bool "qtmux"
-
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
 	bool "rawparse"
 
@@ -164,9 +171,15 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
 	bool "rtpmux"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPVP8
+	bool "rtpvp8"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO
 	bool "scaletempo"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDI
+	bool "sdi"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
 	bool "sdp"
 
@@ -188,12 +201,18 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
 	bool "tta"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOFILTERS
+	bool "videofilters"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE
 	bool "videomaxrate"
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
 	bool "videomeasure"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
+	bool "videoparsers"
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
 	bool "videosignal"
 
@@ -205,6 +224,22 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M
 
 comment "plugins with external dependencies (there may be more available)"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "apexsink"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2
+	bool "bz2"
+	select BR2_PACKAGE_BZIP2
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
+	bool "cdaudio"
+	select BR2_PACKAGE_LIBCDAUDIO
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
 	select BR2_PACKAGE_DIRECTFB
@@ -219,10 +254,19 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
 	bool "neon"
 	select BR2_PACKAGE_NEON
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
+	bool "rsvg"
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBRSVG
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE
+	bool "sndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
 	bool "vcd"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 5012be2..dee440a 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -3,7 +3,7 @@
 # gst-plugins-bad
 #
 #############################################################
-GST_PLUGINS_BAD_VERSION = 0.10.21
+GST_PLUGINS_BAD_VERSION = 0.10.22
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
@@ -40,13 +40,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
-GST_PLUGINS_BAD_DEPENDENCIES += openssl
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOPARSERS),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-audioparsers
 else
@@ -59,34 +52,22 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
-endif
-
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
+GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
+GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin2
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
+GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin2
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
@@ -95,11 +76,16 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
-GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
@@ -144,6 +130,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-festival
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-fieldanalysis
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
 else
@@ -186,6 +178,18 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-hls
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-hls
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-id3tag
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-id3tag
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
 else
@@ -222,6 +226,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
 else
@@ -246,6 +256,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsdemux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsdemux
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
 else
@@ -288,6 +304,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-patchdetect
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-patchdetect
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
 else
@@ -300,12 +322,6 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-pnm
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-qtmux
-else
-GST_PLUGINS_BAD_CONF_OPT += --disable-qtmux
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-rawparse
 else
@@ -324,12 +340,24 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPVP8),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-rtpvp8
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-rtpvp8
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
 else
 GST_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDI),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-sdi
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-sdi
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdp
 else
@@ -372,6 +400,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-tta
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-videofilters
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-videofilters
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videomaxrate
 else
@@ -384,6 +418,12 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-videoparsers
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-videoparsers
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-videosignal
 else
@@ -402,6 +442,35 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-y4m
 endif
 
+# plugins with deps
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-bz2
+GST_PLUGINS_BAD_DEPENDENCIES += bz2ip
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-bz2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-curl
+GST_PLUGINS_BAD_DEPENDENCIES += libcurl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-curl
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
 GST_PLUGINS_BAD_DEPENDENCIES += directfb
@@ -428,6 +497,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-neon
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-rsvg
+GST_PLUGINS_BAD_DEPENDENCIES += librsvg
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-rsvg
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
 GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
@@ -436,6 +512,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-sndfile
+GST_PLUGINS_BAD_DEPENDENCIES += libsndfile
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-sndfile
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
 else
