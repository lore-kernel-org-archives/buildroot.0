From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 07 Dec 2013 10:16:46 +0100
Subject: [Buildroot] [PATCH 0 of 3] Remove package clean commands
Message-ID: <patchbomb.1386407806@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As followup to the removal of package uninstall commands, this series
removes the clean commands as well, as discussed previously.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Makefile                                             |   3 +--
 boot/syslinux/syslinux.mk                            |   4 ----
 docs/manual/adding-packages-autotools.txt            |   3 ---
 docs/manual/adding-packages-cmake.txt                |   3 ---
 docs/manual/adding-packages-directory.txt            |   2 +-
 docs/manual/adding-packages-generic.txt              |   3 ---
 docs/manual/package-make-target.txt                  |   3 ---
 package/acpid/acpid.mk                               |   4 ----
 package/aircrack-ng/aircrack-ng.mk                   |   5 -----
 package/axel/axel.mk                                 |   4 ----
 package/bsdiff/bsdiff.mk                             |   4 ----
 package/busybox/busybox.mk                           |   4 ----
 package/bzip2/bzip2.mk                               |  10 ----------
 package/cjson/cjson.mk                               |   4 ----
 package/dash/dash.mk                                 |   5 -----
 package/devmem2/devmem2.mk                           |   4 ----
 package/dhrystone/dhrystone.mk                       |   4 ----
 package/distcc/distcc.mk                             |   6 ------
 package/dmalloc/dmalloc.mk                           |   9 ---------
 package/dosfstools/dosfstools.mk                     |   4 ----
 package/dropwatch/dropwatch.mk                       |   4 ----
 package/dtc/dtc.mk                                   |   6 ------
 package/elftosb/elftosb.mk                           |   4 ----
 package/ezxml/ezxml.mk                               |   4 ----
 package/fb-test-app/fb-test-app.mk                   |   4 ----
 package/fbset/fbset.mk                               |   4 ----
 package/fbv/fbv.mk                                   |   5 -----
 package/fconfig/fconfig.mk                           |   4 ----
 package/gadgetfs-test/gadgetfs-test.mk               |   4 ----
 package/hdparm/hdparm.mk                             |   4 ----
 package/httping/httping.mk                           |   4 ----
 package/input-event-daemon/input-event-daemon.mk     |   4 ----
 package/input-tools/input-tools.mk                   |   4 ----
 package/iostat/iostat.mk                             |   4 ----
 package/iozone/iozone.mk                             |   4 ----
 package/irda-utils/irda-utils.mk                     |   4 ----
 package/lbase64/lbase64.mk                           |   4 ----
 package/lcdapi/lcdapi.mk                             |   4 ----
 package/liberation/liberation.mk                     |   4 ----
 package/libfuse/libfuse.mk                           |   6 ------
 package/libjson/libjson.mk                           |   5 -----
 package/liblockfile/liblockfile.mk                   |   7 -------
 package/libnss/libnss.mk                             |   7 -------
 package/libroxml/libroxml.mk                         |   4 ----
 package/libsepol/libsepol.mk                         |   8 --------
 package/libsvgtiny/libsvgtiny.mk                     |   4 ----
 package/linenoise/linenoise.mk                       |   4 ----
 package/live555/live555.mk                           |   4 ----
 package/lm-sensors/lm-sensors.mk                     |   4 ----
 package/lmbench/lmbench.mk                           |   4 ----
 package/lockfile-progs/lockfile-progs.mk             |   4 ----
 package/logrotate/logrotate.mk                       |   4 ----
 package/lrzsz/lrzsz.mk                               |   5 -----
 package/lsof/lsof.mk                                 |   4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk     |   4 ----
 package/lua/lua.mk                                   |   8 --------
 package/luabitop/luabitop.mk                         |   4 ----
 package/luacjson/luacjson.mk                         |   4 ----
 package/luaexpat/luaexpat.mk                         |   4 ----
 package/luafilesystem/luafilesystem.mk               |   4 ----
 package/luajit/luajit.mk                             |   4 ----
 package/luasocket/luasocket.mk                       |   4 ----
 package/memtester/memtester.mk                       |   4 ----
 package/mii-diag/mii-diag.mk                         |   4 ----
 package/minidlna/minidlna.mk                         |   4 ----
 package/mplayer/mplayer.mk                           |   4 ----
 package/mrouted/mrouted.mk                           |   4 ----
 package/mtdev2tuio/mtdev2tuio.mk                     |   4 ----
 package/netplug/netplug.mk                           |   4 ----
 package/noip/noip.mk                                 |   4 ----
 package/olsr/olsr.mk                                 |   4 ----
 package/pax-utils/pax-utils.mk                       |   8 --------
 package/perl/perl.mk                                 |   4 ----
 package/pkg-autotools.mk                             |  11 -----------
 package/pkg-cmake.mk                                 |  11 -----------
 package/pkg-generic.mk                               |  10 ----------
 package/portmap/portmap.mk                           |   4 ----
 package/qt/qt.mk                                     |   4 ----
 package/qtuio/qtuio.mk                               |   7 -------
 package/rings/rings.mk                               |   4 ----
 package/schifra/schifra.mk                           |   4 ----
 package/sdl_mixer/sdl_mixer.mk                       |   6 ------
 package/slang/slang.mk                               |   4 ----
 package/snowball-hdmiservice/snowball-hdmiservice.mk |   5 -----
 package/sredird/sredird.mk                           |   4 ----
 package/sysklogd/sysklogd.mk                         |   4 ----
 package/sysvinit/sysvinit.mk                         |   4 ----
 package/tinyhttpd/tinyhttpd.mk                       |   5 -----
 package/tree/tree.mk                                 |   4 ----
 package/usb_modeswitch/usb_modeswitch.mk             |   5 -----
 package/usb_modeswitch_data/usb_modeswitch_data.mk   |   4 ----
 package/vsftpd/vsftpd.mk                             |   4 ----
 package/whetstone/whetstone.mk                       |   4 ----
 package/wireless_tools/wireless_tools.mk             |   4 ----
 package/wvdial/wvdial.mk                             |   4 ----
 package/zlib/zlib.mk                                 |   4 ----
 package/zmqpp/zmqpp.mk                               |   5 -----
 97 files changed, 2 insertions(+), 448 deletions(-)
