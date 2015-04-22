From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:06:35 +0200
Subject: [Buildroot] [git commit] packages: remove non-IPv6 dependencies and
	tweaks
Message-ID: <20150422210725.3D00E81D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79ce08bbdc33d1725f5d950736c9f624814b5a03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that IPv6 is mandatory remove package dependencies and conditionals
for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aiccu/Config.in                      |    5 ++---
 package/argus/Config.in                      |    5 ++---
 package/atftp/Config.in                      |    5 ++---
 package/batctl/Config.in                     |    5 ++---
 package/bind/Config.in                       |    5 ++---
 package/bluez5_utils/Config.in               |    6 ++----
 package/chrony/chrony.mk                     |    4 ----
 package/civetweb/civetweb.mk                 |    6 +-----
 package/classpath/Config.in                  |    5 -----
 package/collectd/Config.in                   |    7 ++-----
 package/connman/Config.in                    |    5 ++---
 package/conntrack-tools/Config.in            |    6 ++----
 package/cppzmq/Config.in                     |    7 +++----
 package/czmq/Config.in                       |    7 +++----
 package/dhcp/dhcp.mk                         |    4 ----
 package/dhcpcd/dhcpcd.mk                     |    4 ----
 package/dnsmasq/dnsmasq.mk                   |    4 ----
 package/dovecot/Config.in                    |    5 -----
 package/ebtables/Config.in                   |    5 -----
 package/ffmpeg/Config.in                     |    6 ------
 package/filemq/Config.in                     |    7 +++----
 package/gnuradio/Config.in                   |    6 ++----
 package/gnutls/gnutls.mk                     |    2 +-
 package/gpsd/gpsd.mk                         |    5 -----
 package/gstreamer/gst-ffmpeg/Config.in       |    4 ----
 package/gstreamer/gst-plugins-good/Config.in |    4 ----
 package/hiawatha/hiawatha.mk                 |    1 -
 package/hostapd/hostapd.mk                   |    4 ----
 package/iftop/Config.in                      |    5 ++---
 package/iptables/iptables.mk                 |    8 --------
 package/iptraf-ng/Config.in                  |    5 -----
 package/iputils/Config.in                    |    2 +-
 package/iputils/iputils.mk                   |   21 ++++++---------------
 package/jamvm/Config.in                      |    4 +---
 package/kodi/Config.in                       |    5 ++---
 package/libiio/libiio.mk                     |    2 +-
 package/libndp/Config.in                     |    4 ----
 package/libnetfilter_queue/Config.in         |    4 ----
 package/libnftnl/Config.in                   |    4 ----
 package/libnspr/libnspr.mk                   |    1 -
 package/liboping/Config.in                   |    4 ----
 package/libshairplay/Config.in               |    5 ++---
 package/libsoup/libsoup.mk                   |    7 -------
 package/libuv/Config.in                      |    5 ++---
 package/libvncserver/libvncserver.mk         |    4 ----
 package/libwebsockets/libwebsockets.mk       |    9 +--------
 package/linphone/Config.in                   |    6 ++----
 package/lsof/lsof.mk                         |    9 ++-------
 package/ltp-testsuite/Config.in              |    6 ++----
 package/lxc/Config.in                        |    5 ++---
 package/mediastreamer/Config.in              |    6 ++----
 package/minidlna/Config.in                   |    5 ++---
 package/modem-manager/Config.in              |    7 +++----
 package/mongrel2/Config.in                   |    5 ++---
 package/mono/Config.in                       |    5 ++---
 package/mpd/Config.in                        |    4 ----
 package/mplayer/mplayer.mk                   |   14 +-------------
 package/mtd/Config.in                        |    4 ----
 package/ndisc6/Config.in                     |    5 -----
 package/net-tools/net-tools.mk               |    4 +---
 package/netsnmp/netsnmp.mk                   |   11 +----------
 package/network-manager/Config.in            |    6 ++----
 package/nftables/Config.in                   |    6 ++----
 package/nginx/nginx.mk                       |    6 +++---
 package/nmap/Config.in                       |    5 ++---
 package/nodejs/Config.in                     |    6 ++----
 package/ntp/ntp.mk                           |    4 ----
 package/odhcp6c/Config.in                    |    5 -----
 package/olsr/Config.in                       |    5 ++---
 package/opencv/Config.in                     |    4 ----
 package/openntpd/Config.in                   |    5 ++---
 package/openobex/Config.in                   |    4 ----
 package/openpgm/Config.in                    |    5 ++---
 package/openvmtools/Config.in                |    5 ++---
 package/openvpn/Config.in                    |    5 -----
 package/php-zmq/Config.in                    |    7 +++----
 package/php/Config.ext                       |    4 ----
 package/php/php.mk                           |    7 -------
 package/postgresql/postgresql.mk             |    8 +-------
 package/pppd/pppd.mk                         |    5 +----
 package/proftpd/proftpd.mk                   |    3 +--
 package/python-pyzmq/Config.in               |    7 +++----
 package/qemu/Config.in                       |    5 ++---
 package/qt/qt.mk                             |    7 -------
 package/qt5/Config.in                        |    5 ++---
 package/quagga/Config.in                     |    5 -----
 package/radvd/Config.in                      |    5 -----
 package/redis/Config.in                      |    5 ++---
 package/samba/samba.mk                       |    2 +-
 package/sconeserver/sconeserver.mk           |    8 +-------
 package/ser2net/Config.in                    |    5 -----
 package/smcroute/Config.in                   |    5 -----
 package/sofia-sip/sofia-sip.mk               |    5 -----
 package/spawn-fcgi/spawn-fcgi.mk             |    4 ----
 package/squid/Config.in                      |    6 ++----
 package/strongswan/Config.in                 |    3 ---
 package/strongswan/strongswan.mk             |    4 ++--
 package/tcl/Config.in                        |    6 ++----
 package/tftpd/tftpd.mk                       |    4 ----
 package/tovid/Config.in                      |    5 ++---
 package/transmission/Config.in               |    5 ++---
 package/trinity/trinity.mk                   |    4 ----
 package/tvheadend/Config.in                  |    5 ++---
 package/ulogd/Config.in                      |    5 ++---
 package/ussp-push/Config.in                  |    5 ++---
 package/x11vnc/x11vnc.mk                     |    6 ------
 package/zeromq/Config.in                     |    7 +++----
 package/zmqpp/Config.in                      |    7 +++----
 package/zyre/Config.in                       |    7 +++----
 109 files changed, 132 insertions(+), 454 deletions(-)

Patch is too large, so refusing to show it
