From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  3 Jul 2012 00:07:32 +0200
Subject: [Buildroot] [PATCH v3 4/5] all packages: rename XXXTARGETS to
	xxx-package
In-Reply-To: <1341266746-15301-1-git-send-email-arnout@mind.be>
References: <1341266746-15301-1-git-send-email-arnout@mind.be>
Message-ID: <1341266852-18337-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove the redundant $(call ...).

This is a purely mechanical change, performed with
find package linux toolchain boot -name \*.mk | \
  xargs sed -i -e 's/$(eval $(call GENTARGETS))/$(eval $(generic-package))/' \
               -e 's/$(eval $(call AUTOTARGETS))/$(eval $(autotools-package))/' \
               -e 's/$(eval $(call CMAKETARGETS))/$(eval $(cmake-package))/'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3:
- GENTARGETS -> generic-package

 boot/at91bootstrap/at91bootstrap.mk                                  |    2 +-
 boot/at91dataflashboot/at91dataflashboot.mk                          |    2 +-
 boot/barebox/barebox.mk                                              |    2 +-
 boot/grub/grub.mk                                                    |    2 +-
 boot/lpc32xxcdl/lpc32xxcdl.mk                                        |    2 +-
 boot/syslinux/syslinux.mk                                            |    2 +-
 boot/uboot/uboot.mk                                                  |    2 +-
 boot/xloader/xloader.mk                                              |    2 +-
 linux/linux.mk                                                       |    2 +-
 package/acl/acl.mk                                                   |    2 +-
 package/acpid/acpid.mk                                               |    2 +-
 package/alsa-lib/alsa-lib.mk                                         |    2 +-
 package/alsamixergui/alsamixergui.mk                                 |    2 +-
 package/apr-util/apr-util.mk                                         |    2 +-
 package/apr/apr.mk                                                   |    2 +-
 package/argp-standalone/argp-standalone.mk                           |    2 +-
 package/argus/argus.mk                                               |    2 +-
 package/at/at.mk                                                     |    2 +-
 package/atk/atk.mk                                                   |    2 +-
 package/attr/attr.mk                                                 |    2 +-
 package/audiofile/audiofile.mk                                       |    2 +-
 package/autoconf/autoconf.mk                                         |    2 +-
 package/automake/automake.mk                                         |    2 +-
 package/avahi/avahi.mk                                               |    2 +-
 package/axel/axel.mk                                                 |    2 +-
 package/bash/bash.mk                                                 |    2 +-
 package/beecrypt/beecrypt.mk                                         |    2 +-
 package/berkeleydb/berkeleydb.mk                                     |    2 +-
 package/bind/bind.mk                                                 |    2 +-
 package/binutils/binutils.mk                                         |    2 +-
 package/bison/bison.mk                                               |    2 +-
 package/blackbox/blackbox.mk                                         |    2 +-
 package/bluez_utils/bluez_utils.mk                                   |    2 +-
 package/bmon/bmon.mk                                                 |    2 +-
 package/boa/boa.mk                                                   |    2 +-
 package/bonnie/bonnie.mk                                             |    2 +-
 package/boost/boost.mk                                               |    2 +-
 package/bootutils/bootutils.mk                                       |    2 +-
 package/bridge-utils/bridge-utils.mk                                 |    2 +-
 package/bsdiff/bsdiff.mk                                             |    2 +-
 package/busybox/busybox.mk                                           |    2 +-
 package/bwm-ng/bwm-ng.mk                                             |    2 +-
 package/bzip2/bzip2.mk                                               |    2 +-
 package/cairo/cairo.mk                                               |    2 +-
 package/can-utils/can-utils.mk                                       |    2 +-
 package/ccache/ccache.mk                                             |    2 +-
 package/cdrkit/cdrkit.mk                                             |    2 +-
 package/cgilua/cgilua.mk                                             |    2 +-
 package/cifs-utils/cifs-utils.mk                                     |    2 +-
 package/cjson/cjson.mk                                               |    2 +-
 package/cloop/cloop.mk                                               |    2 +-
 package/cmake/cmake.mk                                               |    2 +-
 package/collectd/collectd.mk                                         |    2 +-
 package/connman/connman.mk                                           |    2 +-
 package/conntrack-tools/conntrack-tools.mk                           |    2 +-
 package/copas/copas.mk                                               |    2 +-
 package/coreutils/coreutils.mk                                       |    2 +-
 package/coxpcall/coxpcall.mk                                         |    2 +-
 package/cramfs/cramfs.mk                                             |    2 +-
 package/ctorrent/ctorrent.mk                                         |    2 +-
 package/cups/cups.mk                                                 |    2 +-
 package/cvs/cvs.mk                                                   |    2 +-
 package/dash/dash.mk                                                 |    2 +-
 package/dbus-glib/dbus-glib.mk                                       |    2 +-
 package/dbus-python/dbus-python.mk                                   |    2 +-
 package/dbus/dbus.mk                                                 |    2 +-
 package/devmem2/devmem2.mk                                           |    2 +-
 package/dhcp/dhcp.mk                                                 |    2 +-
 package/dhcpdump/dhcpdump.mk                                         |    2 +-
 package/dhrystone/dhrystone.mk                                       |    2 +-
 package/dialog/dialog.mk                                             |    2 +-
 package/diffutils/diffutils.mk                                       |    2 +-
 package/directfb-examples/directfb-examples.mk                       |    2 +-
 package/directfb/directfb.mk                                         |    2 +-
 package/distcc/distcc.mk                                             |    2 +-
 package/divine/divine.mk                                             |    2 +-
 package/dmalloc/dmalloc.mk                                           |    2 +-
 package/dmidecode/dmidecode.mk                                       |    2 +-
 package/dmraid/dmraid.mk                                             |    2 +-
 package/dnsmasq/dnsmasq.mk                                           |    2 +-
 package/docker/docker.mk                                             |    2 +-
 package/dosfstools/dosfstools.mk                                     |    2 +-
 package/dropbear/dropbear.mk                                         |    2 +-
 package/dsp-tools/dsp-tools.mk                                       |    2 +-
 package/dstat/dstat.mk                                               |    2 +-
 package/e2fsprogs/e2fsprogs.mk                                       |    2 +-
 package/ebtables/ebtables.mk                                         |    2 +-
 package/ed/ed.mk                                                     |    2 +-
 package/eeprog/eeprog.mk                                             |    2 +-
 package/efl/expedite/expedite.mk                                     |    2 +-
 package/efl/libecore/libecore.mk                                     |    2 +-
 package/efl/libedbus/libedbus.mk                                     |    2 +-
 package/efl/libedje/libedje.mk                                       |    2 +-
 package/efl/libeet/libeet.mk                                         |    2 +-
 package/efl/libefreet/libefreet.mk                                   |    2 +-
 package/efl/libeina/libeina.mk                                       |    2 +-
 package/efl/libelementary/libelementary.mk                           |    2 +-
 package/efl/libembryo/libembryo.mk                                   |    2 +-
 package/efl/libethumb/libethumb.mk                                   |    2 +-
 package/efl/libevas/libevas.mk                                       |    2 +-
 package/empty/empty.mk                                               |    2 +-
 package/enchant/enchant.mk                                           |    2 +-
 package/ethtool/ethtool.mk                                           |    2 +-
 package/expat/expat.mk                                               |    2 +-
 package/explorercanvas/explorercanvas.mk                             |    2 +-
 package/ezxml/ezxml.mk                                               |    2 +-
 package/fbdump/fbdump.mk                                             |    2 +-
 package/fbgrab/fbgrab.mk                                             |    2 +-
 package/fbset/fbset.mk                                               |    2 +-
 package/fbterm/fbterm.mk                                             |    2 +-
 package/fbv/fbv.mk                                                   |    2 +-
 package/fconfig/fconfig.mk                                           |    2 +-
 package/feh/feh.mk                                                   |    2 +-
 package/fftw/fftw.mk                                                 |    2 +-
 package/file/file.mk                                                 |    2 +-
 package/findutils/findutils.mk                                       |    2 +-
 package/fis/fis.mk                                                   |    2 +-
 package/flashrom/flashrom.mk                                         |    2 +-
 package/flex/flex.mk                                                 |    2 +-
 package/flot/flot.mk                                                 |    2 +-
 package/fltk/fltk.mk                                                 |    2 +-
 package/fluxbox/fluxbox.mk                                           |    2 +-
 package/fmtools/fmtools.mk                                           |    2 +-
 package/fontconfig/fontconfig.mk                                     |    2 +-
 package/freerdp/freerdp.mk                                           |    2 +-
 package/freetype/freetype.mk                                         |    2 +-
 package/gadgetfs-test/gadgetfs-test.mk                               |    2 +-
 package/games/doom-wad/doom-wad.mk                                   |    2 +-
 package/games/gnuchess/gnuchess.mk                                   |    2 +-
 package/games/prboom/prboom.mk                                       |    2 +-
 package/games/rubix/rubix.mk                                         |    2 +-
 package/gamin/gamin.mk                                               |    2 +-
 package/gawk/gawk.mk                                                 |    2 +-
 package/gdisk/gdisk.mk                                               |    2 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                                     |    2 +-
 package/genext2fs/genext2fs.mk                                       |    2 +-
 package/genromfs/genromfs.mk                                         |    2 +-
 package/giblib/giblib.mk                                             |    2 +-
 package/glib-networking/glib-networking.mk                           |    2 +-
 package/gmp/gmp.mk                                                   |    2 +-
 package/gmpc/gmpc.mk                                                 |    2 +-
 package/gnutls/gnutls.mk                                             |    2 +-
 package/gob2/gob2.mk                                                 |    2 +-
 package/gperf/gperf.mk                                               |    2 +-
 package/gpsd/gpsd.mk                                                 |    2 +-
 package/gqview/gqview.mk                                             |    2 +-
 package/grep/grep.mk                                                 |    2 +-
 package/gtk2-engines/gtk2-engines.mk                                 |    2 +-
 package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk         |    2 +-
 package/gtkperf/gtkperf.mk                                           |    2 +-
 package/gvfs/gvfs.mk                                                 |    2 +-
 package/gzip/gzip.mk                                                 |    2 +-
 package/haserl/haserl.mk                                             |    2 +-
 package/hdparm/hdparm.mk                                             |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk                             |    2 +-
 package/hiawatha/hiawatha.mk                                         |    2 +-
 package/hostapd/hostapd.mk                                           |    2 +-
 package/htop/htop.mk                                                 |    2 +-
 package/hwdata/hwdata.mk                                             |    2 +-
 package/i2c-tools/i2c-tools.mk                                       |    2 +-
 package/icu/icu.mk                                                   |    2 +-
 package/ifplugd/ifplugd.mk                                           |    2 +-
 package/igh-ethercat/igh-ethercat.mk                                 |    2 +-
 package/imagemagick/imagemagick.mk                                   |    2 +-
 package/imlib2/imlib2.mk                                             |    2 +-
 package/inadyn/inadyn.mk                                             |    2 +-
 package/inotify-tools/inotify-tools.mk                               |    2 +-
 package/input-event-daemon/input-event-daemon.mk                     |    2 +-
 package/input-tools/input-tools.mk                                   |    2 +-
 package/intltool/intltool.mk                                         |    2 +-
 package/iostat/iostat.mk                                             |    2 +-
 package/iperf/iperf.mk                                               |    2 +-
 package/ipkg/ipkg.mk                                                 |    2 +-
 package/iproute2/iproute2.mk                                         |    2 +-
 package/ipsec-tools/ipsec-tools.mk                                   |    2 +-
 package/ipset/ipset.mk                                               |    2 +-
 package/iptables/iptables.mk                                         |    2 +-
 package/irda-utils/irda-utils.mk                                     |    2 +-
 package/iw/iw.mk                                                     |    2 +-
 package/jpeg/jpeg.mk                                                 |    2 +-
 package/jquery-sparkline/jquery-sparkline.mk                         |    2 +-
 package/jquery-validation/jquery-validation.mk                       |    2 +-
 package/jquery/jquery.mk                                             |    2 +-
 package/jsmin/jsmin.mk                                               |    2 +-
 package/json-c/json-c.mk                                             |    2 +-
 package/kbd/kbd.mk                                                   |    2 +-
 package/kexec/kexec.mk                                               |    2 +-
 package/kismet/kismet.mk                                             |    2 +-
 package/kmod/kmod.mk                                                 |    2 +-
 package/latencytop/latencytop.mk                                     |    2 +-
 package/lcdproc/lcdproc.mk                                           |    2 +-
 package/leafpad/leafpad.mk                                           |    2 +-
 package/less/less.mk                                                 |    2 +-
 package/libaio/libaio.mk                                             |    2 +-
 package/libao/libao.mk                                               |    2 +-
 package/libarchive/libarchive.mk                                     |    2 +-
 package/libargtable2/libargtable2.mk                                 |    2 +-
 package/libart/libart.mk                                             |    2 +-
 package/libatomic_ops/libatomic_ops.mk                               |    2 +-
 package/libcap-ng/libcap-ng.mk                                       |    2 +-
 package/libcap/libcap.mk                                             |    2 +-
 package/libcdaudio/libcdaudio.mk                                     |    2 +-
 package/libcgi/libcgi.mk                                             |    2 +-
 package/libcgicc/libcgicc.mk                                         |    2 +-
 package/libconfig/libconfig.mk                                       |    2 +-
 package/libconfuse/libconfuse.mk                                     |    2 +-
 package/libcue/libcue.mk                                             |    2 +-
 package/libcuefile/libcuefile.mk                                     |    2 +-
 package/libcurl/libcurl.mk                                           |    2 +-
 package/libdaemon/libdaemon.mk                                       |    2 +-
 package/libdmtx/libdmtx.mk                                           |    2 +-
 package/libdnet/libdnet.mk                                           |    2 +-
 package/libdrm/libdrm.mk                                             |    2 +-
 package/libdvdnav/libdvdnav.mk                                       |    2 +-
 package/libdvdread/libdvdread.mk                                     |    2 +-
 package/libeXosip2/libeXosip2.mk                                     |    2 +-
 package/libelf/libelf.mk                                             |    2 +-
 package/liberation/liberation.mk                                     |    2 +-
 package/libesmtp/libesmtp.mk                                         |    2 +-
 package/libev/libev.mk                                               |    2 +-
 package/libevent/libevent.mk                                         |    2 +-
 package/libexif/libexif.mk                                           |    2 +-
 package/libfcgi/libfcgi.mk                                           |    2 +-
 package/libffi/libffi.mk                                             |    2 +-
 package/libfreefare/libfreefare.mk                                   |    2 +-
 package/libftdi/libftdi.mk                                           |    2 +-
 package/libfuse/libfuse.mk                                           |    2 +-
 package/libgail/libgail.mk                                           |    2 +-
 package/libgcrypt/libgcrypt.mk                                       |    2 +-
 package/libgeotiff/libgeotiff.mk                                     |    2 +-
 package/libglade/libglade.mk                                         |    2 +-
 package/libglib2/libglib2.mk                                         |    2 +-
 package/libgpg-error/libgpg-error.mk                                 |    2 +-
 package/libgtk2/libgtk2.mk                                           |    2 +-
 package/libhid/libhid.mk                                             |    2 +-
 package/libical/libical.mk                                           |    2 +-
 package/libiconv/libiconv.mk                                         |    2 +-
 package/libid3tag/libid3tag.mk                                       |    2 +-
 package/libidn/libidn.mk                                             |    2 +-
 package/libiqrf/libiqrf.mk                                           |    2 +-
 package/liblockfile/liblockfile.mk                                   |    2 +-
 package/libmad/libmad.mk                                             |    2 +-
 package/libmbus/libmbus.mk                                           |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk                               |    2 +-
 package/libmms/libmms.mk                                             |    2 +-
 package/libmnl/libmnl.mk                                             |    2 +-
 package/libmodbus/libmodbus.mk                                       |    2 +-
 package/libmpd/libmpd.mk                                             |    2 +-
 package/libmpeg2/libmpeg2.mk                                         |    2 +-
 package/libnetfilter_conntrack/libnetfilter-conntrack.mk             |    2 +-
 package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk             |    2 +-
 package/libnfc/libnfc.mk                                             |    2 +-
 package/libnfnetlink/libnfnetlink.mk                                 |    2 +-
 package/libnl/libnl.mk                                               |    2 +-
 package/libnspr/libnspr.mk                                           |    2 +-
 package/libnss/libnss.mk                                             |    2 +-
 package/liboauth/liboauth.mk                                         |    2 +-
 package/libogg/libogg.mk                                             |    2 +-
 package/liboping/liboping.mk                                         |    2 +-
 package/libosip2/libosip2.mk                                         |    2 +-
 package/libpcap/libpcap.mk                                           |    2 +-
 package/libplayer/libplayer.mk                                       |    2 +-
 package/libpng/libpng.mk                                             |    2 +-
 package/libraw/libraw.mk                                             |    2 +-
 package/libraw1394/libraw1394.mk                                     |    2 +-
 package/libreplaygain/libreplaygain.mk                               |    2 +-
 package/libroxml/libroxml.mk                                         |    2 +-
 package/librsvg/librsvg.mk                                           |    2 +-
 package/librsync/librsync.mk                                         |    2 +-
 package/libsamplerate/libsamplerate.mk                               |    2 +-
 package/libsexy/libsexy.mk                                           |    2 +-
 package/libsigc/libsigc.mk                                           |    2 +-
 package/libsndfile/libsndfile.mk                                     |    2 +-
 package/libsoup/libsoup.mk                                           |    2 +-
 package/libsvgtiny/libsvgtiny.mk                                     |    2 +-
 package/libsysfs/libsysfs.mk                                         |    2 +-
 package/libtheora/libtheora.mk                                       |    2 +-
 package/libtool/libtool.mk                                           |    2 +-
 package/libtorrent/libtorrent.mk                                     |    2 +-
 package/libtpl/libtpl.mk                                             |    2 +-
 package/libungif/libungif.mk                                         |    2 +-
 package/libupnp/libupnp.mk                                           |    2 +-
 package/liburcu/liburcu.mk                                           |    2 +-
 package/libusb-compat/libusb-compat.mk                               |    2 +-
 package/libusb/libusb.mk                                             |    2 +-
 package/libv4l/libv4l.mk                                             |    2 +-
 package/libvncserver/libvncserver.mk                                 |    2 +-
 package/libvorbis/libvorbis.mk                                       |    2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk                     |    2 +-
 package/libxml2/libxml2.mk                                           |    2 +-
 package/libxslt/libxslt.mk                                           |    2 +-
 package/libyaml/libyaml.mk                                           |    2 +-
 package/lighttpd/lighttpd.mk                                         |    2 +-
 package/links/links.mk                                               |    2 +-
 package/linphone/linphone.mk                                         |    2 +-
 package/linux-firmware/linux-firmware.mk                             |    2 +-
 package/linux-fusion/linux-fusion.mk                                 |    2 +-
 package/lite/lite.mk                                                 |    2 +-
 package/live555/live555.mk                                           |    2 +-
 package/lm-sensors/lm-sensors.mk                                     |    2 +-
 package/lmbench/lmbench.mk                                           |    2 +-
 package/lockfile-progs/lockfile-progs.mk                             |    2 +-
 package/logrotate/logrotate.mk                                       |    2 +-
 package/logsurfer/logsurfer.mk                                       |    2 +-
 package/lrzsz/lrzsz.mk                                               |    2 +-
 package/lshw/lshw.mk                                                 |    2 +-
 package/lsof/lsof.mk                                                 |    2 +-
 package/lsuio/lsuio.mk                                               |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk                               |    2 +-
 package/ltrace/ltrace.mk                                             |    2 +-
 package/lttng-babeltrace/lttng-babeltrace.mk                         |    2 +-
 package/lttng-libust/lttng-libust.mk                                 |    2 +-
 package/lttng-modules/lttng-modules.mk                               |    2 +-
 package/lttng-tools/lttng-tools.mk                                   |    2 +-
 package/lua/lua.mk                                                   |    2 +-
 package/luafilesystem/luafilesystem.mk                               |    2 +-
 package/luasocket/luasocket.mk                                       |    2 +-
 package/lvm2/lvm2.mk                                                 |    2 +-
 package/lzma/lzma.mk                                                 |    2 +-
 package/lzo/lzo.mk                                                   |    2 +-
 package/lzop/lzop.mk                                                 |    2 +-
 package/m4/m4.mk                                                     |    2 +-
 package/make/make.mk                                                 |    2 +-
 package/makedevs/makedevs.mk                                         |    2 +-
 package/matchbox/matchbox-common/matchbox-common.mk                  |    2 +-
 package/matchbox/matchbox-desktop/matchbox-desktop.mk                |    2 +-
 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk                |    2 +-
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk              |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk                        |    2 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk                    |    2 +-
 .../matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk    |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk                          |    2 +-
 package/mdadm/mdadm.mk                                               |    2 +-
 package/mediastreamer/mediastreamer.mk                               |    2 +-
 package/memstat/memstat.mk                                           |    2 +-
 package/memtester/memtester.mk                                       |    2 +-
 package/metacity/metacity.mk                                         |    2 +-
 package/microperl/microperl.mk                                       |    2 +-
 package/midori/midori.mk                                             |    2 +-
 package/mii-diag/mii-diag.mk                                         |    2 +-
 package/minicom/minicom.mk                                           |    2 +-
 .../mobile-broadband-provider-info/mobile_broadband_provider_info.mk |    2 +-
 package/module-init-tools/module-init-tools.mk                       |    2 +-
 package/monit/monit.mk                                               |    2 +-
 package/mpc/mpc.mk                                                   |    2 +-
 package/mpfr/mpfr.mk                                                 |    2 +-
 package/mrouted/mrouted.mk                                           |    2 +-
 package/msmtp/msmtp.mk                                               |    2 +-
 package/mtd/mtd.mk                                                   |    2 +-
 package/multimedia/alsa-utils/alsa-utils.mk                          |    2 +-
 package/multimedia/aumix/aumix.mk                                    |    2 +-
 package/multimedia/bellagio/bellagio.mk                              |    2 +-
 package/multimedia/faad2/faad2.mk                                    |    2 +-
 package/multimedia/ffmpeg/ffmpeg.mk                                  |    2 +-
 package/multimedia/flac/flac.mk                                      |    2 +-
 package/multimedia/gst-dsp/gst-dsp.mk                                |    2 +-
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk                          |    2 +-
 package/multimedia/gst-omapfb/gst-omapfb.mk                          |    2 +-
 package/multimedia/gst-plugins-bad/gst-plugins-bad.mk                |    2 +-
 package/multimedia/gst-plugins-base/gst-plugins-base.mk              |    2 +-
 package/multimedia/gst-plugins-good/gst-plugins-good.mk              |    2 +-
 package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk              |    2 +-
 package/multimedia/gstreamer/gstreamer.mk                            |    2 +-
 package/multimedia/lame/lame.mk                                      |    2 +-
 package/multimedia/madplay/madplay.mk                                |    2 +-
 package/multimedia/mpd/mpd.mk                                        |    2 +-
 package/multimedia/mpg123/mpg123.mk                                  |    2 +-
 package/multimedia/mplayer/mplayer.mk                                |    2 +-
 package/multimedia/musepack/musepack.mk                              |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk                          |    2 +-
 package/multimedia/tidsp-binaries/tidsp-binaries.mk                  |    2 +-
 package/multimedia/vorbis-tools/vorbis-tools.mk                      |    2 +-
 package/multimedia/wavpack/wavpack.mk                                |    2 +-
 package/mutt/mutt.mk                                                 |    2 +-
 package/mxml/mxml.mk                                                 |    2 +-
 package/mysql_client/mysql_client.mk                                 |    2 +-
 package/nano/nano.mk                                                 |    2 +-
 package/nanocom/nanocom.mk                                           |    2 +-
 package/nasm/nasm.mk                                                 |    2 +-
 package/nbd/nbd.mk                                                   |    2 +-
 package/ncftp/ncftp.mk                                               |    2 +-
 package/ncurses/ncurses.mk                                           |    2 +-
 package/ndisc6/ndisc6.mk                                             |    2 +-
 package/neon/neon.mk                                                 |    2 +-
 package/netatalk/netatalk.mk                                         |    2 +-
 package/netcat/netcat.mk                                             |    2 +-
 package/netperf/netperf.mk                                           |    2 +-
 package/netplug/netplug.mk                                           |    2 +-
 package/netsnmp/netsnmp.mk                                           |    2 +-
 package/netstat-nat/netstat-nat.mk                                   |    2 +-
 package/network-manager/network-manager.mk                           |    2 +-
 package/nfs-utils/nfs-utils.mk                                       |    2 +-
 package/ngircd/ngircd.mk                                             |    2 +-
 package/ngrep/ngrep.mk                                               |    2 +-
 package/noip/noip.mk                                                 |    2 +-
 package/nss-mdns/nss-mdns.mk                                         |    2 +-
 package/ntfs-3g/ntfs-3g.mk                                           |    2 +-
 package/ntp/ntp.mk                                                   |    2 +-
 package/nuttcp/nuttcp.mk                                             |    2 +-
 package/ocf-linux/ocf-linux.mk                                       |    2 +-
 package/ofono/ofono.mk                                               |    2 +-
 package/olsr/olsr.mk                                                 |    2 +-
 package/open2300/open2300.mk                                         |    2 +-
 package/opencv/opencv.mk                                             |    2 +-
 package/openntpd/openntpd.mk                                         |    2 +-
 package/openocd/openocd.mk                                           |    2 +-
 package/openssh/openssh.mk                                           |    2 +-
 package/openssl/openssl.mk                                           |    2 +-
 package/openswan/openswan.mk                                         |    2 +-
 package/openvpn/openvpn.mk                                           |    2 +-
 package/opkg/opkg.mk                                                 |    2 +-
 package/oprofile/oprofile.mk                                         |    2 +-
 package/orc/orc.mk                                                   |    2 +-
 package/ortp/ortp.mk                                                 |    2 +-
 package/pango/pango.mk                                               |    2 +-
 package/parted/parted.mk                                             |    2 +-
 package/patch/patch.mk                                               |    2 +-
 package/pciutils/pciutils.mk                                         |    2 +-
 package/pcmanfm/pcmanfm.mk                                           |    2 +-
 package/pcre/pcre.mk                                                 |    2 +-
 package/php/php.mk                                                   |    2 +-
 package/picocom/picocom.mk                                           |    2 +-
 package/pixman/pixman.mk                                             |    2 +-
 package/pkg-config/pkg-config.mk                                     |    2 +-
 package/poco/poco.mk                                                 |    2 +-
 package/polarssl/polarssl.mk                                         |    2 +-
 package/popt/popt.mk                                                 |    2 +-
 package/portaudio/portaudio.mk                                       |    2 +-
 package/portmap/portmap.mk                                           |    2 +-
 package/pppd/pppd.mk                                                 |    2 +-
 package/pptp-linux/pptp-linux.mk                                     |    2 +-
 package/procps/procps.mk                                             |    2 +-
 package/proftpd/proftpd.mk                                           |    2 +-
 package/protobuf/protobuf.mk                                         |    2 +-
 package/psmisc/psmisc.mk                                             |    2 +-
 package/pv/pv.mk                                                     |    2 +-
 package/python-dpkt/python-dpkt.mk                                   |    2 +-
 package/python-id3/python-id3.mk                                     |    2 +-
 package/python-mad/python-mad.mk                                     |    2 +-
 package/python-netifaces/python-netifaces.mk                         |    2 +-
 package/python-pygame/python-pygame.mk                               |    2 +-
 package/python-serial/python-serial.mk                               |    2 +-
 package/python-setuptools/python-setuptools.mk                       |    2 +-
 package/python/python.mk                                             |    2 +-
 package/qt/qt.mk                                                     |    2 +-
 package/quagga/quagga.mk                                             |    2 +-
 package/quota/quota.mk                                               |    2 +-
 package/radvd/radvd.mk                                               |    2 +-
 package/ramspeed/ramspeed.mk                                         |    2 +-
 package/rdesktop/rdesktop.mk                                         |    2 +-
 package/read-edid/read-edid.mk                                       |    2 +-
 package/readline/readline.mk                                         |    2 +-
 package/rings/rings.mk                                               |    2 +-
 package/rng-tools/rng-tools.mk                                       |    2 +-
 package/rp-pppoe/rp-pppoe.mk                                         |    2 +-
 package/rpm/rpm.mk                                                   |    2 +-
 package/rrdtool/rrdtool.mk                                           |    2 +-
 package/rsh-redone/rsh-redone.mk                                     |    2 +-
 package/rsync/rsync.mk                                               |    2 +-
 package/rsyslog/rsyslog.mk                                           |    2 +-
 package/rt-tests/rt-tests.mk                                         |    2 +-
 package/rtai/rtai.mk                                                 |    2 +-
 package/rtorrent/rtorrent.mk                                         |    2 +-
 package/ruby/ruby.mk                                                 |    2 +-
 package/samba/samba.mk                                               |    2 +-
 package/sane-backends/sane-backends.mk                               |    2 +-
 package/sawman/sawman.mk                                             |    2 +-
 package/screen/screen.mk                                             |    2 +-
 package/sdl/sdl.mk                                                   |    2 +-
 package/sdl_gfx/sdl_gfx.mk                                           |    2 +-
 package/sdl_image/sdl_image.mk                                       |    2 +-
 package/sdl_mixer/sdl_mixer.mk                                       |    2 +-
 package/sdl_net/sdl_net.mk                                           |    2 +-
 package/sdl_sound/sdl_sound.mk                                       |    2 +-
 package/sdl_ttf/sdl_ttf.mk                                           |    2 +-
 package/sdparm/sdparm.mk                                             |    2 +-
 package/sed/sed.mk                                                   |    2 +-
 package/ser2net/ser2net.mk                                           |    2 +-
 package/setserial/setserial.mk                                       |    2 +-
 package/shared-mime-info/shared-mime-info.mk                         |    2 +-
 package/slang/slang.mk                                               |    2 +-
 package/smartmontools/smartmontools.mk                               |    2 +-
 package/socat/socat.mk                                               |    2 +-
 package/socketcand/socketcand.mk                                     |    2 +-
 package/sound-theme-freedesktop/sound-theme-freedesktop.mk           |    2 +-
 package/spawn-fcgi/spawn-fcgi.mk                                     |    2 +-
 package/speex/speex.mk                                               |    2 +-
 package/sqlcipher/sqlcipher.mk                                       |    2 +-
 package/sqlite/sqlite.mk                                             |    2 +-
 package/squashfs/squashfs.mk                                         |    2 +-
 package/squashfs3/squashfs3.mk                                       |    2 +-
 package/squid/squid.mk                                               |    2 +-
 package/sredird/sredird.mk                                           |    2 +-
 package/sshfs/sshfs.mk                                               |    2 +-
 package/sstrip/sstrip.mk                                             |    2 +-
 package/startup-notification/startup-notification.mk                 |    2 +-
 package/statserial/statserial.mk                                     |    2 +-
 package/strace/strace.mk                                             |    2 +-
 package/stress/stress.mk                                             |    2 +-
 package/stunnel/stunnel.mk                                           |    2 +-
 package/sudo/sudo.mk                                                 |    2 +-
 package/sylpheed/sylpheed.mk                                         |    2 +-
 package/synergy/synergy.mk                                           |    2 +-
 package/sysklogd/sysklogd.mk                                         |    2 +-
 package/sysstat/sysstat.mk                                           |    2 +-
 package/systemd/systemd.mk                                           |    2 +-
 package/sysvinit/sysvinit.mk                                         |    2 +-
 package/taglib/taglib.mk                                             |    2 +-
 package/tar/tar.mk                                                   |    2 +-
 package/tcl/tcl.mk                                                   |    2 +-
 package/tcpdump/tcpdump.mk                                           |    2 +-
 package/tcpreplay/tcpreplay.mk                                       |    2 +-
 package/tftpd/tftpd.mk                                               |    2 +-
 package/thttpd/thttpd.mk                                             |    2 +-
 package/ti-utils/ti-utils.mk                                         |    2 +-
 package/tiff/tiff.mk                                                 |    2 +-
 package/tinyhttpd/tinyhttpd.mk                                       |    2 +-
 package/tn5250/tn5250.mk                                             |    2 +-
 package/torsmo/torsmo.mk                                             |    2 +-
 package/transmission/transmission.mk                                 |    2 +-
 package/tremor/tremor.mk                                             |    2 +-
 package/tslib/tslib.mk                                               |    2 +-
 package/uboot-tools/uboot-tools.mk                                   |    2 +-
 package/udev/udev.mk                                                 |    2 +-
 package/udpcast/udpcast.mk                                           |    2 +-
 package/uemacs/uemacs.mk                                             |    2 +-
 package/unionfs/unionfs.mk                                           |    2 +-
 package/usb_modeswitch/usb_modeswitch.mk                             |    2 +-
 package/usbmount/usbmount.mk                                         |    2 +-
 package/usbutils/usbutils.mk                                         |    2 +-
 package/ushare/ushare.mk                                             |    2 +-
 package/util-linux/util-linux.mk                                     |    2 +-
 package/vala/vala.mk                                                 |    2 +-
 package/valgrind/valgrind.mk                                         |    2 +-
 package/vim/vim.mk                                                   |    2 +-
 package/vsftpd/vsftpd.mk                                             |    2 +-
 package/vtun/vtun.mk                                                 |    2 +-
 package/webkit/webkit.mk                                             |    2 +-
 package/webrtc-audio-processing/webrtc-audio-processing.mk           |    2 +-
 package/wget/wget.mk                                                 |    2 +-
 package/whetstone/whetstone.mk                                       |    2 +-
 package/which/which.mk                                               |    2 +-
 package/wipe/wipe.mk                                                 |    2 +-
 package/wireless_tools/wireless_tools.mk                             |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk                             |    2 +-
 package/wsapi/wsapi.mk                                               |    2 +-
 package/x11r7/libxcb/libxcb.mk                                       |    2 +-
 package/x11r7/mcookie/mcookie.mk                                     |    2 +-
 package/x11r7/mesa3d/mesa3d.mk                                       |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk                         |    2 +-
 package/x11r7/xapp_appres/xapp_appres.mk                             |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk                         |    2 +-
 package/x11r7/xapp_beforelight/xapp_beforelight.mk                   |    2 +-
 package/x11r7/xapp_bitmap/xapp_bitmap.mk                             |    2 +-
 package/x11r7/xapp_editres/xapp_editres.mk                           |    2 +-
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk                     |    2 +-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk                       |    2 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk                           |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk                           |    2 +-
 package/x11r7/xapp_ico/xapp_ico.mk                                   |    2 +-
 package/x11r7/xapp_listres/xapp_listres.mk                           |    2 +-
 package/x11r7/xapp_luit/xapp_luit.mk                                 |    2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk                       |    2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk                   |    2 +-
 package/x11r7/xapp_oclock/xapp_oclock.mk                             |    2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                                   |    2 +-
 package/x11r7/xapp_rstart/xapp_rstart.mk                             |    2 +-
 package/x11r7/xapp_scripts/xapp_scripts.mk                           |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk                           |    2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk                       |    2 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk                         |    2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk                           |    2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                                   |    2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk                           |    2 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.mk                           |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk                               |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk                     |    2 +-
 package/x11r7/xapp_xbiff/xapp_xbiff.mk                               |    2 +-
 package/x11r7/xapp_xcalc/xapp_xcalc.mk                               |    2 +-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk                     |    2 +-
 package/x11r7/xapp_xclock/xapp_xclock.mk                             |    2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk                             |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk                     |    2 +-
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk                       |    2 +-
 package/x11r7/xapp_xditview/xapp_xditview.mk                         |    2 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk                                   |    2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk                         |    2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk                         |    2 +-
 package/x11r7/xapp_xedit/xapp_xedit.mk                               |    2 +-
 package/x11r7/xapp_xev/xapp_xev.mk                                   |    2 +-
 package/x11r7/xapp_xeyes/xapp_xeyes.mk                               |    2 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk                           |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                                   |    2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk                         |    2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                                   |    2 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk                           |    2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk                             |    2 +-
 package/x11r7/xapp_xgc/xapp_xgc.mk                                   |    2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk                               |    2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk                               |    2 +-
 package/x11r7/xapp_xinput/xapp_xinput.mk                             |    2 +-
 package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk       |    2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk                           |    2 +-
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk                             |    2 +-
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk                         |    2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk                         |    2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk                               |    2 +-
 package/x11r7/xapp_xload/xapp_xload.mk                               |    2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk                               |    2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk                         |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk                     |    2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk                         |    2 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk                                 |    2 +-
 package/x11r7/xapp_xman/xapp_xman.mk                                 |    2 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.mk                         |    2 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk                                   |    2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk                           |    2 +-
 package/x11r7/xapp_xmore/xapp_xmore.mk                               |    2 +-
 package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk                 |    2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk                                   |    2 +-
 package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk   |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk                               |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk                             |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk                                 |    2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk                         |    2 +-
 package/x11r7/xapp_xset/xapp_xset.mk                                 |    2 +-
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk                         |    2 +-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk                   |    2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk                         |    2 +-
 package/x11r7/xapp_xsm/xapp_xsm.mk                                   |    2 +-
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk                         |    2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk                         |    2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk                             |    2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk                                   |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk                         |    2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk                                 |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk                                 |    2 +-
 package/x11r7/xcb-util/xcb-util.mk                                   |    2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk                       |    2 +-
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk           |    2 +-
 package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk |    2 +-
 package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk |    2 +-
 package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk   |    2 +-
 .../x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk |    2 +-
 .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk |    2 +-
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk   |    2 +-
 .../xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk     |    2 +-
 package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk   |    2 +-
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk   |    2 +-
 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk |    2 +-
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk |    2 +-
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk       |    2 +-
 .../x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk |    2 +-
 .../x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk         |    2 +-
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk     |    2 +-
 .../xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk         |    2 +-
 .../x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk |    2 +-
 .../xdriver_xf86-video-siliconmotion.mk                              |    2 +-
 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk |    2 +-
 .../x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk |    2 +-
 package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk |    2 +-
 package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk |    2 +-
 package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk |    2 +-
 package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk |    2 +-
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk       |    2 +-
 .../x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk   |    2 +-
 package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk |    2 +-
 package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk |    2 +-
 package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk     |    2 +-
 package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk       |    2 +-
 package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk   |    2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk                     |    2 +-
 package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk     |    2 +-
 package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk       |    2 +-
 .../xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk |    2 +-
 .../xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk   |    2 +-
 .../xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk   |    2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk                   |    2 +-
 package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk       |    2 +-
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk           |    2 +-
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk             |    2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk                         |    2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk                          |    2 +-
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk                 |    2 +-
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk             |    2 +-
 .../x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk |    2 +-
 .../x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk   |    2 +-
 .../x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk |    2 +-
 .../x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk   |    2 +-
 .../x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk   |    2 +-
 package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk       |    2 +-
 package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk       |    2 +-
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk             |    2 +-
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk           |    2 +-
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk           |    2 +-
 package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk             |    2 +-
 package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk         |    2 +-
 package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk   |    2 +-
 package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk   |    2 +-
 package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk       |    2 +-
 package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk           |    2 +-
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk           |    2 +-
 .../x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk   |    2 +-
 .../x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk   |    2 +-
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk           |    2 +-
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk             |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk                     |    2 +-
 .../xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk     |    2 +-
 package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk   |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk                   |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk                               |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk                             |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk                               |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk                             |    2 +-
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk               |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk                             |    2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk                             |    2 +-
 package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk               |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk                     |    2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk                     |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk                         |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk                           |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk                       |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                         |    2 +-
 package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk               |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk                             |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk                               |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk                   |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk                             |    2 +-
 package/x11r7/xlib_libXp/xlib_libXp.mk                               |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk                             |    2 +-
 package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk         |    2 +-
 package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk               |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk                       |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                     |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk                           |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk                               |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk                           |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk                               |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk                           |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk                   |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk                     |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk                             |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk                     |    2 +-
 package/x11r7/xlib_liboldX/xlib_liboldX.mk                           |    2 +-
 package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk                 |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk                     |    2 +-
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk                         |    2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk                             |    2 +-
 package/x11r7/xproto_applewmproto/xproto_applewmproto.mk             |    2 +-
 package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk             |    2 +-
 package/x11r7/xproto_compositeproto/xproto_compositeproto.mk         |    2 +-
 package/x11r7/xproto_damageproto/xproto_damageproto.mk               |    2 +-
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk                     |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk                   |    2 +-
 package/x11r7/xproto_fixesproto/xproto_fixesproto.mk                 |    2 +-
 package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk         |    2 +-
 package/x11r7/xproto_fontsproto/xproto_fontsproto.mk                 |    2 +-
 package/x11r7/xproto_glproto/xproto_glproto.mk                       |    2 +-
 package/x11r7/xproto_inputproto/xproto_inputproto.mk                 |    2 +-
 package/x11r7/xproto_kbproto/xproto_kbproto.mk                       |    2 +-
 package/x11r7/xproto_printproto/xproto_printproto.mk                 |    2 +-
 package/x11r7/xproto_randrproto/xproto_randrproto.mk                 |    2 +-
 package/x11r7/xproto_recordproto/xproto_recordproto.mk               |    2 +-
 package/x11r7/xproto_renderproto/xproto_renderproto.mk               |    2 +-
 package/x11r7/xproto_resourceproto/xproto_resourceproto.mk           |    2 +-
 package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk         |    2 +-
 package/x11r7/xproto_videoproto/xproto_videoproto.mk                 |    2 +-
 package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk         |    2 +-
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk               |    2 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk                   |    2 +-
 package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk     |    2 +-
 package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk             |    2 +-
 package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk             |    2 +-
 package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk           |    2 +-
 package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk     |    2 +-
 package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk           |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk                         |    2 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk             |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk                   |    2 +-
 package/x11r7/xutil_util-macros/xutil_util-macros.mk                 |    2 +-
 package/x11vnc/x11vnc.mk                                             |    2 +-
 package/xavante/xavante.mk                                           |    2 +-
 package/xenomai/xenomai.mk                                           |    2 +-
 package/xerces/xerces.mk                                             |    2 +-
 package/xfsprogs/xfsprogs.mk                                         |    2 +-
 package/xinetd/xinetd.mk                                             |    2 +-
 package/xl2tp/xl2tp.mk                                               |    2 +-
 package/xmlstarlet/xmlstarlet.mk                                     |    2 +-
 package/xstroke/xstroke.mk                                           |    2 +-
 package/xterm/xterm.mk                                               |    2 +-
 package/xvkbd/xvkbd.mk                                               |    2 +-
 package/xz/xz.mk                                                     |    2 +-
 package/yajl/yajl.mk                                                 |    2 +-
 package/zeromq/zeromq.mk                                             |    2 +-
 package/zlib/zlib.mk                                                 |    2 +-
 package/zxing/zxing.mk                                               |    2 +-
 821 files changed, 821 insertions(+), 821 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 5592d37..d8caed7 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -38,7 +38,7 @@ define AT91BOOTSTRAP_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(AT91BOOTSTRAP_BINARY) $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/at91dataflashboot/at91dataflashboot.mk b/boot/at91dataflashboot/at91dataflashboot.mk
index 6c0188a..10f54a1 100644
--- a/boot/at91dataflashboot/at91dataflashboot.mk
+++ b/boot/at91dataflashboot/at91dataflashboot.mk
@@ -19,4 +19,4 @@ define AT91DATAFLASHBOOT_INSTALL_IMAGES_CMDS
 	cp $(@D)/DataflashBoot-$(AT91DATAFLASHBOOT_VERSION).bin $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0cbe641..e5e2558 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -72,7 +72,7 @@ define BAREBOX_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_BAREBOX),y)
 # we NEED a board defconfig file unless we're at make source
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 1b5ca0d..e8d66f1 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -82,4 +82,4 @@ define GRUB_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/boot/grub
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index d11be6c..c4e8d2d 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -67,4 +67,4 @@ define LPC32XXCDL_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(LPC32XXCDL_BOARD_STARTUP_DIR)/$(LPC32XXCDL_S1L)/*gnu.bin $(BINARIES_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index f64eaf2..0883689 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -39,5 +39,5 @@ define HOST_SYSLINUX_CLEAN_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 486773a..9e03d6a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -119,7 +119,7 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
 # we NEED a board name unless we're at make source
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index e8dd380..fbdba02 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -19,7 +19,7 @@ define XLOADER_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/MLO $(BINARIES_DIR)/
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 #############################################################
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index f165dda..83e8d39 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -211,7 +211,7 @@ endef
 
 include linux/linux-ext-*.mk
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 ifeq ($(BR2_LINUX_KERNEL),y)
 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 48db8ae..e7a654c 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -25,4 +25,4 @@ ACL_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 317cb16..cacfb27 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -30,4 +30,4 @@ define ACPID_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 2d27c96..c3f61ff 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -83,4 +83,4 @@ define ALSA_LIB_UNINSTALL_STAGING_CMDS
 	-rm -rf $(STAGING_DIR)/usr/share/alsa
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index e8c8dda..b59de59 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -14,5 +14,5 @@ ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 564b1bb..b9ff904 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -10,4 +10,4 @@ APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
 APR_UTIL_CONF_OPT = \
 	--with-apr=$(BUILD_DIR)/apr-$(APR_VERSION) \
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 3158913..e502490 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -15,4 +15,4 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_struct_iovec=8 \
 	apr_cv_mutex_recursive=yes
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index ac0890d..47c09b2 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -18,4 +18,4 @@ define ARGP_STANDALONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/argp.h $(TARGET_DIR)/usr/include/argp.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index ac07db2..da7ecac 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -17,4 +17,4 @@ endef
 
 ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/at/at.mk b/package/at/at.mk
index c9d503a..1cea39b 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -38,4 +38,4 @@ define AT_UNINSTALL_TARGET_CMDS
 		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index d909576..0d4d690 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -54,5 +54,5 @@ ATK_DEPENDENCIES = libglib2 host-pkg-config
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index beecb31..288052d 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -24,4 +24,4 @@ ATTR_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
index 5f09f95..1c6e6de 100644
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -16,4 +16,4 @@ endef
 
 AUDIOFILE_POST_PATCH_HOOKS += AUDIOFILE_DISABLE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 8787a77..3f84e3e 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -17,7 +17,7 @@ HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 4521062..3c19085 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -23,7 +23,7 @@ endef
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..d9c0d1d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -163,4 +163,4 @@ ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 91f6d1e..893caf1 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -44,4 +44,4 @@ define AXEL_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 44f9337..1466d26 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -39,4 +39,4 @@ define BASH_UNINSTALL_TARGET_CMDS
 	fi
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 7642c1b..f3a8c03 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -33,4 +33,4 @@ endef
 BEECRYPT_POST_CONFIGURE_HOOKS += BEECRYPT_LINK_WITH_CC
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 09f35ef..d965642 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -56,4 +56,4 @@ BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 88f79de..5de451c 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -63,4 +63,4 @@ define BIND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e061fde..a91879a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -61,5 +61,5 @@ define BINUTILS_INSTALL_TARGET_CMDS
 endef
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 4ae5f2a..d0c9077 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -16,5 +16,5 @@ endef
 
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index 600ba6c..a6d4b45 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -17,4 +17,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 33d2987..643b1fe 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -45,4 +45,4 @@ BLUEZ_UTILS_CONF_OPT +=	\
 	--disable-usb
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index 98c0ab7..4ff2f1a 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -29,4 +29,4 @@ define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index c09e87f..1099808 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -25,4 +25,4 @@ define BOA_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 2251ebc..6d82b8a 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -15,4 +15,4 @@ define BONNIE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index abdf3a2..3b08bb9 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -85,4 +85,4 @@ define BOOST_INSTALL_STAGING_CMDS
 	--layout=system install)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index 35df95b..a37654b 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -8,4 +8,4 @@ BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
index 7e942ef..5f846ff 100644
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -15,4 +15,4 @@ define BRIDGE_UTILS_UNINSTALL_TARGET_CMDS
 		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bsdiff/bsdiff.mk b/package/bsdiff/bsdiff.mk
index e8d9ec0..1e05c83 100644
--- a/package/bsdiff/bsdiff.mk
+++ b/package/bsdiff/bsdiff.mk
@@ -28,4 +28,4 @@ define BSDIFF_CLEAN_CMDS
 	rm -f $(@D)/bsdiff $(@D)/bspatch
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1d988f8..394a1ae 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -197,7 +197,7 @@ define BUSYBOX_CLEAN_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
 busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index 618a61f..55ac2f1 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -13,4 +13,4 @@ BWM_NG_CONF_OPT += --with-ncurses
 BWM_NG_DEPENDENCIES += ncurses
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 61aa1e3..19fcfee 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -101,5 +101,5 @@ define HOST_BZIP2_INSTALL_CMDS
 	$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 55068dd..6b456dd 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -77,4 +77,4 @@ else
 	CAIRO_CONF_OPT += --disable-svg
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 5039043..ea1dc06 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -8,4 +8,4 @@ CAN_UTILS_VERSION = 50775159276d896d8b3102b6dbc658a91a2a1d53
 CAN_UTILS_SITE = git://gitorious.org/linux-can/can-utils.git
 CAN_UTILS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index bee34b4..b9c2039 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -42,7 +42,7 @@ endef
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_PATCH_CONFIGURATION
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 2a74826..ce89bc7 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -23,5 +23,5 @@ CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
 HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
 $(eval $(host-cmake-package))
diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index 8e5770a..038fee1 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -17,4 +17,4 @@ define CGILUA_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/cgilua.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 0fdb689..434e54d 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -8,4 +8,4 @@ endef
 
 CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index f0e1fc4..a9b0bcf 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -40,4 +40,4 @@ define CJSON_CLEAN_CMDS
 	cd $(@D)/cJSON && rm -f libcJSON.so
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 9996e67..809e531 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -14,5 +14,5 @@ define HOST_CLOOP_INSTALL_CMDS
 	$(INSTALL) -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 9b0f954..2406e5c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -17,5 +17,5 @@ define HOST_CMAKE_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 4404509..71ca660 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -125,4 +125,4 @@ define COLLECTD_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/collectd/postgresql_default.conf
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 0aa7ec7..1046cdf 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -33,4 +33,4 @@ endef
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/conntrack-tools/conntrack-tools.mk b/package/conntrack-tools/conntrack-tools.mk
index 6b9ba52..8f1159b 100644
--- a/package/conntrack-tools/conntrack-tools.mk
+++ b/package/conntrack-tools/conntrack-tools.mk
@@ -10,4 +10,4 @@ CONNTRACK_TOOLS_SITE = http://www.netfilter.org/projects/conntrack-tools/files
 CONNTRACK_TOOLS_DEPENDENCIES = host-pkg-config \
 	libnetfilter_conntrack libnetfilter_cttimeout
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 28b822c..cd9ab7a 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -17,4 +17,4 @@ define COPAS_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/copas.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index b2cca39..e64dd5a 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -81,4 +81,4 @@ COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 81125d7..94fc16c 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -17,4 +17,4 @@ define COXPCALL_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/lua/coxpcall.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index beace23..71ed8cb 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -28,5 +28,5 @@ define HOST_CRAMFS_INSTALL_CMDS
  install -D -m 755 $(@D)/cramfsck $(HOST_DIR)/usr/bin/cramfsck
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index f086447..d83011e 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -14,4 +14,4 @@ else
 CTORRENT_CONF_OPT+=--with-ssl=no
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 6d906ec..226a832 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -70,4 +70,4 @@ endef
 
 CUPS_POST_INSTALL_STAGING_HOOKS += CUPS_FIXUP_CUPS_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index b3074b0..2bc0af2 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -48,6 +48,6 @@ define CVS_INSTALL_TARGET_CMDS
 	install -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
 
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 26c6431..64f72e0 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -18,4 +18,4 @@ define DASH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/bin/dash
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 2ee52c8..93aa520 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -32,7 +32,7 @@ HOST_DBUS_GLIB_CONF_OPT = \
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # dbus-glib for the host
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index 83e3aee..c011642 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -20,4 +20,4 @@ DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
 
 DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 8cd3960..1190d2f 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -87,5 +87,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/devmem2/devmem2.mk b/package/devmem2/devmem2.mk
index f477589..cc9b218 100644
--- a/package/devmem2/devmem2.mk
+++ b/package/devmem2/devmem2.mk
@@ -28,4 +28,4 @@ define DEVMEM2_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/devmem2
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 9ec27d3..22b068a 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -61,4 +61,4 @@ define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_CLIENT)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index dd454bf..06ecec4 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -18,4 +18,4 @@ define DHCPDUMP_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/dhcpdump $(TARGET_DIR)/usr/bin/dhcpdump
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dhrystone/dhrystone.mk b/package/dhrystone/dhrystone.mk
index 098b9f1..6d3ddfa 100644
--- a/package/dhrystone/dhrystone.mk
+++ b/package/dhrystone/dhrystone.mk
@@ -29,4 +29,4 @@ define DHRYSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/dhrystone
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 175ed93..8d87b77 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -24,4 +24,4 @@ define DIALOG_POST_CLEAN
 	rm -f $(TARGET_DIR)/usr/bin/dialog
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6d1896a..d6029a4 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -14,4 +14,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index d8e61f7..8d03898 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -100,5 +100,5 @@ define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 2c32bcb..beba05a 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -140,7 +140,7 @@ endef
 
 DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # directfb-csource for the host
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index dc3b36b..1e09f57 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -20,4 +20,4 @@ define DISTCC_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 3e8d093..779322e 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -10,4 +10,4 @@ DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 89d067d..e2fdda4 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -55,4 +55,4 @@ define DMALLOC_CLEAN_CMDS
 endef
 
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dmidecode/dmidecode.mk b/package/dmidecode/dmidecode.mk
index a036a7a..5d84294 100644
--- a/package/dmidecode/dmidecode.mk
+++ b/package/dmidecode/dmidecode.mk
@@ -15,4 +15,4 @@ define DMIDECODE_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 7763aaa..3fb2375 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -26,4 +26,4 @@ define DMRAID_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 2b22c10..1f714bf 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -95,4 +95,4 @@ define DNSMASQ_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/dnsmasq.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index fd12cce..9839d88 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -18,4 +18,4 @@ DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
 DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 7a8a7e8..08201d3 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -34,4 +34,4 @@ define DOSFSTOOLS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fea96d6..64d3a01 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -69,4 +69,4 @@ define DROPBEAR_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
index b9fed0b..42aac05 100644
--- a/package/dsp-tools/dsp-tools.mk
+++ b/package/dsp-tools/dsp-tools.mk
@@ -15,4 +15,4 @@ define DSP_TOOLS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/dsp-, load probe test exec)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index a19d1d4..67db63a 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -12,4 +12,4 @@ define DSTAT_INSTALL_TARGET_CMDS
        $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 6a790d2..16725ac 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -103,5 +103,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
index ddda985..b3068f4 100644
--- a/package/ebtables/ebtables.mk
+++ b/package/ebtables/ebtables.mk
@@ -28,4 +28,4 @@ define EBTABLES_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/ebtables
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index f5a4b22..a97e19b 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -9,4 +9,4 @@ ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/eeprog/eeprog.mk b/package/eeprog/eeprog.mk
index 7520744..e64fa06 100644
--- a/package/eeprog/eeprog.mk
+++ b/package/eeprog/eeprog.mk
@@ -19,4 +19,4 @@ define EEPROG_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/eeprog
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
index 4c01190..a841ac9 100644
--- a/package/efl/expedite/expedite.mk
+++ b/package/efl/expedite/expedite.mk
@@ -8,4 +8,4 @@ EXPEDITE_VERSION = 1.1.0
 EXPEDITE_SITE = http://download.enlightenment.org/releases/
 EXPEDITE_DEPENDENCIES = libevas libeina libeet
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
index 7d2884f..df8db0d 100644
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -98,5 +98,5 @@ else
 LIBECORE_CONF_OPT += --disable-ecore-evas
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
index c03474d..04c48a4 100644
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -31,4 +31,4 @@ else
 LIBEDBUS_CONF_OPT += --disable-enotify
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index 1d94349..e6d9ab3 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -20,5 +20,5 @@ endif
 
 HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
index e508f53..3ca12d3 100644
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -11,5 +11,5 @@ LIBEET_INSTALL_STAGING = YES
 
 LIBEET_DEPENDENCIES = host-pkg-config zlib jpeg libeina
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libefreet/libefreet.mk b/package/efl/libefreet/libefreet.mk
index 14fb8cb..2f00bcf 100644
--- a/package/efl/libefreet/libefreet.mk
+++ b/package/efl/libefreet/libefreet.mk
@@ -11,4 +11,4 @@ LIBEFREET_INSTALL_STAGING = YES
 
 LIBEFREET_DEPENDENCIES = libeina libeet libecore
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
index 2e57b99..2391379 100644
--- a/package/efl/libeina/libeina.mk
+++ b/package/efl/libeina/libeina.mk
@@ -11,5 +11,5 @@ LIBEINA_INSTALL_STAGING = YES
 
 LIBEINA_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
index 475fd45..83c9005 100644
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -15,4 +15,4 @@ LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
 LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
index 5456a06..db1696d 100644
--- a/package/efl/libembryo/libembryo.mk
+++ b/package/efl/libembryo/libembryo.mk
@@ -11,5 +11,5 @@ LIBEMBRYO_INSTALL_STAGING = YES
 
 LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
index 617de0d..92e4c83 100644
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -21,4 +21,4 @@ ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
 LIBETHUMB_DEPENDENCIES += libedbus
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index db6e2df..a6f38f7 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -212,5 +212,5 @@ ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 LIBEVAS_CONF_OPT += --disable-doc
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 137e196..97b1e7e 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -15,4 +15,4 @@ define EMPTY_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 9d7ae0e..215425a 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -9,4 +9,4 @@ ENCHANT_SITE = http://www.abisource.com/downloads/enchant/$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
 ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index bbbcf1e..63a8d54 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -7,4 +7,4 @@
 ETHTOOL_VERSION = 3.4.1
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 9221268..663abcd 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -11,5 +11,5 @@ EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/explorercanvas/explorercanvas.mk b/package/explorercanvas/explorercanvas.mk
index 93dcb1f..968843c 100644
--- a/package/explorercanvas/explorercanvas.mk
+++ b/package/explorercanvas/explorercanvas.mk
@@ -15,4 +15,4 @@ define EXPLORERCANVAS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/excanvas.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/ezxml/ezxml.mk b/package/ezxml/ezxml.mk
index 321e466..57c3ffb 100644
--- a/package/ezxml/ezxml.mk
+++ b/package/ezxml/ezxml.mk
@@ -37,4 +37,4 @@ define EZXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) -f GNUmakefile clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index eca432e..176d254 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -7,5 +7,5 @@ FBDUMP_VERSION:=0.4.2
 FBDUMP_SOURCE:=fbdump-$(FBDUMP_VERSION).tar.gz
 FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 892043e..b0b46cb 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -15,4 +15,4 @@ define FBGRAB_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fbgrab
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index 95d8aa7..3423259 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -29,4 +29,4 @@ define FBSET_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
index ddb5b2b..fcb2570 100644
--- a/package/fbterm/fbterm.mk
+++ b/package/fbterm/fbterm.mk
@@ -9,4 +9,4 @@ FBTERM_SITE = http://fbterm.googlecode.com/files/
 
 FBTERM_DEPENDENCIES = fontconfig liberation
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 7db6802..7949e99 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -50,4 +50,4 @@ define FBV_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 8144a16..4eb7c9e 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -25,4 +25,4 @@ define FCONFIG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 4f326ef..9084b65 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -18,4 +18,4 @@ define FEH_UNINSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index f9d0fba..f846ffc 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -8,4 +8,4 @@ FFTW_VERSION = 3.3
 FFTW_SITE = http://www.fftw.org
 FFTW_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/file/file.mk b/package/file/file.mk
index bf4d0c7..a50c134 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -15,5 +15,5 @@ define FILE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 7c9e596..43aef75 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,4 +9,4 @@ FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/fis/fis.mk b/package/fis/fis.mk
index d2cd196..60c2ae8 100644
--- a/package/fis/fis.mk
+++ b/package/fis/fis.mk
@@ -21,4 +21,4 @@ define FIS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/fis
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index c019f2d..4b310ef 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -17,4 +17,4 @@ define FLASHROM_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/sbin/flashrom
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index d1a9a2b..16f6801 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -43,5 +43,5 @@ FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
 FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 8b51b55..f4ba604 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -20,4 +20,4 @@ define FLOT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.flot*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 1686a58..a5dac37 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -13,4 +13,4 @@ FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
 FLTK_CONF_OPT = --enable-threads --with-x
 FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 5848606..6d7ff95 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -20,4 +20,4 @@ endef
 
 FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index f705173..c79ecfe 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -16,4 +16,4 @@ define FMTOOLS_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/fmscan $(TARGET_DIR)/usr/sbin/fmscan
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index a993c9c..843b34f 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -25,5 +25,5 @@ HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
 		--disable-static
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index aeef3fc..79b2a23 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -59,4 +59,4 @@ else
 FREERDP_CONF_OPT += -DWITH_XV=OFF
 endif
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 5cf85ff..43cc1c5 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -33,5 +33,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index 46bfd24..808618b 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -29,4 +29,4 @@ define GADGETFS_TEST_CLEAN_CMDS
 	-$(MAKE) -C $(@D) $(GADGETFS_TEST_MAKEOPTS) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/games/doom-wad/doom-wad.mk b/package/games/doom-wad/doom-wad.mk
index 1143b3d..ae5dcef 100644
--- a/package/games/doom-wad/doom-wad.mk
+++ b/package/games/doom-wad/doom-wad.mk
@@ -21,4 +21,4 @@ define DOOM_WAD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/games/doom/doom1.wad
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/games/gnuchess/gnuchess.mk b/package/games/gnuchess/gnuchess.mk
index a627844..3e0b724 100644
--- a/package/games/gnuchess/gnuchess.mk
+++ b/package/games/gnuchess/gnuchess.mk
@@ -9,5 +9,5 @@ GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 
 GNUCHESS_DEPENDENCIES = $(if $(BR2_PACKAGE_READLINE),readline)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 9ffecee..4dbfd1d 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -41,4 +41,4 @@ define PRBOOM_UINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/games/prboom
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index a66e6e1..2087b51 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -12,5 +12,5 @@ RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB=
 
 RUBIX_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index 5858138..b13a9ac 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -22,5 +22,5 @@ endif
 
 GAMIN_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index bb91157..58c96ce 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -30,5 +30,5 @@ define GAWK_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/awk
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gdisk/gdisk.mk b/package/gdisk/gdisk.mk
index a53ee83..d7c8bec 100644
--- a/package/gdisk/gdisk.mk
+++ b/package/gdisk/gdisk.mk
@@ -36,4 +36,4 @@ endef
 
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 2192eb9..751f499 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -46,7 +46,7 @@ endef
 
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
 HOST_GDK_PIXBUF_CONF_OPT = \
 	--without-libjpeg \
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index e5c4504..9757d9f 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -8,5 +8,5 @@ GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
index 56d1de0..c1cd608 100644
--- a/package/genromfs/genromfs.mk
+++ b/package/genromfs/genromfs.mk
@@ -27,5 +27,5 @@ define HOST_GENROMFS_INSTALL_CMDS
   $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
\ No newline at end of file
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 75012ea..751534c 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -13,4 +13,4 @@ GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 9165835..385ad47 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -25,4 +25,4 @@ else
 GLIB_NETWORKING_CONF_OPT += --without-gnutls
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index a07f74b..5bcc6c1 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,5 +14,5 @@ ifeq ($(ARCH),arm)
 GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 1db5346..51d0cd9 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -13,4 +13,4 @@ GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	xlib_libICE xlib_libSM xlib_libX11 \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index eb15966..1ec10b9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -12,4 +12,4 @@ GNUTLS_CONF_OPT = --with-libgcrypt --without-libgcrypt-prefix \
 		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 8dac356..3757f85 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -9,7 +9,7 @@ GOB2_SITE = http://ftp.5z.com/pub/gob
 GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # gob2 for the host
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 21e4cc7..1254f0c 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -7,5 +7,5 @@
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 94f39aa..2ba5f71 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -182,4 +182,4 @@ define GPSD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index b87ad76..2f64cd0 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -8,5 +8,5 @@ GQVIEW_SOURCE = gqview-$(GQVIEW_VERSION).tar.gz
 GQVIEW_SITE = http://prdownloads.sourceforge.net/gqview
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 389aa3b..88a07f4 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -21,4 +21,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GREP_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index b8694ad..1551ad5 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -83,4 +83,4 @@ GTK2_ENGINES_CONF_OPT = \
 		--disable-paranoia \
 		--disable-deprecated
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
index 055205c..3a26cfc 100644
--- a/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
+++ b/package/gtk2-themes/gtk2-theme-hicolor/gtk2-theme-hicolor.mk
@@ -9,4 +9,4 @@ GTK2_THEME_HICOLOR_SITE = http://icon-theme.freedesktop.org/releases/
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 5459e69..7b63dcb 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -8,5 +8,5 @@ GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
 GTKPERF_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f56c14a..dcb94ee 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -76,4 +76,4 @@ GVFS_POST_INSTALL_TARGET_HOOKS += \
 	GVFS_REMOVE_TARGET_SCHEMAS	\
 	GVFS_COMPILE_SCHEMAS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 5fad001..0c5c124 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -7,4 +7,4 @@
 GZIP_VERSION = 1.5
 GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index dfe4cf0..14226c5 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -21,4 +21,4 @@ endef
 
 HASERL_POST_INSTALL_TARGET_HOOKS += HASERL_REMOVE_EXAMPLES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index fb90ce2..c524c62 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -33,4 +33,4 @@ define HDPARM_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index b1779c0..f3779af 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -29,4 +29,4 @@ define HEIRLOOM_MAILX_INSTALL_TARGET_CMDS
 		install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 941ee8d..db5b277 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -16,4 +16,4 @@ HIAWATHA_CONF_OPT += \
 	-DWEBROOT_DIR=/var/www/hiawatha \
 	-DWORK_DIR=/var/lib/hiawatha
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index c7c59ec..82d6231 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -105,4 +105,4 @@ define HOSTAPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/hostapd_cli
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 07b750c..bd6987b 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -11,4 +11,4 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 HTOP_CONF_OPT += --disable-unicode
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index e4f72a5..c56dea4 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -18,4 +18,4 @@ define HWDATA_UNINSTALL_TARGET_CMDS
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index aeabf02..3e1d9ee 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -19,4 +19,4 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 57aba22..6978770 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -25,5 +25,5 @@ endef
 
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index cb06b63..3c581a6 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -33,4 +33,4 @@ endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index f04eb57..9182f76 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -26,4 +26,4 @@ endef
 
 IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 5cbb147..ede129a 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -120,4 +120,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
index f32b865..c94d96d 100644
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -60,5 +60,5 @@ endef
 
 IMLIB2_POST_INSTALL_STAGING_HOOKS += IMLIB2_FIXUP_IMLIB2_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5cba77b..ea25e01 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -20,4 +20,4 @@ define INADYN_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index ad47909..52a1701 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,4 +5,4 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index a938ae7..0683056 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -33,4 +33,4 @@ define INPUT_EVENT_DAEMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/input-event-daemon.conf
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 4236c74..c73a193 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -47,4 +47,4 @@ define INPUT_TOOLS_CLEAN_CMDS
 	rm -f $(addprefix $(@D)/,$(INPUT_TOOLS_TARGETS_y))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 8ce66f7..19b5238 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -12,6 +12,6 @@ HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index d3efa59..0b7942d 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -28,4 +28,4 @@ define IOSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 26cd3fb..fdf1d47 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -16,4 +16,4 @@ IPERF_CONF_OPT = \
 	--disable-dependency-tracking \
 	--disable-web100
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index ecb97b6..c63f03f 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -9,4 +9,4 @@ IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
 IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
 IPKG_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index e766374..27bc56f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -52,4 +52,4 @@ define IPROUTE2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index f24e4a4..ba92410 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -66,4 +66,4 @@ ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
 IPSEC_TOOLS_CONF_OPT+= --enable-security-context=kernel
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 3cd1263..01258e5 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -10,4 +10,4 @@ IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 IPSET_CONF_OPT = --with-kmod=no
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 5c6a8a6..a5ec6a7 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -43,4 +43,4 @@ define IPTABLES_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/irda-utils/irda-utils.mk b/package/irda-utils/irda-utils.mk
index cbc6886..b2b84d5 100644
--- a/package/irda-utils/irda-utils.mk
+++ b/package/irda-utils/irda-utils.mk
@@ -43,4 +43,4 @@ define IRDA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(IRDA_UTILS_SBINS-))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2b322f6..1f26ab4 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -38,4 +38,4 @@ define IW_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/iw.8*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index d4e9483..d7ef25a 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -14,5 +14,5 @@ endef
 
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
index d0b478a..d79e762 100644
--- a/package/jquery-sparkline/jquery-sparkline.mk
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -15,4 +15,4 @@ define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 5fee4c1..7d30270 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -15,4 +15,4 @@ define JQUERY_VALIDATION_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.validate.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 08dd4a3..fb3a1b4 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -15,4 +15,4 @@ define JQUERY_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/var/www/jquery.js
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 9ed9215..fb8c214 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -21,5 +21,5 @@ define HOST_JSMIN_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/jsmin $(HOST_DIR)/usr/bin/jsmin
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 81a02b0..ed4a6d0 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -8,4 +8,4 @@ JSON_C_VERSION = 0.9
 JSON_C_SITE = http://oss.metaparadigm.com/json-c/
 JSON_C_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index af30e8e..a52ad5a 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,4 +4,4 @@ KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index ef99dfb..a8192f7 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -20,4 +20,4 @@ endef
 
 KEXEC_POST_INSTALL_TARGET_HOOKS += KEXEC_REMOVE_LIB_TOOLS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 854c9dd..c8ae8e3 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -64,4 +64,4 @@ define KISMET_UNINSTALL_TARGET_CMDS
 	$(KISMET_UNINSTALL_TARGET_CONFIGS)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index be640c7..fb9706c 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -30,4 +30,4 @@ else
 KMOD_CONF_OPT += --disable-tools
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index 73d5ba2..84e75db 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -18,4 +18,4 @@ define LATENCYTOP_INSTALL_TARGET_CMDS
 	$(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR) HAS_GTK_GUI=
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index 745b386..1275ddf 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -11,4 +11,4 @@ LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS)
 
 LCDPROC_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 7e4d179..ede8c58 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -8,5 +8,5 @@ LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/less/less.mk b/package/less/less.mk
index 5f74f5c..b758e46 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -16,4 +16,4 @@ define LESS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/less
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 05a4d5c..7bcdfa2 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -20,5 +20,5 @@ define LIBAIO_INSTALL_TARGET_CMDS
   $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 617b1ee..74322b2 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -18,4 +18,4 @@ else
 LIBAO_CONF_OPT += --disable-alsa
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 087032d..d25f7f8 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -23,4 +23,4 @@ else
 LIBARCHIVE_CONF_OPT += --without-xml2
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index d192923..d5172d2 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -14,4 +14,4 @@ LIBARGTABLE2_CONF_OPT= --disable-example \
 		--enable-lib \
 		--enable-util
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index a37095d..0505ff5 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -10,4 +10,4 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index e0b19f4..6d50d0a 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -9,4 +9,4 @@ LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 4a52702..7a1650c 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -11,4 +11,4 @@ LIBCAP_NG_INSTALL_STAGING = YES
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPT = --without-python
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 63159d2..16b7262 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -38,5 +38,5 @@ define HOST_LIBCAP_INSTALL_CMDS
 		prefix=/usr lib=lib install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 8ceb87a..86b59a3 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -11,4 +11,4 @@ LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 5a52fa6..549d0f2 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -10,4 +10,4 @@ LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 0ea63b5..98b8e5f 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -13,4 +13,4 @@ LIBCGICC_CONF_OPT = \
 	--disable-demos \
 	--disable-doc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index f81f419..3e7aa11 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -12,4 +12,4 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT += --disable-cxx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index feababf..2fa8241 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -9,4 +9,4 @@ LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index b815c0f..4ef1145 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -10,4 +10,4 @@ LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
index 7e1c843..ceb1509 100644
--- a/package/libcuefile/libcuefile.mk
+++ b/package/libcuefile/libcuefile.mk
@@ -20,4 +20,4 @@ endef
 LIBCUEFILE_POST_INSTALL_STAGING_HOOKS += LIBCUEFILE_INSTALL_STAGING_INCLUDES
 LIBCUEFILE_POST_INSTALL_TARGET_HOOKS += LIBCUEFILE_INSTALL_TARGET_INCLUDES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 50a55b4..d6882fd 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -36,7 +36,7 @@ endef
 
 LIBCURL_POST_INSTALL_STAGING_HOOKS += LIBCURL_STAGING_FIXUP_CURL_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
 curl: libcurl
 curl-clean: libcurl-clean
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index c04537a..1bdc1e2 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -11,4 +11,4 @@ LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
 LIBDAEMON_CONF_OPT = --disable-lynx
 LIBDAEMON_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
index 495e59a..800b4ff 100644
--- a/package/libdmtx/libdmtx.mk
+++ b/package/libdmtx/libdmtx.mk
@@ -9,4 +9,4 @@ LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
 LIBDMTX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdmtx
 LIBDMTX_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index f351d6b..e622dd4 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -36,4 +36,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index e88a163..6bd65f9 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -28,4 +28,4 @@ ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index 1c38904..e2d42f3 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -16,4 +16,4 @@ LIBDVDNAV_DEPENDENCIES = libdvdread host-pkg-config
 # of cross compilation, we prefer using pkg-config.
 LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 3a9d5be..6e17731 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,4 +11,4 @@ LIBDVDREAD_AUTORECONF = YES
 LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 24ca7ce..6770276 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -17,4 +17,4 @@ else
 LIBEXOSIP2_CONF_OPT += --disable-openssl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 13ad371..daee7fd 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -18,4 +18,4 @@ LIBELF_CONF_OPT = --disable-sanity-checks \
 		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
 		$(if $(BR2_LARGEFILE),--enable-elf64)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 3686d55..7d55650 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -18,4 +18,4 @@ define LIBERATION_CLEAN_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/libesmtp/libesmtp.mk b/package/libesmtp/libesmtp.mk
index f9be7cc..078a729 100644
--- a/package/libesmtp/libesmtp.mk
+++ b/package/libesmtp/libesmtp.mk
@@ -10,4 +10,4 @@ LIBESMTP_INSTALL_STAGING = YES
 
 LIBESMTP_DEPENDENCIES = $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index 6656d15..564db37 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -8,4 +8,4 @@ LIBEV_SOURCE = libev-$(LIBEV_VERSION).tar.gz
 LIBEV_SITE = http://dist.schmorp.de/libev/
 LIBEV_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 733e29d..5ce511f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -18,4 +18,4 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 1832a7e..7054b50 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -11,4 +11,4 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 22ac2f1..1aa2c5a 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -9,4 +9,4 @@ LIBFCGI_SITE = http://www.fastcgi.com/dist
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 5874218..81ac043 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -31,6 +31,6 @@ endef
 
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 16ef8fb..3f0036a 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -7,4 +7,4 @@ LIBFREEFARE_VERSION = 0.3.2
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
 LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index b50791e..d0f5ef6 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -20,5 +20,5 @@ else
 LIBFDTI_CONF_OPT += --disable-libftdipp
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
index c95ea3e..5f748b4 100644
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -26,4 +26,4 @@ define LIBFUSE_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 3c42e6c..e8a8a60 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -17,4 +17,4 @@ endif
 
 LIBGAIL_DEPENDENCIES = host-pkg-config libgtk2 pango
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 68c6c47..db5781b 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -17,4 +17,4 @@ LIBGCRYPT_CONF_OPT = \
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index a704754..3bf4206 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -9,4 +9,4 @@ LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_DEPENDENCIES = tiff
 LIBGEOTIFF_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index 1bb9d14..78a1fdb 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -16,4 +16,4 @@ endef
 
 LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index ce33b79..2b2bd32 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -88,7 +88,7 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1b78b17..96cbbd6 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -8,4 +8,4 @@ LIBGPG_ERROR_VERSION = 1.10
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 40934ad..e80e137 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -151,5 +151,5 @@ define HOST_LIBGTK2_INSTALL_CMDS
  cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index 8ad9ac1..bad014b 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -18,4 +18,4 @@ LIBHID_CONF_OPT = \
 	--without-doxygen \
 	--disable-package-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index ee251eb..7c5c881 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -8,5 +8,5 @@ LIBICAL_VERSION = 0.48
 LIBICAL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 LIBICAL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 48a380f..ce1d7e2 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -20,7 +20,7 @@ endef
 LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
 # Configurations where the toolchain supports locales and the libiconv
 # package is enabled are incorrect, because the toolchain already
diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index def2dbc..20579d6 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -11,4 +11,4 @@ LIBID3TAG_INSTALL_STAGING=YES
 LIBID3TAG_DEPENDENCIES=zlib
 LIBID3TAG_LIBTOOL_PATCH=NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 6d2bea6..c55f2c5 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -30,4 +30,4 @@ define LIBIDN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/idn
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index 81e8421..4cf1541 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -10,5 +10,5 @@ LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 7c8cd8a..037983e 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -29,4 +29,4 @@ define LIBLOCKFILE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 6e53cf2..04d9588 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -32,4 +32,4 @@ LIBMAD_CONF_OPT = \
 		--disable-debugging \
 		--enable-speed
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 17954b9..16e9e6a 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -12,4 +12,4 @@ LIBMBUS_INSTALL_STAGING = YES
 #   cannot find input file: `test/Makefile.in'
 LIBMBUS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ff2b55d..f8690ee 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -16,4 +16,4 @@ else
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 45d1844..1058303 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -11,4 +11,4 @@ LIBMMS_INSTALL_STAGING = YES
 
 LIBMMS_DEPENDENCIES = host-pkg-config libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 52719cd..75bb238 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -9,4 +9,4 @@ LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index d45bc92..a390655 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -7,4 +7,4 @@ LIBMODBUS_VERSION = 3.0.3
 LIBMODBUS_SITE = http://github.com/downloads/stephane/libmodbus
 LIBMODBUS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
index 9fd12f5..a2b9d56 100644
--- a/package/libmpd/libmpd.mk
+++ b/package/libmpd/libmpd.mk
@@ -9,4 +9,4 @@ LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index 5290af1..dbb7114 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -27,4 +27,4 @@ endef
 LIBMPEG2_POST_INSTALL_TARGET_HOOKS += LIBMPEG2_REMOVE_BINS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
index 3313e23..c602903 100644
--- a/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
+++ b/package/libnetfilter_conntrack/libnetfilter-conntrack.mk
@@ -10,4 +10,4 @@ LIBNETFILTER_CONNTRACK_SITE = http://www.netfilter.org/projects/libnetfilter_con
 LIBNETFILTER_CONNTRACK_INSTALL_STAGING = YES
 LIBNETFILTER_CONNTRACK_DEPENDENCIES = host-pkg-config libnfnetlink
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
index b3e1149..4792980 100644
--- a/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
+++ b/package/libnetfilter_cttimeout/libnetfilter-cttimeout.mk
@@ -10,4 +10,4 @@ LIBNETFILTER_CTTIMEOUT_SITE = http://www.netfilter.org/projects/libnetfilter_ctt
 LIBNETFILTER_CTTIMEOUT_INSTALL_STAGING = YES
 LIBNETFILTER_CTTIMEOUT_DEPENDENCIES = host-pkg-config libmnl
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index eef09b0..95cf61d 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -21,4 +21,4 @@ else
 LIBNFC_CONF_OPT += --disable-example
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 67ea266..9af28d8 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -9,4 +9,4 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 82d9b76..f757b1b 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -26,4 +26,4 @@ ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_POST_INSTALL_TARGET_HOOKS += LIBNL_REMOVE_TOOLS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 24b5370..c2cc996 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -14,4 +14,4 @@ LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 # NSPR mixes up --build and --host
 LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ea6a329..2e28c75 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -64,4 +64,4 @@ define LIBNSS_CLEAN_CMDS
 					BUILD_OPT=1
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 8646947..6695fcb 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -16,4 +16,4 @@ else
 LIBOAUTH_CONF_OPT += --disable-libcurl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index c3d4897..4020d62 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -9,4 +9,4 @@ LIBOGG_INSTALL_STAGING = YES
 
 LIBOGG_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index e0d892b..e253fbd 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -10,4 +10,4 @@ LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
 LIBOPING_CONF_OPT = --without-perl-bindings
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 2cde27f..713851b 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -8,4 +8,4 @@ LIBOSIP2_VERSION = 3.6.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 324ec33..1d1fbc1 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -18,4 +18,4 @@ LIBPCAP_CONF_ENV = ac_cv_linux_vers=2 \
 		ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
index 093821e..8f655ae 100644
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -41,4 +41,4 @@ ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
 	LIBPLAYER_CONF_OPT += --enable-binding-python
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 5612b2b..dd295c6 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -30,5 +30,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 2430c9d..d0d1700 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -13,4 +13,4 @@ LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
 			--disable-demosaic-pack-gpl3
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 2f77a48..fd255ca 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -8,4 +8,4 @@ LIBRAW1394_VERSION = 2.0.7
 LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
 LIBRAW1394_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libreplaygain/libreplaygain.mk b/package/libreplaygain/libreplaygain.mk
index 47bf586..8818e16 100644
--- a/package/libreplaygain/libreplaygain.mk
+++ b/package/libreplaygain/libreplaygain.mk
@@ -11,4 +11,4 @@ LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 228a0df..457a28a 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -30,4 +30,4 @@ define LIBROXML_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index f5c223e..e54c06c 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -13,4 +13,4 @@ LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 0d765ea..864297b 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -9,4 +9,4 @@ LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/l
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
index d03a5d9..533d95f 100644
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -14,4 +14,4 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LIBSAMPLERATE_DEPENDENCIES += libsndfile
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 905089b..aec0378 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -10,4 +10,4 @@ LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy/
 LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 8c20ba3..92d1d8b 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -8,4 +8,4 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 5480618..e5fbb5e 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -8,4 +8,4 @@ LIBSNDFILE_VERSION = 1.0.25
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6572585..fe1a41c 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -27,4 +27,4 @@ else
 LIBSOUP_CONF_OPT += --disable-tls-check
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index f53f88f..9baa4b0 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -37,4 +37,4 @@ define LIBSVGTINY_CLEAN_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index 39cf030..996903d 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -26,4 +26,4 @@ LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/l
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING=YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
index 89489b7..5714e70 100644
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -17,4 +17,4 @@ LIBTHEORA_CONF_OPT = \
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index e21e8f3..4b9657c 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -10,7 +10,7 @@ LIBTOOL_INSTALL_STAGING = YES
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # variables used by other packages
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index 100e684..0c29661 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -13,4 +13,4 @@ LIBTORRENT_CONF_OPT = --enable-aligned \
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index e565bb9..45089b5 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -8,4 +8,4 @@ LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
 LIBTPL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index 3484ec4..3b9583c 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -21,4 +21,4 @@ endef
 
 LIBUNGIF_POST_INSTALL_TARGET_HOOKS += LIBUNGIF_BINS_CLEANUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index a6028e1..18968d8 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -10,4 +10,4 @@ LIBUPNP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/pupnp
 LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 1272485..bd69137 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -9,4 +9,4 @@ LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
 LIBURCU_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 9920d5a..1659fd1 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -17,5 +17,5 @@ endef
 
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 30ac543..4e61112 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -9,5 +9,5 @@ LIBUSB_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/libusb
 LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index dbd8769..a793285 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -39,5 +39,5 @@ define LIBV4L_INSTALL_TARGET_CMDS
 			DESTDIR=$(TARGET_DIR) $(LIBV4L_MAKE_OPTS) install; done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 90c021d..ad5f595 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -48,4 +48,4 @@ else
 LIBVNCSERVER_CONF_OPT += --without-zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 6844414..009143b 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -13,4 +13,4 @@ LIBVORBIS_CONF_OPT = --disable-oggtest
 
 LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index e5ec523..a6f8ae9 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -36,6 +36,6 @@ define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index d92e185..44d15e7 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -34,7 +34,7 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # libxml2 for the host
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 38bef46..5685a69 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -40,5 +40,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libyaml/libyaml.mk b/package/libyaml/libyaml.mk
index 34580a2..f52a68f 100644
--- a/package/libyaml/libyaml.mk
+++ b/package/libyaml/libyaml.mk
@@ -8,5 +8,5 @@ LIBYAML_SOURCE = yaml-$(LIBYAML_VERSION).tar.gz
 LIBYAML_SITE = http://pyyaml.org/download/libyaml/
 LIBYAML_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c7fae32..5ff4ce6 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -94,4 +94,4 @@ define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/links/links.mk b/package/links/links.mk
index 52a71f1..9dbf0ad 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -33,4 +33,4 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 LINKS_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index c6d571d..afd2966 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -19,4 +19,4 @@ else
 LINPHONE_CONF_OPT += --disable-gtk_ui
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ba33d37..2a6bfc1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -70,4 +70,4 @@ endef
 
 endif
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index a6d15e1..feb1ab3 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -48,4 +48,4 @@ define LINUX_FUSION_UNINSTALL_TARGET_CMDS
 	rm -f $(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index d331d9d..cbdb02a 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -21,4 +21,4 @@ endef
 
 LITE_POST_INSTALL_TARGET_HOOKS += LITE_FINALIZE_INSTALL
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index c987fa2..b727d94 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -74,4 +74,4 @@ define LIVE555_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index a351329..b596d44 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -44,4 +44,4 @@ define LM_SENSORS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index bb4abf9..bccb2de 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -27,4 +27,4 @@ define LMBENCH_CLEAN_CMDS
 	$(MAKE) -C $(@D)/src clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 4a7f25c..333ddce 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -30,4 +30,4 @@ define LOCKFILE_PROGS_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 20317f1..ae622b0 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -33,4 +33,4 @@ define LOGROTATE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
index 89f6bbd..17c3e9e 100644
--- a/package/logsurfer/logsurfer.mk
+++ b/package/logsurfer/logsurfer.mk
@@ -26,4 +26,4 @@ LOGSURFER_POST_INSTALL_TARGET_HOOKS += LOGSURFER_INSTALL_TARGET_MAN
 
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 314f46a..4757605 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -47,4 +47,4 @@ define LRZSZ_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 8b4fcc6..650996f 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -20,4 +20,4 @@ define LSHW_INSTALL_TARGET_CMDS
 		$(LSHW_MAKE_OPT) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 7bc22c0..fa55e6a 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -66,4 +66,4 @@ define LSOF_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 3cdd846..4479bbc 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -8,4 +8,4 @@ LSUIO_VERSION = 0.2.0
 LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f0a57ae..c0cb676 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -7,4 +7,4 @@ LTP_TESTSUITE_VERSION = 20101031
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 8c0a145..0e684fb 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -9,4 +9,4 @@ LTRACE_DEPENDENCIES = libelf
 LTRACE_AUTORECONF   = YES
 LTRACE_CONF_OPT     += --disable-werror
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 44916bd..0f3200f 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -11,5 +11,5 @@ HOST_LTTNG_BABELTRACE_AUTORECONF = YES
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 4f0414c..cd6c65d 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -12,4 +12,4 @@ LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
 LTTNG_LIBUST_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index b31caa1..a245b19 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -17,4 +17,4 @@ define LTTNG_MODULES_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNELDIR=$(LINUX_DIR) modules_install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index cd9a0be..7a0a7b4 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -22,4 +22,4 @@ else
 LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 3fca8b2..ac7e325 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -160,5 +160,5 @@ define HOST_LUA_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index 928e154..17f2bd6 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -28,4 +28,4 @@ define LUAFILESYSTEM_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index daca248..755b61a 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -33,4 +33,4 @@ define LUASOCKET_CLEAN_CMDS
 	$(MAKE) -C $(@D) -f makefile clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 40e0152..52326ea 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -51,4 +51,4 @@ define LVM2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index b8df170..c219dc8 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -9,7 +9,7 @@ LZMA_SITE:=http://tukaani.org/lzma/
 LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 LZMA=$(HOST_DIR)/usr/bin/lzma
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index e638227..15e4b79 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -7,5 +7,5 @@ LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 6d1d674..25bc638 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -8,4 +8,4 @@ LZOP_SOURCE = lzop-$(LZOP_VERSION).tar.gz
 LZOP_SITE = http://www.lzop.org/download/
 LZOP_DEPENDENCIES = lzo
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 5095f31..5505f78 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -15,5 +15,5 @@ endif
 
 HOST_M4_CONF_OPT = --disable-static
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/make/make.mk b/package/make/make.mk
index 2886032..a0981c7 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -13,4 +13,4 @@ MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
 		GLOBLIB=glob/libglob.a
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/makedevs/makedevs.mk b/package/makedevs/makedevs.mk
index f781705..5e984c6 100644
--- a/package/makedevs/makedevs.mk
+++ b/package/makedevs/makedevs.mk
@@ -31,5 +31,5 @@ define HOST_MAKEDEVS_INSTALL_CMDS
 	install -D -m 755 $(@D)/makedevs $(HOST_DIR)/usr/bin/makedevs
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 0468d99..2e3cdff 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -15,4 +15,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index 611323d..5c518e5 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index 4246626..255f3c1 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -20,4 +20,4 @@ MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 558a4f7..c6e9496 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -28,4 +28,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index b0be393..6fd1987 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -55,4 +55,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index fe43cb9..db9d1a8 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 2540e4b..6f37bf4 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -12,4 +12,4 @@ MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 4b32073..ece8866 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -39,4 +39,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 39dbea0..460cae5 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -20,4 +20,4 @@ define MDADM_CONFIGURE_CMDS
 	# Do nothing
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 716a733..9e67ed4 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -76,4 +76,4 @@ else
 MEDIASTREAMER_CONF_OPT += --disable-libv4l1 --disable-libv4l2
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/memstat/memstat.mk b/package/memstat/memstat.mk
index 7d3f5b2..4adacd1 100644
--- a/package/memstat/memstat.mk
+++ b/package/memstat/memstat.mk
@@ -24,4 +24,4 @@ define MEMSTAT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/memstat
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index 00e3124..b9c5e1d 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -26,4 +26,4 @@ define MEMTESTER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 5f5fcfa..990ec9f 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -25,4 +25,4 @@ endef
 
 METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index ff85885..fbf319c 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -150,5 +150,5 @@ define MICROPERL_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/perl5
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index aa376a2..87559bb 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -41,4 +41,4 @@ define MIDORI_INSTALL_TARGET_CMDS
        (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 5adb270..702e5a2 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -34,4 +34,4 @@ define MII_DIAG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index ab65bb6..7293f6a 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -15,4 +15,4 @@ MINICOM_CONF_ENV = PKG_CONFIG=/bin/false
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
index 83f71d3..c74d581 100644
--- a/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
+++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
@@ -8,4 +8,4 @@ MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mob
 MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 3501bcc..fe70775 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -20,6 +20,6 @@ HOST_MODULE_INIT_TOOLS_AUTORECONF = YES
 HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 HOST_MODULE_INIT_TOOLS_CONF_OPT = --disable-static-utils
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 11bc7e1..a8b6447 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -27,4 +27,4 @@ else
 MONIT_CONF_OPT += --without-largefiles
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index d36e55d..29c4091 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -11,5 +11,5 @@ MPC_DEPENDENCIES = gmp mpfr
 MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index ef075c2..d8f0688 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -11,5 +11,5 @@ MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 7a3203a..90f2f59 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -24,4 +24,4 @@ define MROUTED_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index d5e6a31..6b641f7 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -29,4 +29,4 @@ MSMTP_CONF_OPT += \
 	--without-libgsasl \
 	--without-gnome-keyring
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index ceb98c7..9b60ac8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -85,5 +85,5 @@ define MTD_INSTALL_TARGET_CMDS
  done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 744ec85..90fba51 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -58,4 +58,4 @@ define ALSA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/,$(ALSA_UTILS_TARGETS_) $(ALSA_UTILS_TARGETS_y))
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index b6fbdd2..534f3cf 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -18,4 +18,4 @@ AUMIX_CONF_OPT = \
 
 AUMIX_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/bellagio/bellagio.mk b/package/multimedia/bellagio/bellagio.mk
index d013953..8b7e79f 100644
--- a/package/multimedia/bellagio/bellagio.mk
+++ b/package/multimedia/bellagio/bellagio.mk
@@ -9,4 +9,4 @@ BELLAGIO_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 BELLAGIO_AUTORECONF = YES
 BELLAGIO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index 567875a..b0078f5 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -10,4 +10,4 @@ FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faa
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 4cc29ee..840d079 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -177,4 +177,4 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index 79ecfd1..e19a9fb 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -20,4 +20,4 @@ else
 FLAC_CONF_OPT += --disable-ogg
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-dsp/gst-dsp.mk b/package/multimedia/gst-dsp/gst-dsp.mk
index 9682962..f921ec9 100644
--- a/package/multimedia/gst-dsp/gst-dsp.mk
+++ b/package/multimedia/gst-dsp/gst-dsp.mk
@@ -15,4 +15,4 @@ endef
 
 GST_DSP_DEPENDENCIES = gstreamer tidsp-binaries host-pkg-config
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index c955632..9413ff2 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -15,4 +15,4 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
index f3956bc..f23bc86 100644
--- a/package/multimedia/gst-omapfb/gst-omapfb.mk
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -16,4 +16,4 @@ endef
 
 GST_OMAPFB_DEPENDENCIES = gstreamer
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index a737bef..ad8b509 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -556,4 +556,4 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index e35a606..b044516 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -190,4 +190,4 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index ebd463b..f64527d 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -375,4 +375,4 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 37ed624..e23d774 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -81,4 +81,4 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index cc29932..1943d03 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -25,4 +25,4 @@ GSTREAMER_CONF_OPT = \
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 7b4b0ae..81a8f2a 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -30,4 +30,4 @@ endif
 
 LAME_POST_CONFIGURE_HOOKS += LAME_BIGENDIAN_ARCH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index 9fad45f..56007eb 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -16,4 +16,4 @@ MADPLAY_CONF_OPT+=--with-alsa
 MADPLAY_DEPENDENCIES+=alsa-lib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 43d429b..28bc4cb 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -135,4 +135,4 @@ endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 793812f..c3d2c9c 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -64,4 +64,4 @@ MPG123_DEPENDENCIES += libtool
 MPG123_CONF_OPT += --with-modules --with-module-suffix=.so
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 216bb46..f4fedf4 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -169,4 +169,4 @@ define MPLAYER_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index ac3660f..ce2d17e 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -11,4 +11,4 @@ MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
 MUSEPACK_MAKE = $(MAKE1)
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 6d05822..13d8770 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -65,4 +65,4 @@ endef
 PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
index 0b64fb8..4019563 100644
--- a/package/multimedia/tidsp-binaries/tidsp-binaries.mk
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -10,4 +10,4 @@ define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
 	$(RM) -r $(TARGET_DIR)/lib/dsp
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/multimedia/vorbis-tools/vorbis-tools.mk
index fc79b3f..c23648c 100644
--- a/package/multimedia/vorbis-tools/vorbis-tools.mk
+++ b/package/multimedia/vorbis-tools/vorbis-tools.mk
@@ -17,4 +17,4 @@ ifeq ($(BR2_PACKAGE_SPEEX),y)
 VORBIS_TOOLS_DEPENDENCIES += speex
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 8b0af0b..4b1c59e 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -13,4 +13,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 WAVPACK_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 4c8e399..afff723 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -10,4 +10,4 @@ MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPT = --disable-iconv --disable-smtp
 MUTT_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index ca54a54..af1cb26 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -12,4 +12,4 @@ MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
 MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) uninstall
 MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index ad330ae..c48d78f 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -42,4 +42,4 @@ endef
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 439f583..164c7a6 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -22,4 +22,4 @@ define NANO_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nano
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index 8421397..1e46100 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -24,4 +24,4 @@ define NANOCOM_UNINSTALL_TARGET_CMDS
 	$(RM) $(TARGET_DIR)/usr/bin/nanocom
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 07275d7..b88a7aa 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -14,5 +14,5 @@ NASM_VERSION=2.08.01
 NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
 NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 15997af..c2257f7 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -29,4 +29,4 @@ endef
 
 NBD_POST_INSTALL_TARGET_HOOKS += NBD_CLEANUP_AFTER_INSTALL
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 3000e7a..4056397 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -41,4 +41,4 @@ define NCFTP_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 9b767c4..a16fe28 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -140,5 +140,5 @@ HOST_NCURSES_DEPENDENCIES =
 HOST_NCURSES_CONF_OPT = \
 	--without-shared --without-gpm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 7cf4b8a..eb30e11 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -39,4 +39,4 @@ endef
 
 NDISC6_POST_INSTALL_TARGET_HOOKS += NDISC6_REMOVE_UNNEEDED
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 6e365b3..52d5066 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -52,4 +52,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 4f0ec09..b7015e6 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -34,4 +34,4 @@ endef
 
 NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index bc58af2..d2c6962 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -8,4 +8,4 @@ NETCAT_VERSION:=0.7.1
 NETCAT_SOURCE:=netcat-$(NETCAT_VERSION).tar.gz
 NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netcat
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 6a8aced..4af5e85 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -20,4 +20,4 @@ define NETPERF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/netserver
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index db76021..e42894f 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -25,4 +25,4 @@ define NETPLUG_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6d67dc5..63e5bff 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -88,4 +88,4 @@ endef
 
 NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index fbe1939..a67b786 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -7,4 +7,4 @@
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index cfcf32c..6c98d64 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -47,4 +47,4 @@ endef
 
 NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index a7c42fb..c8795fb 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -41,4 +41,4 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 # nfsiostat is interpreted python, so remove it unless it's in the target
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += $(if $(BR2_PACKAGE_PYTHON),,NFS_UTILS_REMOVE_NFSIOSTAT)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index a55f7ba..0121727 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -8,4 +8,4 @@ NGIRCD_VERSION = 17.1
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index daf7c6f..c296e34 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -17,4 +17,4 @@ NGREP_CONF_OPT =  \
 
 NGREP_DEPENDENCIES = libpcap pcre
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
index 0fe427a..e90ff07 100644
--- a/package/noip/noip.mk
+++ b/package/noip/noip.mk
@@ -27,4 +27,4 @@ define NOIP_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 8f7d9a9..4cea4ec 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -12,4 +12,4 @@ endef
 
 NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 748fe1d..f6db4ef 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -30,4 +30,4 @@ ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
 	NTFS_3G_CONF_OPT += --disable-ntfsprogs
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 8076ce7..504ede7 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -65,4 +65,4 @@ endef
 
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/nuttcp/nuttcp.mk b/package/nuttcp/nuttcp.mk
index 8c0203c..df03dca 100644
--- a/package/nuttcp/nuttcp.mk
+++ b/package/nuttcp/nuttcp.mk
@@ -22,4 +22,4 @@ define NUTTCP_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nuttcp
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/ocf-linux/ocf-linux.mk b/package/ocf-linux/ocf-linux.mk
index e615225..5d25597 100644
--- a/package/ocf-linux/ocf-linux.mk
+++ b/package/ocf-linux/ocf-linux.mk
@@ -18,4 +18,4 @@ define OCF_LINUX_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/include/crypto/cryptodev.h
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index c6ffb64..6cd7cdd 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -28,4 +28,4 @@ else
 	OFONO_CONF_OPT += --disable-bluetooth
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 9ed4d5b..7a2b49e 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -38,4 +38,4 @@ define OLSR_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index 59be66f..85e2451 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -26,4 +26,4 @@ define OPEN2300_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ec94715..481cfe3 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -123,4 +123,4 @@ endef
 OPENCV_POST_INSTALL_TARGET_HOOKS += OPENCV_CLEAN_INSTALL_DATA
 endif
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 3358905..f63a9c6 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -14,4 +14,4 @@ define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 75b0263..9c377c5 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -39,5 +39,5 @@ HOST_OPENOCD_CONF_OPT = 	\
 	--enable-jlink 		\
 	--enable-vsllink
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 2b93def..0878fce 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -18,4 +18,4 @@ endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 9ef79e1..f9816af 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -124,4 +124,4 @@ define OPENSSL_UNINSTALL_CMDS
 	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/,ssl engines libcrypto* libssl* pkgconfig/libcrypto.pc)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index a25ca8f..781dc00 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -32,4 +32,4 @@ define OPENSWAN_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) $(OPENSWAN_MAKE_OPT) DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index bcb121d..03eabcf 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -34,4 +34,4 @@ define OPENVPN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/openvpn
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 9cfaa26..be67f8e 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -17,4 +17,4 @@ endef
 
 OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index fc21928..256ae9b 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -45,4 +45,4 @@ define OPROFILE_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index e7ea551..7ef146d 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -23,5 +23,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index f47af8a..65a03bf 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -2,4 +2,4 @@ ORTP_VERSION = 0.20.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 ORTP_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f46bdc6..efb722d 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -59,4 +59,4 @@ endef
 
 PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index c4107e7..2152ea6 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -10,4 +10,4 @@ PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = readline util-linux lvm2
 PARTED_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 2062b9f..b4206c5 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,4 +7,4 @@
 PATCH_VERSION = 2.6
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index a43fb95..cd318cb 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -54,4 +54,4 @@ define PCIUTILS_INSTALL_STAGING_CMDS
 		SHARED=$(PCIUTILS_SHARED) install install-lib
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index f2112f0..561de1f 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -9,5 +9,5 @@ PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index db896fd..aa2863d 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -29,4 +29,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 PCRE_POST_INSTALL_TARGET_HOOKS += PCRE_TARGET_REMOVE_PCRE_CONFIG
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/php/php.mk b/package/php/php.mk
index fee2c92..31de289 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -229,4 +229,4 @@ endef
 
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index fce50d9..4278ac0 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -15,4 +15,4 @@ define PICOCOM_INSTALL_TARGET_CMDS
 	install -D -m 0755 $(@D)/picocom $(TARGET_DIR)/usr/bin/picocom
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 1d47450..8ce435d 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -16,5 +16,5 @@ ifneq ($(BR2_iwmmxt),y)
 PIXMAN_CONF_OPT += --disable-arm-iwmmxt
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index a05bef1..7440ac4 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -19,7 +19,7 @@ HOST_PKG_CONFIG_CONF_OPT = \
 HOST_PKG_CONFIG_AUTORECONF = YES
 HOST_PKG_CONFIG_DEPENDENCIES =
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index ddb5b25..779487f 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -55,4 +55,4 @@ define POCO_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) install -C $(@D)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index e12f08d..34fbe29 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -9,5 +9,5 @@ POLARSSL_CONF_OPT = \
 
 POLARSSL_INSTALL_STAGING = YES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
 
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index f6af679..df49acb 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -15,5 +15,5 @@ POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index b0340f7..34b0bd9 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -18,4 +18,4 @@ PORTAUDIO_CONF_OPT = \
 	$(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
 	$(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index cb7c0e3..639a72e 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -43,4 +43,4 @@ define PORTMAP_UNINSTALL_TARGET_CMDS
 		$(addsuffix .8,$(PORTMAP_SBINS)))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index a62f495..259d1dc 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -102,4 +102,4 @@ define PPPD_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index d4c5bc4..1e2c460 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -26,4 +26,4 @@ define PPTP_LINUX_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index 8228052..ced04a4 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -20,4 +20,4 @@ define PROCPS_INSTALL_TARGET_CMDS
 		ldconfig=true install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 5352ea7..1d02194 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -43,4 +43,4 @@ define PROFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/proftpd.conf
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 9010626..6e49dd3 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -17,5 +17,5 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 PROTOBUF_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 0b0e046..a70f071 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -18,4 +18,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PSMISC_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 5f15f5b..284b388 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -8,4 +8,4 @@ PV_VERSION = 1.2.0
 PV_SOURCE = pv-$(PV_VERSION).tar.bz2
 PV_SITE = http://pipeviewer.googlecode.com/files
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 7ac873c..7312a78 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -18,5 +18,5 @@ define PYTHON_DPKT_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index e1ed1b6..82776c0 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -18,4 +18,4 @@ define PYTHON_ID3_INSTALL_TARGET_CMDS
     (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 7d898ed..6ce6cf8 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -38,4 +38,4 @@ define PYTHON_MAD_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
index b5185f0..906f83d 100644
--- a/package/python-netifaces/python-netifaces.mk
+++ b/package/python-netifaces/python-netifaces.mk
@@ -22,4 +22,4 @@ define PYTHON_NETIFACES_INSTALL_TARGET_CMDS
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index f5603b6..f3426a4 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -108,4 +108,4 @@ define PYTHON_PYGAME_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index add9667..fb6b31c 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -18,4 +18,4 @@ define PYTHON_SERIAL_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 3d4b8d6..25fddb9 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -27,6 +27,6 @@ define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
 	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 
diff --git a/package/python/python.mk b/package/python/python.mk
index 360fafa..fae4e5c 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -167,5 +167,5 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
 PYTHON_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e18b873..feb0d6f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -635,4 +635,4 @@ define QT_UNINSTALL_TARGET_CMDS
 	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 349e003..da022c3 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -33,4 +33,4 @@ else
 QUAGGA_CONF_OPT +=--disable-snmp
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 9715230..44a5073 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -20,4 +20,4 @@ QUOTA_INSTALL_TARGET_OPT = \
 	ROOTDIR=$(TARGET_DIR) \
 	install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 474a299..aba3d92 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -15,4 +15,4 @@ endef
 
 RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ramspeed/ramspeed.mk b/package/ramspeed/ramspeed.mk
index 478c2fb..d19571c 100644
--- a/package/ramspeed/ramspeed.mk
+++ b/package/ramspeed/ramspeed.mk
@@ -17,4 +17,4 @@ define RAMSPEED_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/ramspeed $(TARGET_DIR)/usr/bin/ramspeed
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 732a08b..aee8bc4 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -10,4 +10,4 @@ RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
index b568d5b..371801e 100644
--- a/package/read-edid/read-edid.mk
+++ b/package/read-edid/read-edid.mk
@@ -16,4 +16,4 @@ define READ_EDID_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/sbin/parse-edid
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index cd9946e..12d3fba 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -21,4 +21,4 @@ define READLINE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index 4862fad..c196d85 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -26,4 +26,4 @@ define RINGS_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 7642c82..b4b1bd5 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,4 +9,4 @@ RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 30bc1a4..cf12d64 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -33,4 +33,4 @@ define RP_PPPOE_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 4ce2ecb..1a417eb 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -45,4 +45,4 @@ RPM_MAKE = $(MAKE1)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 55bdd51..112ddf9 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -26,4 +26,4 @@ define RRDTOOL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/librrd*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 0c2b838..55966f3 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -33,4 +33,4 @@ define RSH_REDONE_UNINSTALL_TARGET_CMDS
 		$(addprefix $(TARGET_DIR)/usr/sbin/,$(rsh-redone-sbin-y))
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 12a33c6..f2df256 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -10,4 +10,4 @@ RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 RSYNC_CONF_OPT = --with-included-popt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index b7576cd..2001752 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -24,4 +24,4 @@ endef
 
 RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 222733f..60f63b5 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -21,5 +21,5 @@ define RT_TESTS_INSTALL_TARGET_CMDS
 		install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 2dc1468..be5abb1 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -12,4 +12,4 @@ RTAI_CONF_OPT = \
 
 RTAI_MAKE = $(MAKE1)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index f60bd40..c44cd57 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -9,4 +9,4 @@ RTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
 RTORRENT_DEPENDENCIES = host-pkg-config libcurl libsigc libtorrent ncurses
 RTORRENT_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index d647531..a5b8cde 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -31,5 +31,5 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index c968435..6b9a082 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -174,4 +174,4 @@ endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 621cff5..56ce82d 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -37,4 +37,4 @@ else
 SANE_BACKENDS_CONF_OPT += --without-snmp
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index 03bec89..0faae9c 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -9,4 +9,4 @@ SAWMAN_SITE = http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index d117bde..8786322 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -20,4 +20,4 @@ endef
 
 SCREEN_POST_INSTALL_TARGET_HOOKS += SCREEN_INSTALL_SCREENRC
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index 5460f51..139312f 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -74,4 +74,4 @@ define SDL_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index 5503bbd..5c71cb9 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -20,4 +20,4 @@ else
 SDL_GFX_CONF_OPT += --disable-mmx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index b93dc08..8ec6a33 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -33,4 +33,4 @@ SDL_IMAGE_DEPENDENCIES:=sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index eee3e14..411b65d 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -41,4 +41,4 @@ define SDL_MIXER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index 4992b8c..bd511c6 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -15,4 +15,4 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index a5d9a26..8bc5133 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -54,4 +54,4 @@ define SDL_SOUND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index efba5fa..b9747d8 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -14,4 +14,4 @@ SDL_TTF_CONF_OPT = --without-x \
 		--with-sdl-prefix=$(STAGING_DIR)/usr
 
 SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index 9d2b00b..b251b3c 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -2,4 +2,4 @@ SDPARM_VERSION = 1.07
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
 SDPARM_SITE = http://sg.danny.cz/sg/p/
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 79467ef..451ba54 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -23,4 +23,4 @@ endef
 
 SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 1fd589c..26cd5fc 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -8,4 +8,4 @@ SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 80dbb12..fed52b2 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -19,4 +19,4 @@ endef
 
 SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index 15c6db4..f941dd9 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -25,7 +25,7 @@ define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # shared-mime-info for the host
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2f5787c..a2382ce 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -51,4 +51,4 @@ define SLANG_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index 3a6fce7..a6873f0 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -7,4 +7,4 @@
 SMARTMONTOOLS_VERSION = 5.42
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index bd435cf..9a5234d 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -25,4 +25,4 @@ endef
 
 SOCAT_PRE_CONFIGURE_HOOKS += SOCAT_RUN_AUTOCONF
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 97ab876..a1e672f 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -8,4 +8,4 @@ SOCKETCAND_SITE = git://github.com/dschanoeh/socketcand.git
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_DEPENDENCIES = libconfig
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
index 3a1a162..b7cf4c2 100644
--- a/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
+++ b/package/sound-theme-freedesktop/sound-theme-freedesktop.mk
@@ -10,4 +10,4 @@ SOUND_THEME_FREEDESKTOP_SOURCE = \
 	sound-theme-freedesktop-$(SOUND_THEME_FREEDESKTOP_VERSION).tar.bz2
 SOUND_THEME_FREEDESKTOP_DEPENDENCIES = host-intltool
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 2502b11..9014d21 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -12,4 +12,4 @@ ifneq ($(BR2_INET_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 2d8a255..917de34 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -30,4 +30,4 @@ define SPEEX_BUILD_CMDS
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 3e69a96..ab78f45 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -53,4 +53,4 @@ define SQLCIPHER_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 62ea661..5b85ecc 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -45,4 +45,4 @@ define SQLITE_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 8c0b33b..0ec61ee 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -72,5 +72,5 @@ define HOST_SQUASHFS_INSTALL_CMDS
    -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
index 91e2301..6f28e6e 100644
--- a/package/squashfs3/squashfs3.mk
+++ b/package/squashfs3/squashfs3.mk
@@ -24,6 +24,6 @@ define HOST_SQUASHFS3_INSTALL_CMDS
  $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
 
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 9db2197..52bfde0 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -32,4 +32,4 @@ endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index 44fe16d..4e2c481 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -24,4 +24,4 @@ define SREDIRD_CLEAN_CMDS
 	rm -f $(@D)/sredird
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index e60cdeb..80d3a45 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -12,4 +12,4 @@ SSHFS_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index c83a162..e078b2c 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -41,5 +41,5 @@ define HOST_SSTRIP_UNINSTALL_CMDS
 	rm -f $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index 60778ca..54bfc2f 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -13,5 +13,5 @@ STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 8c39693..159812d 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -16,4 +16,4 @@ define STATSERIAL_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 8cda09b..3393e66 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -18,4 +18,4 @@ endef
 
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 8b4f40b..3a047b5 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -10,4 +10,4 @@ STRESS_VERSION = 1.0.4
 STRESS_SITE    = http://weather.ou.edu/~apw/projects/stress
 STRESS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 6088e58..7c280cc 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -21,4 +21,4 @@ endef
 
 STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f1efc54..9b0ebed 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -14,4 +14,4 @@ SUDO_CONF_OPT = \
 		--without-interfaces \
 		--without-pam
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 3ed0ff1..451c4de 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -21,4 +21,4 @@ else
 SYLPHEED_CONF_OPT += --disable-ssl
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 890b82a..b1afff7 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -15,4 +15,4 @@ SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 SYNERGY_DEPENDENCIES = xlib_libXtst \
 		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a5dedf2..a68adf2 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -52,4 +52,4 @@ define SYSKLOGD_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 55991c4..9d91a42 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -22,4 +22,4 @@ endif
 # among other things. So we don't install it.
 SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 696a3a7..e85355f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -69,4 +69,4 @@ SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 0d65c43..10feb96 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -46,4 +46,4 @@ define SYSVINIT_CLEAN_CMDS
 	$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index da2db0c..268318e 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -25,4 +25,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
 endif
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index e36c1cb..c1e625f 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -13,7 +13,7 @@ TAR_DEPENDENCIES += busybox
 HOST_TAR_DEPENDENCIES =
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 11aff17..a48f69d 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -31,5 +31,5 @@ endef
 
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 0febf60..c232dc9 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -20,4 +20,4 @@ endef
 
 TCPDUMP_POST_INSTALL_TARGET_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index 4a72266..3c23c6a 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -15,5 +15,5 @@ TCPREPLAY_DEPENDENCIES = libpcap
 TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
 TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 80f2935..537dfb1 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -18,4 +18,4 @@ define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index 98d45ca..dc7c285 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -48,4 +48,4 @@ define THTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 71a610d..ac54370 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -28,4 +28,4 @@ define TI_UTILS_UNINSTALL_TARGET_CMDS
 	rm -fr $(TARGET_DIR)/usr/share/ti-utils
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 3ab0d4f..227047b 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -81,4 +81,4 @@ define TIFF_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 9b06589..238330e 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -23,4 +23,4 @@ define TINYHTTPD_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 7a4c0f2..9b5e60e 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -29,4 +29,4 @@ define TN5250_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/tn5250
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index df97c5e..1e3bd28 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -13,5 +13,5 @@ TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries=
 
 TORSMO_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 9ffd432..3f0694b 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -56,4 +56,4 @@ else
 	TRANSMISSION_CONF_OPT += --disable-gtk
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/tremor/tremor.mk b/package/tremor/tremor.mk
index b836010..fceee1b 100644
--- a/package/tremor/tremor.mk
+++ b/package/tremor/tremor.mk
@@ -12,4 +12,4 @@ TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_DEPENDENCIES = libogg
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 885bd88..8f30c25 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -9,4 +9,4 @@ TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 4adae0f..53764f7 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -51,5 +51,5 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 726aed6..b9fc02f 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -45,4 +45,4 @@ endef
 
 UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 212609f..734609c 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -26,4 +26,4 @@ ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
 UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index b7b942c..0cbcc0b 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -23,4 +23,4 @@ define UEMACS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/em
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index ce6d582..3b33824 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -17,4 +17,4 @@ define UNIONFS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index 7b982d8..5f20f30 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -25,5 +25,5 @@ define USB_MODESWITCH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/usb_modeswitch.1
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 
diff --git a/package/usbmount/usbmount.mk b/package/usbmount/usbmount.mk
index a6b2d43..3596c9b 100644
--- a/package/usbmount/usbmount.mk
+++ b/package/usbmount/usbmount.mk
@@ -31,4 +31,4 @@ define USBMOUNT_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/media/usb?
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index a242f93..53a29c5 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -53,4 +53,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index 5421d8a..2d8bca5 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -33,4 +33,4 @@ define USHARE_INSTALL_TARGET_CMDS
 endef
 
 # Even though configure is called it's not autoconf
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 6a7eda1..ddc9c12 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -81,7 +81,7 @@ HOST_UTIL_LINUX_CONF_OPT += \
 	--disable-fallocate --disable-unshare --disable-rename \
 	--disable-schedutils --disable-wall --disable-partx
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index d9d82b7..7c0ea9f 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -13,5 +13,5 @@ VALA_DEPENDENCIES = host-flex libglib2 \
 		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 22e5c96..05f402f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -120,4 +120,4 @@ endef
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_NULGRIND
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index ef8d925..7fed822 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -38,4 +38,4 @@ ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 3c9aa65..ca711bb 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -50,4 +50,4 @@ define VSFTPD_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 07334ad..f2cef6c 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -16,4 +16,4 @@ VTUN_CONF_OPT = \
 		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 		--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index b71103a..580c5d2 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -21,4 +21,4 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 22ade1a..4fbf8f6 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -7,4 +7,4 @@ ifeq ($(BR2_SOFT_FLOAT),y)
 WEBRTC_AUDIO_PROCESSING_CONF_OPT += --with-ns-mode=fixed
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index b14cd92..a15111c 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -30,4 +30,4 @@ ifneq ($(BR2_PACKAGE_OPENSSL),y)
 endif
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 048f4de..4a23485 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -28,4 +28,4 @@ define WHETSTONE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/whetstone
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/which/which.mk b/package/which/which.mk
index a7bb577..e7ebc7f 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -7,4 +7,4 @@
 WHICH_VERSION = 2.20
 WHICH_SITE = http://carlo17.home.xs4all.nl/which
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/wipe/wipe.mk b/package/wipe/wipe.mk
index ec1b692..289102f 100644
--- a/package/wipe/wipe.mk
+++ b/package/wipe/wipe.mk
@@ -19,4 +19,4 @@ define WIPE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man1/wipe.1
 endef
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index b059839..d81aa7c 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -42,4 +42,4 @@ define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 5ca6de5..9d957ea 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -145,4 +145,4 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index cce7780..f5423f3 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -18,4 +18,4 @@ define WSAPI_UNINSTALL_TARGET_CMDS
 	rm -rf "$(TARGET_DIR)/usr/share/lua/wsapi"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index bbb1899..9824fc4 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -19,6 +19,6 @@ LIBXCB_CONF_OPT = --disable-build-docs
 
 HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/x11r7/mcookie/mcookie.mk b/package/x11r7/mcookie/mcookie.mk
index 030dd74..b7191a7 100644
--- a/package/x11r7/mcookie/mcookie.mk
+++ b/package/x11r7/mcookie/mcookie.mk
@@ -19,4 +19,4 @@ define MCOOKIE_INSTALL_TARGET_CMDS
 	install -m 0755 -D $(@D)/mcookie $(TARGET_DIR)/usr/bin/mcookie
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index 1e9ec77..c52baa3 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -28,4 +28,4 @@ MESA3D_DEPENDENCIES = \
 	libdrm \
 	expat
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index 730b8f6..e7032de 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -9,6 +9,6 @@ PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index a91a416..77b2546 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -9,4 +9,4 @@ XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 1e9f73f..301b1d3 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -9,5 +9,5 @@ XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.bz2
 XAPP_BDFTOPCF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index d806231..835f7f3 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -9,4 +9,4 @@ XAPP_BEFORELIGHT_SOURCE = beforelight-$(XAPP_BEFORELIGHT_VERSION).tar.bz2
 XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 5fdc260..92428ac 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -9,4 +9,4 @@ XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 794985f..e5371fa 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -9,4 +9,4 @@ XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index b71819a..b41f201 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -9,4 +9,4 @@ XAPP_FONTTOSFNT_SOURCE = fonttosfnt-$(XAPP_FONTTOSFNT_VERSION).tar.bz2
 XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index f18424e..b92f928 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -9,4 +9,4 @@ XAPP_FSLSFONTS_SOURCE = fslsfonts-$(XAPP_FSLSFONTS_VERSION).tar.bz2
 XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 190bab8..8c37b99 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -9,4 +9,4 @@ XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
 XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 93d55dc..9ea0e8a 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -9,4 +9,4 @@ XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 1dd4604..80f4a8e 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -9,4 +9,4 @@ XAPP_ICO_SOURCE = ico-$(XAPP_ICO_VERSION).tar.bz2
 XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index 49224bb..c701f43 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -9,4 +9,4 @@ XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.bz2
 XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index bab8045..2ebada8 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -9,4 +9,4 @@ XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index e48b188..674d583 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -9,5 +9,5 @@ XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 2640803..6bb00ad 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -9,5 +9,5 @@ XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index 1300e63..9f09c7f 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -9,4 +9,4 @@ XAPP_OCLOCK_SOURCE = oclock-$(XAPP_OCLOCK_VERSION).tar.bz2
 XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 0b0d541..c9a8ad7 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -9,4 +9,4 @@ XAPP_RGB_SOURCE = rgb-$(XAPP_RGB_VERSION).tar.bz2
 XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index cd71890..cce5c03 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -9,4 +9,4 @@ XAPP_RSTART_SOURCE = rstart-$(XAPP_RSTART_VERSION).tar.bz2
 XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index 3e844b4..a505098 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -9,4 +9,4 @@ XAPP_SCRIPTS_SOURCE = scripts-$(XAPP_SCRIPTS_VERSION).tar.bz2
 XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index a1f3f4b..07acae9 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -9,4 +9,4 @@ XAPP_SESSREG_SOURCE = sessreg-$(XAPP_SESSREG_VERSION).tar.bz2
 XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index f503a47..cab56a0 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -9,4 +9,4 @@ XAPP_SETXKBMAP_SOURCE = setxkbmap-$(XAPP_SETXKBMAP_VERSION).tar.bz2
 XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 4c8b689..54d4466 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -9,4 +9,4 @@ XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.bz2
 XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index 3082cb1..3089811 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -9,4 +9,4 @@ XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
 XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 18de28f..c8f15d3 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -9,4 +9,4 @@ XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index 69d8598..622dcd9 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -9,4 +9,4 @@ XAPP_VIEWRES_SOURCE = viewres-$(XAPP_VIEWRES_VERSION).tar.bz2
 XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index 6112769..2a32545 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -9,4 +9,4 @@ XAPP_X11PERF_SOURCE = x11perf-$(XAPP_X11PERF_VERSION).tar.bz2
 XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 93977f9..0444c93 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -9,4 +9,4 @@ XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.bz2
 XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 8be5d37..4881184 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -9,4 +9,4 @@ XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 78adad9..f954a8d 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -9,4 +9,4 @@ XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index beb1313..ec2e5ad 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -10,4 +10,4 @@ XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 28a93b9..a7bc4ab 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -9,4 +9,4 @@ XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.bz2
 XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 271b1b0..9fdc792 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -9,4 +9,4 @@ XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index deab354..bf6ab4f 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -9,4 +9,4 @@ XAPP_XCMSDB_SOURCE = xcmsdb-$(XAPP_XCMSDB_VERSION).tar.bz2
 XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 721454b..c473b7e 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -9,5 +9,5 @@ XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.bz2
 XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 8559a16..bab2151 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -9,4 +9,4 @@ XAPP_XDBEDIZZY_SOURCE = xdbedizzy-$(XAPP_XDBEDIZZY_VERSION).tar.bz2
 XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 3b1152d..00d6038 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -9,4 +9,4 @@ XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 7268d5d..16b6aa9 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -19,4 +19,4 @@ endef
 
 XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 9cd6c97..2ec08ba 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -9,4 +9,4 @@ XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.bz2
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index 3e7284b..c1864e3 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -9,4 +9,4 @@ XAPP_XDRIINFO_SOURCE = xdriinfo-$(XAPP_XDRIINFO_VERSION).tar.bz2
 XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index fd4158e..577bd5a 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -9,4 +9,4 @@ XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 4fa50fe..13b9507 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -9,4 +9,4 @@ XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 8019aa9..94bd390 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -9,4 +9,4 @@ XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index 726d5ed..c44573d 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -15,4 +15,4 @@ XAPP_XF86DGA_DEPENDENCIES = \
 	xlib_libXaw \
 	xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 5717875..50f15b1 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -9,4 +9,4 @@ XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
 XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 9556fca..8719bef 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -9,4 +9,4 @@ XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
 XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 611b642..b49b8ba 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -9,4 +9,4 @@ XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index bef0aed..94e7bed 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -9,4 +9,4 @@ XAPP_XFSINFO_SOURCE = xfsinfo-$(XAPP_XFSINFO_VERSION).tar.bz2
 XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 0993482..8d0ec24 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -9,4 +9,4 @@ XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index e39d268..8d02a53 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -9,4 +9,4 @@ XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index 7859f23..24517df 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -9,4 +9,4 @@ XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index dc1decf..fc9218d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -9,4 +9,4 @@ XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 4bc5879..022deec 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -9,4 +9,4 @@ XAPP_XINPUT_SOURCE = xinput-$(XAPP_XINPUT_VERSION).tar.bz2
 XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
index f84d1c2..659d62a 100644
--- a/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput_calibrator/xapp_xinput-calibrator.mk
@@ -9,4 +9,4 @@ XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSI
 XAPP_XINPUT_CALIBRATOR_SITE = http://github.com/downloads/tias/xinput_calibrator
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 98d13d9..846ba71 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -9,5 +9,5 @@ XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index e8f7a36..a451e49 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -9,4 +9,4 @@ XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.bz2
 XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index 98c7560..6c1e272 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -9,4 +9,4 @@ XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.bz2
 XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 1ccbdb9..d749d18 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -9,4 +9,4 @@ XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.bz2
 XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 16c3760..c99e050 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -9,4 +9,4 @@ XAPP_XKILL_SOURCE = xkill-$(XAPP_XKILL_VERSION).tar.bz2
 XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index f84c158..ace06c6 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -9,4 +9,4 @@ XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index f79eafa..effa060 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -10,4 +10,4 @@ XAPP_XLOGO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
 			  xlib_libXft host-pkg-config
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 887f815..96c7937 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -9,4 +9,4 @@ XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index 5a8563a..92c7d53 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -9,4 +9,4 @@ XAPP_XLSCLIENTS_SOURCE = xlsclients-$(XAPP_XLSCLIENTS_VERSION).tar.bz2
 XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 6f997d8..708a19b 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -9,4 +9,4 @@ XAPP_XLSFONTS_SOURCE = xlsfonts-$(XAPP_XLSFONTS_VERSION).tar.bz2
 XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index caf7bf6..235787a 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -9,4 +9,4 @@ XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index c14a5ba..0fa2582 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -12,4 +12,4 @@ XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 		ac_cv_file__etc_man_config=no \
 		ac_cv_file__etc_manpath_config=no
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 3f47b26..3a11bb4 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -9,4 +9,4 @@ XAPP_XMESSAGE_SOURCE = xmessage-$(XAPP_XMESSAGE_VERSION).tar.bz2
 XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 280b7e7..463c31d 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -9,4 +9,4 @@ XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMH_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 1a6c44a..72bfa5d 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -9,4 +9,4 @@ XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index bd371ea..c77c3dd 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -9,4 +9,4 @@ XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
 XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
index 08a1b4a..4d2c697 100644
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
@@ -9,4 +9,4 @@ XAPP_XPLSPRINTERS_SOURCE = xplsprinters-$(XAPP_XPLSPRINTERS_VERSION).tar.bz2
 XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 4ac3da4..e2c944f 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -9,4 +9,4 @@ XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
index 1bb7365..5ae32d2 100644
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
@@ -9,4 +9,4 @@ XAPP_XPREHASHPRINTERLIST_SOURCE = xprehashprinterlist-$(XAPP_XPREHASHPRINTERLIST
 XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 1615ac2..c382b8e 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -9,4 +9,4 @@ XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 74bf97b..5c6c756 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -10,4 +10,4 @@ XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index 3a0cfdc..675b287 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -9,4 +9,4 @@ XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
 XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index ac7ed7c..c6a92ac 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -9,4 +9,4 @@ XAPP_XREFRESH_SOURCE = xrefresh-$(XAPP_XREFRESH_VERSION).tar.bz2
 XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 32d6722..5eeb937 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -9,4 +9,4 @@ XAPP_XSET_SOURCE = xset-$(XAPP_XSET_VERSION).tar.bz2
 XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index 158318d..d795e79 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -9,4 +9,4 @@ XAPP_XSETMODE_SOURCE = xsetmode-$(XAPP_XSETMODE_VERSION).tar.bz2
 XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 1a02542..7ef189e 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -9,4 +9,4 @@ XAPP_XSETPOINTER_SOURCE = xsetpointer-$(XAPP_XSETPOINTER_VERSION).tar.bz2
 XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 937f3e5..94fbdaf 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -9,4 +9,4 @@ XAPP_XSETROOT_SOURCE = xsetroot-$(XAPP_XSETROOT_VERSION).tar.bz2
 XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index c7e261f..aff0cc8 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -9,4 +9,4 @@ XAPP_XSM_SOURCE = xsm-$(XAPP_XSM_VERSION).tar.bz2
 XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index e33a51e..5f32ea4d 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -9,4 +9,4 @@ XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 0fd91db..8ac49f7 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -9,4 +9,4 @@ XAPP_XVIDTUNE_SOURCE = xvidtune-$(XAPP_XVIDTUNE_VERSION).tar.bz2
 XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index fe10628..ff4083e 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -9,4 +9,4 @@ XAPP_XVINFO_SOURCE = xvinfo-$(XAPP_XVINFO_VERSION).tar.bz2
 XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 95d6098..c42797f 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -9,4 +9,4 @@ XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 541efde..3083729 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -9,4 +9,4 @@ XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 69bb228..d13024c 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -9,4 +9,4 @@ XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
 XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 10fb1c9..18ca6f6 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -11,6 +11,6 @@ XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index c43e4cb..5681b72 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -9,5 +9,5 @@ XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = host-gperf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index 52b21ea..b35087c 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -9,4 +9,4 @@ XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.bz2
 XDATA_XBITMAPS_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 08a8855..605d6fa 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -9,4 +9,4 @@ XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor host-xapp_xcursorgen
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index e55f979..dd020a8 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_ACECAD_SOURCE = xf86-input-acecad-$(XDRIVER_XF86_INPUT_ACECAD
 XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index c3299ac..bc274a7 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index d1964b2..c6f10a8 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VE
 XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index afbf286..c50e80a 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_JOYSTICK_SOURCE = xf86-input-joystick-$(XDRIVER_XF86_INPUT_JO
 XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index e0b57de..e732f86 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_KEYBOARD_SOURCE = xf86-input-keyboard-$(XDRIVER_XF86_INPUT_KE
 XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 55c6370..2bd37d3 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VE
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 6f9d66d..9b7c26e 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SOURCE = xf86-input-synaptics-$(XDRIVER_XF86_INPUT_
 XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index eaf8f2a..e79796a 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -14,4 +14,4 @@ XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
 	xproto_xproto \
 	tslib
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 386c4d1..c0ee55d 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_VMMOUSE_SOURCE = xf86-input-vmmouse-$(XDRIVER_XF86_INPUT_VMMO
 XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 1beed2e..bffd978 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSI
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index ab6e8fb..0d30635 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_APM_SOURCE = xf86-video-apm-$(XDRIVER_XF86_VIDEO_APM_VERSION)
 XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 6cb689e..e833214 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_ARK_SOURCE = xf86-video-ark-$(XDRIVER_XF86_VIDEO_ARK_VERSION)
 XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index f71b707..545c152 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -8,4 +8,4 @@ XDRIVER_XF86_VIDEO_AST_VERSION = 0.89.9
 XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index a357cf2..253a9c6 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index 5e9d9ab..fd2d99b 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_CHIPS_SOURCE = xf86-video-chips-$(XDRIVER_XF86_VIDEO_CHIPS_VE
 XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 774688d..8071460 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_CIRRUS_SOURCE = xf86-video-cirrus-$(XDRIVER_XF86_VIDEO_CIRRUS
 XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 91182fe..f38affd 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VE
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 7634d92..73aa99c 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_FBDEV_SOURCE = xf86-video-fbdev-$(XDRIVER_XF86_VIDEO_FBDEV_VE
 XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index faee8ca..eb1f8a3 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VE
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index cd611b6..9d7460b 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VE
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 2ff7669..e963751 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 4188dc5..5bce33f 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_I128_SOURCE = xf86-video-i128-$(XDRIVER_XF86_VIDEO_I128_VERSI
 XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
index 47ba28d..06d8083 100644
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_I740_SOURCE = xf86-video-i740-$(XDRIVER_XF86_VIDEO_I740_VERSI
 XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index a24a241..acffd66 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -11,4 +11,4 @@ XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 0636085..ad83661 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 64bae46..3adf527 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 27e028b..0bf3fca 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NE
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index 1138744..4924a91 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWP
 XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 4886fe8..da920f7 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).ta
 XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index c166559..9abc02e 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -24,4 +24,4 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 
 XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 8430d73..8eeef50 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index 51efbd4..6d490c2 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_RENDITION_SOURCE = xf86-video-rendition-$(XDRIVER_XF86_VIDEO_
 XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index 6c619c9..b2cf5cf 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_S3_SOURCE = xf86-video-s3-$(XDRIVER_XF86_VIDEO_S3_VERSION).ta
 XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index 68b0acc..a3fd480 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_S3VIRGE_SOURCE = xf86-video-s3virge-$(XDRIVER_XF86_VIDEO_S3VI
 XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 32ef7f5..89eb55b 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 9f5d7fd..1d3fafc 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF8
 XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 69a5d52..390c613 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index e9e529d..a43ba60 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SISUSB_SOURCE = xf86-video-sisusb-$(XDRIVER_XF86_VIDEO_SISUSB
 XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index f7c4f64..3808828 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG14_SOURCE = xf86-video-suncg14-$(XDRIVER_XF86_VIDEO_SUNC
 XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index adef006..971cf90 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG3_SOURCE = xf86-video-suncg3-$(XDRIVER_XF86_VIDEO_SUNCG3
 XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index 0d1f11e..1314fea 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNCG6_SOURCE = xf86-video-suncg6-$(XDRIVER_XF86_VIDEO_SUNCG6
 XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index be667a2..a3e1d7c 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB
 XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
index b0cc953..e56074e 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNLEO_SOURCE = xf86-video-sunleo-$(XDRIVER_XF86_VIDEO_SUNLEO
 XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index 135ddd7..edca7fe 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_SUNTCX_SOURCE = xf86-video-suntcx-$(XDRIVER_XF86_VIDEO_SUNTCX
 XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index dd2643a..5031319 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index fb69d51..05a4121 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION)
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index af44f69..46967c8 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TRIDENT_SOURCE = xf86-video-trident-$(XDRIVER_XF86_VIDEO_TRID
 XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index dc3d8fa..ed21580 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_TSENG_SOURCE = xf86-video-tseng-$(XDRIVER_XF86_VIDEO_TSENG_VE
 XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index 214fc67..723cf6b 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_V4L_SOURCE = xf86-video-v4l-$(XDRIVER_XF86_VIDEO_V4L_VERSION)
 XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index bc4c38e..112e28d 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 4425112..6a6beb0 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index 86caaae..4811d68 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_VOODOO_SOURCE = xf86-video-voodoo-$(XDRIVER_XF86_VIDEO_VOODOO
 XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 7dfbd8d..355e42c 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSI
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 837c9dd..53510df 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index a3edd20..f1e518a 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 6d84a2d..05613e5 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -9,5 +9,5 @@ XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 45029e1..d28f1ad 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index e172323..e572fcc 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index cbb78ad..a77e9e5 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFO
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index f4e9c8b..90aa8c7 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 5056e63..b516c60 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 34b52e2..6001c28 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index e26f998..7558254 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index 52e30b5..0bddb15 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 58ebb96..439c32e 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index 7f3e82a..192c19c 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DI
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 35b1ecc..b94f8c5 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index 2ded871..89bbc39 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 524bbc6..4c50b76 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index 46fe2f7..8ba2afd 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index f489def..67542f5 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index 72dd7cc..79cb6ca 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 5ee876e..f97a988 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 7b8c25a..28fa83c 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 47c5433..1d366df 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index 7b2d16d..41adb90 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index d90733d..a00bd43 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 561179d..2a1e634 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 837ed13..0405456 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 742a995..9ecf0da 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 6f0bd58..3cf0af6 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 716e04a..fd5d8e0 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index 2af5345..80e46e4 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index 3707c1f..d6db3d4 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index af4cc31..1cdf0e5 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -11,4 +11,4 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 7c24ed9..e151831 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 2cf822e..799b1d5 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index 7db1b53..70772fb 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 53036af..43b63d2 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 7001e5d..eb98af3 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -11,5 +11,5 @@ XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 88249ca..2445c94 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -11,5 +11,5 @@ XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 XFONT_FONT_UTIL_INSTALL_STAGING = YES
 XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 8a55a50..0879fd4 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -11,5 +11,5 @@ XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONT
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 999b789..e0a27ab 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -11,5 +11,5 @@ XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 453f862..c619da9 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -9,5 +9,5 @@ XKEYBOARD_CONFIG_SITE = http://www.x.org/releases/individual/data/xkeyboard-conf
 XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index d6334aa..af589b3 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -11,4 +11,4 @@ XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
 XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 566e1de..0b4a443 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -10,4 +10,4 @@ XLIB_LIBICE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 7ff5830..c4c0f3a 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -11,4 +11,4 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 32b9f3f..54473d9 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -37,5 +37,5 @@ endef
 
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 00cc452..216919e 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -11,4 +11,4 @@ XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index bd2f19b..3f15c0c 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,5 +10,5 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_INSTALL_STAGING = YES
 XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index 1142c76..668fd4c 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -11,4 +11,4 @@ XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
 XLIB_LIBXAW_CONF_OPT = --disable-docs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index 919d6fc..14660c8 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -10,4 +10,4 @@ XLIB_LIBXCOMPOSITE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 9c996e0..ac254e1 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -10,5 +10,5 @@ XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 9f10e56..1dd4be1 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -10,4 +10,4 @@ XLIB_LIBXDAMAGE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 6fee5bc..4c4674c 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,5 +10,5 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
 XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 2cdffa6..14f8f5e 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -11,4 +11,4 @@ XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 9a5768e..3bd94ad 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -10,5 +10,5 @@ XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index d1a7eef..463e567 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -14,5 +14,5 @@ XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index 1b1d4db..b2faf5c 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
 XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
 XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 44ddcbe..55be396 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 8c14007..e52ab7a 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -11,4 +11,4 @@ XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index aadf129..cb961e7 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -11,4 +11,4 @@ XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index ad0d49d..217c60d 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -10,4 +10,4 @@ XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index 1df392f..08891ad 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -11,4 +11,4 @@ XLIB_LIBXP_INSTALL_STAGING = YES
 XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
 XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 6819f57..1760d1d 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
index f942626..b01af40 100644
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPRINTAPPUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
index b693b28..8e76686 100644
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -10,4 +10,4 @@ XLIB_LIBXPRINTUTIL_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 038494b..6dfe2ed 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -11,4 +11,4 @@ XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index efd74bc..ab09486 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -11,5 +11,5 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 79c3bcf..0ecb928 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -11,4 +11,4 @@ XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 765f0d5..740dc17 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -12,4 +12,4 @@ XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index feab32a..d2b5ec5 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -15,4 +15,4 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xproto_recordproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index c51e4d0..af08937 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -11,4 +11,4 @@ XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index 725fa1e..2b0ad6b 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -11,4 +11,4 @@ XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 515bf51..d046426 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -11,4 +11,4 @@ XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index b7a3292..0aabef8 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -11,4 +11,4 @@ XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index bd21f22..8e50778 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -11,4 +11,4 @@ XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 369f9af..3e32d93 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -10,5 +10,5 @@ XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
index 56895ab..f4db12b 100644
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
@@ -11,4 +11,4 @@ XLIB_LIBOLDX_INSTALL_STAGING = YES
 XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
 XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 6c78225..cc22bed 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -9,4 +9,4 @@ XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index ce68fc8..f05fce4 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -10,5 +10,5 @@ XLIB_LIBXKBFILE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBFILE_INSTALL_STAGING = YES
 XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
index d605989..7e6ec25 100644
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
@@ -10,4 +10,4 @@ XLIB_LIBXKBUI_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXKBUI_INSTALL_STAGING = YES
 XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index b0adc8f..3f839de 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -9,5 +9,5 @@ XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 0ba5830..f7b763a 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -10,4 +10,4 @@ XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index c9ce4cc..ca0a533 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -10,4 +10,4 @@ XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index becf87f..dc6138b 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -10,4 +10,4 @@ XPROTO_COMPOSITEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index eb2d0a9..918127b 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -10,4 +10,4 @@ XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index eb6a4b1..a13691b 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -10,4 +10,4 @@ XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 5fe2252..99af25c 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -10,4 +10,4 @@ XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index a4503d5..1141337 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -10,5 +10,5 @@ XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 2583491..97af75a 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -10,5 +10,5 @@ XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index ba5539a..407664a 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -10,5 +10,5 @@ XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index d5816cd..aed8af6 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -10,4 +10,4 @@ XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 38a696d..cf2518b 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -10,5 +10,5 @@ XPROTO_INPUTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index e552420..bef002c 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -10,5 +10,5 @@ XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index b500002..c67e4fa 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -10,4 +10,4 @@ XPROTO_PRINTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRINTPROTO_INSTALL_STAGING = YES
 XPROTO_PRINTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index dd60b7f..34ddb03 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -10,4 +10,4 @@ XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index d37eec7..73f8a33 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -10,4 +10,4 @@ XPROTO_RECORDPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 487f913..a1a0f59 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -10,5 +10,5 @@ XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index 134c76c..df63e2e 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -10,4 +10,4 @@ XPROTO_RESOURCEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index 7eee0f8..31a0ddf 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -10,4 +10,4 @@ XPROTO_SCRNSAVERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 1fd61a8..88ac3ef 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -10,4 +10,4 @@ XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 4e1ea80..1a554fa 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -10,4 +10,4 @@ XPROTO_WINDOWSWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/pro
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index ca35423..165521c 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -10,5 +10,5 @@ XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index cdcb8e5..b47c685 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -10,5 +10,5 @@ XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 46f08fb..c7df128 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -10,5 +10,5 @@ XPROTO_XF86BIGFONTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/p
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index e8aed3c..301894a 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86DGAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 0eb57f6..701b464 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
index 577e325..1609430 100644
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86RUSHPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
 XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index 0194070..7a32398 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -10,4 +10,4 @@ XPROTO_XF86VIDMODEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/p
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index ad2357c..6220ae6 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -10,4 +10,4 @@ XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/prot
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index ab9cdfb..b3ef303 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -10,5 +10,5 @@ XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 29f7c81..f221632 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -153,4 +153,4 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 69c0321..e6b6238 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -10,5 +10,5 @@ XUTIL_MAKEDEPEND_SITE = http://xorg.freedesktop.org/releases/individual/util
 
 XUTIL_MAKEDEPEND_DEPENDENCIES = xproto_xproto
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index c83a07e..1823937 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -10,5 +10,5 @@ XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index f130e42..06d3f0d 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -11,4 +11,4 @@ X11VNC_CONF_OPT = \
 
 X11VNC_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 5eabd1e..f885fbd 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -20,4 +20,4 @@ define XAVANTE_UNINSTALL_TARGET_CMDS
 	rm -f "$(TARGET_DIR)/usr/share/sajax.lua"
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 72100f0..6dbdcea 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -119,4 +119,4 @@ endef
 
 XENOMAI_POST_UNINSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UDEV_RULES
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 2a8817c..bf90fd5 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -23,4 +23,4 @@ else
 XERCES_CONF_OPT += --disable-network
 endif
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 784f9b6..532e8c0 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -18,4 +18,4 @@ XFSPROGS_CONF_OPT = \
 XFSPROGS_INSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) install
 XFSPROGS_UNINSTALL_TARGET_OPT = DIST_ROOT=$(TARGET_DIR) uninstall
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index e8fc037..a209d12 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -13,4 +13,4 @@ endif
 
 XINETD_MAKE_OPT = AR="$(TARGET_AR)"
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index e44b75f..768e6ec 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -30,4 +30,4 @@ define XL2TP_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 24637ec..9061714 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -15,4 +15,4 @@ XMLSTARLET_CONF_OPT += --disable-static-libs \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index 16b45d7..d7d18db 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -9,5 +9,5 @@ XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index f462c7f..08e3303 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,4 +10,4 @@ XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index 8b03e65..ec63027 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -12,5 +12,5 @@ XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 
 XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index a34434e..e700c0d 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,5 +9,5 @@ XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 1c0df38..6c4278e 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -8,4 +8,4 @@ YAJL_VERSION = 2.0.4
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
 
-$(eval $(call CMAKETARGETS))
+$(eval $(cmake-package))
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index b6c499d..f5e530d 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -9,4 +9,4 @@ ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 8d78dc5..a9d4a8f 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -74,5 +74,5 @@ define HOST_ZLIB_UNINSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
 $(eval $(host-generic-package))
diff --git a/package/zxing/zxing.mk b/package/zxing/zxing.mk
index 9bde4b7..54383e7 100644
--- a/package/zxing/zxing.mk
+++ b/package/zxing/zxing.mk
@@ -36,4 +36,4 @@ define ZXING_UNINSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D)/cpp/core/src DESTDIR=$(TARGET_DIR) uninstall
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
-- 
tg: (ddbd2b6..) t/gentargets_nohost_mk (depends on: t/host-generic-package)
