From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Jun 2013 16:00:28 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add gstreamer1 bad
	plugins
Message-ID: <20130621143540.AA38F9AF72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6afdb607cd3741bd4fa6fa0e859f763feccdf28d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds gstreamer 1.X bad plugins

[Peter: strip trailing newlines in Config.in]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst1-plugins-bad/Config.in      |  446 +++++++++++++
 .../gst1-plugins-bad-use-gettext-0.18.patch        |   17 +
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  678 ++++++++++++++++++++
 4 files changed, 1142 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 935fde8..318dd74 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -16,6 +16,7 @@ source "package/multimedia/gst1-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst1-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
+source "package/multimedia/gst1-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/gst-plugin-x170/Config.in"
 source "package/multimedia/lame/Config.in"
diff --git a/package/multimedia/gst1-plugins-bad/Config.in b/package/multimedia/gst1-plugins-bad/Config.in
new file mode 100644
index 0000000..7eb531a
--- /dev/null
+++ b/package/multimedia/gst1-plugins-bad/Config.in
@@ -0,0 +1,446 @@
+menuconfig BR2_PACKAGE_GST1_PLUGINS_BAD
+	bool "gst1-plugins-bad"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	help
+	  A set of plug-ins for GStreamer that may be of poor quality or
+	  lacking some features.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST1_PLUGINS_BAD
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC
+	bool "adpcmdec"
+	help
+	  ADPCM decoder
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMENC
+	bool "adpcmenc"
+	help
+	  ADPCM encoder
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF
+	bool "aiff"
+	help
+	  Create and parse Audio interchange File Format (AIFF) files
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX
+	bool "asfmux"
+	help
+	  ASF Muxer Plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
+	bool "audiovisualizers"
+	help
+	  Creates video visualizations of audio input
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT
+	bool "autoconvert"
+	help
+	  Selects convertor element based on caps
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BAYER
+	bool "bayer"
+	help
+	  Elements to convert Bayer images
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2
+	bool "camerabin2"
+	help
+	  Take image snapshots and record movies from camera
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE
+	bool "cdxaparse"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS
+	bool "coloreffects"
+	help
+	  Color Look-up Table filters
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC
+	bool "dataurisrc"
+	help
+	  data: URI source
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP
+	bool "dccp"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+	help
+	  Collection of elements that may or may not be useful for debugging
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTMF
+	bool "dtmf"
+	help
+	  DTMF plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
+	bool "dvdsuboverlay"
+	help
+	  DTMF plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVDSPU
+	bool "dvdspu"
+	help
+	  DVD Sub-picture Overlay element
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY
+	bool "faceoverlay"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FESTIVAL
+	bool "festival"
+	help
+	  Synthesizes plain text into audio
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
+	bool "fieldanalysis"
+	help
+	  Video field analysis
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREEVERB
+	bool "freeverb"
+	help
+	  Reverberation/room effect
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREI0R
+	bool "frei0r"
+	help
+	  frei0r plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS
+	bool "gaudieffects"
+	help
+	  Gaudi video effects
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM
+	bool "geometrictransform"
+	help
+	  Various geometric image transform elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP
+	bool "gdp"
+	help
+	  Payload/depayload GDP packets
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE
+	bool "hdvparse"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
+	bool "hls"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG
+	bool "id3tag"
+	help
+	  ID3 v1 and v2 muxing plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTER
+	bool "inter"
+	help
+	  plugin for inter-pipeline communication
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTERLACE
+	bool "interlace"
+	help
+	  Create an interlaced video stream
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE
+	bool "ivfparse"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR
+	bool "jp2kdecimator"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JPEGFORMAT
+	bool "jpegformat"
+	help
+	  JPEG interchange format plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB
+	bool "librfb"
+	help
+	  Connects to a VNC server and decodes RFB stream
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER
+	bool "liveadder"
+	help
+	  Adds multiple live discontinuous streams
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX
+	bool "mpegdemux"
+	help
+	  MPEG-PS demuxer
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX
+	bool "mpegtsdemux"
+	help
+	  MPEG TS demuxer
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSMUX
+	bool "mpegtsmux"
+	help
+	  MPEG-TS muxer
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX
+	bool "mpegpsmux"
+	help
+	  MPEG-PS muxer
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE
+	bool "mve"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF
+	bool "mxf"
+	help
+	  MXF plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX
+	bool "nuvdemux"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT
+	bool "patchdetect"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE
+	bool "pcapparse"
+	help
+	  Element parsing raw pcap streams
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM
+	bool "pnm"
+	help
+	  PNM plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
+	bool "rawparse"
+	help
+	  Parses byte streams into raw frames
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
+	bool "real"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
+	bool "removesilence"
+	help
+	  Removes silence from an audio stream
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPMUX
+	bool "rtpmux"
+	help
+	  RTP Muxer plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPVP8
+	bool "rtpvp8"
+	help
+	  rtpvp8
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCALETEMPO
+	bool "scaletempo"
+	help
+	  Scale audio tempo in sync with playback rate
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
+	bool "sdi"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP
+	bool "sdp"
+	help
+	  configure streaming sessions using SDP
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SEGMENTCLIP
+	bool "segmentclip"
+	help
+	  Segment clip elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SIREN
+	bool "siren"
+	help
+	  Siren encoder/decoder/payloader/depayloader plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SMOOTH
+	bool "smooth"
+	help
+	  Apply a smooth filter to an image
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SPEED
+	bool "speed"
+	help
+	  Set speed/pitch on audio/raw streams (resampler)
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
+	bool "subenc"
+	help
+	  subtitle encoders
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
+	bool "stereo"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
+	bool "tta"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS
+	bool "videofilters"
+	help
+	  Video filters in gst-plugins-bad
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
+	bool "videomeasure"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
+	bool "videoparsers"
+	help
+	  videoparsers
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
+	bool "videosignal"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC
+	bool "vmnc"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M
+	bool "y4m"
+	help
+	  Demuxes/decodes YUV4MPEG streams
+
+comment "plugins with external dependencies"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
+	bool "shm"
+	help
+	  shared memory sink source
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
+	bool "vcd"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
+	bool "apexsink"
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
+	bool "bz2"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Compress or decompress streams
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO
+	bool "cdaudio"
+	select BR2_PACKAGE_LIBCDAUDIO
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CELT
+	bool "celt"
+	select BR2_PACKAGE_CELT051
+	help
+	  CELT plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  libcurl-based elements
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK
+	depends on BR2_INSTALL_LIBSTDCPP
+	bool "decklink"
+	help
+	  Blackmagic Decklink plugin
+
+comment "decklink requires a toolchain with C++ support enabled"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
+	bool "directfb"
+	select BR2_PACKAGE_DIRECTFB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
+	bool "wayland"
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Wayland Video Sink
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD
+	bool "faad"
+	select BR2_PACKAGE_FAAD2
+	help
+	  Free AAC Decoder (FAAD)
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
+	bool "fbdev"
+	help
+	  Linux framebuffer video sink
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
+	bool "libmms"
+	select BR2_PACKAGE_LIBMMS
+	help
+	  Microsoft Multi Media Server streaming protocol support
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
+	bool "mpeg2enc"
+	select BR2_PACKAGE_LIBMPEG2
+	help
+	  High-quality MPEG-1/2 video encoder
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
+	bool "mpg123"
+	select BR2_PACKAGE_MPG123
+	help
+	  mp3 decoding based on the mpg123 library
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK
+	bool "musepack"
+	select BR2_PACKAGE_MUSEPACK
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
+	bool "neon"
+	select BR2_PACKAGE_NEON
+	help
+	  lib neon http client src
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
+	bool "opencv"
+	select BR2_PACKAGE_OPENCV
+	help
+	  GStreamer OpenCV Plugins
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
+	bool "opus"
+	select BR2_PACKAGE_OPUS
+	help
+	  OPUS plugin library
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
+	bool "rsvg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBRSVG
+	help
+	  RSVG plugin library
+
+comment "rsvg plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
+	bool "eglgles"
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES
+	help
+	  EGL/GLES sink
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
+	bool "sdl"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
+	bool "sndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+	depends on BR2_LARGEFILE
+
+comment "gst-plugins-bad-plugin-sndfile requires a toolchain with LARGEFILE support"
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
+	bool "dvb"
+	select BR2_PACKAGE_DVB_APPS
+	help
+	  DVB elements
+
+endif
diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
new file mode 100644
index 0000000..ebf4567
--- /dev/null
+++ b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad-use-gettext-0.18.patch
@@ -0,0 +1,17 @@
+Use newer version of gettext to match current buildroot gettext.
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+----
+Index: gst1-plugins-bad-1.1.1/po/Makefile.in.in
+===================================================================
+--- gst1-plugins-bad-1.1.1.orig/po/Makefile.in.in
++++ gst1-plugins-bad-1.1.1/po/Makefile.in.in
+@@ -9,7 +9,7 @@
+ # General Public License and is *not* in the public domain.
+ #
+ # Origin: gettext-0.17
+-GETTEXT_MACRO_VERSION = 0.17
++GETTEXT_MACRO_VERSION = 0.18
+ 
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
diff --git a/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
new file mode 100644
index 0000000..1e61bd2
--- /dev/null
+++ b/package/multimedia/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -0,0 +1,678 @@
+###############################################################################
+#
+# gst1-plugins-bad
+#
+###############################################################################
+
+GST1_PLUGINS_BAD_VERSION = 1.0.7
+GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
+GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
+# Unknown and GPL licensed plugins will append to GST1_PLUGINS_BAD_LICENSE if
+# enabled.
+GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
+
+GST1_PLUGINS_BAD_AUTORECONF = YES
+GST1_PLUGINS_BAD_AUTORECONF_OPT = -I $(@D)/common/m4
+
+GST1_PLUGINS_BAD_CONF_OPT = \
+	--disable-examples \
+	--disable-debug \
+	--disable-valgrind \
+	--disable-directsound \
+	--disable-wsapi \
+	--disable-direct3d \
+	--disable-directdraw \
+	--disable-direct3d9 \
+	--disable-directshow \
+	--disable-android_media \
+	--disable-apple_media \
+	--disable-osx_video \
+	--disable-sdltest \
+	--disable-wininet \
+	--disable-acm
+
+# Options which require currently unpackaged libraries
+GST1_PLUGINS_BAD_CONF_OPT += \
+	--disable-avc \
+	--disable-quicktime \
+	--disable-mfc \
+	--disable-opensles \
+	--disable-uvch264 \
+	--disable-assrender \
+	--disable-voamrwbenc \
+	--disable-voaacenc \
+	--disable-chromaprint \
+	--disable-dash \
+	--disable-dc1394 \
+	--disable-dts \
+	--disable-resindvd \
+	--disable-faac \
+	--disable-flite \
+	--disable-gsm \
+	--disable-fluidsynth \
+	--disable-kate \
+	--disable-ladspa \
+	--disable-lv2 \
+	--disable-strp \
+	--disable-linsys \
+	--disable-modplug \
+	--disable-mimic \
+	--disable-mplex \
+	--disable-mythtv \
+	--disable-nas \
+	--disable-ofa \
+	--disable-openal \
+	--disable-openjpeg \
+	--disable-pvr \
+	--disable-timidity \
+	--disable-teletextdec \
+	--disable-wildmidi \
+	--disable-smoothstreaming \
+	--disable-soundtouch \
+	--disable-spc \
+	--disable-gme \
+	--disable-xvid \
+	--disable-vdpau \
+	--disable-sbc \
+	--disable-schro \
+	--disable-zbar \
+	--disable-rtmp \
+	--disable-spandsp \
+	--disable-gsettings \
+	--disable-sndio \
+	--disable-hls
+
+GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST1_PLUGINS_BAD_DEPENDENCIES += orc
+GST1_PLUGINS_BAD_CONF_OPT += --enable-orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-adpcmdec
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-adpcmenc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-adpcmenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-aiff
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-aiff
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-asfmux
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-asfmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
+GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-audiovisualizers
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BAYER),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-bayer
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-bayer
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-camerabin2
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-camerabin2
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-cdxaparse
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dataurisrc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dataurisrc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dccp
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dccp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-debugutils
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTMF),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dtmf
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dtmf
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dvbsuboverlay
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVDSPU),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-faceoverlay
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-faceoverlay
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-festival
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-festival
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-fieldanalysis
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREEVERB),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-freeverb
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-freeverb
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREI0R),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-frei0r
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-frei0r
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-gaudieffects
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-gaudieffects
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-geometrictransform
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-geometrictransform
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-gdp
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-gdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-hdvparse
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-hls
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-hls
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-id3tag
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-id3tag
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTER),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-inter
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-inter
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTERLACE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-interlace
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-interlace
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-ivfparse
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-jp2kdecimator
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-jpegformat
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-librfb
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-librfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-liveadder
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-liveadder
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegtsdemux
+GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegtsdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
+GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mve
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mve
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mxf
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mxf
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-nuvdemux
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-patchdetect
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-patchdetect
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-pnm
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-pnm
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-rawparse
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-rawparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-real
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-real
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-removesilence
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-removesilence
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPMUX),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTPVP8),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-rtpvp8
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-rtpvp8
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-sdi
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-sdi
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-sdp
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-sdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-segmentclip
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-segmentclip
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SIREN),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-siren
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-siren
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SMOOTH),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-smooth
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-smooth
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SPEED),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-speed
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-speed
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-subenc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-subenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-stereo
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-stereo
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-tta
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-tta
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-videofilters
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-videofilters
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-videomeasure
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-videoparsers
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-videoparsers
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-videosignal
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-videosignal
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-vmnc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-vmnc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-y4m
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-y4m
+endif
+
+# Plugins with dependencies
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-shm
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-shm
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-vcd
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-vcd
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-bz2
+GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-bz2
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST1_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CELT),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-celt
+GST1_PLUGINS_BAD_DEPENDENCIES += celt051
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-celt
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-curl
+GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-curl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-decklink
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-decklink
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-directfb
+GST1_PLUGINS_BAD_DEPENDENCIES += directfb
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-wayland
+GST1_PLUGINS_BAD_DEPENDENCIES += wayland
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-wayland
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST1_PLUGINS_BAD_DEPENDENCIES += faad2
+GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-faad
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-fbdev
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-fbdev
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-libmms
+GST1_PLUGINS_BAD_DEPENDENCIES += libmms
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-libmms
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpeg2enc
+GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2
+GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpeg2enc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-mpg123
+GST1_PLUGINS_BAD_DEPENDENCIES += mpg123
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-musepack
+GST1_PLUGINS_BAD_DEPENDENCIES += musepack
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-musepack
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-neon
+GST1_PLUGINS_BAD_DEPENDENCIES += neon
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-neon
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-opencv
+GST1_PLUGINS_BAD_DEPENDENCIES += opencv
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-opencv
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-opus
+GST1_PLUGINS_BAD_DEPENDENCIES += opus
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-rsvg
+GST1_PLUGINS_BAD_DEPENDENCIES += librsvg
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-rsvg
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-eglgles
+GST1_PLUGINS_BAD_DEPENDENCIES += libegl libgles
+
+ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
+# RPI has odd locations for several required headers.
+GST1_PLUGINS_BAD_CONF_OPT += --with-egl-window-system=rpi
+GST1_PLUGINS_BAD_CONF_ENV += \
+	CFLAGS="$(TARGET_CFLAGS) \
+	-I$(STAGING_DIR)/usr/include/IL \
+	-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
+endif
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-eglgles
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
+GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
+GST1_PLUGINS_BAD_CONF_OPT += --enable-sdl
+GST1_PLUGINS_BAD_DEPENDENCIES += sdl
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-sndfile
+GST1_PLUGINS_BAD_DEPENDENCIES += libsndfile
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-sndfile
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-dvb
+GST1_PLUGINS_BAD_DEPENDENCIES += dvb-apps
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-dvb
+endif
+
+# Add GPL license if GPL licensed plugins enabled.
+ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
+GST1_PLUGINS_BAD_LICENSE += GPL
+endif
+
+# Add Unknown license if Unknown licensed plugins enabled.
+ifeq ($(GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE),y)
+GST1_PLUGINS_BAD_LICENSE += UNKNOWN
+endif
+
+# Use the following command to extract license info for plugins.
+# # find . -name 'plugin-*.xml' | xargs grep license
+
+$(eval $(autotools-package))
