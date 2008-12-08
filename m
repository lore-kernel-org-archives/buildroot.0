From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 09:55:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:
	gst-plugins-good
Message-ID: <20081208175529.E01423C6ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 09:55:29 -0800 (Mon, 08 Dec 2008)
New Revision: 24330

Log:
gst-plugins-good: add gstreamer good plugins

This patch adds the good plugins for gstreamer, see
http://gstreamer.freedesktop.org/modules/gst-plugins-good.html for more
information.



Added:
   trunk/buildroot/package/multimedia/gst-plugins-good/
   trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:52:24 UTC (rev 24329)
+++ trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:55:29 UTC (rev 24330)
@@ -5,6 +5,7 @@
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
+source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"

Added: trunk/buildroot/package/multimedia/gst-plugins-good/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/Config.in	2008-12-08 17:55:29 UTC (rev 24330)
@@ -0,0 +1,122 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
+	bool "gst-plugins-good"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  A set of well-supported plug-ins for GStreamer under the preferred
+	  license.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_GOOD
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER
+	bool "videofilter"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA
+	bool "alpha"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG
+	bool "apetag"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX
+	bool "audiofx"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE
+	bool "auparse"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT
+	bool "autodetect"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI
+	bool "avi (*.avi video)"
+	default y
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER
+	bool "cutter"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUG
+	bool "debug"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV
+	bool "effectv"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER
+	bool "equalizer"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX
+	bool "id3demux (*.mp3 audio)"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX
+	bool "icydemux"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE
+	bool "interleave"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX
+	bool "flx"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM
+	bool "goom"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1
+	bool "goom2k1"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW
+	bool "law"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL
+	bool "level"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA
+	bool "matroska"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE
+	bool "monoscope"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE
+	bool "multifile"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART
+	bool "multipart"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX
+	bool "qtdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN
+	bool "replaygain"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP
+	bool "rtp"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP
+	bool "rtsp"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE
+	bool "smpte"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
+	bool "spectrum"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
+	bool "udp"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
+	bool "videobox"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP
+	bool "videocrop"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
+	bool "videomixer"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC
+	bool "wavenc"
+
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
+	bool "wavparse (*.wav audio)"
+	default y
+
+endif

Added: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2008-12-08 17:55:29 UTC (rev 24330)
@@ -0,0 +1,239 @@
+#############################################################
+#
+# gst-plugins-good
+#
+#############################################################
+GST_PLUGINS_GOOD_VERSION = 0.10.11
+GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
+GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
+
+GST_PLUGINS_GOOD_CONF_OPT = \
+		$(DISABLE_NLS) \
+		--disable-examples \
+		--disable-directdraw \
+		--disable-directsound \
+		--disable-sunaudio \
+		--disable-osx_audio \
+		--disable-osx_video \
+		--disable-gst_v4l2 \
+		--disable-x \
+		--disable-xshm \
+		--disable-xvideo \
+		--disable-aalibtest \
+		--disable-esdtest \
+		--disable-shout2 \
+		--disable-shout2test
+
+GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-alpha
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-alpha
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-apetag
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-apetag
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-audiofx
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-audiofx
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-auparse
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-auparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-autodetect
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-autodetect
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-avi
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-avi
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-cutter
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-cutter
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUG),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-debug
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-debug
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-effectv
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-effectv
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-equalizer
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-equalizer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-id3demux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-icydemux
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-icydemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-interleave
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-interleave
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-flx
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-flx
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-goom
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-goom
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-law
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-law
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-level
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-level
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-matroska
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-matroska
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-monoscope
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-monoscope
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-multifile
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-multifile
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-multipart
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-multipart
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-qtdemux
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-qtdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-replaygain
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-replaygain
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-rtp
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-rtp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-rtsp
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-rtsp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-smpte
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-smpte
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-spectrum
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-spectrum
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-udp
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-udp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-videobox
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-videobox
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-videocrop
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-videocrop
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-videomixer
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-videomixer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-wavenc
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
