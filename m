From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 22:02:55 +0100
Subject: [Buildroot] [git commit] packages: switch to host-pkgconf
Message-ID: <20121029211341.6F0759998B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=019a581f89056e34fa7583a16de48c37c2c39ea2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk                                 |    2 +-
 package/avahi/avahi.mk                             |    2 +-
 package/cairo/cairo.mk                             |    2 +-
 package/ccid/ccid.mk                               |    2 +-
 package/collectd/collectd.mk                       |    2 +-
 package/conntrack-tools/conntrack-tools.mk         |    2 +-
 package/dbus-glib/dbus-glib.mk                     |    2 +-
 package/dbus/dbus.mk                               |    4 ++--
 package/directfb/directfb.mk                       |    2 +-
 package/dnsmasq/dnsmasq.mk                         |    6 +++---
 package/docker/docker.mk                           |    2 +-
 package/e2fsprogs/e2fsprogs.mk                     |    4 ++--
 package/efl/libecore/libecore.mk                   |    4 ++--
 package/efl/libedbus/libedbus.mk                   |    2 +-
 package/efl/libedje/libedje.mk                     |    2 +-
 package/efl/libeet/libeet.mk                       |    2 +-
 package/efl/libeina/libeina.mk                     |    2 +-
 package/efl/libembryo/libembryo.mk                 |    2 +-
 package/efl/libevas/libevas.mk                     |    4 ++--
 package/enchant/enchant.mk                         |    2 +-
 package/evtest/evtest.mk                           |    2 +-
 package/expat/expat.mk                             |    2 +-
 package/freetype/freetype.mk                       |    4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    2 +-
 package/glib-networking/glib-networking.mk         |    2 +-
 package/gmpc/gmpc.mk                               |    2 +-
 package/gnutls/gnutls.mk                           |    2 +-
 package/gob2/gob2.mk                               |    2 +-
 package/gpsd/gpsd.mk                               |    4 ++--
 package/gqview/gqview.mk                           |    2 +-
 package/gvfs/gvfs.mk                               |    2 +-
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/imlib2/imlib2.mk                           |    2 +-
 package/ipset/ipset.mk                             |    2 +-
 package/iptables/iptables.mk                       |    2 +-
 package/iw/iw.mk                                   |    2 +-
 package/kmod/kmod.mk                               |    2 +-
 package/libao/libao.mk                             |    2 +-
 package/libdaemon/libdaemon.mk                     |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libdvdnav/libdvdnav.mk                     |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libexif/libexif.mk                         |    2 +-
 package/libgail/libgail.mk                         |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libglib2/libglib2.mk                       |    4 ++--
 package/libgtk2/libgtk2.mk                         |    2 +-
 package/libidn/libidn.mk                           |    2 +-
 package/libmms/libmms.mk                           |    2 +-
 .../libnetfilter-conntrack.mk                      |    2 +-
 .../libnetfilter-cttimeout.mk                      |    2 +-
 package/libnfc/libnfc.mk                           |    2 +-
 package/liboauth/liboauth.mk                       |    2 +-
 package/libogg/libogg.mk                           |    2 +-
 package/libpng/libpng.mk                           |    2 +-
 package/libsamplerate/libsamplerate.mk             |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/libsvgtiny/libsvgtiny.mk                   |    2 +-
 package/libtheora/libtheora.mk                     |    2 +-
 package/libtorrent/libtorrent.mk                   |    2 +-
 package/libusb-compat/libusb-compat.mk             |    2 +-
 package/libusb/libusb.mk                           |    2 +-
 package/libvncserver/libvncserver.mk               |    2 +-
 package/libvorbis/libvorbis.mk                     |    2 +-
 package/libxml2/libxml2.mk                         |    2 +-
 package/lighttpd/lighttpd.mk                       |    2 +-
 package/links/links.mk                             |    2 +-
 package/linphone/linphone.mk                       |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/mediastreamer/mediastreamer.mk             |    2 +-
 package/midori/midori.mk                           |    2 +-
 package/minicom/minicom.mk                         |    2 +-
 .../mobile_broadband_provider_info.mk              |    2 +-
 package/msmtp/msmtp.mk                             |    2 +-
 package/multimedia/gst-dsp/gst-dsp.mk              |    2 +-
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    2 +-
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/multimedia/lame/lame.mk                    |    2 +-
 package/multimedia/mpd/mpd.mk                      |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk        |    2 +-
 package/neon/neon.mk                               |    2 +-
 package/network-manager/network-manager.mk         |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 package/ntfs-3g/ntfs-3g.mk                         |    2 +-
 package/ofono/ofono.mk                             |    2 +-
 package/opus-tools/opus-tools.mk                   |    2 +-
 package/pango/pango.mk                             |    2 +-
 package/pcmanfm/pcmanfm.mk                         |    2 +-
 package/pcsc-lite/pcsc-lite.mk                     |    2 +-
 package/pixman/pixman.mk                           |    2 +-
 package/qt/qt.mk                                   |    2 +-
 package/radvd/radvd.mk                             |    2 +-
 package/rrdtool/rrdtool.mk                         |    2 +-
 package/rtorrent/rtorrent.mk                       |    2 +-
 package/shared-mime-info/shared-mime-info.mk       |    4 ++--
 package/sylpheed/sylpheed.mk                       |    2 +-
 package/tiff/tiff.mk                               |    2 +-
 package/transmission/transmission.mk               |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/unionfs/unionfs.mk                         |    2 +-
 package/usbutils/usbutils.mk                       |    2 +-
 package/ushare/ushare.mk                           |    2 +-
 package/util-linux/util-linux.mk                   |    4 ++--
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    2 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 110 files changed, 121 insertions(+), 121 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 0d4d690..987a1cb 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -49,7 +49,7 @@ else
 ATK_CONF_OPT += --without-x
 endif
 
-ATK_DEPENDENCIES = libglib2 host-pkg-config
+ATK_DEPENDENCIES = libglib2 host-pkgconf
 
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 03dc368..5f07a2f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -85,7 +85,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkgconf
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 2a453bb..59a032a 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -38,7 +38,7 @@ CAIRO_CONF_OPT = \
 	--enable-trace=no \
 	--enable-interpreter=no
 
-CAIRO_DEPENDENCIES = host-pkg-config fontconfig pixman
+CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	CAIRO_CONF_OPT += --enable-directfb
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index 73db67f..a9e58d1 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -7,7 +7,7 @@ CCID_VERSION = 1.4.8
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = http://alioth.debian.org/frs/download.php/3768
 CCID_INSTALL_STAGING = YES
-CCID_DEPENDENCIES = pcsc-lite host-pkg-config libusb
+CCID_DEPENDENCIES = pcsc-lite host-pkgconf libusb
 
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
 define CCID_INSTALL_UDEV_RULES
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 71ca660..6164df2 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -85,7 +85,7 @@ COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
 	$(if $(BR2_PACKAGE_COLLECTD_WIRELESS),--enable-wireless,--disable-wireless) \
 	$(if $(BR2_PACKAGE_COLLECTD_WRITEHTTP),--enable-write_http,--disable-write_http)
 
-COLLECTD_DEPENDENCIES = host-pkg-config \
+COLLECTD_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_COLLECTD_APACHE),libcurl) \
 	$(if $(BR2_PACKAGE_COLLECTD_BIND),libcurl libxml2) \
 	$(if $(BR2_PACKAGE_COLLECTD_CURL),libcurl) \
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 6f438fc..b8c8f5a 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -7,7 +7,7 @@
 CONNTRACK_TOOLS_VERSION = 1.2.2
 CONNTRACK_TOOLS_SOURCE = conntrack-tools-$(CONNTRACK_TOOLS_VERSION).tar.bz2
 CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
-CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config \
+CONNTRACK_TOOLS_DEPENDENCIES = host-pkgconf \
 	libnetfilter_conntrack libnetfilter_cttimeout
 CONNTRACK_TOOLS_LICENSE = GPLv2
 CONNTRACK_TOOLS_LICENSE_FILES = COPYING
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 93aa520..318e1b9 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -21,7 +21,7 @@ DBUS_GLIB_CONF_OPT = --localstatedir=/var \
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-DBUS_GLIB_DEPENDENCIES = host-pkg-config dbus host-dbus host-dbus-glib libglib2 expat
+DBUS_GLIB_DEPENDENCIES = host-pkgconf dbus host-dbus host-dbus-glib libglib2 expat
 
 HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-expat host-libglib2
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 1190d2f..f848bfd 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -7,7 +7,7 @@ DBUS_VERSION = 1.4.20
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus/
 DBUS_INSTALL_STAGING = YES
 
-DBUS_DEPENDENCIES = host-pkg-config
+DBUS_DEPENDENCIES = host-pkgconf
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
 DBUS_CONF_OPT = --with-dbus-user=dbus \
@@ -65,7 +65,7 @@ endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
 
-HOST_DBUS_DEPENDENCIES = host-pkg-config host-expat
+HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
 HOST_DBUS_CONF_OPT = \
 		--with-dbus-user=dbus \
 		--disable-tests \
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index b1e35ae..1ccffc5 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -120,7 +120,7 @@ ifeq ($(BR2_PACKAGE_DIRECTB_TESTS),y)
 DIRECTFB_CONF_OPT += --with-tests
 endif
 
-HOST_DIRECTFB_DEPENDENCIES = host-pkg-config host-libpng
+HOST_DIRECTFB_DEPENDENCIES = host-pkgconf host-libpng
 HOST_DIRECTFB_CONF_OPT = \
 		--disable-debug \
 		--disable-multi \
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 203a2e2..dac30e5 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -33,7 +33,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
-	DNSMASQ_DEPENDENCIES += host-pkg-config libnetfilter_conntrack
+	DNSMASQ_DEPENDENCIES += host-pkgconf libnetfilter_conntrack
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
@@ -44,7 +44,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
-	DNSMASQ_DEPENDENCIES += lua host-pkg-config
+	DNSMASQ_DEPENDENCIES += lua host-pkgconf
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
 
 define DNSMASQ_ENABLE_LUA
@@ -59,7 +59,7 @@ ifneq ($(BR2_LARGEFILE),y)
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	DNSMASQ_DEPENDENCIES += host-pkg-config dbus
+	DNSMASQ_DEPENDENCIES += host-pkgconf dbus
 endif
 
 define DNSMASQ_FIX_PKGCONFIG
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 9839d88..95799e8 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -16,6 +16,6 @@ DOCKER_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
 
 DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
-DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
+DOCKER_DEPENDENCIES = host-pkgconf libglib2 xserver_xorg-server
 
 $(eval $(autotools-package))
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 049bc29..e958158 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -21,7 +21,7 @@ E2FSPROGS_CONF_OPT = \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
 
-E2FSPROGS_DEPENDENCIES = host-pkg-config util-linux
+E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
@@ -30,7 +30,7 @@ define HOST_E2FSPROGS_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install install-libs
 endef
 # we don't have a host-util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkg-config
+HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
 
 # binaries to keep or remove
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += usr/sbin/badblocks
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index df8db0d..b495bdb 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -9,9 +9,9 @@ LIBECORE_SOURCE = ecore-$(LIBECORE_VERSION).tar.bz2
 LIBECORE_SITE = http://download.enlightenment.org/releases/
 LIBECORE_INSTALL_STAGING = YES
 
-LIBECORE_DEPENDENCIES = host-pkg-config libeina
+LIBECORE_DEPENDENCIES = host-pkgconf libeina
 
-HOST_LIBECORE_DEPENDENCIES = host-pkg-config host-libeina host-libevas
+HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
 HOST_LIBECORE_CONF_OPT += 		\
 	--enable-ecore-evas 		\
 	--disable-simple-x11 		\
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index 04c48a4..4ecb0f8 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -9,7 +9,7 @@ LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 LIBEDBUS_SITE = http://download.enlightenment.org/releases/
 LIBEDBUS_INSTALL_STAGING = YES
 
-LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina libecore
+LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
 
 ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
 LIBEDBUS_CONF_OPT += --enable-ebluez
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index e6d9ab3..8b4814e 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -9,7 +9,7 @@ LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 LIBEDJE_INSTALL_STAGING = YES
 
-LIBEDJE_DEPENDENCIES = host-pkg-config lua libeina libeet libecore libevas \
+LIBEDJE_DEPENDENCIES = host-pkgconf lua libeina libeet libecore libevas \
 			libembryo
 
 ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index 3ca12d3..cb64675 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -9,7 +9,7 @@ LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
 LIBEET_SITE = http://download.enlightenment.org/releases/
 LIBEET_INSTALL_STAGING = YES
 
-LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
+LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 2391379..465fee1 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -9,7 +9,7 @@ LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
 LIBEINA_SITE = http://download.enlightenment.org/releases/
 LIBEINA_INSTALL_STAGING = YES
 
-LIBEINA_DEPENDENCIES = host-pkg-config
+LIBEINA_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index db1696d..5484ccf 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -9,7 +9,7 @@ LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
 LIBEMBRYO_INSTALL_STAGING = YES
 
-LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
+LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 3baf23b..594db60 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -9,9 +9,9 @@ LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
 LIBEVAS_SITE = http://download.enlightenment.org/releases/
 LIBEVAS_INSTALL_STAGING = YES
 
-LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina freetype
+LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
 
-HOST_LIBEVAS_DEPENDENCIES = host-pkg-config host-zlib host-libeina \
+HOST_LIBEVAS_DEPENDENCIES = host-pkgconf host-zlib host-libeina \
 				host-freetype host-libpng host-jpeg
 HOST_LIBEVAS_CONF_OPT += \
 	--enable-image-loader-png \
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 215425a..896dfc6 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -7,6 +7,6 @@ ENCHANT_VERSION = 1.5.0
 ENCHANT_SOURCE = enchant-$(ENCHANT_VERSION).tar.gz
 ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
-ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
+ENCHANT_DEPENDENCIES = libglib2 host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 582d1a7..ffda1bf 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -10,7 +10,7 @@ EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
 EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
 EVTEST_LICENSE = GPLv2
 EVTEST_LICENSE_FILES = COPYING
-EVTEST_DEPENDENCIES = host-pkg-config
+EVTEST_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_EVTEST_CAPTURE),y)
 EVTEST_DEPENDENCIES += libxml2
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5b19b4c..e650723 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -9,7 +9,7 @@ EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSIO
 EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
-EXPAT_DEPENDENCIES = host-pkg-config
+EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 796c37c..a34c9ad 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,11 +9,11 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = host-pkg-config \
+FREETYPE_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2)
 
-HOST_FREETYPE_DEPENDENCIES = host-pkg-config
+HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 
 define FREETYPE_FREETYPE_CONFIG_STAGING_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 92a34bf..4e00c40 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -42,7 +42,7 @@ endif
 GDK_PIXBUF_DEPENDENCIES += \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
-	host-pkg-config libglib2
+	host-pkgconf libglib2
 
 define GDK_PIXBUF_POST_INSTALL_TWEAKS
 	$(INSTALL) -m 755 -D package/gdk-pixbuf/S26gdk-pixbuf \
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 823ba39..b1eec4d 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -14,7 +14,7 @@ GLIB_NETWORKING_INSTALL_STAGING = YES
 
 GLIB_NETWORKING_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-	host-pkg-config \
+	host-pkgconf \
 	host-intltool \
 	libglib2
 
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index a136cf4..5f914ff 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -8,7 +8,7 @@ GMPC_VERSION = 11.8.16
 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
 GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
 GMPC_CONF_OPT = --disable-mmkeys --disable-unique
-GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
+GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1ef6e3f..2634642 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -9,7 +9,7 @@ GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING lib/COPYING
-GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
+GNUTLS_DEPENDENCIES = host-pkgconf libgcrypt $(if $(BR2_PACKAGE_ZLIB),zlib)
 GNUTLS_CONF_ENV = acl_cv_rpath=no
 GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 		--without-p11-kit --disable-rpath
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 3757f85..b64c0db 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -6,7 +6,7 @@
 
 GOB2_VERSION = 2.0.18
 GOB2_SITE = http://ftp.5z.com/pub/gob
-GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
+GOB2_DEPENDENCIES = libglib2 flex bison host-pkgconf host-flex
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
 $(eval $(autotools-package))
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4482a11..e472044 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -9,7 +9,7 @@ GPSD_LICENSE = BSD-3c
 GPSD_LICENSE_FILES = COPYING
 GPSD_INSTALL_STAGING = YES
 
-GPSD_DEPENDENCIES = host-scons host-pkg-config
+GPSD_DEPENDENCIES = host-scons host-pkgconf
 
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -45,7 +45,7 @@ endif
 # Enable or disable Qt binding
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
 	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
-	GPSD_DEPENDENCIES += qt host-pkg-config
+	GPSD_DEPENDENCIES += qt host-pkgconf
 else
 	GPSD_SCONS_OPTS += libQgpsmm=no
 endif
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 2f64cd0..e6d764d 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -6,7 +6,7 @@
 GQVIEW_VERSION = 2.1.5
 GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
-GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
+GQVIEW_DEPENDENCIES = host-pkgconf libgtk2
 
 $(eval $(autotools-package))
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index dcb94ee..1ae094f 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -9,7 +9,7 @@ GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_DEPENDENCIES = host-pkg-config host-libglib2 libglib2 dbus shared-mime-info
+GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info
 
 GVFS_CONF_OPT = \
 	--disable-gconf			\
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 6d34ad3..61a379d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -33,7 +33,7 @@ IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-fpx \
 		--without-x
 
-IMAGEMAGICK_DEPENDENCIES = host-pkg-config
+IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 IMAGEMAGICK_CONF_OPT += --with-fontconfig
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 3adcd99..3c6c473 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -7,7 +7,7 @@ IMLIB2_VERSION = 1.4.5
 IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 IMLIB2_SITE = http://downloads.sourceforge.net/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
 IMLIB2_INSTALL_STAGING = YES
-IMLIB2_DEPENDENCIES = host-pkg-config freetype
+IMLIB2_DEPENDENCIES = host-pkgconf freetype
 IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index b8d0a24..999c5cb 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -7,7 +7,7 @@
 IPSET_VERSION = 6.14
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
-IPSET_DEPENDENCIES = libmnl host-pkg-config
+IPSET_DEPENDENCIES = libmnl host-pkgconf
 IPSET_CONF_OPT = --with-kmod=no
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 17c191e..3243b3f 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -8,7 +8,7 @@ IPTABLES_VERSION = 1.4.16.3
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 IPTABLES_INSTALL_STAGING = YES
-IPTABLES_DEPENDENCIES = host-pkg-config
+IPTABLES_DEPENDENCIES = host-pkgconf
 IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 654282a..7633124 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -7,7 +7,7 @@
 IW_VERSION = 3.7
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
-IW_DEPENDENCIES = host-pkg-config libnl
+IW_DEPENDENCIES = host-pkgconf libnl
 IW_CONFIG = $(IW_DIR)/.config
 IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
 	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index fb07ae6..10f70f5 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -2,7 +2,7 @@ KMOD_VERSION = 10
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
-KMOD_DEPENDENCIES = host-pkg-config
+KMOD_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 74322b2..aee85a9 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -6,7 +6,7 @@
 
 LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
-LIBAO_DEPENDENCIES = host-pkg-config
+LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
 			--disable-nas --disable-pulse
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 214402a..eab9c34 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -11,6 +11,6 @@ LIBDAEMON_LICENSE_FILES = LICENSE
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
-LIBDAEMON_DEPENDENCIES = host-pkg-config
+LIBDAEMON_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 76ee763..fbfc95e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -15,7 +15,7 @@ LIBDRM_DEPENDENCIES = \
 	xlib_libXmu \
 	xproto_dri2proto \
 	pthread-stubs \
-	host-pkg-config
+	host-pkgconf
 
 ifeq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL),y)
 LIBDRM_CONF_OPT += --enable-intel
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 2fefe43..520f58d 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -10,7 +10,7 @@ LIBDVDNAV_SITE = http://dvdnav.mplayerhq.hu/releases
 LIBDVDNAV_AUTORECONF = YES
 LIBDVDNAV_INSTALL_STAGING = YES
 
-LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
+LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 6770276..d72ab61 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -8,7 +8,7 @@ LIBEXOSIP2_VERSION = 3.6.0
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
 
-LIBEXOSIP2_DEPENDENCIES = host-pkg-config libosip2
+LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEXOSIP2_DEPENDENCIES += openssl
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index f7af18a..1c51564 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -9,6 +9,6 @@ LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
-LIBEXIF_DEPENDENCIES = host-pkg-config
+LIBEXIF_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index e8a8a60..e3ea9b9 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -15,6 +15,6 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 LIBGAIL_CONF_OPT += --disable-x
 endif
 
-LIBGAIL_DEPENDENCIES = host-pkg-config libgtk2 pango
+LIBGAIL_DEPENDENCIES = host-pkgconf libgtk2 pango
 
 $(eval $(autotools-package))
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 78a1fdb..6a6641c 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -7,7 +7,7 @@ LIBGLADE_VERSION = 2.6.4
 LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
 LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
 LIBGLADE_INSTALL_STAGING = YES
-LIBGLADE_DEPENDENCIES = host-pkg-config libglib2 libgtk2 atk libxml2
+LIBGLADE_DEPENDENCIES = host-pkgconf libglib2 libgtk2 atk libxml2
 
 define LIBGLADE_INSTALL_FIX
 	rm -rf $(TARGET_DIR)/usr/share/xml/libglade \
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index dcd7996..a32cab2 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -54,9 +54,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
+LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index e80e137..9adb6b9 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -69,7 +69,7 @@ LIBGTK2_CONF_OPT = --disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug
 
-LIBGTK2_DEPENDENCIES = host-pkg-config host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
+LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 	LIBGTK2_CONF_OPT += --with-gdktarget=directfb
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index c55f2c5..b06b1ec 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -9,7 +9,7 @@ LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
-LIBIDN_DEPENDENCIES = host-pkg-config $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index bc66f53..5ab4f37 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -9,6 +9,6 @@ LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VE
 
 LIBMMS_INSTALL_STAGING = YES
 
-LIBMMS_DEPENDENCIES = host-pkg-config libglib2
+LIBMMS_DEPENDENCIES = host-pkgconf libglib2
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index c602903..a5d832f 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -8,6 +8,6 @@ LIBNETFILTER_CONNTRACK_VERSION = 1.0.1
 LIBNETFILTER_CONNTRACK_SOURCE = libnetfilter_conntrack-$(LIBNETFILTER_CONNTRACK_VERSION).tar.bz2
 LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_conntrack/files
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
-LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink
+LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkgconf libnfnetlink
 
 $(eval $(autotools-package))
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
index 4792980..4bdc0fc 100644
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -8,6 +8,6 @@ LIBNETFILTER_CTTIMEOUT_VERSION = 1.0.0
 LIBNETFILTER_CTTIMEOUT_SOURCE = libnetfilter_cttimeout-$(LIBNETFILTER_CTTIMEOUT_VERSION).tar.bz2
 LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_cttimeout/files
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
-LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkg-config libmnl
+LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkgconf libmnl
 
 $(eval $(autotools-package))
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index 08892b3..c343551 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -11,7 +11,7 @@ LIBNFC_LICENSE_FILES = COPYING
 LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
-LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
+LIBNFC_DEPENDENCIES = host-pkgconf libusb libusb-compat
 
 # N.B. The acr122 driver requires pcsc-lite.
 LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 6695fcb..9eb0e7d 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -8,7 +8,7 @@ LIBOAUTH_SOURCE = liboauth-$(LIBOAUTH_VERSION).tar.gz
 LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
 LIBOAUTH_INSTALL_STAGING = YES
 
-LIBOAUTH_DEPENDENCIES += host-pkg-config openssl
+LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOAUTH_DEPENDENCIES += libcurl
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 4020d62..519ba9d 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -7,6 +7,6 @@ LIBOGG_VERSION = 1.3.0
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_INSTALL_STAGING = YES
 
-LIBOGG_DEPENDENCIES = host-pkg-config
+LIBOGG_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 3bcd1b8..d834876 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,7 +11,7 @@ LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SER
 LIBPNG_LICENSE = libpng license
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_INSTALL_STAGING = YES
-LIBPNG_DEPENDENCIES = host-pkg-config zlib
+LIBPNG_DEPENDENCIES = host-pkgconf zlib
 
 define LIBPNG_STAGING_LIBPNG12_CONFIG_FIXUP
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index 533d95f..950e5b5 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -7,7 +7,7 @@
 LIBSAMPLERATE_VERSION = 0.1.8
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
-LIBSAMPLERATE_DEPENDENCIES = host-pkg-config
+LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
 LIBSAMPLERATE_CONF_OPT = --disable-fftw --program-transform-name=''
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 30655ba..2f173df 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index 9baa4b0..076a783 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -7,7 +7,7 @@
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
 LIBSVGTINY_VERSION = 12121
 LIBSVGTINY_INSTALL_STAGING = YES
-LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkg-config
+LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
 
 define LIBSVGTINY_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 5714e70..1a19bcd 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -15,6 +15,6 @@ LIBTHEORA_CONF_OPT = \
 		--disable-examples \
 		--disable-spec
 
-LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
+LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 0c29661..892195b 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -6,7 +6,7 @@
 
 LIBTORRENT_VERSION = 0.13.2
 LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
-LIBTORRENT_DEPENDENCIES = host-pkg-config libsigc \
+LIBTORRENT_DEPENDENCIES = host-pkgconf libsigc \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 LIBTORRENT_CONF_OPT = --enable-aligned \
 	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index d42abf5..848c705 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -6,7 +6,7 @@
 LIBUSB_COMPAT_VERSION = 0.1.4
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = http://downloads.sourceforge.net/project/libusb/libusb-compat-0.1/libusb-compat-$(LIBUSB_COMPAT_VERSION)
-LIBUSB_COMPAT_DEPENDENCIES = host-pkg-config libusb
+LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
 LIBUSB_COMPAT_INSTALL_STAGING = YES
 
 define LIBUSB_COMPAT_FIXUP_CONFIG
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index d4ca31e..06a1485 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -8,7 +8,7 @@ LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = http://downloads.sourceforge.net/project/libusb/libusb-1.0/libusb-$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPLv2.1+
 LIBUSB_LICENSE_FILES = COPYING
-LIBUSB_DEPENDENCIES = host-pkg-config
+LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index f94670e..ac55a95 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -31,7 +31,7 @@ LIBVNCSERVER_CONF_OPT += --without-gcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBVNCSERVER_DEPENDENCIES += gnutls host-pkg-config
+LIBVNCSERVER_DEPENDENCIES += gnutls host-pkgconf
 else
 LIBVNCSERVER_CONF_OPT += --without-gnutls
 endif
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 009143b..c8ff213 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -11,6 +11,6 @@ LIBVORBIS_INSTALL_STAGING = YES
 
 LIBVORBIS_CONF_OPT = --disable-oggtest
 
-LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
+LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 
 $(eval $(autotools-package))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b63200f..71f2bd1 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -24,7 +24,7 @@ endef
 
 LIBXML2_POST_INSTALL_STAGING_HOOKS += LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
 
-HOST_LIBXML2_DEPENDENCIES = host-pkg-config
+HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
 HOST_LIBXML2_CONF_OPT = --without-debug --without-python
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4bad5ba..08ce372 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -8,7 +8,7 @@ LIGHTTPD_VERSION = 1.4.31
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LICENSE = BSD-3c
 LIGHTTPD_LICENSE_FILES = COPYING
-LIGHTTPD_DEPENDENCIES = host-pkg-config
+LIGHTTPD_DEPENDENCIES = host-pkgconf
 LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
diff --git a/package/links/links.mk b/package/links/links.mk
index 9dbf0ad..4537b3a 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -7,7 +7,7 @@
 LINKS_VERSION = 2.5
 LINKS_SITE = http://links.twibright.com/download
 LINKS_CONF_OPT = --without-x
-LINKS_DEPENDENCIES = host-pkg-config
+LINKS_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index afd2966..efe70a9 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -10,7 +10,7 @@ LINPHONE_CONF_OPT = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer
 
-LINPHONE_DEPENDENCIES = host-pkg-config ortp mediastreamer libeXosip2 speex
+LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
 LINPHONE_CONF_OPT += --enable-gtk_ui
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 6fd1987..de11dfc 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -8,7 +8,7 @@ MATCHBOX_LIB_VERSION = 1.9
 MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
 MATCHBOX_LIB_SITE = http://matchbox-project.org/sources/libmatchbox/$(MATCHBOX_LIB_VERSION)
 MATCHBOX_LIB_INSTALL_STAGING = YES
-MATCHBOX_LIB_DEPENDENCIES = host-pkg-config expat xlib_libXext
+MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
 MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 1f4e1d4..b324126 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -1,7 +1,7 @@
 MEDIASTREAMER_VERSION = 2.8.2
 MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
 MEDIASTREAMER_INSTALL_STAGING = YES
-MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkg-config ortp
+MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp
 # tests fail linking on some architectures, so disable them
 MEDIASTREAMER_CONF_OPT = --disable-tests
 
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 33f94cf..44cce40 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -9,7 +9,7 @@ MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
 MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.4/
 MIDORI_DEPENDENCIES = \
 	host-intltool \
-	host-pkg-config \
+	host-pkgconf \
 	host-vala \
 	libgtk2 \
 	libsexy \
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 6d0607f..06b023e 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,7 +10,7 @@ MINICOM_LICENSE = GPLv2+
 MINICOM_LICENSE_FILES = COPYING
 
 # pkg-config is only used to check for liblockdev, which we don't have
-# in BR, so instead of adding host-pkg-config as a dependency, simply
+# in BR, so instead of adding host-pkgconf as a dependency, simply
 # make sure the host version isn't used so we don't end up with problems
 # if people have liblockdev1-dev installed
 MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index c74d581..8623297 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -6,6 +6,6 @@
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
-MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkg-config
+MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 6b641f7..87a2fbb 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -8,7 +8,7 @@ MSMTP_VERSION = 1.4.27
 MSMTP_SITE = http://downloads.sourceforge.net/project/msmtp/msmtp/$(MSMTP_VERSION)
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.bz2
 
-MSMTP_DEPENDENCIES += host-pkg-config
+MSMTP_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MSMTP_CONF_OPT += --with-ssl=openssl
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index f921ec9..74b4c98 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -13,6 +13,6 @@ define GST_DSP_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/lib/gstreamer-0.10/libgstdsp.so
 endef
 
-GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkg-config
+GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkgconf
 
 $(eval $(generic-package))
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index 9413ff2..ead490e 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -8,7 +8,7 @@ GST_FFMPEG_VERSION = 0.10.13
 GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
 GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
 GST_FFMPEG_INSTALL_STAGING = YES
-GST_FFMPEG_DEPENDENCIES = host-pkg-config gstreamer gst-plugins-base ffmpeg
+GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base ffmpeg
 GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index 1943d03..a9841b1 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -23,6 +23,6 @@ GSTREAMER_CONF_OPT = \
 		--disable-loadsave \
 		$(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug)
 
-GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
+GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index a022312..a251f02 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -8,7 +8,7 @@ LAME_VERSION_MAJOR = 3.99
 LAME_VERSION_MINOR = 5
 LAME_VERSION = $(LAME_VERSION_MAJOR).$(LAME_VERSION_MINOR)
 LAME_SITE = http://downloads.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
-LAME_DEPENDENCIES = host-pkg-config
+LAME_DEPENDENCIES = host-pkgconf
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPT = --enable-dynamic-frontends
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index fb4c550..ab3a357 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -6,7 +6,7 @@
 
 MPD_VERSION = 0.17.2
 MPD_SITE = http://downloads.sourceforge.net/project/musicpd/mpd/$(MPD_VERSION)
-MPD_DEPENDENCIES = host-pkg-config libglib2
+MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
 MPD_LICENSE_FILES = COPYING
 
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 6396fef..e78eb42 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -15,7 +15,7 @@ PULSEAUDIO_CONF_OPT = \
 	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-manpages)
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkg-config libtool json-c libsndfile speex host-intltool \
+	host-pkgconf libtool json-c libsndfile speex host-intltool \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 52d5066..c2e4949 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -8,7 +8,7 @@ NEON_SITE = http://www.webdav.org/neon/
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPT = --without-gssapi --disable-rpath
 
-NEON_DEPENDENCIES = host-pkg-config
+NEON_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
 NEON_CONF_OPT += --with-zlib=$(STAGING_DIR)
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 6c98d64..d14c98d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -7,7 +7,7 @@ NETWORK_MANAGER_VERSION = 0.9.2.0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls util-linux
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl wireless_tools gnutls util-linux
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 61e0d67..41a0e05 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -8,7 +8,7 @@ NFS_UTILS_VERSION = 1.2.6
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.bz2
 NFS_UTILS_SITE = http://downloads.sourceforge.net/project/nfs/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_AUTORECONF = YES
-NFS_UTILS_DEPENDENCIES = host-pkg-config
+NFS_UTILS_DEPENDENCIES = host-pkgconf
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index f6db4ef..d2e6861 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -9,7 +9,7 @@ NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPT = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
-NTFS_3G_DEPENDENCIES = host-pkg-config
+NTFS_3G_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 	NTFS_3G_CONF_OPT += --with-fuse=external
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 6cd7cdd..6e6849b 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -6,7 +6,7 @@
 OFONO_VERSION = 1.6
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
-	host-pkg-config \
+	host-pkgconf \
 	dbus \
 	libglib2 \
 	libcap-ng \
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 233ad9a..2b649dc 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -7,7 +7,7 @@
 OPUS_TOOLS_VERSION = 0.1.5
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
-OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkg-config
+OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 OPUS_TOOLS_DEPENDENCIES += libpcap
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 86ab474..7ba53ee 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkgconf libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 561de1f..1f1a330 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -7,7 +7,7 @@ PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
 PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 PCMANFM_CONF_OPT = --disable-hal
-PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
+PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
 
 $(eval $(autotools-package))
 
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 49eeec7..d1d7691 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -7,7 +7,7 @@ PCSC_LITE_VERSION = 1.8.6
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/3757
 PCSC_LITE_INSTALL_STAGING = YES
-PCSC_LITE_DEPENDENCIES = host-pkg-config
+PCSC_LITE_DEPENDENCIES = host-pkgconf
 
 # - libudev and libusb are optional
 # - libudev and libusb can't be used together
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8ce435d..4879594 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -6,7 +6,7 @@
 PIXMAN_VERSION = 0.25.2
 PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
 PIXMAN_INSTALL_STAGING = YES
-PIXMAN_DEPENDENCIES = host-pkg-config
+PIXMAN_DEPENDENCIES = host-pkgconf
 # don't build gtk based demos
 PIXMAN_CONF_OPT = --disable-gtk
 
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e000ecb..be0808d 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -14,7 +14,7 @@
 QT_VERSION = 4.8.3
 QT_SOURCE  = qt-everywhere-opensource-src-$(QT_VERSION).tar.gz
 QT_SITE    = http://releases.qt-project.org/qt4/source
-QT_DEPENDENCIES = host-pkg-config
+QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 33267f0..6151236 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -6,7 +6,7 @@
 
 RADVD_VERSION = 1.9.1
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkg-config
+RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 1057d5d..7521aba 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -6,7 +6,7 @@
 
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
-RRDTOOL_DEPENDENCIES = host-pkg-config freetype libart libpng zlib
+RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index c44cd57..ff1ae2f 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -6,7 +6,7 @@
 
 RTORRENT_VERSION = 0.9.2
 RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
-RTORRENT_DEPENDENCIES = host-pkg-config libcurl libsigc libtorrent ncurses
+RTORRENT_DEPENDENCIES = host-pkgconf libcurl libsigc libtorrent ncurses
 RTORRENT_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index f941dd9..a116840 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -10,12 +10,12 @@ SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
-SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
+SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
 
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 SHARED_MIME_INFO_MAKE = $(MAKE1)
 
-HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkg-config host-intltool
+HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-intltool
 
 HOST_SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 HOST_SHARED_MIME_INFO_MAKE = $(MAKE1)
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 491737e..cf55c90 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -11,7 +11,7 @@ SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 
 SYLPHEED_CONF_OPT = --disable-gtkspell
 
-SYLPHEED_DEPENDENCIES = host-pkg-config libgtk2
+SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
 # Remove the -I$(includedir) from the Makefiles
 # because it refers to the host /usr/include.
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 145d929..e881647 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -11,7 +11,7 @@ TIFF_CONF_OPT = \
 	--disable-cxx \
 	--without-x \
 
-TIFF_DEPENDENCIES = host-pkg-config
+TIFF_DEPENDENCIES = host-pkgconf
 
 TIFF_TOOLS_LIST =
 ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),y)
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 3f0694b..10315dc 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -7,7 +7,7 @@ TRANSMISSION_VERSION = 2.33
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
 TRANSMISSION_DEPENDENCIES = \
-	host-pkg-config \
+	host-pkgconf \
 	host-intltool \
 	libcurl \
 	libevent \
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index b9fc02f..c55db71 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -20,7 +20,7 @@ UDEV_CONF_OPT =			\
 	--with-firmware-path=/lib/firmware		\
 	--disable-introspection
 
-UDEV_DEPENDENCIES = host-gperf host-pkg-config util-linux kmod
+UDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
 
 ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
 UDEV_CONF_OPT += --enable-rule_generator
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 6c86c57..89729fe 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -7,7 +7,7 @@
 UNIONFS_VERSION = 0.26
 UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
 UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.xz
-UNIONFS_DEPENDENCIES = libfuse host-pkg-config
+UNIONFS_DEPENDENCIES = libfuse host-pkgconf
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 6e29571..87ae4b3 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -7,7 +7,7 @@
 USBUTILS_VERSION = 006
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils/
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
-USBUTILS_DEPENDENCIES = host-pkg-config libusb
+USBUTILS_DEPENDENCIES = host-pkgconf libusb
 USBUTILS_INSTALL_STAGING = YES
 # no configure in tarball
 USBUTILS_AUTORECONF = YES
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 78cbcda..8f690fc 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -7,7 +7,7 @@
 USHARE_VERSION = 1.1a
 USHARE_SOURCE = ushare-$(USHARE_VERSION).tar.bz2
 USHARE_SITE = http://ushare.geexbox.org/releases
-USHARE_DEPENDENCIES = host-pkg-config libupnp
+USHARE_DEPENDENCIES = host-pkgconf libupnp
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 USHARE_DEPENDENCIES += gettext
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 71a6c53..f6028f4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -9,13 +9,13 @@ UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_AUTORECONF = YES
 UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkg-config
+UTIL_LINUX_DEPENDENCIES = host-pkgconf
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
 
 UTIL_LINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown
 
 # We don't want the host-busybox dependency to be added automatically
-HOST_UTIL_LINUX_DEPENDENCIES = host-pkg-config
+HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # If both util-linux and busybox are selected, make certain util-linux
 # wins the fight over who gets to have their utils actually installed
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index d8c916b..febb80c 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -80,7 +80,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	WPA_SUPPLICANT_DEPENDENCIES += host-pkg-config dbus
+	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
 	WPA_SUPPLICANT_MAKE_ENV = \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index a053379..f7b1945 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -11,7 +11,7 @@ LIBXCB_INSTALL_STAGING = YES
 
 LIBXCB_DEPENDENCIES = \
 	host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
-	host-xcb-proto host-python host-pkg-config
+	host-xcb-proto host-python host-pkgconf
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index c44573d..ea00d9c 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -8,7 +8,7 @@ XAPP_XF86DGA_VERSION = 1.0.2
 XAPP_XF86DGA_SOURCE = xf86dga-$(XAPP_XF86DGA_VERSION).tar.bz2
 XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XF86DGA_DEPENDENCIES = \
-	host-pkg-config \
+	host-pkgconf \
 	xlib_libX11 \
 	xlib_libXxf86dga \
 	xlib_libXt \
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index effa060..c3467ba 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -8,6 +8,6 @@ XAPP_XLOGO_VERSION = 1.0.1
 XAPP_XLOGO_SOURCE = xlogo-$(XAPP_XLOGO_VERSION).tar.bz2
 XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
-			  xlib_libXft host-pkg-config
+			  xlib_libXft host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 22447a4..2113c07 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -7,7 +7,7 @@
 XFONT_ENCODINGS_VERSION = 1.0.4
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkg-config xutil_util-macros
+XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 832b441..f91b998 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -7,7 +7,7 @@
 XFONT_FONT_UTIL_VERSION = 1.2.0
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
-XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
+XFONT_FONT_UTIL_DEPENDENCIES = host-pkgconf
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 631dee8..ed5b904 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -53,7 +53,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	pixman 				\
 	openssl 			\
 	mcookie 			\
-	host-pkg-config
+	host-pkgconf
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-dmx \
