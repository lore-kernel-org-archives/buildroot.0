From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:37 +0100
Subject: [Buildroot] [PATCH 4/9] Rename BR2_USE_WCHAR to
	BR2_TOOLCHAIN_HAS_WCHAR
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b991462eacc6b8b1e2bc6b6b562fc4cf889f79bf.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig             |    2 +-
 configs/arm_toolchain_defconfig                  |    2 +-
 package/atk/Config.in                            |    4 ++--
 package/bison/Config.in                          |    4 ++--
 package/coreutils/Config.in                      |    4 ++--
 package/cvs/Config.in                            |    2 +-
 package/dbus-glib/Config.in                      |    4 ++--
 package/dbus-python/Config.in                    |    4 ++--
 package/dnsmasq/Config.in                        |    2 +-
 package/docker/Config.in                         |    4 ++--
 package/enchant/Config.in                        |    4 ++--
 package/findutils/Config.in                      |    4 ++--
 package/gamin/Config.in                          |    4 ++--
 package/gawk/Config.in                           |    2 +-
 package/gdk-pixbuf/Config.in                     |    2 +-
 package/gettext/Config.in                        |    6 +++---
 package/gmpc/Config.in                           |    4 ++--
 package/gob2/Config.in                           |    4 ++--
 package/grep/Config.in                           |    4 ++--
 package/gvfs/Config.in                           |    4 ++--
 package/hal/Config.in                            |    4 ++--
 package/icu/Config.in                            |    4 ++--
 package/libarchive/Config.in                     |    4 ++--
 package/libglade/Config.in                       |    4 ++--
 package/libglib2/Config.in                       |    4 ++--
 package/libglib2/libglib2.mk                     |    2 +-
 package/libgtk2/Config.in                        |    4 ++--
 package/librsvg/Config.in                        |    2 +-
 package/libsoup/Config.in                        |    4 ++--
 package/logrotate/Config.in                      |    4 ++--
 package/lsof/lsof.mk                             |    2 +-
 package/m4/Config.in                             |    4 ++--
 package/m4/m4.mk                                 |    2 +-
 package/midori/Config.in                         |    4 ++--
 package/multimedia/alsa-utils/Config.in          |    4 ++--
 package/multimedia/gstreamer/Config.in           |    4 ++--
 package/multimedia/libmms/Config.in              |    4 ++--
 package/multimedia/libmpd/Config.in              |    4 ++--
 package/multimedia/mpd/Config.in                 |    4 ++--
 package/multimedia/swfdec/Config.in              |    4 ++--
 package/mutt/Config.in                           |    4 ++--
 package/nbd/Config.in                            |    4 ++--
 package/ntfs-3g/Config.in                        |    4 ++--
 package/ntfsprogs/Config.in                      |    4 ++--
 package/pango/Config.in                          |    4 ++--
 package/patch/Config.in                          |    4 ++--
 package/pcmanfm/Config.in                        |    4 ++--
 package/php/Config.ext                           |    4 ++--
 package/pkg-config/Config.in                     |    4 ++--
 package/python/Config.in                         |    4 ++--
 package/rrdtool/Config.in                        |    4 ++--
 package/ruby/Config.in                           |    4 ++--
 package/sed/Config.in                            |    2 +-
 package/shared-mime-info/Config.in               |    4 ++--
 package/sshfs/Config.in                          |    4 ++--
 package/synergy/Config.in                        |    4 ++--
 package/tar/Config.in                            |    4 ++--
 package/webkit/Config.in                         |    4 ++--
 package/wget/Config.in                           |    4 ++--
 package/x11r7/Config.in                          |    4 ++--
 package/xerces/Config.in                         |    5 +++--
 toolchain/gdb/Config.in                          |    4 ++--
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    2 +-
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    2 +-
 69 files changed, 126 insertions(+), 125 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index d9cf6dc..aa043da 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -7,7 +7,7 @@ BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_TOOLCHAIN_HAS_RPC=y
 BR2_ENABLE_LOCALE=y
-BR2_USE_WCHAR=y
+BR2_TOOLCHAIN_HAS_WCHAR=y
 BR2_PTHREADS_NATIVE=y
 BR2_INSTALL_LIBSTDCPP=y
 
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 436a139..9773d74 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -6,7 +6,7 @@ BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_TOOLCHAIN_HAS_RPC=y
 BR2_ENABLE_LOCALE=y
-BR2_USE_WCHAR=y
+BR2_TOOLCHAIN_HAS_WCHAR=y
 BR2_INSTALL_LIBSTDCPP=y
 
 # No package
diff --git a/package/atk/Config.in b/package/atk/Config.in
index 928fae7..d6e0a75 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_LIBGLIB2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
 
 comment "atk requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/bison/Config.in b/package/bison/Config.in
index e8aa0b6..db72990 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BISON
 	bool "bison"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  General-purpose parser generator that converts a
 	  grammar description for an LALR context-free grammar into a C
@@ -9,4 +9,4 @@ config BR2_PACKAGE_BISON
 	  http://www.gnu.org/software/bison/
 
 comment "bison requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index a7159cf..d72df3a 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_COREUTILS
 	bool "coreutils"
-	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION
 	help
 	  All of the basic file/text/shell utilities.  These are the
 	  core utilities which are expected to exist on every system.
@@ -14,4 +14,4 @@ config BR2_PACKAGE_COREUTILS
 	  http://www.gnu.org/software/coreutils/
 
 comment "coreutils requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION)
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index 2e61834..3952ade 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CVS
 	bool "cvs"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Concurrent Versions System - source code revision control tools.
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index c019be7..5e925c5 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_DBUS_EXPAT
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
@@ -13,4 +13,4 @@ comment "dbus-glib needs dbus to be compiled with expat support"
 	depends on BR2_PACKAGE_DBUS && !BR2_DBUS_EXPAT
 
 comment "dbus-glib requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_DBUS && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index 91c127d..88ab335 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	depends on BR2_PACKAGE_DBUS
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_DBUS_GLIB
@@ -10,4 +10,4 @@ config BR2_PACKAGE_DBUS_PYTHON
 	  http://dbus.freedesktop.org/doc/dbus-python/
 
 comment "dbus-python requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_DBUS && BR2_PACKAGE_PYTHON && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index e9c4870..4ae7914 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_DNSMASQ_DHCP
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support (BIG!)"
 	depends on BR2_PACKAGE_DNSMASQ
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBINTL
 	select BR2_PACKAGE_LIBIDN
 	help
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 75bf5be..59af5c6 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DOCKER
 	bool "docker"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  a system tray dock for X
@@ -9,4 +9,4 @@ config BR2_PACKAGE_DOCKER
 	  http://icculus.org/openbox/2/docker
 
 comment "docker requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XORG7 && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index 33f36db..4451e0a 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ENCHANT
 	bool "enchant"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Enchant is a spell-checking library that provides a consistent
@@ -10,4 +10,4 @@ config BR2_PACKAGE_ENCHANT
 	  http://www.abisource.com/projects/enchant/
 
 comment "enchant requires a toolchain with C++ and WCHAR support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index bbe2cc1..e2d7dc7 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Basic directory searching utilities.  Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_FINDUTILS
 	  http://www.gnu.org/software/findutils/findutils.html
 
 comment "findutils requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index 3ede2e4..c4e2631 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  the File Alteration Monitor
@@ -8,4 +8,4 @@ config BR2_PACKAGE_GAMIN
 	  http://www.gnome.org/~veillard/gamin/sources
 
 comment "gamin requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 62ca860..4396d28 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GAWK
 	bool "gawk"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  A special-purpose programming language which is data driven
 	  rather than procedural.  Allows for simple data-reformatting jobs
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 8b9cc3f..3e96844 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index fabfe1e..a2e45db 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GETTEXT
 	bool "gettext"
 	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  The GNU `gettext' utilities are a set of tools that provide a
 	  framework to help other GNU packages produce multi-lingual
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GETTEXT
 	  http://www.gnu.org/software/gettext/
 
 comment "gettext requires a toolchain with WCHAR support"
-	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
+	depends on BR2_NEEDS_GETTEXT && !BR2_TOOLCHAIN_HAS_WCHAR
 
 config BR2_PACKAGE_GETTEXT_STATIC
 	bool "Use libgettext.a instead of libgettext.so.*"
@@ -27,7 +27,7 @@ config BR2_PACKAGE_GETTEXT_STATIC
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
 	depends on BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Selecting this package installs all of gettext in the staging
 	  directory and the shared library for it's use in the target.
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 7bfe611..23280af 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -17,4 +17,4 @@ config BR2_PACKAGE_GMPC
 	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
 
 comment "gmpc requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index 562ac31..f4cb19f 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GOB2
 	bool "gob2"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_FLEX
 	select BR2_PACKAGE_FLEX_LIBFL
@@ -12,4 +12,4 @@ config BR2_PACKAGE_GOB2
 	  http://www.jirka.org/gob.html
 
 comment "gob2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/grep/Config.in b/package/grep/Config.in
index 1b39922..dd4a39d 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GREP
 	bool "grep"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
@@ -9,4 +9,4 @@ config BR2_PACKAGE_GREP
 	  http://www.gnu.org/software/grep/grep.html
 
 comment "grep needs a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 22c93ef..0038855 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GVFS
 	bool "gvfs"
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
 	select BR2_PACKAGE_DBUS
@@ -17,4 +17,4 @@ config BR2_PACKAGE_GVFS
 	  http://en.wikipedia.org/wiki/GVFS
 
 comment "gvfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 1951c9d..1117294 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HAL
 	bool "hal"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
@@ -16,4 +16,4 @@ config BR2_PACKAGE_HAL
 	  The Hardware Abstraction Layer (HAL) suite.
 
 comment "hal requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 21f5c2f..e593f85 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  International Components for Unicode.
 
 	  http://site.icu-project.org/
 
 comment "icu requires a toolchain with C++ support and WCHAR enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/libarchive/Config.in b/package/libarchive/Config.in
index 38928b0..ba07269 100644
--- a/package/libarchive/Config.in
+++ b/package/libarchive/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBARCHIVE
 	bool "libarchive"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Libarchive is a reusable C library for reading and writing a
 	  variety of streaming archive formats.
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBARCHIVE
 	  http://code.google.com/p/libarchive/
 
 comment "libarchive requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 config BR2_PACKAGE_LIBARCHIVE_BSDTAR
 	bool "bsdtar"
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index f7a9a1c..2cb4c7b 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade"
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_LIBXML2
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBGLADE
 	  http://ftp.gnome.org/pub/GNOME/sources/libglade/
 
 comment "libglade requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_LIBGTK2 && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBGTK2 && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3d42430..9bd3410 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # gettext
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
 comment "libglib2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 57facfc..09e3691 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -42,7 +42,7 @@ LIBGLIB2_CONF_ENV =	\
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no \
-		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
+		gt_cv_c_wchar_t=$(if $(BR2_TOOLCHAIN_HAS_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 38b0b47..4aca9c7 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The GTK+ version 2 graphical user interface library
@@ -17,4 +17,4 @@ config BR2_PACKAGE_LIBGTK2
 	  http://www.gtk.org/
 
 comment "libgtk2 requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index fdb7d31..3e1d150 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_LIBGLIB2
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 2264b63..74fd9bb 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBSOUP
 	  http://live.gnome.org/LibSoup
 
 comment "libsoup requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 0d0ec61..b270451 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
 	select BR2_PACKAGE_POPT
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  A simple program to rotate logs.
 
 	  https://fedorahosted.org/logrotate/
 
 comment "logrotate requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 854dbb3..745c89c 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -15,7 +15,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_IPV6),)
 BR2_LSOF_CFLAGS += -UHASIPv6
 endif
 
-ifeq ($(BR2_USE_WCHAR),)
+ifeq ($(BR2_TOOLCHAIN_HAS_WCHAR),)
 define LSOF_CONFIGURE_WCHAR_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASWIDECHAR.*,#undef HASWIDECHAR,' \
 		$(@D)/machine.h
diff --git a/package/m4/Config.in b/package/m4/Config.in
index 56b2859..d08edc9 100644
--- a/package/m4/Config.in
+++ b/package/m4/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_M4
 	bool "m4"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  An implementation of the traditional Unix macro processor.
 
 	  http://www.gnu.org/software/m4/m4.html
 
 comment "m4 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d713b6d..44740c7 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -9,7 +9,7 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
 
 M4_CONF_ENV = gl_cv_func_gettimeofday_clobber=no
 
-ifneq ($(BR2_USE_WCHAR),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_WCHAR),y)
 M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
 endif
 
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 95a0afb..30dbde3 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -4,11 +4,11 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBSEXY
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
-	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_TOOLCHAIN_HAS_WCHAR	 # webkit
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
 
 comment "midori requires C++, WCHAR in toolchain and libgtk2"
-        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index b268606..572f986 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -27,11 +27,11 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	select BR2_PACKAGE_NCURSES_TARGET_MENU
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	default y
 
 comment "alsamixer requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 7de904c..6c77aa7 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_GSTREAMER
 	  http://gstreamer.freedesktop.org/
 
 comment "gstreamer requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/multimedia/libmms/Config.in b/package/multimedia/libmms/Config.in
index 17cb406..96577b6 100644
--- a/package/multimedia/libmms/Config.in
+++ b/package/multimedia/libmms/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
           LibMMS is a common library for parsing mms:// and mmsh://
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBMMS
 	  http://launchpad.net/libmms
 
 comment "libmms requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/multimedia/libmpd/Config.in b/package/multimedia/libmpd/Config.in
index 9259c19..3652896 100644
--- a/package/multimedia/libmpd/Config.in
+++ b/package/multimedia/libmpd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -11,4 +11,4 @@ config BR2_PACKAGE_LIBMPD
 	  http://gmpcwiki.sarine.nl/index.php?title=Libmpd
 
 comment "libmpd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 66fc2e4..3efb7c0 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -161,4 +161,4 @@ config BR2_PACKAGE_MPD_WAVPACK
 endif
 
 comment "mpd requires a toolchain with C++ and WCHAR support"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/multimedia/swfdec/Config.in b/package/multimedia/swfdec/Config.in
index bc1c73a..77fc919 100644
--- a/package/multimedia/swfdec/Config.in
+++ b/package/multimedia/swfdec/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SWFDEC
 	bool "swfdec"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	select BR2_PACKAGE_LIBOIL
 	select BR2_PACKAGE_ALSA_LIB
@@ -32,4 +32,4 @@ config BR2_PACKAGE_SWFDEC_GSTREAMER
 	  Enables GStreamer support
 
 comment "swfdec requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 754979a..452cce0 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MUTT
 	bool "mutt"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_NCURSES
 	help
 	  Mutt is a sophisticated text-based Mail User Agent (MUA)
@@ -8,4 +8,4 @@ config BR2_PACKAGE_MUTT
 	  http://www.mutt.org/
 
 comment "mutt requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 6e92f93..f1f9004 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
@@ -11,7 +11,7 @@ config BR2_PACKAGE_NBD
 	  http://nbd.sf.net/
 
 comment "nbd requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 if BR2_PACKAGE_NBD
 
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index e1e3f0d..ea94de2 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  The NTFS-3G driver is an open source, freely available
 	  read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD,
@@ -13,4 +13,4 @@ config BR2_PACKAGE_NTFS_3G
 	  http://www.ntfs-3g.org/
 
 comment "ntfs-3g requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_TOOLCHAIN_HAS_LARGEFILE && BR2_TOOLCHAIN_HAS_WCHAR)
diff --git a/package/ntfsprogs/Config.in b/package/ntfsprogs/Config.in
index d09987a..7e20d6d 100644
--- a/package/ntfsprogs/Config.in
+++ b/package/ntfsprogs/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_NTFSPROGS
 	bool "ntfsprogs"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	help
 	  wide collection of NTFS utilities
@@ -8,4 +8,4 @@ config BR2_PACKAGE_NTFSPROGS
 	  http://www.linux-ntfs.org/
 
 comment "ntfsprogs requires a toolchain with WCHAR and LARGEFILE support"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_LARGEFILE
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_TOOLCHAIN_HAS_LARGEFILE
diff --git a/package/pango/Config.in b/package/pango/Config.in
index 923c3d4..f852e00 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PANGO
 	bool "pango"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_EXPAT
@@ -17,4 +17,4 @@ config BR2_PACKAGE_PANGO
 	  http://www.pango.org/
 
 comment "pango requires a toolchain with WCHAR and C++ support"
-	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/patch/Config.in b/package/patch/Config.in
index dd6d51c..4b8d276 100644
--- a/package/patch/Config.in
+++ b/package/patch/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PATCH
 	bool "patch"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Take patch files (containing difference listings) and apply them
 	  to original files, producing patched versions.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PATCH
 	  http://www.gnu.org/software/patch/
 
 comment "patch needs a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index c8b4deb..71a1adf 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_GAMIN
 	select BR2_PACKAGE_STARTUP_NOTIFICATION
 	depends on BR2_PACKAGE_LIBGTK2
@@ -12,4 +12,4 @@ config BR2_PACKAGE_PCMANFM
 	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 
 comment "pcmanfm requires a toolchain with WCHAR support"
-	depends on BR2_PACKAGE_XORG7 && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XORG7 && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4f1614e..9fd4bde 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -68,12 +68,12 @@ config BR2_PACKAGE_PHP_EXT_FTP
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "gettext"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  gettext support
 
 comment "gettext support requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 config BR2_PACKAGE_PHP_EXT_GMP
 	bool "gmp"
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index eae0a21..a8fdb7c 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  pkg-config is a system for managing library compile/link
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PKG_CONFIG
 	  http://www.freedesktop.org/software/pkgconfig/
 
 comment "pkg-config requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..c49428e 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON
 	bool "python"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBFFI
 	help
 	  The python language interpreter.
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON
 	  http://www.python.org/
 
 comment "python requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 if BR2_PACKAGE_PYTHON
 
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d315b57..825b66d 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RRDTOOL
 	bool "rrdtool"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBART
 	select BR2_PACKAGE_LIBPNG
@@ -12,4 +12,4 @@ config BR2_PACKAGE_RRDTOOL
 	  http://oss.oetiker.ch/rrdtool/
 
 comment "rrdtool requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index c18d8ad..65c9ba2 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_RUBY
 	bool "ruby"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Object Oriented Scripting Language.
 
 	  http://www.ruby-lang.org/
 
 comment "ruby requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/sed/Config.in b/package/sed/Config.in
index 950701c..71c803a 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SED
 	bool "sed"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Super-useful stream editor.
 
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index b08c1fd..94ff324 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
 	help
@@ -11,4 +11,4 @@ config BR2_PACKAGE_SHARED_MIME_INFO
 	  http://freedesktop.org/wiki/Software/shared-mime-info
 
 comment "shared-mime-info requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 66fdde7..c0ead73 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
-	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	help
 	  FUSE makes it possible to implement a filesystem in a userspace
 	  program. Features include: simple yet comprehensive API, secure
@@ -17,4 +17,4 @@ config BR2_PACKAGE_SSHFS
 	  http://fuse.sourceforge.net/sshfs.html
 
 comment "sshfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_LARGEFILE || !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 7d8c54e..2d2c82d 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SYNERGY
 	bool "synergy"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Synergy lets you easily share a single mouse and
@@ -13,4 +13,4 @@ config BR2_PACKAGE_SYNERGY
 	  http://synergy2.sourceforge.net/
 
 comment "synergy requires a toolchain with C++ and WCHAR support enabled"
-	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP && !BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP && !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/tar/Config.in b/package/tar/Config.in
index 20529e3..87d2c63 100644
--- a/package/tar/Config.in
+++ b/package/tar/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TAR
 	bool "tar"
-	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
+	depends on BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION
 	help
 	  A program that saves many files together into a single tape or disk
 	  archive, and can restore individual files from the archive.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TAR
 	  http://www.gnu.org/software/tar/
 
 comment "tar requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
+	depends on !(BR2_TOOLCHAIN_HAS_WCHAR && BR2_PROGRAM_INVOCATION)
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 34071e4..234c1db 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
@@ -22,4 +22,4 @@ config BR2_PACKAGE_WEBKIT
 	  http://webkit.org/
 
 comment "webkit requires C++, WCHAR in toolchain and libgtk2"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_PACKAGE_LIBGTK2
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_WCHAR || !BR2_PACKAGE_LIBGTK2
diff --git a/package/wget/Config.in b/package/wget/Config.in
index 172359c..0500678 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
 	  http://www.gnu.org/software/wget/
 
 comment "wget requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index f0b731e..301e72c 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -4,7 +4,7 @@ menuconfig BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_FONTCONFIG
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Support for X11R7 libraries, servers, drivers, and/or
 	  applications in the target.
@@ -307,4 +307,4 @@ endmenu
 endif
 
 comment "X.org requires a toolchain with WCHAR support"
-        depends on !BR2_USE_WCHAR
+        depends on !BR2_TOOLCHAIN_HAS_WCHAR
diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 374729a..96b6279 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
-	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_WCHAR
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
 	  http://xml.apache.org/xerces-c/
 
 comment "xerces-c++ requires a toolchain with C++ and WCHAR support enabled"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_WCHAR)
diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 8295f79..a2f2d2c 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -3,12 +3,12 @@ comment "Gdb Options"
 config BR2_PACKAGE_GDB
 	bool "Build gdb debugger for the Target"
 	select BR2_PACKAGE_NCURSES
-	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	    Build the full gdb debugger to run on the target.
 
 comment "Gdb debugger for the target needs WCHAR support in toolchain"
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_WCHAR
 
 config BR2_PACKAGE_GDB_SERVER
 	bool "Build gdb server for the Target"
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6ffbc8f..ecf0dd3 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -147,7 +147,7 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_RPC,RPC support) ;\
 	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_feature,BR2_USE_WCHAR,Wide char support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_WCHAR,Wide char support) ;\
 	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
 
 #
@@ -193,7 +193,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_TOOLCHAIN_HAS_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_TOOLCHAIN_HAS_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
 
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 1ade855..53bfd50 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -27,7 +27,7 @@ config BR2_TOOLCHAIN_BUILDROOT_INET_RPC
 
 config BR2_TOOLCHAIN_BUILDROOT_WCHAR
 	bool "Enable WCHAR support"
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Enable this option if you want your toolchain to support
 	  wide characters (i.e characters longer than 8 bits, needed
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index dfaa8c3..acabb02 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -14,7 +14,7 @@ config BR2_TOOLCHAIN_HAS_IPV6
 config BR2_TOOLCHAIN_HAS_RPC
 	bool
 
-config BR2_USE_WCHAR
+config BR2_TOOLCHAIN_HAS_WCHAR
 	bool
 
 config BR2_ENABLE_LOCALE
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 530b2a4..09ca1c4 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -16,7 +16,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PROGRAM_INVOCATION
 
 config BR2_TOOLCHAIN_CTNG_glibc
@@ -25,7 +25,7 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PROGRAM_INVOCATION
 
 endchoice # C library
@@ -72,7 +72,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC
 
 config BR2_TOOLCHAIN_CTNG_uClibc_WCHAR
 	bool "Enable WCHAR support"
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Enable this option if you want your toolchain to support
 	  wide characters (i.e characters longer than 8 bits, needed
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 0215287..da37c19 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -272,7 +272,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES)=.*:\# \1 is not set:;
 endif
 
 # Handle the wide-char option
-ifneq ($(call qstrip,$(BR2_USE_WCHAR)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_WCHAR)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_WCHAR) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 09115fb..e9290a8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -146,7 +146,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_PROGRAM_INVOCATION
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -198,7 +198,7 @@ config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 
 config BR2_TOOLCHAIN_EXTERNAL_WCHAR
 	bool "Toolchain has WCHAR support?"
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_WCHAR
 	help
 	  Select this option if your external toolchain supports
 	  WCHAR. If you don't know, leave the default value, Buildroot
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 692d43c..80b5b04 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -313,7 +313,7 @@ ifeq ($(BR2_ENABLE_LOCALE),y)
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_USE_WCHAR),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_WCHAR),y)
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.7.0.4
