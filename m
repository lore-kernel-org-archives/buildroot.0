From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 30 Jun 2012 23:14:59 +0200
Subject: [Buildroot] [PATCH v2 2/3] all packages: use new XXXTARGETS_HOST
	macros
In-Reply-To: <1341090872-12266-1-git-send-email-arnout@mind.be>
References: <1341090872-12266-1-git-send-email-arnout@mind.be>
Message-ID: <1341090899-12567-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a purely mechanical change, performed with
find package linux toolchain boot -name \*.mk | \
  xargs sed -i 's/$(eval $(call \([A-Z]*\)TARGETS,host))/$(eval $(\1TARGETS_HOST))/'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 boot/syslinux/syslinux.mk                                        |    2 +-
 package/atk/atk.mk                                               |    2 +-
 package/autoconf/autoconf.mk                                     |    2 +-
 package/automake/automake.mk                                     |    2 +-
 package/binutils/binutils.mk                                     |    2 +-
 package/bison/bison.mk                                           |    2 +-
 package/bzip2/bzip2.mk                                           |    2 +-
 package/ccache/ccache.mk                                         |    2 +-
 package/cdrkit/cdrkit.mk                                         |    2 +-
 package/cloop/cloop.mk                                           |    2 +-
 package/cmake/cmake.mk                                           |    2 +-
 package/cramfs/cramfs.mk                                         |    2 +-
 package/crosstool-ng/crosstool-ng.mk                             |    2 +-
 package/dbus-glib/dbus-glib.mk                                   |    2 +-
 package/dbus/dbus.mk                                             |    2 +-
 package/directfb/directfb.mk                                     |    2 +-
 package/e2fsprogs/e2fsprogs.mk                                   |    2 +-
 package/efl/libecore/libecore.mk                                 |    2 +-
 package/efl/libedje/libedje.mk                                   |    2 +-
 package/efl/libeet/libeet.mk                                     |    2 +-
 package/efl/libeina/libeina.mk                                   |    2 +-
 package/efl/libembryo/libembryo.mk                               |    2 +-
 package/efl/libevas/libevas.mk                                   |    2 +-
 package/expat/expat.mk                                           |    2 +-
 package/fakeroot/fakeroot.mk                                     |    2 +-
 package/file/file.mk                                             |    2 +-
 package/flex/flex.mk                                             |    2 +-
 package/fontconfig/fontconfig.mk                                 |    2 +-
 package/freetype/freetype.mk                                     |    2 +-
 package/gawk/gawk.mk                                             |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                                 |    2 +-
 package/genext2fs/genext2fs.mk                                   |    2 +-
 package/genromfs/genromfs.mk                                     |    2 +-
 package/gmp/gmp.mk                                               |    2 +-
 package/gob2/gob2.mk                                             |    2 +-
 package/gperf/gperf.mk                                           |    2 +-
 package/icu/icu.mk                                               |    2 +-
 package/intltool/intltool.mk                                     |    2 +-
 package/jpeg/jpeg.mk                                             |    2 +-
 package/jsmin/jsmin.mk                                           |    2 +-
 package/libcap/libcap.mk                                         |    2 +-
 package/libffi/libffi.mk                                         |    2 +-
 package/libftdi/libftdi.mk                                       |    2 +-
 package/libglib2/libglib2.mk                                     |    2 +-
 package/libgtk2/libgtk2.mk                                       |    2 +-
 package/libpng/libpng.mk                                         |    2 +-
 package/libtool/libtool.mk                                       |    2 +-
 package/libusb-compat/libusb-compat.mk                           |    2 +-
 package/libusb/libusb.mk                                         |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk                 |    2 +-
 package/libxml2/libxml2.mk                                       |    2 +-
 package/libxslt/libxslt.mk                                       |    2 +-
 package/localedef/localedef.mk                                   |    2 +-
 package/lpc3250loader/lpc3250loader.mk                           |    2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk                     |    2 +-
 package/lua/lua.mk                                               |    2 +-
 package/lzma/lzma.mk                                             |    2 +-
 package/lzo/lzo.mk                                               |    2 +-
 package/m4/m4.mk                                                 |    2 +-
 package/makedevs/makedevs.mk                                     |    2 +-
 package/microperl/microperl.mk                                   |    2 +-
 package/module-init-tools/module-init-tools.mk                   |    2 +-
 package/mpc/mpc.mk                                               |    2 +-
 package/mpfr/mpfr.mk                                             |    2 +-
 package/mtd/mtd.mk                                               |    2 +-
 package/nasm/nasm.mk                                             |    2 +-
 package/ncurses/ncurses.mk                                       |    2 +-
 package/omap-u-boot-utils/omap-u-boot-utils.mk                   |    2 +-
 package/openocd/openocd.mk                                       |    2 +-
 package/orc/orc.mk                                               |    2 +-
 package/pixman/pixman.mk                                         |    2 +-
 package/pkg-config/pkg-config.mk                                 |    2 +-
 package/popt/popt.mk                                             |    2 +-
 package/protobuf/protobuf.mk                                     |    2 +-
 package/python-distutilscross/python-distutilscross.mk           |    2 +-
 package/python-setuptools/python-setuptools.mk                   |    2 +-
 package/python/python.mk                                         |    2 +-
 package/ruby/ruby.mk                                             |    2 +-
 package/sam-ba/sam-ba.mk                                         |    2 +-
 package/scons/scons.mk                                           |    2 +-
 package/shared-mime-info/shared-mime-info.mk                     |    2 +-
 package/squashfs/squashfs.mk                                     |    2 +-
 package/squashfs3/squashfs3.mk                                   |    2 +-
 package/sstrip/sstrip.mk                                         |    2 +-
 package/tar/tar.mk                                               |    2 +-
 package/tcl/tcl.mk                                               |    2 +-
 package/uboot-tools/uboot-tools.mk                               |    2 +-
 package/util-linux/util-linux.mk                                 |    2 +-
 package/vala/vala.mk                                             |    2 +-
 package/x11r7/libxcb/libxcb.mk                                   |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk                     |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk                     |    2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk                   |    2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk               |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk                 |    2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk                       |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk                             |    2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk                 |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk                 |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk                         |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk                         |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk                 |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk                     |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk                   |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                 |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk                 |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk                 |    2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk                         |    2 +-
 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk             |    2 +-
 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk     |    2 +-
 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk             |    2 +-
 package/x11r7/xproto_inputproto/xproto_inputproto.mk             |    2 +-
 package/x11r7/xproto_kbproto/xproto_kbproto.mk                   |    2 +-
 package/x11r7/xproto_renderproto/xproto_renderproto.mk           |    2 +-
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk           |    2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk               |    2 +-
 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk                     |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk               |    2 +-
 package/x11r7/xutil_util-macros/xutil_util-macros.mk             |    2 +-
 package/xz/xz.mk                                                 |    2 +-
 package/zlib/zlib.mk                                             |    2 +-
 123 files changed, 123 insertions(+), 123 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 3e89bdf..b6fb397 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -40,4 +40,4 @@ define HOST_SYSLINUX_CLEAN_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 4ac96ff..4f60c44 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -55,4 +55,4 @@ HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 4e7f3fc..3c35093 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -18,7 +18,7 @@ HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 522e22c..147e826 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -24,7 +24,7 @@ HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 3293e18..3428827 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -62,4 +62,4 @@ endef
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 51325bd..966ece2 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -17,4 +17,4 @@ endef
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 59c993e..8b908fe 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -102,4 +102,4 @@ define HOST_BZIP2_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index d7106ee..7a32229 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -43,7 +43,7 @@ HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_PATCH_CONFIGURATION
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index a060b03..9618292 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -24,4 +24,4 @@ HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
 
 $(eval $(call CMAKETARGETS))
-$(eval $(call CMAKETARGETS,host))
+$(eval $(CMAKETARGETS_HOST))
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 52567dd..c8459e0 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -15,4 +15,4 @@ define HOST_CLOOP_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index af6c53c..24173f9 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -18,4 +18,4 @@ define HOST_CMAKE_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 57dbe40..47eb4f4 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -29,4 +29,4 @@ define HOST_CRAMFS_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 09c57ec..2e58721 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -5,4 +5,4 @@ CROSSTOOL_NG_INSTALL_TARGET    = NO
 CROSSTOOL_NG_MAKE              = $(MAKE1)
 HOST_CROSSTOOL_NG_DEPENDENCIES = $(if $(BR2_CCACHE),host-ccache) host-gawk host-automake host-gperf
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 397996e..5442219 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -33,7 +33,7 @@ HOST_DBUS_GLIB_CONF_OPT = \
 		--enable-asserts=yes
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # dbus-glib for the host
 DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7e72e3d..370ea7a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -88,4 +88,4 @@ HOST_DBUS_GEN_INTROSPECT = \
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 071cdf4..bb3f74f 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -141,7 +141,7 @@ endef
 DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # directfb-csource for the host
 DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 4c0474e..8a325be 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -104,4 +104,4 @@ E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index d5d2896..ca35e12 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -99,4 +99,4 @@ LIBECORE_CONF_OPT += --disable-ecore-evas
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 5252d6e..1150ebe 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -21,4 +21,4 @@ endif
 HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index f9af219..585d714 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -12,4 +12,4 @@ LIBEET_INSTALL_STAGING = YES
 LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index b457e3f..d419e68 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -12,4 +12,4 @@ LIBEINA_INSTALL_STAGING = YES
 LIBEINA_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 0054ff4..23d19b9 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -12,4 +12,4 @@ LIBEMBRYO_INSTALL_STAGING = YES
 LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index e716cea..16cdadd 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -213,4 +213,4 @@ LIBEVAS_CONF_OPT += --disable-doc
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index ea008db..48ff90c 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -12,4 +12,4 @@ EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 64203b8..9e34478 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -7,4 +7,4 @@ FAKEROOT_VERSION = 1.18.2
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
 FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20111201T093630Z/pool/main/f/fakeroot/
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/file/file.mk b/package/file/file.mk
index c9846e4..83ae045 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -16,4 +16,4 @@ define FILE_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 041aba8..2941747 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -44,4 +44,4 @@ FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index 329f819..43ac980 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -26,4 +26,4 @@ HOST_FONTCONFIG_CONF_OPT = \
 		--disable-static
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ded10d2..c4da236 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -34,4 +34,4 @@ FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 8f374cb..c4057eb 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -31,4 +31,4 @@ define GAWK_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 8dc1c47..eb6370f 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -54,4 +54,4 @@ HOST_GDK_PIXBUF_CONF_OPT = \
 
 HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index 1863cf1..55756cf 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -9,4 +9,4 @@ GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index d6f4875..07e715a 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -28,4 +28,4 @@ define HOST_GENROMFS_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
\ No newline at end of file
+$(eval $(GENTARGETS_HOST))
\ No newline at end of file
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 7a17ebc..6eefc8b 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -15,4 +15,4 @@ GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index c557288..6d5ed4a 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -10,7 +10,7 @@ GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # gob2 for the host
 GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index faea978..b5c2641 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -8,4 +8,4 @@ GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index a2c24ca..3427213 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -26,4 +26,4 @@ endef
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 6d13cc1..687a33b 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -13,5 +13,5 @@ HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index a652381..2987d06 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -15,4 +15,4 @@ endef
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 491bb3e..62d3f26 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -22,4 +22,4 @@ define HOST_JSMIN_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 4683121..31074a6 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -39,4 +39,4 @@ define HOST_LIBCAP_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index adcd6f8..d39b2e4 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -32,5 +32,5 @@ endef
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index d84fc32..c737523 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -21,4 +21,4 @@ LIBFDTI_CONF_OPT += --disable-libftdipp
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..275efad 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -89,6 +89,6 @@ LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index b54743f..c6fb049 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -152,4 +152,4 @@ define HOST_LIBGTK2_INSTALL_CMDS
 endef
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 56d0377..346d2ee 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -31,4 +31,4 @@ LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 6c69394..055871e 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -11,7 +11,7 @@ LIBTOOL_INSTALL_STAGING = YES
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index d44eb27..512bc11 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -18,4 +18,4 @@ endef
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 9abfcfc..4c267a1 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -10,4 +10,4 @@ LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 0d02981..10f39ec 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -37,5 +37,5 @@ define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index bbdd5de..7838596 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -35,7 +35,7 @@ LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # libxml2 for the host
 LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 15b6e6a..3e3e289 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -41,4 +41,4 @@ LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1a044e3..7ddafe7 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -17,4 +17,4 @@ define HOST_LOCALEDEF_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/localedef $(HOST_DIR)/usr/bin/localedef
 endef
 
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index ed6485c..2c4e0b7 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -6,4 +6,4 @@ define HOST_LPC3250LOADER_INSTALL_CMDS
 		$(HOST_DIR)/usr/bin/LPC3250loader.py
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 5173028..5fa62d2 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -12,4 +12,4 @@ HOST_LTTNG_BABELTRACE_AUTORECONF = YES
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index aa0b4bf..aa17183 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -161,4 +161,4 @@ define HOST_LUA_CLEAN_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index e195049..2894c8c 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -10,6 +10,6 @@ LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 LZMA=$(HOST_DIR)/usr/bin/lzma
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 84f31f0..a236f3b 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -8,4 +8,4 @@ LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 173bba8..8794935 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -16,4 +16,4 @@ endif
 HOST_M4_CONF_OPT = --disable-static
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index 31dc95d..69c5f7c 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -32,4 +32,4 @@ define HOST_MAKEDEVS_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 61187ea..23efcb1 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -151,4 +151,4 @@ define MICROPERL_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 96c8378..e23cac0 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -21,5 +21,5 @@ HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 HOST_MODULE_INIT_TOOLS_CONF_OPT = --disable-static-utils
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index e5ee489..d9b1db7 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -12,4 +12,4 @@ MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index c3df710..70bdccc 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -12,4 +12,4 @@ MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index d7947b1..93fd426 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -86,4 +86,4 @@ define MTD_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b819df0..6e59b0c 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -15,4 +15,4 @@ NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
 NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index afeb41b..7154ec3 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -141,4 +141,4 @@ HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/omap-u-boot-utils/omap-u-boot-utils.mk b/package/omap-u-boot-utils/omap-u-boot-utils.mk
index e2da9a1..7a90456 100644
--- a/package/omap-u-boot-utils/omap-u-boot-utils.mk
+++ b/package/omap-u-boot-utils/omap-u-boot-utils.mk
@@ -18,4 +18,4 @@ define HOST_OMAP_U_BOOT_UTILS_INSTALL_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index a12ba6c..fc53f3f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -40,4 +40,4 @@ HOST_OPENOCD_CONF_OPT = 	\
 	--enable-vsllink
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 6602e36..9a4e609 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -24,4 +24,4 @@ ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 3e056d4..8a28bbd 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -17,4 +17,4 @@ PIXMAN_CONF_OPT += --disable-arm-iwmmxt
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 137800c..da7d42a 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -20,6 +20,6 @@ HOST_PKG_CONFIG_AUTORECONF = YES
 HOST_PKG_CONFIG_DEPENDENCIES =
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index fd25caa..bafec33 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -16,4 +16,4 @@ POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index f18261e..e304ece 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -18,4 +18,4 @@ PROTOBUF_DEPENDENCIES += zlib
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
index 9003189..ca23c32 100644
--- a/package/python-distutilscross/python-distutilscross.mk
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -18,4 +18,4 @@ define HOST_PYTHON_DISTUTILSCROSS_INSTALL_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 70ebb85..0ed6779 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -28,5 +28,5 @@ define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/python/python.mk b/package/python/python.mk
index 28e215c..2498e5c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -168,4 +168,4 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 PYTHON_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d89c25b..6b3bec6 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -32,4 +32,4 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 endif
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index d5ab9f6..3293c98 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -19,4 +19,4 @@ define HOST_SAM_BA_INSTALL_CMDS
 	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 73c68ed..f738f6d 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -10,4 +10,4 @@ define HOST_SCONS_INSTALL_CMDS
 	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index dc53fce..7523395 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -26,7 +26,7 @@ define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # shared-mime-info for the host
 SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 4d0ad51..7a85745 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -73,4 +73,4 @@ define HOST_SQUASHFS_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 81cdf79..c359f0d 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -25,5 +25,5 @@ define HOST_SQUASHFS3_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
 
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index a1447d8..c934f95 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -42,4 +42,4 @@ define HOST_SSTRIP_UNINSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 9e856b5..620d826 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -25,4 +25,4 @@ define HOST_TAR_EXTRACT_CMDS
 	mv $(@D)/tar-$(TAR_VERSION)/* $(@D)
 	rmdir $(@D)/tar-$(TAR_VERSION)
 endef
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 8ed81ab..1e28f46 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -32,4 +32,4 @@ endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index d757ade..9d24593 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -52,4 +52,4 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a3ac9..953144e 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -82,7 +82,7 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-schedutils --disable-wall --disable-partx
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
 # one, so it disappears
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a3ad037..1b42c3d 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -14,4 +14,4 @@ VALA_DEPENDENCIES = host-flex libglib2 \
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 3e15951..cfdad0c 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -20,5 +20,5 @@ LIBXCB_CONF_OPT = --disable-build-docs
 HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index 25b4433..9f7d6fb 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -10,5 +10,5 @@ PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 00ce339..c5757f7 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -10,4 +10,4 @@ XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 8047b21..79eeb6b 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -10,4 +10,4 @@ XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 02e7824..5aca1b8 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -10,4 +10,4 @@ XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index f191ecb..d3245fb 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -10,4 +10,4 @@ XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index f92588c..fee633d 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -10,4 +10,4 @@ XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 3479a23..2e8bc4c 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -12,5 +12,5 @@ XCB_PROTO_INSTALL_STAGING = YES
 XCB_PROTO_DEPENDENCIES = host-python
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
 
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index ead8ace..d05d8da 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -10,4 +10,4 @@ XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index c5243ad..8971fea 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -12,4 +12,4 @@ XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 4d12a84..78c3879 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -38,4 +38,4 @@ endef
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8d67501..e84fd44 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -11,4 +11,4 @@ XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index d12520a..ffb7ccc 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -11,4 +11,4 @@ XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 5308206..5c7bdb9 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -11,4 +11,4 @@ XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2db9b36..468f47d 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 2b47e4e..a5cd262 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -15,4 +15,4 @@ XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 7a0a45e..31678f9 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -12,4 +12,4 @@ XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index eef592a..cd947c6 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -11,4 +11,4 @@ XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index b964593..1a2a130 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -11,4 +11,4 @@ XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index a153f4a..8ec0ae8 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -10,4 +10,4 @@ XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 3ead64f..0064d95 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -11,4 +11,4 @@ XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 5e5ff5e..79772db 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -11,4 +11,4 @@ XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 33c1a80..bce827b 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -11,4 +11,4 @@ XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 063a7f3..b1a2006 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -11,4 +11,4 @@ XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index b2478f2..21d2238 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -11,4 +11,4 @@ XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 49d2fbc..dd9c84b 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -11,4 +11,4 @@ XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index f8e498d..e3a36b5 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -11,4 +11,4 @@ XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 881ab70..e70588b 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -11,4 +11,4 @@ XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 87b607e..811c8ee 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -11,4 +11,4 @@ XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 8f81d05..f3c3737 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -11,4 +11,4 @@ XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index a69d21f..83c2b48 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -11,4 +11,4 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index c06cf01..dff57e4 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -11,4 +11,4 @@ XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 8f2e0f1..52ffad6 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -10,4 +10,4 @@ XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 $(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
+$(eval $(AUTOTARGETS_HOST))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 8f7a18e..127948e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -75,4 +75,4 @@ define HOST_ZLIB_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-$(eval $(call GENTARGETS,host))
+$(eval $(GENTARGETS_HOST))
-- 
tg: (9953500..) t/gentargets_host_mk (depends on: t/gentargets_host)
