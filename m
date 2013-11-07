From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 07 Nov 2013 09:24:35 +0100
Subject: [Buildroot] [PATCH 0 of 2 v2] Config.in: comments should have
	correct dependencies
Message-ID: <patchbomb.1383812675@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



This patch is yet another part of my attempts to cleanup Config.in files.
As indicated in the second patch, there is much more on my list.

In v2, I incorporated small comments from Arnout and Samuel. I think this is
ready to be merged now.

These patches are typically big as they touch a lot of files, but splitting
them up somehow looks odd to me too (there is no meaningful split). As long
as the patch is not held for too long before being merged, I don't think it
is a big problem.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---

 docs/manual/adding-packages-directory.txt        |  17 +++++++++++++++--
 fs/iso9660/Config.in                             |   3 ++-
 linux/Config.ext.in                              |   2 ++
 package/a10disp/Config.in                        |   3 ++-
 package/aiccu/Config.in                          |   1 +
 package/aircrack-ng/Config.in                    |   1 +
 package/alsamixergui/Config.in                   |   3 ++-
 package/avahi/Config.in                          |   1 +
 package/bcusdk/Config.in                         |   1 +
 package/bind/Config.in                           |   1 +
 package/blackbox/Config.in                       |   3 ++-
 package/bluez_utils/Config.in                    |   1 +
 package/bmon/Config.in                           |   1 +
 package/bonnie/Config.in                         |   1 +
 package/bustle/Config.in                         |   1 +
 package/ccid/Config.in                           |   1 +
 package/cdrkit/Config.in                         |   1 +
 package/civetweb/Config.in                       |   1 +
 package/classpath/Config.in                      |   1 +
 package/connman/Config.in                        |   2 +-
 package/conntrack-tools/Config.in                |   1 +
 package/coreutils/Config.in                      |   1 +
 package/cryptsetup/Config.in                     |   1 +
 package/curlftpfs/Config.in                      |   1 +
 package/cvs/Config.in                            |   1 +
 package/czmq/Config.in                           |   2 ++
 package/dbus-glib/Config.in                      |   4 ++--
 package/dbus-python/Config.in                    |   4 ++--
 package/dbus/Config.in                           |   1 +
 package/dmraid/Config.in                         |   1 +
 package/docker/Config.in                         |   4 ++--
 package/dropwatch/Config.in                      |   1 +
 package/dstat/Config.in                          |   1 +
 package/ebtables/Config.in                       |   1 +
 package/efl/libedbus/Config.in                   |   2 ++
 package/enlightenment/Config.in                  |   2 +-
 package/exfat/Config.in                          |   1 +
 package/fdk-aac/Config.in                        |   3 +++
 package/filemq/Config.in                         |   2 ++
 package/findutils/Config.in                      |   1 +
 package/flex/Config.in                           |   6 +++++-
 package/fltk/Config.in                           |   3 ++-
 package/foomatic-filters/Config.in               |   1 +
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |   1 +
 package/gawk/Config.in                           |   1 +
 package/gdb/Config.in                            |   2 ++
 package/gesftpserver/Config.in                   |   1 +
 package/gettext/Config.in                        |   3 ++-
 package/git/Config.in                            |   1 +
 package/gmpc/Config.in                           |   4 ++--
 package/gob2/Config.in                           |   1 +
 package/gpsd/Config.in                           |   1 +
 package/gstreamer/gst-ffmpeg/Config.in           |   1 +
 package/gtest/Config.in                          |   1 +
 package/gutenprint/Config.in                     |   1 +
 package/gvfs/Config.in                           |   1 +
 package/hiawatha/Config.in                       |   1 +
 package/hplip/Config.in                          |   1 +
 package/inotify-tools/Config.in                  |   1 +
 package/iperf/Config.in                          |   1 +
 package/jamvm/Config.in                          |   2 ++
 package/kismet/Config.in                         |   1 +
 package/libdrm/Config.in                         |   3 ++-
 package/libedit/Config.in                        |   1 +
 package/libfslvpuwrap/Config.in                  |   3 ++-
 package/libfuse/Config.in                        |   3 ++-
 package/libgail/Config.in                        |   4 ++--
 package/libglade/Config.in                       |   4 ++--
 package/libgtk2/Config.in                        |   1 +
 package/libnspr/Config.in                        |   1 +
 package/libnss/Config.in                         |   1 +
 package/libtirpc/Config.in                       |   2 ++
 package/libunwind/Config.in                      |   2 ++
 package/liburcu/Config.in                        |   1 +
 package/linknx/Config.in                         |   1 +
 package/linphone/Config.in                       |   1 +
 package/lmbench/Config.in                        |   1 +
 package/logrotate/Config.in                      |   1 +
 package/ltp-testsuite/Config.in                  |   5 +++--
 package/lttng-babeltrace/Config.in               |   4 ++--
 package/lttng-libust/Config.in                   |   4 ++--
 package/lttng-tools/Config.in                    |   1 +
 package/lvm2/Config.in                           |   3 ++-
 package/lxc/Config.in                            |   1 +
 package/lzma/Config.in                           |   3 ++-
 package/m4/Config.in                             |   1 +
 package/midori/Config.in                         |   4 +++-
 package/minicom/Config.in                        |   1 +
 package/minidlna/Config.in                       |   1 +
 package/mongoose/Config.in                       |   1 +
 package/mplayer/Config.in                        |   2 ++
 package/mutt/Config.in                           |   1 +
 package/mysql_client/Config.in                   |   1 +
 package/ndisc6/Config.in                         |   1 +
 package/neard/Config.in                          |   1 +
 package/neardal/Config.in                        |   1 +
 package/netatalk/Config.in                       |   1 +
 package/netkitbase/Config.in                     |   3 ++-
 package/netkittelnet/Config.in                   |   1 +
 package/network-manager/Config.in                |   1 +
 package/nfs-utils/Config.in                      |   1 +
 package/nmap/Config.in                           |   1 +
 package/nodejs/Config.in                         |   3 +++
 package/ntfs-3g/Config.in                        |   1 +
 package/numactl/Config.in                        |   2 ++
 package/ofono/Config.in                          |   1 +
 package/olsr/Config.in                           |   1 +
 package/on2-8170-modules/Config.in               |   1 +
 package/openobex/Config.in                       |   1 +
 package/openpowerlink/Config.in                  |   1 +
 package/openvpn/Config.in                        |   1 +
 package/oprofile/Config.in                       |   1 +
 package/p11-kit/Config.in                        |   1 +
 package/parted/Config.in                         |   3 ++-
 package/pcmanfm/Config.in                        |   4 ++--
 package/pcsc-lite/Config.in                      |   1 +
 package/php/Config.ext                           |   1 +
 package/pkg-config/Config.in                     |   3 ++-
 package/python-nfc/Config.in                     |   1 +
 package/python-pyzmq/Config.in                   |   1 +
 package/python/Config.in                         |   1 +
 package/python3/Config.in                        |   1 +
 package/qt/Config.in                             |   2 ++
 package/qt5/Config.in                            |   1 +
 package/quagga/Config.in                         |   2 +-
 package/quota/Config.in                          |   1 +
 package/radvd/Config.in                          |   1 +
 package/redis/Config.in                          |   1 +
 package/rpcbind/Config.in                        |   2 ++
 package/rpi-userland/Config.in                   |   1 +
 package/rt-tests/Config.in                       |   1 +
 package/rtorrent/Config.in                       |   1 +
 package/samba/Config.in                          |   2 ++
 package/ser2net/Config.in                        |   1 +
 package/smartmontools/Config.in                  |   1 +
 package/snowball-init/Config.in                  |   4 ++--
 package/socat/Config.in                          |   1 +
 package/socketcand/Config.in                     |   1 +
 package/sqlcipher/Config.in                      |   7 +++++--
 package/squashfs3/Config.in                      |   3 ++-
 package/squid/Config.in                          |   1 +
 package/sshfs/Config.in                          |   1 +
 package/synergy/Config.in                        |   3 ++-
 package/sysprof/Config.in                        |   3 ++-
 package/systemd/Config.in                        |   1 +
 package/transmission/Config.in                   |   1 +
 package/tvheadend/Config.in                      |   3 ++-
 package/udisks/Config.in                         |   1 +
 package/udpcast/Config.in                        |   1 +
 package/unionfs/Config.in                        |   1 +
 package/ussp-push/Config.in                      |   1 +
 package/vala/Config.in                           |   3 ++-
 package/webkit/Config.in                         |   2 ++
 package/webrtc-audio-processing/Config.in        |   1 +
 package/wget/Config.in                           |   1 +
 package/wireshark/Config.in                      |   1 +
 package/wvdial/Config.in                         |   1 +
 package/wvstreams/Config.in                      |   1 +
 package/xenomai/Config.in                        |   2 ++
 package/xscreensaver/Config.in                   |   1 +
 package/zmqpp/Config.in                          |   8 ++++++--
 package/zyre/Config.in                           |   2 ++
 system/Config.in                                 |   1 +
 163 files changed, 243 insertions(+), 52 deletions(-)
