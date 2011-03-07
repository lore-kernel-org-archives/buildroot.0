From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:41 +0100
Subject: [Buildroot] [PATCH 8/9] Rename BR2_INSTALL_LIBSTDCPP to
	BR2_TOOLCHAIN_HAS_CPP
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0e9698000e46763ca315e734f2770e51f8ee0d46.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig               |    2 +-
 configs/arm_toolchain_defconfig                    |    2 +-
 package/Makefile.in                                |    2 +-
 package/alsamixergui/Config.in                     |    4 ++--
 package/blackbox/Config.in                         |    4 ++--
 package/ctorrent/Config.in                         |    4 ++--
 package/cups/Config.in                             |    4 ++--
 package/dmalloc/dmalloc.mk                         |    2 +-
 package/enchant/Config.in                          |    4 ++--
 package/fltk/Config.in                             |    4 ++--
 package/gperf/Config.in                            |    4 ++--
 package/gpsd/gpsd.mk                               |    2 +-
 package/icu/Config.in                              |    4 ++--
 package/iperf/Config.in                            |    4 ++--
 package/kismet/Config.in                           |    4 ++--
 package/libcgicc/Config.in                         |    4 ++--
 package/libconfig/libconfig.mk                     |    2 +-
 package/libgtk2/Config.in                          |    4 ++--
 package/libsigc/Config.in                          |    4 ++--
 package/lzma/Config.in                             |    4 ++--
 package/midori/Config.in                           |    4 ++--
 package/multimedia/festival/Config.in              |    4 ++--
 package/multimedia/festival/speech-tools/Config.in |    4 ++--
 package/multimedia/gst-plugins-base/Config.in      |    4 ++--
 package/multimedia/mpd/Config.in                   |    4 ++--
 package/multimedia/swfdec/Config.in                |    4 ++--
 package/multimedia/taglib/Config.in                |    4 ++--
 package/mysql_client/Config.in                     |    4 ++--
 package/oprofile/Config.in                         |    4 ++--
 package/pango/Config.in                            |    4 ++--
 package/pcre/pcre.mk                               |    2 +-
 package/php/Config.ext                             |    4 ++--
 package/qt/Config.in                               |    4 ++--
 package/rpm/Config.in                              |    4 ++--
 package/smartmontools/Config.in                    |    4 ++--
 package/squid/Config.in                            |    4 ++--
 package/synergy/Config.in                          |    4 ++--
 package/webkit/Config.in                           |    4 ++--
 package/x11r7/Config.in                            |    4 ++--
 package/x11r7/mesa3d/Config.in                     |    2 +-
 package/xerces/Config.in                           |    4 ++--
 target/xtensa/defconfig                            |    2 +-
 toolchain/gcc/Config.in                            |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    6 +++---
 toolchain/toolchain-buildroot/Config.in.2          |    2 +-
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in         |    2 +-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |    2 +-
 toolchain/toolchain-external/Config.in             |   14 +++++++-------
 toolchain/toolchain-external/ext-tool.mk           |    4 ++--
 50 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index 043bd77..edca979 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_HAS_RPC=y
 BR2_TOOLCHAIN_HAS_LOCALE=y
 BR2_TOOLCHAIN_HAS_WCHAR=y
 BR2_PTHREADS_NATIVE=y
-BR2_INSTALL_LIBSTDCPP=y
+BR2_TOOLCHAIN_HAS_CPP=y
 
 # No package
 # BR2_PACKAGE_BUSYBOX is not set
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index ae6a550..7f8b8c3 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -7,7 +7,7 @@ BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_TOOLCHAIN_HAS_RPC=y
 BR2_TOOLCHAIN_HAS_LOCALE=y
 BR2_TOOLCHAIN_HAS_WCHAR=y
-BR2_INSTALL_LIBSTDCPP=y
+BR2_TOOLCHAIN_HAS_CPP=y
 
 # No package
 # BR2_PACKAGE_BUSYBOX is not set
diff --git a/package/Makefile.in b/package/Makefile.in
index ebfc3af..849c8d9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -307,7 +307,7 @@ ifneq ($(BR2_TOOLCHAIN_HAS_IPV6),y)
 DISABLE_IPV6= --disable-ipv6
 endif
 
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 TARGET_CONFIGURE_OPTS+=CXX=false
 endif
 
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 3afc314..02fcbcb 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ALSAMIXERGUI
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_ALSA_LIB
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
@@ -12,4 +12,4 @@ config BR2_PACKAGE_ALSAMIXERGUI
 	  http://www.iua.upf.es/~mdeboer/projects/alsamixergui/
 
 comment "alsamixergui requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7 && BR2_PACKAGE_ALSA_LIB
+	depends on !BR2_TOOLCHAIN_HAS_CPP && BR2_PACKAGE_XORG7 && BR2_PACKAGE_ALSA_LIB
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 7e2c1c6..5dc6526 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
@@ -11,4 +11,4 @@ config BR2_PACKAGE_BLACKBOX
 	  http://blackboxwm.sourceforge.net/
 
 comment "blackbox requires a toolchain with C++ support enabled"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7 && !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/ctorrent/Config.in b/package/ctorrent/Config.in
index 5e26c12..7cd217c 100644
--- a/package/ctorrent/Config.in
+++ b/package/ctorrent/Config.in
@@ -1,9 +1,9 @@
 comment "ctorrent requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 config BR2_PACKAGE_CTORRENT
 	bool "ctorrent"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  CTorrent is a BitTorrent client implemented in C++
 	  to be lightweight and quick.
diff --git a/package/cups/Config.in b/package/cups/Config.in
index 0176423..6969369 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -9,11 +9,11 @@ if BR2_PACKAGE_CUPS
 
 config BR2_PACKAGE_CUPS_PDFTOPS
        bool "pdftops support"
-       depends on BR2_INSTALL_LIBSTDCPP
+       depends on BR2_TOOLCHAIN_HAS_CPP
        help
          Enable pdftops support
 
 comment "pdftops support requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 endif
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index dca0488..a94f186 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -10,7 +10,7 @@ DMALLOC_SITE:=http://dmalloc.com/releases
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPT:= --enable-shlib
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 DMALLOC_CONF_OPT+=--enable-cxx
 else
 DMALLOC_CONF_OPT+=--disable-cxx
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 4451e0a..af1667a 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_ENCHANT
 	bool "enchant"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -10,4 +10,4 @@ config BR2_PACKAGE_ENCHANT
 	  http://www.abisource.com/projects/enchant/
 
 comment "enchant requires a toolchain with C++ and WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index eff72b5..f3368b9 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FLTK
 	bool "fltk"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
@@ -10,4 +10,4 @@ config BR2_PACKAGE_FLTK
 	  http://www.fltk.org/
 
 comment "fltk requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_XORG7
+	depends on !BR2_TOOLCHAIN_HAS_CPP && BR2_PACKAGE_XORG7
diff --git a/package/gperf/Config.in b/package/gperf/Config.in
index 67b286b..8465d0a 100644
--- a/package/gperf/Config.in
+++ b/package/gperf/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_GPERF
 	bool "gperf"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  A 'perfect hash function' generator
 
 	  http://www.gnu.org/software/gperf/
 
 comment "gperf requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 60f884b..7042a86 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -11,7 +11,7 @@ GPSD_CONF_OPT = --disable-static
 GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
 
 # Build libgpsmm if we've got C++
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 	GPSD_CONF_OPT += --enable-libgpsmm LDFLAGS="$(TARGET_LDFLAGS) -lstdc++"
 else
 	GPSD_CONF_OPT += --disable-libgpsmm
diff --git a/package/icu/Config.in b/package/icu/Config.in
index e593f85..7abb93d 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  International Components for Unicode.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_ICU
 	  http://site.icu-project.org/
 
 comment "icu requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/iperf/Config.in b/package/iperf/Config.in
index c4c25b3..ee9c96e 100644
--- a/package/iperf/Config.in
+++ b/package/iperf/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IPERF
 	bool "iperf"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Internet Protocol bandwidth measuring tool for measuring
 	  TCP/UDP performance.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_IPERF
 	  http://dast.nlanr.net/projects/iperf/
 
 comment "iperf requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 6954665..b8208ba 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,9 +1,9 @@
 comment "Kismet requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/libcgicc/Config.in b/package/libcgicc/Config.in
index 098f9a6..2d38f87 100644
--- a/package/libcgicc/Config.in
+++ b/package/libcgicc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBCGICC
 	bool "libcgicc"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  GNU cgicc is a C++ class library that greatly simplifies
 	  the creation of CGI applications for the World Wide Web.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCGICC
 	  http://www.cgicc.com
 
 comment "libcgicc requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 6e232a4..6336e45 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -10,7 +10,7 @@ LIBCONFIG_AUTORECONF:=NO
 LIBCONFIG_INSTALL_STAGING:=YES
 LIBCONFIG_INSTALL_TARGET:=YES
 
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 LIBCONFIG_CONF_OPT:=--disable-cxx
 endif
 
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 4aca9c7..5e79725 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -10,11 +10,11 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_CPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
 
 	  http://www.gtk.org/
 
 comment "libgtk2 requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index 93fa3f4..2827250 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSIGC
 	bool "libsigc++"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
 	  It allows you to define signals and to connect those signals to
@@ -10,4 +10,4 @@ config BR2_PACKAGE_LIBSIGC
 	  http://libsigc.sourceforge.net/
 
 comment "libsigc++ requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
index 2b94dde..a3bd328 100644
--- a/package/lzma/Config.in
+++ b/package/lzma/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LZMA
 	bool "lzma"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_DEPRECATED
 	help
 	  Lempel Ziv compression method (LZMA) is a compression
@@ -9,4 +9,4 @@ config BR2_PACKAGE_LZMA
 	  http://tukaani.org/lzma/
 
 comment "lzma requires a toolchain with C++ support"
-        depends on !BR2_INSTALL_LIBSTDCPP && BR2_DEPRECATED
+        depends on !BR2_TOOLCHAIN_HAS_CPP && BR2_DEPRECATED
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 30dbde3..247e28e 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_INSTALL_LIBSTDCPP # webkit
+	depends on BR2_TOOLCHAIN_HAS_CPP # webkit
 	depends on BR2_TOOLCHAIN_HAS_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
@@ -11,4 +11,4 @@ config BR2_PACKAGE_MIDORI
 	  http://software.twotoasts.de/?page=midori
 
 comment "midori requires C++, WCHAR in toolchain and libgtk2"
-        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
+        depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
diff --git a/package/multimedia/festival/Config.in b/package/multimedia/festival/Config.in
index e05fde9..7dad860 100644
--- a/package/multimedia/festival/Config.in
+++ b/package/multimedia/festival/Config.in
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_FESTIVAL
 	bool "festival text-to-speech system"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BROKEN # doesn't build
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_SPEECH_TOOLS
@@ -24,4 +24,4 @@ if BR2_PACKAGE_FESTIVAL
 endif
 
 comment "festival requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/multimedia/festival/speech-tools/Config.in b/package/multimedia/festival/speech-tools/Config.in
index e82ea1e..40e919e 100644
--- a/package/multimedia/festival/speech-tools/Config.in
+++ b/package/multimedia/festival/speech-tools/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SPEECH_TOOLS
 	bool "speech tools for festival"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Speech tools for the festival text to speech system
 
 	  http://festvox.org/packed/festival/latest
 
 comment "speech tools requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 09c243c..a21e134 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -73,11 +73,11 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_PANGO
 
 comment "pango plugin requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 6741b6a..a248ee1 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
@@ -161,4 +161,4 @@ config BR2_PACKAGE_MPD_WAVPACK
 endif
 
 comment "mpd requires a toolchain with C++ and WCHAR support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index 77fc919..3cdaf1a 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SWFDEC
 	bool "swfdec"
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_CPP # pango
 	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_PANGO
@@ -32,4 +32,4 @@ config BR2_PACKAGE_SWFDEC_GSTREAMER
 	  Enables GStreamer support
 
 comment "swfdec requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/multimedia/taglib/Config.in b/package/multimedia/taglib/Config.in
index 3d688a7..67b8f42 100644
--- a/package/multimedia/taglib/Config.in
+++ b/package/multimedia/taglib/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TAGLIB
 	bool "taglib"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  TagLib is a library for reading and editing the meta-data of
           several popular audio formats. Currently it supports both ID3v1
@@ -10,4 +10,4 @@ config BR2_PACKAGE_TAGLIB
 	  http://developer.kde.org/~wheeler/taglib.html
 
 comment "taglib requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index f07fdb4..8edcd2e 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_READLINE
 	help
 	  MySQL client
 
 comment "Mysql client requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 0e3652d..59aac9e 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPROFILE
 	depends on !BR2_TOOLCHAIN_EXTERNAL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -24,4 +24,4 @@ config BR2_PACKAGE_OPROFILE
 	  libraries, and applications.
 
 comment "oprofile requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/pango/Config.in b/package/pango/Config.in
index f852e00..f6fcf19 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
-	depends on BR2_INSTALL_LIBSTDCPP # freetype support
+	depends on BR2_TOOLCHAIN_HAS_CPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_CAIRO
@@ -17,4 +17,4 @@ config BR2_PACKAGE_PANGO
 	  http://www.pango.org/
 
 comment "pango requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index d2a1331..ece287c 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -8,7 +8,7 @@ PCRE_VERSION = 7.9
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 
-ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 # pcre will use the host g++ if a cross version isn't available
 PCRE_CONF_OPT = --disable-cpp
 endif
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 9fd4bde..a9dbcb3 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -173,12 +173,12 @@ config BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL
 config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
 	bool "PDO_MySQL"
 	depends on BR2_PACKAGE_PHP_EXT_PDO
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	select BR2_PACKAGE_MYSQL_CLIENT
 	help
 	  PDO driver for MySQL
 
 comment "PDO_MySQL requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_PHP_EXT_PDO
+	depends on !BR2_TOOLCHAIN_HAS_CPP && BR2_PACKAGE_PHP_EXT_PDO
 
 endmenu
diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3cc04f4..f4a2857 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -1,9 +1,9 @@
 comment "qt requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 menuconfig BR2_PACKAGE_QT
 	bool "Qt"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Qt for Embedded Linux.
 
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 8d4c6a3..22be769 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -25,11 +25,11 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	bool "support for xz payloads"
 	depends on BR2_PACKAGE_RPM
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Support for xz payloads in RPM.
 
 comment "xz payload support requires a toolchain with c++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
 
 
diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index 18320f0..4b45e70 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Control and monitor storage systems using S.M.A.R.T.
 
 	  http://smartmontools.sourceforge.net/
 
 comment "smartmontools requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_CPP
diff --git a/package/squid/Config.in b/package/squid/Config.in
index 5834ac9..56994e1 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,9 +1,9 @@
 comment "Squid requires a toolchain with C++ and IPv6 support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_IPV6
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_PACKAGE_LIBCAP
 	help
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 2d2c82d..655bd45 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SYNERGY
 	bool "synergy"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
@@ -13,4 +13,4 @@ config BR2_PACKAGE_SYNERGY
 	  http://synergy2.sourceforge.net/
 
 comment "synergy requires a toolchain with C++ and WCHAR support enabled"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP && !BR2_TOOLCHAIN_HAS_WCHAR
+	depends on BR2_PACKAGE_XORG7 && !BR2_TOOLCHAIN_HAS_CPP && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 234c1db..eb4a401 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
@@ -22,4 +22,4 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit requires C++, WCHAR in toolchain and libgtk2"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
+	depends on !BR2_TOOLCHAIN_HAS_CPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 301e72c..dfcec9a 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -19,10 +19,10 @@ choice
 
 config BR2_PACKAGE_XSERVER_xorg
 	bool "Modular X.org"
-	depends on BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_TOOLCHAIN_HAS_CPP
 
 comment 'X.org requires largefile and C++ support'
-	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_INSTALL_LIBSTDCPP)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_TOOLCHAIN_HAS_CPP)
 
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "TinyX"
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 596eea3..acbb4b9 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
 	depends on BR2_PACKAGE_XSERVER_xorg
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index ac2559e..46bb5e9 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
-	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_CPP && BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_XERCES
 	  http://xml.apache.org/xerces-c/
 
 comment "xerces-c++ requires a toolchain with C++ and WCHAR support enabled"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_WCHAR)
+	depends on !(BR2_TOOLCHAIN_HAS_CPP && BR2_TOOLCHAIN_HAS_WCHAR)
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
index b03aedc..4a3ebb7 100644
--- a/target/xtensa/defconfig
+++ b/target/xtensa/defconfig
@@ -53,7 +53,7 @@ BR2_GCC_VERSION="4.3.2"
 BR2_TOOLCHAIN_SYSROOT=y
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
-BR2_INSTALL_LIBSTDCPP=y
+BR2_TOOLCHAIN_HAS_CPP=y
 BR2_GCC_SHARED_LIBGCC=y
 
 #
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index c989b05..108c860 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -79,7 +79,7 @@ config BR2_GCC_CROSS_JAVA
 
 config BR2_INSTALL_LIBGCJ
 	bool "Build/install java compiler and libgcj?"
-	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_avr32 && BR2_TOOLCHAIN_HAS_CPP
 	select BR2_GCC_CROSS_JAVA
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BROKEN
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 96bebd6..43d519c 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -64,7 +64,7 @@ GCC_STAGING_PREREQ+=$(STAGING_DIR)/usr/lib/libc.a
 GCC_TARGET_LANGUAGES:=c
 
 GCC_CROSS_LANGUAGES:=c
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),c++
 endif
 ifeq ($(BR2_GCC_CROSS_FORTRAN),y)
@@ -91,7 +91,7 @@ GCC_STAGING_PREREQ+=$(GCC_COMMON_PREREQ) \
 $(wildcard $(BR2_DEPENDS_DIR)/br2/extra/gcc/config/options*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/gcc/cross/*)
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
 
@@ -432,7 +432,7 @@ ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	mkdir -p $(TARGET_DIR)/usr/lib
 	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 07cddd7..7ce4852 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -53,7 +53,7 @@ config BR2_TOOLCHAIN_BUILDROOT_PROGRAM_INVOCATION
 
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	depends on !(! BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE && \
 		       BR2_TOOLCHAIN_BUILDROOT_LOCALE    && \
 		       BR2_UCLIBC_VERSION_0_9_31)
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index a2aadc1..ff0e37e 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_HAS_LOCALE
 config BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
 	bool
 
-config BR2_INSTALL_LIBSTDCPP
+config BR2_TOOLCHAIN_HAS_CPP
 	bool
 
 config BR2_TOOLCHAIN_HAS_THREADS
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 6d18ce8..3ce480e 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -100,7 +100,7 @@ endif # BR2_TOOLCHAIN_CTNG_uClibc
 
 config BR2_TOOLCHAIN_CTNG_CXX
 	bool "Enable C++ support"
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Enable this option if you want your toolchain to support the
 	  C++ language and you want C++ libraries to be installed on
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 8c22039..a966b04 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -51,7 +51,7 @@ CTNG_LIBS_LIB += $(CTNG_LIBS_$(call qstrip,$(BR2_TOOLCHAIN_CTNG_LIBC)))
 
 #--------------
 # All that we need in /usr/lib
-ifneq ($(BR2_INSTALL_LIBSTDCPP),)
+ifneq ($(BR2_TOOLCHAIN_HAS_CPP),)
 CTNG_LIBS_USR_LIB += libstdc++.so
 endif
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5fc3096..efc63dc 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	bool "CodeSourcery ARM 2010.09"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11 and gdb 7.2.50,
@@ -21,7 +21,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	bool "CodeSourcery ARM 2010q1"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, gdb 7.0.50 and
@@ -35,7 +35,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1
 	bool "CodeSourcery ARM 2009q1"
 	depends on BR2_arm
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the ARM architecture, from CodeSourcery. It
 	  uses gcc 4.3.3, binutils 2.19, glibc 2.8 and gdb 6.8 and
@@ -49,7 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "CodeSourcery MIPS 4.4"
 	depends on BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the MIPS architecture, from CodeSourcery. It
 	  uses gcc 4.4.1, binutils 2.19, glibc 2.11, uClibc 0.9.30 and
@@ -72,7 +72,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "CodeSoucery PowerPC 2010.09"
 	depends on BR2_powerpc
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the PowerPC architecture, from
 	  CodeSourcery. It uses gcc 4.5.1, binutils 2.20, glibc 2.11,
@@ -90,7 +90,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "CodeSoucery PowerPC 2010.09"
 	depends on BR2_sh
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Toolchain for the SuperH architecture, from CodeSourcery. It
 	  uses gcc 4.5.1, binutils 2.20, glibc 2.11, uClibc 0.9.30,
@@ -233,7 +233,7 @@ endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_CXX
 	bool "Toolchain has C++ support?"
-	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_CPP
 	help
 	  Select this option if your external toolchain has C++
 	  support. If you don't know, leave the default value,
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index e589738..f397966 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -49,7 +49,7 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so libnss_dns.so
 endif
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_CPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so
 endif
 
@@ -157,7 +157,7 @@ $(STAMP_DIR)/ext-toolchain-checked:
 	if test x$(BR2_arm) == x"y" ; then \
 		$(call check_arm_abi) ; \
 	fi ; \
-	if test x$(BR2_INSTALL_LIBSTDCPP) == x"y" ; then \
+	if test x$(BR2_TOOLCHAIN_HAS_CPP) == x"y" ; then \
 		$(call check_cplusplus) ; \
 	fi ; \
 	if test x$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC) == x"y" ; then \
-- 
1.7.0.4
