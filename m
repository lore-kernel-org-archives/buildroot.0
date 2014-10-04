From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Oct 2014 18:11:20 +0200
Subject: [Buildroot] [RFC 2/3] Rename XBMC to Kodi - part II - rename
	variables
In-Reply-To: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412439081-2975-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add xbmc-related options to Config.in.legacy

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                           |  119 +++++++++++++++
 package/kodi/Config.in                     |  100 ++++++-------
 package/kodi/S50kodi                       |   16 +-
 package/kodi/br-kodi                       |   16 +-
 package/kodi/kodi.mk                       |  222 ++++++++++++++--------------
 package/kodi/kodi.service                  |    2 +-
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk |    2 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk |    2 +-
 8 files changed, 299 insertions(+), 180 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6e202fe..ba68fa7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,125 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_PACKAGE_XBMC
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_ALSA_LIB
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_ALSA_LIB
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_AVAHI
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_AVAHI
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_DBUS
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_DBUS
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBBLURAY
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBBLURAY
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_GOOM
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_GOOM
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_RSXS
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_RSXS
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBCEC
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBCEC
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBMICROHTTPD
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBMICROHTTPD
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBNFS
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBNFS
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_RTMPDUMP
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_RTMPDUMP
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBSHAIRPLAY
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBSMBCLIENT
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBSMBCLIENT
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBTHEORA
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBTHEORA
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBUSB
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBUSB
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_LIBVA
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_LIBVA
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
+config BR2_PACKAGE_XBMC_WAVPACK
+	bool "xbmc options have been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_KODI_WAVPACK
+	help
+	  The XBMC media center project was renamed to Kodi entertainment center
+
 config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 	bool "Xceive xc5000 option has been renamed"
 	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a7337d5..b3b6fc2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,35 +1,35 @@
-config BR2_PACKAGE_XBMC_ARCH_SUPPORTS
+config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm || BR2_i386 || BR2_x86_64
 
-comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
-	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
+comment "kodi needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
+	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
-config BR2_PACKAGE_XBMC_EGL_GLES
+config BR2_PACKAGE_KODI_EGL_GLES
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	depends on !BR2_PACKAGE_XBMC_GL # prefer GL if available
+	depends on !BR2_PACKAGE_KODI_GL # prefer GL if available
 
-config BR2_PACKAGE_XBMC_GL
+config BR2_PACKAGE_KODI_GL
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on !BR2_arm # xbmc needs egl/gles on arm
+	depends on !BR2_arm # kodi needs egl/gles on arm
 
-comment "xbmc needs an OpenGL or an openGL ES and EGL backend"
+comment "kodi needs an OpenGL or an openGL ES and EGL backend"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_XBMC_GL && !BR2_PACKAGE_XBMC_EGL_GLES
+	depends on !BR2_PACKAGE_KODI_GL && !BR2_PACKAGE_KODI_EGL_GLES
 
-comment "xbmc requires an OpenGL ES and EGL backend"
+comment "kodi requires an OpenGL ES and EGL backend"
 	depends on BR2_arm
-	depends on !BR2_PACKAGE_XBMC_EGL_GLES
+	depends on !BR2_PACKAGE_KODI_EGL_GLES
 
-menuconfig BR2_PACKAGE_XBMC
-	bool "xbmc"
+menuconfig BR2_PACKAGE_KODI
+	bool "kodi"
 	select BR2_NEEDS_HOST_JAVA
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_THREAD
@@ -44,8 +44,8 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
-	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XBMC_GL
-	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
@@ -75,56 +75,56 @@ menuconfig BR2_PACKAGE_XBMC
 	select BR2_PACKAGE_PYTHON_UNICODEDATA
 	select BR2_PACKAGE_PYTHON_ZLIB
 	select BR2_PACKAGE_READLINE
-	select BR2_PACKAGE_SDL if BR2_PACKAGE_XBMC_GL
-	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_XBMC_GL
-	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_XBMC_GL
+	select BR2_PACKAGE_SDL if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_SDL_X11 if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_SDL_IMAGE if BR2_PACKAGE_KODI_GL
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_TINYXML
-	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_XBMC_GL # needed by rsxs screensaver
-	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_XBMC_GL
-	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_XBMC_GL # needed by rsxs screensaver
+	select BR2_PACKAGE_XLIB_XMU if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
+	select BR2_PACKAGE_XLIB_XRANDR if BR2_PACKAGE_KODI_GL
+	select BR2_PACKAGE_XLIB_XT if BR2_PACKAGE_KODI_GL # needed by rsxs screensaver
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_INET_IPV6
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_XBMC_EGL_GLES || BR2_PACKAGE_XBMC_GL
+	depends on BR2_PACKAGE_KODI_EGL_GLES || BR2_PACKAGE_KODI_GL
 	depends on BR2_USE_MMU # python
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	help
-	  XBMC is an award-winning free and open source (GPL) software
+	  KODI is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
 
-	  http://xbmc.org
+	  http://kodi.tv
 
-if BR2_PACKAGE_XBMC
+if BR2_PACKAGE_KODI
 
-config BR2_PACKAGE_XBMC_ALSA_LIB
+config BR2_PACKAGE_KODI_ALSA_LIB
 	bool "alsa"
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	  Enable alsa support.
 
-config BR2_PACKAGE_XBMC_AVAHI
+config BR2_PACKAGE_KODI_AVAHI
 	bool "avahi"
 	depends on !BR2_PREFER_STATIC_LIB # avahi
 	select BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_AVAHI_DAEMON
 	help
 	  Enable Avahi support.
-	  Select this if you want XBMC to support Bonjour protocol.
+	  Select this if you want KODI to support Bonjour protocol.
 
-config BR2_PACKAGE_XBMC_DBUS
+config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
 	help
 	  Enable D-Bus support
 
-config BR2_PACKAGE_XBMC_LIBBLURAY
+config BR2_PACKAGE_KODI_LIBBLURAY
 	bool "blu-ray"
 	select BR2_PACKAGE_LIBBLURAY
 	depends on !BR2_PREFER_STATIC_LIB
@@ -135,43 +135,43 @@ config BR2_PACKAGE_XBMC_LIBBLURAY
 comment "libbluray support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
-config BR2_PACKAGE_XBMC_GOOM
+config BR2_PACKAGE_KODI_GOOM
 	bool "goom screensaver"
-	depends on BR2_PACKAGE_XBMC_GL
+	depends on BR2_PACKAGE_KODI_GL
 	help
 	  Enable goom screensaver
 
 comment "goom needs an OpenGL backend"
-	depends on !BR2_PACKAGE_XBMC_GL
+	depends on !BR2_PACKAGE_KODI_GL
 
-config BR2_PACKAGE_XBMC_RSXS
+config BR2_PACKAGE_KODI_RSXS
 	bool "rsxs screensaver"
-	depends on BR2_PACKAGE_XBMC_GL
+	depends on BR2_PACKAGE_KODI_GL
 	help
 	  Enable goom screensaver
 
 comment "rsxs needs an OpenGL backend"
-	depends on !BR2_PACKAGE_XBMC_GL
+	depends on !BR2_PACKAGE_KODI_GL
 
-config BR2_PACKAGE_XBMC_LIBCEC
+config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
-	  Select this if you want XBMC to support HDMI CEC.
+	  Select this if you want KODI to support HDMI CEC.
 
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
 
-config BR2_PACKAGE_XBMC_LIBMICROHTTPD
+config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Enable webserver feature
 
-config BR2_PACKAGE_XBMC_LIBNFS
+config BR2_PACKAGE_KODI_LIBNFS
 	bool "nfs"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBNFS
@@ -181,42 +181,42 @@ config BR2_PACKAGE_XBMC_LIBNFS
 comment "nfs support needs a toolchain w/ RPC support"
 	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
-config BR2_PACKAGE_XBMC_RTMPDUMP
+config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
 	help
 	  Enable RTMP input support.
 	  Select this if you want to play back rtmp stream.
 
-config BR2_PACKAGE_XBMC_LIBSHAIRPLAY
+config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
-config BR2_PACKAGE_XBMC_LIBSMBCLIENT
+config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
 	select BR2_PACKAGE_SAMBA
 	select BR2_PACKAGE_SAMBA_LIBSMBCLIENT
 	help
 	  Enable Samba support
 
-config BR2_PACKAGE_XBMC_LIBTHEORA
+config BR2_PACKAGE_KODI_LIBTHEORA
 	bool "theora"
 	select BR2_PACKAGE_LIBTHEORA
 	help
 	  Enable Theora input support.
 	  Select this if you want to play back OGG/OGV files (Video).
 
-config BR2_PACKAGE_XBMC_LIBUSB
+config BR2_PACKAGE_KODI_LIBUSB
 	bool "usb"
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  Enable libusb support.
 
-config BR2_PACKAGE_XBMC_LIBVA
+config BR2_PACKAGE_KODI_LIBVA
 	bool "va"
 	select BR2_PACKAGE_LIBVA
 	depends on !BR2_PREFER_STATIC_LIB
@@ -226,16 +226,16 @@ config BR2_PACKAGE_XBMC_LIBVA
 comment "libva support needs toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
-config BR2_PACKAGE_XBMC_WAVPACK
+config BR2_PACKAGE_KODI_WAVPACK
 	bool "wavpack"
 	select BR2_PACKAGE_WAVPACK
 	help
 	  Enable WAV input support.
 	  Select this if you want to play back WV files.
 
-comment "XBMC addons"
+comment "KODI addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
 source "package/xbmc-pvr-addons/Config.in"
 
-endif # BR2_PACKAGE_XBMC
+endif # BR2_PACKAGE_KODI
diff --git a/package/kodi/S50kodi b/package/kodi/S50kodi
index 312452b..f9abbb5 100755
--- a/package/kodi/S50kodi
+++ b/package/kodi/S50kodi
@@ -1,20 +1,20 @@
 #!/bin/sh
 #
-# Starts XBMC.
+# Starts Kodi
 #
 
-BIN=/usr/bin/br-xbmc
-XBMC=/usr/lib/xbmc/xbmc.bin
-XBMC_ARGS="--standalone -fs -n"
-PIDFILE=/var/run/xbmc.pid
+BIN=/usr/bin/br-kodi
+KODI=/usr/lib/xbmc/xbmc.bin
+KODI_ARGS="--standalone -fs -n"
+PIDFILE=/var/run/kodi.pid
 
 start() {
-	echo -n "Starting XBMC: "
-	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $XBMC $XBMC_ARGS
+	echo -n "Starting Kodi: "
+	start-stop-daemon -S -q -b -m -p $PIDFILE --exec $BIN -- $KODI $KODI_ARGS
 	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
 stop() {
-	echo -n "Stopping XBMC: "
+	echo -n "Stopping Kodi: "
 	start-stop-daemon -K -q -p $PIDFILE
 	[ $? == 0 ] && echo "OK" || echo "FAIL"
 }
diff --git a/package/kodi/br-kodi b/package/kodi/br-kodi
index fee5d51..83d4d4e 100755
--- a/package/kodi/br-kodi
+++ b/package/kodi/br-kodi
@@ -1,15 +1,15 @@
 #!/bin/sh
 
-# We're called with the real XBMC executable as
-# first argument, followed by any XBMC extra args
-XBMC="${1}"
+# We're called with the real Kodi executable as
+# first argument, followed by any Kodi extra args
+KODI="${1}"
 shift
 
 # In case someone asked we terminate, just kill
-# the XBMC process
+# the Kodi process
 trap_kill() {
     LOOP=0
-    killall "${XBMC##*/}"
+    killall "${KODI##*/}"
 }
 trap trap_kill INT QUIT TERM
 
@@ -17,11 +17,11 @@ LOOP=1
 while [ ${LOOP} -eq 1 ]; do
     # Hack: BusyBox ash does not catch signals while a non-builtin
     # is running, and only catches the signal when the non-builtin
-    # command ends. So, we just background the XBMC binary, and wait
+    # command ends. So, we just background the Kodi binary, and wait
     # for it. But BusyBox' ash's wait builtin does not return the
     # exit code even if there was only one job (which is correct
-    # for POSIX). So we explicitly wait for the XBMC job
-    "${XBMC}" "${@}" &
+    # for POSIX). So we explicitly wait for the Kodi job
+    "${KODI}" "${@}" &
     wait %1
     ret=$?
     case "${ret}" in
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index c3eeee9..505789b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -1,35 +1,35 @@
 ################################################################################
 #
-# xbmc
+# kodi
 #
 ################################################################################
 
-XBMC_VERSION = 13.2-Gotham
-XBMC_SOURCE = $(XBMC_VERSION).tar.gz
-XBMC_SITE = https://github.com/xbmc/xbmc/archive
-XBMC_LICENSE = GPLv2
-XBMC_LICENSE_FILES = LICENSE.GPL
-# XBMC needs host-sdl_image (and therefore host-sdl) for a host tools it builds
+KODI_VERSION = 13.2-Gotham
+KODI_SOURCE = $(KODI_VERSION).tar.gz
+KODI_SITE = https://github.com/xbmc/xbmc/archive
+KODI_LICENSE = GPLv2
+KODI_LICENSE_FILES = LICENSE.GPL
+# Kodi needs host-sdl_image (and therefore host-sdl) for a host tools it builds
 # called TexturePacker. It is responsible to take all the images used in the
 # GUI and pack them in a blob.
 # http://wiki.xbmc.org/index.php?title=TexturePacker
-XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
-XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
+KODI_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
+KODI_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
 	libass libcdio libcurl libfribidi libgcrypt libmad libmodplug libmpeg2 \
 	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
 	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
 
-# xbmc at i386 depends on nasm
-XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
+# kodi at i386 depends on nasm
+KODI_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
 
 # ffmpeg depends on yasm on MMX archs
-# xbmc configure passes $(BR2_ARCH) to ffmpeg configure which adds
+# kodi configure passes $(BR2_ARCH) to ffmpeg configure which adds
 # yasm as dependency for x86_64, even if BR2_x86_generic=y
 ifneq ($(BR2_X86_CPU_HAS_MMX)$(BR2_x86_64),)
-XBMC_DEPENDENCIES += host-yasm
+KODI_DEPENDENCIES += host-yasm
 endif
 
-XBMC_CONF_ENV = \
+KODI_CONF_ENV = \
 	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
 	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
@@ -39,7 +39,7 @@ XBMC_CONF_ENV = \
 	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
-XBMC_CONF_OPT +=  \
+KODI_CONF_OPT +=  \
 	--with-arch=$(BR2_ARCH) \
 	--disable-crystalhd \
 	--disable-debug \
@@ -57,199 +57,199 @@ XBMC_CONF_OPT +=  \
 	--enable-optimizations
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-XBMC_DEPENDENCIES += rpi-userland
-XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
-XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
+KODI_DEPENDENCIES += rpi-userland
+KODI_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
+KODI_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
 	LIBS="-lvcos -lvchostif"
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
-XBMC_DEPENDENCIES += dbus
-XBMC_CONF_OPT += --enable-dbus
+ifeq ($(BR2_PACKAGE_KODI_DBUS),y)
+KODI_DEPENDENCIES += dbus
+KODI_CONF_OPT += --enable-dbus
 else
-XBMC_CONF_OPT += --disable-dbus
+KODI_CONF_OPT += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_ALSA_LIB),y)
+ifeq ($(BR2_PACKAGE_KODI_ALSA_LIB),y)
 XBMC_DEPENDENCIES += alsa-lib
 XBMC_CONF_OPT += --enable-alsa
 else
-XBMC_CONF_OPT += --disable-alsa
+KODI_CONF_OPT += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_LAME),y)
-XBMC_DEPENDENCIES += lame
-XBMC_CONF_OPT += --enable-libmp3lame
+KODI_DEPENDENCIES += lame
+KODI_CONF_OPT += --enable-libmp3lame
 else
-XBMC_CONF_OPT += --disable-libmp3lame
+KODI_CONF_OPT += --disable-libmp3lame
 endif
 
-# quote from xbmc/configure.in: "GLES overwrites GL if both set to yes."
+# quote from kodi/configure.in: "GLES overwrites GL if both set to yes."
 # we choose the opposite because opengl offers more features, like libva support
-ifeq ($(BR2_PACKAGE_XBMC_GL),y)
-XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
+ifeq ($(BR2_PACKAGE_KODI_GL),y)
+KODI_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
 	xlib_libXmu xlib_libXrandr xlib_libXt
-XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
-ifeq ($(BR2_PACKAGE_XBMC_RSXS),y)
+KODI_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
+ifeq ($(BR2_PACKAGE_KODI_RSXS),y)
 # fix rsxs compile
 # make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
-XBMC_CONF_ENV += \
+KODI_CONF_ENV += \
 	jm_cv_func_gettimeofday_clobber=no \
 	mac_cv_pkg_png=$(STAGING_DIR)/usr/bin/libpng-config \
 	mac_cv_pkg_cppflags="`$(STAGING_DIR)/usr/bin/libpng-config --I_opts --cppflags`" \
 	mac_cv_pkg_cxxflags="`$(STAGING_DIR)/usr/bin/libpng-config --ccopts`" \
 	mac_cv_pkg_ldflags="`$(STAGING_DIR)/usr/bin/libpng-config --L_opts --R_opts`" \
 	mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
-XBMC_CONF_OPT += --enable-rsxs
+KODI_CONF_OPT += --enable-rsxs
 else
-XBMC_CONF_OPT += --disable-rsxs
+KODI_CONF_OPT += --disable-rsxs
 endif
 else
-XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
-ifeq ($(BR2_PACKAGE_XBMC_EGL_GLES),y)
-XBMC_DEPENDENCIES += libegl libgles
-XBMC_CONF_OPT += --enable-gles
+KODI_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+ifeq ($(BR2_PACKAGE_KODI_EGL_GLES),y)
+KODI_DEPENDENCIES += libegl libgles
+KODI_CONF_OPT += --enable-gles
 else
-XBMC_CONF_OPT += --disable-gles
+KODI_CONF_OPT += --disable-gles
 endif
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
-XBMC_CONF_OPT += --enable-goom
+ifeq ($(BR2_PACKAGE_KODI_GOOM),y)
+KODI_CONF_OPT += --enable-goom
 else
-XBMC_CONF_OPT += --disable-goom
+KODI_CONF_OPT += --disable-goom
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
-XBMC_DEPENDENCIES += libusb-compat
-XBMC_CONF_OPT += --enable-libusb
+ifeq ($(BR2_PACKAGE_KODI_LIBUSB),y)
+KODI_DEPENDENCIES += libusb-compat
+KODI_CONF_OPT += --enable-libusb
 else
-XBMC_CONF_OPT += --disable-libusb
+KODI_CONF_OPT += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBMICROHTTPD),y)
-XBMC_DEPENDENCIES += libmicrohttpd
-XBMC_CONF_OPT += --enable-webserver
+ifeq ($(BR2_PACKAGE_KODI_LIBMICROHTTPD),y)
+KODI_DEPENDENCIES += libmicrohttpd
+KODI_CONF_OPT += --enable-webserver
 else
-XBMC_CONF_OPT += --disable-webserver
+KODI_CONF_OPT += --disable-webserver
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBSMBCLIENT),y)
-XBMC_DEPENDENCIES += samba
-XBMC_CONF_OPT += --enable-samba
+ifeq ($(BR2_PACKAGE_KODI_LIBSMBCLIENT),y)
+KODI_DEPENDENCIES += samba
+KODI_CONF_OPT += --enable-samba
 else
-XBMC_CONF_OPT += --disable-samba
+KODI_CONF_OPT += --disable-samba
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBNFS),y)
-XBMC_DEPENDENCIES += libnfs
-XBMC_CONF_OPT += --enable-nfs
+ifeq ($(BR2_PACKAGE_KODI_LIBNFS),y)
+KODI_DEPENDENCIES += libnfs
+KODI_CONF_OPT += --enable-nfs
 else
-XBMC_CONF_OPT += --disable-nfs
+KODI_CONF_OPT += --disable-nfs
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_RTMPDUMP),y)
-XBMC_DEPENDENCIES += rtmpdump
-XBMC_CONF_OPT += --enable-rtmp
+ifeq ($(BR2_PACKAGE_KODI_RTMPDUMP),y)
+KODI_DEPENDENCIES += rtmpdump
+KODI_CONF_OPT += --enable-rtmp
 else
-XBMC_CONF_OPT += --disable-rtmp
+KODI_CONF_OPT += --disable-rtmp
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBBLURAY),y)
-XBMC_DEPENDENCIES += libbluray
-XBMC_CONF_OPT += --enable-libbluray
+ifeq ($(BR2_PACKAGE_KODI_LIBBLURAY),y)
+KODI_DEPENDENCIES += libbluray
+KODI_CONF_OPT += --enable-libbluray
 else
-XBMC_CONF_OPT += --disable-libbluray
+KODI_CONF_OPT += --disable-libbluray
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBSHAIRPLAY),y)
-XBMC_DEPENDENCIES += libshairplay
-XBMC_CONF_OPT += --enable-airplay
+ifeq ($(BR2_PACKAGE_KODI_LIBSHAIRPLAY),y)
+KODI_DEPENDENCIES += libshairplay
+KODI_CONF_OPT += --enable-airplay
 else
-XBMC_CONF_OPT += --disable-airplay
+KODI_CONF_OPT += --disable-airplay
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_AVAHI),y)
-XBMC_DEPENDENCIES += avahi
-XBMC_CONF_OPT += --enable-avahi
+ifeq ($(BR2_PACKAGE_KODI_AVAHI),y)
+KODI_DEPENDENCIES += avahi
+KODI_CONF_OPT += --enable-avahi
 else
-XBMC_CONF_OPT += --disable-avahi
+KODI_CONF_OPT += --disable-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
-XBMC_DEPENDENCIES += libcec
-XBMC_CONF_OPT += --enable-libcec
+ifeq ($(BR2_PACKAGE_KODI_LIBCEC),y)
+KODI_DEPENDENCIES += libcec
+KODI_CONF_OPT += --enable-libcec
 else
-XBMC_CONF_OPT += --disable-libcec
+KODI_CONF_OPT += --disable-libcec
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
-XBMC_DEPENDENCIES += wavpack
+ifeq ($(BR2_PACKAGE_KODI_WAVPACK),y)
+KODI_DEPENDENCIES += wavpack
 endif
 
-ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
-XBMC_DEPENDENCIES += libtheora
+ifeq ($(BR2_PACKAGE_KODI_LIBTHEORA),y)
+KODI_DEPENDENCIES += libtheora
 endif
 
-# xbmc needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_XBMC_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
-XBMC_DEPENDENCIES += mesa3d libva
-XBMC_CONF_OPT += --enable-vaapi
+# kodi needs libva & libva-glx
+ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+KODI_DEPENDENCIES += mesa3d libva
+KODI_CONF_OPT += --enable-vaapi
 else
-XBMC_CONF_OPT += --disable-vaapi
+KODI_CONF_OPT += --disable-vaapi
 endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
-define XBMC_BOOTSTRAP
+define KODI_BOOTSTRAP
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
-XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
+KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
-define XBMC_CLEAN_UNUSED_ADDONS
+define KODI_CLEAN_UNUSED_ADDONS
 	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/screensaver.rsxs.plasma
 	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.milkdrop
 	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.projectm
 	rm -Rf $(TARGET_DIR)/usr/share/xbmc/addons/visualization.itunes
 endef
-XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_UNUSED_ADDONS
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
 
-define XBMC_CLEAN_CONFLUENCE_SKIN
+define KODI_CLEAN_CONFLUENCE_SKIN
 	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.png -delete
 	find $(TARGET_DIR)/usr/share/xbmc/addons/skin.confluence/media -name *.jpg -delete
 endef
-XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_CLEAN_CONFLUENCE_SKIN
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_CONFLUENCE_SKIN
 
-define XBMC_INSTALL_BR_WRAPPER
-	$(INSTALL) -D -m 0755 package/xbmc/br-xbmc \
-		$(TARGET_DIR)/usr/bin/br-xbmc
+define KODI_INSTALL_BR_WRAPPER
+	$(INSTALL) -D -m 0755 package/kodi/br-kodi \
+		$(TARGET_DIR)/usr/bin/br-kodi
 endef
-XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_BR_WRAPPER
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_BR_WRAPPER
 
-# When run from a startup script, XBMC has no $HOME where to store its
+# When run from a startup script, Kodi has no $HOME where to store its
 # configuration, so ends up storing it in /.xbmc  (yes, at the root of
 # the rootfs). This is a problem for read-only filesystems. But we can't
 # easily change that, so create /.xbmc as a symlink where we want the
 # config to eventually be.
-define XBMC_INSTALL_CONFIG_DIR
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/xbmc
-	ln -sf /var/xbmc $(TARGET_DIR)/.xbmc
+define KODI_INSTALL_CONFIG_DIR
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/kodi
+	ln -sf /var/kodi $(TARGET_DIR)/.xbmc
 endef
-XBMC_POST_INSTALL_TARGET_HOOKS += XBMC_INSTALL_CONFIG_DIR
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_INSTALL_CONFIG_DIR
 
-define XBMC_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/xbmc/S50xbmc \
-		$(TARGET_DIR)/etc/init.d/S50xbmc
+define KODI_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/kodi/S50kodi \
+		$(TARGET_DIR)/etc/init.d/S50kodi
 endef
 
-define XBMC_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/xbmc/xbmc.service \
-		$(TARGET_DIR)/etc/systemd/system/xbmc.service
+define KODI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/kodi/kodi.service \
+		$(TARGET_DIR)/etc/systemd/system/kodi.service
 
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 
-	ln -fs ../xbmc.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/xbmc.service
+	ln -fs ../kodi.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/kodi.service
 endef
 
 $(eval $(autotools-package))
diff --git a/package/kodi/kodi.service b/package/kodi/kodi.service
index 3fe5895..acd3b8e 100644
--- a/package/kodi/kodi.service
+++ b/package/kodi/kodi.service
@@ -1,5 +1,5 @@
 [Unit]
-Description = XBMC media center
+Description = Kodi Entertainment Center
 After = network.target
 
 [Service]
diff --git a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
index a4d9624..16f3a0d 100644
--- a/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
+++ b/package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
@@ -21,6 +21,6 @@ XBMC_ADDON_XVDR_AUTORECONF = YES
 # This really is a runtime dependency, but we need XBMC to be installed
 # first, since we'll install files in XBMC's directories _after_ XBMC has
 # installed his own files
-XBMC_ADDON_XVDR_DEPENDENCIES = xbmc
+XBMC_ADDON_XVDR_DEPENDENCIES = kodi
 
 $(eval $(autotools-package))
diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
index c93636f..2fcbfc9 100644
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -18,7 +18,7 @@ XBMC_PVR_ADDONS_DEPENDENCIES = boost zlib
 # This really is a runtime dependency, but we need XBMC to be installed
 # first, since we'll install files in XBMC's directories _after_ XBMC has
 # installed its own files
-XBMC_PVR_ADDONS_DEPENDENCIES += xbmc
+XBMC_PVR_ADDONS_DEPENDENCIES += kodi
 
 XBMC_PVR_ADDONS_CONF_OPT = \
 	--enable-release \
-- 
1.7.10.4
