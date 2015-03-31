From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 31 Mar 2015 09:21:57 +0200
Subject: [Buildroot] [PATCH 1/1] packages: indentation cleanup
Message-ID: <1427786517-13745-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit doesn't touch infra packages.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/mxs-bootlets/mxs-bootlets.mk          |  30 +++----
 linux/linux.mk                             |   2 +-
 package/aircrack-ng/aircrack-ng.mk         |  26 +++---
 package/bind/bind.mk                       |  37 ++++----
 package/botan/botan.mk                     |  18 ++--
 package/cairo/cairo.mk                     |  78 ++++++++---------
 package/ccache/ccache.mk                   |  10 +--
 package/civetweb/civetweb.mk               |  14 +--
 package/collectd/collectd.mk               |  18 ++--
 package/cups/cups.mk                       |  18 ++--
 package/dbus-cpp/dbus-cpp.mk               |  25 ++++--
 package/dhcpcd/dhcpcd.mk                   |   6 +-
 package/dillo/dillo.mk                     |  24 ++---
 package/dnsmasq/dnsmasq.mk                 |  30 +++----
 package/ecryptfs-utils/ecryptfs-utils.mk   |   6 +-
 package/enscript/enscript.mk               |   4 +-
 package/fmlib/fmlib.mk                     |   2 +-
 package/gdb/gdb.mk                         |  20 ++---
 package/git/git.mk                         |  43 ++++-----
 package/gnutls/gnutls.mk                   |   9 +-
 package/gpsd/gpsd.mk                       | 108 +++++++++++------------
 package/harfbuzz/harfbuzz.mk               |  24 ++---
 package/haserl/haserl.mk                   |   8 +-
 package/hostapd/hostapd.mk                 |  32 +++----
 package/hplip/hplip.mk                     |   6 +-
 package/ifplugd/ifplugd.mk                 |   2 +-
 package/imlib2/imlib2.mk                   |  36 ++++----
 package/kismet/kismet.mk                   |  12 +--
 package/lcms2/lcms2.mk                     |  18 ++--
 package/libbluray/libbluray.mk             |  10 +--
 package/libcap/libcap.mk                   |   6 +-
 package/libcgroup/libcgroup.mk             |   6 +-
 package/libgcrypt/libgcrypt.mk             |   2 +-
 package/libglib2/libglib2.mk               |  90 ++++++++++++-------
 package/libplayer/libplayer.mk             |  16 ++--
 package/linux-pam/linux-pam.mk             |   4 +-
 package/lua/lua.mk                         |  26 +++---
 package/luarocks/luarocks.mk               |   2 +-
 package/make/make.mk                       |   2 +-
 package/modem-manager/modem-manager.mk     |  12 +--
 package/nano/nano.mk                       |  12 +--
 package/nbd/nbd.mk                         |   4 +-
 package/ncftp/ncftp.mk                     |  16 ++--
 package/ncurses/ncurses.mk                 |   5 +-
 package/neard/neard.mk                     |   2 +-
 package/neardal/neardal.mk                 |   2 +-
 package/net-tools/net-tools.mk             |   2 +-
 package/netatalk/netatalk.mk               |  21 ++---
 package/netsnmp/netsnmp.mk                 |  32 +++----
 package/network-manager/network-manager.mk |  18 ++--
 package/nodejs/nodejs.mk                   |   2 +-
 package/ntfs-3g/ntfs-3g.mk                 |  14 +--
 package/ntp/ntp.mk                         |  22 ++---
 package/ofono/ofono.mk                     |  12 +--
 package/open2300/open2300.mk               |   8 +-
 package/openssl/openssl.mk                 |  20 ++---
 package/openswan/openswan.mk               |  10 +--
 package/openvpn/openvpn.mk                 |  20 +++--
 package/pango/pango.mk                     |  11 +--
 package/pciutils/pciutils.mk               |  18 ++--
 package/perf/perf.mk                       |   6 +-
 package/php/php.mk                         | 135 +++++++++++++++--------------
 package/pkgconf/pkgconf.mk                 |   4 +-
 package/poppler/poppler.mk                 |  48 +++++-----
 package/postgresql/postgresql.mk           |  24 ++---
 package/pppd/pppd.mk                       |   6 +-
 package/ptpd2/ptpd2.mk                     |   8 +-
 package/qwt/qwt.mk                         |  12 +--
 package/rsync/rsync.mk                     |   4 +-
 package/ruby/ruby.mk                       |  23 ++---
 package/sconeserver/sconeserver.mk         |  83 +++++++++---------
 package/slang/slang.mk                     |  32 +++----
 package/snmppp/snmppp.mk                   |   6 +-
 package/socat/socat.mk                     |   8 +-
 package/speex/speex.mk                     |   4 +-
 package/tiff/tiff.mk                       |  32 +++----
 package/tn5250/tn5250.mk                   |   6 +-
 package/transmission/transmission.mk       |  22 ++---
 package/ulogd/ulogd.mk                     |  10 +--
 package/usb_modeswitch/usb_modeswitch.mk   |   6 +-
 package/usbutils/usbutils.mk               |   2 +-
 package/wget/wget.mk                       |  17 ++--
 package/wireless_tools/wireless_tools.mk   |   4 +-
 package/wpa_supplicant/wpa_supplicant.mk   |  54 ++++++------
 package/wvstreams/wvstreams.mk             |  20 ++---
 package/zeromq/zeromq.mk                   |   6 +-
 86 files changed, 865 insertions(+), 810 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 2452a6b..9b6bd7a 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -5,32 +5,32 @@
 ################################################################################
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
-	MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
-	MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
-	MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
+MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
+MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
+MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
-	MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
-	MXS_BOOTLETS_SITE_METHOD = git
-	MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
+MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
+MXS_BOOTLETS_SITE_METHOD = git
+MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
 else
-	MXS_BOOTLETS_VERSION = 10.12.01
-	MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source
-	MXS_BOOTLETS_SOURCE = imx-bootlets-src-$(MXS_BOOTLETS_VERSION).tar.gz
+MXS_BOOTLETS_VERSION = 10.12.01
+MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source
+MXS_BOOTLETS_SOURCE = imx-bootlets-src-$(MXS_BOOTLETS_VERSION).tar.gz
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_STMP37xx),y)
-	MXS_BOOTLETS_BOARD = stmp37xx_dev
+MXS_BOOTLETS_BOARD = stmp37xx_dev
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_STMP378x),y)
-	MXS_BOOTLETS_BOARD = stmp378x_dev
+MXS_BOOTLETS_BOARD = stmp378x_dev
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_IMX28EVK),y)
-	MXS_BOOTLETS_BOARD = iMX28_EVK
+MXS_BOOTLETS_BOARD = iMX28_EVK
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD),y)
-	MXS_BOOTLETS_BOARD = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME))
+MXS_BOOTLETS_BOARD = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME))
 endif
 
 ifeq ($(BR2_TARGET_MXS_BOOTLETS_HAS_IVT),y)
-	MXS_BOOTLETS_IVT_SUFFIX = _ivt
-	MXS_BOOTLETS_ELFTOSB_OPTIONS += -f imx28
+MXS_BOOTLETS_IVT_SUFFIX = _ivt
+MXS_BOOTLETS_ELFTOSB_OPTIONS += -f imx28
 endif
 
 MXS_BOOTLETS_DEPENDENCIES = host-elftosb
diff --git a/linux/linux.mk b/linux/linux.mk
index 3837e8d..22fce35 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -52,7 +52,7 @@ LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES += host-kmod host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
-	LINUX_DEPENDENCIES += host-uboot-tools
+LINUX_DEPENDENCIES += host-uboot-tools
 endif
 
 LINUX_MAKE_FLAGS = \
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index fff4137..fc72c3b 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -18,33 +18,33 @@ AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) \
 
 # libnl support has issues when building static
 ifeq ($(BR2_STATIC_LIBS),y)
-	AIRCRACK_NG_MAKE_OPTS += libnl=false
+AIRCRACK_NG_MAKE_OPTS += libnl=false
 else
-	AIRCRACK_NG_MAKE_OPTS += libnl=true
-	AIRCRACK_NG_DEPENDENCIES += libnl
+AIRCRACK_NG_MAKE_OPTS += libnl=true
+AIRCRACK_NG_DEPENDENCIES += libnl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-	AIRCRACK_NG_DEPENDENCIES += libpcap
-	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
-		$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
+AIRCRACK_NG_DEPENDENCIES += libpcap
+AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=yes \
+	$(if $(BR2_STATIC_LIBS),LIBPCAP="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)")
 else
-	AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
+AIRCRACK_NG_MAKE_OPTS += HAVE_PCAP=no
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	AIRCRACK_NG_DEPENDENCIES += pcre
-	AIRCRACK_NG_MAKE_OPTS += pcre=true
+AIRCRACK_NG_DEPENDENCIES += pcre
+AIRCRACK_NG_MAKE_OPTS += pcre=true
 else
-	AIRCRACK_NG_MAKE_OPTS += pcre=false
+AIRCRACK_NG_MAKE_OPTS += pcre=false
 endif
 
 # Duplicate -lpthread, because it is also needed by sqlite
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-	AIRCRACK_NG_DEPENDENCIES += sqlite
-	AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_STATIC_LIBS),-lpthread)"
+AIRCRACK_NG_DEPENDENCIES += sqlite
+AIRCRACK_NG_MAKE_OPTS += sqlite=true LIBSQL="-lsqlite3 $(if $(BR2_STATIC_LIBS),-lpthread)"
 else
-	AIRCRACK_NG_MAKE_OPTS += sqlite=false
+AIRCRACK_NG_MAKE_OPTS += sqlite=false
 endif
 
 define AIRCRACK_NG_BUILD_CMDS
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 96ed23e..55b5f07 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -29,44 +29,47 @@ BIND_CONF_OPTS = \
 	--enable-rrl
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-	BIND_CONF_OPTS += --enable-linux-caps
-	BIND_DEPENDENCIES += libcap
+BIND_CONF_OPTS += --enable-linux-caps
+BIND_DEPENDENCIES += libcap
 else
-	BIND_CONF_OPTS += --disable-linux-caps
+BIND_CONF_OPTS += --disable-linux-caps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
-	BIND_DEPENDENCIES += libxml2
+BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
+BIND_DEPENDENCIES += libxml2
 else
-	BIND_CONF_OPTS += --with-libxml2=no
+BIND_CONF_OPTS += --with-libxml2=no
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	BIND_DEPENDENCIES += openssl
-	BIND_CONF_ENV += ac_cv_func_EVP_sha256=yes \
-		ac_cv_func_EVP_sha384=yes ac_cv_func_EVP_sha512=yes
-	BIND_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
-		--with-ecdsa=yes
+BIND_DEPENDENCIES += openssl
+BIND_CONF_ENV += \
+	ac_cv_func_EVP_sha256=yes \
+	ac_cv_func_EVP_sha384=yes \
+	ac_cv_func_EVP_sha512=yes
+BIND_CONF_OPTS += \
+	--with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
+	--with-ecdsa=yes
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-	BIND_CONF_OPTS += --with-gost=yes
+BIND_CONF_OPTS += --with-gost=yes
 else
-	BIND_CONF_OPTS += --with-gost=no
+BIND_CONF_OPTS += --with-gost=no
 endif
 else
-	BIND_CONF_OPTS += --with-openssl=no
+BIND_CONF_OPTS += --with-openssl=no
 endif
 
 # Used by dnssec-checkds and dnssec-coverage
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
-	BIND_CONF_OPTS += --with-python=no
+BIND_CONF_OPTS += --with-python=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	BIND_DEPENDENCIES += readline
+BIND_DEPENDENCIES += readline
 else
-	BIND_CONF_OPTS += --with-readline=no
+BIND_CONF_OPTS += --with-readline=no
 endif
 
 define BIND_TARGET_REMOVE_SERVER
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 27926a8..70a0946 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -19,27 +19,27 @@ BOTAN_CONF_OPTS = \
 	--cc-bin="$(TARGET_CXX)"
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	BOTAN_CONF_OPTS += --disable-shared --no-autoload
+BOTAN_CONF_OPTS += --disable-shared --no-autoload
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-	BOTAN_DEPENDENCIES += bzip2
-	BOTAN_CONF_OPTS += --with-bzip2
+BOTAN_DEPENDENCIES += bzip2
+BOTAN_CONF_OPTS += --with-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-	BOTAN_DEPENDENCIES += gmp
-	BOTAN_CONF_OPTS += --with-gnump
+BOTAN_DEPENDENCIES += gmp
+BOTAN_CONF_OPTS += --with-gnump
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	BOTAN_DEPENDENCIES += openssl
-	BOTAN_CONF_OPTS += --with-openssl
+BOTAN_DEPENDENCIES += openssl
+BOTAN_CONF_OPTS += --with-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	BOTAN_DEPENDENCIES += zlib
-	BOTAN_CONF_OPTS += --with-zlib
+BOTAN_DEPENDENCIES += zlib
+BOTAN_CONF_OPTS += --with-zlib
 endif
 
 define BOTAN_CONFIGURE_CMDS
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 982b7e7..37adc82 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -65,7 +65,7 @@ CAIRO_CONF_ENV = \
 	gl_cv_c_restrict=no
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-	CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
 
 CAIRO_CONF_OPTS = \
@@ -78,97 +78,97 @@ CAIRO_DEPENDENCIES = host-pkgconf fontconfig pixman
 # DirectFB. Break circular dependency by disabling DirectFB support in Cairo
 # (which is experimental)
 ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
-	CAIRO_CONF_OPTS += --enable-directfb
-	CAIRO_DEPENDENCIES += directfb
+CAIRO_CONF_OPTS += --enable-directfb
+CAIRO_DEPENDENCIES += directfb
 else
-	CAIRO_CONF_OPTS += --disable-directfb
+CAIRO_CONF_OPTS += --disable-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-	CAIRO_CONF_OPTS += --enable-ft
-	CAIRO_DEPENDENCIES += freetype
+CAIRO_CONF_OPTS += --enable-ft
+CAIRO_DEPENDENCIES += freetype
 else
-	CAIRO_CONF_OPTS += --disable-ft
+CAIRO_CONF_OPTS += --disable-ft
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	CAIRO_CONF_OPTS += --enable-gobject
-	CAIRO_DEPENDENCIES += libglib2
+CAIRO_CONF_OPTS += --enable-gobject
+CAIRO_DEPENDENCIES += libglib2
 else
-	CAIRO_CONF_OPTS += --disable-gobject
+CAIRO_CONF_OPTS += --disable-gobject
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-	CAIRO_CONF_OPTS += --enable-glesv2
-	CAIRO_DEPENDENCIES += libgles
+CAIRO_CONF_OPTS += --enable-glesv2
+CAIRO_DEPENDENCIES += libgles
 else
-	CAIRO_CONF_OPTS += --disable-glesv2
+CAIRO_CONF_OPTS += --disable-glesv2
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-	CAIRO_CONF_OPTS += --enable-vg
-	CAIRO_DEPENDENCIES += libopenvg
+CAIRO_CONF_OPTS += --enable-vg
+CAIRO_DEPENDENCIES += libopenvg
 else
-	CAIRO_CONF_OPTS += --disable-vg
+CAIRO_CONF_OPTS += --disable-vg
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
-	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
+CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
+CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
+CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
-	CAIRO_CONF_OPTS += --enable-xlib-xrender
-	CAIRO_DEPENDENCIES += xlib_libXrender
+CAIRO_CONF_OPTS += --enable-xlib-xrender
+CAIRO_DEPENDENCIES += xlib_libXrender
 else
-	CAIRO_CONF_OPTS += --disable-xlib-xrender
+CAIRO_CONF_OPTS += --disable-xlib-xrender
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-	CAIRO_CONF_OPTS += --enable-ps
-	CAIRO_DEPENDENCIES += zlib
+CAIRO_CONF_OPTS += --enable-ps
+CAIRO_DEPENDENCIES += zlib
 else
-	CAIRO_CONF_OPTS += --disable-ps
+CAIRO_CONF_OPTS += --disable-ps
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
-	CAIRO_CONF_OPTS += --enable-pdf
-	CAIRO_DEPENDENCIES += zlib
+CAIRO_CONF_OPTS += --enable-pdf
+CAIRO_DEPENDENCIES += zlib
 else
-	CAIRO_CONF_OPTS += --disable-pdf
+CAIRO_CONF_OPTS += --disable-pdf
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-	CAIRO_CONF_OPTS += --enable-png
-	CAIRO_DEPENDENCIES += libpng
+CAIRO_CONF_OPTS += --enable-png
+CAIRO_DEPENDENCIES += libpng
 else
-	CAIRO_CONF_OPTS += --disable-png
+CAIRO_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
-	CAIRO_CONF_OPTS += --enable-script
+CAIRO_CONF_OPTS += --enable-script
 else
-	CAIRO_CONF_OPTS += --disable-script
+CAIRO_CONF_OPTS += --disable-script
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
-	CAIRO_CONF_OPTS += --enable-svg
+CAIRO_CONF_OPTS += --enable-svg
 else
-	CAIRO_CONF_OPTS += --disable-svg
+CAIRO_CONF_OPTS += --disable-svg
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
-	CAIRO_CONF_OPTS += --enable-tee
+CAIRO_CONF_OPTS += --enable-tee
 else
-	CAIRO_CONF_OPTS += --disable-tee
+CAIRO_CONF_OPTS += --disable-tee
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
-	CAIRO_CONF_OPTS += --enable-xml
+CAIRO_CONF_OPTS += --enable-xml
 else
-	CAIRO_CONF_OPTS += --disable-xml
+CAIRO_CONF_OPTS += --disable-xml
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 893b6ae..ac2eaab 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -66,10 +66,10 @@ ccache-stats: host-ccache
 
 ccache-options: host-ccache
 ifeq ($(CCACHE_OPTIONS),)
-	$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
-	$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
-	"(see ccache help text below)"
-	$(Q)echo
+$(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
+$(Q)echo "where 'opts' corresponds to one or more valid ccache options" \
+"(see ccache help text below)"
+$(Q)echo
 endif
-	$(Q)$(CCACHE) $(CCACHE_OPTIONS)
+$(Q)$(CCACHE) $(CCACHE_OPTIONS)
 endif
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 2940a7a..eaa075b 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -16,23 +16,23 @@ CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
 ifneq ($(BR2_LARGEFILE),y)
-	CIVETWEB_COPT += -DSQLITE_DISABLE_LFS
+CIVETWEB_COPT += -DSQLITE_DISABLE_LFS
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	CIVETWEB_CONF_OPTS += WITH_IPV6=1
+CIVETWEB_CONF_OPTS += WITH_IPV6=1
 endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
-	CIVETWEB_CONF_OPTS += WITH_LUA=1
+CIVETWEB_CONF_OPTS += WITH_LUA=1
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	CIVETWEB_COPT += -DNO_SSL_DL
-	CIVETWEB_LIBS += -lssl -lcrypto -lz
-	CIVETWEB_DEPENDENCIES += openssl
+CIVETWEB_COPT += -DNO_SSL_DL
+CIVETWEB_LIBS += -lssl -lcrypto -lz
+CIVETWEB_DEPENDENCIES += openssl
 else
-	CIVETWEB_COPT += -DNO_SSL
+CIVETWEB_COPT += -DNO_SSL
 endif
 
 define CIVETWEB_BUILD_CMDS
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a4b91d6..54a816f 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -131,28 +131,28 @@ COLLECTD_DEPENDENCIES = \
 
 # include/library fixups
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-	COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
+COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
+COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
-	COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
 endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-	COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
+COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
-	COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
+COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
 endif
 
 # network can use libgcrypt
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-	COLLECTD_DEPENDENCIES += libgcrypt
-	COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
-	COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+COLLECTD_DEPENDENCIES += libgcrypt
+COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
+COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
-	COLLECTD_CONF_OPTS += --with-libgcrypt=no
+COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
 
 # released software should not break on minor warnings
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index b6a0663..c028ef4 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -28,27 +28,27 @@ CUPS_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_TIFF),tiff)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	CUPS_CONF_OPTS += --enable-dbus
-	CUPS_DEPENDENCIES += dbus
+CUPS_CONF_OPTS += --enable-dbus
+CUPS_DEPENDENCIES += dbus
 else
-	CUPS_CONF_OPTS += --disable-dbus
+CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-	CUPS_DEPENDENCIES += xlib_libX11
+CUPS_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-	CUPS_CONF_OPTS += --with-python
-	CUPS_DEPENDENCIES += python
+CUPS_CONF_OPTS += --with-python
+CUPS_DEPENDENCIES += python
 else
-	CUPS_CONF_OPTS += --without-python
+CUPS_CONF_OPTS += --without-python
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
-	CUPS_CONF_OPTS += --enable-pdftops
+CUPS_CONF_OPTS += --enable-pdftops
 else
-	CUPS_CONF_OPTS += --disable-pdftops
+CUPS_CONF_OPTS += --disable-pdftops
 endif
 
 # standard autoreconf fails with autoheader failures
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
index 3e31409..37d12e7 100644
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -11,26 +11,33 @@ DBUS_CPP_INSTALL_STAGING = YES
 # expat is required for the tools irrespective of dbus xml backend
 DBUS_CPP_DEPENDENCIES = host-dbus-cpp host-pkgconf dbus expat
 HOST_DBUS_CPP_DEPENDENCIES = host-pkgconf host-dbus host-expat
-DBUS_CPP_CONF_OPTS = --disable-examples --disable-tests --disable-doxygen-docs \
+DBUS_CPP_CONF_OPTS = \
+	--disable-examples \
+	--disable-tests \
+	--disable-doxygen-docs \
 	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)
-HOST_DBUS_CPP_CONF_OPTS = --disable-examples --disable-tests \
-	--disable-doxygen-docs --disable-ecore --disable-glib
+HOST_DBUS_CPP_CONF_OPTS = \
+	--disable-examples \
+	--disable-tests \
+	--disable-doxygen-docs \
+	--disable-ecore \
+	--disable-glib
 DBUS_CPP_AUTORECONF = YES
 DBUS_CPP_LICENSE = LGPLv2.1+
 DBUS_CPP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBECORE),y)
-	DBUS_CPP_CONF_OPTS += --enable-ecore
-	DBUS_CPP_DEPENDENCIES += libecore
+DBUS_CPP_CONF_OPTS += --enable-ecore
+DBUS_CPP_DEPENDENCIES += libecore
 else
-	DBUS_CPP_CONF_OPTS += --disable-ecore
+DBUS_CPP_CONF_OPTS += --disable-ecore
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	DBUS_CPP_CONF_OPTS += --enable-glib
-	DBUS_CPP_DEPENDENCIES += libglib2
+DBUS_CPP_CONF_OPTS += --enable-glib
+DBUS_CPP_DEPENDENCIES += libglib2
 else
-	DBUS_CPP_CONF_OPTS += --disable-glib
+DBUS_CPP_CONF_OPTS += --disable-glib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 5a3405a..6f82090 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -11,15 +11,15 @@ DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2c
 
 ifeq ($(BR2_INET_IPV6),)
-	DHCPCD_CONFIG_OPTS += --disable-ipv6
+DHCPCD_CONFIG_OPTS += --disable-ipv6
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	DHCPCD_CONFIG_OPTS += --enable-static
+DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
 ifeq ($(BR2_USE_MMU),)
-	DHCPCD_CONFIG_OPTS += --disable-fork
+DHCPCD_CONFIG_OPTS += --disable-fork
 endif
 
 define DHCPCD_CONFIGURE_CMDS
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
index d2dc761..4ce63d5 100644
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -16,31 +16,31 @@ DILLO_DEPENDENCIES = fltk zlib \
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	DILLO_CONF_OPTS += --enable-ssl
-	DILLO_DEPENDENCIES += openssl
+DILLO_CONF_OPTS += --enable-ssl
+DILLO_DEPENDENCIES += openssl
 else
-	DILLO_CONF_OPTS += --disable-ssl
+DILLO_CONF_OPTS += --disable-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	DILLO_CONF_OPTS += --enable-png
-	DILLO_DEPENDENCIES += libpng
-	DILLO_CONF_ENV += PNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+DILLO_CONF_OPTS += --enable-png
+DILLO_DEPENDENCIES += libpng
+DILLO_CONF_ENV += PNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
-	DILLO_CONF_OPTS += --disable-png
+DILLO_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	DILLO_CONF_OPTS += --enable-jpeg
-	DILLO_DEPENDENCIES += libjpeg
+DILLO_CONF_OPTS += --enable-jpeg
+DILLO_DEPENDENCIES += libjpeg
 else
-	DILLO_CONF_OPTS += --disable-jpeg
+DILLO_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	DILLO_CONF_OPTS += --enable-threaded-dns
+DILLO_CONF_OPTS += --enable-threaded-dns
 else
-	DILLO_CONF_OPTS += --disable-threaded-dns
+DILLO_CONF_OPTS += --disable-threaded-dns
 endif
 
 $(eval $(autotools-package))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index f848a94..25299be 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -15,35 +15,35 @@ DNSMASQ_LICENSE = Dual GPLv2/GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
 ifneq ($(BR2_INET_IPV6),y)
-	DNSMASQ_COPTS += -DNO_IPV6
+DNSMASQ_COPTS += -DNO_IPV6
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
-	DNSMASQ_COPTS += -DNO_DHCP
+DNSMASQ_COPTS += -DNO_DHCP
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_DNSSEC),y)
-	DNSMASQ_DEPENDENCIES += gmp nettle
-	DNSMASQ_COPTS += -DHAVE_DNSSEC
+DNSMASQ_DEPENDENCIES += gmp nettle
+DNSMASQ_COPTS += -DHAVE_DNSSEC
 ifeq ($(BR2_STATIC_LIBS),y)
-	DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
+DNSMASQ_COPTS += -DHAVE_DNSSEC_STATIC
 endif
 endif
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_TFTP),y)
-	DNSMASQ_COPTS += -DNO_TFTP
+DNSMASQ_COPTS += -DNO_TFTP
 endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
-	DNSMASQ_MAKE_OPTS += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
-	DNSMASQ_COPTS += -DHAVE_IDN
-	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
+DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
+DNSMASQ_MAKE_OPTS += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+DNSMASQ_COPTS += -DHAVE_IDN
+DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
-	DNSMASQ_DEPENDENCIES += libnetfilter_conntrack
+DNSMASQ_DEPENDENCIES += libnetfilter_conntrack
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
@@ -54,11 +54,11 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
-	DNSMASQ_DEPENDENCIES += lua
+DNSMASQ_DEPENDENCIES += lua
 
 # liblua uses dlopen when dynamically linked
 ifneq ($(BR2_STATIC_LIBS),y)
-	DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
+DNSMASQ_MAKE_OPTS += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA
@@ -69,11 +69,11 @@ endef
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-	DNSMASQ_COPTS += -DNO_LARGEFILE
+DNSMASQ_COPTS += -DNO_LARGEFILE
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	DNSMASQ_DEPENDENCIES += dbus
+DNSMASQ_DEPENDENCIES += dbus
 endif
 
 define DNSMASQ_FIX_PKGCONFIG
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 40cda06..88ca55e 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -19,10 +19,10 @@ ECRYPTFS_UTILS_CONF_ENV = \
 	NSS_LIBS="-lnss3"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
-	ECRYPTFS_UTILS_DEPENDENCIES += openssl
+ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
+ECRYPTFS_UTILS_DEPENDENCIES += openssl
 else
-	ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
+ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index c6fdc62..fc2cd41 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -11,9 +11,9 @@ ENSCRIPT_LICENSE_FILES = COPYING
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	ENSCRIPT_CONF_OPTS += --enable-threads=pth
+ENSCRIPT_CONF_OPTS += --enable-threads=pth
 else
-	ENSCRIPT_CONF_OPTS += --disable-threads
+ENSCRIPT_CONF_OPTS += --disable-threads
 endif
 
 $(eval $(autotools-package))
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index f8698a4..828fefe 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -22,7 +22,7 @@ FMLIB_MAKE_OPTS = \
 	PREFIX="$(STAGING_DIR)/usr"
 
 ifeq ($(BR2_powerpc_e500mc),y)
-	FMLIB_ARCHTYPE = ppce500mc
+FMLIB_ARCHTYPE = ppce500mc
 endif
 
 define FMLIB_BUILD_CMDS
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 3ae473f..9818320 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -86,16 +86,16 @@ GDB_CONF_OPTS = \
 	--enable-static
 
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
-	GDB_CONF_OPTS += --enable-tui
+GDB_CONF_OPTS += --enable-tui
 else
-	GDB_CONF_OPTS += --disable-tui
+GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
-	GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
-	GDB_DEPENDENCIES += python
+GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
+GDB_DEPENDENCIES += python
 else
-	GDB_CONF_OPTS += --without-python
+GDB_CONF_OPTS += --without-python
 endif
 
 # This removes some unneeded Python scripts and XML target description
@@ -137,16 +137,16 @@ HOST_GDB_CONF_OPTS = \
 	--disable-sim
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
-	HOST_GDB_CONF_OPTS += --enable-tui
+HOST_GDB_CONF_OPTS += --enable-tui
 else
-	HOST_GDB_CONF_OPTS += --disable-tui
+HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-	HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python2
-	HOST_GDB_DEPENDENCIES += host-python
+HOST_GDB_CONF_OPTS += --with-python=$(HOST_DIR)/usr/bin/python2
+HOST_GDB_DEPENDENCIES += host-python
 else
-	HOST_GDB_CONF_OPTS += --without-python
+HOST_GDB_CONF_OPTS += --without-python
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
diff --git a/package/git/git.mk b/package/git/git.mk
index fc7b6fe..845c24e 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -12,52 +12,53 @@ GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	GIT_DEPENDENCIES += openssl
-	GIT_CONF_OPTS += --with-openssl
-	GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
+GIT_DEPENDENCIES += openssl
+GIT_CONF_OPTS += --with-openssl
+GIT_CONF_ENV_LIBS += $(if $(BR2_STATIC_LIBS),-lz)
 else
-	GIT_CONF_OPTS += --without-openssl
+GIT_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_PERL),y)
-	GIT_DEPENDENCIES += perl
-	GIT_CONF_OPTS += --with-libpcre
+GIT_DEPENDENCIES += perl
+GIT_CONF_OPTS += --with-libpcre
 else
-	GIT_CONF_OPTS += --without-libpcre
+GIT_CONF_OPTS += --without-libpcre
 endif
 
 ifeq ($(BR2_PACKAGE_CURL),y)
-	GIT_DEPENDENCIES += libcurl
-	GIT_CONF_OPTS += --with-curl
+GIT_DEPENDENCIES += libcurl
+GIT_CONF_OPTS += --with-curl
 else
-	GIT_CONF_OPTS += --without-curl
+GIT_CONF_OPTS += --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-	GIT_DEPENDENCIES += expat
-	GIT_CONF_OPTS += --with-expat
+GIT_DEPENDENCIES += expat
+GIT_CONF_OPTS += --with-expat
 else
-	GIT_CONF_OPTS += --without-expat
+GIT_CONF_OPTS += --without-expat
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-	GIT_DEPENDENCIES += libiconv
-	GIT_CONF_ENV_LIBS += -liconv
-	GIT_CONF_OPTS += --with-iconv=/usr/lib
+GIT_DEPENDENCIES += libiconv
+GIT_CONF_ENV_LIBS += -liconv
+GIT_CONF_OPTS += --with-iconv=/usr/lib
 else
-	GIT_CONF_OPTS += --without-iconv
+GIT_CONF_OPTS += --without-iconv
 endif
 
 ifeq ($(BR2_PACKAGE_TCL),y)
-	GIT_DEPENDENCIES += tcl
-	GIT_CONF_OPTS += --with-tcltk
+GIT_DEPENDENCIES += tcl
+GIT_CONF_OPTS += --with-tcltk
 else
-	GIT_CONF_OPTS += --without-tcltk
+GIT_CONF_OPTS += --without-tcltk
 endif
 
 # assume yes for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling
-GIT_CONF_ENV = ac_cv_fread_reads_directories=yes \
+GIT_CONF_ENV = \
+	ac_cv_fread_reads_directories=yes \
 	ac_cv_snprintf_returns_bogus=yes LIBS='$(GIT_CONF_ENV_LIBS)'
 
 $(eval $(autotools-package))
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 0aee991..47c07f9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -36,21 +36,22 @@ GNUTLS_CONF_OPTS += $(if $(BR2_PACKAGE_ZLIB),--with-libz-prefix=$(STAGING_DIR)/u
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
 GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
-GNUTLS_CONF_OPTS += --with-regex-header=pcreposix.h \
+GNUTLS_CONF_OPTS += \
+	--with-regex-header=pcreposix.h \
 	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
 	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
 
 # Consider crywrap as part of tools because it needs WCHAR, and it's so too
 ifeq ($(BR2_PACKAGE_GNUTLS_TOOLS),)
-	GNUTLS_CONF_OPTS += --disable-crywrap
+GNUTLS_CONF_OPTS += --disable-crywrap
 endif
 
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
 GNUTLS_CONF_OPTS += $(if $(BR2_USE_MMU),,--disable-crywrap)
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-	GNUTLS_CONF_OPTS += --enable-cryptodev
-	GNUTLS_DEPENDENCIES += cryptodev-linux
+GNUTLS_CONF_OPTS += --enable-cryptodev
+GNUTLS_DEPENDENCIES += cryptodev-linux
 endif
 
 # Some examples in doc/examples use wchar
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 3e6411b..9623d75 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -24,170 +24,170 @@ GPSD_SCONS_OPTS = \
 	python=no
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-	GPSD_DEPENDENCIES += ncurses
+GPSD_DEPENDENCIES += ncurses
 else
-	GPSD_SCONS_OPTS += ncurses=no
+GPSD_SCONS_OPTS += ncurses=no
 endif
 
 # Disable IPv6, if we don't support it
 ifneq ($(BR2_INET_IPV6),y)
-	GPSD_SCONS_OPTS += ipv6=no
+GPSD_SCONS_OPTS += ipv6=no
 endif
 
 # Build libgpsmm if we've got C++
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	GPSD_LDFLAGS += -lstdc++
-	GPSD_SCONS_OPTS += libgpsmm=yes
+GPSD_LDFLAGS += -lstdc++
+GPSD_SCONS_OPTS += libgpsmm=yes
 else
-	GPSD_SCONS_OPTS += libgpsmm=no
+GPSD_SCONS_OPTS += libgpsmm=no
 endif
 
 # Enable or disable Qt binding
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-	GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
-	GPSD_DEPENDENCIES += qt
+GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
+GPSD_DEPENDENCIES += qt
 else
-	GPSD_SCONS_OPTS += qt=no
+GPSD_SCONS_OPTS += qt=no
 endif
 
 # If libusb is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-	GPSD_DEPENDENCIES += libusb
+GPSD_DEPENDENCIES += libusb
 else
-	GPSD_SCONS_OPTS += usb=no
+GPSD_SCONS_OPTS += usb=no
 endif
 
 # If bluetooth is available build it before so the package can use it
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-	GPSD_DEPENDENCIES += bluez_utils
+GPSD_DEPENDENCIES += bluez_utils
 else
-	GPSD_SCONS_OPTS += bluez=no
+GPSD_SCONS_OPTS += bluez=no
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS_GLIB),y)
-	GPSD_SCONS_OPTS += dbus_export=yes
-	GPSD_DEPENDENCIES += dbus-glib
+GPSD_SCONS_OPTS += dbus_export=yes
+GPSD_DEPENDENCIES += dbus-glib
 endif
 
 # Protocol support
 ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
-	GPSD_SCONS_OPTS += ashtech=no
+GPSD_SCONS_OPTS += ashtech=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_AIVDM),y)
-	GPSD_SCONS_OPTS += aivdm=no
+GPSD_SCONS_OPTS += aivdm=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_EARTHMATE),y)
-	GPSD_SCONS_OPTS += earthmate=no
+GPSD_SCONS_OPTS += earthmate=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_EVERMORE),y)
-	GPSD_SCONS_OPTS += evermore=no
+GPSD_SCONS_OPTS += evermore=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_FURY),y)
-	GPSD_SCONS_OPTS += fury=no
+GPSD_SCONS_OPTS += fury=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_FV18),y)
-	GPSD_SCONS_OPTS += fv18=no
+GPSD_SCONS_OPTS += fv18=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
-	GPSD_SCONS_OPTS += garmin=no
+GPSD_SCONS_OPTS += garmin=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
-	GPSD_SCONS_OPTS += garmintxt=no
+GPSD_SCONS_OPTS += garmintxt=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GEOSTAR),y)
-	GPSD_SCONS_OPTS += geostar=no
+GPSD_SCONS_OPTS += geostar=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
-	GPSD_SCONS_OPTS += gpsclock=no
+GPSD_SCONS_OPTS += gpsclock=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
-	GPSD_SCONS_OPTS += itrax=no
+GPSD_SCONS_OPTS += itrax=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_MTK3301),y)
-	GPSD_SCONS_OPTS += mtk3301=no
+GPSD_SCONS_OPTS += mtk3301=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA),y)
-	GPSD_SCONS_OPTS += nmea=no
+GPSD_SCONS_OPTS += nmea=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NTRIP),y)
-	GPSD_SCONS_OPTS += ntrip=no
+GPSD_SCONS_OPTS += ntrip=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
-	GPSD_SCONS_OPTS += navcom=no
+GPSD_SCONS_OPTS += navcom=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_NMEA2000),y)
-	GPSD_SCONS_OPTS += nmea2000=no
+GPSD_SCONS_OPTS += nmea2000=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
-	GPSD_SCONS_OPTS += oceanserver=no
+GPSD_SCONS_OPTS += oceanserver=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
-	GPSD_SCONS_OPTS += oncore=no
+GPSD_SCONS_OPTS += oncore=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
-	GPSD_SCONS_OPTS += rtcm104v2=no
+GPSD_SCONS_OPTS += rtcm104v2=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
-	GPSD_SCONS_OPTS += rtcm104v3=no
+GPSD_SCONS_OPTS += rtcm104v3=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
-	GPSD_SCONS_OPTS += sirf=no
+GPSD_SCONS_OPTS += sirf=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
-	GPSD_SCONS_OPTS += superstar2=no
+GPSD_SCONS_OPTS += superstar2=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_TRIMBLE_TSIP),y)
-	GPSD_SCONS_OPTS += tsip=no
+GPSD_SCONS_OPTS += tsip=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_TRIPMATE),y)
-	GPSD_SCONS_OPTS += tripmate=no
+GPSD_SCONS_OPTS += tripmate=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
-	GPSD_SCONS_OPTS += tnt=no
+GPSD_SCONS_OPTS += tnt=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
-	GPSD_SCONS_OPTS += ublox=no
+GPSD_SCONS_OPTS += ublox=no
 endif
 
 # Features
 ifneq ($(BR2_PACKAGE_GPSD_NTP_SHM),y)
-	GPSD_SCONS_OPTS += ntpshm=no
+GPSD_SCONS_OPTS += ntpshm=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_PPS),y)
-	GPSD_SCONS_OPTS += pps=no
+GPSD_SCONS_OPTS += pps=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
-	GPSD_SCONS_OPTS += squelch=yes
+GPSD_SCONS_OPTS += squelch=yes
 endif
 ifneq ($(BR2_PACKAGE_GPSD_RECONFIGURE),y)
-	GPSD_SCONS_OPTS += reconfigure=no
+GPSD_SCONS_OPTS += reconfigure=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_CONTROLSEND),y)
-	GPSD_SCONS_OPTS += controlsend=no
+GPSD_SCONS_OPTS += controlsend=no
 endif
 ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
-	GPSD_SCONS_OPTS += oldstyle=no
+GPSD_SCONS_OPTS += oldstyle=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
-	GPSD_SCONS_OPTS += profiling=yes
+GPSD_SCONS_OPTS += profiling=yes
 endif
 ifneq ($(BR2_PACKAGE_GPSD_CLIENT_DEBUG),y)
-	GPSD_SCONS_OPTS += clientdebug=no
+GPSD_SCONS_OPTS += clientdebug=no
 endif
 ifeq ($(BR2_PACKAGE_GPSD_USER),y)
-	GPSD_SCONS_OPTS += gpsd_user=$(BR2_PACKAGE_GPSD_USER_VALUE)
+GPSD_SCONS_OPTS += gpsd_user=$(BR2_PACKAGE_GPSD_USER_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_GROUP),y)
-	GPSD_SCONS_OPTS += gpsd_group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
+GPSD_SCONS_OPTS += gpsd_group=$(BR2_PACKAGE_GPSD_GROUP_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED),y)
-	GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
+GPSD_SCONS_OPTS += fixed_port_speed=$(BR2_PACKAGE_GPSD_FIXED_PORT_SPEED_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_CLIENT),y)
-	GPSD_SCONS_OPTS += limited_max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
+GPSD_SCONS_OPTS += limited_max_clients=$(BR2_PACKAGE_GPSD_MAX_CLIENT_VALUE)
 endif
 ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
-	GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
+GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
 endif
 
 GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)"
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0a1b5a0..cd65575 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -19,31 +19,31 @@ HARFBUZZ_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -pthread"
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
-	HARFBUZZ_DEPENDENCIES += cairo
-	HARFBUZZ_CONF_OPTS += --with-cairo=yes
+HARFBUZZ_DEPENDENCIES += cairo
+HARFBUZZ_CONF_OPTS += --with-cairo=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-cairo=no
+HARFBUZZ_CONF_OPTS += --with-cairo=no
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-	HARFBUZZ_DEPENDENCIES += freetype
-	HARFBUZZ_CONF_OPTS += --with-freetype=yes
+HARFBUZZ_DEPENDENCIES += freetype
+HARFBUZZ_CONF_OPTS += --with-freetype=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-freetype=no
+HARFBUZZ_CONF_OPTS += --with-freetype=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	HARFBUZZ_DEPENDENCIES += libglib2
-	HARFBUZZ_CONF_OPTS += --with-glib=yes
+HARFBUZZ_DEPENDENCIES += libglib2
+HARFBUZZ_CONF_OPTS += --with-glib=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-glib=no
+HARFBUZZ_CONF_OPTS += --with-glib=no
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
-	HARFBUZZ_DEPENDENCIES += icu
-	HARFBUZZ_CONF_OPTS += --with-icu=yes
+HARFBUZZ_DEPENDENCIES += icu
+HARFBUZZ_CONF_OPTS += --with-icu=yes
 else
-	HARFBUZZ_CONF_OPTS += --with-icu=no
+HARFBUZZ_CONF_OPTS += --with-icu=no
 endif
 
 $(eval $(autotools-package))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 05a1a2a..93d64c8 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -11,16 +11,16 @@ HASERL_LICENSE_FILES = COPYING
 HASERL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
-	HASERL_CONF_OPTS += --with-lua
-	HASERL_DEPENDENCIES += lua
+HASERL_CONF_OPTS += --with-lua
+HASERL_DEPENDENCIES += lua
 
 # liblua uses dlopen when dynamically linked
 ifneq ($(BR2_STATIC_LIBS),y)
-	HASERL_CONF_ENV += LIBS="-ldl"
+HASERL_CONF_ENV += LIBS="-ldl"
 endif
 
 else
-	HASERL_CONF_OPTS += --without-lua
+HASERL_CONF_OPTS += --without-lua
 endif
 
 define HASERL_REMOVE_EXAMPLES
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8927dbf..a933d79 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -36,35 +36,35 @@ HOSTAPD_LIBS += -lnl-3 -lm -lpthread
 endif
 
 ifeq ($(BR2_INET_IPV6),)
-	HOSTAPD_CONFIG_DISABLE += CONFIG_IPV6
+HOSTAPD_CONFIG_DISABLE += CONFIG_IPV6
 endif
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	HOSTAPD_DEPENDENCIES += openssl
-	HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
-	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
+HOSTAPD_DEPENDENCIES += openssl
+HOSTAPD_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
+HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
-	HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
+HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
+HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_EAP),y)
-	HOSTAPD_CONFIG_ENABLE += \
-		CONFIG_EAP \
-		CONFIG_RADIUS_SERVER \
+HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_EAP \
+	CONFIG_RADIUS_SERVER \
 
-	# Enable both TLS v1.1 (CONFIG_TLSV11) and v1.2 (CONFIG_TLSV12)
-	HOSTAPD_CONFIG_ENABLE += CONFIG_TLSV1
+# Enable both TLS v1.1 (CONFIG_TLSV11) and v1.2 (CONFIG_TLSV12)
+HOSTAPD_CONFIG_ENABLE += CONFIG_TLSV1
 else
-	HOSTAPD_CONFIG_DISABLE += CONFIG_EAP
-	HOSTAPD_CONFIG_ENABLE += \
-		CONFIG_NO_ACCOUNTING \
-		CONFIG_NO_RADIUS
+HOSTAPD_CONFIG_DISABLE += CONFIG_EAP
+HOSTAPD_CONFIG_ENABLE += \
+	CONFIG_NO_ACCOUNTING \
+	CONFIG_NO_RADIUS
 endif
 
 ifeq ($(BR2_PACKAGE_HOSTAPD_WPS),y)
-	HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
+HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
 endif
 
 define HOSTAPD_CONFIGURE_CMDS
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 99c5930..2cdddca 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -30,10 +30,10 @@ HPLIP_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	HPLIP_CONF_OPTS += --enable-dbus-build
-	HPLIP_DEPENDENCIES += dbus
+HPLIP_CONF_OPTS += --enable-dbus-build
+HPLIP_DEPENDENCIES += dbus
 else
-	HPLIP_CONF_OPTS += --disable-dbus-build
+HPLIP_CONF_OPTS += --disable-dbus-build
 endif
 
 define HPLIP_POST_INSTALL_TARGET_FIXUP
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 6b6141e..9f0feba 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -17,7 +17,7 @@ IFPLUGD_DEPENDENCIES = libdaemon
 
 # Prefer big ifplugd
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	IFPLUGD_DEPENDENCIES += busybox
+IFPLUGD_DEPENDENCIES += busybox
 endif
 
 define IFPLUGD_INSTALL_FIXUP
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index 0378429..4dcbdb5 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -17,45 +17,45 @@ IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 IMLIB2_CONFIG_SCRIPTS = imlib2-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
-	IMLIB2_CONF_OPTS += --with-x
-	IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext
+IMLIB2_CONF_OPTS += --with-x
+IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	IMLIB2_CONF_OPTS += --without-x
+IMLIB2_CONF_OPTS += --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_JPEG),y)
-	IMLIB2_CONF_OPTS += --with-jpeg
-	IMLIB2_DEPENDENCIES += jpeg
+IMLIB2_CONF_OPTS += --with-jpeg
+IMLIB2_DEPENDENCIES += jpeg
 else
-	IMLIB2_CONF_OPTS += --without-jpeg
+IMLIB2_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_PNG),y)
-	IMLIB2_CONF_OPTS += --with-png
-	IMLIB2_DEPENDENCIES += libpng
+IMLIB2_CONF_OPTS += --with-png
+IMLIB2_DEPENDENCIES += libpng
 else
-	IMLIB2_CONF_OPTS += --without-png
+IMLIB2_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_GIF),y)
-	IMLIB2_CONF_OPTS += --with-gif
-	IMLIB2_DEPENDENCIES += giflib
+IMLIB2_CONF_OPTS += --with-gif
+IMLIB2_DEPENDENCIES += giflib
 else
-	IMLIB2_CONF_OPTS += --without-gif
+IMLIB2_CONF_OPTS += --without-gif
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_TIFF),y)
-	IMLIB2_CONF_OPTS += --with-tiff
-	IMLIB2_DEPENDENCIES += tiff
+IMLIB2_CONF_OPTS += --with-tiff
+IMLIB2_DEPENDENCIES += tiff
 else
-	IMLIB2_CONF_OPTS += --without-tiff
+IMLIB2_CONF_OPTS += --without-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_ID3),y)
-	IMLIB2_CONF_OPTS += --with-id3
-	IMLIB2_DEPENDENCIES += libid3tag
+IMLIB2_CONF_OPTS += --with-id3
+IMLIB2_DEPENDENCIES += libid3tag
 else
-	IMLIB2_CONF_OPTS += --without-id3
+IMLIB2_CONF_OPTS += --without-id3
 endif
 
 # drop -L<dir> from linker flags
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 117d182..56f6247 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -20,21 +20,21 @@ KISMET_CONF_ENV = LIBS="-lpcap $(shell $(STAGING_DIR)/usr/bin/pcap-config --stat
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	KISMET_DEPENDENCIES += pcre
+KISMET_DEPENDENCIES += pcre
 endif
 
 ifeq ($(BR2_PACKAGE_KISMET_CLIENT),y)
-	KISMET_TARGET_BINARIES += kismet_client
+KISMET_TARGET_BINARIES += kismet_client
 endif
 
 ifeq ($(BR2_PACKAGE_KISMET_SERVER),y)
-	KISMET_TARGET_BINARIES += kismet_server
-	KISMET_TARGET_CONFIGS += kismet.conf
+KISMET_TARGET_BINARIES += kismet_server
+KISMET_TARGET_CONFIGS += kismet.conf
 endif
 
 ifeq ($(BR2_PACKAGE_KISMET_DRONE),y)
-	KISMET_TARGET_BINARIES += kismet_drone
-	KISMET_TARGET_CONFIGS += kismet_drone.conf
+KISMET_TARGET_BINARIES += kismet_drone
+KISMET_TARGET_CONFIGS += kismet_drone.conf
 endif
 
 ifdef KISMET_TARGET_BINARIES
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 42b2669..1798123 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -13,24 +13,24 @@ LCMS2_INSTALL_STAGING = YES
 LCMS2_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	LCMS2_CONF_OPTS += --with-jpeg
-	LCMS2_DEPENDENCIES += jpeg
+LCMS2_CONF_OPTS += --with-jpeg
+LCMS2_DEPENDENCIES += jpeg
 else
-	LCMS2_CONF_OPTS += --without-jpeg
+LCMS2_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-	LCMS2_CONF_OPTS += --with-tiff
-	LCMS2_DEPENDENCIES += tiff
+LCMS2_CONF_OPTS += --with-tiff
+LCMS2_DEPENDENCIES += tiff
 else
-	LCMS2_CONF_OPTS += --without-tiff
+LCMS2_CONF_OPTS += --without-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	LCMS2_CONF_OPTS += --with-zlib
-	LCMS2_DEPENDENCIES += zlib
+LCMS2_CONF_OPTS += --with-zlib
+LCMS2_DEPENDENCIES += zlib
 else
-	LCMS2_CONF_OPTS += --without-zlib
+LCMS2_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index b53f21c..be95b85 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -13,19 +13,19 @@ LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-	LIBBLURAY_DEPENDENCIES += libiconv
+LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-	LIBBLURAY_DEPENDENCIES += freetype
+LIBBLURAY_DEPENDENCIES += freetype
 else
-	LIBBLURAY_CONF_OPTS += --without-freetype
+LIBBLURAY_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	LIBBLURAY_DEPENDENCIES += libxml2
+LIBBLURAY_DEPENDENCIES += libxml2
 else
-	LIBBLURAY_CONF_OPTS += --without-libxml2
+LIBBLURAY_CONF_OPTS += --without-libxml2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 512dac8..54844f8 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -14,10 +14,10 @@ LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
-	LIBCAP_DEPENDENCIES += attr
-	LIBCAP_HAVE_LIBATTR = yes
+LIBCAP_DEPENDENCIES += attr
+LIBCAP_HAVE_LIBATTR = yes
 else
-	LIBCAP_HAVE_LIBATTR = no
+LIBCAP_HAVE_LIBATTR = no
 endif
 
 # we don't have host-attr
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 9dea180..ace2744 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -25,10 +25,10 @@ LIBCGROUP_CONF_OPTS = \
 	--disable-initscript-install
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-	LIBCGROUP_DEPENDENCIES += linux-pam
-	LIBCGROUP_CONF_OPTS += --enable-pam
+LIBCGROUP_DEPENDENCIES += linux-pam
+LIBCGROUP_CONF_OPTS += --enable-pam
 else
-	LIBCGROUP_CONF_OPTS += --disable-pam
+LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index e2a4b39..57c5ab1 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -21,7 +21,7 @@ LIBGCRYPT_CONF_OPTS = \
 
 # Code doesn't build in thumb mode
 ifeq ($(BR2_arm),y)
-	LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
+LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
 endif
 
 # Tests use fork()
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2476698..5ef1174 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -15,37 +15,67 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
 LIBGLIB2_CONF_ENV = \
-	ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
-	glib_cv_uscore=no ac_cv_func_strtod=yes \
-	ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
-	ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
-	ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
-	ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
-	ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
-	ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
-	ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-	ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
-	vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
-	jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
-	ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
-	ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
-	ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
-	ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
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
 	utils_cv_func_mkdir_trailing_slash_bug=no \
 	jm_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
-	utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
-	gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
-	gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
-	am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
-	gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
-	ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
-	ac_use_included_regex=no gl_cv_c_restrict=no \
-	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-	ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
-	ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
-	ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
-	ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
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
+	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal \
+	ac_cv_prog_F77=no \
+	ac_cv_func_posix_getgrgid_r=no \
+	glib_cv_long_long_format=ll \
+	ac_cv_func_printf_unix98=yes \
+	ac_cv_func_vsnprintf_c99=yes \
+	ac_cv_func_newlocale=no \
+	ac_cv_func_uselocale=no \
+	ac_cv_func_strtod_l=no \
+	ac_cv_func_strtoll_l=no \
+	ac_cv_func_strtoull_l=no \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
@@ -63,7 +93,7 @@ HOST_LIBGLIB2_CONF_OPTS = \
 
 LIBGLIB2_CONF_OPTS += --disable-modular-tests
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-	LIBGLIB2_CONF_OPTS += --with-threads=none --disable-threads
+LIBGLIB2_CONF_OPTS += --with-threads=none --disable-threads
 endif
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index f5e3d16..ee5362d 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -26,22 +26,22 @@ define LIBPLAYER_CONFIGURE_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_MPLAYER),y)
-	LIBPLAYER_DEPENDENCIES += mplayer
-	LIBPLAYER_CONF_OPTS += --enable-mplayer
+LIBPLAYER_DEPENDENCIES += mplayer
+LIBPLAYER_CONF_OPTS += --enable-mplayer
 else
-	LIBPLAYER_CONF_OPTS += --disable-mplayer
+LIBPLAYER_CONF_OPTS += --disable-mplayer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
-	LIBPLAYER_DEPENDENCIES += gstreamer
-	LIBPLAYER_CONF_OPTS += --enable-gstreamer
+LIBPLAYER_DEPENDENCIES += gstreamer
+LIBPLAYER_CONF_OPTS += --enable-gstreamer
 else
-	LIBPLAYER_CONF_OPTS += --disable-gstreamer
+LIBPLAYER_CONF_OPTS += --disable-gstreamer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
-	LIBPLAYER_DEPENDENCIES += python
-	LIBPLAYER_CONF_OPTS += --enable-binding-python
+LIBPLAYER_DEPENDENCIES += python
+LIBPLAYER_CONF_OPTS += --enable-binding-python
 endif
 
 $(eval $(autotools-package))
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 3dce25c..26b627e 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -22,8 +22,8 @@ LINUX_PAM_LICENSE = BSD-3c
 LINUX_PAM_LICENSE_FILES = Copyright
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-	LINUX_PAM_DEPENDENCIES += gettext
-	LINUX_PAM_MAKE_OPTS += LIBS=-lintl
+LINUX_PAM_DEPENDENCIES += gettext
+LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
 # Install default pam config (deny everything)
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index bb5741d..9fbeabe 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -27,35 +27,35 @@ LUA_PROVIDES = luainterpreter
 LUA_CFLAGS = -Wall -fPIC -DLUA_USE_POSIX
 
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
-	LUA_CFLAGS += -DLUA_COMPAT_ALL
+LUA_CFLAGS += -DLUA_COMPAT_ALL
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-	LUA_CFLAGS += -DLUA_COMPAT_5_2
+LUA_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	LUA_BUILDMODE = static
+LUA_BUILDMODE = static
 else
-	LUA_BUILDMODE = dynamic
-	LUA_CFLAGS += -DLUA_USE_DLOPEN
-	LUA_MYLIBS += -ldl
+LUA_BUILDMODE = dynamic
+LUA_CFLAGS += -DLUA_USE_DLOPEN
+LUA_MYLIBS += -ldl
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_READLINE),y)
-	LUA_DEPENDENCIES = readline ncurses
-	LUA_MYLIBS += -lreadline -lhistory -lncurses
-	LUA_CFLAGS += -DLUA_USE_READLINE
+LUA_DEPENDENCIES = readline ncurses
+LUA_MYLIBS += -lreadline -lhistory -lncurses
+LUA_CFLAGS += -DLUA_USE_READLINE
 else
 ifeq ($(BR2_PACKAGE_LUA_LINENOISE),y)
-	LUA_DEPENDENCIES = linenoise
-	LUA_MYLIBS += -llinenoise
-	LUA_CFLAGS += -DLUA_USE_LINENOISE
+LUA_DEPENDENCIES = linenoise
+LUA_MYLIBS += -llinenoise
+LUA_CFLAGS += -DLUA_USE_LINENOISE
 endif
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-	LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
+LUA_CFLAGS += -D_FILE_OFFSET_BITS=32
 endif
 
 ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 12a1f08..7216620 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -15,7 +15,7 @@ LUAROCKS_CONFIG_DIR = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 LUAROCKS_CFLAGS = $(TARGET_CFLAGS) -fPIC
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-	LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
+LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 HOST_LUAROCKS_CONF_OPTS = \
diff --git a/package/make/make.mk b/package/make/make.mk
index 6e7a8f1..ebfa2f0 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -13,7 +13,7 @@ MAKE_LICENSE_FILES = COPYING
 
 # Disable the 'load' operation for static builds since it needs dlopen
 ifeq ($(BR2_STATIC_LIBS),y)
-	MAKE_CONF_OPTS += --disable-load
+MAKE_CONF_OPTS += --disable-load
 endif
 
 ifeq ($(BR2_PACKAGE_GUILE),y)
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index e8aefb4..3eeb475 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,17 +13,17 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
 MODEM_MANAGER_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
-	MODEM_MANAGER_DEPENDENCIES += libqmi
-	MODEM_MANAGER_CONF_OPTS += --with-qmi
+MODEM_MANAGER_DEPENDENCIES += libqmi
+MODEM_MANAGER_CONF_OPTS += --with-qmi
 else
-	MODEM_MANAGER_CONF_OPTS += --without-qmi
+MODEM_MANAGER_CONF_OPTS += --without-qmi
 endif
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
-	MODEM_MANAGER_DEPENDENCIES += libmbim
-	MODEM_MANAGER_CONF_OPTS += --with-mbim
+MODEM_MANAGER_DEPENDENCIES += libmbim
+MODEM_MANAGER_CONF_OPTS += --with-mbim
 else
-	MODEM_MANAGER_CONF_OPTS += --without-mbim
+MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
 $(eval $(autotools-package))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0bd894f..58ee370 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -12,20 +12,20 @@ NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
-	NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
-	NANO_MAKE_ENV += CURSES_LIB="-lncurses"
+NANO_CONF_ENV += ac_cv_prog_NCURSESW_CONFIG=false
+NANO_MAKE_ENV += CURSES_LIB="-lncurses"
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
-	NANO_DEPENDENCIES += file
+NANO_DEPENDENCIES += file
 else
-	NANO_CONF_ENV += ac_cv_lib_magic_magic_open=no
+NANO_CONF_ENV += ac_cv_lib_magic_magic_open=no
 endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
-	NANO_CONF_OPTS += --enable-tiny
+NANO_CONF_OPTS += --enable-tiny
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index f561363..7e1857b 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -19,10 +19,10 @@ NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no
 endif
 
 ifneq ($(BR2_NBD_CLIENT),y)
-	NBD_TOREMOVE += nbd-client
+NBD_TOREMOVE += nbd-client
 endif
 ifneq ($(BR2_NBD_SERVER),y)
-	NBD_TOREMOVE += nbd-server
+NBD_TOREMOVE += nbd-server
 endif
 
 define NBD_CLEANUP_AFTER_INSTALL
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 76d3bce..28b03b8 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -23,26 +23,26 @@ endef
 NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
 
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
-	NCFTP_TARGET_BINS += ncftpget
+NCFTP_TARGET_BINS += ncftpget
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_PUT),y)
-	NCFTP_TARGET_BINS += ncftpput
+NCFTP_TARGET_BINS += ncftpput
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_LS),y)
-	NCFTP_TARGET_BINS += ncftpls
+NCFTP_TARGET_BINS += ncftpls
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BATCH),y)
-	NCFTP_TARGET_BINS += ncftpbatch
-	NCFTP_INSTALL_NCFTP_BATCH = \
-		ln -sf /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
+NCFTP_TARGET_BINS += ncftpbatch
+NCFTP_INSTALL_NCFTP_BATCH = \
+	ln -sf /usr/bin/ncftpbatch $(TARGET_DIR)/usr/bin/ncftpspooler
 endif
 
 ifeq ($(BR2_PACKAGE_NCFTP_BOOKMARKS),y)
-	NCFTP_TARGET_BINS += ncftpbookmarks
-	NCFTP_DEPENDENCIES += ncurses
+NCFTP_TARGET_BINS += ncftpbookmarks
+NCFTP_DEPENDENCIES += ncurses
 endif
 
 define NCFTP_INSTALL_TARGET_CMDS
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 66ee96a..8368c69 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -32,7 +32,7 @@ NCURSES_CONF_OPTS = \
 
 # Install after busybox for the full-blown versions
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	NCURSES_DEPENDENCIES += busybox
+NCURSES_DEPENDENCIES += busybox
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
@@ -174,7 +174,8 @@ define HOST_NCURSES_BUILD_CMDS
 endef
 
 HOST_NCURSES_CONF_OPTS = \
-	--with-shared --without-gpm \
+	--with-shared \
+	--without-gpm \
 	--without-manpages \
 	--without-cxx \
 	--without-cxx-binding \
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 0cf1ed6..fc92421 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -15,7 +15,7 @@ NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
 NEARD_CONF_OPTS = --disable-traces
 
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
-	NEARD_CONF_OPTS += --enable-tools
+NEARD_CONF_OPTS += --enable-tools
 endif
 
 define NEARD_INSTALL_INIT_SYSV
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index cbbc628..382c42e 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -26,7 +26,7 @@ define NEARDAL_INSTALL_NCL
 endef
 
 ifeq ($(BR2_PACKAGE_NEARDAL_NCL),y)
-	NEARDAL_POST_INSTALL_TARGET_HOOKS += NEARDAL_INSTALL_NCL
+NEARDAL_POST_INSTALL_TARGET_HOOKS += NEARDAL_INSTALL_NCL
 endif
 
 $(eval $(autotools-package))
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index a2abf5b..ee69648 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -14,7 +14,7 @@ NET_TOOLS_LICENSE_FILES = COPYING
 
 # Install after busybox for the full-blown versions
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	NET_TOOLS_DEPENDENCIES += busybox
+NET_TOOLS_DEPENDENCIES += busybox
 endif
 
 define NET_TOOLS_CONFIGURE_CMDS
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 725c33f..a882b3c 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -18,7 +18,8 @@ NETATALK_LICENSE_FILES = COPYING COPYRIGHT
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
 	ac_cv_path_NETA_LDCONFIG=""
-NETATALK_CONF_OPTS += --with-cnid-cdb-backend \
+NETATALK_CONF_OPTS += \
+	--with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
@@ -31,24 +32,24 @@ NETATALK_CONF_OPTS += --with-cnid-cdb-backend \
 	--with-mysql-config=no
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-	NETATALK_DEPENDENCIES += acl
+NETATALK_DEPENDENCIES += acl
 else
-	NETATALK_CONF_OPTS += --with-acls=no
+NETATALK_CONF_OPTS += --with-acls=no
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
-	NETATALK_DEPENDENCIES += avahi
-	NETATALK_CONF_OPTS += --enable-zeroconf=$(STAGING_DIR)/usr
+NETATALK_DEPENDENCIES += avahi
+NETATALK_CONF_OPTS += --enable-zeroconf=$(STAGING_DIR)/usr
 else
-	NETATALK_CONF_OPTS += --disable-zeroconf
+NETATALK_CONF_OPTS += --disable-zeroconf
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-	NETATALK_DEPENDENCIES += cups
-	NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
-	NETATALK_CONF_OPTS += --enable-cups
+NETATALK_DEPENDENCIES += cups
+NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
+NETATALK_CONF_OPTS += --enable-cups
 else
-	NETATALK_CONF_OPTS += --disable-cups
+NETATALK_CONF_OPTS += --disable-cups
 endif
 
 define NETATALK_INSTALL_INIT_SYSV
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 279a93d..f747011 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,45 +40,45 @@ NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
-	NETSNMP_CONF_OPTS += --with-endianness=big
+NETSNMP_CONF_OPTS += --with-endianness=big
 else
-	NETSNMP_CONF_OPTS += --with-endianness=little
+NETSNMP_CONF_OPTS += --with-endianness=little
 endif
 
 # OpenSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	NETSNMP_DEPENDENCIES += openssl
-	NETSNMP_CONF_OPTS += \
-		--with-openssl=$(STAGING_DIR)/usr/include/openssl
+NETSNMP_DEPENDENCIES += openssl
+NETSNMP_CONF_OPTS += \
+	--with-openssl=$(STAGING_DIR)/usr/include/openssl
 ifeq ($(BR2_STATIC_LIBS),y)
-	# openssl uses zlib, so we need to explicitly link with it when static
-	NETSNMP_CONF_ENV += LIBS=-lz
+# openssl uses zlib, so we need to explicitly link with it when static
+NETSNMP_CONF_ENV += LIBS=-lz
 endif
 else ifeq ($(BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL),y)
-	NETSNMP_CONF_OPTS += --with-openssl=internal
+NETSNMP_CONF_OPTS += --with-openssl=internal
 else
-	NETSNMP_CONF_OPTS += --without-openssl
+NETSNMP_CONF_OPTS += --without-openssl
 endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
-	NETSNMP_CONF_OPTS += --disable-mib-loading
-	NETSNMP_CONF_OPTS += --disable-mibs
+NETSNMP_CONF_OPTS += --disable-mib-loading
+NETSNMP_CONF_OPTS += --disable-mibs
 endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
-	NETSNMP_CONF_OPTS += --disable-debugging
+NETSNMP_CONF_OPTS += --disable-debugging
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP_SERVER),y)
-	NETSNMP_CONF_OPTS += --enable-agent
+NETSNMP_CONF_OPTS += --enable-agent
 else
-	NETSNMP_CONF_OPTS += --disable-agent
+NETSNMP_CONF_OPTS += --disable-agent
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP_CLIENTS),y)
-	NETSNMP_CONF_OPTS += --enable-applications
+NETSNMP_CONF_OPTS += --enable-applications
 else
-	NETSNMP_CONF_OPTS += --disable-applications
+NETSNMP_CONF_OPTS += --disable-applications
 endif
 
 # Remove IPv6 MIBs if there's no IPv6
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3615c89..937a446 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -35,24 +35,24 @@ NETWORK_MANAGER_CONF_OPTS = \
 	--disable-ifnet
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
-	NETWORK_MANAGER_DEPENDENCIES += newt
-	NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
+NETWORK_MANAGER_DEPENDENCIES += newt
+NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
 else
-	NETWORK_MANAGER_CONF_OPTS += --with-nmtui=no
+NETWORK_MANAGER_CONF_OPTS += --with-nmtui=no
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
-	NETWORK_MANAGER_DEPENDENCIES += pppd
-	NETWORK_MANAGER_CONF_OPTS += --enable-ppp
+NETWORK_MANAGER_DEPENDENCIES += pppd
+NETWORK_MANAGER_CONF_OPTS += --enable-ppp
 else
-	NETWORK_MANAGER_CONF_OPTS += --disable-ppp
+NETWORK_MANAGER_CONF_OPTS += --disable-ppp
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
-	NETWORK_MANAGER_DEPENDENCIES += modem-manager
-	NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
+NETWORK_MANAGER_DEPENDENCIES += modem-manager
+NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
 else
-	NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
+NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e8a2c27..5ee7714 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -14,7 +14,7 @@ NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled c
 NODEJS_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	NODEJS_DEPENDENCIES += openssl
+NODEJS_DEPENDENCIES += openssl
 endif
 
 # nodejs build system is based on python, but only support python-2.6 or
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index cabbe12..708e590 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -14,22 +14,22 @@ NTFS_3G_LICENSE = GPLv2+ LGPLv2+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-	NTFS_3G_CONF_OPTS += --with-fuse=external
-	NTFS_3G_DEPENDENCIES += libfuse
+NTFS_3G_CONF_OPTS += --with-fuse=external
+NTFS_3G_DEPENDENCIES += libfuse
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-	NTFS_3G_DEPENDENCIES += util-linux
+NTFS_3G_DEPENDENCIES += util-linux
 endif
 
 ifeq ($(BR2_PACKAGE_NTFS_3G_ENCRYPTED),y)
-	NTFS_3G_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-	NTFS_3G_CONF_OPTS += --enable-crypto
-	NTFS_3G_DEPENDENCIES += gnutls libgcrypt
+NTFS_3G_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+NTFS_3G_CONF_OPTS += --enable-crypto
+NTFS_3G_DEPENDENCIES += gnutls libgcrypt
 endif
 
 ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
-	NTFS_3G_CONF_OPTS += --disable-ntfsprogs
+NTFS_3G_CONF_OPTS += --disable-ntfsprogs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 36dea79..bf2cdbd 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -19,29 +19,29 @@ NTP_CONF_OPTS = \
 	--disable-local-libevent
 
 ifneq ($(BR2_INET_IPV6),y)
-	NTP_CONF_ENV += isc_cv_have_in6addr_any=no
+NTP_CONF_ENV += isc_cv_have_in6addr_any=no
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	NTP_CONF_OPTS += --with-crypto
-	NTP_DEPENDENCIES += openssl
+NTP_CONF_OPTS += --with-crypto
+NTP_DEPENDENCIES += openssl
 else
-	NTP_CONF_OPTS += --without-crypto --disable-openssl-random
+NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPSNMPD),y)
-	NTP_CONF_OPTS += \
-		--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
-	NTP_DEPENDENCIES += netsnmp
+NTP_CONF_OPTS += \
+	--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
+NTP_DEPENDENCIES += netsnmp
 else
-	NTP_CONF_OPTS += --without-ntpsnmpd
+NTP_CONF_OPTS += --without-ntpsnmpd
 endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPD_ATOM_PPS),y)
-	NTP_CONF_OPTS += --enable-ATOM
-	NTP_DEPENDENCIES += pps-tools
+NTP_CONF_OPTS += --enable-ATOM
+NTP_DEPENDENCIES += pps-tools
 else
-	NTP_CONF_OPTS += --disable-ATOM
+NTP_CONF_OPTS += --disable-ATOM
 endif
 
 define NTP_PATCH_FIXUPS
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index caf6aab..98e2fbc 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -27,17 +27,17 @@ define OFONO_INSTALL_INIT_SYSV
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-	OFONO_CONF_OPTS += --enable-udev
-	OFONO_DEPENDENCIES += udev
+OFONO_CONF_OPTS += --enable-udev
+OFONO_DEPENDENCIES += udev
 else
-	OFONO_CONF_OPTS += --disable-udev
+OFONO_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-	OFONO_CONF_OPTS += --enable-bluetooth
-	OFONO_DEPENDENCIES += bluez_utils
+OFONO_CONF_OPTS += --enable-bluetooth
+OFONO_DEPENDENCIES += bluez_utils
 else
-	OFONO_CONF_OPTS += --disable-bluetooth
+OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
 $(eval $(autotools-package))
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index db91e50..73db2a0 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -17,10 +17,10 @@ OPEN2300_CFLAGS = $(TARGET_CFLAGS)
 OPEN2300_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	OPEN2300_DEPENDENCIES += mysql
-	OPEN2300_BINS += mysql2300 mysqlhistlog2300
-	OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
-	OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
+OPEN2300_DEPENDENCIES += mysql
+OPEN2300_BINS += mysql2300 mysqlhistlog2300
+OPEN2300_CFLAGS += -I$(STAGING_DIR)/usr/include/mysql
+OPEN2300_LDFLAGS += -L$(STAGING_DIR)/usr/lib/mysql -lmysqlclient
 endif
 
 define OPEN2300_BUILD_CMDS
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 5ed59c0..f90c811 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -23,38 +23,38 @@ OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
 endif
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-	OPENSSL_DEPENDENCIES += cryptodev-linux
+OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
+OPENSSL_DEPENDENCIES += cryptodev-linux
 endif
 
 ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-	OPENSSL_DEPENDENCIES += ocf-linux
+OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
+OPENSSL_DEPENDENCIES += ocf-linux
 endif
 
 # Some architectures are optimized in OpenSSL
 ifeq ($(ARCH),arm)
-	OPENSSL_TARGET_ARCH = armv4
+OPENSSL_TARGET_ARCH = armv4
 endif
 ifeq ($(ARCH),powerpc)
 # 4xx cores seem to have trouble with openssl's ASM optimizations
 ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)$(BR2_powerpc_440)$(BR2_powerpc_440fp),)
-	OPENSSL_TARGET_ARCH = ppc
+OPENSSL_TARGET_ARCH = ppc
 endif
 endif
 ifeq ($(ARCH),powerpc64)
-	OPENSSL_TARGET_ARCH = ppc64
+OPENSSL_TARGET_ARCH = ppc64
 endif
 ifeq ($(ARCH),powerpc64le)
-	OPENSSL_TARGET_ARCH = ppc64le
+OPENSSL_TARGET_ARCH = ppc64le
 endif
 ifeq ($(ARCH),x86_64)
-	OPENSSL_TARGET_ARCH = x86_64
+OPENSSL_TARGET_ARCH = x86_64
 endif
 
 # Workaround for bug #3445
 ifeq ($(BR2_x86_i386),y)
-	OPENSSL_TARGET_ARCH = generic32 386
+OPENSSL_TARGET_ARCH = generic32 386
 endif
 
 define HOST_OPENSSL_CONFIGURE_CMDS
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 863d1f4..335a72a 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -16,15 +16,15 @@ OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-	OPENSWAN_DEPENDENCIES += libcurl
-	OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
+OPENSWAN_DEPENDENCIES += libcurl
+OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	OPENSWAN_DEPENDENCIES += openssl
-	OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
+OPENSWAN_DEPENDENCIES += openssl
+OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
 ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
-	OPENSWAN_MAKE_OPTS += HAVE_OCF=true
+OPENSWAN_MAKE_OPTS += HAVE_OCF=true
 endif
 endif
 
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3854b23..74e5783 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -10,14 +10,18 @@ OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPLv2
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
-OPENVPN_CONF_OPTS = --disable-plugin-auth-pam --enable-iproute2 \
+OPENVPN_CONF_OPTS = \
+	--disable-plugin-auth-pam \
+	--enable-iproute2 \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
 	ROUTE=/sbin/route
 
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
-OPENVPN_CONF_OPTS += --enable-small --disable-plugins \
+OPENVPN_CONF_OPTS += \
+	--enable-small \
+	--disable-plugins \
 	--disable-eurephia
 endif
 
@@ -32,19 +36,19 @@ OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
-	OPENVPN_DEPENDENCIES += lzo
+OPENVPN_DEPENDENCIES += lzo
 else
-	OPENVPN_CONF_OPTS += --disable-lzo
+OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
-	OPENVPN_CONF_OPTS += --with-crypto-library=openssl
-	OPENVPN_DEPENDENCIES += openssl
+OPENVPN_CONF_OPTS += --with-crypto-library=openssl
+OPENVPN_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL),y)
-	OPENVPN_CONF_OPTS += --with-crypto-library=polarssl
-	OPENVPN_DEPENDENCIES += polarssl
+OPENVPN_CONF_OPTS += --with-crypto-library=polarssl
+OPENVPN_DEPENDENCIES += polarssl
 endif
 
 define OPENVPN_INSTALL_TARGET_CMDS
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 51bfbfa..b322b16 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -78,14 +78,15 @@ PANGO_DEPENDENCIES = \
 	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib
-	PANGO_DEPENDENCIES += xlib_libX11
+PANGO_CONF_OPTS += \
+	--x-includes=$(STAGING_DIR)/usr/include/X11 \
+	--x-libraries=$(STAGING_DIR)/usr/lib
+PANGO_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
-	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
-	PANGO_CONF_OPTS += --with-xft
+PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
+PANGO_CONF_OPTS += --with-xft
 endif
 
 define PANGO_INSTALL_INIT_SYSV
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index c1aa6b5..5df3a17 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -12,25 +12,25 @@ PCIUTILS_LICENSE = GPLv2+
 PCIUTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	PCIUTILS_ZLIB=yes
-	PCIUTILS_DEPENDENCIES += zlib
+PCIUTILS_ZLIB=yes
+PCIUTILS_DEPENDENCIES += zlib
 else
-	PCIUTILS_ZLIB=no
+PCIUTILS_ZLIB=no
 endif
 
 PCIUTILS_DNS = no
 
 ifeq ($(BR2_PACKAGE_KMOD),y)
-	PCIUTILS_DEPENDENCIES += kmod
-	PCIUTILS_KMOD = yes
+PCIUTILS_DEPENDENCIES += kmod
+PCIUTILS_KMOD = yes
 else
-	PCIUTILS_KMOD = no
+PCIUTILS_KMOD = no
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	PCIUTILS_SHARED=no
+PCIUTILS_SHARED=no
 else
-	PCIUTILS_SHARED=yes
+PCIUTILS_SHARED=yes
 endif
 
 PCIUTILS_MAKE_OPTS = \
@@ -47,7 +47,7 @@ PCIUTILS_MAKE_OPTS = \
 
 # Build after busybox since it's got a lightweight lspci
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	PCIUTILS_DEPENDENCIES += busybox
+PCIUTILS_DEPENDENCIES += busybox
 endif
 
 define PCIUTILS_CONFIGURE_CMDS
diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index bbdcc5a..36989fc 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -29,13 +29,13 @@ PERF_MAKE_FLAGS = \
 # backtrace will contain only several functions from the top of stack,
 # instead of the complete backtrace.
 ifeq ($(BR2_arc),y)
-	PERF_MAKE_FLAGS += NO_BACKTRACE=1
+PERF_MAKE_FLAGS += NO_BACKTRACE=1
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-	PERF_DEPENDENCIES += elfutils
+PERF_DEPENDENCIES += elfutils
 else
-	PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
+PERF_MAKE_FLAGS += NO_LIBELF=1 NO_DWARF=1
 endif
 
 define PERF_BUILD_CMDS
diff --git a/package/php/php.mk b/package/php/php.mk
index 055bc0b..dbb5b16 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -42,7 +42,7 @@ endif
 # Workaround for non-IPv6 uClibc toolchain
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ifneq ($(BR2_INET_IPV6),y)
-	PHP_CFLAGS += -DHAVE_DEPRECATED_DNS_FUNCS
+PHP_CFLAGS += -DHAVE_DEPRECATED_DNS_FUNCS
 endif
 endif
 
@@ -81,155 +81,158 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
-	PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += libmcrypt
+PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libmcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
-	PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += openssl
+PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
-	PHP_CONF_ENV += php_cv_libxml_build_works=yes
-	PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
-	PHP_DEPENDENCIES += libxml2
+PHP_CONF_ENV += php_cv_libxml_build_works=yes
+PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
+PHP_DEPENDENCIES += libxml2
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_WDDX),y)
-	PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += expat
+PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += expat
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_XMLRPC),y)
-	PHP_CONF_OPTS += --with-xmlrpc \
-		$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
-	PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+PHP_CONF_OPTS += \
+	--with-xmlrpc \
+	$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
+PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
-	PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += zlib
+PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
-	PHP_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
+PHP_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-	PHP_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += libiconv
+PHP_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libiconv
 else
-	PHP_CONF_OPTS += --with-iconv
+PHP_CONF_OPTS += --with-iconv
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
-	PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += icu
-	# The intl module is implemented in C++, but PHP fails to use
-	# g++ as the compiler for the final link. As a workaround,
-	# tell it to link libstdc++.
-	PHP_EXTRA_LIBS += -lstdc++
+PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += icu
+# The intl module is implemented in C++, but PHP fails to use
+# g++ as the compiler for the final link. As a workaround,
+# tell it to link libstdc++.
+PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
-	PHP_CONF_OPTS += --with-gmp=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += gmp
+PHP_CONF_OPTS += --with-gmp=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += gmp
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
-	PHP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += readline
+PHP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += readline
 endif
 
 ### Native MySQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
-	PHP_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += mysql
+PHP_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
-	PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
-	PHP_DEPENDENCIES += mysql
+PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
+PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
-	PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += sqlite
+PHP_CONF_OPTS += --with-sqlite3=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += sqlite
 endif
 
 ### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
-	PHP_CONF_OPTS += --enable-pdo
+PHP_CONF_OPTS += --enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
-	PHP_CONF_OPTS += --with-pdo-sqlite=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += sqlite
-	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
+PHP_CONF_OPTS += --with-pdo-sqlite=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += sqlite
+PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
 ifneq ($(BR2_LARGEFILE),y)
-	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
+PHP_CFLAGS += -DSQLITE_DISABLE_LFS
 endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-	PHP_CONF_OPTS += --with-pdo-mysql=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += mysql
+PHP_CONF_OPTS += --with-pdo-mysql=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
-	PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += postgresql
+PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += postgresql
 endif
 endif
 
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += pcre
+PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
-	PHP_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += libcurl
+PHP_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_XSL),y)
-	PHP_CONF_OPTS += --with-xsl=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += libxslt
+PHP_CONF_OPTS += --with-xsl=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libxslt
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_BZIP2),y)
-	PHP_CONF_OPTS += --with-bz2=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += bzip2
+PHP_CONF_OPTS += --with-bz2=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += bzip2
 endif
 
 ### DBA
 ifeq ($(BR2_PACKAGE_PHP_EXT_DBA),y)
-	PHP_CONF_OPTS += --enable-dba
+PHP_CONF_OPTS += --enable-dba
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_CDB),y)
-	PHP_CONF_OPTS += --without-cdb
+PHP_CONF_OPTS += --without-cdb
 endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_FLAT),y)
-	PHP_CONF_OPTS += --without-flatfile
+PHP_CONF_OPTS += --without-flatfile
 endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_INI),y)
-	PHP_CONF_OPTS += --without-inifile
+PHP_CONF_OPTS += --without-inifile
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_DBA_DB4),y)
-	PHP_CONF_OPTS += --with-db4=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += berkeleydb
+PHP_CONF_OPTS += --with-db4=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += berkeleydb
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
-	PHP_CONF_OPTS += --with-snmp=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += netsnmp
+PHP_CONF_OPTS += --with-snmp=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += netsnmp
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GD),y)
-	PHP_CONF_OPTS += --with-gd --with-jpeg-dir=$(STAGING_DIR)/usr \
-		--with-png-dir=$(STAGING_DIR)/usr \
-		--with-zlib-dir=$(STAGING_DIR)/usr \
-		--with-freetype-dir=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += jpeg libpng freetype
+PHP_CONF_OPTS += \
+	--with-gd \
+	--with-jpeg-dir=$(STAGING_DIR)/usr \
+	--with-png-dir=$(STAGING_DIR)/usr \
+	--with-zlib-dir=$(STAGING_DIR)/usr \
+	--with-freetype-dir=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += jpeg libpng freetype
 endif
 
 define PHP_EXTENSIONS_FIXUP
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index a27c084..3c93fd5 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -36,9 +36,9 @@ PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
 HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_STATIC
 else
-	HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
+HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_SHARED
 endif
 
 $(eval $(autotools-package))
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 2ac7e64..d797fc7 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -14,59 +14,59 @@ POPPLER_INSTALL_STAGING = YES
 POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-	POPPLER_CONF_OPTS += --enable-cms=lcms2
-	POPPLER_DEPENDENCIES += lcms2
+POPPLER_CONF_OPTS += --enable-cms=lcms2
+POPPLER_DEPENDENCIES += lcms2
 else
-	POPPLER_CONF_OPTS += --enable-cms=none
+POPPLER_CONF_OPTS += --enable-cms=none
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-	POPPLER_CONF_OPTS += --enable-libtiff
-	POPPLER_DEPENDENCIES += tiff
+POPPLER_CONF_OPTS += --enable-libtiff
+POPPLER_DEPENDENCIES += tiff
 else
-	POPPLER_CONF_OPTS += --disable-libtiff
+POPPLER_CONF_OPTS += --disable-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	POPPLER_CONF_OPTS += --enable-libjpeg
-	POPPLER_DEPENDENCIES += jpeg
+POPPLER_CONF_OPTS += --enable-libjpeg
+POPPLER_DEPENDENCIES += jpeg
 else
-	POPPLER_CONF_OPTS += --disable-libjpeg
+POPPLER_CONF_OPTS += --disable-libjpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	POPPLER_CONF_OPTS += --enable-libpng
-	POPPLER_DEPENDENCIES += libpng
+POPPLER_CONF_OPTS += --enable-libpng
+POPPLER_DEPENDENCIES += libpng
 else
-	POPPLER_CONF_OPTS += --disable-libpng
+POPPLER_CONF_OPTS += --disable-libpng
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	POPPLER_CONF_OPTS += --enable-zlib
-	POPPLER_DEPENDENCIES += zlib
+POPPLER_CONF_OPTS += --enable-zlib
+POPPLER_DEPENDENCIES += zlib
 else
-	POPPLER_CONF_OPTS += --disable-zlib
+POPPLER_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
-	POPPLER_CONF_OPTS += --enable-libcurl
-	POPPLER_DEPENDENCIES += libcurl
+POPPLER_CONF_OPTS += --enable-libcurl
+POPPLER_DEPENDENCIES += libcurl
 else
-	POPPLER_CONF_OPTS += --disable-libcurl
+POPPLER_CONF_OPTS += --disable-libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	POPPLER_CONF_OPTS += --with-x
-	POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
+POPPLER_CONF_OPTS += --with-x
+POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	POPPLER_CONF_OPTS += --without-x
+POPPLER_CONF_OPTS += --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER_QT),y)
-	POPPLER_DEPENDENCIES += qt
-	POPPLER_CONF_OPTS += --enable-poppler-qt4
+POPPLER_DEPENDENCIES += qt
+POPPLER_CONF_OPTS += --enable-poppler-qt4
 else
-	POPPLER_CONF_OPTS += --disable-poppler-qt4
+POPPLER_CONF_OPTS += --disable-poppler-qt4
 endif
 
 $(eval $(autotools-package))
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index bc382ce..006e79b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -28,36 +28,36 @@ POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
 endif
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	POSTGRESQL_CONF_OPTS += --disable-thread-safety
+POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
 ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2)$(BR2_xtensa),y)
-	POSTGRESQL_CONF_OPTS += --disable-spinlocks
+POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	POSTGRESQL_DEPENDENCIES += readline
+POSTGRESQL_DEPENDENCIES += readline
 else
-	POSTGRESQL_CONF_OPTS += --without-readline
+POSTGRESQL_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	POSTGRESQL_DEPENDENCIES += zlib
+POSTGRESQL_DEPENDENCIES += zlib
 else
-	POSTGRESQL_CONF_OPTS += --without-zlib
+POSTGRESQL_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_TZDATA),y)
-	POSTGRESQL_DEPENDENCIES += tzdata
-	POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
+POSTGRESQL_DEPENDENCIES += tzdata
+POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
 else
-	POSTGRESQL_DEPENDENCIES += host-zic
-	POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
+POSTGRESQL_DEPENDENCIES += host-zic
+POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	POSTGRESQL_DEPENDENCIES += openssl
-	POSTGRESQL_CONF_OPTS += --with-openssl
+POSTGRESQL_DEPENDENCIES += openssl
+POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
 define POSTGRESQL_USERS
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 453445b..31d6e06 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -20,12 +20,12 @@ PPPD_RADIUS_CONF = \
 	issue port-id-map realms server radiusclient.conf
 
 ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
-	PPPD_DEPENDENCIES += libpcap
-	PPPD_MAKE_OPTS += FILTER=y
+PPPD_DEPENDENCIES += libpcap
+PPPD_MAKE_OPTS += FILTER=y
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	PPPD_MAKE_OPTS += HAVE_INET6=y
+PPPD_MAKE_OPTS += HAVE_INET6=y
 endif
 
 # pppd bundles some but not all of the needed kernel headers. The embedded
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index d1d2c41..e1d4f27 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -14,14 +14,14 @@ PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	PTPD2_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+PTPD2_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
-	PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-	PTPD2_DEPENDENCIES += netsnmp
+PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
+PTPD2_DEPENDENCIES += netsnmp
 else
-	PTPD2_CONF_OPTS += --disable-snmp
+PTPD2_CONF_OPTS += --disable-snmp
 endif
 
 define PTPD2_INSTALL_INIT_SYSV
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 7105da5..c565ba0 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,21 +18,21 @@ QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDesigner.*$$/\# QWT_CONFIG += QwtDesigner/
 QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
 else
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
 ifeq ($(BR2_PACKAGE_QWT_MATHML),y)
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/QWT_CONFIG += QwtMathML/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/QWT_CONFIG += QwtMathML/'
 else
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/\# QWT_CONFIG += QwtMathML/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtMathML.*$$/\# QWT_CONFIG += QwtMathML/'
 endif
 
 ifeq ($(BR2_PACKAGE_QWT_OPENGL),y)
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/QWT_CONFIG += QwtOpenGL/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/QWT_CONFIG += QwtOpenGL/'
 else
-	QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
+QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
 endif
 
 define QWT_CONFIGURE_CMDS
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 70fae85..f326389 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -14,9 +14,9 @@ RSYNC_CONF_OPTS = \
 	--with-included-popt=no
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-	RSYNC_DEPENDENCIES += acl
+RSYNC_DEPENDENCIES += acl
 else
-	RSYNC_CONF_OPTS += --disable-acl-support
+RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d44237a..2e2adfd 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -14,7 +14,8 @@ HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPTS = --disable-install-doc --disable-rpath --disable-rubygems
-HOST_RUBY_CONF_OPTS = --disable-install-doc \
+HOST_RUBY_CONF_OPTS = \
+	--disable-install-doc \
 	--with-out-ext=curses,openssl,readline \
 	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
@@ -38,31 +39,31 @@ endif
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-	RUBY_DEPENDENCIES += berkeleydb
+RUBY_DEPENDENCIES += berkeleydb
 endif
 ifeq ($(BR2_PACKAGE_GDBM),y)
-	RUBY_DEPENDENCIES += gdbm
+RUBY_DEPENDENCIES += gdbm
 endif
 ifeq ($(BR2_PACKAGE_LIBYAML),y)
-	RUBY_DEPENDENCIES += libyaml
+RUBY_DEPENDENCIES += libyaml
 endif
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-	RUBY_DEPENDENCIES += ncurses
+RUBY_DEPENDENCIES += ncurses
 endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	RUBY_DEPENDENCIES += openssl
+RUBY_DEPENDENCIES += openssl
 endif
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	RUBY_DEPENDENCIES += readline
+RUBY_DEPENDENCIES += readline
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	RUBY_DEPENDENCIES += zlib
+RUBY_DEPENDENCIES += zlib
 endif
 ifeq ($(BR2_PACKAGE_GMP),y)
-	RUBY_DEPENDENCIES += gmp
-	RUBY_CONF_OPTS += --with-gmp
+RUBY_DEPENDENCIES += gmp
+RUBY_CONF_OPTS += --with-gmp
 else
-	RUBY_CONF_OPTS += --without-gmp
+RUBY_CONF_OPTS += --without-gmp
 endif
 
 # workaround for amazing build failure, see
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index fd2123d..d619ad1 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -17,99 +17,100 @@ SCONESERVER_CONF_OPTS += --with-ip --with-local
 
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	SCONESERVER_CONF_OPTS += \
-		--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
+SCONESERVER_CONF_OPTS += \
+	--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	SCONESERVER_CONF_OPTS += --with-ip6
+SCONESERVER_CONF_OPTS += --with-ip6
 else
-	SCONESERVER_CONF_OPTS += --without-ip6
+SCONESERVER_CONF_OPTS += --without-ip6
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	SCONESERVER_DEPENDENCIES += openssl
-	SCONESERVER_CONF_OPTS += --with-ssl
+SCONESERVER_DEPENDENCIES += openssl
+SCONESERVER_CONF_OPTS += --with-ssl
 else
-	SCONESERVER_CONF_OPTS += --without-ssl
+SCONESERVER_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
-	SCONESERVER_CONF_OPTS += --with-examples
+SCONESERVER_CONF_OPTS += --with-examples
 else
-	SCONESERVER_CONF_OPTS += --without-examples
+SCONESERVER_CONF_OPTS += --without-examples
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
-	SCONESERVER_DEPENDENCIES += libxml2
-	SCONESERVER_CONF_OPTS += --with-sconesite
+SCONESERVER_DEPENDENCIES += libxml2
+SCONESERVER_CONF_OPTS += --with-sconesite
 else
-	SCONESERVER_CONF_OPTS += --without-sconesite
+SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
-	SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
-	SCONESERVER_CONF_OPTS += \
-		--with-sconesite-image \
-		--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
+SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
+SCONESERVER_CONF_OPTS += \
+	--with-sconesite-image \
+	--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
 else
-	SCONESERVER_CONF_OPTS += --without-sconesite-image
+SCONESERVER_CONF_OPTS += --without-sconesite-image
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-	SCONESERVER_DEPENDENCIES += mysql
-	SCONESERVER_CONF_OPTS += --with-mysql \
-		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
-		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
+SCONESERVER_DEPENDENCIES += mysql
+SCONESERVER_CONF_OPTS += \
+	--with-mysql \
+	--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
+	LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
 else
-	SCONESERVER_CONF_OPTS += --without-mysql
+SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-	SCONESERVER_DEPENDENCIES += bluez_utils
-	SCONESERVER_CONF_OPTS += --with-bluetooth
+SCONESERVER_DEPENDENCIES += bluez_utils
+SCONESERVER_CONF_OPTS += --with-bluetooth
 else
-	SCONESERVER_CONF_OPTS += --without-bluetooth
+SCONESERVER_CONF_OPTS += --without-bluetooth
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
-	SCONESERVER_DEPENDENCIES += libxml2
-	SCONESERVER_CONF_OPTS += --with-rss
+SCONESERVER_DEPENDENCIES += libxml2
+SCONESERVER_CONF_OPTS += --with-rss
 else
-	SCONESERVER_CONF_OPTS += --without-rss
+SCONESERVER_CONF_OPTS += --without-rss
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-	SCONESERVER_DEPENDENCIES += gpsd
-	SCONESERVER_CONF_OPTS += --with-location
+SCONESERVER_DEPENDENCIES += gpsd
+SCONESERVER_CONF_OPTS += --with-location
 else
-	SCONESERVER_CONF_OPTS += --without-location
+SCONESERVER_CONF_OPTS += --without-location
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LETTUCE),y)
-	SCONESERVER_CONF_OPTS += --with-lettuce
+SCONESERVER_CONF_OPTS += --with-lettuce
 else
-	SCONESERVER_CONF_OPTS += --without-lettuce
+SCONESERVER_CONF_OPTS += --without-lettuce
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
-	SCONESERVER_DEPENDENCIES += mpfr
-	SCONESERVER_CONF_OPTS += --with-maths
+SCONESERVER_DEPENDENCIES += mpfr
+SCONESERVER_CONF_OPTS += --with-maths
 else
-	SCONESERVER_CONF_OPTS += --without-maths
+SCONESERVER_CONF_OPTS += --without-maths
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
-	SCONESERVER_CONF_OPTS += --with-testbuilder
+SCONESERVER_CONF_OPTS += --with-testbuilder
 else
-	SCONESERVER_CONF_OPTS += --without-testbuilder
+SCONESERVER_CONF_OPTS += --without-testbuilder
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_UI),y)
-	SCONESERVER_DEPENDENCIES += xlib_libX11
-	SCONESERVER_CONF_OPTS += --with-ui
+SCONESERVER_DEPENDENCIES += xlib_libX11
+SCONESERVER_CONF_OPTS += --with-ui
 else
-	SCONESERVER_CONF_OPTS += --without-ui
+SCONESERVER_CONF_OPTS += --without-ui
 endif
 
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index c458fe7..59ef993 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -19,39 +19,39 @@ SLANG_POST_PATCH_HOOKS += SLANG_DISABLE_TERMCAP
 
 # Absolute path hell, sigh...
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	SLANG_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
-	SLANG_DEPENDENCIES += libpng
+SLANG_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
+SLANG_DEPENDENCIES += libpng
 else
-	SLANG_CONF_OPTS += --with-png=no
+SLANG_CONF_OPTS += --with-png=no
 endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-	SLANG_DEPENDENCIES += pcre
+SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
+SLANG_DEPENDENCIES += pcre
 else
-	SLANG_CONF_OPTS += --with-pcre=no
+SLANG_CONF_OPTS += --with-pcre=no
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
-	SLANG_DEPENDENCIES += zlib
+SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
+SLANG_DEPENDENCIES += zlib
 else
-	SLANG_CONF_OPTS += --with-z=no
+SLANG_CONF_OPTS += --with-z=no
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-	SLANG_DEPENDENCIES += ncurses
+SLANG_DEPENDENCIES += ncurses
 else
-	SLANG_CONF_OPTS += ac_cv_path_nc5config=no
+SLANG_CONF_OPTS += ac_cv_path_nc5config=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	SLANG_CONF_OPTS += --with-readline=gnu
-	SLANG_DEPENDENCIES += readline
+SLANG_CONF_OPTS += --with-readline=gnu
+SLANG_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-	SLANG_MAKE_OPTS = static
-	SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
-	SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
+SLANG_MAKE_OPTS = static
+SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
+SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 endif
 
 $(eval $(autotools-package))
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 84d4374..74acee4 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -16,10 +16,10 @@ SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
-	SNMPPP_CONF_OPTS += --enable-snmpv3
-	SNMPPP_DEPENDENCIES += openssl
+SNMPPP_CONF_OPTS += --enable-snmpv3
+SNMPPP_DEPENDENCIES += openssl
 else
-	SNMPPP_CONF_OPTS += --disable-snmpv3
+SNMPPP_CONF_OPTS += --disable-snmpv3
 endif
 
 $(eval $(autotools-package))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index bae4b4c..ecb7621 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -23,15 +23,15 @@ SOCAT_CONF_ENV = \
 SOCAT_DEPENDENCIES = host-autoconf
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	SOCAT_DEPENDENCIES += openssl
+SOCAT_DEPENDENCIES += openssl
 else
-	SOCAT_CONF_OPTS += --disable-openssl
+SOCAT_CONF_OPTS += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	SOCAT_DEPENDENCIES += readline
+SOCAT_DEPENDENCIES += readline
 else
-	SOCAT_CONF_OPTS += --disable-readline
+SOCAT_CONF_OPTS += --disable-readline
 endif
 
 define SOCAT_RUN_AUTOCONF
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 595ae16..a34bfac 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -17,11 +17,11 @@ SPEEX_CONF_OPTS = \
 	--enable-fixed-point
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
-	SPEEX_CONF_OPTS += --enable-arm4-asm
+SPEEX_CONF_OPTS += --enable-arm4-asm
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
-	SPEEX_CONF_OPTS += --enable-arm5e-asm
+SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
 define SPEEX_LIBTOOL_FIXUP
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 43f96b7..06f0e34 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -39,62 +39,62 @@ TIFF_TOOLS_TO_DELETE = \
 	tiffsplit \
 
 ifeq ($(BR2_PACKAGE_TIFF_TIFF2PDF),)
-	TIFF_TOOLS_TO_DELETE += tiff2pdf
+TIFF_TOOLS_TO_DELETE += tiff2pdf
 endif
 ifeq ($(BR2_PACKAGE_TIFF_TIFFCP),)
-	TIFF_TOOLS_TO_DELETE += tiffcp
+TIFF_TOOLS_TO_DELETE += tiffcp
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
-	TIFF_CONF_OPTS += --disable-ccitt
+TIFF_CONF_OPTS += --disable-ccitt
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
-	TIFF_CONF_OPTS += --disable-packbits
+TIFF_CONF_OPTS += --disable-packbits
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_LZW),y)
-	TIFF_CONF_OPTS += --disable-lzw
+TIFF_CONF_OPTS += --disable-lzw
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_THUNDER),y)
-	TIFF_CONF_OPTS += --disable-thunder
+TIFF_CONF_OPTS += --disable-thunder
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_NEXT),y)
-	TIFF_CONF_OPTS += --disable-next
+TIFF_CONF_OPTS += --disable-next
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_LOGLUV),y)
-	TIFF_CONF_OPTS += --disable-logluv
+TIFF_CONF_OPTS += --disable-logluv
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_MDI),y)
-	TIFF_CONF_OPTS += --disable-mdi
+TIFF_CONF_OPTS += --disable-mdi
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_ZLIB),y)
-	TIFF_CONF_OPTS += --disable-zlib
+TIFF_CONF_OPTS += --disable-zlib
 else
-	TIFF_DEPENDENCIES += zlib
+TIFF_DEPENDENCIES += zlib
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_PIXARLOG),y)
-	TIFF_CONF_OPTS += --disable-pixarlog
+TIFF_CONF_OPTS += --disable-pixarlog
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_JPEG),y)
-	TIFF_CONF_OPTS += --disable-jpeg
+TIFF_CONF_OPTS += --disable-jpeg
 else
-	TIFF_DEPENDENCIES += jpeg
+TIFF_DEPENDENCIES += jpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_OLD_JPEG),y)
-	TIFF_CONF_OPTS += --disable-old-jpeg
+TIFF_CONF_OPTS += --disable-old-jpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
-	TIFF_CONF_OPTS += --disable-jbig
+TIFF_CONF_OPTS += --disable-jbig
 endif
 
 define TIFF_REMOVE_TOOLS_FIXUP
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 521dca9..213f02c 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -12,10 +12,10 @@ TN5250_LICENSE = LGPLv2.1+
 TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
-	TN5250_DEPENDENCIES += openssl
+TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
+TN5250_DEPENDENCIES += openssl
 else
-	TN5250_CONF_OPTS += --without-ssl
+TN5250_CONF_OPTS += --without-ssl
 endif
 
 define TN5250_INSTALL_FIXES
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index b8a5c42..bbc32bf 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -22,19 +22,19 @@ TRANSMISSION_LICENSE = GPLv2 or GPLv3 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
-	TRANSMISSION_CONF_OPTS += --enable-utp
+TRANSMISSION_CONF_OPTS += --enable-utp
 else
-	TRANSMISSION_CONF_OPTS += --disable-utp
+TRANSMISSION_CONF_OPTS += --disable-utp
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
-	TRANSMISSION_CONF_OPTS += --enable-cli
+TRANSMISSION_CONF_OPTS += --enable-cli
 else
-	TRANSMISSION_CONF_OPTS += --disable-cli
+TRANSMISSION_CONF_OPTS += --disable-cli
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
-	TRANSMISSION_CONF_OPTS += --enable-daemon
+TRANSMISSION_CONF_OPTS += --enable-daemon
 
 define TRANSMISSION_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
@@ -42,20 +42,20 @@ define TRANSMISSION_INSTALL_INIT_SYSV
 endef
 
 else
-	TRANSMISSION_CONF_OPTS += --disable-daemon
+TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
-	TRANSMISSION_CONF_OPTS += --enable-remote
+TRANSMISSION_CONF_OPTS += --enable-remote
 else
-	TRANSMISSION_CONF_OPTS += --disable-remote
+TRANSMISSION_CONF_OPTS += --disable-remote
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
-	TRANSMISSION_CONF_OPTS += --enable-gtk
-	TRANSMISSION_DEPENDENCIES += libgtk2
+TRANSMISSION_CONF_OPTS += --enable-gtk
+TRANSMISSION_DEPENDENCIES += libgtk2
 else
-	TRANSMISSION_CONF_OPTS += --disable-gtk
+TRANSMISSION_CONF_OPTS += --disable-gtk
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 9828308..8f763fa 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -18,16 +18,16 @@ ULOGD_LICENSE_FILES = COPYING
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
-	ULOGD_DEPENDENCIES += mysql
+ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
+ULOGD_DEPENDENCIES += mysql
 else
-	ULOGD_CONF_OPTS += --with-mysql=no
+ULOGD_CONF_OPTS += --with-mysql=no
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
-	ULOGD_DEPENDENCIES += sqlite
+ULOGD_DEPENDENCIES += sqlite
 endif
 else
-	ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
+ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
 endif
 
 $(eval $(autotools-package))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index ca992a0..9c16416 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -15,9 +15,9 @@ USB_MODESWITCH_BUILD_TARGETS = static
 USB_MODESWITCH_INSTALL_TARGETS = install-static
 
 ifeq ($(BR2_PACKAGE_TCL)$(BR2_PACKAGE_TCL_SHLIB_ONLY),y)
-	USB_MODESWITCH_DEPENDENCIES += tcl
-	USB_MODESWITCH_BUILD_TARGETS = script
-	USB_MODESWITCH_INSTALL_TARGETS = install-script
+USB_MODESWITCH_DEPENDENCIES += tcl
+USB_MODESWITCH_BUILD_TARGETS = script
+USB_MODESWITCH_INSTALL_TARGETS = install-script
 endif
 
 define USB_MODESWITCH_BUILD_CMDS
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 56fa0ba..c96a1f5 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -13,7 +13,7 @@ USBUTILS_LICENSE_FILES = COPYING
 
 # Build after busybox since it's got a lightweight lsusb
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	USBUTILS_DEPENDENCIES += busybox
+USBUTILS_DEPENDENCIES += busybox
 endif
 
 # Nice lsusb.py script only if there's python
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 742d81e..960b92d 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -13,28 +13,29 @@ WGET_LICENSE_FILES = COPYING
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	WGET_DEPENDENCIES += busybox
+WGET_DEPENDENCIES += busybox
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	WGET_CONF_OPTS += --with-ssl=gnutls \
-		--with-libgnutls-prefix=$(STAGING_DIR)
-	WGET_DEPENDENCIES += gnutls
+WGET_CONF_OPTS += \
+	--with-ssl=gnutls \
+	--with-libgnutls-prefix=$(STAGING_DIR)
+WGET_DEPENDENCIES += gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	WGET_CONF_OPTS += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
-	WGET_DEPENDENCIES += openssl
+WGET_CONF_OPTS += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
+WGET_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
-	WGET_DEPENDENCIES += util-linux
+WGET_DEPENDENCIES += util-linux
 endif
 
 # --with-ssl is default
 ifneq ($(BR2_PACKAGE_GNUTLS),y)
 ifneq ($(BR2_PACKAGE_OPENSSL),y)
-	WGET_CONF_OPTS += --without-ssl
+WGET_CONF_OPTS += --without-ssl
 endif
 endif
 
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 2082006..5fb8f12 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -17,8 +17,8 @@ WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
 
 
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
-	WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
-	WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
+WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
+WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
 
 define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true install-dynamic
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 4b2ec16..eb4278a 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -34,54 +34,54 @@ WPA_SUPPLICANT_CONFIG_DISABLE = \
 # in the wpa_supplicant Makefiles as in LIBS+=-lnl-3 ... thus failing
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 ifeq ($(BR2_STATIC_LIBS),y)
-	WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
+WPA_SUPPLICANT_LIBS += -lnl-3 -lm -lpthread
 endif
-	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libnl
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_LIBNL32
 else
-	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
 endif
 
 # Trailing underscore on purpose to not enable CONFIG_EAPOL_TEST
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_
 else
-	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
-		CONFIG_INTERWORKING
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
+	CONFIG_INTERWORKING
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += \
-		CONFIG_AP \
-		CONFIG_P2P
+WPA_SUPPLICANT_CONFIG_ENABLE += \
+	CONFIG_AP \
+	CONFIG_P2P
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
 endif
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	WPA_SUPPLICANT_DEPENDENCIES += openssl
-	WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
-	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
+WPA_SUPPLICANT_DEPENDENCIES += openssl
+WPA_SUPPLICANT_LIBS += $(if $(BR2_STATIC_LIBS),-lcrypto -lz)
+WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
-	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
-	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
+WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
+WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
-	WPA_SUPPLICANT_MAKE_ENV = \
-		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
+WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf dbus
+WPA_SUPPLICANT_MAKE_ENV = \
+	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
+	PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
 define WPA_SUPPLICANT_INSTALL_DBUS_OLD
 	$(INSTALL) -m 0644 -D \
 		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
@@ -90,7 +90,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
 define WPA_SUPPLICANT_INSTALL_DBUS_NEW
 	$(INSTALL) -m 0644 -D \
 		$(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
@@ -99,18 +99,18 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
 endif
 
 endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DEBUG_SYSLOG
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	WPA_SUPPLICANT_DEPENDENCIES += readline
-	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
+WPA_SUPPLICANT_DEPENDENCIES += readline
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
 define WPA_SUPPLICANT_CONFIGURE_CMDS
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
index 1630ff0..bc7c5d4 100644
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -29,28 +29,28 @@ WVSTREAMS_CONF_OPTS += \
 WVSTREAMS_CONF_ENV += LIBS=-lz
 
 ifneq ($(BR2_STATIC_LIBS),y)
-	WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
+WVSTREAMS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fPIC"
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	WVSTREAMS_DEPENDENCIES += dbus
-	WVSTREAMS_CONF_OPTS += --with-dbus
+WVSTREAMS_DEPENDENCIES += dbus
+WVSTREAMS_CONF_OPTS += --with-dbus
 else
-	WVSTREAMS_CONF_OPTS += --without-dbus
+WVSTREAMS_CONF_OPTS += --without-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_QT),y)
-	WVSTREAMS_DEPENDENCIES += qt
-	WVSTREAMS_CONF_OPTS += --with-qt
+WVSTREAMS_DEPENDENCIES += qt
+WVSTREAMS_CONF_OPTS += --with-qt
 else
-	WVSTREAMS_CONF_OPTS += --without-qt
+WVSTREAMS_CONF_OPTS += --without-qt
 endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
-	WVSTREAMS_DEPENDENCIES += valgrind
-	WVSTREAMS_CONF_OPTS += --with-valgrind
+WVSTREAMS_DEPENDENCIES += valgrind
+WVSTREAMS_CONF_OPTS += --with-valgrind
 else
-	WVSTREAMS_CONF_OPTS += --without-valgrind
+WVSTREAMS_CONF_OPTS += --without-valgrind
 endif
 
 $(eval $(autotools-package))
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index e8f7c57..dbd6fc7 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -16,12 +16,12 @@ ZEROMQ_AUTORECONF = YES
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
 # for the rest of the build as well (which automatically includes stdc++).
 ifeq ($(BR2_STATIC_LIBS),y)
-	ZEROMQ_CONF_OPTS += LIBS=-lstdc++
+ZEROMQ_CONF_OPTS += LIBS=-lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
-	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
-	ZEROMQ_CONF_OPTS += --with-system-pgm
+ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
+ZEROMQ_CONF_OPTS += --with-system-pgm
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
