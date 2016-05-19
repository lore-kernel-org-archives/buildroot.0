From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 May 2016 21:15:24 +0200
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: sort plugin
	list alphabetically
Message-ID: <20160519191751.2A480819B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6da6fec4e263e9e8e8e2d9232b1d9c3af87842af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Plugin list for the package is split into 2 parts - dependencyless and
ones with external dependencies. The first list is kept sorted
alphabetically, but the second has entries without any particular order,
so keep it sorted as well.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      | 86 +++++++++++-----------
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 80 ++++++++++----------
 2 files changed, 83 insertions(+), 83 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index facfe58..c4c4e43 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -463,14 +463,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF
 
 comment "plugins with external dependencies"
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
-	bool "shm"
-	help
-	  shared memory sink source
-
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
-	bool "vcd"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
 	select BR2_PACKAGE_OPENSSL
@@ -479,10 +471,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	select BR2_PACKAGE_LIBASS
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
-	bool "voaacenc"
-	select BR2_PACKAGE_VO_AACENC
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
 	select BR2_PACKAGE_BZIP2
@@ -515,18 +503,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB
 	depends on BR2_PACKAGE_DIRECTFB
 	default y
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
-	bool "wayland"
-	depends on BR2_PACKAGE_WAYLAND
-	default y
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
+	bool "dvb"
+	select BR2_PACKAGE_DTV_SCAN_TABLES
+	# FEC_2_5 / QAM_4_NR definitions
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
-	  Wayland Video Sink
+	  DVB elements
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
-	bool "webp"
-	select BR2_PACKAGE_WEBP
-	help
-	  Webp image format plugin
+comment "dvb needs a toolchain w/ headers >= 3.7"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD
 	bool "faad"
@@ -539,6 +525,20 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV
 	help
 	  Linux framebuffer video sink
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	bool "gl"
+	default y
+	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+comment "gl needs the gst1-plugins-bad opengl library"
+	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
+	bool "hls"
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Fragmented streaming plugins
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	depends on BR2_USE_WCHAR # libmms -> libglib2
@@ -638,38 +638,38 @@ comment "rsvg plugin needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
-	bool "gl"
-	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-
-comment "gl needs the gst1-plugins-bad opengl library"
-	depends on !BR2_PACKAGE_GST1_PLUGINS_BAD_HAS_LIB_OPENGL
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM
+	bool "shm"
+	help
+	  shared memory sink source
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	bool "sndfile"
 	select BR2_PACKAGE_LIBSNDFILE
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
-	bool "dvb"
-	select BR2_PACKAGE_DTV_SCAN_TABLES
-	# FEC_2_5 / QAM_4_NR definitions
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-	help
-	  DVB elements
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD
+	bool "vcd"
 
-comment "dvb needs a toolchain w/ headers >= 3.7"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
+	bool "voaacenc"
+	select BR2_PACKAGE_VO_AACENC
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
-	bool "hls"
-	select BR2_PACKAGE_GNUTLS
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
+	bool "wayland"
+	depends on BR2_PACKAGE_WAYLAND
+	default y
 	help
-	  Fragmented streaming plugins
+	  Wayland Video Sink
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
+	bool "webp"
+	select BR2_PACKAGE_WEBP
+	help
+	  Webp image format plugin
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e2446a3..c3c4682 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -590,18 +590,6 @@ endif
 
 # Plugins with dependencies
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-shm
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-shm
-endif
-
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-vcd
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-vcd
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
@@ -616,13 +604,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-assrender
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-voaacenc
-GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-voaacenc
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-bz2
 GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
@@ -650,13 +631,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-decklink
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-webp
-GST1_PLUGINS_BAD_DEPENDENCIES += webp
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-directfb
 GST1_PLUGINS_BAD_DEPENDENCIES += directfb
@@ -664,6 +638,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-directfb
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvb
+GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvb
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-faad
 GST1_PLUGINS_BAD_DEPENDENCIES += faad2
@@ -678,6 +659,19 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-gl
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
+GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-libmms
 GST1_PLUGINS_BAD_DEPENDENCIES += libmms
@@ -749,12 +743,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-gl
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-gl
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
 GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
@@ -763,6 +751,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdl
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-shm
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-shm
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sndfile
 GST1_PLUGINS_BAD_DEPENDENCIES += libsndfile
@@ -770,18 +764,24 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvb
-GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-vcd
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvb
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-vcd
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
-GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-voaacenc
+GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
 else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-voaacenc
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webp
+GST1_PLUGINS_BAD_DEPENDENCIES += webp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
