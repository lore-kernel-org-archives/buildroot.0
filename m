From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 13:57:41 +0200
Subject: [Buildroot] [git commit] packages: indentation cleanup
Message-ID: <20150331115925.66C387FA85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd8c733fb4a0ca6ca1aa72f8b549d53dcd37f4ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit doesn't touch infra packages.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk          |   30 +++---
 linux/linux.mk                             |    2 +-
 package/aircrack-ng/aircrack-ng.mk         |   26 +++---
 package/bind/bind.mk                       |   37 ++++----
 package/botan/botan.mk                     |   18 ++--
 package/cairo/cairo.mk                     |   78 ++++++++--------
 package/ccache/ccache.mk                   |   10 +-
 package/civetweb/civetweb.mk               |   14 ++--
 package/collectd/collectd.mk               |   18 ++--
 package/cups/cups.mk                       |   18 ++--
 package/dbus-cpp/dbus-cpp.mk               |   25 ++++--
 package/dhcpcd/dhcpcd.mk                   |    6 +-
 package/dillo/dillo.mk                     |   24 +++---
 package/dnsmasq/dnsmasq.mk                 |   30 +++---
 package/ecryptfs-utils/ecryptfs-utils.mk   |    6 +-
 package/enscript/enscript.mk               |    4 +-
 package/fmlib/fmlib.mk                     |    2 +-
 package/gdb/gdb.mk                         |   20 ++--
 package/git/git.mk                         |   43 +++++-----
 package/gnutls/gnutls.mk                   |    9 +-
 package/gpsd/gpsd.mk                       |  108 +++++++++++-----------
 package/harfbuzz/harfbuzz.mk               |   24 +++---
 package/haserl/haserl.mk                   |    8 +-
 package/hostapd/hostapd.mk                 |   32 ++++----
 package/hplip/hplip.mk                     |    6 +-
 package/ifplugd/ifplugd.mk                 |    2 +-
 package/imlib2/imlib2.mk                   |   36 ++++----
 package/kismet/kismet.mk                   |   12 ++--
 package/lcms2/lcms2.mk                     |   18 ++--
 package/libbluray/libbluray.mk             |   10 +-
 package/libcap/libcap.mk                   |    6 +-
 package/libcgroup/libcgroup.mk             |    6 +-
 package/libgcrypt/libgcrypt.mk             |    2 +-
 package/libglib2/libglib2.mk               |   90 ++++++++++++------
 package/libplayer/libplayer.mk             |   16 ++--
 package/linux-pam/linux-pam.mk             |    4 +-
 package/lua/lua.mk                         |   26 +++---
 package/luarocks/luarocks.mk               |    2 +-
 package/make/make.mk                       |    2 +-
 package/modem-manager/modem-manager.mk     |   12 ++--
 package/nano/nano.mk                       |   12 ++--
 package/nbd/nbd.mk                         |    4 +-
 package/ncftp/ncftp.mk                     |   16 ++--
 package/ncurses/ncurses.mk                 |    5 +-
 package/neard/neard.mk                     |    2 +-
 package/neardal/neardal.mk                 |    2 +-
 package/net-tools/net-tools.mk             |    2 +-
 package/netatalk/netatalk.mk               |   21 +++--
 package/netsnmp/netsnmp.mk                 |   32 ++++----
 package/network-manager/network-manager.mk |   18 ++--
 package/nodejs/nodejs.mk                   |    2 +-
 package/ntfs-3g/ntfs-3g.mk                 |   14 ++--
 package/ntp/ntp.mk                         |   22 +++---
 package/ofono/ofono.mk                     |   12 ++--
 package/open2300/open2300.mk               |    8 +-
 package/openssl/openssl.mk                 |   20 ++--
 package/openswan/openswan.mk               |   10 +-
 package/openvpn/openvpn.mk                 |   20 +++--
 package/pango/pango.mk                     |    3 +-
 package/pciutils/pciutils.mk               |   18 ++--
 package/perf/perf.mk                       |    6 +-
 package/php/php.mk                         |  135 ++++++++++++++--------------
 package/pkgconf/pkgconf.mk                 |    4 +-
 package/poppler/poppler.mk                 |   48 +++++-----
 package/postgresql/postgresql.mk           |   24 +++---
 package/pppd/pppd.mk                       |    6 +-
 package/ptpd2/ptpd2.mk                     |    8 +-
 package/qwt/qwt.mk                         |   12 ++--
 package/rsync/rsync.mk                     |    4 +-
 package/ruby/ruby.mk                       |   23 +++---
 package/sconeserver/sconeserver.mk         |   83 +++++++++---------
 package/slang/slang.mk                     |   32 ++++----
 package/snmppp/snmppp.mk                   |    6 +-
 package/socat/socat.mk                     |    8 +-
 package/speex/speex.mk                     |    4 +-
 package/tiff/tiff.mk                       |   32 ++++----
 package/tn5250/tn5250.mk                   |    6 +-
 package/transmission/transmission.mk       |   22 +++---
 package/ulogd/ulogd.mk                     |   10 +-
 package/usb_modeswitch/usb_modeswitch.mk   |    6 +-
 package/usbutils/usbutils.mk               |    2 +-
 package/wget/wget.mk                       |   17 ++--
 package/wireless_tools/wireless_tools.mk   |    4 +-
 package/wpa_supplicant/wpa_supplicant.mk   |   54 ++++++------
 package/wvstreams/wvstreams.mk             |   20 ++--
 package/zeromq/zeromq.mk                   |    6 +-
 86 files changed, 861 insertions(+), 806 deletions(-)

Patch is too large, so refusing to show it
