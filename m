From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 20:30:39 +0100
Subject: [Buildroot] [PATCH 08/39] host-pkgconfig is now host-pkg-config
In-Reply-To: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6dc336b2935657f2e2d0d9eddab48e88f437dd55.1260905467.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.mk                               |    2 +-
 package/cairo/cairo.mk                           |    2 +-
 package/dbus-glib/dbus-glib.mk                   |    2 +-
 package/dbus/dbus.mk                             |    2 +-
 package/dnsmasq/dnsmasq.mk                       |    2 +-
 package/docker/docker.mk                         |    2 +-
 package/editors/vim/vim.mk                       |    2 +-
 package/enchant/enchant.mk                       |    2 +-
 package/expat/expat.mk                           |    2 +-
 package/freetype/freetype.mk                     |    2 +-
 package/gettext/gettext.mk                       |    2 +-
 package/gob2/gob2.mk                             |    2 +-
 package/gqview/gqview.mk                         |    2 +-
 package/gvfs/gvfs.mk                             |    2 +-
 package/hal/hal.mk                               |    2 +-
 package/java/classpath/classpath.mk              |    2 +-
 package/java/jamvm/jamvm.mk                      |    2 +-
 package/libdaemon/libdaemon.mk                   |    2 +-
 package/libdrm/libdrm.mk                         |    2 +-
 package/libglade/libglade.mk                     |    2 +-
 package/libglib2/libglib2.mk                     |    2 +-
 package/libgtk2/libgtk2.mk                       |    2 +-
 package/libidn/libidn.mk                         |    2 +-
 package/libpng/libpng.mk                         |    2 +-
 package/libsoup/libsoup.mk                       |    2 +-
 package/libusb/libusb.mk                         |    2 +-
 package/matchbox/matchbox.mk                     |    2 +-
 package/midori/midori.mk                         |    2 +-
 package/multimedia/gstreamer/gstreamer.mk        |    2 +-
 package/multimedia/libmms/libmms.mk              |    2 +-
 package/multimedia/libogg/libogg.mk              |    2 +-
 package/multimedia/libtheora/libtheora.mk        |    2 +-
 package/multimedia/libvorbis/libvorbis.mk        |    3 +--
 package/multimedia/swfdec/swfdec.mk              |    2 +-
 package/neon/neon.mk                             |    2 +-
 package/pango/pango.mk                           |    2 +-
 package/pcmanfm/pcmanfm.mk                       |    2 +-
 package/shared-mime-info/shared-mime-info.mk     |    2 +-
 package/sylpheed/sylpheed.mk                     |    2 +-
 package/tiff/tiff.mk                             |    2 +-
 package/usbutils/usbutils.mk                     |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk         |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk |    2 +-
 43 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 93b9e9e..1e8e576 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -51,7 +51,7 @@ else
 ATK_CONF_OPT += --without-x
 endif
 
-ATK_DEPENDENCIES = libglib2 host-pkgconfig
+ATK_DEPENDENCIES = libglib2 host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,atk))
 
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index e160bf9..2608e14 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -36,7 +36,7 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no
 
-CAIRO_DEPENDENCIES = host-pkgconfig fontconfig pixman
+CAIRO_DEPENDENCIES = host-pkg-config fontconfig pixman
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT += --enable-directfb
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index e9b1bf0..c6cebe6 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -23,7 +23,7 @@ DBUS_GLIB_CONF_OPT = --localstatedir=/var \
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-DBUS_GLIB_DEPENDENCIES = host-pkgconfig dbus host-dbus host-dbus-glib libglib2 expat
+DBUS_GLIB_DEPENDENCIES = host-pkg-config dbus host-dbus host-dbus-glib libglib2 expat
 
 $(eval $(call AUTOTARGETS,package,dbus-glib))
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index eb97e76..2780df6 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -17,7 +17,7 @@ else
 DBUS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip STRIPPROG="$(STRIPCMD)"
 endif
 
-DBUS_DEPENDENCIES = host-pkgconfig
+DBUS_DEPENDENCIES = host-pkg-config
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
 DBUS_CONF_OPT = --program-prefix="" \
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 07b3c48..6d66d09 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -34,7 +34,7 @@ DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-DNSMASQ_DEPENDENCIES += host-pkgconfig dbus
+DNSMASQ_DEPENDENCIES += host-pkg-config dbus
 endif
 
 $(eval $(call AUTOTARGETS,package,dnsmasq))
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 2dfe0f3..8525d64 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -19,7 +19,7 @@ DOCKER_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX) LD=$(TARGET_LD) \
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
-DOCKER_DEPENDENCIES = host-pkgconfig libglib2 xserver_xorg-server
+DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,docker))
 
diff --git a/package/editors/vim/vim.mk b/package/editors/vim/vim.mk
index 63f6c12..fea7f18 100644
--- a/package/editors/vim/vim.mk
+++ b/package/editors/vim/vim.mk
@@ -75,7 +75,7 @@ ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 	)
 endif
 
-vim: host-pkgconfig ncurses vim-source $(TARGET_DIR)/usr/bin/vim
+vim: host-pkg-config ncurses vim-source $(TARGET_DIR)/usr/bin/vim
 
 #############################################################
 #
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 63cd311..9c12231 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -11,6 +11,6 @@ ENCHANT_INSTALL_STAGING = YES
 ENCHANT_INSTALL_TARGET = YES
 ENCHANT_LIBTOOL_PATCH = NO
 
-ENCHANT_DEPENDENCIES = libglib2 host-pkgconfig
+ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,enchant))
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index e1d5668..9dcb0e7 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -16,7 +16,7 @@ EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 
 EXPAT_CONF_OPT = --enable-shared
 
-EXPAT_DEPENDENCIES = host-pkgconfig
+EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,expat))
 
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 7a837aa..06bf6f4 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -11,7 +11,7 @@ FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = host-pkgconfig $(if $(BR2_PACKAGE_ZLIB),zlib)
+FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index a0955c1..dbc1f2c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -114,7 +114,7 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 		autopoint envsubst gettext.sh gettextize msg* ?gettext)
 	touch -c $@
 
-gettext: host-pkgconfig $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
 gettext-unpacked: $(GETTEXT_DIR)/.unpacked
 
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 8679f4a..e640ca9 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -7,7 +7,7 @@ GOB2_VERSION = 2.0.15
 GOB2_SOURCE = gob2-$(GOB2_VERSION).tar.gz
 GOB2_SITE = http://ftp.5z.com/pub/gob/
 
-GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconfig
+GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,gob2))
 
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index d5ac861..1bd76e2 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -10,7 +10,7 @@ GQVIEW_AUTORECONF = NO
 GQVIEW_INSTALL_STAGING = NO
 GQVIEW_INSTALL_TARGET = YES
 
-GQVIEW_DEPENDENCIES = host-pkgconfig libgtk2
+GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
 
 $(eval $(call AUTOTARGETS,package,gqview))
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f8f81cd..cf28862 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -14,7 +14,7 @@ GVFS_INSTALL_TARGET = YES
 GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GVFS_AUTORECONF = NO
-GVFS_DEPENDENCIES = host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
+GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus-glib shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
diff --git a/package/hal/hal.mk b/package/hal/hal.mk
index 07ff046..fb152d6 100644
--- a/package/hal/hal.mk
+++ b/package/hal/hal.mk
@@ -87,7 +87,7 @@ $(TARGET_DIR)/$(HAL_TARGET_BINARY): $(HAL_DIR)/hald/hald
 	done
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libhal*
 
-hal: host-pkgconfig dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
+hal: host-pkg-config dbus-glib hwdata udev-volume_id $(TARGET_DIR)/$(HAL_TARGET_BINARY)
 
 hal-clean:
 	rm -f $(TARGET_DIR)/etc/dbus-1/system.d/hal.conf
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index c63837b..979cc74 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -52,7 +52,7 @@ CLASSPATH_CONF_OPT = \
 		--disable-gconf-peer --disable-examples --disable-plugin \
 		--disable-Werror
 
-CLASSPATH_DEPENDENCIES = host-pkgconfig libpng jpeg
+CLASSPATH_DEPENDENCIES = host-pkg-config libpng jpeg
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 	CLASSPATH_DEPENDENCIES+= alsa-lib
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index 65ba096..c7f7eac 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -47,7 +47,7 @@ JAMVM_CONF_OPT = \
 		--disable-debug --with-classpath-install-dir=/usr
 
 
-JAMVM_DEPENDENCIES = host-pkgconfig classpath
+JAMVM_DEPENDENCIES = host-pkg-config classpath
 
 #Include X libraries when we have an X server
 ifeq ($(BR2_PACKAGE_XORG7),y)
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index c73dd8d..7a9d5c8 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -13,6 +13,6 @@ LIBDAEMON_INSTALL_TARGET:=YES
 LIBDAEMON_CONF_ENV:=ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT:=--disable-lynx 
 
-LIBDAEMON_DEPENDENCIES:=host-pkgconfig
+LIBDAEMON_DEPENDENCIES:=host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,libdaemon))
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 5be2bc8..53284b3 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -61,7 +61,7 @@ $(TARGET_DIR)/usr/lib/libdrm.so: $(STAGING_DIR)/usr/lib/libdrm.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libdrm.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdrm.so
 
-libdrm: host-pkgconfig $(TARGET_DIR)/usr/lib/libdrm.so
+libdrm: host-pkg-config $(TARGET_DIR)/usr/lib/libdrm.so
 
 libdrm-clean:
 	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 7863061..30b7521 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -7,7 +7,7 @@ LIBGLADE_VERSION = 2.6.3
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkgconfig libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkg-config libglib2 libgtk2 atk libxml2
 
 $(eval $(call AUTOTARGETS,package,libglade))
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2d02b9b..ea96707 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -49,7 +49,7 @@ LIBGLIB2_CONF_ENV =	\
 LIBGLIB2_CONF_OPT = --enable-shared \
 		--enable-static
 
-LIBGLIB2_DEPENDENCIES = gettext libintl host-pkgconfig host-libglib2
+LIBGLIB2_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 83eab38..a61fde7 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -72,7 +72,7 @@ LIBGTK2_CONF_OPT = --enable-shared \
 		--enable-explicit-deps=no \
 		--disable-debug
 
-LIBGTK2_DEPENDENCIES = host-pkgconfig host-libgtk2 libglib2 cairo pango atk
+LIBGTK2_DEPENDENCIES = host-pkg-config host-libgtk2 libglib2 cairo pango atk
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 52f59f2..6ee1a96 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -10,7 +10,7 @@ LIBIDN_INSTALL_STAGING = YES
 LIBIDN_INSTALL_TARGET = YES
 LIBIDN_CONF_OPT = --enable-shared --disable-java --enable-csharp=no
 LIBIDN_LIBTOOL_PATCH = NO
-LIBIDN_DEPENDENCIES = host-pkgconfig gettext $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkg-config gettext $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 $(eval $(call AUTOTARGETS,package,libidn))
 
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3cb03a6..1297c89 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -9,7 +9,7 @@ LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_CONF_OPT = --without-libpng-compat
-LIBPNG_DEPENDENCIES = host-pkgconfig zlib
+LIBPNG_DEPENDENCIES = host-pkg-config zlib
 
 $(eval $(call AUTOTARGETS,package,libpng))
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 64a192c..3e9edd3 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -26,6 +26,6 @@ LIBSOUP_CONF_OPT = \
 	--without-gnome		\
 	--disable-gtk-doc --without-html-dir
 
-LIBSOUP_DEPENDENCIES = gettext libintl host-pkgconfig host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = gettext libintl host-pkg-config host-libglib2 libglib2 libxml2
 
 $(eval $(call AUTOTARGETS,package,libsoup))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index e489c9d..b93451b 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -58,7 +58,7 @@ $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/usr/lib/libusb.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
-libusb: host-pkgconfig $(TARGET_DIR)/$(LIBUSB_BINARY)
+libusb: host-pkg-config $(TARGET_DIR)/$(LIBUSB_BINARY)
 
 libusb-clean:
 	rm -f $(STAGING_DIR)/bin/libusb-config
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index c8a3777..06e94cd 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -609,7 +609,7 @@ $(TARGET_DIR)/usr/bin/$(MATCHBOX_KB_BIN): $(STAGING_DIR)/usr/bin/$(MATCHBOX_KB_B
 	cp -af $(STAGING_DIR)/usr/share/matchbox/matchbox-keyboard $(TARGET_DIR)/usr/share/matchbox/
 	cp -dpf ./package/matchbox/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/
 
-matchbox: host-pkgconfig expat $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
+matchbox: host-pkg-config expat $(MATCHBOX_WM_DEPS) $(MATCHBOX_SNOTIFY_DEPS) $(MATCHBOX_LIB_DEPS) $(TARGET_DIR)/usr/lib/libmb.so $(TARGET_DIR)/usr/bin/$(MATCHBOX_WM_BIN)
 
 matchbox-panel: matchbox $(TARGET_DIR)/usr/bin/$(MATCHBOX_PL_BIN) $(TARGET_DIR)/usr/bin/matchbox-session $(MATCHBOX_PANEL_DEPS)
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index a82c5b4..400b528 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -11,6 +11,6 @@ MIDORI_AUTORECONF = YES
 MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
-MIDORI_DEPENDENCIES = host-pkgconfig webkit libsexy xserver_xorg-server
+MIDORI_DEPENDENCIES = host-pkg-config webkit libsexy xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,midori))
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 76afa44..7f9c739 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -24,7 +24,7 @@ GSTREAMER_CONF_OPT = \
 		--disable-tests \
 		--disable-failing-tests
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkgconfig
+GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
 ifeq ($(BR2_PACKAGE_GSTREAMER_LIBXML2),y)
 GSTREAMER_DEPENDENCIES += libxml2
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
index 2cf89d5..489bf0d 100644
--- a/package/multimedia/libmms/libmms.mk
+++ b/package/multimedia/libmms/libmms.mk
@@ -12,6 +12,6 @@ LIBMMS_LIBTOOL_PATCH = NO
 LIBMMS_INSTALL_STAGING = YES
 LIBMMS_INSTALL_TARGET = YES
 
-LIBMMS_DEPENDENCIES = host-pkgconfig libglib2
+LIBMMS_DEPENDENCIES = host-pkg-config libglib2
 
 $(eval $(call AUTOTARGETS,package/multimedia,libmms))
diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index 1608c38..02b1976 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -10,6 +10,6 @@ LIBOGG_AUTORECONF = NO
 LIBOGG_INSTALL_STAGING = YES
 LIBOGG_INSTALL_TARGET = YES
 
-LIBOGG_DEPENDENCIES = host-pkgconfig
+LIBOGG_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package/multimedia,libogg))
diff --git a/package/multimedia/libtheora/libtheora.mk b/package/multimedia/libtheora/libtheora.mk
index d6a9b2a..81eb83f 100644
--- a/package/multimedia/libtheora/libtheora.mk
+++ b/package/multimedia/libtheora/libtheora.mk
@@ -14,6 +14,6 @@ LIBTHEORA_CONF_OPT = \
 		--disable-sdltest \
 		--disable-examples
 
-LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkgconfig
+LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
 $(eval $(call AUTOTARGETS,package/multimedia,libtheora))
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 3cabd5e..d8c7869 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -13,11 +13,10 @@ LIBVORBIS_INSTALL_TARGET = YES
 
 LIBVORBIS_CONF_OPT = --disable-oggtest
 
-LIBVORBIS_DEPENDENCIES = host-pkgconfig libogg
+LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
 
 $(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
 
-
 ############################################################
 #
 # Toplevel Makefile options
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
index 015d32e..d55568f 100644
--- a/package/multimedia/swfdec/swfdec.mk
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -13,7 +13,7 @@ SWFDEC_LIBTOOL_PATCH = NO
 SWFDEC_INSTALL_STAGING = YES
 SWFDEC_INSTALL_TARGET = YES
 
-SWFDEC_DEPENDENCIES = liboil alsa-lib pango cairo host-pkgconfig
+SWFDEC_DEPENDENCIES = liboil alsa-lib pango cairo host-pkg-config
 
 ifeq ($(BR2_PACKAGE_SWFDEC_GSTREAMER),y)
 SWFDEC_DEPENDENCIES += gstreamer gst-plugins-base
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 7f7f391..1f26a0c 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -9,7 +9,7 @@ NEON_INSTALL_STAGING:=YES
 NEON_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install
 NEON_CONF_OPT:=--enable-shared --without-gssapi --disable-rpath
 
-NEON_DEPENDENCIES:=host-pkgconfig
+NEON_DEPENDENCIES:=host-pkg-config
 
 ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
 NEON_CONF_OPT+=--with-libxml2=yes
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f7bf0aa..6a86013 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,7 +40,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 PANGO_CONF_OPT = --enable-shared --enable-static \
 		--enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = gettext libintl host-pkgconfig host-pango libglib2 cairo
+PANGO_DEPENDENCIES = gettext libintl host-pkg-config host-pango libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 3a300ca..370cf80 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -12,7 +12,7 @@ PCMANFM_INSTALL_TARGET = YES
 
 PCMANFM_CONF_OPT = --disable-hal
 
-PCMANFM_DEPENDENCIES = host-pkgconfig libgtk2 gamin startup-notification xserver_xorg-server
+PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
 $(eval $(call AUTOTARGETS,package,pcmanfm))
 
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 48895e0..b1833bb 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -12,7 +12,7 @@ SHARED_MIME_INFO_INSTALL_TARGET = NO
 
 SHARED_MIME_INFO_AUTORECONF = NO
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
-SHARED_MIME_INFO_DEPENDENCIES = host-pkgconfig host-libglib2 host-libxml2 libxml2 libglib2
+SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 libxml2 libglib2
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 1998523..96eca9c 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -13,7 +13,7 @@ SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 SYLPHEED_CONF_OPT = --disable-gtkspell --program-prefix=""
 
-SYLPHEED_DEPENDENCIES = host-pkgconfig
+SYLPHEED_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS,package,sylpheed))
 
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 9ec06a8..8db215e 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -15,7 +15,7 @@ TIFF_CONF_OPT = \
 	--disable-cxx \
 	--without-x \
 
-TIFF_DEPENDENCIES = host-pkgconfig zlib jpeg
+TIFF_DEPENDENCIES = host-pkg-config zlib jpeg
 
 $(eval $(call AUTOTARGETS,package,tiff))
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1d21a08..ef01403 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -6,7 +6,7 @@
 
 USBUTILS_VERSION = 0.86
 USBUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-usb/
-USBUTILS_DEPENDENCIES = host-pkgconfig
+USBUTILS_DEPENDENCIES = host-pkg-config
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 5d78573..7edab84 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL),y)
 	WPA_SUPPLICANT_DEPENDENCIES += openssl
 endif
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconfig dbus
+	WPA_SUPPLICANT_DEPENDENCIES += host-pkg-config dbus
 	WPA_SUPPLICANT_MAKE_ENV = \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 0c9dc29..38e7e80 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -59,7 +59,7 @@ $(XFONT_FONT_UTIL_DIR)/.hacked: $(XFONT_FONT_UTIL_DIR)/.installed
 	( package/x11r7/xfont_font-util/post-install.sh $(STAGING_DIR) )
 	touch $@
 
-xfont_font-util: host-pkgconfig $(XFONT_FONT_UTIL_DIR)/.hacked
+xfont_font-util: host-pkg-config $(XFONT_FONT_UTIL_DIR)/.hacked
 
 xfont_font-util-unpacked: $(XFONT_FONT_UTIL_DIR)/.unpacked
 
-- 
1.6.3.3
