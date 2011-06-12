From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 21:59:59 +0200
Subject: [Buildroot] [git commit] packages: remove --{enable,
	disable}-{shared, static} from autotools packages
Message-ID: <20110612210711.C52D08733B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0a5e5534cbf831c575b8cc3d0155f4f440e8a0b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that those values are passed at the autotools infrastructure
level, there's no need for every package to pass inconsistent values.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk                                 |    6 +-----
 package/berkeleydb/berkeleydb.mk                   |    1 -
 package/directfb/directfb.mk                       |    4 ----
 package/expat/expat.mk                             |    2 --
 package/fltk/fltk.mk                               |    2 +-
 package/fuse/libfuse.mk                            |    2 --
 package/gpsd/gpsd.mk                               |    1 -
 package/java/classpath/classpath.mk                |    3 +--
 package/java/jamvm/jamvm.mk                        |    3 +--
 package/libconfuse/libconfuse.mk                   |    2 +-
 package/libdnet/libdnet.mk                         |    2 --
 package/libelf/libelf.mk                           |    2 +-
 package/libgail/libgail.mk                         |    3 ---
 package/libglib2/libglib2.mk                       |    5 -----
 package/libgtk2/libgtk2.mk                         |    4 +---
 package/libidn/libidn.mk                           |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/librsync/librsync.mk                       |    1 -
 package/libsoup/libsoup.mk                         |    2 --
 package/lzo/lzo.mk                                 |    2 --
 package/multimedia/alsa-lib/alsa-lib.mk            |    4 +---
 package/multimedia/ffmpeg/ffmpeg.mk                |    1 -
 package/multimedia/flac/flac.mk                    |    1 -
 package/neon/neon.mk                               |    2 +-
 package/pango/pango.mk                             |    3 +--
 package/samba/samba.mk                             |    2 --
 package/sqlite/sqlite.mk                           |    4 +---
 package/tcl/tcl.mk                                 |    1 -
 package/tiff/tiff.mk                               |    2 --
 package/tslib/tslib.mk                             |    1 -
 package/x11r7/xapp_xman/xapp_xman.mk               |    4 +---
 .../xdriver_xf86-video-openchrome.mk               |    1 -
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    1 -
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 --
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    2 --
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    1 -
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    1 -
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    1 -
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    2 --
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    2 +-
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    1 -
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    1 -
 package/x11r7/xlib_libXp/xlib_libXp.mk             |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 -
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |    1 -
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |    1 -
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 --
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    1 -
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    1 -
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    2 --
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |    1 -
 package/xerces/xerces.mk                           |    3 +--
 71 files changed, 35 insertions(+), 108 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index ad95f99..9ea8a90 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -39,9 +39,7 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
-ATK_CONF_OPT =  --enable-shared \
-		--enable-static \
-		--disable-glibtest --enable-explicit-deps=no \
+ATK_CONF_OPT =  --disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -57,8 +55,6 @@ ATK_DEPENDENCIES = libglib2 host-pkg-config
 HOST_ATK_DEPENDENCIES = host-libglib2 host-pkg-config
 
 HOST_ATK_CONF_OPT = \
-		--enable-shared \
-		--disable-static \
 		--disable-glibtest
 
 $(eval $(call AUTOTARGETS,package,atk))
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 1b9d092..1bac745 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -33,7 +33,6 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--with-gnu-ld \
-		--enable-shared \
 		--disable-cxx \
 		--disable-java \
 		--disable-rpc \
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 98590cc..5af65d7 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -11,8 +11,6 @@ DIRECTFB_AUTORECONF = YES
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
-	--enable-static \
-	--enable-shared \
 	--disable-explicit-deps \
 	--program-prefix='' \
 	--enable-zlib \
@@ -123,8 +121,6 @@ endif
 
 HOST_DIRECTFB_DEPENDENCIES = host-pkg-config host-libpng
 HOST_DIRECTFB_CONF_OPT = \
-		--enable-shared \
-		--disable-static \
 		--disable-debug \
 		--disable-multi \
 		--enable-png \
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 03b1303..e7185e2 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -12,8 +12,6 @@ EXPAT_INSTALL_TARGET = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 
-EXPAT_CONF_OPT = --enable-shared
-
 EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,expat))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index b323c59..41bb678 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -14,7 +14,7 @@ FLTK_INSTALL_TARGET = YES
 FLTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 
-FLTK_CONF_OPT = --enable-shared --enable-threads --with-x
+FLTK_CONF_OPT = --enable-threads --with-x
 
 FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 5a86e84..13a5194 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -10,8 +10,6 @@ LIBFUSE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/f
 
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_CONF_OPT= --program-prefix="" \
-		--enable-shared \
-		--enable-static \
 		--disable-nls \
 		--disable-example \
 		--disable-kernel-module \
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 60f884b..b47e4d0 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -7,7 +7,6 @@
 GPSD_VERSION = 2.95
 GPSD_SITE = http://download.berlios.de/gpsd
 GPSD_INSTALL_STAGING = YES
-GPSD_CONF_OPT = --disable-static
 GPSD_TARGET_BINS = cgps gpsctl gpsdecode gpsmon gpspipe gpxlogger lcdgps
 
 # Build libgpsmm if we've got C++
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 338cf01..5832c70 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -43,8 +43,7 @@ CLASSPATH_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 CLASSPATH_CONF_OPT = \
 		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
-		--infodir=/usr/info --enable-shared \
-		--enable-static \
+		--infodir=/usr/info \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug \
 		--disable-gconf-peer --disable-examples --disable-plugin \
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index e7796bb..da999ce 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -40,8 +40,7 @@ JAMVM_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 JAMVM_CONF_OPT = \
 		--libexecdir=/usr/lib --localstatedir=/var --mandir=/usr/man \
-		--infodir=/usr/info --enable-shared \
-		--enable-static \
+		--infodir=/usr/info \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug --with-classpath-install-dir=/usr
 
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 2665c7a..03aa0bc 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -10,6 +10,6 @@ LIBCONFUSE_AUTORECONF:=NO
 LIBCONFUSE_INSTALL_STAGING:=YES
 LIBCONFUSE_INSTALL_TARGET:=YES
 
-LIBCONFUSE_CONF_OPT:=--enable-shared --disable-rpath
+LIBCONFUSE_CONF_OPT:=--disable-rpath
 
 $(eval $(call AUTOTARGETS,package,libconfuse))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 6dfecf9..649db31 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -12,8 +12,6 @@ LIBDNET_INSTALL_TARGET = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPT = \
 	--with-gnu-ld \
-	--enable-shared \
-	--enable-static \
 	--with-check=no
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 2a7d066..853b7da 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -14,7 +14,7 @@ LIBELD_CONF_ENV = libelf_cv_working_memmove=yes \
 		mr_cv_target_elf=yes \
 		libelf_64bit=yes
 
-LIBELF_CONF_OPT = --enable-shared --disable-sanity-checks \
+LIBELF_CONF_OPT = --disable-sanity-checks \
 		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
 		$(if $(BR2_LARGEFILE),--enable-elf64)
 
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 7e498f1..006e0d8 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -13,9 +13,6 @@ LIBGAIL_AUTORECONF = YES
 LIBGAIL_INSTALL_STAGING = YES
 LIBGAIL_INSTALL_TARGET = YES
 
-LIBGAIL_CONF_OPT = --enable-shared \
-		--enable-static
-
 ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 LIBGAIL_CONF_OPT += --disable-x
 endif
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 828af21..cf2665e 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -44,12 +44,7 @@ LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getgrgid_r=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
-LIBGLIB2_CONF_OPT = --enable-shared \
-		--enable-static
-
 HOST_LIBGLIB2_CONF_OPT = \
-		--enable-shared \
-		--disable-static \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 169ef97..33ed727 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -66,9 +66,7 @@ LIBGTK2_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_prog_F77=no \
 		ac_cv_path_CUPS_CONFIG=no
 
-LIBGTK2_CONF_OPT = --enable-shared \
-		--enable-static \
-		--disable-glibtest \
+LIBGTK2_CONF_OPT = --disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug
 
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index cc8c08f..7b6abbb 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -8,7 +8,7 @@ LIBIDN_VERSION = 1.19
 LIBIDN_SITE = http://ftp.gnu.org/gnu/libidn/
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
+LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define LIBIDN_REMOVE_BINARY
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index bd14faf..2b63565 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -9,7 +9,7 @@ LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_PATCH:=liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
 LIBLOCKFILE_INSTALL_STAGING = YES
-LIBLOCKFILE_CONF_OPT = --enable-shared --mandir=/usr/share/man
+LIBLOCKFILE_CONF_OPT = --mandir=/usr/share/man
 
 define LIBLOCKFILE_INSTALL_STAGING_CMDS
 	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 3db4625..31b1aa0 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -8,7 +8,6 @@ LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
 LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_INSTALL_TARGET = YES
-LIBRSYNC_CONF_OPT = --enable-shared
 
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 132ea34..6ec0882 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -17,8 +17,6 @@ LIBSOUP_CONF_ENV += soup_cv_ipv6=no
 endif
 
 LIBSOUP_CONF_OPT = \
-	--enable-shared		\
-	--enable-static		\
 	--disable-explicit-deps \
 	--disable-glibtest	\
 	--disable-ssl		\
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 5cbd458..bfa6679 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -6,8 +6,6 @@
 LZO_VERSION:=2.03
 LZO_SOURCE:=lzo-$(LZO_VERSION).tar.gz
 LZO_SITE:=http://www.oberhumer.com/opensource/lzo/download
-LZO_CONF_OPT = --enable-shared
-HOST_LZO_CONF_OPT = --enable-shared
 LZO_AUTORECONF = NO
 
 # lzo's configure was generated by an old autoconf, and the
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 317e78f..9374037 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -11,9 +11,7 @@ ALSA_LIB_INSTALL_TARGET = YES
 
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 
-ALSA_LIB_CONF_OPT = --enable-shared \
-		    --enable-static \
-		    --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
+ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
 		    --without-versioned
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 172bfc0..babb16a 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -11,7 +11,6 @@ FFMPEG_INSTALL_STAGING = YES
 
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
-	--enable-shared 	\
 	--disable-avfilter	\
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index dbaf2e9..4c278b4 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -10,7 +10,6 @@ FLAC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/flac
 FLAC_INSTALL_STAGING = YES
 
 FLAC_CONF_OPT = \
-	--enable-shared \
 	--disable-cpplibs \
 	--disable-xmms-plugin
 
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 0c237dc..87eb982 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -6,7 +6,7 @@
 NEON_VERSION:=0.28.3
 NEON_SITE:=http://www.webdav.org/neon/
 NEON_INSTALL_STAGING:=YES
-NEON_CONF_OPT:=--enable-shared --without-gssapi --disable-rpath
+NEON_CONF_OPT:=--without-gssapi --disable-rpath
 
 NEON_DEPENDENCIES:=host-pkg-config
 
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 1ccda5f..5636b73 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,8 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-PANGO_CONF_OPT = --enable-shared --enable-static \
-		--enable-explicit-deps=no --disable-debug
+PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
 PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 cairo
 
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index f61444d..a3bd63c 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -45,8 +45,6 @@ SAMBA_CONF_OPT = \
 	--with-privatedir=/etc/samba \
 	\
 	--disable-cups \
-	--disable-static \
-	--enable-shared \
 	--enable-shared-libs \
 	--disable-pie \
 	--disable-relro \
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 30e75a2..da5f53a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -16,9 +16,7 @@ ifneq ($(BR2_LARGEFILE),y)
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DSQLITE_DISABLE_LFS"
 endif
 
-SQLITE_CONF_OPT =	--enable-shared \
-			--enable-static \
-			--enable-tempstore=yes \
+SQLITE_CONF_OPT =	--enable-tempstore=yes \
 			--enable-threadsafe \
 			--enable-releasemode \
 			--disable-tcl \
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index cf46811..532cacf 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -8,7 +8,6 @@ TCL_SOURCE:=tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
 TCL_SUBDIR = unix
 TCL_CONF_OPT = \
-		--enable-shared \
 		--disable-symbols \
 		--disable-langinfo \
 		--disable-framework
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 55acf24..84e5a5f 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -9,8 +9,6 @@ TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_INSTALL_STAGING = YES
 TIFF_INSTALL_TARGET = YES
 TIFF_CONF_OPT = \
-	--enable-shared \
-	--enable-static \
 	--disable-cxx \
 	--without-x \
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index ef77dac..23c1f5b 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -11,7 +11,6 @@ TSLIB_INSTALL_TARGET = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 TSLIB_CONF_OPT = \
-	--enable-shared	\
 	--prefix=/usr	\
 	--sysconfdir=/etc
 
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index d9729d4..8ef0a1f 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -13,8 +13,6 @@ XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
 		ac_cv_file__etc_manpath_config=no
 
-XAPP_XMAN_CONF_OPT = --enable-shared \
-		--disable-static \
-		--disable-IPv6
+XAPP_XMAN_CONF_OPT = --disable-IPv6
 
 $(eval $(call AUTOTARGETS,package/x11r7,xapp_xman))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 87c5193..19d67cc 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -23,6 +23,5 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 
 
 XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
-XDRIVER_XF86_VIDEO_OPENCHROME_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-openchrome))
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index e7a92e6..f121f24 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -10,6 +10,6 @@ XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFS_AUTORECONF = NO
 XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
-XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libFS))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 99cb11b..168f899 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -10,6 +10,5 @@ XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_AUTORECONF = NO
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
-XLIB_LIBICE_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libICE))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 5aeb42d..e22c04b 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -10,6 +10,6 @@ XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_AUTORECONF = NO
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
-XLIB_LIBSM_CONF_OPT = --enable-shared --disable-static --without-libuuid
+XLIB_LIBSM_CONF_OPT = --without-libuuid
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libSM))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 7ecc368..95b1483 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -13,8 +13,6 @@ XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
-	--enable-shared \
-	--disable-static \
 	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
 	--disable-specs
 
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index ee45948..4b60fdc 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -10,6 +10,6 @@ XLIB_LIBXSCRNSAVER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSCRNSAVER_AUTORECONF = NO
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
-XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXScrnSaver))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index af4dde8..2b008e9 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,10 +10,8 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_AUTORECONF = NO
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
-XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
 
 HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-HOST_XLIB_LIBXAU_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau))
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau,host))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index ac8c5f8..d06ff6e 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -9,6 +9,6 @@ XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
-XLIB_LIBXAW_CONF_OPT = --enable-shared --disable-static --disable-docs
+XLIB_LIBXAW_CONF_OPT = --disable-docs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXaw))
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 64b98d4..e1a1852 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -10,6 +10,5 @@ XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_AUTORECONF = NO
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
-XLIB_LIBXCOMPOSITE_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXcomposite))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index abe823b..a6bbcc8 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,6 +10,5 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_AUTORECONF = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
-XLIB_LIBXCURSOR_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXcursor))
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 92f92e5..3240355 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -10,6 +10,5 @@ XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_AUTORECONF = NO
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
-XLIB_LIBXDAMAGE_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdamage))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 1a11ea6..8d03fc8 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,10 +10,8 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_AUTORECONF = NO
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
-XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
 
 HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
-HOST_XLIB_LIBXDMCP_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp))
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp,host))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 0db9626..6b60042 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -10,6 +10,6 @@ XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXEXT_AUTORECONF = NO
 XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
-XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXext))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index f2fd1f8..2d07d69 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -10,6 +10,5 @@ XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_AUTORECONF = NO
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
-XLIB_LIBXFIXES_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfixes))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index a91999c..b30a88c 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -10,7 +10,7 @@ XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
-XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static --disable-devel-docs
+XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index a0d924b..bf64a4d 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -10,6 +10,6 @@ XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONTCACHE_AUTORECONF = NO
 XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
 XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
-XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfontcache))
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index eaef1ba..942b9a6 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -10,6 +10,5 @@ XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
-XLIB_LIBXFT_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXft))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index c1da9c6..3cca1e6 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -10,6 +10,6 @@ XLIB_LIBXI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXI_AUTORECONF = NO
 XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
-XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXi))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index 4c43e79..fe7c5ed 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -10,6 +10,6 @@ XLIB_LIBXINERAMA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXINERAMA_AUTORECONF = NO
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
-XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXinerama))
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 8ad7280..c1c9503 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -10,6 +10,5 @@ XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_AUTORECONF = NO
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
-XLIB_LIBXMU_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXmu))
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index c462eee..f030082 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -10,6 +10,6 @@ XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXP_AUTORECONF = NO
 XLIB_LIBXP_INSTALL_STAGING = YES
 XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
-XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXp))
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 00180b4..459a299 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -10,6 +10,5 @@ XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_AUTORECONF = NO
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
-XLIB_LIBXPM_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXpm))
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
index c3d2b98..f980594 100644
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -10,6 +10,5 @@ XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTAPPUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
-XLIB_LIBXPRINTAPPUTIL_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXprintAppUtil))
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
index 9df0153..ed801ff 100644
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -10,6 +10,5 @@ XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
-XLIB_LIBXPRINTUTIL_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXprintUtil))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 08fbaa4..20b61d1 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -10,6 +10,6 @@ XLIB_LIBXRANDR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRANDR_AUTORECONF = NO
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
-XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXrandr))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index fe5acf3..1148a6c 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -10,6 +10,6 @@ XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_AUTORECONF = NO
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
-XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXrender))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 155cbfb..51451a0 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -10,6 +10,6 @@ XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_AUTORECONF = NO
 XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
-XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXres))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index c1cdb15..41bf26d 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -10,6 +10,6 @@ XLIB_LIBXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXT_AUTORECONF = YES
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
-XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static --disable-install-makestrs
+XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXt))
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 935d034..dd1cfd0 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -15,6 +15,4 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xproto_recordproto
 
-XLIB_LIBXTST_CONF_OPT = --enable-shared --disable-static
-
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXtst))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index df47f79..c827938 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -10,6 +10,6 @@ XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_AUTORECONF = NO
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
-XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXv))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index aaa87a7..e2a5aed 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -10,6 +10,6 @@ XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXVMC_AUTORECONF = NO
 XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
-XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXvMC))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index e2e3d15..2a8ef9f 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -10,6 +10,6 @@ XLIB_LIBXXF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86DGA_AUTORECONF = NO
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
-XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXxf86dga))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index b35c492..a73ba6b 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -10,6 +10,6 @@ XLIB_LIBXXF86VM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86VM_AUTORECONF = NO
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
-XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXxf86vm))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index e7c7837..073005c 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -10,6 +10,6 @@ XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_AUTORECONF = NO
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
-XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libdmx))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index a2ba2d7..c2ce11f 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -10,7 +10,6 @@ XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_AUTORECONF = NO
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
-XLIB_LIBFONTENC_CONF_OPT = --enable-shared --disable-static
 
 HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
 
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
index 2e6d53f..94a38fa 100644
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
@@ -10,6 +10,6 @@ XLIB_LIBOLDX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBOLDX_AUTORECONF = NO
 XLIB_LIBOLDX_INSTALL_STAGING = YES
 XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
-XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull --enable-shared --disable-static
+XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_liboldX))
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index c42f35d..5929a62 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -8,6 +8,5 @@ XLIB_LIBPCIACCESS_VERSION = 0.11.0
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-XLIB_LIBPCIACCESS_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libpciaccess))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index e71b36b..96420c3 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -10,10 +10,8 @@ XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_AUTORECONF = NO
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
-XLIB_LIBXKBFILE_CONF_OPT = --enable-shared --disable-static
 
 HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
-HOST_XLIB_LIBXKBFILE_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile))
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile,host))
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
index 31e87e7..8253ac5 100644
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
@@ -10,6 +10,5 @@ XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBUI_AUTORECONF = NO
 XLIB_LIBXKBUI_INSTALL_STAGING = YES
 XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
-XLIB_LIBXKBUI_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbui))
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index ffd874b..305fee3 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -8,8 +8,7 @@ XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources/
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
-XERCES_CONF_OPT = --enable-shared \
-		  --disable-threads \
+XERCES_CONF_OPT = --disable-threads \
 		  --with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
1.7.3.4
