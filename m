From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 22 Dec 2014 09:12:05 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1419235925-20708-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/avahi/avahi.mk                             |   28 ++--
 package/beecrypt/beecrypt.mk                       |    8 +-
 package/bind/bind.mk                               |    6 +-
 package/dbus-glib/dbus-glib.mk                     |   24 ++--
 package/dbus/dbus.mk                               |   20 +--
 package/directfb/directfb.mk                       |    8 +-
 package/fontconfig/fontconfig.mk                   |    2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |    6 +-
 .../gstreamer/gst-plugins-bad/gst-plugins-bad.mk   |    2 +-
 .../gstreamer/gst-plugins-base/gst-plugins-base.mk |    8 +-
 .../gstreamer/gst-plugins-good/gst-plugins-good.mk |   20 +--
 .../gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk |    2 +-
 package/gstreamer/gstreamer/gstreamer.mk           |   12 +-
 package/gtk2-engines/gtk2-engines.mk               |  138 ++++++++++----------
 package/libfuse/libfuse.mk                         |    6 +-
 package/libglib2/libglib2.mk                       |   72 +++++-----
 package/libgtk2/libgtk2.mk                         |   12 +-
 package/libmad/libmad.mk                           |   12 +-
 package/libtheora/libtheora.mk                     |   10 +-
 package/network-manager/network-manager.mk         |   18 +--
 package/nfs-utils/nfs-utils.mk                     |   14 +-
 package/prboom/prboom.mk                           |   12 +-
 package/sdl_net/sdl_net.mk                         |    4 +-
 package/sudo/sudo.mk                               |   14 +-
 package/tcl/tcl.mk                                 |   14 +-
 package/uclibc/uclibc.mk                           |    8 +-
 package/vtun/vtun.mk                               |    6 +-
 27 files changed, 243 insertions(+), 243 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index e8944d6..cd25748 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -68,20 +68,20 @@ AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		DATADIRNAME=share
 
 AVAHI_CONF_OPTS = \
-		--disable-qt3 \
-		--disable-qt4 \
-		--disable-gdbm \
-		--disable-pygtk \
-		--disable-mono \
-		--disable-monodoc \
-		--disable-stack-protector \
-		--with-distro=none \
-		--disable-manpages \
-		$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
-		--with-avahi-user=avahi \
-		--with-avahi-group=avahi \
-		--with-autoipd-user=avahi \
-		--with-autoipd-group=avahi
+	--disable-qt3 \
+	--disable-qt4 \
+	--disable-gdbm \
+	--disable-pygtk \
+	--disable-mono \
+	--disable-monodoc \
+	--disable-stack-protector \
+	--with-distro=none \
+	--disable-manpages \
+	$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
+	--with-avahi-user=avahi \
+	--with-avahi-group=avahi \
+	--with-autoipd-user=avahi \
+	--with-autoipd-group=avahi
 
 AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool \
 	host-pkgconf host-gettext
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 7d2ee08..cd0b4ac 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -12,10 +12,10 @@ BEECRYPT_LICENSE = LGPLv2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
 
 BEECRYPT_CONF_OPTS = \
-		--disable-expert-mode \
-		--without-java \
-		--without-python \
-		--disable-openmp
+	--disable-expert-mode \
+	--without-java \
+	--without-python \
+	--disable-openmp
 
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 6c17b13..cb9a7a2 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -21,9 +21,9 @@ BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
-		--with-randomdev=/dev/urandom \
-		--enable-epoll --with-libtool \
-		--with-gssapi=no --enable-rrl
+	--with-randomdev=/dev/urandom \
+	--enable-epoll --with-libtool \
+	--with-gssapi=no --enable-rrl
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 	BIND_CONF_OPTS += --enable-linux-caps
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 369bac9..a251b86 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -15,24 +15,24 @@ DBUS_GLIB_CONF_ENV = ac_cv_have_abstract_sockets=yes \
 		have_abstract_sockets=yes
 
 DBUS_GLIB_CONF_OPTS = \
-		--disable-tests \
-		--disable-xml-docs \
-		--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
-		--with-dbus-binding-tool=$(DBUS_GLIB_HOST_BINARY) \
-		--disable-bash-completion \
-		--disable-doxygen-docs \
-		--enable-asserts=yes
+	--disable-tests \
+	--disable-xml-docs \
+	--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
+	--with-dbus-binding-tool=$(DBUS_GLIB_HOST_BINARY) \
+	--disable-bash-completion \
+	--disable-doxygen-docs \
+	--enable-asserts=yes
 
 DBUS_GLIB_DEPENDENCIES = host-pkgconf dbus host-dbus host-dbus-glib libglib2 expat
 
 HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-expat host-libglib2
 
 HOST_DBUS_GLIB_CONF_OPTS = \
-		--disable-tests \
-		--disable-xml-docs \
-		--disable-bash-completion \
-		--disable-doxygen-docs \
-		--enable-asserts=yes
+	--disable-tests \
+	--disable-xml-docs \
+	--disable-bash-completion \
+	--disable-doxygen-docs \
+	--enable-asserts=yes
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8d02b42..77ea502 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -87,16 +87,16 @@ endef
 
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
 HOST_DBUS_CONF_OPTS = \
-		--with-dbus-user=dbus \
-		--disable-tests \
-		--disable-asserts \
-		--enable-abstract-sockets \
-		--disable-selinux \
-		--disable-xml-docs \
-		--disable-doxygen-docs \
-		--enable-dnotify \
-		--without-x \
-		--with-xml=expat
+	--with-dbus-user=dbus \
+	--disable-tests \
+	--disable-asserts \
+	--enable-abstract-sockets \
+	--disable-selinux \
+	--disable-xml-docs \
+	--disable-doxygen-docs \
+	--enable-dnotify \
+	--without-x \
+	--with-xml=expat
 
 # dbus for the host
 DBUS_HOST_INTROSPECT = $(HOST_DBUS_DIR)/introspect.xml
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4e4a3c0..e3dc506 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -144,10 +144,10 @@ endif
 
 HOST_DIRECTFB_DEPENDENCIES = host-pkgconf host-libpng
 HOST_DIRECTFB_CONF_OPTS = \
-		--disable-multi \
-		--enable-png \
-		--with-gfxdrivers=none \
-		--with-inputdrivers=none
+	--disable-multi \
+	--enable-png \
+	--with-gfxdrivers=none \
+	--with-inputdrivers=none
 
 HOST_DIRECTFB_BUILD_CMDS = \
 	$(MAKE) -C $(@D)/tools directfb-csource
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index f13ad49..863fa26 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -16,7 +16,7 @@ FONTCONFIG_CONF_OPTS = --with-arch=$(GNU_TARGET_NAME) \
 		--disable-docs
 
 HOST_FONTCONFIG_CONF_OPTS = \
-		--disable-static
+	--disable-static
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 0fc7877..b1d8f8b 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -21,9 +21,9 @@ GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1 gst-l
 endif
 
 GST_FFMPEG_CONF_EXTRA_OPTS = \
-		--cross-prefix=$(TARGET_CROSS) \
-		--target-os=linux \
-		--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
+	--cross-prefix=$(TARGET_CROSS) \
+	--target-os=linux \
+	--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
index 2413995..ea0bd60 100644
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -9,7 +9,7 @@ GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
 GST_PLUGINS_BAD_CONF_OPTS = \
-		--disable-examples
+	--disable-examples
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
 
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
index 7e461df..08733d1 100644
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -17,10 +17,10 @@ GST_PLUGINS_BASE_CONF_ENV =
 		ac_cv_header_stdint_t="stdint.h"
 
 GST_PLUGINS_BASE_CONF_OPTS = \
-		--disable-examples \
-		--disable-oggtest \
-		--disable-vorbistest \
-		--disable-freetypetest
+	--disable-examples \
+	--disable-oggtest \
+	--disable-vorbistest \
+	--disable-freetypetest
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
index 2c2706a..fee83a1 100644
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
@@ -9,16 +9,16 @@ GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
 GST_PLUGINS_GOOD_CONF_OPTS = \
-		--disable-examples \
-		--disable-directsound \
-		--disable-sunaudio \
-		--disable-osx_audio \
-		--disable-osx_video \
-		--disable-aalib \
-		--disable-aalibtest \
-		--disable-esd \
-		--disable-esdtest \
-		--disable-shout2
+	--disable-examples \
+	--disable-directsound \
+	--disable-sunaudio \
+	--disable-osx_audio \
+	--disable-osx_video \
+	--disable-aalib \
+	--disable-aalibtest \
+	--disable-esd \
+	--disable-esdtest \
+	--disable-shout2
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
index f8ec980..e8f2362 100644
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -9,7 +9,7 @@ GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 
 GST_PLUGINS_UGLY_CONF_OPTS = \
-		--disable-examples
+	--disable-examples
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
 
diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
index 8d05c3b..62c4935 100644
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -20,12 +20,12 @@ GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
 endif
 
 GSTREAMER_CONF_OPTS = \
-		--disable-examples \
-		--disable-tests \
-		--disable-failing-tests \
-		--disable-loadsave \
-		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
-		$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
+	--disable-examples \
+	--disable-tests \
+	--disable-failing-tests \
+	--disable-loadsave \
+	$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
+	$(if $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index e89b978..9b285f6 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -13,76 +13,76 @@ GTK2_ENGINES_LICENSE = LGPLv2.1+
 GTK2_ENGINES_LICENSE_FILES = COPYING
 
 GTK2_ENGINES_CONF_ENV = \
-		ac_cv_func_posix_getpwuid_r=yes \
-		glib_cv_stack_grows=no \
-		glib_cv_uscore=no \
-		ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		gl_cv_c_restrict=no \
-		ac_cv_path_CUPS_CONFIG=no
+	ac_cv_func_posix_getpwuid_r=yes \
+	glib_cv_stack_grows=no \
+	glib_cv_uscore=no \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no \
+	ac_cv_path_CUPS_CONFIG=no
 
 GTK2_ENGINES_CONF_OPTS = \
-		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
-		--disable-glibtest \
-		--enable-explicit-deps=no \
-		--enable-clearlooks \
-		--disable-crux \
-		--disable-hc \
-		--disable-industrial \
-		--disable-mist \
-		--disable-redmond \
-		--disable-smooth \
-		--disable-glide \
-		--disable-thinice \
-		--enable-animation \
-		--disable-development \
-		--disable-paranoia \
-		--disable-deprecated
+	--with-x \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--disable-glibtest \
+	--enable-explicit-deps=no \
+	--enable-clearlooks \
+	--disable-crux \
+	--disable-hc \
+	--disable-industrial \
+	--disable-mist \
+	--disable-redmond \
+	--disable-smooth \
+	--disable-glide \
+	--disable-thinice \
+	--enable-animation \
+	--disable-development \
+	--disable-paranoia \
+	--disable-deprecated
 
 $(eval $(autotools-package))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index aa06d34..000d2b4 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -12,9 +12,9 @@ LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBFUSE_CONF_OPTS = \
-		--disable-example \
-		--enable-lib \
-		--enable-util
+	--disable-example \
+	--enable-lib \
+	--enable-util
 
 define LIBFUSE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 581c51c..fa909cd 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -15,38 +15,38 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
-		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-		glib_cv_uscore=no ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
-		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
-		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
-		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
-		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
+	ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
+	glib_cv_uscore=no ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no gl_cv_c_restrict=no \
+	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
+	ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
+	ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
+	ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
+	ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
+	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
 ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
@@ -61,10 +61,10 @@ LIBGLIB2_CONF_ENV += ac_cv_header_sys_inotify_h=no
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
-		--disable-dtrace \
-		--disable-systemtap \
-		--disable-gcov \
-		--disable-modular-tests
+	--disable-dtrace \
+	--disable-systemtap \
+	--disable-gcov \
+	--disable-modular-tests
 
 LIBGLIB2_CONF_OPTS += --disable-modular-tests
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 6a78a98..89faca3 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -157,12 +157,12 @@ endif
 
 HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
 HOST_LIBGTK2_CONF_OPTS = \
-		--disable-static \
-		--disable-glibtest \
-		--without-libtiff \
-		--without-libjpeg \
-		--with-gdktarget=none \
-		--disable-cups
+	--disable-static \
+	--disable-glibtest \
+	--without-libtiff \
+	--without-libjpeg \
+	--with-gdktarget=none \
+	--disable-cups
 
 define HOST_LIBGTK2_BUILD_CMDS
 	$(HOST_MAKE_ENV) make -C $(@D)/gtk gtk-update-icon-cache
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 05e2d86..9c152f9 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -31,11 +31,11 @@ LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
 LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
 LIBMAD_CONF_OPTS = \
-		--disable-debugging \
-		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
-		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
-		--$(if $(BR2_PACKAGE_LIBMAD_SSO),enable,disable)-sso \
-		--$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso \
-		--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),enable,disable)-strict-iso
+	--disable-debugging \
+	$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
+	$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
+	--$(if $(BR2_PACKAGE_LIBMAD_SSO),enable,disable)-sso \
+	--$(if $(BR2_PACKAGE_LIBMAD_ASO),enable,disable)-aso \
+	--$(if $(BR2_PACKAGE_LIBMAD_STRICT_ISO),enable,disable)-strict-iso
 
 $(eval $(autotools-package))
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 7eb8206..480af75 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -12,11 +12,11 @@ LIBTHEORA_LICENSE = BSD-3c
 LIBTHEORA_LICENSE_FILES = COPYING LICENSE
 
 LIBTHEORA_CONF_OPTS = \
-		--disable-oggtest \
-		--disable-vorbistest \
-		--disable-sdltest \
-		--disable-examples \
-		--disable-spec
+	--disable-oggtest \
+	--disable-vorbistest \
+	--disable-sdltest \
+	--disable-examples \
+	--disable-spec
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkgconf
 
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3f6512c..5540bc4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -24,15 +24,15 @@ NETWORK_MANAGER_CONF_ENV = \
 
 
 NETWORK_MANAGER_CONF_OPTS = \
-		--mandir=$(STAGING_DIR)/usr/man/ \
-		--disable-tests \
-		--disable-qt \
-		--disable-more-warnings \
-		--without-docs \
-		--with-crypto=gnutls \
-		--with-iptables=/usr/sbin/iptables \
-		--disable-ifupdown \
-		--disable-ifnet
+	--mandir=$(STAGING_DIR)/usr/man/ \
+	--disable-tests \
+	--disable-qt \
+	--disable-more-warnings \
+	--without-docs \
+	--with-crypto=gnutls \
+	--with-iptables=/usr/sbin/iptables \
+	--disable-ifupdown \
+	--disable-ifnet
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 	NETWORK_MANAGER_DEPENDENCIES += newt
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 91a1baf..cec21e8 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -15,13 +15,13 @@ NFS_UTILS_DEPENDENCIES = host-pkgconf
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
 NFS_UTILS_CONF_OPTS = \
-		--disable-nfsv4 \
-		--disable-nfsv41 \
-		--disable-gss \
-		--disable-uuid \
-		--disable-ipv6 \
-		--without-tcp-wrappers \
-		--with-rpcgen=internal
+	--disable-nfsv4 \
+	--disable-nfsv41 \
+	--disable-gss \
+	--disable-uuid \
+	--disable-ipv6 \
+	--without-tcp-wrappers \
+	--with-rpcgen=internal
 
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 7f9d6a0..5612cc6 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -22,12 +22,12 @@ PRBOOM_CONF_ENV += LIBS="$(shell $(STAGING_DIR)/usr/bin/sdl-config --static-libs
 endif
 
 PRBOOM_CONF_OPTS = \
-		--oldincludedir=$(STAGING_DIR)/usr/include \
-		--with-sdl-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-		--disable-cpu-opt \
-		--disable-sdltest \
-		--disable-gl
+	--oldincludedir=$(STAGING_DIR)/usr/include \
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
+	--disable-cpu-opt \
+	--disable-sdltest \
+	--disable-gl
 
 # endianness detection isn't used when cross compiling
 define PRBOOM_BIG_ENDIAN_FIXUP
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 0800a9e..4534dee 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -11,8 +11,8 @@ SDL_NET_LICENSE = zlib
 SDL_NET_LICENSE_FILES = COPYING
 
 SDL_NET_CONF_OPTS = \
-		--with-sdl-prefix=$(STAGING_DIR)/usr \
-		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
+	--with-sdl-prefix=$(STAGING_DIR)/usr \
+	--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
 SDL_NET_INSTALL_STAGING = YES
 
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index df3910e..dafd717 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -12,13 +12,13 @@ SUDO_LICENSE_FILES = doc/LICENSE
 # Run autoreconf to regenerate ltmain.sh.
 SUDO_AUTORECONF = YES
 SUDO_CONF_OPTS = \
-		--without-lecture \
-		--without-sendmail \
-		--without-umask \
-		--with-logging=syslog \
-		--without-interfaces \
-		--without-pam \
-		--with-env-editor
+	--without-lecture \
+	--without-sendmail \
+	--without-umask \
+	--with-logging=syslog \
+	--without-interfaces \
+	--without-pam \
+	--with-env-editor
 
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index ef0983b..1ebba1e 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -19,15 +19,15 @@ TCL_AUTORECONF = YES
 # configured).  Don't need to worry about conditionally including
 # it in the configure options
 TCL_CONF_OPTS = \
-		--disable-symbols \
-		--disable-langinfo \
-		--disable-framework \
-		--with-system-sqlite
+	--disable-symbols \
+	--disable-langinfo \
+	--disable-framework \
+	--with-system-sqlite
 
 HOST_TCL_CONF_OPTS = \
-		--disable-symbols \
-		--disable-langinfo \
-		--disable-framework
+	--disable-symbols \
+	--disable-langinfo \
+	--disable-framework
 
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 2bb699f..d3b11f6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -40,10 +40,10 @@ endif
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 
 UCLIBC_KCONFIG_OPTS = \
-		$(UCLIBC_MAKE_FLAGS) \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR)/ \
+	$(UCLIBC_MAKE_FLAGS) \
+	PREFIX=$(STAGING_DIR) \
+	DEVEL_PREFIX=/usr/ \
+	RUNTIME_PREFIX=$(STAGING_DIR)/ \
 
 UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
 
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 8f6b06b..2b64ab9 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -10,8 +10,8 @@ VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
 
 VTUN_CONF_OPTS = \
-		--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
-		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
-		--with-lzo-lib=$(STAGING_DIR)/usr/lib
+	--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
+	--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
+	--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
 $(eval $(autotools-package))
-- 
1.7.9.5
