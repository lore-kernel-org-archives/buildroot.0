From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu,  9 May 2013 15:51:14 -0500
Subject: [Buildroot] [PATCH v2 3/6] gst-plugins-good1: add gstreamer1 good
	plugins
In-Reply-To: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
References: <1368132677-1261-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1368132677-1261-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds gstreamer 1.X good plugins.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-good1/Config.in     |  213 +++++++++++
 .../gst-plugins-good1/gst-plugins-good1.mk         |  400 ++++++++++++++++++++
 3 files changed, 614 insertions(+)
 create mode 100644 package/multimedia/gst-plugins-good1/Config.in
 create mode 100644 package/multimedia/gst-plugins-good1/gst-plugins-good1.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index eba230a..9948e9f 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -14,6 +14,7 @@ source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-base1/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst-plugins-good1/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
diff --git a/package/multimedia/gst-plugins-good1/Config.in b/package/multimedia/gst-plugins-good1/Config.in
new file mode 100644
index 0000000..8cc8f20
--- /dev/null
+++ b/package/multimedia/gst-plugins-good1/Config.in
@@ -0,0 +1,213 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD1
+	bool "gst-plugins-good1"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST_PLUGINS_BASE1
+	help
+	  A set of well-supported plug-ins for GStreamer under the preferred
+	  license.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_GOOD1
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_JPEG
+	bool "jpeg (JPEG support)"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PNG
+	bool "png (PNG support)"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_BZ2
+	bool "bz2 support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MATROSKA
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bz2 support for the following plugins:
+	  matroska
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_ZLIB
+	bool "zlib support"
+	depends on BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_QTDEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ID3DEMUX || BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MATROSKA
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable zlib support for the following plugins:
+	  id3demux, qtdemux, matroska
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ALPHA
+	bool "alpha"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_APETAG
+	bool "apetag"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUDIOFX
+	bool "audiofx"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUDIOPARSERS
+	bool "audioparsers"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUPARSE
+	bool "auparse"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUTODETECT
+	bool "autodetect"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AVI
+	bool "avi (*.avi video)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_CUTTER
+	bool "cutter"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_DEINTERLACE
+	bool "deinterlace"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_EFFECTV
+	bool "effectv"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_EQUALIZER
+	bool "equalizer"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLV
+	bool "flv"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLX
+	bool "flx"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GOOM
+	bool "goom"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GOOM2K1
+	bool "goom2k1"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ID3DEMUX
+	bool "id3demux (*.mp3 audio)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ICYDEMUX
+	bool "icydemux"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_IMAGEFREEZE
+	bool "imagefreeze"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_INTERLEAVE
+	bool "interleave"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ISOMP4
+	bool "isomp4"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_LAW
+	bool "law"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_LEVEL
+	bool "level"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MATROSKA
+	bool "matroska"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MONOSCOPE
+	bool "monoscope"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MULTIFILE
+	bool "multifile"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MULTIPART
+	bool "multipart"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_REPLAYGAIN
+	bool "replaygain"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTP
+	bool "rtp"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTPMANAGER
+	bool "rtpmanager"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTSP
+	bool "rtsp"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SHAPEWIPE
+	bool "shapewipe"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SMPTE
+	bool "smpte"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SPECTRUM
+	bool "spectrum"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_UDP
+	depends on BR2_INET_IPV6
+	bool "udp"
+
+comment "udp requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOBOX
+	bool "videobox"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOCROP
+	bool "videocrop"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOFILTER
+	bool "videofilter"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOMIXER
+	bool "videomixer"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVENC
+	bool "wavenc"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPARSE
+	bool "wavparse (*.wav audio)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_Y4M
+	bool "y4m"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_V4L2
+	bool "v4l2"
+
+comment "plugins with external dependencies"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_CAIRO
+	bool "cairo"
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLAC
+	bool "flac (libFLAC)"
+	select BR2_PACKAGE_FLAC
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GDKPIXBUF
+	bool "gdkpixbuf"
+	select BR2_PACKAGE_GDK_PIXBUF
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_OSS
+	bool "ossaudio (OSS audio)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_OSS4
+	bool "oss4 (Open Sound System 4)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_PULSE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pulseaudio
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	select BR2_PACKAGE_PULSEAUDIO
+	bool "pulseaudio"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SOUPHTTPSRC
+	bool "souphttpsrc (http client)"
+	select BR2_PACKAGE_LIBSOUP
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SPEEX
+	bool "speex"
+	select BR2_PACKAGE_SPEEX
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPACK
+	bool "wavpack (*.wv audio)"
+	select BR2_PACKAGE_WAVPACK
+
+endif
diff --git a/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk b/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk
new file mode 100644
index 0000000..befc9a7
--- /dev/null
+++ b/package/multimedia/gst-plugins-good1/gst-plugins-good1.mk
@@ -0,0 +1,400 @@
+#############################################################
+#
+# gst-plugins-good1
+#
+#############################################################
+GST_PLUGINS_GOOD1_VERSION = 1.0.7
+GST_PLUGINS_GOOD1_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD1_VERSION).tar.xz
+GST_PLUGINS_GOOD1_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+
+GST_PLUGINS_GOOD1_CONF_OPT = \
+		--disable-debug \
+		--disable-valgrind \
+		--disable-examples \
+		--disable-directsound \
+		--disable-sunaudio \
+		--disable-osx_audio \
+		--disable-osx_video \
+		--disable-aalib \
+		--disable-aalibtest \
+		--disable-libcaca \
+		--disable-esd \
+		--disable-esdtest \
+		--disable-shout2
+
+# Options which require currently unpackaged libraries
+GST_PLUGINS_GOOD1_CONF_OPT += \
+		--disable-jack \
+		--disable-libdv \
+		--disable-dv1394 \
+		--disable-taglib \
+		--disable-vpx
+
+GST_PLUGINS_GOOD1_DEPENDENCIES = gstreamer1 gst-plugins-base1
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST_PLUGINS_GOOD1_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+GST_PLUGINS_GOOD1_CONF_OPT += \
+	--enable-x \
+	--enable-xshm \
+	--enable-xvideo
+else
+GST_PLUGINS_GOOD1_CONF_OPT += \
+	--disable-x \
+	--disable-xshm \
+	--disable-xvideo
+endif
+
+ifeq ($(BR2_PACKAGE_ORC),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-orc
+GST_PLUGINS_GOOD1_DEPENDENCIES += orc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_JPEG),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-jpeg
+GST_PLUGINS_GOOD1_DEPENDENCIES += jpeg
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PNG),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-libpng
+GST_PLUGINS_GOOD1_DEPENDENCIES += libpng
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_BZ2),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-bz2
+GST_PLUGINS_GOOD1_DEPENDENCIES += bzip2
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-bz2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_ZLIB),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-zlib
+GST_PLUGINS_GOOD1_DEPENDENCIES += zlib
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ALPHA),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-alpha
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-alpha
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_APETAG),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-apetag
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-apetag
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUDIOFX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-audiofx
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-audiofx
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUDIOPARSERS),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-audioparsers
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-audioparsers
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUPARSE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-auparse
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-auparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AUTODETECT),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-autodetect
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-autodetect
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_AVI),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-avi
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-avi
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_CUTTER),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-cutter
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-cutter
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_DEBUGUTILS),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-debugutils
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_DEINTERLACE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-deinterlace
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-deinterlace
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_EFFECTV),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-effectv
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-effectv
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_EQUALIZER),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-equalizer
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-equalizer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLV),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-flv
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-flv
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-flx
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-flx
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GOOM),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-goom
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-goom
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GOOM2K1),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-goom2k1
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-goom2k1
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ID3DEMUX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-id3demux
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-id3demux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ICYDEMUX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-icydemux
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-icydemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_IMAGEFREEZE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-imagefreeze
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-imagefreeze
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_INTERLEAVE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-interleave
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-interleave
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_ISOMP4),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-isomp4
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-isomp4
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_LAW),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-law
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-law
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_LEVEL),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-level
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-level
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MATROSKA),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-matroska
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-matroska
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MONOSCOPE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-monoscope
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-monoscope
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MULTIFILE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-multifile
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-multifile
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_MULTIPART),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-multipart
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-multipart
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_REPLAYGAIN),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-replaygain
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-replaygain
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTP),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-rtp
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-rtp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTPMANAGER),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-rtpmanager
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-rtpmanager
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_RTSP),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-rtsp
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-rtsp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SHAPEWIPE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-shapewipe
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-shapewipe
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SMPTE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-smpte
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-smpte
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SPECTRUM),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-spectrum
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-spectrum
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_UDP),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-udp
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-udp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOBOX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-videobox
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-videobox
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOCROP),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-videocrop
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-videocrop
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOFILTER),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-videofilter
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-videofilter
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_VIDEOMIXER),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-videomixer
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-videomixer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVENC),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-wavenc
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-wavenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPARSE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-wavparse
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-wavparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_Y4M),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-y4m
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-y4m
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_V4L2),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-gst_v4l2
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-gst_v4l2
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_CAIRO),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-cairo
+GST_PLUGINS_GOOD1_DEPENDENCIES += cairo
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-cairo
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_FLAC),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-flac
+GST_PLUGINS_GOOD1_DEPENDENCIES += flac
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-flac
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_GDKPIXBUF),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-gdk_pixbuf
+GST_PLUGINS_GOOD1_DEPENDENCIES += gdk-pixbuf
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-gdk_pixbuf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_OSS),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-oss
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-oss
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_OSS4),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-oss4
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-oss4
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_PULSE),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-pulse
+GST_PLUGINS_GOOD1_DEPENDENCIES += pulseaudio
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SOUPHTTPSRC),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-soup
+GST_PLUGINS_GOOD1_DEPENDENCIES += libsoup
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-soup
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_SPEEX),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-speex
+GST_PLUGINS_GOOD1_DEPENDENCIES += speex
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD1_PLUGIN_WAVPACK),y)
+GST_PLUGINS_GOOD1_CONF_OPT += --enable-wavpack
+GST_PLUGINS_GOOD1_DEPENDENCIES += wavpack
+else
+GST_PLUGINS_GOOD1_CONF_OPT += --disable-wavpack
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
