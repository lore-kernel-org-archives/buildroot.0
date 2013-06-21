From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jun 2013 15:12:31 +0200
Subject: [Buildroot] [PATCH 1/1] "Change package tarball compression to
 xz"
In-Reply-To: <1371819562-2696-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1371819562-2696-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20130621151231.31e86b03@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Fri, 21 Jun 2013 14:59:22 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  docs/manual/adding-packages-autotools.txt          |    6 +++---
>  docs/manual/adding-packages-cmake.txt              |    6 +++---
>  docs/manual/adding-packages-generic.txt            |    4 ++--
>  package/autoconf/autoconf.mk                       |    1 +
>  package/automake/automake.mk                       |    1 +
>  package/bison/bison.mk                             |    1 +
>  package/bluez_utils/bluez_utils.mk                 |    2 +-
>  package/ccache/ccache.mk                           |    2 +-
>  package/connman/connman.mk                         |    1 +
>  package/diffutils/diffutils.mk                     |    1 +
>  package/dnsmasq/dnsmasq.mk                         |    1 +
>  package/ethtool/ethtool.mk                         |    1 +
>  package/gawk/gawk.mk                               |    1 +
>  package/gmp/gmp.mk                                 |    2 +-
>  package/gzip/gzip.mk                               |    1 +
>  package/iproute2/iproute2.mk                       |    1 +
>  package/iw/iw.mk                                   |    2 +-
>  package/libogg/libogg.mk                           |    1 +
>  package/libraw1394/libraw1394.mk                   |    1 +
>  package/libtheora/libtheora.mk                     |    2 +-
>  package/libtool/libtool.mk                         |    2 +-
>  package/libvorbis/libvorbis.mk                     |    2 +-
>  package/lighttpd/lighttpd.mk                       |    1 +
>  package/lzma/lzma.mk                               |    2 +-
>  package/m4/m4.mk                                   |    2 +-
>  package/mdadm/mdadm.mk                             |    2 +-
>  package/module-init-tools/module-init-tools.mk     |    2 +-
>  package/mpfr/mpfr.mk                               |    2 +-
>  .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
>  .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
>  .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
>  .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
>  package/multimedia/gstreamer/gstreamer.mk          |    2 +-
>  package/multimedia/mpd/mpd.mk                      |    1 +
>  package/multimedia/pulseaudio/pulseaudio.mk        |    1 +
>  package/nasm/nasm.mk                               |    2 +-
>  package/neard/neard.mk                             |    1 +
>  package/ofono/ofono.mk                             |    1 +
>  package/openvpn/openvpn.mk                         |    1 +
>  package/patch/patch.mk                             |    1 +
>  package/php/php.mk                                 |    2 +-
>  package/python/python.mk                           |    2 +-
>  package/python3/python3.mk                         |    2 +-
>  package/quagga/quagga.mk                           |    1 +
>  package/sg3_utils/sg3_utils.mk                     |    1 +
>  package/squid/squid.mk                             |    1 +
>  package/tftpd/tftpd.mk                             |    2 +-
>  package/transmission/transmission.mk               |    2 +-
>  package/udev/udev.mk                               |    2 +-
>  package/usbutils/usbutils.mk                       |    2 +-
>  package/util-linux/util-linux.mk                   |    2 +-
>  package/wget/wget.mk                               |    1 +
>  package/wireless-regdb/wireless-regdb.mk           |    2 +-
>  package/xz/xz.mk                                   |    2 +-
>  package/zlib/zlib.mk                               |    2 +-
>  55 files changed, 60 insertions(+), 37 deletions(-)

This seems like a good idea. I haven't checked that all those .xz
tarballs actually exist, but I assume you did, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Without your patch, the rough statistics apparently are:

 * total number of packages : 1017
 * number of packages explicitly giving a .tar.gz tarball : 218
 * number of packages explicitly giving a .tar.bz2 tarball : 424
 * number of packages explicitly giving a .tar.xz tarball : 38

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
