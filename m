From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  6 Sep 2013 08:14:15 +0200
Subject: [Buildroot] [PATCH v3 1/1] change package tarball compression to xz
	whenever possible
Message-ID: <1378448055-3056-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v3
- actualization (some package tarballs have been changed in the mean time)

v2
- usbutils.mk has been changed in the mean time
- zlib tarball has already been changed to xz

 docs/manual/adding-packages-autotools.txt          |    6 +++---
 docs/manual/adding-packages-cmake.txt              |    6 +++---
 docs/manual/adding-packages-generic.txt            |    4 ++--
 package/autoconf/autoconf.mk                       |    1 +
 package/automake/automake.mk                       |    1 +
 package/bison/bison.mk                             |    1 +
 package/bluez_utils/bluez_utils.mk                 |    2 +-
 package/ccache/ccache.mk                           |    2 +-
 package/connman/connman.mk                         |    1 +
 package/cpuload/cpuload.mk                         |    1 +
 package/diffutils/diffutils.mk                     |    1 +
 package/dnsmasq/dnsmasq.mk                         |    1 +
 package/dosfstools/dosfstools.mk                   |    1 +
 package/dropwatch/dropwatch.mk                     |    2 +-
 package/ethtool/ethtool.mk                         |    1 +
 package/fb-test-app/fb-test-app.mk                 |    1 +
 package/gawk/gawk.mk                               |    1 +
 package/gmp/gmp.mk                                 |    2 +-
 package/gzip/gzip.mk                               |    1 +
 package/input-event-daemon/input-event-daemon.mk   |    1 +
 package/iproute2/iproute2.mk                       |    1 +
 package/iw/iw.mk                                   |    2 +-
 package/kbd/kbd.mk                                 |    2 +-
 package/kismet/kismet.mk                           |    1 +
 package/libogg/libogg.mk                           |    1 +
 package/libraw1394/libraw1394.mk                   |    1 +
 package/libtheora/libtheora.mk                     |    2 +-
 package/libtool/libtool.mk                         |    2 +-
 package/libvorbis/libvorbis.mk                     |    2 +-
 package/libwebsockets/libwebsockets.mk             |    1 +
 package/lighttpd/lighttpd.mk                       |    1 +
 package/lzma/lzma.mk                               |    2 +-
 package/m4/m4.mk                                   |    2 +-
 package/mdadm/mdadm.mk                             |    2 +-
 package/mpfr/mpfr.mk                               |    2 +-
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/multimedia/mpd/mpd.mk                      |    1 +
 package/multimedia/pulseaudio/pulseaudio.mk        |    1 +
 package/nasm/nasm.mk                               |    2 +-
 package/neard/neard.mk                             |    1 +
 package/ofono/ofono.mk                             |    1 +
 package/openvpn/openvpn.mk                         |    1 +
 package/patch/patch.mk                             |    1 +
 package/php/php.mk                                 |    2 +-
 package/python/python.mk                           |    2 +-
 package/python3/python3.mk                         |    2 +-
 package/quagga/quagga.mk                           |    1 +
 package/sg3_utils/sg3_utils.mk                     |    1 +
 package/squid/squid.mk                             |    1 +
 package/tftpd/tftpd.mk                             |    2 +-
 package/transmission/transmission.mk               |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/usbutils/usbutils.mk                       |    1 +
 package/util-linux/util-linux.mk                   |    2 +-
 package/wget/wget.mk                               |    1 +
 package/wireless-regdb/wireless-regdb.mk           |    2 +-
 package/xz/xz.mk                                   |    2 +-
 61 files changed, 66 insertions(+), 36 deletions(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 1e7b058..9fb69d9 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -32,9 +32,9 @@ package, with an example :
 
 On line 7, we declare the version of the package.
 
-On line 8 and 9, we declare the name of the tarball and the location
-of the tarball on the Web. Buildroot will automatically download the
-tarball from this location.
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball recommended)
+and the location of the tarball on the Web. Buildroot will automatically
+download the tarball from this location.
 
 On line 10, we tell Buildroot to install the package to the staging
 directory. The staging directory, located in +output/staging/+
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index b7388c8..de4bd98 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -32,9 +32,9 @@ with an example :
 
 On line 7, we declare the version of the package.
 
-On line 8 and 9, we declare the name of the tarball and the location
-of the tarball on the Web. Buildroot will automatically download the
-tarball from this location.
+On line 8 and 9, we declare the name of the tarball (xz-ed tarball recommended)
+and the location of the tarball on the Web. Buildroot will automatically
+download the tarball from this location.
 
 On line 10, we tell Buildroot to install the package to the staging
 directory. The staging directory, located in +output/staging/+
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 4e50f8f..67967a2 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -62,8 +62,8 @@ system is based on hand-written Makefiles or shell scripts.
 
 The Makefile begins on line 7 to 11 with metadata information: the
 version of the package (+LIBFOO_VERSION+), the name of the
-tarball containing the package (+LIBFOO_SOURCE+) the
-Internet location at which the tarball can be downloaded from
+tarball containing the package (+LIBFOO_SOURCE+) (xz-ed tarball recommended)
+the Internet location at which the tarball can be downloaded from
 (+LIBFOO_SITE+), the license (+LIBFOO_LICENSE+) and file with the
 license text (+LIBFOO_LICENSE_FILES+). All variables must start with
 the same prefix, +LIBFOO_+ in this case. This prefix is always the
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 2482552..e70aa39 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 AUTOCONF_VERSION = 2.69
+AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
 AUTOCONF_LICENSE = GPLv3+ with exceptions
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 98e0336..ab4a1ac 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 AUTOMAKE_VERSION = 1.11.6
+AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPLv2+
 AUTOMAKE_LICENSE_FILES = COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 1eb4fa5..1fbbf91 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 BISON_VERSION = 2.7.1
+BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 3c25042..7038638 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BLUEZ_UTILS_VERSION = 4.101
-BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.gz
+BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index bead908..a2f709e 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -6,7 +6,7 @@
 
 CCACHE_VERSION = 3.1.8
 CCACHE_SITE    = http://samba.org/ftp/ccache
-CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
+CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPLv3+, others
 CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index d88b3b6..4a6bb78 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 CONNMAN_VERSION = 1.12
+CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 CONNMAN_INSTALL_STAGING = YES
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index 65be513..c8d1d0c 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 CPULOAD_VERSION = v0.3
+CPULOAD_SOURCE = cpuload-$(CPULOAD_VERSION).tar.xz
 CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
 CPULOAD_LICENSE = GPLv2
 CPULOAD_LICENSE_FILES = COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index bd46ec2..6934532 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 DIFFUTILS_VERSION = 3.2
+DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 DIFFUTILS_LICENSE = GPLv3+
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 765de78..8b9c318 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 DNSMASQ_VERSION = 2.66
+DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 3f70238..d6ecb6f 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 DOSFSTOOLS_VERSION = 3.0.20
+DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 09dff6b..5d65d86 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DROPWATCH_VERSION = 1.4
-DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
+DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.xz
 DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
 DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
 DROPWATCH_LICENSE = GPLv2
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 66f8ffa..cdc9a6d 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 ETHTOOL_VERSION = 3.10
+ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
 ETHTOOL_LICENSE_FILES = COPYING
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index a2183e0..5b95c29 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 FB_TEST_APP_VERSION = v1.0.0
+FB_TEST_APP_SOURCE = fb-test-app-$(FB_TEST_APP_VERSION).tar.xz
 FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
 FB_TEST_APP_LICENSE = GPLv2
 FB_TEST_APP_LICENSE_FILES = COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 3f79040..af486c4 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 GAWK_VERSION = 4.1.0
+GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
 GAWK_LICENSE = GPLv3+
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 439ad4d..86ed33c 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -6,7 +6,7 @@
 
 GMP_VERSION = 5.1.2
 GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
-GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
+GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LIB
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index fd06bbc..e1a7bef 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 GZIP_VERSION = 1.6
+GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index 762d3c2..cbcc2df 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 INPUT_EVENT_DAEMON_VERSION = v0.1.3
+INPUT_EVENT_DAEMON_SOURCE = input-event-daemon-$(INPUT_EVENT_DAEMON_VERSION).tar.xz
 INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a3eff3b..fec0b62 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 IPROUTE2_VERSION = 3.10.0
+IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 IPROUTE2_LICENSE = GPLv2
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 566308c..c82e398 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IW_VERSION = 3.11
-IW_SOURCE = iw-$(IW_VERSION).tar.bz2
+IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
 IW_LICENSE_FILES = COPYING
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 2969f88..ea14b8c 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KBD_VERSION = 1.15.2
-KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
+KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index ceb9fcd..8c05996 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 KISMET_VERSION = 2013-03-R1b
+KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
 KISMET_CONF_OPT += --with-netlink-version=3
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 6e03f3a..23554d9 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIBOGG_VERSION = 1.3.0
+LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3c
 LIBOGG_LICENSE_FILES = COPYING
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 9a95265..166c782 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIBRAW1394_VERSION = 2.0.7
+LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_INSTALL_STAGING = YES
 
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 4ba342b..39602c1 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBTHEORA_VERSION = 1.1.1
-LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.bz2
+LIBTHEORA_SOURCE = libtheora-$(LIBTHEORA_VERSION).tar.xz
 LIBTHEORA_SITE = http://downloads.xiph.org/releases/theora
 LIBTHEORA_INSTALL_STAGING = YES
 LIBTHEORA_LICENSE = BSD-3c
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index f7e274f..2f6ea7c 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBTOOL_VERSION = 2.4.2
-LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
+LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
 LIBTOOL_LICENSE = GPLv2+
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 2156487..948a43d 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBVORBIS_VERSION = 1.3.3
-LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
+LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPT = --disable-oggtest
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 6672dbe..ec5244c 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIBWEBSOCKETS_VERSION = v1.22-chrome26-firefox18
+LIBWEBSOCKETS_SOURCE = libwebsockets-$(LIBWEBSOCKETS_VERSION).tar.xz
 LIBWEBSOCKETS_SITE = http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot
 LIBWEBSOCKETS_LICENSE = LGPLv2.1
 LIBWEBSOCKETS_LICENSE_FILES = COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 2b5949e..f65ee6d 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION = 1.4.32
+LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
 LIGHTTPD_LICENSE = BSD-3c
 LIGHTTPD_LICENSE_FILES = COPYING
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 648a579..9049833 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LZMA_VERSION = 4.32.7
-LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.gz
+LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
 LZMA_SITE = http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 8e41627..d06d2c9 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 M4_VERSION = 1.4.16
-M4_SOURCE = m4-$(M4_VERSION).tar.bz2
+M4_SOURCE = m4-$(M4_VERSION).tar.xz
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPLv3+
 M4_LICENSE_FILES = COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index e21cb71..04d7dcb 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MDADM_VERSION = 3.2.6
-MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
+MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPLv2+
 MDADM_LICENSE_FILES = COPYING
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 6460844..52d88fe 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -6,7 +6,7 @@
 
 MPFR_VERSION = 3.1.2
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
-MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.bz2
+MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPLv3+
 MPFR_LICENSE_FILES = COPYING.LESSER
 MPFR_INSTALL_STAGING = YES
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index df90cf9..337f756 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGINS_BAD_VERSION = 0.10.23
-GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.bz2
+GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
 GST_PLUGINS_BAD_CONF_OPT = \
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index c82aad0..6c7233b 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGINS_BASE_VERSION = 0.10.36
-GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.bz2
+GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST_PLUGINS_BASE_INSTALL_STAGING = YES
 
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index eba0571..c33fd3a 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGINS_GOOD_VERSION = 0.10.31
-GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
+GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
 GST_PLUGINS_GOOD_CONF_OPT = \
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 009c168..f3a9acb 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GST_PLUGINS_UGLY_VERSION = 0.10.19
-GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.bz2
+GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 
 GST_PLUGINS_UGLY_CONF_OPT = \
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index f0fdea4..f7919ea 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GSTREAMER_VERSION = 0.10.36
-GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
+GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.xz
 GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER_INSTALL_STAGING = YES
 
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 95e18f7..edcd945 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 MPD_VERSION = 0.17.5
+MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/stable
 MPD_DEPENDENCIES = host-pkgconf libglib2
 MPD_LICENSE = GPLv2
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 195eb19..66265d0 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 PULSEAUDIO_VERSION = 4.0
+PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases/
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index c762dcf..d8045da 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NASM_VERSION = 2.10.01
-NASM_SOURCE  = nasm-$(NASM_VERSION).tar.bz2
+NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 
 $(eval $(autotools-package))
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 56730b2..6dbbbe0 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 NEARD_VERSION = 0.12
+NEARD_SOURCE = neard-$(NEARD_VERSION).tar.xz
 NEARD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/nfc
 NEARD_LICENSE = GPLv2
 NEARD_LICENSE_FILES = COPYING
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 6031395..4b3b7a5 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 OFONO_VERSION = 1.12
+OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
 OFONO_LICENSE_FILES = COPYING
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 92f6f18..eabd5aa 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 OPENVPN_VERSION = 2.3.2
+OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPLv2
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 1605e31..2dd4533 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 PATCH_VERSION = 2.7.1
+PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPLv3+
 PATCH_LICENSE_FILES = COPYING
diff --git a/package/php/php.mk b/package/php/php.mk
index 5b71535..92665b4 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PHP_VERSION = 5.3.27
-PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
+PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
diff --git a/package/python/python.mk b/package/python/python.mk
index ecea638..df02b35 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VERSION_MAJOR = 2.7
 PYTHON_VERSION       = $(PYTHON_VERSION_MAJOR).3
-PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.bz2
+PYTHON_SOURCE        = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE          = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE       = Python software foundation license v2, others
 PYTHON_LICENSE_FILES = LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 036d1ac..a8a1942 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -6,7 +6,7 @@
 
 PYTHON3_VERSION_MAJOR = 3.3
 PYTHON3_VERSION       = $(PYTHON3_VERSION_MAJOR).0
-PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.bz2
+PYTHON3_SOURCE        = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE          = http://python.org/ftp/python/$(PYTHON3_VERSION)
 
 # Python needs itself and a "pgen" program to build itself, both being
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 56b3dcb..8b51917 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 QUAGGA_VERSION = 0.99.22.1
+QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 42ed2e0..8bb79b5 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 SG3_UTILS_VERSION = 1.34
+SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index f7d3987..a3cc8c1 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 SQUID_VERSION = 3.3.8
+SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 145d9fd..cd72810 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TFTPD_VERSION  = 5.2
-TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
+TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.xz
 TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPT = --without-tcpwrappers
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 5661c78..1e7ee48 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -6,7 +6,7 @@
 
 TRANSMISSION_VERSION = 2.33
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
-TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.bz2
+TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
 	host-pkgconf \
 	host-intltool \
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 69f011f..db86850 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 UDEV_VERSION = 182
-UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
+UDEV_SOURCE = udev-$(UDEV_VERSION).tar.xz
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 UDEV_LICENSE = GPLv2+
 UDEV_LICENSE_FILES = COPYING
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 00904cb..a821da6 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 USBUTILS_VERSION = 007
+USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb
 USBUTILS_INSTALL_STAGING = YES
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6f79e74..a3ee4cd 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -6,7 +6,7 @@
 
 UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
 UTIL_LINUX_VERSION_MAJOR = 2.23
-UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.bz2
+UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 0b213eb..429fbda 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 WGET_VERSION = 1.14
+WGET_SOURCE = wget-$(WGET_VERSION).tar.xz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_LICENSE = GPLv3+
 WGET_LICENSE_FILES = COPYING
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 3e39284..2681090 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WIRELESS_REGDB_VERSION = 2013.02.13
-WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.bz2
+WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = http://kernel.org/pub/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
 WIRELESS_REGDB_LICENSE_FILES = LICENSE
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 98fca3a..cc1257c 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 XZ_VERSION = 5.0.4
-XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
+XZ_SOURCE = xz-$(XZ_VERSION).tar.xz
 XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
1.7.9.5
