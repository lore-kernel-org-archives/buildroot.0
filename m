From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 21 Nov 2015 17:36:16 +0100
Subject: [Buildroot] [PATCH 3/7] toolchain-external: CodeSourcery NIOSII:
	support only one version
In-Reply-To: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1448123780-30067-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See the conclusion about external toolchains during the Buildroot
meeting [1]:
"In the future, we stick to a single external toolchain version. The
Kconfig symbol should not encode the version (avoid legacy handling)"

[1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/aiccu/Config.in                             |  6 ++----
 package/boost/Config.in                             |  3 +--
 package/connman/Config.in                           |  2 +-
 package/crda/Config.in                              |  6 ++----
 package/cryptsetup/Config.in                        |  6 ++----
 package/dmraid/Config.in                            |  6 ++----
 package/ffmpeg/Config.in                            |  3 +--
 package/flann/Config.in                             |  2 --
 package/janus-gateway/Config.in                     |  6 ++----
 package/libcap-ng/Config.in                         |  2 +-
 package/libmicrohttpd/Config.in                     |  6 ++----
 package/libupnpp/Config.in                          |  6 ++----
 package/lxc/Config.in                               |  6 ++----
 package/mesa3d/Config.in                            |  6 ++----
 package/mosquitto/Config.in                         |  6 ++----
 package/ofono/Config.in                             |  4 ++--
 package/pixman/pixman.mk                            |  2 +-
 package/squeezelite/Config.in                       |  3 +--
 package/tovid/Config.in                             |  3 +--
 package/upmpdcli/Config.in                          |  6 ++----
 package/util-linux/Config.in                        |  2 +-
 toolchain/toolchain-external/Config.in              | 21 ++-------------------
 .../toolchain-external/toolchain-external.hash      |  1 -
 toolchain/toolchain-external/toolchain-external.mk  | 18 +-----------------
 24 files changed, 35 insertions(+), 97 deletions(-)

diff --git a/package/aiccu/Config.in b/package/aiccu/Config.in
index 4a0d20d..2bfd649 100644
--- a/package/aiccu/Config.in
+++ b/package/aiccu/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_AICCU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_PACKAGE_GNUTLS
 	help
 	  SixXS Automatic IPv6 Connectivity Client Utility
@@ -24,5 +23,4 @@ config BR2_PACKAGE_AICCU
 comment "aiccu needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/boost/Config.in b/package/boost/Config.in
index edffd7e..0f4ba1c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -3,8 +3,7 @@ comment "boost needs a toolchain w/ C++, threads, wchar"
 
 config BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 && \
-		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	default y if !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
diff --git a/package/connman/Config.in b/package/connman/Config.in
index ba238af..c6c4163 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -52,7 +52,7 @@ config BR2_PACKAGE_CONNMAN_NEARD
 
 config BR2_PACKAGE_CONNMAN_OFONO
 	bool "enable ofono support"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	select BR2_PACKAGE_OFONO
 
 config BR2_PACKAGE_CONNMAN_DEBUG
diff --git a/package/crda/Config.in b/package/crda/Config.in
index 5318fc1..4eb1643 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -7,8 +7,7 @@ config BR2_PACKAGE_CRDA
 	# regdb is a runtime dependency
 	select BR2_PACKAGE_WIRELESS_REGDB
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  Central Regulatory Domain Agent.
 
@@ -21,5 +20,4 @@ config BR2_PACKAGE_CRDA
 
 comment "crda needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
index d7ccd37..321b97d 100644
--- a/package/cryptsetup/Config.in
+++ b/package/cryptsetup/Config.in
@@ -10,8 +10,7 @@ config BR2_PACKAGE_CRYPTSETUP
 	depends on !BR2_STATIC_LIBS # lvm2
 	depends on BR2_USE_WCHAR # util-linux
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  This tool helps manipulate dm-crypt and luks partitions for
 	  on-disk encryption.
@@ -21,5 +20,4 @@ config BR2_PACKAGE_CRYPTSETUP
 comment "cryptsetup needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index ec50670..d278a11 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -4,8 +4,7 @@ config BR2_PACKAGE_DMRAID
 	depends on BR2_USE_MMU # lvm2
 	depends on !BR2_STATIC_LIBS # lvm2
 	# dmraid triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -17,6 +16,5 @@ config BR2_PACKAGE_DMRAID
 comment "dmraid needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	# dmraid triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index e5981fe..c0d94ab 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,7 @@
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  FFmpeg is a complete, cross-platform solution to record, convert
 	  and stream audio and video.
diff --git a/package/flann/Config.in b/package/flann/Config.in
index 1222310..3725fc7 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	# triggers an assert in the linker of this toolchain
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index cafad94..1c00d32 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -11,8 +11,7 @@ config BR2_PACKAGE_JANUS_GATEWAY
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
 	depends on !BR2_STATIC_LIBS # dlopen
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # libmicrohttpd
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libmicrohttpd
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libmicrohttpd
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
@@ -22,5 +21,4 @@ config BR2_PACKAGE_JANUS_GATEWAY
 comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
index a52d230..4939e26 100644
--- a/package/libcap-ng/Config.in
+++ b/package/libcap-ng/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBCAP_NG
 	bool "libcap-ng"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # triggers compiler bug
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # triggers compiler bug
 	help
 	  The libcap-ng library is intended to make programming with
 	  posix capabilities much easier than the traditional libcap
diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index d9e6493..68191ea 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
@@ -27,5 +26,4 @@ endif
 
 comment "libmicrohttpd needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/libupnpp/Config.in b/package/libupnpp/Config.in
index 8af0cda..1dfd3c7 100644
--- a/package/libupnpp/Config.in
+++ b/package/libupnpp/Config.in
@@ -7,8 +7,7 @@ config BR2_PACKAGE_LIBUPNPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  The libupnpp C++ library wraps libupnp for easier use by upmpdcli and
 	  upplay.
@@ -16,6 +15,5 @@ config BR2_PACKAGE_LIBUPNPP
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "libupnpp needs a toolchain w/ C++, threads, gcc >= 4.5"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index ffd9b4a..a5df3e3 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_LXC
 	# build system forcefully builds a shared library
 	depends on !BR2_STATIC_LIBS
 	# the toolchain doesn't support setns syscall
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
 	help
 	  Linux Containers (LXC), provides the ability to group and isolate
@@ -18,8 +17,7 @@ config BR2_PACKAGE_LXC
 
 comment "lxc needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fdeb599..8dd208f 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -13,8 +13,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	# Triggers the _gp link issue in nios2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
@@ -153,7 +152,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_STATIC_LIBS
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 4053c62..ab598d0 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_MOSQUITTO
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # builds .so
 	# Triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  Mosquitto is an open source message broker that implements
 	  the MQ Telemetry Transport protocol versions 3.1 and
@@ -19,5 +18,4 @@ config BR2_PACKAGE_MOSQUITTO
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index f709b04..f8365d8 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_OFONO
 	depends on BR2_USE_WCHAR # gettext, libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_DBUS
@@ -19,4 +19,4 @@ config BR2_PACKAGE_OFONO
 comment "ofono needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index cbf57fe..05bf3fd 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -26,7 +26,7 @@ endif
 # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
 # movhi	r4, %got_hiadj(%tls_ldo(fast_path_cache))
 # {standard input}:172: Error: bad expression
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
 endif
 
diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index be8f11a..b31a2e9 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -21,8 +21,7 @@ config BR2_PACKAGE_SQUEEZELITE_FFMPEG
 	bool "Enable WMA and ALAC decoding"
 	default y
 	select BR2_PACKAGE_FFMPEG
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # ffmpeg
 
 config BR2_PACKAGE_SQUEEZELITE_DSD
 	bool "Enable DSD decoding"
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
index ccf031e..1e1d648 100644
--- a/package/tovid/Config.in
+++ b/package/tovid/Config.in
@@ -5,8 +5,7 @@ config BR2_PACKAGE_TOVID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305 # ffmpeg
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # ffmpeg
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # ffmpeg
 	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	# The below dependencies are runtime dependencies only
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 848c6af..1502095 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnpp -> libupnp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	# libupnpp triggers the _gp link issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
@@ -16,6 +15,5 @@ config BR2_PACKAGE_UPMPDCLI
 	  http://www.lesbonscomptes.com/upmpdcli/
 
 comment "upmpdcli needs a toolchain w/ C++, threads, gcc >= 4.6"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index c3ea190..214b975 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -211,7 +211,7 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
-	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405 # libcap-ng
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 523e773..6424a8f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -501,7 +501,7 @@ comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 an
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	bool "Sourcery CodeBench Nios-II 2014.05"
 	depends on BR2_nios2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -517,22 +517,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	  from Mentor Graphics. It uses gcc 4.8.3, binutils 2.24.51,
 	  glibc 2.19.90, gdb 7.7.50 and kernel headers 3.12.
 
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	bool "Sourcery CodeBench Nios-II 2013.05"
-	depends on BR2_nios2
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
-	  glibc 2.17, gdb 7.4.50 and kernel headers 3.7.0.
-
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
 	bool "Sourcery CodeBench PowerPC 2012.03"
 	depends on BR2_powerpc
@@ -990,8 +974,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505
-	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
-	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
+	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 8a3e85b..dd95ade 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -23,7 +23,6 @@ sha256 395f1c504a8fb6b7a10663143627b7eee2edc8fd884aa13c4b8505a3623960f5  arm-201
 sha256 8455854d3b3abbc2328e6c061c6b9625ef8f9c1f236db9f1771877715bd70b9b  arm-2013.11-33-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 sha256 39ee0e789034334ecc89af94e838e3a4815400ac5ff980f808f466b04778532e  arm-2014.05-29-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
 # NiosII
-sha256 29567361910b020751ea8041ecb45b3cc74714e71c6deb4981b678772b746b33  sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 sha256 fb02fe3d595bd80a6e0ebc9d59a64010d84ae8d13f47e241b3a335f42b0414dc  sourceryg++-2014.05-47-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # PowerPC
 sha256 d68d1a2a055ece3824a1a11fcc0a8e813ee1d215025247cce0d877caa12c4b54  freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d7788eb..5ab54c0 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -351,11 +351,7 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = mips-2015.05-18-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201505_LIB_NAMES_FIX
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
-TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu
 TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2014.05-47-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
@@ -757,18 +753,6 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 	done
 endef
 
-# This sed magic is taken from Linux headers_install.sh script.
-define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
-	$(Q)$(call MESSAGE,"Sanitizing kernel headers")
-	find $(STAGING_DIR)/usr/include/linux/ -name "*.h" | xargs sed -r -i \
-		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
-		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
-		-e 's@^#include <linux/compiler.h>@@' \
-		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$$)/\1__attribute__((packed))\2/g' \
-		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$$)/\1__\2__\3/g' \
-		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @'
-endef
-
 #
 # Generate gdbinit file for use with Buildroot
 #
-- 
2.4.3
