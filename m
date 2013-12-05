From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 05 Dec 2013 11:54:05 +0100
Subject: [Buildroot] [PATCH 0 of 3] Remove uninstall commands
Message-ID: <patchbomb.1386240845@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch series removes support for the 'uninstall' commands completely.
It does not work for all packages, for some packages it is actually broken,
and we already discussed this removal a long time ago.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-autotools.txt            |   8 --------
 docs/manual/adding-packages-generic.txt              |   6 ------
 docs/manual/package-make-target.txt                  |   4 +---
 package/acpid/acpid.mk                               |   6 ------
 package/aircrack-ng/aircrack-ng.mk                   |   5 -----
 package/alsa-lib/alsa-lib.mk                         |  12 ------------
 package/alsa-utils/alsa-utils.mk                     |   4 ----
 package/at/at.mk                                     |  14 --------------
 package/axel/axel.mk                                 |   4 ----
 package/bash/bash.mk                                 |  10 ----------
 package/bind/bind.mk                                 |   7 -------
 package/bmon/bmon.mk                                 |   4 ----
 package/boa/boa.mk                                   |  11 -----------
 package/bonnie/bonnie.mk                             |   4 ----
 package/bridge-utils/bridge-utils.mk                 |   5 -----
 package/bsdiff/bsdiff.mk                             |   4 ----
 package/busybox/busybox.mk                           |   4 ----
 package/cgilua/cgilua.mk                             |   5 -----
 package/chrony/chrony.mk                             |   4 ----
 package/cjson/cjson.mk                               |  10 ----------
 package/copas/copas.mk                               |   4 ----
 package/coxpcall/coxpcall.mk                         |   4 ----
 package/cppzmq/cppzmq.mk                             |   4 ----
 package/devmem2/devmem2.mk                           |   4 ----
 package/dhrystone/dhrystone.mk                       |   4 ----
 package/dmraid/dmraid.mk                             |   6 ------
 package/dnsmasq/dnsmasq.mk                           |   5 -----
 package/doom-wad/doom-wad.mk                         |   4 ----
 package/dosfstools/dosfstools.mk                     |   6 ------
 package/dropwatch/dropwatch.mk                       |   4 ----
 package/dsp-tools/dsp-tools.mk                       |   4 ----
 package/ebtables/ebtables.mk                         |   5 -----
 package/eeprog/eeprog.mk                             |   4 ----
 package/explorercanvas/explorercanvas.mk             |   4 ----
 package/ezxml/ezxml.mk                               |  10 ----------
 package/fan-ctrl/fan-ctrl.mk                         |   4 ----
 package/fb-test-app/fb-test-app.mk                   |   7 -------
 package/fbgrab/fbgrab.mk                             |   4 ----
 package/fbset/fbset.mk                               |   4 ----
 package/fconfig/fconfig.mk                           |   4 ----
 package/feh/feh.mk                                   |   5 -----
 package/file/file.mk                                 |   5 -----
 package/fis/fis.mk                                   |   4 ----
 package/flot/flot.mk                                 |   4 ----
 package/gadgetfs-test/gadgetfs-test.mk               |   4 ----
 package/googlefontdirectory/googlefontdirectory.mk   |   4 ----
 package/gptfdisk/gptfdisk.mk                         |   4 ----
 package/gstreamer/gst-dsp/gst-dsp.mk                 |   4 ----
 package/gstreamer/gst-omapfb/gst-omapfb.mk           |   4 ----
 package/hdparm/hdparm.mk                             |   5 -----
 package/hwdata/hwdata.mk                             |   5 -----
 package/input-event-daemon/input-event-daemon.mk     |   5 -----
 package/input-tools/input-tools.mk                   |   4 ----
 package/iostat/iostat.mk                             |   5 -----
 package/iptables/iptables.mk                         |   7 -------
 package/irda-utils/irda-utils.mk                     |   4 ----
 package/iw/iw.mk                                     |   5 -----
 package/jquery-sparkline/jquery-sparkline.mk         |   4 ----
 package/jquery-ui-themes/jquery-ui-themes.mk         |   4 ----
 package/jquery-ui/jquery-ui.mk                       |   5 -----
 package/jquery-validation/jquery-validation.mk       |   4 ----
 package/jquery/jquery.mk                             |   4 ----
 package/jsmin/jsmin.mk                               |   4 ----
 package/json-javascript/json-javascript.mk           |   4 ----
 package/kismet/kismet.mk                             |  17 -----------------
 package/lbase64/lbase64.mk                           |   4 ----
 package/lcdapi/lcdapi.mk                             |  10 ----------
 package/less/less.mk                                 |   4 ----
 package/libidn/libidn.mk                             |   5 -----
 package/libjson/libjson.mk                           |  10 ----------
 package/libroxml/libroxml.mk                         |   8 --------
 package/libsvgtiny/libsvgtiny.mk                     |  10 ----------
 package/lighttpd/lighttpd.mk                         |   6 ------
 package/linenoise/linenoise.mk                       |  12 ------------
 package/linux-fusion/linux-fusion.mk                 |  10 ----------
 package/live555/live555.mk                           |  13 -------------
 package/lm-sensors/lm-sensors.mk                     |   8 --------
 package/lockfile-progs/lockfile-progs.mk             |   4 ----
 package/logrotate/logrotate.mk                       |   8 --------
 package/lsof/lsof.mk                                 |   4 ----
 package/lua-msgpack-native/lua-msgpack-native.mk     |   4 ----
 package/lua/lua.mk                                   |  18 ------------------
 package/luacjson/luacjson.mk                         |   4 ----
 package/luaexpat/luaexpat.mk                         |   5 -----
 package/luaexpatutils/luaexpatutils.mk               |   4 ----
 package/luafilesystem/luafilesystem.mk               |   4 ----
 package/luajit/luajit.mk                             |   8 --------
 package/luasec/luasec.mk                             |   6 ------
 package/luasocket/luasocket.mk                       |   9 ---------
 package/luasql/luasql.mk                             |   4 ----
 package/lvm2/lvm2.mk                                 |  10 ----------
 package/makedevs/makedevs.mk                         |   5 -----
 package/mdadm/mdadm.mk                               |   3 ---
 package/memstat/memstat.mk                           |   5 -----
 package/memtester/memtester.mk                       |   4 ----
 package/mii-diag/mii-diag.mk                         |   4 ----
 package/minidlna/minidlna.mk                         |   4 ----
 package/mongrel2/mongrel2.mk                         |   6 ------
 package/mplayer/mplayer.mk                           |   4 ----
 package/mrouted/mrouted.mk                           |   4 ----
 package/mxml/mxml.mk                                 |   2 --
 package/nano/nano.mk                                 |   4 ----
 package/nanocom/nanocom.mk                           |   4 ----
 package/ncftp/ncftp.mk                               |   4 ----
 package/neard/neard.mk                               |   4 ----
 package/netperf/netperf.mk                           |   5 -----
 package/netplug/netplug.mk                           |   6 ------
 package/netsnmp/netsnmp.mk                           |   7 -------
 package/noip/noip.mk                                 |   4 ----
 package/ntp/ntp.mk                                   |   7 -------
 package/nuttcp/nuttcp.mk                             |   4 ----
 package/openntpd/openntpd.mk                         |   6 ------
 package/openssl/openssl.mk                           |   7 -------
 package/openvpn/openvpn.mk                           |   5 -----
 package/oprofile/oprofile.mk                         |   7 -------
 package/php/php.mk                                   |  12 ------------
 package/pkg-autotools.mk                             |  25 -------------------------
 package/pkg-cmake.mk                                 |  20 --------------------
 package/pkg-generic.mk                               |  20 +-------------------
 package/portmap/portmap.mk                           |   6 ------
 package/pppd/pppd.mk                                 |  13 -------------
 package/pptp-linux/pptp-linux.mk                     |   5 -----
 package/proftpd/proftpd.mk                           |   6 ------
 package/python-nfc/python-nfc.mk                     |   4 ----
 package/python-pygame/python-pygame.mk               |   4 ----
 package/qt/qt.mk                                     |   6 ------
 package/rapidjson/rapidjson.mk                       |   4 ----
 package/rings/rings.mk                               |   5 -----
 package/rp-pppoe/rp-pppoe.mk                         |   9 ---------
 package/rrdtool/rrdtool.mk                           |   6 ------
 package/rsh-redone/rsh-redone.mk                     |   6 ------
 package/samba/samba.mk                               |   5 -----
 package/schifra/schifra.mk                           |   9 ---------
 package/sdl_sound/sdl_sound.mk                       |   7 -------
 package/slang/slang.mk                               |  16 ----------------
 package/snowball-hdmiservice/snowball-hdmiservice.mk |  12 ------------
 package/sound-theme-borealis/sound-theme-borealis.mk |   4 ----
 package/sqlcipher/sqlcipher.mk                       |  14 --------------
 package/sqlite/sqlite.mk                             |  12 ------------
 package/sredird/sredird.mk                           |   4 ----
 package/sstrip/sstrip.mk                             |   8 --------
 package/thttpd/thttpd.mk                             |  10 ----------
 package/ti-utils/ti-utils.mk                         |   5 -----
 package/tidsp-binaries/tidsp-binaries.mk             |   4 ----
 package/tn5250/tn5250.mk                             |   6 ------
 package/uboot-tools/uboot-tools.mk                   |   5 -----
 package/uemacs/uemacs.mk                             |   4 ----
 package/usb_modeswitch/usb_modeswitch.mk             |   4 ----
 package/usbmount/usbmount.mk                         |   7 -------
 package/vsftpd/vsftpd.mk                             |   7 -------
 package/whetstone/whetstone.mk                       |   4 ----
 package/wipe/wipe.mk                                 |   5 -----
 package/wireless_tools/wireless_tools.mk             |   4 ----
 package/wsapi/wsapi.mk                               |   4 ----
 package/wvdial/wvdial.mk                             |   6 ------
 package/xavante/xavante.mk                           |   6 ------
 package/xfsprogs/xfsprogs.mk                         |   1 -
 package/zlib/zlib.mk                                 |  12 ------------
 package/zmqpp/zmqpp.mk                               |  12 ------------
 package/zxing/zxing.mk                               |   8 --------
 160 files changed, 2 insertions(+), 1011 deletions(-)
