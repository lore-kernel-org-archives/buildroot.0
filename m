From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:39 +0100
Subject: [Buildroot] [PATCH 6/9] Rename BR2_ENABLE_LOCALE to
	BR2_TOOLCHAIN_HAS_LOCALE
In-Reply-To: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
References: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0439da122fb46611b5dcd564ab8ae7bc1cea5e7a.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/arm_nptl_toolchain_defconfig             |    2 +-
 configs/arm_toolchain_defconfig                  |    2 +-
 package/Makefile.in                              |    2 +-
 package/axel/axel.mk                             |    2 +-
 package/blackbox/Config.in                       |    2 +-
 package/blackbox/blackbox.mk                     |    2 +-
 package/dialog/Config.in                         |    2 +-
 package/dialog/dialog.mk                         |    2 +-
 package/gdk-pixbuf/Config.in                     |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                 |    2 +-
 package/gmpc/Config.in                           |    2 +-
 package/hal/Config.in                            |    2 +-
 package/libglib2/Config.in                       |    2 +-
 package/libglib2/libglib2.mk                     |    2 +-
 package/libiconv/Config.in                       |    2 +-
 package/libiconv/libiconv.mk                     |    2 +-
 package/lsof/lsof.mk                             |    2 +-
 package/multimedia/libmpd/Config.in              |    2 +-
 package/multimedia/mpd/Config.in                 |    2 +-
 package/multimedia/wavpack/Config.in             |    2 +-
 package/multimedia/wavpack/wavpack.mk            |    2 +-
 package/samba/Config.in                          |    2 +-
 package/samba/samba.mk                           |    2 +-
 package/sdl_sound/Config.in                      |    2 +-
 package/sdl_sound/sdl_sound.mk                   |    2 +-
 package/sshfs/Config.in                          |    2 +-
 package/sshfs/sshfs.mk                           |    2 +-
 package/xerces/Config.in                         |    2 +-
 package/xmlstarlet/Config.in                     |    2 +-
 toolchain/dependencies/dependencies.sh           |    2 +-
 toolchain/gdb/gdb.mk                             |    2 +-
 toolchain/helpers.mk                             |    4 ++--
 toolchain/toolchain-buildroot/Config.in.2        |    2 +-
 toolchain/toolchain-common.in                    |    4 ++--
 toolchain/toolchain-crosstool-ng/Config.in       |    6 +++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    2 +-
 toolchain/toolchain-external/Config.in           |    4 ++--
 toolchain/uClibc/uclibc.mk                       |    2 +-
 38 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/configs/arm_nptl_toolchain_defconfig b/configs/arm_nptl_toolchain_defconfig
index aa043da..043bd77 100644
--- a/configs/arm_nptl_toolchain_defconfig
+++ b/configs/arm_nptl_toolchain_defconfig
@@ -6,7 +6,7 @@ BR2_arm926t=y
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_TOOLCHAIN_HAS_RPC=y
-BR2_ENABLE_LOCALE=y
+BR2_TOOLCHAIN_HAS_LOCALE=y
 BR2_TOOLCHAIN_HAS_WCHAR=y
 BR2_PTHREADS_NATIVE=y
 BR2_INSTALL_LIBSTDCPP=y
diff --git a/configs/arm_toolchain_defconfig b/configs/arm_toolchain_defconfig
index 9773d74..ae6a550 100644
--- a/configs/arm_toolchain_defconfig
+++ b/configs/arm_toolchain_defconfig
@@ -5,7 +5,7 @@ BR2_arm=y
 BR2_TOOLCHAIN_HAS_LARGEFILE=y
 BR2_TOOLCHAIN_HAS_IPV6=y
 BR2_TOOLCHAIN_HAS_RPC=y
-BR2_ENABLE_LOCALE=y
+BR2_TOOLCHAIN_HAS_LOCALE=y
 BR2_TOOLCHAIN_HAS_WCHAR=y
 BR2_INSTALL_LIBSTDCPP=y
 
diff --git a/package/Makefile.in b/package/Makefile.in
index 92060bd..ebfc3af 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -289,7 +289,7 @@ TARGET_CONFIGURE_ARGS= \
 
 #######################################################################
 
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 DISABLE_NLS:=
 else
 DISABLE_NLS:=--disable-nls
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 1bf4d81..94fe26a 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -14,7 +14,7 @@ AXEL_DEPENDENCIES += gettext libintl
 AXEL_LDFLAGS += -lintl
 endif
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 AXEL_DISABLE_I18N=--i18n=0
 endif
 
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 70f7eb4..7e2c1c6 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Blackbox is a fast, lightweight window manager for the X
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index e3c8c34..0c8e55b 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -16,7 +16,7 @@ BLACKBOX_CONF_OPT:=--x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 BLACKBOX_DEPENDENCIES = xlib_libX11
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
 endif
 
diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 9d3462e..30e3645 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
 	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  dialog - display dialog boxes from shell scripts
 
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index e8f025f..5570825 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -10,7 +10,7 @@ DIALOG_CONF_OPT = --with-ncurses
 DIALOG_CONF_ENV = ac_cv_path_NCURSES_CONFIG=true LIBS=-lncurses
 DIALOG_DEPENDENCIES = ncurses
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 DIALOG_DEPENDENCIES+=libiconv
 endif
 
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 3e96844..34febac 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 
 	  Gdk-Pixbuf is an image loader and scaler. It uses GObject
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 83c59bf..7864b38 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -40,7 +40,7 @@ endif
 
 GDK_PIXBUF_DEPENDENCIES += \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	$(if $(BR2_TOOLCHAIN_HAS_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
 define GDK_PIXBUF_POST_INSTALL_TWEAKS
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 23280af..c36097d 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_GMPC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_LIBMPD
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLADE
diff --git a/package/hal/Config.in b/package/hal/Config.in
index 1117294..a276fb7 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HAL
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_DBUS
 	select BR2_DBUS_EXPAT
 	select BR2_PACKAGE_DBUS_GLIB
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 9bd3410..2de7a8c 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # gettext
 	help
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 09e3691..e65964b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -57,7 +57,7 @@ LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 zlib $(if $(BR2_NEEDS_GETT
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-zlib
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
 endif
 
diff --git a/package/libiconv/Config.in b/package/libiconv/Config.in
index ee4fd62..bec1fab 100644
--- a/package/libiconv/Config.in
+++ b/package/libiconv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBICONV
 	bool "libiconv"
-	depends on !BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  unicode conversion library
 
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 27977a8..4928ef0 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -27,6 +27,6 @@ $(eval $(call AUTOTARGETS,package,libiconv))
 # Configurations where the toolchain supports locales and the libiconv
 # package is enabled are incorrect, because the toolchain already
 # provides libiconv functionality, and having both confuses packages.
-ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_ENABLE_LOCALE),yy)
+ifeq ($(BR2_PACKAGE_LIBICONV)$(BR2_TOOLCHAIN_HAS_LOCALE),yy)
 $(error Libiconv should never be enabled when the toolchain supports locales. Report this failure to Buildroot developers)
 endif
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 745c89c..d5fdff7 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -24,7 +24,7 @@ define LSOF_CONFIGURE_WCHAR_FIXUPS
 endef
 endif
 
-ifeq ($(BR2_ENABLE_LOCALE),)
+ifeq ($(BR2_TOOLCHAIN_HAS_LOCALE),)
 define LSOF_CONFIGURE_LOCALE_FIXUPS
 	$(SED) 's,^#define[[:space:]]*HASSETLOCALE.*,#undef HASSETLOCALE,' \
 		$(@D)/machine.h
diff --git a/package/multimedia/libmpd/Config.in b/package/multimedia/libmpd/Config.in
index 3652896..50db647 100644
--- a/package/multimedia/libmpd/Config.in
+++ b/package/multimedia/libmpd/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  High-level client library for accessing Music Player Daemon.
 	  LibMpd is a library that provides high-level, callback-based
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 3efb7c0..6741b6a 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -3,7 +3,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
 	help
 	  MPD is a flexible, powerful, server-side application
diff --git a/package/multimedia/wavpack/Config.in b/package/multimedia/wavpack/Config.in
index 1ef3e42..1985525 100644
--- a/package/multimedia/wavpack/Config.in
+++ b/package/multimedia/wavpack/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAVPACK
 	bool "wavpack"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  WavPack is a completely open audio compression format providing
 	  lossless, high-quality lossy, and a unique hybrid compression mode.
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 035963a..43d95c3 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -9,7 +9,7 @@ WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 WAVPACK_DEPENDENCIES += libiconv
 endif
 
diff --git a/package/samba/Config.in b/package/samba/Config.in
index 58a84f3..61057d9 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SAMBA
 	bool "samba"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Provides print services to all manner of SMB/CIFS clients,
 	  including the numerous versions of Microsoft Windows
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 160cf2e..d9400de 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -15,7 +15,7 @@ SAMBA_INSTALL_TARGET = YES
 
 
 SAMBA_DEPENDENCIES = \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
+	$(if $(BR2_TOOLCHAIN_HAS_LOCALE),,libiconv) \
 	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),readline) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi) \
diff --git a/package/sdl_sound/Config.in b/package/sdl_sound/Config.in
index 542c996..f9b4996 100644
--- a/package/sdl_sound/Config.in
+++ b/package/sdl_sound/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SDL_SOUND
 	bool "SDL_sound"
 	depends on BR2_PACKAGE_SDL
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  SDL_sound is a library that handles the decoding of several
 	  popular sound file formats, such as .WAV and .MP3.
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 8f51e05..0fab0e0 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -10,7 +10,7 @@ SDL_SOUND_INSTALL_STAGING:=YES
 SDL_SOUND_INSTALL_TARGET:=YES
 SDL_SOUND_DEPENDENCIES = sdl
 
-ifneq ($(BR2_ENABLE_LOCALE),y)
+ifneq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 SDL_SOUND_DEPENDENCIES += libiconv
 endif
 
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index c0ead73..ab1c91d 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_TOOLCHAIN_HAS_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_WCHAR # glib2
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index ae837bb..90851f1 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -10,6 +10,6 @@ SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
-	$(if $(BR2_ENABLE_LOCALE),,libiconv)
+	$(if $(BR2_TOOLCHAIN_HAS_LOCALE),,libiconv)
 
 $(eval $(call AUTOTARGETS,package,sshfs))
diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 96b6279..ac2559e 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
 	depends on BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_WCHAR
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
index 99762b8..b639ad2 100644
--- a/package/xmlstarlet/Config.in
+++ b/package/xmlstarlet/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XMLSTARLET
 	bool "xmlstarlet"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV if !BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Command Line XML Toolkit
 
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 74ab213..8cfbefb 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -140,7 +140,7 @@ for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio p
 done
 
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $CONFIG_FILE > /dev/null && \
-   grep ^BR2_ENABLE_LOCALE=y       $CONFIG_FILE > /dev/null ; then
+   grep ^BR2_TOOLCHAIN_HAS_LOCALE=y       $CONFIG_FILE > /dev/null ; then
    if ! which locale > /dev/null ; then
        /bin/echo -e "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
        exit 1 ;
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index caf3e36..85990ea 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -87,7 +87,7 @@ $(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
 		--disable-werror \
 		$(QUIET) \
 	)
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
 endif
 	touch $@
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ecf0dd3..f767d41 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -145,7 +145,7 @@ check_glibc = \
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LARGEFILE,Large file support) ;\
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_IPV6,IPv6 support) ;\
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_RPC,RPC support) ;\
-	$(call check_glibc_feature,BR2_ENABLE_LOCALE,Locale support) ;\
+	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_LOCALE,Locale support) ;\
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
 	$(call check_glibc_feature,BR2_TOOLCHAIN_HAS_WCHAR,Wide char support) ;\
 	$(call check_glibc_feature,BR2_PROGRAM_INVOCATION,Program invocation support)
@@ -192,7 +192,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_TOOLCHAIN_HAS_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_TOOLCHAIN_HAS_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_TOOLCHAIN_HAS_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_TOOLCHAIN_HAS_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index 53bfd50..56e440c 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -36,7 +36,7 @@ config BR2_TOOLCHAIN_BUILDROOT_WCHAR
 config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 	bool "Enable toolchain locale/i18n support"
 	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 837237c..d96ff90 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -17,7 +17,7 @@ config BR2_TOOLCHAIN_HAS_RPC
 config BR2_TOOLCHAIN_HAS_WCHAR
 	bool
 
-config BR2_ENABLE_LOCALE
+config BR2_TOOLCHAIN_HAS_LOCALE
 	bool
 
 config BR2_PROGRAM_INVOCATION
@@ -64,7 +64,7 @@ config BR2_NEEDS_GETTEXT
 
 config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
-	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
+	default y if (BR2_NEEDS_GETTEXT && BR2_TOOLCHAIN_HAS_LOCALE)
 
 config BR2_USE_MMU
 	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 09ca1c4..8b1774f 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -15,7 +15,7 @@ config BR2_TOOLCHAIN_CTNG_eglibc
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PROGRAM_INVOCATION
 
@@ -24,7 +24,7 @@ config BR2_TOOLCHAIN_CTNG_glibc
 	select BR2_TOOLCHAIN_HAS_LARGEFILE
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_TOOLCHAIN_HAS_WCHAR
 	select BR2_PROGRAM_INVOCATION
 
@@ -81,7 +81,7 @@ config BR2_TOOLCHAIN_CTNG_uClibc_WCHAR
 config BR2_TOOLCHAIN_CTNG_uClibc_LOCALE
 	bool "Enable toolchain locale/i18n support"
 	select BR2_TOOLCHAIN_CTNG_uClibc_WCHAR
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Enable this option if you want your toolchain to support
 	  localization and internationalization.
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index da37c19..b7b4cfe 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -264,7 +264,7 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
 # Handle the locales option
-ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_HAS_LOCALE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA)=.*:\# \1 is not set:;
 else
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e9290a8..9cb54f3 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -147,7 +147,7 @@ config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_IPV6
 	select BR2_TOOLCHAIN_HAS_RPC
 	select BR2_TOOLCHAIN_HAS_WCHAR
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	select BR2_PROGRAM_INVOCATION
 	select BR2_TOOLCHAIN_HAS_THREADS
 
@@ -207,7 +207,7 @@ config BR2_TOOLCHAIN_EXTERNAL_WCHAR
 config BR2_TOOLCHAIN_EXTERNAL_LOCALE
 	bool "Toolchain has locale support?"
 	select BR2_TOOLCHAIN_EXTERNAL_WCHAR
-	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_LOCALE
 	help
 	  Select this option if your external toolchain has locale
 	  support. If you don't know, leave the default value,
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 80b5b04..f3c0dec 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -308,7 +308,7 @@ ifeq ($(BR2_PTHREAD_DEBUG),y)
 else
 	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_ENABLE_LOCALE),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_LOCALE),y)
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
-- 
1.7.0.4
