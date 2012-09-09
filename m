From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 01:40:50 +0200
Subject: [Buildroot] [PATCH 5/7] packages: use the newly-introduced
	_AVAILABLE symbol
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347234052-10527-6-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch transforms all 'depends on' on a package to a 'depends on'
the corresponding _AVAILABLE symbol, and adds a 'select' against the
dependant package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsamixergui/Config.in                |    6 ++++--
 package/blackbox/Config.in                    |    3 ++-
 package/dbus-glib/Config.in                   |    3 ++-
 package/dbus-python/Config.in                 |    6 ++++--
 package/directfb-examples/Config.in           |    3 ++-
 package/divine/Config.in                      |    3 ++-
 package/docker/Config.in                      |    3 ++-
 package/feh/Config.in                         |    3 ++-
 package/fltk/Config.in                        |    3 ++-
 package/fluxbox/Config.in                     |    3 ++-
 package/freerdp/Config.in                     |    3 ++-
 package/games/doom-wad/Config.in              |    3 ++-
 package/games/rubix/Config.in                 |    3 ++-
 package/giblib/Config.in                      |    3 ++-
 package/gmpc/Config.in                        |    6 ++++--
 package/gqview/Config.in                      |    3 ++-
 package/gtk2-engines/Config.in                |    3 ++-
 package/gtkperf/Config.in                     |    3 ++-
 package/leafpad/Config.in                     |    3 ++-
 package/libdrm/Config.in                      |    3 ++-
 package/libgail/Config.in                     |    3 ++-
 package/libglade/Config.in                    |    3 ++-
 package/librsvg/Config.in                     |    3 ++-
 package/libsexy/Config.in                     |    3 ++-
 package/libusb-compat/Config.in               |    3 ++-
 package/lite/Config.in                        |    3 ++-
 package/lttng-babeltrace/Config.in            |    3 ++-
 package/lttng-tools/Config.in                 |    3 ++-
 package/matchbox/Config.in                    |    3 ++-
 package/metacity/Config.in                    |    6 ++++--
 package/midori/Config.in                      |    3 ++-
 package/multimedia/gst-ffmpeg/Config.in       |    3 ++-
 package/multimedia/gst-plugins-bad/Config.in  |    3 ++-
 package/multimedia/gst-plugins-base/Config.in |    3 ++-
 package/multimedia/gst-plugins-good/Config.in |    3 ++-
 package/multimedia/gst-plugins-ugly/Config.in |    3 ++-
 package/nss-mdns/Config.in                    |    3 ++-
 package/pcmanfm/Config.in                     |    6 ++++--
 package/python-dpkt/Config.in                 |    3 ++-
 package/python-id3/Config.in                  |    3 ++-
 package/python-mad/Config.in                  |    3 ++-
 package/python-meld3/Config.in                |    3 ++-
 package/python-netifaces/Config.in            |    3 ++-
 package/python-nfc/Config.in                  |    3 ++-
 package/python-pygame/Config.in               |    3 ++-
 package/python-serial/Config.in               |    3 ++-
 package/python-setuptools/Config.in           |    3 ++-
 package/rdesktop/Config.in                    |    3 ++-
 package/rp-pppoe/Config.in                    |    3 ++-
 package/sawman/Config.in                      |    3 ++-
 package/sdl_gfx/Config.in                     |    3 ++-
 package/sdl_image/Config.in                   |    3 ++-
 package/sdl_mixer/Config.in                   |    3 ++-
 package/sdl_net/Config.in                     |    3 ++-
 package/sdl_sound/Config.in                   |    3 ++-
 package/sdl_ttf/Config.in                     |    3 ++-
 package/startup-notification/Config.in        |    3 ++-
 package/supervisor/Config.in                  |    3 ++-
 package/sylpheed/Config.in                    |    3 ++-
 package/synergy/Config.in                     |    3 ++-
 package/torsmo/Config.in                      |    3 ++-
 package/usbmount/Config.in                    |    3 ++-
 package/webkit/Config.in                      |    3 ++-
 package/x11r7/mesa3d/Config.in                |    3 ++-
 package/x11r7/xapp_xdriinfo/Config.in         |    3 ++-
 package/x11vnc/Config.in                      |    3 ++-
 package/xstroke/Config.in                     |    3 ++-
 package/xterm/Config.in                       |    3 ++-
 package/xvkbd/Config.in                       |    3 ++-
 69 files changed, 148 insertions(+), 74 deletions(-)

diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index ea24538..6095653 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_ALSAMIXERGUI_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_ALSA_LIB
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_ALSA_LIB_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_ALSAMIXERGUI
+	select BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_FLTK
 	select BR2_PACKAGE_ALSA_LIB_PCM
 	select BR2_PACKAGE_ALSA_LIB_MIXER
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index e9b9cb1..1e14aa4 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_BLACKBOX_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_BLACKBOX_AVAILABLE
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index f73dafa..a77015e 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_DBUS
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 
 config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
+	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 	help
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 1d466ae..f540f63 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_DBUS_PYTHON_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_PACKAGE_DBUS
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
 	depends on BR2_PACKAGE_DBUS_PYTHON_AVAILABLE
 	help
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index 41fb1ee..ecbf5fd 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_AVAILABLE
 	def_bool y
-       depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB_AVAILABLE
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES
        bool "directfb examples"
 	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES_AVAILABLE
+	select BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
        bool "usr/bin/df_andi"
diff --git a/package/divine/Config.in b/package/divine/Config.in
index 37f157c..0921713 100644
--- a/package/divine/Config.in
+++ b/package/divine/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_DIVINE_AVAILABLE
 	def_bool y
-       depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB_AVAILABLE
 
 config BR2_PACKAGE_DIVINE
        bool "directfb virtual input extension"
 	depends on BR2_PACKAGE_DIVINE_AVAILABLE
+	select BR2_PACKAGE_DIRECTFB
        help
          DiVine provides a DirectFB input driver that reads input
          events from a pipe and dispatches them via a virtual input
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 515be82..40846df 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_DOCKER_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 
 config BR2_PACKAGE_DOCKER
 	bool "docker"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_PACKAGE_DOCKER_AVAILABLE
 	help
diff --git a/package/feh/Config.in b/package/feh/Config.in
index 3760b6f..a54b6e9 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_FEH_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_FEH
 	bool "feh"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_IMLIB2_PNG
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index ca978c2..3738446 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_FLTK_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_FLTK
 	bool "fltk"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	depends on BR2_PACKAGE_FLTK_AVAILABLE
 	help
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index ec8a4f7..c95d3d4 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_FLUXBOX_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_FLUXBOX
 	bool "fluxbox"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_FLUXBOX_AVAILABLE
 	help
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 21a12bd..112c5b0 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_FREERDP_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
diff --git a/package/games/doom-wad/Config.in b/package/games/doom-wad/Config.in
index 5533c18..765c788 100644
--- a/package/games/doom-wad/Config.in
+++ b/package/games/doom-wad/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_DOOM_WAD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PRBOOM
+	depends on BR2_PACKAGE_PRBOOM_AVAILABLE
 
 config BR2_PACKAGE_DOOM_WAD
 	bool "shareware Doom WAD file"
 	depends on BR2_PACKAGE_DOOM_WAD_AVAILABLE
+	select BR2_PACKAGE_PRBOOM
 	help
 	  This will install the shareware wad data file for the doom game.
 
diff --git a/package/games/rubix/Config.in b/package/games/rubix/Config.in
index 249a33c..26b38fe 100644
--- a/package/games/rubix/Config.in
+++ b/package/games/rubix/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_RUBIX_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_RUBIX
 	bool "rubix"
 	depends on BR2_PACKAGE_RUBIX_AVAILABLE
+	select BR2_PACKAGE_XORG7
 	help
 	  A 3D rubiks cube game for X
 
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index 2bc3aa6..cbbd777 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GIBLIB_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_GIBLIB
 	bool "giblib"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_IMLIB2
 	select BR2_PACKAGE_IMLIB2_X
 	depends on BR2_PACKAGE_GIBLIB_AVAILABLE
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 13a1dc2..6449ff9 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_GMPC_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_GMPC
 	bool "gmpc"
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
diff --git a/package/gqview/Config.in b/package/gqview/Config.in
index 88d6177..09b30e3 100644
--- a/package/gqview/Config.in
+++ b/package/gqview/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_GQVIEW_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_GQVIEW
 	bool "gqview"
 	depends on BR2_PACKAGE_GQVIEW_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  GQview is an image viewer for Unix operating systems
 
diff --git a/package/gtk2-engines/Config.in b/package/gtk2-engines/Config.in
index 5c6b503..ca0b304 100644
--- a/package/gtk2-engines/Config.in
+++ b/package/gtk2-engines/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GTK2_ENGINES_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_GTK2_ENGINES
 	bool "gtk engines"
 	depends on BR2_PACKAGE_GTK2_ENGINES_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  A collection of basic theme engines for GTK+.
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
index f297f0f..29b4c3a 100644
--- a/package/gtkperf/Config.in
+++ b/package/gtkperf/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_GTKPERF_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_GTKPERF
 	bool "gtkperf (performance test for GTK2)"
 	depends on BR2_PACKAGE_GTKPERF_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  GtkPerf is an application designed to test GTK+ performance.
 	  The point is to create common testing platform to run
diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
index 7c9ce45..01c6c16 100644
--- a/package/leafpad/Config.in
+++ b/package/leafpad/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LEAFPAD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_LEAFPAD
 	bool "leafpad"
 	depends on BR2_PACKAGE_LEAFPAD_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  GTK+ based simple text editor
 
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 636e72f..da7d729 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBDRM_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_LARGEFILE
 
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index f96726e..ad0664d 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_LIBGAIL_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	depends on BR2_PACKAGE_LIBGAIL_AVAILABLE
 	help
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index f129bdd..80b242a 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBGLADE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 5d99f4e..331b474 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBRSVG_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
index 3607401..a4d202e 100644
--- a/package/libsexy/Config.in
+++ b/package/libsexy/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_LIBSEXY_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
 	depends on BR2_PACKAGE_LIBSEXY_AVAILABLE
 	help
diff --git a/package/libusb-compat/Config.in b/package/libusb-compat/Config.in
index 70d8878..8c6de82 100644
--- a/package/libusb-compat/Config.in
+++ b/package/libusb-compat/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBUSB
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_LIBUSB_COMPAT
 	bool "libusb-compat"
 	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	select BR2_PACKAGE_LIBUSB
 	help
 	  libusb-0.1 compatibility layer for libusb-1.0.
 
diff --git a/package/lite/Config.in b/package/lite/Config.in
index 679ca93..65e4eb9 100644
--- a/package/lite/Config.in
+++ b/package/lite/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LITE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB_AVAILABLE
 
 config BR2_PACKAGE_LITE
 	bool "LiTE (toolbox engine)"
 	depends on BR2_PACKAGE_LITE_AVAILABLE
+	select BR2_PACKAGE_DIRECTFB
 	help
 	   LiTE stands for LiTE is a Toolbox Engine. 
 	   Its role is to facilitate the functions of DirectFB so that a
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index a2a5dcd..23ef11f 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LTTNG_BABELTRACE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LTTNG_TOOLS
+	depends on BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 
 config BR2_PACKAGE_LTTNG_BABELTRACE
 	bool "lttng-babeltrace"
+	select BR2_PACKAGE_LTTNG_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 03d38b7..3bd95fc 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LTTNG_MODULES
+	depends on BR2_PACKAGE_LTTNG_MODULES_AVAILABLE
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
+	select BR2_PACKAGE_LTTNG_MODULES
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_POPT
 	# liburcu only works on some architectures
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 006211e..d393e52 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_MATCHBOX_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_XLIB_LIBXEXT
diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index 75ed570..dc5ba9e 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_METACITY_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_METACITY
 	bool "metacity"
 	depends on BR2_PACKAGE_METACITY_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_XORG7
 	help
 	  Metacity is a window manager for the X Window System.
diff --git a/package/midori/Config.in b/package/midori/Config.in
index c2d1b59..f350314 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_MIDORI_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_USE_WCHAR	 # webkit
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index d5c8537..2ed797e 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_GST_FFMPEG_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
+	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index d88a432..d5e9f1a 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GST_PLUGINS_BAD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
 	bool "gst-plugins-bad"
+	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_PACKAGE_GST_PLUGINS_BAD_AVAILABLE
 	help
diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 4987e1a..08f6dd6 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
 	bool "gst-plugins-base"
+	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 5feca88..ba79da5 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GST_PLUGINS_GOOD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
 	bool "gst-plugins-good"
+	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_PACKAGE_GST_PLUGINS_GOOD_AVAILABLE
 	help
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index 1bbd0e5..f2784c9 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GST_PLUGINS_UGLY_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
 	bool "gst-plugins-ugly"
+	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_PACKAGE_GST_PLUGINS_UGLY_AVAILABLE
 	help
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index 8654bb1..048af01 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_NSS_MDNS_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
-	depends on BR2_PACKAGE_AVAHI_DAEMON
+	depends on BR2_PACKAGE_AVAHI_DAEMON_AVAILABLE
 
 config BR2_PACKAGE_NSS_MDNS
 	bool "nss-mdns"
 	depends on BR2_PACKAGE_NSS_MDNS_AVAILABLE
+	select BR2_PACKAGE_AVAHI_DAEMON
 	help
 	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
 	  functionality of the GNU C Library (glibc) providing host
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index f9d203b..5ebdeb5 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_PCMANFM_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
+	select BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	depends on BR2_PACKAGE_PCMANFM_AVAILABLE
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index 4ab9a26..61383d9 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
 	depends on BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
 	help
diff --git a/package/python-id3/Config.in b/package/python-id3/Config.in
index 807be1b..e57e228 100644
--- a/package/python-id3/Config.in
+++ b/package/python-id3/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_PYTHON_ID3_AVAILABLE
 	def_bool y
-    depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_ID3
     bool "python-id3"
 	depends on BR2_PACKAGE_PYTHON_ID3_AVAILABLE
+	select BR2_PACKAGE_PYTHON
     help
       This module allows one to read and manipulate so-called ID3
       informational tags on MP3 files through an object-oriented
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
index f6d884b..ea42057 100644
--- a/package/python-mad/Config.in
+++ b/package/python-mad/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_MAD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_MAD
 	bool "python-mad"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_LIBMAD
 	depends on BR2_PACKAGE_PYTHON_MAD_AVAILABLE
 	help
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
index f4b04fc..66379e5 100644
--- a/package/python-meld3/Config.in
+++ b/package/python-meld3/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_PYEXPAT
 	depends on BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
 	help
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index d13d5ec..4d092ed 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_NETIFACES_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	depends on BR2_PACKAGE_PYTHON_NETIFACES_AVAILABLE
 	help
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index 3202bc4..4855cf2 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_NFC_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	depends on BR2_PACKAGE_PYTHON_NFC_AVAILABLE
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index ab51c1c..728351f 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_PYGAME_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "pygame"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	depends on BR2_PACKAGE_PYTHON_PYGAME_AVAILABLE
 	help
diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index 7475367..259de69 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_PYTHON_SERIAL_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
 	depends on BR2_PACKAGE_PYTHON_SERIAL_AVAILABLE
+	select BR2_PACKAGE_PYTHON
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index f03eb53..74b511d 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ZLIB
 	depends on BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
 	help
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index e82e4cc..0168a09 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_RDESKTOP_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
diff --git a/package/rp-pppoe/Config.in b/package/rp-pppoe/Config.in
index 0f8a412..754f7e4 100644
--- a/package/rp-pppoe/Config.in
+++ b/package/rp-pppoe/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_RP_PPPOE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PPPD
+	depends on BR2_PACKAGE_PPPD_AVAILABLE
 
 config BR2_PACKAGE_RP_PPPOE
 	bool "rp-pppoe"
 	depends on BR2_PACKAGE_RP_PPPOE_AVAILABLE
+	select BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
 	  Has userspace client and server deamons.  You likely only need
diff --git a/package/sawman/Config.in b/package/sawman/Config.in
index 23567dd..a9b1be2 100644
--- a/package/sawman/Config.in
+++ b/package/sawman/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SAWMAN_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_DIRECTFB_AVAILABLE
 
 config BR2_PACKAGE_SAWMAN
 	bool "SawMan (Window Manager)"
 	depends on BR2_PACKAGE_SAWMAN_AVAILABLE
+	select BR2_PACKAGE_DIRECTFB
 	help
 	  SaWMan is a new window manager module for use with DirectFB. 
           Its main difference to the default module is that it allows 
diff --git a/package/sdl_gfx/Config.in b/package/sdl_gfx/Config.in
index f75bd09..c08988e 100644
--- a/package/sdl_gfx/Config.in
+++ b/package/sdl_gfx/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SDL_GFX_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_GFX
 	bool "SDL_gfx"
 	depends on BR2_PACKAGE_SDL_GFX_AVAILABLE
+	select BR2_PACKAGE_SDL
 	help
 	  The SDL_gfx library is an extension to the SDL library which
 	  provides basic antialiased drawing routines such as lines,
diff --git a/package/sdl_image/Config.in b/package/sdl_image/Config.in
index 21f67b4..39b2163 100644
--- a/package/sdl_image/Config.in
+++ b/package/sdl_image/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SDL_IMAGE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_IMAGE
 	bool "SDL_image"
 	depends on BR2_PACKAGE_SDL_IMAGE_AVAILABLE
+	select BR2_PACKAGE_SDL
 	help
 	  SDL_image is an image file loading library. It loads images
 	  as SDL surfaces, and supports the following formats:
diff --git a/package/sdl_mixer/Config.in b/package/sdl_mixer/Config.in
index 6e43935..2955622 100644
--- a/package/sdl_mixer/Config.in
+++ b/package/sdl_mixer/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SDL_MIXER_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_MIXER
 	bool "SDL_mixer"
 	depends on BR2_PACKAGE_SDL_MIXER_AVAILABLE
+	select BR2_PACKAGE_SDL
 	help
 	  SDL_mixer is a sample multi-channel audio mixer library.
 	  It supports any number of simultaneously playing channels of
diff --git a/package/sdl_net/Config.in b/package/sdl_net/Config.in
index 7f213dd..8d8c464 100644
--- a/package/sdl_net/Config.in
+++ b/package/sdl_net/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SDL_NET_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_NET
 	bool "SDL_net"
 	depends on BR2_PACKAGE_SDL_NET_AVAILABLE
+	select BR2_PACKAGE_SDL
 	help
 	  SDL_net is a small, low-level, cross-platform network library, that
 	  can be used with the Simple DirectMedia Layer library (SDL).
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 693af1a..1c56c34 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_SDL_SOUND_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_SOUND
 	bool "SDL_sound"
+	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_SDL_SOUND_AVAILABLE
 	help
diff --git a/package/sdl_ttf/Config.in b/package/sdl_ttf/Config.in
index 606428b..06c7301 100644
--- a/package/sdl_ttf/Config.in
+++ b/package/sdl_ttf/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_SDL_TTF_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_SDL
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
+	select BR2_PACKAGE_SDL
 	select BR2_PACKAGE_FREETYPE
 	depends on BR2_PACKAGE_SDL_TTF_AVAILABLE
 	help
diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 0b626d2..305fcd9 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	depends on BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
 	help
diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 6bdb274..bed8a61 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_SUPERVISOR_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	select BR2_PACKAGE_PYTHON_MELD3
 	depends on BR2_PACKAGE_SUPERVISOR_AVAILABLE
diff --git a/package/sylpheed/Config.in b/package/sylpheed/Config.in
index 37b3cfc..2993631 100644
--- a/package/sylpheed/Config.in
+++ b/package/sylpheed/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_SYLPHEED_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_SYLPHEED
 	bool "sylpheed"
 	depends on BR2_PACKAGE_SYLPHEED_AVAILABLE
+	select BR2_PACKAGE_LIBGTK2
 	help
 	  lightweight and user-friendly e-mail client.
 
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index e21c170..3e76269 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_SYNERGY_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 
 config BR2_PACKAGE_SYNERGY
 	bool "synergy"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXTST
 	depends on BR2_PACKAGE_SYNERGY_AVAILABLE
 	help
diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index 0a67e72..2d6fe52 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_TORSMO_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
 	depends on BR2_PACKAGE_TORSMO_AVAILABLE
+	select BR2_PACKAGE_XORG7
 	help
 	  Torsmo is a system monitor that sits in the corner of your desktop.
 
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 3d4588f..66a9fcb 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_USBMOUNT_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_UDEV_AVAILABLE
 
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
+	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_LOCKFILE_PROGS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index a365361..bd26ebc 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_WEBKIT_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
+	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 4fe949d..1237eeb 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_MESA3D_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XSERVER_xorg
+	depends on BR2_PACKAGE_XSERVER_xorg_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
+	select BR2_PACKAGE_XSERVER_xorg
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 670cf21..c7882a3 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_XAPP_XDRIINFO_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
+	select BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	depends on BR2_PACKAGE_XAPP_XDRIINFO_AVAILABLE
diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 61f2327..2a2692b 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_X11VNC_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXT
 	depends on BR2_PACKAGE_X11VNC_AVAILABLE
 	help
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 4325263..797f68f 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_XSTROKE_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFT
 	select BR2_PACKAGE_XLIB_LIBXTST
 	select BR2_PACKAGE_XLIB_LIBXPM
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 7950145..9a12a5e 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_XTERM_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_XTERM
 	bool "xterm"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XTERM_AVAILABLE
diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index 155b32a..9d9da81 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_XVKBD_AVAILABLE
 	def_bool y
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG7_AVAILABLE
 
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
+	select BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXTST
 	depends on BR2_PACKAGE_XVKBD_AVAILABLE
-- 
1.7.2.5
