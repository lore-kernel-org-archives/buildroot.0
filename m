From: Will Newton <will.newton@gmail.com>
Date: Tue, 16 Jun 2009 21:52:56 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: New package.
Message-ID: <20090618085945.3057877826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=157d1c46395cda85322f287fa59915721bd7e41b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


A package of gstreamer plugins that may be of lesser quality or lacking
in features.

Closes #395.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gst-plugins-bad/Config.in       |  171 +++++++++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |  321 ++++++++++++++++++++
 3 files changed, 493 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-plugins-bad/Config.in
 create mode 100644 package/multimedia/gst-plugins-bad/gst-plugins-bad.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index f6af9d6..02a35b8 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -7,6 +7,7 @@ source "package/multimedia/flac/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
+source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
new file mode 100644
index 0000000..16ce4b3
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -0,0 +1,171 @@
+menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
+	bool "gst-plugins-bad"
+	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  A set of plug-ins for GStreamer that may be of poor quality or
+	  lacking some features.
+
+	  http://gstreamer.freedesktop.org/
+
+if BR2_PACKAGE_GST_PLUGINS_BAD
+
+comment "dependency-less plugins"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE
+	bool "aacparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE
+	bool "aiffparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE
+	bool "amrparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT
+	bool "autoconvert"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN
+	bool "camerabin"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
+	bool "legacyresample"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
+	bool "bayer"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
+	bool "cdxaparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP
+	bool "dccp"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
+	bool "debugutils"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
+	bool "dtmf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
+	bool "dvdspu"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
+	bool "festival"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
+	bool "freeze"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE
+	bool "h264parse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB
+	bool "librfb"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER
+	bool "liveadder"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX
+	bool "mpegdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX
+	bool "mpegtsmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE
+	bool "mpeg4videoparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE
+	bool "mpegvideoparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE
+	bool "mve"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF
+	bool "mxf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF
+	bool "nsf"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX
+	bool "nuvdemux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE
+	bool "pcapparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX
+	bool "qtmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE
+	bool "rawparse"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL
+	bool "real"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER
+	bool "rtpmanager"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX
+	bool "rtpmux"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO
+	bool "scaletempo"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP
+	bool "sdp"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR
+	bool "selector"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN
+	bool "siren"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED
+	bool "speed"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC
+	bool "subenc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO
+	bool "stereo"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA
+	bool "tta"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VALVE
+	bool "valve"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL
+	bool "videosignal"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC
+	bool "vmnc"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME
+	bool "xdgmime"
+
+comment "plugins with external dependencies (there may be more available)"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
+	bool "directfb"
+	select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
+	bool "dvb"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
+	bool "fbdev"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON
+	bool "neon"
+	select BR2_PACKAGE_NEON
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4
+	bool "oss4"
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
+	bool "sdl"
+	select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD
+	bool "vcd"
+
+endif
+
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
new file mode 100644
index 0000000..b548a43
--- /dev/null
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -0,0 +1,321 @@
+#############################################################
+#
+# gst-plugins-bad
+#
+#############################################################
+GST_PLUGINS_BAD_VERSION = 0.10.12
+GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
+GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
+GST_PLUGINS_BAD_LIBTOOL_PATCH = NO
+
+GST_PLUGINS_BAD_CONF_OPT = \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		--disable-examples
+
+GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer liboil
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-aacparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-aacparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFFPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-aiffparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-aiffparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AMRPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-amrparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-amrparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-cdxaparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dccp
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dccp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-debugutils
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-debugutils
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dtmf
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-festival
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-festival
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-h264parse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-h264parse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-librfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-liveadder
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-liveadder
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEG4VIDEOPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpeg4videoparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpeg4videoparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mpegvideoparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mpegvideoparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mve
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mve
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-mxf
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-mxf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-nsf
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-nsf
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-nuvdemux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_QTMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-qtmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-qtmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-rawparse
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-rawparse
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-real
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-real
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMANAGER),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmanager
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmanager
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-sdp
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-sdp
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SELECTOR),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-selector
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-selector
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-siren
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-siren
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-speed
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-speed
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-subenc
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-subenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-stereo
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-stereo
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-tta
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-tta
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VALVE),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-valve
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-valve
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-videosignal
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-videosignal
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-vmnc
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-vmnc
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_XDGMIME),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-xdgmime
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-xdgmime
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
+GST_PLUGINS_BAD_DEPENDENCIES += directfb
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvb
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-fbdev
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-neon
+GST_PLUGINS_BAD_DEPENDENCIES += neon
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-neon
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OSS4),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-oss4
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-oss4
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
+GST_PLUGINS_BAD_DEPENDENCIES += sdl
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-bad))
-- 
1.6.0.6
