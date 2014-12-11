From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:48:13 +0100
Subject: [Buildroot] [git commit] Rename BR2_PREFER_STATIC_LIB to
	BR2_STATIC_LIBS
Message-ID: <20141211214826.D1F1980303@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=665e13c85e1fd216499cdd335a88a4d1c20f175f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since a while, the semantic of BR2_PREFER_STATIC_LIB has been changed
from "prefer static libraries when possible" to "use only static
libraries". The former semantic didn't make much sense, since the user
had absolutely no control/idea of which package would use static
libraries, and which packages would not. Therefore, for quite some
time, we have been starting to enforce that BR2_PREFER_STATIC_LIB
should really build everything with static libraries.

As a consequence, this patch renames BR2_PREFER_STATIC_LIB to
BR2_STATIC_LIBS, and adjust the Config.in option accordingly.

This also helps preparing the addition of other options to select
shared, shared+static or just static.

Note that we have verified that this commit can be reproduced by
simply doing a global rename of BR2_PREFER_STATIC_LIB to
BR2_STATIC_LIBS plus adding BR2_PREFER_STATIC_LIB to Config.in.legacy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Config.in                                          |    2 +-
 Config.in.legacy                                   |   12 ++++
 arch/Config.in                                     |    2 +-
 docs/manual/adding-packages-cmake.txt              |    2 +-
 docs/manual/adding-packages-directory.txt          |    2 +-
 package/Config.in                                  |    6 +-
 package/Makefile.in                                |    2 +-
 package/agentpp/Config.in                          |    4 +-
 package/aiccu/aiccu.mk                             |    2 +-
 package/aircrack-ng/Config.in                      |    2 +-
 package/aircrack-ng/aircrack-ng.mk                 |    8 +-
 package/alsa-lib/alsa-lib.mk                       |    2 +-
 package/am335x-pru-package/am335x-pru-package.mk   |    6 +-
 package/apr-util/Config.in                         |    4 +-
 package/apr/Config.in                              |    4 +-
 package/avahi/Config.in                            |    2 +-
 package/avrdude/Config.in                          |    4 +-
 package/bash/bash.mk                               |    2 +-
 package/bellagio/Config.in                         |    4 +-
 package/bind/Config.in                             |    4 +-
 package/bluez5_utils/Config.in                     |    4 +-
 package/bluez_utils/Config.in                      |    4 +-
 package/bmon/bmon.mk                               |    2 +-
 package/boost/boost.mk                             |    4 +-
 package/botan/botan.mk                             |    2 +-
 package/btrfs-progs/btrfs-progs.mk                 |    2 +-
 package/bustle/bustle.mk                           |    2 +-
 package/busybox/busybox.mk                         |    2 +-
 package/bzip2/bzip2.mk                             |    6 +-
 package/canfestival/Config.in                      |    4 +-
 package/ccid/Config.in                             |    4 +-
 package/cegui06/Config.in                          |    4 +-
 package/cifs-utils/cifs-utils.mk                   |    2 +-
 package/cjson/Config.in                            |    2 +-
 package/collectd/Config.in                         |    8 +-
 package/connman/Config.in                          |    4 +-
 package/cppcms/Config.in                           |    4 +-
 package/cppdb/Config.in                            |    4 +-
 package/cppunit/Config.in                          |    4 +-
 package/crda/Config.in                             |    4 +-
 package/crda/crda.mk                               |    2 +-
 package/cryptsetup/Config.in                       |    4 +-
 package/curlftpfs/Config.in                        |    4 +-
 package/cwiid/Config.in                            |    2 +-
 package/czmq/czmq.mk                               |    2 +-
 package/dbus/dbus.mk                               |    2 +-
 package/dhcpcd/dhcpcd.mk                           |    2 +-
 package/dhcpdump/dhcpdump.mk                       |    2 +-
 package/directfb/Config.in                         |    8 +-
 package/directfb/directfb.mk                       |    2 +-
 package/dmraid/Config.in                           |    4 +-
 package/dnsmasq/dnsmasq.mk                         |    4 +-
 package/dropbear/dropbear.mk                       |    2 +-
 package/dtc/Config.in                              |    4 +-
 package/dvb-apps/dvb-apps.mk                       |    2 +-
 package/e2fsprogs/e2fsprogs.mk                     |    2 +-
 package/ebtables/ebtables.mk                       |    4 +-
 package/ecryptfs-utils/Config.in                   |    4 +-
 package/efl/libedbus/Config.in                     |    4 +-
 package/elfutils/Config.in                         |    4 +-
 package/erlang/Config.in                           |    4 +-
 package/eudev/Config.in                            |    4 +-
 package/exfat/Config.in                            |    4 +-
 package/exim/exim.mk                               |    2 +-
 package/exiv2/Config.in                            |    4 +-
 package/faifa/Config.in                            |    4 +-
 package/fbv/fbv.mk                                 |    2 +-
 package/ffmpeg/ffmpeg.mk                           |    2 +-
 package/flann/Config.in                            |    4 +-
 package/fswebcam/Config.in                         |    4 +-
 package/gawk/Config.in                             |    4 +-
 package/gcc/gcc-final/gcc-final.mk                 |    4 +-
 package/giblib/Config.in                           |    4 +-
 package/gpm/Config.in                              |    4 +-
 package/gptfdisk/gptfdisk.mk                       |    2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk         |    2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      |    2 +-
 package/gstreamer1/gst1-plugins-ugly/Config.in     |    4 +-
 package/haserl/haserl.mk                           |    2 +-
 package/heirloom-mailx/Config.in                   |    4 +-
 package/hostapd/Config.in                          |    4 +-
 package/hostapd/hostapd.mk                         |    4 +-
 package/iftop/iftop.mk                             |    2 +-
 package/imlib2/Config.in                           |    4 +-
 package/inadyn/Config.in                           |    4 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/iptables/iptables.mk                       |    2 +-
 package/iw/iw.mk                                   |    2 +-
 package/jimtcl/jimtcl.mk                           |    2 +-
 package/kexec-lite/Config.in                       |    4 +-
 package/keyutils/keyutils.mk                       |    2 +-
 package/kmod/Config.in                             |    2 +-
 package/knock/knock.mk                             |    2 +-
 package/lftp/lftp.mk                               |    2 +-
 package/libarchive/libarchive.mk                   |    4 +-
 package/libbluray/Config.in                        |    4 +-
 package/libcap/libcap.mk                           |    2 +-
 package/libcec/Config.in                           |    4 +-
 package/libcgi/libcgi.mk                           |    2 +-
 package/libdvdnav/Config.in                        |    4 +-
 package/libdvdread/Config.in                       |    4 +-
 package/libebml/libebml.mk                         |    2 +-
 package/libesmtp/Config.in                         |    4 +-
 package/libfreefare/libfreefare.mk                 |    2 +-
 package/libfuse/Config.in                          |    4 +-
 package/libjson/libjson.mk                         |    4 +-
 package/libmatroska/libmatroska.mk                 |    2 +-
 package/libnl/Config.in                            |    4 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/libnss/Config.in                           |    4 +-
 package/libphidget/Config.in                       |    4 +-
 package/libpthread-stubs/libpthread-stubs.mk       |    2 +-
 package/libsepol/libsepol.mk                       |    2 +-
 package/libshairplay/Config.in                     |    4 +-
 package/libubox/Config.in                          |    4 +-
 package/libuci/Config.in                           |    4 +-
 package/libva-intel-driver/Config.in               |    4 +-
 package/libva/Config.in                            |    4 +-
 package/lighttpd/Config.in                         |    4 +-
 package/linux-pam/Config.in                        |    4 +-
 package/live555/live555.mk                         |    2 +-
 package/lm-sensors/lm-sensors.mk                   |    2 +-
 package/lockdev/lockdev.mk                         |    6 +-
 package/log4cxx/Config.in                          |    4 +-
 package/ltrace/Config.in                           |    4 +-
 package/lua/lua.mk                                 |    2 +-
 package/luajit/luajit.mk                           |    2 +-
 package/lvm2/Config.in                             |    4 +-
 package/lz4/lz4.mk                                 |    2 +-
 package/mesa3d/Config.in                           |    6 +-
 package/mesa3d/mesa3d.mk                           |    2 +-
 package/minidlna/minidlna.mk                       |    2 +-
 package/mpd/Config.in                              |    4 +-
 package/msmtp/msmtp.mk                             |    2 +-
 package/ncurses/ncurses.mk                         |    6 +-
 package/ne10/ne10.mk                               |    4 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/nftables/nftables.mk                       |    4 +-
 package/ngrep/ngrep.mk                             |    2 +-
 package/omniorb/omniorb.mk                         |    2 +-
 package/openobex/Config.in                         |    4 +-
 package/openssl/openssl.mk                         |   10 ++--
 package/openvmtools/Config.in                      |    4 +-
 package/openvpn/openvpn.mk                         |    2 +-
 package/p11-kit/Config.in                          |    4 +-
 package/parted/parted.mk                           |    2 +-
 package/pciutils/pciutils.mk                       |    2 +-
 package/pcsc-lite/Config.in                        |    4 +-
 package/perl-gd/Config.in                          |    4 +-
 package/perl-gdgraph/Config.in                     |    4 +-
 package/perl-io-socket-ssl/Config.in               |    4 +-
 package/perl-net-ssleay/Config.in                  |    4 +-
 package/perl-xml-libxml/Config.in                  |    4 +-
 package/perl/perl.mk                               |    2 +-
 package/phidgetwebservice/Config.in                |    4 +-
 package/php/php.mk                                 |    2 +-
 package/pkg-cmake.mk                               |    2 +-
 package/pkgconf/pkgconf.mk                         |    2 +-
 package/pppd/Config.in                             |    4 +-
 package/proxychains-ng/Config.in                   |    4 +-
 package/ptpd2/ptpd2.mk                             |    2 +-
 package/pure-ftpd/pure-ftpd.mk                     |    2 +-
 package/python-pam/Config.in                       |    4 +-
 package/qdecoder/Config.in                         |    2 +-
 package/qhull/Config.in                            |    4 +-
 package/qlibc/Config.in                            |    4 +-
 package/qt/Config.in                               |    2 +-
 package/qt5/qt5base/Config.in                      |    4 +-
 package/qt5/qt5base/qt5base.mk                     |    4 +-
 package/qt5/qt5connectivity/Config.in              |    4 +-
 package/qt5/qt5declarative/qt5declarative.mk       |    2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |    2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |    2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |    2 +-
 package/qt5/qt5quick1/Config.in                    |    4 +-
 package/qt5/qt5script/qt5script.mk                 |    2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |    2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |    2 +-
 package/qt5/qt5svg/qt5svg.mk                       |    2 +-
 package/qt5/qt5webkit/Config.in                    |    2 +-
 package/qt5/qt5websockets/qt5websockets.mk         |    2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |    2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |    2 +-
 package/rsh-redone/Config.in                       |    8 +-
 package/rtmpdump/rtmpdump.mk                       |    2 +-
 package/ruby/Config.in                             |    4 +-
 package/sconeserver/Config.in                      |    4 +-
 package/slang/slang.mk                             |    2 +-
 package/smack/Config.in                            |    4 +-
 package/snmppp/Config.in                           |    4 +-
 package/snowball-hdmiservice/Config.in             |    4 +-
 package/snowball-init/Config.in                    |    4 +-
 package/spice/Config.in                            |    4 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/sshfs/Config.in                            |    4 +-
 package/stress/stress.mk                           |    4 +-
 package/strongswan/Config.in                       |    2 +-
 package/subversion/Config.in                       |    2 +-
 package/systemd/Config.in                          |    2 +-
 package/tcpdump/tcpdump.mk                         |    2 +-
 package/thrift/thrift.mk                           |    2 +-
 package/tinyalsa/Config.in                         |    4 +-
 package/trace-cmd/Config.in                        |    4 +-
 package/tslib/Config.in                            |    4 +-
 package/uclibc/uclibc.mk                           |    4 +-
 package/udisks/Config.in                           |    4 +-
 package/ulogd/Config.in                            |    4 +-
 package/unionfs/Config.in                          |    4 +-
 package/ushare/Config.in                           |    4 +-
 package/ussp-push/Config.in                        |    4 +-
 package/util-linux/Config.in                       |    8 +-
 package/vde2/Config.in                             |    4 +-
 package/vlc/vlc.mk                                 |    2 +-
 package/wayland/Config.in                          |    4 +-
 package/weston/Config.in                           |    4 +-
 package/wireless_tools/Config.in                   |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk           |    4 +-
 package/wvstreams/wvstreams.mk                     |    2 +-
 package/x11r7/Config.in                            |    4 +-
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    4 +-
 package/x264/x264.mk                               |    2 +-
 package/xbmc/Config.in                             |   14 ++--
 package/xl2tp/xl2tp.mk                             |    2 +-
 package/xmlstarlet/xmlstarlet.mk                   |    2 +-
 package/zeromq/zeromq.mk                           |    2 +-
 package/zlib/zlib.mk                               |    2 +-
 package/zlog/Config.in                             |    4 +-
 support/scripts/scancpan                           |    4 +-
 system/Config.in                                   |    6 +-
 toolchain/toolchain-buildroot/Config.in            |    6 +-
 toolchain/toolchain-external/Config.in             |   68 ++++++++++----------
 toolchain/toolchain-external/toolchain-external.mk |    2 +-
 232 files changed, 430 insertions(+), 418 deletions(-)

Patch is too large, so refusing to show it
