From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 15:51:15 -0500
Subject: [Buildroot] [PATCH v2 4/6] gst-plugins-bad1: add gstreamer1 bad
	plugins
In-Reply-To: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
References: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368132677-1261-4-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X bad plugins

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-bad1/Config.in      |  325 ++++++++++
 .../gst-plugins-bad1/gst-plugins-bad1.mk           |  654 ++++++++++++++++++++
 3 files changed, 980 insertions(+)
 create mode 100644 package/multimedia/gst-plugins-bad1/Config.in
 create mode 100644 package/multimedia/gst-plugins-bad1/gst-plugins-bad1.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 9948e9f..8d5726e 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -16,6 +16,7 @@ source "package/multimedia/gst-plugins-base1/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-good1/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
+source "package/multimedia/gst-plugins-bad1/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
 source "package/multimedia/madplay/Config.in"
diff --git a/package/multimedia/gst-plugins-bad1/Config.in b/package/multimedia/gst-plugins-bad1/Config.in
new file mode 100644
index 0000000..12825ed
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad1/Config.in
@@ -0,0 +1,325 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_BAD1
+	bool "gst-plugins-bad1"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST_PLUGINS_BASE1
+	help
+	  A set of plug-ins for GStreamer that may be of poor quality or
+	  lacking some features.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_BAD1
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ADPCMDEC
+	bool "adpcmdec"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ADPCMENC
+	bool "adpcmenc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AIFF
+	bool "aiff"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ASFMUX
+	bool "asfmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AUTOCONVERT
+	bool "autoconvert"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AUDIOVISUALIZERS
+	bool "audiovisualizers"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_BAYER
+	bool "bayer"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CAMERABIN2
+	bool "camerabin2"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CDXAPARSE
+	bool "cdxaparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_COLOREFFECTS
+	bool "coloreffects"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DATAURISRC
+	bool "dataurisrc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DCCP
+	bool "dccp"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DECKLINK
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "decklink"
+
+comment "decklink requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DTMF
+	bool "dtmf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVBSUBOVERLAY
+	bool "dvdsuboverlay"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVDSPU
+	bool "dvdspu"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FACEOVERLAY
+	bool "faceoverlay"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FESTIVAL
+	bool "festival"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FIELDANALYSIS
+	bool "fieldanalysis"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FREEVERB
+	bool "freeverb"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FREI0R
+	bool "frei0r"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GAUDIEFFECTS
+	bool "gaudieffects"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GEOMETRICTRANSFORM
+	bool "geometrictransform"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GSETTINGS
+	bool "gsettings"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_HDVPARSE
+	bool "hdvparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_HLS
+	bool "hls"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ID3TAG
+	bool "id3tag"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_INTER
+	bool "inter"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_INTERLACE
+	bool "interlace"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_IVFPARSE
+	bool "ivfparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_JP2KDECIMATOR
+	bool "jp2kdecimator"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_JPEGFORMAT
+	bool "jpegformat"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIBRFB
+	bool "librfb"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LINSYS
+	bool "linsys"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIVEADDER
+	bool "liveadder"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGDEMUX
+	bool "mpegdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGPSMUX
+	bool "mpegpsmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGTSDEMUX
+	bool "mpegtsdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGTSMUX
+	bool "mpegtsmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MVE
+	bool "mve"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MXF
+	bool "mxf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NSF
+	bool "nsf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NUVDEMUX
+	bool "nuvdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PATCHDETECT
+	bool "patchdetect"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PCAPPARSE
+	bool "pcapparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PNM
+	bool "pnm"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RAWPARSE
+	bool "rawparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_REAL
+	bool "real"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_REMOVESILENCE
+	bool "removesilence"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RTPMUX
+	bool "rtpmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RTPVP8
+	bool "rtpvp8"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SCALETEMPO
+	bool "scaletempo"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDI
+	bool "sdi"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDP
+	bool "sdp"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SEGMENTCLIP
+	bool "segmentclip"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SIREN
+	bool "siren"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SMOOTH
+	bool "smooth"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SPEED
+	bool "speed"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_STEREO
+	bool "stereo"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SUBENC
+	bool "subenc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_TTA
+	bool "tta"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOFILTERS
+	bool "videofilters"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOMEASURE
+	bool "videomeasure"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOPARSERS
+	bool "videoparsers"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOSIGNAL
+	bool "videosignal"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VMNC
+	bool "vmnc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_Y4M
+	bool "y4m"
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SHM
+	bool "shm"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_APEXSINK
+	bool "apexsink"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_BZ2
+	bool "bz2"
+	select BR2_PACKAGE_BZIP2
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CDAUDIO
+	bool "cdaudio"
+	select BR2_PACKAGE_LIBCDAUDIO
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CELT
+	bool "celt"
+	select BR2_PACKAGE_CELT051
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DIRECTFB
+	bool "directfb"
+	select BR2_PACKAGE_DIRECTFB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_WAYLAND
+	bool "wayland"
+	select BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVB
+	bool "dvb"
+	select BR2_PACKAGE_DVB_APPS
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FBDEV
+	bool "fbdev"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FAAD
+	bool "faad"
+	select BR2_PACKAGE_FAAD2
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIBMMS
+	bool "libmms"
+	select BR2_PACKAGE_LIBMMS
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEG2ENC
+	bool "mpeg2enc"
+	select BR2_PACKAGE_LIBMPEG2
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPG123
+	bool "mpg123"
+	select BR2_PACKAGE_MPG123
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MUSEPACK
+	bool "musepack"
+	select BR2_PACKAGE_MUSEPACK
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NEON
+	bool "neon"
+	select BR2_PACKAGE_NEON
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_OPENCV
+	bool "opencv"
+	select BR2_PACKAGE_OPENCV
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_OPUS
+	bool "opus"
+	select BR2_PACKAGE_OPUS
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_EGLGLES
+	bool "eglgles"
+	select BR2_PACKAGE_OPENGL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RSVG
+	bool "rsvg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBRSVG
+
+comment "rsvg plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDL
+	bool "sdl"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SNDFILE
+	bool "sndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
+
+comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VCD
+	bool "vcd"
+
+endif
+
diff --git a/package/multimedia/gst-plugins-bad1/gst-plugins-bad1.mk b/package/multimedia/gst-plugins-bad1/gst-plugins-bad1.mk
new file mode 100644
index 0000000..d56f63a
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad1/gst-plugins-bad1.mk
@@ -0,0 +1,654 @@
+#############################################################
+#
+# gst-plugins-bad1
+#
+#############################################################
+GST_PLUGINS_BAD1_VERSION = 1.0.7
+GST_PLUGINS_BAD1_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD1_VERSION).tar.xz
+GST_PLUGINS_BAD1_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+
+GST_PLUGINS_BAD1_CONF_OPT = \
+		--disable-examples \
+		--disable-debug \
+		--disable-valgrind \
+		--disable-directsound \
+		--disable-direct3d \
+		--disable-directdraw \
+		--disable-direct3d9 \
+		--disable-directshow \
+		--disable-android_media \
+		--disable-apple_media \
+		--disable-osx_video \
+		--disable-sdltest \
+		--disable-wininet \
+		--disable-acm
+
+# Options which require currently unpackaged libraries
+GST_PLUGINS_BAD1_CONF_OPT += \
+		--disable-avc \
+		--disable-quicktime \
+		--disable-opensles \
+		--disable-uvch264 \
+		--disable-assrender \
+		--disable-voamrwbenc \
+		--disable-voaacenc \
+		--disable-chromaprint \
+		--disable-cog \
+		--disable-dc1394 \
+		--disable-dirac \
+		--disable-dts \
+		--disable-resindvd \
+		--disable-faac \
+		--disable-flite \
+		--disable-gsm \
+		--disable-jasper \
+		--disable-kate \
+		--disable-ladspa \
+		--disable-lv2 \
+		--disable-modplug \
+		--disable-mimic \
+		--disable-mplex \
+		--disable-musicbrainz \
+		--disable-mythtv \
+		--disable-nas \
+		--disable-ofa \
+		--disable-openal \
+		--disable-pvr \
+		--disable-timidity \
+		--disable-teletextdec \
+		--disable-wildmidi \
+		--disable-soundtouch \
+		--disable-spc \
+		--disable-gme \
+		--disable-swfdec \
+		--disable-xvid \
+		--disable-vdpau \
+		--diasble-schro \
+		--disable-zbar \
+		--disable-rtmp \
+		--disable-spandsp \
+		--disable-sndio
+
+GST_PLUGINS_BAD1_DEPENDENCIES = gst-plugins-base1 gstreamer1
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_BAD1_DEPENDENCIES += orc
+GST_PLUGINS_BAD1_CONF_OPT += --enable-orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ADPCMDEC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-adpcmdec
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-adpcmdec
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ADPCMENC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-adpcmenc
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-adpcmenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AIFF),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-aiff
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-aiff
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ASFMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-asfmux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-asfmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AUDIOVISUALIZERS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-audiovisualizers
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-audiovisualizers
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_AUTOCONVERT),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-autoconvert
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-autoconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_BAYER),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-bayer
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-bayer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CAMERABIN2),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-camerabin2
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-camerabin2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CDXAPARSE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-cdxaparse
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-cdxaparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_COLOREFFECTS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-coloreffects
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-coloreffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DATAURISRC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dataurisrc
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dataurisrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DCCP),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dccp
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dccp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DEBUGUTILS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-debugutils
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DECKLINK),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-decklink
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-decklink
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DTMF),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dtmf
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dtmf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVBSUBOVERLAY),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dvbsuboverlay
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dvbsuboverlay
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVDSPU),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dvdspu
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dvdspu
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FACEOVERLAY),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-faceoverlay
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-faceoverlay
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FESTIVAL),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-festival
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-festival
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FIELDANALYSIS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-fieldanalysis
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-fieldanalysis
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FREEVERB),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-freeverb
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-freeverb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FREI0R),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-frei0r
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-frei0r
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GAUDIEFFECTS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-gaudieffects
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-gaudieffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GEOMETRICTRANSFORM),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-geometrictransform
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-geometrictransform
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GDP),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-gdp
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-gdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_GSETTINGS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-gsettings
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-gsettings
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_HDVPARSE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-hdvparse
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-hdvparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_HLS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-hls
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-hls
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_ID3TAG),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-id3tag
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-id3tag
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_INTER),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-inter
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-inter
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_INTERLACE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-interlace
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-interlace
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_IVFPARSE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-ivfparse
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-ivfparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_JP2KDECIMATOR),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-jp2kdecimator
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-jp2kdecimator
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_JPEGFORMAT),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-jpegformat
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-jpegformat
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIBRFB),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-librfb
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-librfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LINSYS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-linsys
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-linsys
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIVEADDER),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-liveadder
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-liveadder
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGDEMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpegdemux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpegdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGPSMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpegpsmux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpegpsmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGTSDEMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpegtsdemux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpegtsdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEGTSMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpegtsmux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpegtsmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MVE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mve
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mve
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MXF),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mxf
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mxf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NSF),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-nsf
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-nsf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NUVDEMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-nuvdemux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-nuvdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PATCHDETECT),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-patchdetect
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-patchdetect
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PCAPPARSE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-pcapparse
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-pcapparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_PNM),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-pnm
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-pnm
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RAWPARSE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-rawparse
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-rawparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_REAL),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-real
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-real
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_REMOVESILENCE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-removesilence
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-removesilence
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RTPMUX),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-rtpmux
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-rtpmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RTPVP8),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-rtpvp8
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-rtpvp8
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SCALETEMPO),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-scaletempo
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-scaletempo
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDI),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-sdi
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-sdi
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDP),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-sdp
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-sdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SEGMENTCLIP),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-segmentclip
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-segmentclip
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SIREN),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-siren
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-siren
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SMOOTH),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-smooth
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-smooth
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SPEED),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-speed
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-speed
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SUBENC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-subenc
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-subenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_STEREO),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-stereo
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-stereo
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_TTA),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-tta
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-tta
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOFILTERS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-videofilters
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-videofilters
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOMEASURE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-videomeasure
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-videomeasure
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOPARSERS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-videoparsers
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-videoparsers
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VIDEOSIGNAL),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-videosignal
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-videosignal
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VMNC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-vmnc
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-vmnc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_Y4M),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-y4m
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-y4m
+endif
+
+# plugins with deps
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SHM),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-shm
+else
+GST_PLGUINS_BAD1_CONF_OPT += --disable-shm
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_APEXSINK),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD1_DEPENDENCIES += openssl
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-apexsink
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_BZ2),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-bz2
+GST_PLUGINS_BAD1_DEPENDENCIES += bzip2
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-bz2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CDAUDIO),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-cdaudio
+GST_PLUGINS_BAD1_DEPENDENCIES += libcdaudio
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-cdaudio
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CELT),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-celt
+GST_PLUGINS_BAD1_DEPENDENCIES += celt051
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-celt
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_CURL),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-curl
+GST_PLUGINS_BAD1_DEPENDENCIES += libcurl
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-curl
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DIRECTFB),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-directfb
+GST_PLUGINS_BAD1_DEPENDENCIES += directfb
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_WAYLAND),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-wayland
+GST_PLUGINS_BAD1_DEPENDENCIES += wayland
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FAAD),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-faad
+GST_PLUGINS_BAD1_DEPENDENCIES += faad2
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-faad
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_FBDEV),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-fbdev
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-fbdev
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_LIBMMS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-libmms
+GST_PLUGINS_BAD1_DEPENDENCIES += libmms
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-libmms
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPEG2ENC),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpeg2enc
+GST_PLUGINS_BAD1_DEPENDENCIES += libmpeg2
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpeg2enc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MPG123),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-mpg123
+GST_PLUGINS_BAD1_DEPENDENCIES += mpg123
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_MUSEPACK),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-musepack
+GST_PLUGINS_BAD1_DEPENDENCIES += musepack
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-musepack
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_NEON),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-neon
+GST_PLUGINS_BAD1_DEPENDENCIES += neon
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-neon
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_OPENCV),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-opencv
+GST_PLUGINS_BAD1_DEPENDENCIES += opencv
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-opencv
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_OPUS),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-opus
+GST_PLUGINS_BAD1_DEPENDENCIES += opus
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_RSVG),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-rsvg
+GST_PLUGINS_BAD1_DEPENDENCIES += librsvg
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-rsvg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_EGLGLES),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-eglgles
+GST_PLUGINS_BAD1_DEPENDENCIES += opengl
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-eglgles
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SDL),y)
+GST_PLUGINS_BAD1_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+GST_PLUGINS_BAD1_CONF_OPT += --enable-sdl
+GST_PLUGINS_BAD1_DEPENDENCIES += sdl
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_SNDFILE),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-sndfile
+GST_PLUGINS_BAD1_DEPENDENCIES += libsndfile
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_DVB),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-dvb
+GST_PLUGINS_BAD1_DEPENDENCIES += dvb-apps
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-dvb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD1_PLUGIN_VCD),y)
+GST_PLUGINS_BAD1_CONF_OPT += --enable-vcd
+else
+GST_PLUGINS_BAD1_CONF_OPT += --disable-vcd
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
