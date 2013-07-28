From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 28 Jul 2013 10:37:08 +0200
Subject: [Buildroot] [PATCH v2 0/1] Change package tarball compression to xz
	whenever possible
Message-ID: <1375000629-19254-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is url list of changed tarballs which may be useful in checking that patch.

Regards,
Jerzy

http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
http://ftp.gnu.org/gnu/automake/automake-1.11.6.tar.xz
http://ftp.gnu.org/gnu/bison/bison-2.7.1.tar.xz
ftp://ftp.kernel.org/pub/linux/bluetooth/bluez-4.101.tar.xz
http://samba.org/ftp/ccache/ccache-3.1.8.tar.xz
ftp://ftp.kernel.org/pub/linux/network/connman/connman-1.12.tar.xz
http://ftp.gnu.org/gnu/diffutils/diffutils-3.2.tar.xz
http://thekelleys.org.uk/dnsmasq/dnsmasq-2.66.tar.xz
ftp://ftp.kernel.org/pub/software/network/ethtool/ethtool-3.10.tar.xz
http://ftp.gnu.org/gnu/gawk/gawk-4.1.0.tar.xz
ftp://ftp.gmplib.org/pub/gmp-5.1.2/gmp-5.1.2.tar.xz
http://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/net/iproute2/iproute2-3.7.0.tar.xz
ftp://ftp.kernel.org/pub/software/network/iw/iw-3.10.tar.xz
http://downloads.xiph.org/releases/ogg/libogg-1.3.0.tar.xz
ftp://ftp.kernel.org/pub/linux/libs/ieee1394/libraw1394-2.0.7.tar.xz
http://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.xz
http://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.xz
http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.3.tar.xz
http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-v1.22-chrome26-firefox18.tar.xz
http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.32.tar.xz
http://tukaani.org/lzma/lzma-4.32.7.tar.xz
http://ftp.gnu.org/gnu/m4/m4-1.4.16.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/raid/mdadm/mdadm-3.2.6.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.15.tar.xz
http://www.mpfr.org/mpfr-3.1.2/mpfr-3.1.2.tar.xz
http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.23.tar.xz
http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.36.tar.xz
http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-0.10.31.tar.xz
http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-0.10.19.tar.xz
http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-0.10.36.tar.xz
http://www.musicpd.org/download/mpd/stable/mpd-0.17.4.tar.xz
http://freedesktop.org/software/pulseaudio/releases/pulseaudio-4.0.tar.xz
http://www.nasm.us/pub/nasm/releasebuilds/2.10.01/nasm-2.10.01.tar.xz
ftp://ftp.kernel.org/pub/linux/network/nfc/neard-0.12.tar.xz
ftp://ftp.kernel.org/pub/linux/network/ofono/ofono-1.12.tar.xz
http://swupdate.openvpn.net/community/releases/openvpn-2.3.2.tar.xz
http://ftp.gnu.org/gnu/patch/patch-2.7.1.tar.xz
http://www.php.net/distributions/php-5.3.27.tar.xz
http://python.org/ftp/python/3.3.0/Python-3.3.0.tar.xz
http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.xz
http://download.savannah.gnu.org/releases/quagga/quagga-0.99.22.1.tar.xz
http://sg.danny.cz/sg/p/sg3_utils-1.34.tar.xz
http://www.squid-cache.org/Versions/v3/3.3/squid-3.3.8.tar.xz
ftp://ftp.kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-5.2.tar.xz
http://download.transmissionbt.com/files/transmission-2.33.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/kernel/hotplug/udev-182.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/usb/usbutils/usbutils-007.tar.xz
ftp://ftp.kernel.org/pub/linux/utils/util-linux/v2.22/util-linux-2.22.2.tar.xz
http://ftp.gnu.org/gnu/wget/wget-1.14.tar.xz
http://kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.02.13.tar.xz
http://tukaani.org/xz/xz-5.0.4.tar.xz

Jerzy Grzegorek (1):
  Change package tarball compression to xz whenever possible

 docs/manual/adding-packages-autotools.txt          |    6 +++---
 docs/manual/adding-packages-cmake.txt              |    6 +++---
 docs/manual/adding-packages-generic.txt            |    4 ++--
 package/autoconf/autoconf.mk                       |    1 +
 package/automake/automake.mk                       |    1 +
 package/bison/bison.mk                             |    1 +
 package/bluez_utils/bluez_utils.mk                 |    2 +-
 package/ccache/ccache.mk                           |    2 +-
 package/connman/connman.mk                         |    1 +
 package/diffutils/diffutils.mk                     |    1 +
 package/dnsmasq/dnsmasq.mk                         |    1 +
 package/ethtool/ethtool.mk                         |    1 +
 package/gawk/gawk.mk                               |    1 +
 package/gmp/gmp.mk                                 |    2 +-
 package/gzip/gzip.mk                               |    1 +
 package/iproute2/iproute2.mk                       |    1 +
 package/iw/iw.mk                                   |    2 +-
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
 package/module-init-tools/module-init-tools.mk     |    2 +-
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
 55 files changed, 60 insertions(+), 35 deletions(-)

-- 
1.7.9.5
