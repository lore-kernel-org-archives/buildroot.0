From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:58 -0400
Subject: [Buildroot] [PATCH v2 12/25] fix ordering on configs starting with
	'l'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-12-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter l in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter l.
  
 package/lapack/Config.in             |  2 +-
 package/lesstif/Config.in            |  2 +-
 package/libcroco/Config.in           |  4 ++--
 package/libdri2/Config.in            |  4 ++--
 package/libdrm/Config.in             |  4 ++--
 package/libepoxy/Config.in           |  2 +-
 package/libfm-extra/Config.in        |  2 +-
 package/libfm/Config.in              |  8 ++++----
 package/libfreeglut/Config.in        |  4 ++--
 package/libftdi1/Config.in           |  6 +++---
 package/libgdiplus/Config.in         |  8 ++++----
 package/libglib2/Config.in           |  6 +++---
 package/libgtk2/Config.in            | 12 ++++++------
 package/libgtk3/Config.in            | 14 +++++++-------
 package/libiio/Config.in             | 12 ++++++------
 package/libmad/Config.in             |  2 +-
 package/libmatroska/Config.in        |  2 +-
 package/libnice/Config.in            |  2 +-
 package/libnss/Config.in             |  6 +++---
 package/libplayer/Config.in          |  2 +-
 package/libqmi/Config.in             |  2 +-
 package/librsvg/Config.in            | 10 +++++-----
 package/librtlsdr/Config.in          |  2 +-
 package/libsecret/Config.in          |  2 +-
 package/libselinux/Config.in         |  4 ++--
 package/libsemanage/Config.in        |  8 ++++----
 package/libsigrok/Config.in          |  6 +++---
 package/libsigrokdecode/Config.in    |  4 ++--
 package/libstrophe/Config.in         |  2 +-
 package/libupnpp/Config.in           |  6 +++---
 package/liburcu/Config.in            |  2 +-
 package/libva-intel-driver/Config.in |  6 +++---
 package/libva/Config.in              |  4 ++--
 package/libwebsock/Config.in         |  2 +-
 package/libxmlpp/Config.in           |  4 ++--
 package/lightning/Config.in          |  4 ++--
 package/linknx/Config.in             |  4 ++--
 package/linphone/Config.in           |  4 ++--
 package/linux-pam/Config.in          |  4 ++--
 package/ljlinenoise/Config.in        |  4 ++--
 package/lmbench/Config.in            |  4 ++--
 package/log4cxx/Config.in            |  4 ++--
 package/logrotate/Config.in          |  2 +-
 package/lsqlite3/Config.in           |  2 +-
 package/ltp-testsuite/Config.in      |  2 +-
 package/ltrace/Config.in             |  6 +++---
 package/lttng-babeltrace/Config.in   |  6 +++---
 package/lttng-libust/Config.in       |  6 +++---
 package/lua-coatpersistent/Config.in |  2 +-
 package/lua-ev/Config.in             |  2 +-
 package/luaexpat/Config.in           |  2 +-
 package/luajit/Config.in             |  2 +-
 package/luasec/Config.in             |  2 +-
 package/luv/Config.in                |  2 +-
 package/lxc/Config.in                |  2 +-
 package/lzlib/Config.in              |  2 +-
 56 files changed, 118 insertions(+), 118 deletions(-)

diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index b5eca49..9687ace 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LAPACK
 
 config BR2_PACKAGE_LAPACK_COMPLEX
 	bool "Complex/Complex16 support"
-	depends on BR2_PACKAGE_LAPACK
 	default y
+	depends on BR2_PACKAGE_LAPACK
 	help
 	  Builds support for COMPLEX and COMPLEX16 data types.
diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
index a6a88ec..654ee6f 100644
--- a/package/lesstif/Config.in
+++ b/package/lesstif/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LESSTIF
 	bool "lesstif"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_FREETYPE
-	depends on BR2_USE_MMU # fork()
 	help
 	  lesstif is the Hungry Programmers' version of OSF/Motif
 
diff --git a/package/libcroco/Config.in b/package/libcroco/Config.in
index 5baf83d..ad78a14 100644
--- a/package/libcroco/Config.in
+++ b/package/libcroco/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LIBCROCO
 	bool "libcroco"
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libcroco is a standalone css2 parsing and manipulation
 	  library. The parser provides a low level event driven SAC
diff --git a/package/libdri2/Config.in b/package/libdri2/Config.in
index fff979e..a10df74 100644
--- a/package/libdri2/Config.in
+++ b/package/libdri2/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBDRI2
 	bool "libdri2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_DRI2PROTO
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
-	depends on BR2_PACKAGE_XORG7
 	help
 	  Library for the DRI2 extension to the X Window System.
 
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 81fc5cc..8acd542 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_LIBDRM
 	bool "libdrm"
-	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	help
 	  Direct Rendering Manager
 
@@ -20,9 +20,9 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	select BR2_PACKAGE_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
+	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
 	  Install intel graphics driver.
diff --git a/package/libepoxy/Config.in b/package/libepoxy/Config.in
index c87366a..9da190b 100644
--- a/package/libepoxy/Config.in
+++ b/package/libepoxy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "libepoxy"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
 	help
 	  Epoxy is a library for handling OpenGL function pointer
 	  management for you.
diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
index 79465f9..eefc022 100644
--- a/package/libfm-extra/Config.in
+++ b/package/libfm-extra/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBFM_EXTRA
 	bool "libfm-extra"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  The libfm-extra package contains a library and other files
 	  required by menu-cache-gen libexec of menu-cache
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 0463d1c..92f0034 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -1,15 +1,15 @@
 config BR2_PACKAGE_LIBFM
 	bool "libfm"
-	select BR2_PACKAGE_MENU_CACHE
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_CAIRO
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
+	select BR2_PACKAGE_MENU_CACHE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_CAIRO
 	help
 	  A glib/gio-based library providing some file management
 	  utilities and related-widgets missing in gtk+/glib. This is
diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
index e09e7ef..f7cd90b 100644
--- a/package/libfreeglut/Config.in
+++ b/package/libfreeglut/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBFREEGLUT
 	bool "libfreeglut"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
-	depends on BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_XORG7
 	help
 	  FreeGLUT is a free-software/open-source alternative to the
 	  OpenGL Utility Toolkit (GLUT) library. GLUT (and hence
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index aca797b..d473213 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFTDI1
 	bool "libftdi1"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Userspace access to FTDI USB interface chips (version 1.x)
 
@@ -11,10 +11,10 @@ if BR2_PACKAGE_LIBFTDI1
 
 config BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
 	bool "libftdipp1"
-	select BR2_PACKAGE_BOOST
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_USE_WCHAR # boost
+	select BR2_PACKAGE_BOOST
 	help
 	  C++ bindings for libftdi
 
@@ -28,8 +28,8 @@ config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	  Python bindings for libftdi
 
 config BR2_PACKAGE_LIBFTDI1_FDTI_EEPROM
-	select BR2_PACKAGE_LIBCONFUSE
 	bool "ftdi_eeprom tool"
+	select BR2_PACKAGE_LIBCONFUSE
 
 endif # BR2_PACKAGE_LIBFTDI1
 
diff --git a/package/libgdiplus/Config.in b/package/libgdiplus/Config.in
index 6862503..6ddf44f 100644
--- a/package/libgdiplus/Config.in
+++ b/package/libgdiplus/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBGDIPLUS
 	bool "libgdiplus"
-	select BR2_PACKAGE_XLIB_LIBXFT
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_CAIRO
-	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBPNG
 	help
 	  An Open Source implementation of the GDI+ API.
 
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 80c7d67..62e29ef 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
+	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBFFI
@@ -8,9 +11,6 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_WCHAR # gettext
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index b6cf37e..aa297d7 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -12,12 +18,6 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXRENDER
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The GTK+ version 2 graphical user interface library
 
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 738f865..653f5dd 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -12,6 +12,13 @@ comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
 
 config BR2_PACKAGE_LIBGTK3
 	bool "libgtk3"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -24,13 +31,6 @@ config BR2_PACKAGE_LIBGTK3
 	# At least one backend is required
 	select BR2_PACKAGE_LIBGTK3_BROADWAY if \
 		!(BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK3_WAYLAND)
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
-		BR2_PACKAGE_HAS_LIBGL
 	help
 	  The GTK+ version 3 graphical user interface library
 
diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 8cde0e9..75f6f3a 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -17,24 +17,24 @@ config BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 
 config BR2_PACKAGE_LIBIIO_XML_BACKEND
 	bool "XML backend"
-	select BR2_PACKAGE_LIBXML2
 	default y
+	select BR2_PACKAGE_LIBXML2
 	help
 	  Enable the XML backend of the library.
 
 config BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	bool "Network backend"
-	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	default y
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	help
 	  Enable the network backend of the library.
 
 config BR2_PACKAGE_LIBIIO_USB_BACKEND
 	bool "USB backend"
+	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # from libusb
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBUSB
-	default y
 	help
 	  Enable the USB backend of the library.
 
@@ -43,18 +43,18 @@ comment "The USB backend needs a toolchain w/ threads"
 
 config BR2_PACKAGE_LIBIIO_SERIAL_BACKEND
 	bool "Serial backend"
+	default y
 	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBSERIALPORT
-	default y
 	help
 	  Enable the serial backend of the library.
 
 config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
-	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_bfin
-	default y
+	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	help
 	  Install the IIO Daemon.
 
diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index f93f54a..c4feb72 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -37,9 +37,9 @@ config BR2_PACKAGE_LIBMAD_SSO
 
 config BR2_PACKAGE_LIBMAD_ASO
 	bool "Architecture-specific optimizations"
+	default y
 	# arm optimization needs classic arm instructions support
 	depends on !(BR2_arm && !BR2_ARM_CPU_HAS_ARM)
-	default y
 	help
 	  Use certain architecture-specific optimizations.
 
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index 5815a46..ec0e841 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
-	select BR2_PACKAGE_LIBEBML
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBEBML
 	help
 	  Extensible open standard audio/video container format access
 	  library.
diff --git a/package/libnice/Config.in b/package/libnice/Config.in
index 1d7c341..c803a31 100644
--- a/package/libnice/Config.in
+++ b/package/libnice/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBNICE
 	bool "libnice"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libnice is an implementation of the IETF's Interactive
 	  Connectivity Establishment (ICE) standard (RFC 5245) and the
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index f07bb04..599c9a6 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
-	select BR2_PACKAGE_LIBNSPR
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 1261c1e..e1e04a1 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBPLAYER
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	bool "libplayer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libplayer provides a generic A/V API that relies on various multimedia
 	  player for Linux systems. It currently supports MPlayer, xine VLC and
diff --git a/package/libqmi/Config.in b/package/libqmi/Config.in
index a0e896c..cfb0ecd 100644
--- a/package/libqmi/Config.in
+++ b/package/libqmi/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBQMI
 	bool "libqmi"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libqmi is a glib-based library for talking to WWAN modems and devices
 	  which speak the Qualcomm MSM Interface (QMI) protocol.
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 7ce9d06..211c53a 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_GDK_PIXBUF
@@ -7,11 +12,6 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
index 1e217bc..c2bf1a9 100644
--- a/package/librtlsdr/Config.in
+++ b/package/librtlsdr/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBRTLSDR
 	bool "librtlsdr"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Library and command line programs for accessing
 	  RTL2832U SDR dongles.
diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 70f1fe7..a8de8f8 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LIBSECRET
 	bool "libsecret"
-	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_USE_WCHAR # gettext dep in libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libsecret is a library for storing and retrieving passwords and other
 	  secrets. It communicates with the "Secret Service" using DBus.
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index c88669b..6be816d 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBSELINUX
 	bool "libselinux"
-	select BR2_PACKAGE_LIBSEPOL
-	select BR2_PACKAGE_PCRE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	# Uses <fts.h>, not available in musl or uClibc
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Toolchain issue: "fixup not contained within frag"
 	depends on !BR2_arc
+	select BR2_PACKAGE_LIBSEPOL
+	select BR2_PACKAGE_PCRE
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index 4318dbf..7ee9c38 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_LIBSEMANAGE
 	bool "libsemanage"
-	select BR2_PACKAGE_AUDIT
-	select BR2_PACKAGE_LIBSELINUX
-	select BR2_PACKAGE_USTR
-	select BR2_PACKAGE_BZIP2
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -12,6 +8,10 @@ config BR2_PACKAGE_LIBSEMANAGE
 	# - audit is not available on musl
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
+	select BR2_PACKAGE_AUDIT
+	select BR2_PACKAGE_LIBSELINUX
+	select BR2_PACKAGE_USTR
+	select BR2_PACKAGE_BZIP2
 	help
 	  libsemanage is the policy management library. It uses
 	  libsepol for binary policy manipulation and libselinux for
diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index ff2d249..d2d022e 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LIBSIGROK
 	bool "libsigrok"
-	select BR2_PACKAGE_LIBZIP
-	select BR2_PACKAGE_LIBGLIB2
 	# libglib2
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	# std=c11
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	select BR2_PACKAGE_LIBZIP
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libsigrok is a shared library written in C, which provides
 	  the basic hardware access drivers for logic analyzers and
@@ -22,9 +22,9 @@ if BR2_PACKAGE_LIBSIGROK
 
 config BR2_PACKAGE_LIBSIGROKCXX
 	bool "build C++ bindings"
-	select BR2_PACKAGE_GLIBMM
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # glibmm
+	select BR2_PACKAGE_GLIBMM
 	help
 	  Build libsigrok C++ bindings as well.
 
diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index 70f86ce..28cbb5c 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBSIGROKDECODE
 	bool "libsigrokdecode"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON # python3
 	depends on BR2_USE_WCHAR # libglib2/python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2/python3
 	depends on BR2_USE_MMU # libglib2/python3
 	depends on !BR2_STATIC_LIBS # python3
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PYTHON3
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index 55dc162..5fdb918 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBSTROPHE
 	bool "libstrophe"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libstrophe is a lightweight XMPP client library written in C.
 	  It has minimal dependencies and is configurable for various
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 2d99586..46abd65 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBUPNPP
 	bool "libupnpp"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBUPNP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBUPNP
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
 	  upplay.
diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index b5b6326..4330255 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	bool
+	default y
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
-	default y
 
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index a39e554..120f152 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	bool "libva-intel-driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on !BR2_STATIC_LIBS # libva
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on !BR2_STATIC_LIBS # libva
 	help
 	  VA-API back-end driver for Intel graphics chips
 
diff --git a/package/libva/Config.in b/package/libva/Config.in
index 75692f2..048e4c9 100644
--- a/package/libva/Config.in
+++ b/package/libva/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LIBVA
 	bool "libva"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
-	depends on !BR2_STATIC_LIBS
 	help
 	  The main motivation for VA-API (Video Acceleration API) is to enable
 	  hardware accelerated video decode/encode at various entry-points (VLD,
diff --git a/package/libwebsock/Config.in b/package/libwebsock/Config.in
index 9ef2136..14651cf 100644
--- a/package/libwebsock/Config.in
+++ b/package/libwebsock/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBWEBSOCK
 	bool "libwebsock"
-	select BR2_PACKAGE_LIBEVENT
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBEVENT
 	help
 	  C library for easy WebSockets servers.
 
diff --git a/package/libxmlpp/Config.in b/package/libxmlpp/Config.in
index 0f2da98..6d957ff 100644
--- a/package/libxmlpp/Config.in
+++ b/package/libxmlpp/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LIBXMLPP
 	bool "libxml++"
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_GLIBMM
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glibmm -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glibmm -> libglib2
 	depends on BR2_USE_MMU # glibmm -> libglib2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GLIBMM
 	help
 	  libxml++ is a C++ wrapper for the libxml XML parser library.
 
diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index d85c964..79f7f86 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -18,10 +18,10 @@ if BR2_PACKAGE_LIGHTNING
 
 config BR2_PACKAGE_LIGHTNING_DISASSEMBLER
 	bool "enable disassembler"
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_ZLIB
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_ZLIB
 	help
 	  Enable the GNU lightning disassembler.
 
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
index e858389..478d019 100644
--- a/package/linknx/Config.in
+++ b/package/linknx/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LINKNX
 	bool "linknx"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # libpthsem
 	select BR2_PACKAGE_LIBPTHSEM
 	select BR2_PACKAGE_LIBCURL # for autoreconf
 	select BR2_PACKAGE_ARGP_STANDALONE \
 	       if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # libpthsem
 	help
 	  Linknx is an automation platform providing high level functionalities
 	  to EIB/KNX installation.
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 2622aa4..2504ca2 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LINPHONE
 	bool "linphone"
-	select BR2_PACKAGE_LIBEXOSIP2
-	select BR2_PACKAGE_SPEEX
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer (bundled)
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp (bundled)
 	depends on BR2_USE_MMU # libeXosip2
+	select BR2_PACKAGE_LIBEXOSIP2
+	select BR2_PACKAGE_SPEEX
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 3d9835e..ab7cf55 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_FLEX
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for Applications
 
diff --git a/package/ljlinenoise/Config.in b/package/ljlinenoise/Config.in
index be83bdb..61c80df 100644
--- a/package/ljlinenoise/Config.in
+++ b/package/ljlinenoise/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LJLINENOISE
 	bool "ljlinenoise"
-	# run-time dependency only
-	select BR2_PACKAGE_LJSYSCALL
 	# ljsyscall is specifically for LuaJIT, not Lua.
 	depends on BR2_PACKAGE_LUAJIT
+	# run-time dependency only
+	select BR2_PACKAGE_LJSYSCALL
 	help
 	  ljlinenoise is a pure LuaJIT port of linenoise,
 	  a small alternative to readline and libedit.
diff --git a/package/lmbench/Config.in b/package/lmbench/Config.in
index c4ea522..7b33297 100644
--- a/package/lmbench/Config.in
+++ b/package/lmbench/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LMBENCH
 	bool "lmbench"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc\
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  LMbench is a suite of simple, portable,
 	  ANSI/C microbenchmarks for UNIX/POSIX.
diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 6ec67b6..bf739a4 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LOG4CXX
 	bool "log4cxx"
-	select BR2_PACKAGE_APR
-	select BR2_PACKAGE_APR_UTIL
 	# apr really needs shared library support
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # apr
+	select BR2_PACKAGE_APR
+	select BR2_PACKAGE_APR_UTIL
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 2b1ae64..eea9ec2 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
-	select BR2_PACKAGE_POPT
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_POPT
 	help
 	  A simple program to rotate logs.
 
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index cc431ae..223fb59 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
-	select BR2_PACKAGE_SQLITE
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_SQLITE
 	help
 	  a thin Lua wrapper for the SQLite3 library.
 
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 274b03e..04868d7 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -7,9 +7,9 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	# does not build, cachectl.h issue
 	depends on !BR2_nios2
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 7af6be2..0fc1b95 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	# ltrace normally has mips/mipsel support, but it's currently
 	# broken (error: 'struct ltelf' has no member named
 	# 'relplt_count'). Issue reported upstream at
@@ -7,9 +10,6 @@ config BR2_PACKAGE_LTRACE
 	depends on (BR2_i386 || BR2_arm || BR2_mips || BR2_mipsel \
 		|| BR2_powerpc || BR2_sparc || BR2_x86_64 || BR2_xtensa)
 	select BR2_PACKAGE_ELFUTILS
-	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_STATIC_LIBS # elfutils
-	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	help
 	  Debugging program which runs a specified command until it exits.
 	  While the command is executing, ltrace intercepts and records
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 09fab44..ba6b554 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LTTNG_BABELTRACE
 	bool "lttng-babeltrace"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_POPT
-	depends on BR2_USE_WCHAR # libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_USE_MMU # libglib2
 	help
 	  The Babeltrace project provides trace read and write
 	  libraries, as well as a trace converter application. Plugins
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 4aba188..8472cab 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
-	select BR2_PACKAGE_LIBURCU
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_USE_WCHAR # uses wchar_t
 	# liburcu only works on some architectures and requires threads support"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBURCU
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
diff --git a/package/lua-coatpersistent/Config.in b/package/lua-coatpersistent/Config.in
index a0f5bdc..d8b3570 100644
--- a/package/lua-coatpersistent/Config.in
+++ b/package/lua-coatpersistent/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_LUA_COATPERSISTENT
 	bool "lua-coatpersistent"
+	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
 	# run-time dependencies
 	select BR2_PACKAGE_DADO
 	select BR2_PACKAGE_LUA_COAT
-	depends on BR2_PACKAGE_LSQLITE3 || BR2_PACKAGE_LUASQL_SQLITE3
 	help
 	  An ORM for lua-Coat.
 
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 4b3f8ed..0cb4c22 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	select BR2_PACKAGE_LIBEV
 	depends on !BR2_bfin # libev
+	select BR2_PACKAGE_LIBEV
 	help
 	  Get access to the libev library from Lua.
 
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 6976e40..7139e8c 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
-	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_EXPAT
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 380f247..1a27c43 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_STATIC_LIBS # dlopen
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
@@ -16,6 +15,7 @@ config BR2_PACKAGE_LUAJIT
 	# luajit.mk uses the "-m32" compiler option to build 32bit
 	# binaries, so check if that option is supported. See
 	# luajit.mk for details.
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	help
 	  LuaJIT implements the full set of language features defined
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index a8cc9c9..9391cd9 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
diff --git a/package/luv/Config.in b/package/luv/Config.in
index e9d0109..434cb3b 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LUV
 	bool "luv"
-	select BR2_PACKAGE_LIBUV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
 
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 6a39d2e..c5c75ea 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LXC
 	bool "lxc"
-	select BR2_PACKAGE_LIBCAP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # setns() system call
+	select BR2_PACKAGE_LIBCAP
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
 	  of a set of processes in a jail by virtualizing and accounting the
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index 32328c5..59a2e6d 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_LUA
+	select BR2_PACKAGE_ZLIB
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
-- 
2.9.3
