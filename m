From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:29:16 +0200
Subject: [Buildroot] [PATCH 08/16] package: remove useless arguments from
	AUTOTARGETS
In-Reply-To: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826051.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4c5d5efafbb287dcf231d5abed7ab0095ee6f94c.1314826051.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the pkgdir and pkgname functions, we can rewrite the
AUTOTARGETS macro in a way that avoids the need for each package to
repeat its name and the directory in which it is present.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk                                  |    2 +-
 package/Makefile.autotools.in                      |   10 ++++------
 package/acl/acl.mk                                 |    2 +-
 package/alsamixergui/alsamixergui.mk               |    2 +-
 package/argp-standalone/argp-standalone.mk         |    2 +-
 package/argus/argus.mk                             |    2 +-
 package/at/at.mk                                   |    2 +-
 package/atk/atk.mk                                 |    4 ++--
 package/attr/attr.mk                               |    2 +-
 package/autoconf/autoconf.mk                       |    4 ++--
 package/automake/automake.mk                       |    4 ++--
 package/avahi/avahi.mk                             |    2 +-
 package/bash/bash.mk                               |    2 +-
 package/beecrypt/beecrypt.mk                       |    2 +-
 package/berkeleydb/berkeleydb.mk                   |    2 +-
 package/bind/bind.mk                               |    2 +-
 package/binutils/binutils.mk                       |    4 ++--
 package/bison/bison.mk                             |    4 ++--
 package/blackbox/blackbox.mk                       |    2 +-
 package/bmon/bmon.mk                               |    2 +-
 package/boa/boa.mk                                 |    2 +-
 package/bonnie/bonnie.mk                           |    2 +-
 package/bootutils/bootutils.mk                     |    2 +-
 package/bridge-utils/bridge.mk                     |    2 +-
 package/bwm-ng/bwm-ng.mk                           |    2 +-
 package/cairo/cairo.mk                             |    2 +-
 package/can-utils/can-utils.mk                     |    2 +-
 package/ccache/ccache.mk                           |    4 ++--
 package/coreutils/coreutils.mk                     |    2 +-
 package/ctorrent/ctorrent.mk                       |    2 +-
 package/cvs/cvs.mk                                 |    2 +-
 package/dash/dash.mk                               |    2 +-
 package/dbus-glib/dbus-glib.mk                     |    4 ++--
 package/dbus-python/dbus-python.mk                 |    2 +-
 package/dbus/dbus.mk                               |    4 ++--
 package/dhcp/dhcp.mk                               |    2 +-
 package/dialog/dialog.mk                           |    2 +-
 package/diffutils/diffutils.mk                     |    2 +-
 package/directfb-examples/directfb-examples.mk     |    2 +-
 package/directfb/directfb.mk                       |    4 ++--
 package/distcc/distcc.mk                           |    2 +-
 package/divine/divine.mk                           |    2 +-
 package/dmalloc/dmalloc.mk                         |    2 +-
 package/dmraid/dmraid.mk                           |    2 +-
 package/docker/docker.mk                           |    2 +-
 package/dropbear/dropbear.mk                       |    2 +-
 package/e2fsprogs/e2fsprogs.mk                     |    4 ++--
 package/ed/ed.mk                                   |    2 +-
 package/enchant/enchant.mk                         |    2 +-
 package/ethtool/ethtool.mk                         |    2 +-
 package/expat/expat.mk                             |    4 ++--
 package/fakeroot/fakeroot.mk                       |    4 ++--
 package/fbdump/fbdump.mk                           |    2 +-
 package/fbv/fbv.mk                                 |    2 +-
 package/file/file.mk                               |    4 ++--
 package/findutils/findutils.mk                     |    2 +-
 package/flex/flex.mk                               |    4 ++--
 package/fltk/fltk.mk                               |    2 +-
 package/fontconfig/fontconfig.mk                   |    4 ++--
 package/freetype/freetype.mk                       |    4 ++--
 package/fuse/libfuse.mk                            |    2 +-
 package/games/gnuchess/gnuchess.mk                 |    2 +-
 package/games/prboom/prboom.mk                     |    2 +-
 package/games/rubix/rubix.mk                       |    2 +-
 package/gamin/gamin.mk                             |    2 +-
 package/gawk/gawk.mk                               |    4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    4 ++--
 package/genext2fs/genext2fs.mk                     |    4 ++--
 package/gmp/gmp.mk                                 |    4 ++--
 package/gmpc/gmpc.mk                               |    2 +-
 package/gnutls/gnutls.mk                           |    2 +-
 package/gob2/gob2.mk                               |    4 ++--
 package/gperf/gperf.mk                             |    4 ++--
 package/gpsd/gpsd.mk                               |    2 +-
 package/gqview/gqview.mk                           |    2 +-
 package/grep/grep.mk                               |    2 +-
 package/gtk2-engines/gtk2-engines.mk               |    2 +-
 package/gtk2-themes/gtk2_themes.mk                 |    2 +-
 package/gtkperf/gtkperf.mk                         |    2 +-
 package/gvfs/gvfs.mk                               |    2 +-
 package/gzip/gzip.mk                               |    2 +-
 package/haserl/haserl.mk                           |    2 +-
 package/hostapd/hostapd.mk                         |    2 +-
 package/htop/htop.mk                               |    2 +-
 package/icu/icu.mk                                 |    4 ++--
 package/ifplugd/ifplugd.mk                         |    2 +-
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/inotify-tools/inotify-tools.mk             |    2 +-
 package/intltool/intltool.mk                       |    4 ++--
 package/iperf/iperf.mk                             |    2 +-
 package/ipkg/ipkg.mk                               |    2 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/ipset/ipset.mk                             |    2 +-
 package/iptables/iptables.mk                       |    2 +-
 package/java/classpath/classpath.mk                |    2 +-
 package/java/jamvm/jamvm.mk                        |    2 +-
 package/jpeg/jpeg.mk                               |    2 +-
 package/kbd/kbd.mk                                 |    2 +-
 package/kexec/kexec.mk                             |    2 +-
 package/kismet/kismet.mk                           |    2 +-
 package/leafpad/leafpad.mk                         |    2 +-
 package/less/less.mk                               |    2 +-
 package/libarchive/libarchive.mk                   |    2 +-
 package/libargtable2/libargtable2.mk               |    2 +-
 package/libart/libart.mk                           |    2 +-
 package/libatomic_ops/libatomic_ops.mk             |    2 +-
 package/libcgi/libcgi.mk                           |    2 +-
 package/libcgicc/libcgicc.mk                       |    2 +-
 package/libconfig/libconfig.mk                     |    2 +-
 package/libconfuse/libconfuse.mk                   |    2 +-
 package/libcurl/libcurl.mk                         |    2 +-
 package/libdaemon/libdaemon.mk                     |    2 +-
 package/libdnet/libdnet.mk                         |    2 +-
 package/libdrm/libdrm.mk                           |    2 +-
 package/libeXosip2/libeXosip2.mk                   |    2 +-
 package/libelf/libelf.mk                           |    2 +-
 package/libevent/libevent.mk                       |    2 +-
 package/libexif/libexif.mk                         |    2 +-
 package/libffi/libffi.mk                           |    2 +-
 package/libgail/libgail.mk                         |    2 +-
 package/libgcrypt/libgcrypt.mk                     |    2 +-
 package/libglade/libglade.mk                       |    2 +-
 package/libglib2/libglib2.mk                       |    4 ++--
 package/libgpg-error/libgpg-error.mk               |    2 +-
 package/libgtk2/libgtk2.mk                         |    4 ++--
 package/libhid/libhid.mk                           |    2 +-
 package/libiconv/libiconv.mk                       |    2 +-
 package/libidn/libidn.mk                           |    2 +-
 package/libiqrf/libiqrf.mk                         |    2 +-
 package/liblockfile/liblockfile.mk                 |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk             |    2 +-
 package/libmnl/libmnl.mk                           |    2 +-
 package/libnl/libnl.mk                             |    2 +-
 package/libnspr/libnspr.mk                         |    2 +-
 package/liboil/liboil.mk                           |    2 +-
 package/libosip2/libosip2.mk                       |    2 +-
 package/libpcap/libpcap.mk                         |    2 +-
 package/libpng/libpng.mk                           |    4 ++--
 package/libraw/libraw.mk                           |    2 +-
 package/libraw1394/libraw1394.mk                   |    2 +-
 package/librsvg/librsvg.mk                         |    2 +-
 package/librsync/librsync.mk                       |    2 +-
 package/libsexy/libsexy.mk                         |    2 +-
 package/libsigc/libsigc.mk                         |    2 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/libsysfs/libsysfs.mk                       |    2 +-
 package/libtool/libtool.mk                         |    4 ++--
 package/libungif/libungif.mk                       |    2 +-
 package/libupnp/libupnp.mk                         |    2 +-
 package/libusb-compat/libusb-compat.mk             |    2 +-
 package/libusb/libusb.mk                           |    2 +-
 package/libxml2/libxml2.mk                         |    4 ++--
 package/libxslt/libxslt.mk                         |    4 ++--
 package/lighttpd/lighttpd.mk                       |    2 +-
 package/links/links.mk                             |    2 +-
 package/lite/lite.mk                               |    2 +-
 package/lrzsz/lrzsz.mk                             |    2 +-
 package/lsuio/lsuio.mk                             |    2 +-
 package/ltp-testsuite/ltp-testsuite.mk             |    2 +-
 package/lvm2/lvm2.mk                               |    2 +-
 package/lzma/lzma.mk                               |    4 ++--
 package/lzo/lzo.mk                                 |    4 ++--
 package/lzop/lzop.mk                               |    2 +-
 package/m4/m4.mk                                   |    4 ++--
 package/make/make.mk                               |    2 +-
 .../matchbox/matchbox-common/matchbox-common.mk    |    2 +-
 .../matchbox/matchbox-desktop/matchbox-desktop.mk  |    2 +-
 .../matchbox/matchbox-fakekey/matchbox-fakekey.mk  |    2 +-
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk      |    2 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk  |    2 +-
 .../matchbox-startup-monitor.mk                    |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk        |    2 +-
 package/mdadm/mdadm.mk                             |    2 +-
 package/metacity/metacity.mk                       |    2 +-
 package/module-init-tools/module-init-tools.mk     |    4 ++--
 package/mpc/mpc.mk                                 |    4 ++--
 package/mpfr/mpfr.mk                               |    4 ++--
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 +-
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 package/multimedia/aumix/aumix.mk                  |    2 +-
 package/multimedia/faad2/faad2.mk                  |    2 +-
 package/multimedia/ffmpeg/ffmpeg.mk                |    2 +-
 package/multimedia/flac/flac.mk                    |    2 +-
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk        |    2 +-
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
 .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
 .../gst-plugins-good/gst-plugins-good.mk           |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 package/multimedia/gstreamer/gstreamer.mk          |    2 +-
 package/multimedia/lame/lame.mk                    |    2 +-
 package/multimedia/libao/libao.mk                  |    2 +-
 package/multimedia/libcdaudio/libcdaudio.mk        |    2 +-
 package/multimedia/libcue/libcue.mk                |    2 +-
 package/multimedia/libdvdnav/libdvdnav.mk          |    2 +-
 package/multimedia/libdvdread/libdvdread.mk        |    2 +-
 package/multimedia/libid3tag/libid3tag.mk          |    2 +-
 package/multimedia/libmad/libmad.mk                |    2 +-
 package/multimedia/libmms/libmms.mk                |    2 +-
 package/multimedia/libmpd/libmpd.mk                |    2 +-
 package/multimedia/libmpeg2/libmpeg2.mk            |    2 +-
 package/multimedia/libogg/libogg.mk                |    2 +-
 package/multimedia/libreplaygain/libreplaygain.mk  |    2 +-
 package/multimedia/libsamplerate/libsamplerate.mk  |    2 +-
 package/multimedia/libsndfile/libsndfile.mk        |    2 +-
 package/multimedia/libtheora/libtheora.mk          |    2 +-
 package/multimedia/libvorbis/libvorbis.mk          |    2 +-
 package/multimedia/madplay/madplay.mk              |    2 +-
 package/multimedia/mpd/mpd.mk                      |    2 +-
 package/multimedia/mpg123/mpg123.mk                |    2 +-
 package/multimedia/musepack/musepack.mk            |    2 +-
 package/multimedia/speex/speex.mk                  |    2 +-
 package/multimedia/swfdec/swfdec.mk                |    2 +-
 package/multimedia/taglib/taglib.mk                |    2 +-
 package/multimedia/tremor/tremor.mk                |    2 +-
 package/multimedia/vorbis-tools/vorbis-tools.mk    |    2 +-
 package/multimedia/wavpack/wavpack.mk              |    2 +-
 package/mutt/mutt.mk                               |    2 +-
 package/mxml/mxml.mk                               |    2 +-
 package/mysql_client/mysql_client.mk               |    2 +-
 package/nano/nano.mk                               |    2 +-
 package/nasm/nasm.mk                               |    4 ++--
 package/nbd/nbd.mk                                 |    2 +-
 package/ncftp/ncftp.mk                             |    2 +-
 package/ncurses/ncurses.mk                         |    4 ++--
 package/neon/neon.mk                               |    2 +-
 package/netcat/netcat.mk                           |    2 +-
 package/netperf/netperf.mk                         |    2 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/netstat-nat/netstat-nat.mk                 |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    2 +-
 package/ngircd/ngircd.mk                           |    2 +-
 package/ntfs-3g/ntfs-3g.mk                         |    2 +-
 package/ntfsprogs/ntfsprogs.mk                     |    2 +-
 package/ntp/ntp.mk                                 |    2 +-
 package/openntpd/openntpd.mk                       |    2 +-
 package/openssh/openssh.mk                         |    2 +-
 package/openvpn/openvpn.mk                         |    2 +-
 package/oprofile/oprofile.mk                       |    2 +-
 package/orc/orc.mk                                 |    2 +-
 package/pango/pango.mk                             |    2 +-
 package/patch/patch.mk                             |    2 +-
 package/pcmanfm/pcmanfm.mk                         |    2 +-
 package/pcre/pcre.mk                               |    2 +-
 package/php/php.mk                                 |    2 +-
 package/pixman/pixman.mk                           |    4 ++--
 package/pkg-config/pkg-config.mk                   |    4 ++--
 package/popt/popt.mk                               |    2 +-
 package/proftpd/proftpd.mk                         |    2 +-
 package/psmisc/psmisc.mk                           |    2 +-
 package/python/python.mk                           |    4 ++--
 package/quagga/quagga.mk                           |    2 +-
 package/radvd/radvd.mk                             |    2 +-
 package/rdesktop/rdesktop.mk                       |    2 +-
 package/readline/readline.mk                       |    2 +-
 package/rng-tools/rng-tools.mk                     |    2 +-
 package/rp-pppoe/rp-pppoe.mk                       |    2 +-
 package/rpm/rpm.mk                                 |    2 +-
 package/rrdtool/rrdtool.mk                         |    2 +-
 package/rsync/rsync.mk                             |    2 +-
 package/rsyslog/rsyslog.mk                         |    2 +-
 package/ruby/ruby.mk                               |    4 ++--
 package/samba/samba.mk                             |    2 +-
 package/sawman/sawman.mk                           |    2 +-
 package/screen/screen.mk                           |    2 +-
 package/sdl/sdl.mk                                 |    2 +-
 package/sdl_gfx/sdl_gfx.mk                         |    2 +-
 package/sdl_image/sdl_image.mk                     |    2 +-
 package/sdl_mixer/sdl_mixer.mk                     |    2 +-
 package/sdl_net/sdl_net.mk                         |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sdl_ttf/sdl_ttf.mk                         |    2 +-
 package/sdparm/sdparm.mk                           |    2 +-
 package/sed/sed.mk                                 |    2 +-
 package/ser2net/ser2net.mk                         |    2 +-
 package/setserial/setserial.mk                     |    2 +-
 package/shared-mime-info/shared-mime-info.mk       |    4 ++--
 package/smartmontools/smartmontools.mk             |    2 +-
 package/socat/socat.mk                             |    2 +-
 package/spawn-fcgi/spawn-fcgi.mk                   |    2 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/squid/squid.mk                             |    2 +-
 package/sshfs/sshfs.mk                             |    2 +-
 .../startup-notification/startup-notification.mk   |    2 +-
 package/strace/strace.mk                           |    2 +-
 package/stunnel/stunnel.mk                         |    2 +-
 package/sudo/sudo.mk                               |    2 +-
 package/sylpheed/sylpheed.mk                       |    2 +-
 package/synergy/synergy.mk                         |    2 +-
 package/sysstat/sysstat.mk                         |    2 +-
 package/tar/tar.mk                                 |    2 +-
 package/tcl/tcl.mk                                 |    2 +-
 package/tcpdump/tcpdump.mk                         |    2 +-
 package/tcpreplay/tcpreplay.mk                     |    2 +-
 package/tftpd/tftpd.mk                             |    2 +-
 package/thttpd/thttpd.mk                           |    2 +-
 package/tiff/tiff.mk                               |    2 +-
 package/tn5250/tn5250.mk                           |    2 +-
 package/torsmo/torsmo.mk                           |    2 +-
 package/tslib/tslib.mk                             |    2 +-
 package/udev/udev.mk                               |    2 +-
 package/udpcast/udpcast.mk                         |    2 +-
 package/usbutils/usbutils.mk                       |    2 +-
 package/util-linux/util-linux.mk                   |    2 +-
 package/valgrind/valgrind.mk                       |    2 +-
 package/vim/vim.mk                                 |    2 +-
 package/vtun/vtun.mk                               |    2 +-
 package/webkit/webkit.mk                           |    2 +-
 package/wget/wget.mk                               |    2 +-
 package/which/which.mk                             |    2 +-
 package/wpa_supplicant/wpa_supplicant.mk           |    2 +-
 package/x11r7/libxcb/libxcb.mk                     |    4 ++--
 package/x11r7/mesa3d/mesa3d.mk                     |    2 +-
 package/x11r7/pthread-stubs/pthread-stubs.mk       |    4 ++--
 package/x11r7/xapp_appres/xapp_appres.mk           |    2 +-
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk       |    4 ++--
 package/x11r7/xapp_beforelight/xapp_beforelight.mk |    2 +-
 package/x11r7/xapp_bitmap/xapp_bitmap.mk           |    2 +-
 package/x11r7/xapp_editres/xapp_editres.mk         |    2 +-
 package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk   |    2 +-
 package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk     |    2 +-
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk         |    2 +-
 package/x11r7/xapp_iceauth/xapp_iceauth.mk         |    2 +-
 package/x11r7/xapp_ico/xapp_ico.mk                 |    2 +-
 package/x11r7/xapp_listres/xapp_listres.mk         |    2 +-
 package/x11r7/xapp_luit/xapp_luit.mk               |    2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk     |    4 ++--
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    4 ++--
 package/x11r7/xapp_oclock/xapp_oclock.mk           |    2 +-
 package/x11r7/xapp_rgb/xapp_rgb.mk                 |    2 +-
 package/x11r7/xapp_rstart/xapp_rstart.mk           |    2 +-
 package/x11r7/xapp_scripts/xapp_scripts.mk         |    2 +-
 package/x11r7/xapp_sessreg/xapp_sessreg.mk         |    2 +-
 package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk     |    2 +-
 package/x11r7/xapp_showfont/xapp_showfont.mk       |    2 +-
 package/x11r7/xapp_smproxy/xapp_smproxy.mk         |    2 +-
 package/x11r7/xapp_twm/xapp_twm.mk                 |    2 +-
 package/x11r7/xapp_viewres/xapp_viewres.mk         |    2 +-
 package/x11r7/xapp_x11perf/xapp_x11perf.mk         |    2 +-
 package/x11r7/xapp_xauth/xapp_xauth.mk             |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |    2 +-
 package/x11r7/xapp_xbiff/xapp_xbiff.mk             |    2 +-
 package/x11r7/xapp_xcalc/xapp_xcalc.mk             |    2 +-
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   |    2 +-
 package/x11r7/xapp_xclock/xapp_xclock.mk           |    2 +-
 package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk           |    2 +-
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   |    2 +-
 package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk     |    2 +-
 package/x11r7/xapp_xditview/xapp_xditview.mk       |    2 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk                 |    2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk       |    2 +-
 package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk       |    2 +-
 package/x11r7/xapp_xedit/xapp_xedit.mk             |    2 +-
 package/x11r7/xapp_xev/xapp_xev.mk                 |    2 +-
 package/x11r7/xapp_xeyes/xapp_xeyes.mk             |    2 +-
 package/x11r7/xapp_xf86dga/xapp_xf86dga.mk         |    2 +-
 package/x11r7/xapp_xfd/xapp_xfd.mk                 |    2 +-
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk       |    2 +-
 package/x11r7/xapp_xfs/xapp_xfs.mk                 |    2 +-
 package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk         |    2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk           |    2 +-
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    2 +-
 package/x11r7/xapp_xhost/xapp_xhost.mk             |    2 +-
 package/x11r7/xapp_xinit/xapp_xinit.mk             |    2 +-
 package/x11r7/xapp_xinput/xapp_xinput.mk           |    2 +-
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    4 ++--
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk           |    2 +-
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk       |    2 +-
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk       |    2 +-
 package/x11r7/xapp_xkill/xapp_xkill.mk             |    2 +-
 package/x11r7/xapp_xload/xapp_xload.mk             |    2 +-
 package/x11r7/xapp_xlogo/xapp_xlogo.mk             |    2 +-
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk       |    2 +-
 package/x11r7/xapp_xlsclients/xapp_xlsclients.mk   |    2 +-
 package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk       |    2 +-
 package/x11r7/xapp_xmag/xapp_xmag.mk               |    2 +-
 package/x11r7/xapp_xman/xapp_xman.mk               |    2 +-
 package/x11r7/xapp_xmessage/xapp_xmessage.mk       |    2 +-
 package/x11r7/xapp_xmh/xapp_xmh.mk                 |    2 +-
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk         |    2 +-
 package/x11r7/xapp_xmore/xapp_xmore.mk             |    2 +-
 .../x11r7/xapp_xplsprinters/xapp_xplsprinters.mk   |    2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk                 |    2 +-
 .../xapp_xprehashprinterlist.mk                    |    2 +-
 package/x11r7/xapp_xprop/xapp_xprop.mk             |    2 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk           |    2 +-
 package/x11r7/xapp_xrdb/xapp_xrdb.mk               |    2 +-
 package/x11r7/xapp_xrefresh/xapp_xrefresh.mk       |    2 +-
 package/x11r7/xapp_xset/xapp_xset.mk               |    2 +-
 package/x11r7/xapp_xsetmode/xapp_xsetmode.mk       |    2 +-
 package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk |    2 +-
 package/x11r7/xapp_xsetroot/xapp_xsetroot.mk       |    2 +-
 package/x11r7/xapp_xsm/xapp_xsm.mk                 |    2 +-
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk       |    2 +-
 package/x11r7/xapp_xvidtune/xapp_xvidtune.mk       |    2 +-
 package/x11r7/xapp_xvinfo/xapp_xvinfo.mk           |    2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk                 |    2 +-
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk       |    2 +-
 package/x11r7/xapp_xwud/xapp_xwud.mk               |    2 +-
 package/x11r7/xcb-proto/xcb-proto.mk               |    4 ++--
 package/x11r7/xcb-util/xcb-util.mk                 |    2 +-
 package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk     |    2 +-
 .../xdata_xcursor-themes/xdata_xcursor-themes.mk   |    2 +-
 .../xdriver_xf86-input-acecad.mk                   |    2 +-
 .../xdriver_xf86-input-aiptek.mk                   |    2 +-
 .../xdriver_xf86-input-evdev.mk                    |    2 +-
 .../xdriver_xf86-input-joystick.mk                 |    2 +-
 .../xdriver_xf86-input-keyboard.mk                 |    2 +-
 .../xdriver_xf86-input-mouse.mk                    |    2 +-
 .../xdriver_xf86-input-synaptics.mk                |    2 +-
 .../xdriver_xf86-input-vmmouse.mk                  |    2 +-
 .../xdriver_xf86-input-void.mk                     |    2 +-
 .../xdriver_xf86-video-apm.mk                      |    2 +-
 .../xdriver_xf86-video-ark.mk                      |    2 +-
 .../xdriver_xf86-video-ast.mk                      |    2 +-
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 .../xdriver_xf86-video-chips.mk                    |    2 +-
 .../xdriver_xf86-video-cirrus.mk                   |    2 +-
 .../xdriver_xf86-video-dummy.mk                    |    2 +-
 .../xdriver_xf86-video-fbdev.mk                    |    2 +-
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 .../xdriver_xf86-video-glide.mk                    |    2 +-
 .../xdriver_xf86-video-glint.mk                    |    2 +-
 .../xdriver_xf86-video-i128.mk                     |    2 +-
 .../xdriver_xf86-video-i740.mk                     |    2 +-
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 .../xdriver_xf86-video-mach64.mk                   |    2 +-
 .../xdriver_xf86-video-mga.mk                      |    2 +-
 .../xdriver_xf86-video-neomagic.mk                 |    2 +-
 .../xdriver_xf86-video-newport.mk                  |    2 +-
 .../xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk |    2 +-
 .../xdriver_xf86-video-openchrome.mk               |    2 +-
 .../xdriver_xf86-video-r128.mk                     |    2 +-
 .../xdriver_xf86-video-rendition.mk                |    2 +-
 .../xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk |    2 +-
 .../xdriver_xf86-video-s3virge.mk                  |    2 +-
 .../xdriver_xf86-video-savage.mk                   |    2 +-
 .../xdriver_xf86-video-siliconmotion.mk            |    2 +-
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 .../xdriver_xf86-video-sisusb.mk                   |    2 +-
 .../xdriver_xf86-video-suncg14.mk                  |    2 +-
 .../xdriver_xf86-video-suncg3.mk                   |    2 +-
 .../xdriver_xf86-video-suncg6.mk                   |    2 +-
 .../xdriver_xf86-video-sunffb.mk                   |    2 +-
 .../xdriver_xf86-video-sunleo.mk                   |    2 +-
 .../xdriver_xf86-video-suntcx.mk                   |    2 +-
 .../xdriver_xf86-video-tdfx.mk                     |    2 +-
 .../xdriver_xf86-video-tga.mk                      |    2 +-
 .../xdriver_xf86-video-trident.mk                  |    2 +-
 .../xdriver_xf86-video-tseng.mk                    |    2 +-
 .../xdriver_xf86-video-v4l.mk                      |    2 +-
 .../xdriver_xf86-video-vesa.mk                     |    2 +-
 .../xdriver_xf86-video-vmware.mk                   |    2 +-
 .../xdriver_xf86-video-voodoo.mk                   |    2 +-
 .../xdriver_xf86-video-wsfb.mk                     |    2 +-
 .../xdriver_xf86-video-xgi.mk                      |    2 +-
 .../xdriver_xf86-video-xgixp.mk                    |    2 +-
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    4 ++--
 .../xfont_font-adobe-100dpi.mk                     |    2 +-
 .../xfont_font-adobe-75dpi.mk                      |    2 +-
 .../xfont_font-adobe-utopia-100dpi.mk              |    2 +-
 .../xfont_font-adobe-utopia-75dpi.mk               |    2 +-
 .../xfont_font-adobe-utopia-type1.mk               |    2 +-
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |    2 +-
 .../xfont_font-arabic-misc.mk                      |    2 +-
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |    2 +-
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |    2 +-
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |    2 +-
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |    2 +-
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |    2 +-
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |    2 +-
 .../xfont_font-bitstream-100dpi.mk                 |    2 +-
 .../xfont_font-bitstream-75dpi.mk                  |    2 +-
 .../xfont_font-bitstream-speedo.mk                 |    2 +-
 .../xfont_font-bitstream-type1.mk                  |    2 +-
 .../xfont_font-cronyx-cyrillic.mk                  |    2 +-
 .../xfont_font-cursor-misc.mk                      |    2 +-
 .../xfont_font-daewoo-misc.mk                      |    2 +-
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |    2 +-
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |    2 +-
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |    2 +-
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |    2 +-
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |    2 +-
 .../xfont_font-misc-cyrillic.mk                    |    2 +-
 .../xfont_font-misc-ethiopic.mk                    |    2 +-
 .../xfont_font-misc-meltho.mk                      |    2 +-
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    3 +--
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |    2 +-
 .../xfont_font-schumacher-misc.mk                  |    2 +-
 .../xfont_font-screen-cyrillic.mk                  |    2 +-
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |    2 +-
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk   |    4 ++--
 .../xfont_font-winitzki-cyrillic.mk                |    2 +-
 .../xfont_font-xfree86-type1.mk                    |    2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk             |    2 +-
 package/x11r7/xlib_libICE/xlib_libICE.mk           |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk             |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    4 ++--
 .../x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk |    2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk           |    4 ++--
 package/x11r7/xlib_libXaw/xlib_libXaw.mk           |    2 +-
 .../x11r7/xlib_libXcomposite/xlib_libXcomposite.mk |    2 +-
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   |    2 +-
 package/x11r7/xlib_libXdamage/xlib_libXdamage.mk   |    2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk       |    4 ++--
 package/x11r7/xlib_libXext/xlib_libXext.mk         |    2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |    4 ++--
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 package/x11r7/xlib_libXft/xlib_libXft.mk           |    2 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk             |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk |    2 +-
 package/x11r7/xlib_libXmu/xlib_libXmu.mk           |    2 +-
 package/x11r7/xlib_libXp/xlib_libXp.mk             |    2 +-
 package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    2 +-
 .../xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk |    2 +-
 .../x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk     |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk         |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk             |    2 +-
 package/x11r7/xlib_libXtst/xlib_libXtst.mk         |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk             |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk         |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk           |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   |    4 ++--
 package/x11r7/xlib_liboldX/xlib_liboldX.mk         |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    2 +-
 package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk   |    4 ++--
 package/x11r7/xlib_libxkbui/xlib_libxkbui.mk       |    2 +-
 package/x11r7/xlib_xtrans/xlib_xtrans.mk           |    4 ++--
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 +-
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 .../xproto_compositeproto/xproto_compositeproto.mk |    2 +-
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 +-
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk   |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 +-
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    4 ++--
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    4 ++--
 package/x11r7/xproto_glproto/xproto_glproto.mk     |    2 +-
 .../x11r7/xproto_inputproto/xproto_inputproto.mk   |    4 ++--
 package/x11r7/xproto_kbproto/xproto_kbproto.mk     |    4 ++--
 .../x11r7/xproto_printproto/xproto_printproto.mk   |    2 +-
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 .../x11r7/xproto_recordproto/xproto_recordproto.mk |    2 +-
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    2 +-
 .../xproto_resourceproto/xproto_resourceproto.mk   |    2 +-
 .../xproto_scrnsaverproto/xproto_scrnsaverproto.mk |    2 +-
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 .../xproto_windowswmproto/xproto_windowswmproto.mk |    2 +-
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    4 ++--
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    4 ++--
 .../xproto_xf86bigfontproto.mk                     |    4 ++--
 .../xproto_xf86dgaproto/xproto_xf86dgaproto.mk     |    2 +-
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 +-
 .../xproto_xf86rushproto/xproto_xf86rushproto.mk   |    2 +-
 .../xproto_xf86vidmodeproto.mk                     |    2 +-
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 +-
 package/x11r7/xproto_xproto/xproto_xproto.mk       |    4 ++--
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 package/x11r7/xutil_makedepend/xutil_makedepend.mk |    4 ++--
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    4 ++--
 package/x11vnc/x11vnc.mk                           |    2 +-
 package/xerces/xerces.mk                           |    2 +-
 package/xmlstarlet/xmlstarlet.mk                   |    2 +-
 package/xstroke/xstroke.mk                         |    2 +-
 package/xterm/xterm.mk                             |    2 +-
 package/xvkbd/xvkbd.mk                             |    2 +-
 package/xz/xz.mk                                   |    4 ++--
 574 files changed, 647 insertions(+), 650 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 2ce8eab..fbff867 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -82,4 +82,4 @@ define GRUB_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/boot/grub
 endef
 
-$(eval $(call AUTOTARGETS,boot,grub))
+$(eval $(call AUTOTARGETS))
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 46ab861..b65caa2 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -280,15 +280,13 @@ endef
 ################################################################################
 # AUTOTARGETS -- the target generator macro for autotools packages
 #
-# Argument 1 is the package directory prefix [mandatory]
-# Argument 2 is the lowercase package name   [mandatory]
-# Argument 3 is "target" or "host"           [optional, default: "target"]
+# Argument 1 is "target" or "host"           [optional, default: "target"]
 ################################################################################
 
 define AUTOTARGETS
-ifeq ($(3),host)
-$(call AUTOTARGETS_INNER,$(3)-$(2),$(call UPPERCASE,$(3)-$(2)),$(call UPPERCASE,$(2)),$(1),host)
+ifeq ($(1),host)
+$(call AUTOTARGETS_INNER,$(1)-$(call pkgname),$(call UPPERCASE,$(1)-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),host)
 else
-$(call AUTOTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
+$(call AUTOTARGETS_INNER,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgdir),target)
 endif
 endef
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 11768f6..48db8ae 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -25,4 +25,4 @@ ACL_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS,package,acl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index a8ed0ef..e8c8dda 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -14,5 +14,5 @@ ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
 
 ALSAMIXERGUI_DEPENDENCIES = fltk alsa-lib
 
-$(eval $(call AUTOTARGETS,package,alsamixergui))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index f48d0e6..ac0890d 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -18,4 +18,4 @@ define ARGP_STANDALONE_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/argp.h $(TARGET_DIR)/usr/include/argp.h
 endef
 
-$(eval $(call AUTOTARGETS,package,argp-standalone))
+$(eval $(call AUTOTARGETS))
diff --git a/package/argus/argus.mk b/package/argus/argus.mk
index 2705bac..95c6e45 100644
--- a/package/argus/argus.mk
+++ b/package/argus/argus.mk
@@ -17,4 +17,4 @@ endef
 
 ARGUS_POST_PATCH_HOOKS += ARGUS_DEBIAN_PATCH_APPLY
 
-$(eval $(call AUTOTARGETS,package,argus))
+$(eval $(call AUTOTARGETS))
diff --git a/package/at/at.mk b/package/at/at.mk
index e9873f8..4270c83 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -41,4 +41,4 @@ define AT_UNINSTALL_TARGET_CMDS
 		at.1 atq.1 atrm.1 batch.1 at_allow.5 at_deny.5 atd.8 atrun.8)
 endef
 
-$(eval $(call AUTOTARGETS,package,at))
+$(eval $(call AUTOTARGETS))
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 9ea8a90..f0e96a5 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -57,5 +57,5 @@ HOST_ATK_DEPENDENCIES = host-libglib2 host-pkg-config
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
-$(eval $(call AUTOTARGETS,package,atk))
-$(eval $(call AUTOTARGETS,package,atk,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index b744ef6..beecb31 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -24,4 +24,4 @@ ATTR_INSTALL_TARGET_OPT = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
-$(eval $(call AUTOTARGETS,package,attr))
+$(eval $(call AUTOTARGETS))
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 45bb635..7c42bf9 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -17,8 +17,8 @@ HOST_AUTOCONF_CONF_ENV = ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
 
 HOST_AUTOCONF_DEPENDENCIES = host-m4 host-libtool
 
-$(eval $(call AUTOTARGETS,package,autoconf))
-$(eval $(call AUTOTARGETS,package,autoconf,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # variables used by other packages
 AUTOCONF:=$(HOST_DIR)/usr/bin/autoconf
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 8857e98..7f35f3f 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -23,8 +23,8 @@ endef
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += GTK_DOC_M4_INSTALL
 HOST_AUTOMAKE_POST_INSTALL_HOOKS += HOST_AUTOMAKE_MAKE_ACLOCAL
 
-$(eval $(call AUTOTARGETS,package,automake))
-$(eval $(call AUTOTARGETS,package,automake,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index fdf0390..739c5f2 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -164,4 +164,4 @@ ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS,package,avahi))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 2bcf0c4..b20f6a8 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -34,4 +34,4 @@ define BASH_UNINSTALL_TARGET_CMDS
 	fi
 endef
 
-$(eval $(call AUTOTARGETS,package,bash))
+$(eval $(call AUTOTARGETS))
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 5fffd1f..06c359e 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -13,4 +13,4 @@ BEECRYPT_CONF_OPT =  --without-cplusplus \
 		--without-python  \
 		--disable-rpath
 
-$(eval $(call AUTOTARGETS,package,beecrypt))
+$(eval $(call AUTOTARGETS))
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index eb20ba9..ed70486 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -52,4 +52,4 @@ BERKELEYDB_POST_INSTALL_TARGET_HOOKS += BERKELEYDB_REMOVE_DOCS
 
 endif
 
-$(eval $(call AUTOTARGETS,package,berkeleydb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0530934..b62c8ea 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -55,4 +55,4 @@ define BIND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S81named
 endef
 
-$(eval $(call AUTOTARGETS,package,bind))
+$(eval $(call AUTOTARGETS))
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5454af8..2d60ce0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -51,5 +51,5 @@ define BINUTILS_INSTALL_TARGET_CMDS
 		DESTDIR=$(TARGET_DIR) install
 endef
 
-$(eval $(call AUTOTARGETS,package,binutils))
-$(eval $(call AUTOTARGETS,package,binutils,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 93026e9..d365e33 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -13,5 +13,5 @@ endef
 
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
-$(eval $(call AUTOTARGETS,package,bison))
-$(eval $(call AUTOTARGETS,package,bison,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index e3c8c34..6836c96 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -20,4 +20,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS,package,blackbox))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index ef2dcf0..98c0ab7 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -29,4 +29,4 @@ define BMON_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/bmon
 endef
 
-$(eval $(call AUTOTARGETS,package,bmon))
+$(eval $(call AUTOTARGETS))
diff --git a/package/boa/boa.mk b/package/boa/boa.mk
index 702193d..c09e87f 100644
--- a/package/boa/boa.mk
+++ b/package/boa/boa.mk
@@ -25,4 +25,4 @@ define BOA_UNINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
 endef
 
-$(eval $(call AUTOTARGETS,package,boa))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
index 9a6188f..2251ebc 100644
--- a/package/bonnie/bonnie.mk
+++ b/package/bonnie/bonnie.mk
@@ -15,4 +15,4 @@ define BONNIE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
 endef
 
-$(eval $(call AUTOTARGETS,package,bonnie))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index d574812..35df95b 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -8,4 +8,4 @@ BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
 
-$(eval $(call AUTOTARGETS,package,bootutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bridge-utils/bridge.mk b/package/bridge-utils/bridge.mk
index 8f3f741..f7947fb 100644
--- a/package/bridge-utils/bridge.mk
+++ b/package/bridge-utils/bridge.mk
@@ -15,4 +15,4 @@ define BRIDGE_UNINSTALL_TARGET_CMDS
 		include/libbridge.h share/man/man8/brctl.8 sbin/brctl)
 endef
 
-$(eval $(call AUTOTARGETS,package,bridge))
+$(eval $(call AUTOTARGETS))
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
index a33f4f2..618a61f 100644
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -13,4 +13,4 @@ BWM_NG_CONF_OPT += --with-ncurses
 BWM_NG_DEPENDENCIES += ncurses
 endif
 
-$(eval $(call AUTOTARGETS,package,bwm-ng))
+$(eval $(call AUTOTARGETS))
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 7955e08..1746eff 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -87,4 +87,4 @@ HOST_CAIRO_CONF_OPT = \
 		--disable-png \
 		--disable-svg
 
-$(eval $(call AUTOTARGETS,package,cairo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index f602490..198c38d 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -8,4 +8,4 @@ CAN_UTILS_VERSION = 1235
 CAN_UTILS_SITE = svn://svn.berlios.de/socketcan/trunk/can-utils
 CAN_UTILS_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS,package,can-utils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index dd25b76..87a64e5 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -23,8 +23,8 @@ endef
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_FIX_CCACHE_DIR
 
-$(eval $(call AUTOTARGETS,package,ccache))
-$(eval $(call AUTOTARGETS,package,ccache,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 ifeq ($(BR2_CCACHE),y)
 ccache-stats: host-ccache
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index fed5e90..7ee37b1 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -78,4 +78,4 @@ COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_POST_INSTALL
 # If both coreutils and busybox are selected, the corresponding applets
 # may need to be reinstated by the clean targets.
 
-$(eval $(call AUTOTARGETS,package,coreutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
index aa22153..f086447 100644
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -14,4 +14,4 @@ else
 CTORRENT_CONF_OPT+=--with-ssl=no
 endif
 
-$(eval $(call AUTOTARGETS,package,ctorrent))
+$(eval $(call AUTOTARGETS))
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 023e93b..2f1970f 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -48,6 +48,6 @@ define CVS_INSTALL_TARGET_CMDS
 	install -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
 endef
 
-$(eval $(call AUTOTARGETS,package,cvs))
+$(eval $(call AUTOTARGETS))
 
 
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index e5da642..db2d4e5 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -17,4 +17,4 @@ define DASH_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/bin/dash
 endef
 
-$(eval $(call AUTOTARGETS,package,dash))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 6058b23..89d52c9 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -33,8 +33,8 @@ HOST_DBUS_GLIB_CONF_OPT = \
 		--disable-doxygen-docs \
 		--enable-asserts=yes
 
-$(eval $(call AUTOTARGETS,package,dbus-glib))
-$(eval $(call AUTOTARGETS,package,dbus-glib,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # dbus-glib for the host
 DBUS_GLIB_HOST_BINARY:=$(HOST_DIR)/usr/bin/dbus-binding-tool
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index b2e9f56..d027f2f 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -21,4 +21,4 @@ DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
 
 DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
-$(eval $(call AUTOTARGETS,package,dbus-python))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7c2bddd..85b268a 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -86,5 +86,5 @@ HOST_DBUS_GEN_INTROSPECT = \
 
 HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
-$(eval $(call AUTOTARGETS,package,dbus))
-$(eval $(call AUTOTARGETS,package,dbus,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 58fd47c..f520d77 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -61,4 +61,4 @@ define DHCP_INSTALL_TARGET_CMDS
 	$(DHCP_INSTALL_CLIENT)
 endef
 
-$(eval $(call AUTOTARGETS,package,dhcp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index e8f025f..0a4f792 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -23,4 +23,4 @@ define DIALOG_POST_CLEAN
 	rm -f $(TARGET_DIR)/usr/bin/dialog
 endef
 
-$(eval $(call AUTOTARGETS,package,dialog))
+$(eval $(call AUTOTARGETS))
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6ce71c9..693b0c8 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -61,4 +61,4 @@ DIFFUTILS_CONF_ENV = ac_cv_func_strtod=yes
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no
 
-$(eval $(call AUTOTARGETS,package,diffutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index aed9790..cea1eb2 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -101,5 +101,5 @@ define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS,package,directfb-examples))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index c32fcdb..6fbbb32 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -141,8 +141,8 @@ endef
 
 DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_STAGING_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS,package,directfb))
-$(eval $(call AUTOTARGETS,package,directfb,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # directfb-csource for the host
 DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
index f3d13bd..4096197 100644
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -20,4 +20,4 @@ define DISTCC_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS,package,distcc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 554ee63..0b60adc 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -11,4 +11,4 @@ DIVINE_INSTALL_STAGING = YES
 DIVINE_INSTALL_TARGET = YES
 DIVINE_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS,package,divine))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index dca0488..4de324e 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -55,4 +55,4 @@ define DMALLOC_CLEAN_CMDS
 endef
 
 
-$(eval $(call AUTOTARGETS,package,dmalloc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index e98161c..7763aaa 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
@@ -26,4 +26,4 @@ define DMRAID_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S20dmraid
 endef
 
-$(eval $(call AUTOTARGETS,package,dmraid))
+$(eval $(call AUTOTARGETS))
diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 5b4cd3a..59282a2 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -21,4 +21,4 @@ DOCKER_INSTALL_TARGET_OPT = PREFIX=$(TARGET_DIR)/usr install
 
 DOCKER_DEPENDENCIES = host-pkg-config libglib2 xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package,docker))
+$(eval $(call AUTOTARGETS))
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 6ef5dec..e9da42d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -62,4 +62,4 @@ define DROPBEAR_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 endef
 
-$(eval $(call AUTOTARGETS,package,dropbear))
+$(eval $(call AUTOTARGETS))
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 1cfeb01..278bfb5 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -99,5 +99,5 @@ ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 E2FSPROGS_POST_INSTALL_TARGET_HOOKS += E2FSPROGS_TARGET_FINDFS_SYMLINK
 endif
 
-$(eval $(call AUTOTARGETS,package,e2fsprogs))
-$(eval $(call AUTOTARGETS,package,e2fsprogs,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index e7016bf..2196af0 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -9,4 +9,4 @@ ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
 
-$(eval $(call AUTOTARGETS,package,ed))
+$(eval $(call AUTOTARGETS))
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 9be3f1a..e29137a 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -12,4 +12,4 @@ ENCHANT_INSTALL_TARGET = YES
 
 ENCHANT_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,enchant))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index d3f578c..9ac6a3a 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -7,4 +7,4 @@
 ETHTOOL_VERSION = 2.6.39
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
 
-$(eval $(call AUTOTARGETS,package,ethtool))
+$(eval $(call AUTOTARGETS))
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index e7185e2..64a1416 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -14,5 +14,5 @@ EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
 
 EXPAT_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,expat))
-$(eval $(call AUTOTARGETS,package,expat,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 29e9e5b..804588d 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -19,5 +19,5 @@ FAKEROOT_POST_PATCH_HOOKS += FAKEROOT_PATCH_FAKEROOT_IN
 # The package for the target cannot be selected (build problems when
 # largefile is enabled), but is needed for the host package to work
 # due to deficiencies in the package infrastructure.
-$(eval $(call AUTOTARGETS,package,fakeroot))
-$(eval $(call AUTOTARGETS,package,fakeroot,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
index eb74d8b..bad7bff 100644
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -9,5 +9,5 @@ FBDUMP_SITE:=http://www.rcdrummond.net/fbdump
 FBDUMP_AUTORECONF = NO
 FBDUMP_CONF_OPT = --program-prefix=''
 
-$(eval $(call AUTOTARGETS,package,fbdump))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index 7305c6e..855a0d4 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -33,4 +33,4 @@ define FBV_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS,package,fbv))
+$(eval $(call AUTOTARGETS))
diff --git a/package/file/file.mk b/package/file/file.mk
index d405c26..4b3fdf9 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -14,5 +14,5 @@ define FILE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libmagic.*
 endef
 
-$(eval $(call AUTOTARGETS,package,file))
-$(eval $(call AUTOTARGETS,package,file,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 7ab6b0b..7c9e596 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,4 +9,4 @@ FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
-$(eval $(call AUTOTARGETS,package,findutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 41c9505..706b89d 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -40,5 +40,5 @@ FLEX_POST_INSTALL_HOOKS += FLEX_INSTALL_LIBFL
 FLEX_POST_CLEAN_HOOKS += FLEX_UNINSTALL_LIBFL
 endif
 
-$(eval $(call AUTOTARGETS,package,flex))
-$(eval $(call AUTOTARGETS,package,flex,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 41bb678..164c518 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -18,4 +18,4 @@ FLTK_CONF_OPT = --enable-threads --with-x
 
 FLTK_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS,package,fltk))
+$(eval $(call AUTOTARGETS))
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index a875e74..fc6ad68 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -27,5 +27,5 @@ HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
 		--disable-static
 
-$(eval $(call AUTOTARGETS,package,fontconfig))
-$(eval $(call AUTOTARGETS,package,fontconfig,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad4292f..ff9f295 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -31,5 +31,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 FREETYPE_POST_INSTALL_TARGET_HOOKS += FREETYPE_FREETYPE_CONFIG_TARGET_REMOVE
 endif
 
-$(eval $(call AUTOTARGETS,package,freetype))
-$(eval $(call AUTOTARGETS,package,freetype,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/fuse/libfuse.mk b/package/fuse/libfuse.mk
index 13a5194..6c71682 100644
--- a/package/fuse/libfuse.mk
+++ b/package/fuse/libfuse.mk
@@ -27,4 +27,4 @@ define LIBFUSE_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/lib/libfuse.so*
 endef
 
-$(eval $(call AUTOTARGETS,package,libfuse))
+$(eval $(call AUTOTARGETS))
diff --git a/package/games/gnuchess/gnuchess.mk b/package/games/gnuchess/gnuchess.mk
index 8e331a4..a627844 100644
--- a/package/games/gnuchess/gnuchess.mk
+++ b/package/games/gnuchess/gnuchess.mk
@@ -9,5 +9,5 @@ GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 
 GNUCHESS_DEPENDENCIES = $(if $(BR2_PACKAGE_READLINE),readline)
 
-$(eval $(call AUTOTARGETS,package/games,gnuchess))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/games/prboom/prboom.mk b/package/games/prboom/prboom.mk
index 3a50fd5..359f668 100644
--- a/package/games/prboom/prboom.mk
+++ b/package/games/prboom/prboom.mk
@@ -41,4 +41,4 @@ define PRBOOM_UINSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/games/prboom
 endef
 
-$(eval $(call AUTOTARGETS,package/games,prboom))
+$(eval $(call AUTOTARGETS))
diff --git a/package/games/rubix/rubix.mk b/package/games/rubix/rubix.mk
index 3440c23..2fb051a 100644
--- a/package/games/rubix/rubix.mk
+++ b/package/games/rubix/rubix.mk
@@ -14,5 +14,5 @@ RUBIX_MAKE_OPT = CC="$(TARGET_CC)" XINC="-I$(STAGING_DIR)/usr/include/X11" XLIB=
 
 RUBIX_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package/games,rubix))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index d691f60..e990a91 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -22,5 +22,5 @@ endif
 
 GAMIN_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS,package,gamin))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 8a544d8..445414b 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -22,5 +22,5 @@ define GAWK_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/awk
 endef
 
-$(eval $(call AUTOTARGETS,package,gawk))
-$(eval $(call AUTOTARGETS,package,gawk,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cf915bb..65b3dbd 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -50,7 +50,7 @@ endef
 
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_POST_INSTALL_TWEAKS
 
-$(eval $(call AUTOTARGETS,package,gdk-pixbuf))
+$(eval $(call AUTOTARGETS))
 
 HOST_GDK_PIXBUF_CONF_OPT = \
 	--without-libjpeg \
@@ -58,4 +58,4 @@ HOST_GDK_PIXBUF_CONF_OPT = \
 
 HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng
 
-$(eval $(call AUTOTARGETS,package,gdk-pixbuf,host))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/genext2fs/genext2fs.mk b/package/genext2fs/genext2fs.mk
index b4a8e70..1863cf1 100644
--- a/package/genext2fs/genext2fs.mk
+++ b/package/genext2fs/genext2fs.mk
@@ -8,5 +8,5 @@ GENEXT2FS_VERSION=1.4.1
 GENEXT2FS_SOURCE=genext2fs-$(GENEXT2FS_VERSION).tar.gz
 GENEXT2FS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/genext2fs
 
-$(eval $(call AUTOTARGETS,package,genext2fs))
-$(eval $(call AUTOTARGETS,package,genext2fs,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index cdddca1..5042824 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -9,5 +9,5 @@ GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,gmp))
-$(eval $(call AUTOTARGETS,package,gmp,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 62c6427..d6b6e93 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -20,4 +20,4 @@ else
 GMPC_CONF_OPT += --disable-sm
 endif
 
-$(eval $(call AUTOTARGETS,package,gmpc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index db5d583..b8523d0 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -11,4 +11,4 @@ GNUTLS_DEPENDENCIES = libgcrypt
 GNUTLS_CONF_OPT += --without-libgcrypt-prefix
 GNUTLS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,gnutls))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gob2/gob2.mk b/package/gob2/gob2.mk
index 04b3798..39aa554 100644
--- a/package/gob2/gob2.mk
+++ b/package/gob2/gob2.mk
@@ -12,8 +12,8 @@ GOB2_DEPENDENCIES = libglib2 flex bison host-pkg-config host-flex
 
 HOST_GOB2_DEPENDENCIES = host-libglib2
 
-$(eval $(call AUTOTARGETS,package,gob2))
-$(eval $(call AUTOTARGETS,package,gob2,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # gob2 for the host
 GOB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/gob2
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 3593637..faea978 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -7,5 +7,5 @@
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 
-$(eval $(call AUTOTARGETS,package,gperf))
-$(eval $(call AUTOTARGETS,package,gperf,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index b47e4d0..10e66ba 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -182,4 +182,4 @@ define GPSD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-$(eval $(call AUTOTARGETS,package,gpsd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gqview/gqview.mk b/package/gqview/gqview.mk
index 1bd76e2..25d9739 100644
--- a/package/gqview/gqview.mk
+++ b/package/gqview/gqview.mk
@@ -12,5 +12,5 @@ GQVIEW_INSTALL_TARGET = YES
 
 GQVIEW_DEPENDENCIES = host-pkg-config libgtk2
 
-$(eval $(call AUTOTARGETS,package,gqview))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index bfc9116..e8b9cfe 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -15,4 +15,4 @@ GREP_CONF_ENV += LIBS=-liconv
 GREP_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS,package,grep))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
index aa9e4c3..b8694ad 100644
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -83,4 +83,4 @@ GTK2_ENGINES_CONF_OPT = \
 		--disable-paranoia \
 		--disable-deprecated
 
-$(eval $(call AUTOTARGETS,package,gtk2-engines))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gtk2-themes/gtk2_themes.mk b/package/gtk2-themes/gtk2_themes.mk
index 8dc8af4..15fc8e2 100644
--- a/package/gtk2-themes/gtk2_themes.mk
+++ b/package/gtk2-themes/gtk2_themes.mk
@@ -15,4 +15,4 @@ GTK2_THEME_HICOLOR_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NA
 
 GTK2_THEME_HICOLOR_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS,package,gtk2_theme_hicolor))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 8d314ee..cf13594 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -9,5 +9,5 @@ GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gt
 GTKPERF_INSTALL_TARGET = YES
 GTKPERF_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS,package,gtkperf))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 37b4acc..b33b7e5 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -78,4 +78,4 @@ GVFS_POST_INSTALL_TARGET_HOOKS += \
 	GVFS_REMOVE_TARGET_SCHEMAS	\
 	GVFS_COMPILE_SCHEMAS
 
-$(eval $(call AUTOTARGETS,package,gvfs))
+$(eval $(call AUTOTARGETS))
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 672172d..f712f98 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -7,4 +7,4 @@ GZIP_VERSION:=1.4
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
 GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
 
-$(eval $(call AUTOTARGETS,package,gzip))
+$(eval $(call AUTOTARGETS))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index 605cbfc..c8a88ad 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -19,4 +19,4 @@ endef
 
 HASERL_POST_INSTALL_TARGET_HOOKS += HASERL_REMOVE_EXAMPLES
 
-$(eval $(call AUTOTARGETS,package,haserl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index d733999..6ffca0a 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -108,4 +108,4 @@ define HOSTAPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/hostapd
 endef
 
-$(eval $(call AUTOTARGETS,package,hostapd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 3f27b3e..5a8eb0d 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -10,4 +10,4 @@ HTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/htop/$(HTOP_VERS
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS,package,htop))
+$(eval $(call AUTOTARGETS))
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index c1d4d00..bf0663c 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -24,5 +24,5 @@ endef
 
 ICU_POST_INSTALL_TARGET_HOOKS += ICU_PREFIX_FIXUP
 
-$(eval $(call AUTOTARGETS,package,icu))
-$(eval $(call AUTOTARGETS,package,icu,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 5e66cea..33c4367 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -32,4 +32,4 @@ endef
 
 IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
 
-$(eval $(call AUTOTARGETS,package,ifplugd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7955db7..0bb76f3 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -90,4 +90,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 IMAGEMAGICK_POST_INSTALL_TARGET_HOOKS += IMAGEMAGICK_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS,package,imagemagick))
+$(eval $(call AUTOTARGETS))
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index d6378bb..ad47909 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -5,4 +5,4 @@
 #############################################################
 INOTIFY_TOOLS_VERSION = 3.14
 INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
-$(eval $(call AUTOTARGETS,package,inotify-tools))
+$(eval $(call AUTOTARGETS))
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 746ebb1..1ee0497 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -11,6 +11,6 @@ HOST_INTLTOOL_DEPENDENCIES = host-libxml-parser-perl
 HOST_INTLTOOL_CONF_OPT = \
   PERLLIB=$(HOST_DIR)/usr/lib/perl
 
-$(eval $(call AUTOTARGETS,package,intltool))
-$(eval $(call AUTOTARGETS,package,intltool,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 769923f..b774cc3 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -21,4 +21,4 @@ IPERF_CONF_OPT = \
 	--disable-dependency-tracking \
 	--disable-web100
 
-$(eval $(call AUTOTARGETS,package,iperf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ipkg/ipkg.mk b/package/ipkg/ipkg.mk
index 30a27c0..64dd0d5 100644
--- a/package/ipkg/ipkg.mk
+++ b/package/ipkg/ipkg.mk
@@ -11,4 +11,4 @@ IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package,ipkg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 0861a05..a3e8d66 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -66,4 +66,4 @@ ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
 IPSEC_TOOLS_CONF_OPT+= --enable-security-context=kernel
 endif
 
-$(eval $(call AUTOTARGETS,package,ipsec-tools))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index 9d901fc..274593c 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -10,4 +10,4 @@ IPSET_SITE = http://ipset.netfilter.org
 IPSET_AUTORECONF = YES
 IPSET_DEPENDENCIES = libmnl host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,ipset))
+$(eval $(call AUTOTARGETS))
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 1ee8828..a968b27 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -44,4 +44,4 @@ define IPTABLES_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
 endef
 
-$(eval $(call AUTOTARGETS,package,iptables))
+$(eval $(call AUTOTARGETS))
diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index 5832c70..872c06a 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -83,4 +83,4 @@ endif
 
 
 
-$(eval $(call AUTOTARGETS,package/java,classpath))
+$(eval $(call AUTOTARGETS))
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index da999ce..4b2e32c 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -90,4 +90,4 @@ ifeq ($(BR2_avr32),y)
 		CC="$(STAGING_DIR)/usr/bin/avr32-linux-gcc"
 endif
 
-$(eval $(call AUTOTARGETS,package/java,jamvm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 30a6225..b8464e7 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -16,4 +16,4 @@ endef
 
 JPEG_POST_INSTALL_TARGET_HOOKS += JPEG_REMOVE_USELESS_TOOLS
 
-$(eval $(call AUTOTARGETS,package,jpeg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index ec67c5f..af30e8e 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,4 +4,4 @@ KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-$(eval $(call AUTOTARGETS,package,kbd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 43a0614..ed01494 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -20,4 +20,4 @@ endef
 
 KEXEC_POST_INSTALL_TARGET_HOOKS += KEXEC_REMOVE_LIB_TOOLS
 
-$(eval $(call AUTOTARGETS,package,kexec))
+$(eval $(call AUTOTARGETS))
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index b143ef3..4c7d6e2 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -63,4 +63,4 @@ define KISMET_UNINSTALL_TARGET_CMDS
 	$(KISMET_UNINSTALL_TARGET_CONFIGS)
 endef
 
-$(eval $(call AUTOTARGETS,package,kismet))
+$(eval $(call AUTOTARGETS))
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 9964409..f0bddd6 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -12,5 +12,5 @@ LEAFPAD_INSTALL_TARGET = YES
 
 LEAFPAD_DEPENDENCIES = libgtk2
 
-$(eval $(call AUTOTARGETS,package,leafpad))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/less/less.mk b/package/less/less.mk
index 2379c8f..d20c232 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -16,4 +16,4 @@ define LESS_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/less
 endef
 
-$(eval $(call AUTOTARGETS,package,less))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d539047..53b3676 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -24,4 +24,4 @@ else
 LIBARCHIVE_CONF_OPT += --without-xml2
 endif
 
-$(eval $(call AUTOTARGETS,package,libarchive))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 5f388f9..14f47d7 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -15,4 +15,4 @@ LIBARGTABLE2_CONF_OPT= --program-prefix="" \
 		--enable-lib \
 		--enable-util
 
-$(eval $(call AUTOTARGETS,package,libargtable2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index ec66c2f..a37095d 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -10,4 +10,4 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/2.3/
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,libart))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index f26a5fa..e0b19f4 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -9,4 +9,4 @@ LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
 LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,libatomic_ops))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index 8e8bbeb..5867ff9 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -8,4 +8,4 @@ LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 LIBCGI_INSTALL_STAGING=YES
 
-$(eval $(call AUTOTARGETS,package,libcgi))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index dbc9073..0ea63b5 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -13,4 +13,4 @@ LIBCGICC_CONF_OPT = \
 	--disable-demos \
 	--disable-doc
 
-$(eval $(call AUTOTARGETS,package,libcgicc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 6e232a4..28b3d5f 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -14,4 +14,4 @@ ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPT:=--disable-cxx
 endif
 
-$(eval $(call AUTOTARGETS,package,libconfig))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 03aa0bc..0e7e3c5 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -12,4 +12,4 @@ LIBCONFUSE_INSTALL_TARGET:=YES
 
 LIBCONFUSE_CONF_OPT:=--disable-rpath
 
-$(eval $(call AUTOTARGETS,package,libconfuse))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index ca293fb..9679056 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -29,7 +29,7 @@ endef
 
 LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
-$(eval $(call AUTOTARGETS,package,libcurl))
+$(eval $(call AUTOTARGETS))
 
 curl: libcurl
 curl-clean: libcurl-clean
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
index 6972a71..2bfd38b 100644
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -14,4 +14,4 @@ LIBDAEMON_CONF_OPT = --disable-lynx
 
 LIBDAEMON_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,libdaemon))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index ae4c9ff..3786bb8 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -37,4 +37,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBDNET_POST_INSTALL_TARGET_HOOKS += LIBDNET_REMOVE_CONFIG_SCRIPT
 endif
 
-$(eval $(call AUTOTARGETS,package,libdnet))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index f1d7c31..e88a163 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -28,4 +28,4 @@ ifneq ($(BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI),y)
 LIBDRM_CONF_OPT += --disable-radeon
 endif
 
-$(eval $(call AUTOTARGETS,package,libdrm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 415745b..6268896 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -25,4 +25,4 @@ endif
 
 LIBEXOSIP2_POST_PATCH_HOOKS += LIBEXOSIP2_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS,package,libeXosip2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 853b7da..13ad371 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -18,4 +18,4 @@ LIBELF_CONF_OPT = --disable-sanity-checks \
 		$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
 		$(if $(BR2_LARGEFILE),--enable-elf64)
 
-$(eval $(call AUTOTARGETS,package,libelf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index ba9769f..597ce56 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -21,4 +21,4 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-$(eval $(call AUTOTARGETS,package,libevent))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 17c44af..1832a7e 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -11,4 +11,4 @@ LIBEXIF_INSTALL_STAGING = YES
 LIBEXIF_CONF_OPT = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package,libexif))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 0c5184d..660a034 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -29,5 +29,5 @@ endef
 
 LIBFFI_POST_INSTALL_TARGET_HOOKS += LIBFFI_MOVE_TARGET_HEADERS
 
-$(eval $(call AUTOTARGETS,package,libffi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
index 006e0d8..cc3c2ff 100644
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -19,4 +19,4 @@ endif
 
 LIBGAIL_DEPENDENCIES = host-pkg-config libgtk2 pango
 
-$(eval $(call AUTOTARGETS,package,libgail))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 8b08c3e..68c6c47 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -17,4 +17,4 @@ LIBGCRYPT_CONF_OPT = \
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
-$(eval $(call AUTOTARGETS,package,libgcrypt))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libglade/libglade.mk b/package/libglade/libglade.mk
index df62039..1bb9d14 100644
--- a/package/libglade/libglade.mk
+++ b/package/libglade/libglade.mk
@@ -16,4 +16,4 @@ endef
 
 LIBGLADE_POST_INSTALL_TARGET_HOOKS += LIBGLADE_INSTALL_FIX
 
-$(eval $(call AUTOTARGETS,package,libglade))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cf2665e..55f2123 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -81,7 +81,7 @@ ifneq ($(BR2_PACKAGE_GDB),y)
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_GDB_FILES
 endif
 
-$(eval $(call AUTOTARGETS,package,libglib2))
-$(eval $(call AUTOTARGETS,package,libglib2,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 LIBGLIB2_HOST_BINARY:=$(HOST_DIR)/usr/bin/glib-genmarshal
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index ab62d73..45a348e 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -9,4 +9,4 @@ LIBGPG_ERROR_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
 
 LIBGPG_ERROR_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,libgpg-error))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index be4531e..f1a5cc6 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -152,5 +152,5 @@ define HOST_LIBGTK2_INSTALL_CMDS
  cp $(@D)/gtk/gtk-update-icon-cache $(HOST_DIR)/usr/bin
 endef
 
-$(eval $(call AUTOTARGETS,package,libgtk2))
-$(eval $(call AUTOTARGETS,package,libgtk2,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
index ec6e5bb..7730af8 100644
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -14,4 +14,4 @@ LIBHID_INSTALL_STAGING = YES
 LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(TARGET_PATH)
 LIBHID_CONF_OPT = --disable-swig --without-doxygen --disable-package-config
 
-$(eval $(call AUTOTARGETS,package,libhid))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 27977a8..9d02a4a 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -22,7 +22,7 @@ endef
 LIBICONV_POST_INSTALL_TARGET_HOOKS += LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
 LIBICONV_POST_INSTALL_STAGING_HOOKS += LIBICONV_STAGING_REMOVE_PRELOADABLE_LIBS
 
-$(eval $(call AUTOTARGETS,package,libiconv))
+$(eval $(call AUTOTARGETS))
 
 # Configurations where the toolchain supports locales and the libiconv
 # package is enabled are incorrect, because the toolchain already
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 7b6abbb..4708862 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -30,4 +30,4 @@ define LIBIDN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/idn
 endef
 
-$(eval $(call AUTOTARGETS,package,libidn))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index e3c4bb1..81e8421 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -10,5 +10,5 @@ LIBIQRF_INSTALL_STAGING = YES
 
 LIBIQRF_DEPENDENCIES = libusb
 
-$(eval $(call AUTOTARGETS,package,libiqrf))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 2b63565..7c8cd8a 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -29,4 +29,4 @@ define LIBLOCKFILE_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS,package,liblockfile))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 7a1925e..ff2b55d 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -16,4 +16,4 @@ else
 LIBMICROHTTPD_CONF_OPT += --disable-https
 endif
 
-$(eval $(call AUTOTARGETS,package,libmicrohttpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 6749756..6871034 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -9,4 +9,4 @@ LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,libmnl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 6edb1f8..dd0d7fb 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -16,4 +16,4 @@ define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/libnl
 endef
 
-$(eval $(call AUTOTARGETS,package,libnl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 9ba7431..24b5370 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -14,4 +14,4 @@ LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 # NSPR mixes up --build and --host
 LIBNSPR_CONF_OPT = --host=$(GNU_HOST_NAME)
 
-$(eval $(call AUTOTARGETS,package,libnspr))
+$(eval $(call AUTOTARGETS))
diff --git a/package/liboil/liboil.mk b/package/liboil/liboil.mk
index 4350c0f..16f6d13 100644
--- a/package/liboil/liboil.mk
+++ b/package/liboil/liboil.mk
@@ -38,4 +38,4 @@ endef
 
 LIBOIL_POST_INSTALL_TARGET_HOOKS += LIBOIL_TARGET_CLEANUP
 
-$(eval $(call AUTOTARGETS,package,liboil))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index aa15332..d4201c7 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -23,4 +23,4 @@ endif
 
 LIBOSIP2_POST_PATCH_HOOKS += LIBOSIP2_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS,package,libosip2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a2d0376..6b44e49 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -18,4 +18,4 @@ LIBPCAP_CONF_ENV:=ac_cv_linux_vers=2 \
 		  ac_cv_header_linux_wireless_h=yes # configure misdetects this
 LIBPCAP_CONF_OPT:=--disable-yydebug --with-pcap=linux
 
-$(eval $(call AUTOTARGETS,package,libpcap))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c4c37d8..d2aa329 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -31,5 +31,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBPNG_POST_INSTALL_TARGET_HOOKS += LIBPNG_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS,package,libpng))
-$(eval $(call AUTOTARGETS,package,libpng,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 7d03f40..2430c9d 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -13,4 +13,4 @@ LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
 			--disable-demosaic-pack-gpl3
 
-$(eval $(call AUTOTARGETS,package,libraw))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index 196c721..b7c844c 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -8,4 +8,4 @@ LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
 LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
 LIBRAW1394_INSTALL_STAGING=YES
 
-$(eval $(call AUTOTARGETS,package,libraw1394))
+$(eval $(call AUTOTARGETS))
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index daa34ab..de73f6e 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -14,4 +14,4 @@ LIBRSVG_INSTALL_TARGET = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 libgtk2
 
-$(eval $(call AUTOTARGETS,package,librsvg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 31b1aa0..5019af7 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -11,4 +11,4 @@ LIBRSYNC_INSTALL_TARGET = YES
 
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
-$(eval $(call AUTOTARGETS,package,librsync))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
index 2533218..aca4f7f 100644
--- a/package/libsexy/libsexy.mk
+++ b/package/libsexy/libsexy.mk
@@ -12,4 +12,4 @@ LIBSEXY_DEPENDENCIES = libgtk2 libxml2
 LIBSEXY_INSTALL_TARGET = YES
 LIBSEXY_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/libsexy,libsexy))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 0b1de14..4c443eb 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -8,4 +8,4 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,libsigc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 11bfadd..6e39495 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -24,4 +24,4 @@ LIBSOUP_CONF_OPT = \
 
 LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
 
-$(eval $(call AUTOTARGETS,package,libsoup))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libsysfs/libsysfs.mk b/package/libsysfs/libsysfs.mk
index f8233fe..39cf030 100644
--- a/package/libsysfs/libsysfs.mk
+++ b/package/libsysfs/libsysfs.mk
@@ -26,4 +26,4 @@ LIBSYSFS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/l
 LIBSYSFS_SOURCE:=sysfsutils-$(LIBSYSFS_VERSION).tar.gz
 LIBSYSFS_INSTALL_STAGING=YES
 
-$(eval $(call AUTOTARGETS,package,libsysfs))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 3306244..cee38e5 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -9,8 +9,8 @@ LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
 HOST_LIBTOOL_LIBTOOL_PATCH = NO
 
-$(eval $(call AUTOTARGETS,package,libtool))
-$(eval $(call AUTOTARGETS,package,libtool,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # variables used by other packages
 LIBTOOL:=$(HOST_DIR)/usr/bin/libtool
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
index d8dc814..100c5b9 100644
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -23,4 +23,4 @@ endef
 
 LIBUNGIF_POST_INSTALL_TARGET_HOOKS += LIBUNGIF_BINS_CLEANUP
 
-$(eval $(call AUTOTARGETS,package,libungif))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 1bd0356..d5b4ee1 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -11,4 +11,4 @@ LIBUPNP_CONF_ENV = ac_cv_lib_compat_ftime=no
 
 LIBUPNP_INSTALL_STAGING:=YES
 
-$(eval $(call AUTOTARGETS,package,libupnp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 1668614..e39cdd8 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -18,4 +18,4 @@ endef
 
 LIBUSB_COMPAT_POST_INSTALL_STAGING_HOOKS+=LIBUSB_COMPAT_FIXUP_CONFIG
 
-$(eval $(call AUTOTARGETS,package,libusb-compat))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 050e2ba..af75f5f 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -10,4 +10,4 @@ LIBUSB_DEPENDENCIES = host-pkg-config
 LIBUSB_INSTALL_STAGING = YES
 LIBUSB_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package,libusb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 8f2878d..0687137 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -33,8 +33,8 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS,package,libxml2))
-$(eval $(call AUTOTARGETS,package,libxml2,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # libxml2 for the host
 LIBXML2_HOST_BINARY:=$(HOST_DIR)/usr/bin/xmllint
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 07f6697..fec85f0 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -40,5 +40,5 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 LIBXSLT_POST_INSTALL_TARGET_HOOKS += LIBXSLT_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS,package,libxslt))
-$(eval $(call AUTOTARGETS,package,libxslt,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 45941eb..f1b7ec3 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -56,4 +56,4 @@ define LIGHTTPD_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/lib/lighttpd
 endef
 
-$(eval $(call AUTOTARGETS,package,lighttpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/links/links.mk b/package/links/links.mk
index b8520d4..44bf9ec 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -32,4 +32,4 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 LINKS_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS,package,links))
+$(eval $(call AUTOTARGETS))
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 678be86..9b840e2 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -22,4 +22,4 @@ endef
 
 LITE_POST_INSTALL_TARGET_HOOKS += LITE_FINALIZE_INSTALL
 
-$(eval $(call AUTOTARGETS,package,lite))
+$(eval $(call AUTOTARGETS))
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index e9b975f..0d3347f 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -47,4 +47,4 @@ define LRZSZ_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS,package,lrzsz))
+$(eval $(call AUTOTARGETS))
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 2a867b7..3cdd846 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -8,4 +8,4 @@ LSUIO_VERSION = 0.2.0
 LSUIO_SOURCE = lsuio-$(LSUIO_VERSION).tar.gz
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
 
-$(eval $(call AUTOTARGETS,package,lsuio))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 1a55c41..f0a57ae 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -7,4 +7,4 @@ LTP_TESTSUITE_VERSION = 20101031
 LTP_TESTSUITE_SOURCE  = ltp-full-$(LTP_TESTSUITE_VERSION).bz2
 LTP_TESTSUITE_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 
-$(eval $(call AUTOTARGETS,package,ltp-testsuite))
+$(eval $(call AUTOTARGETS))
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2e9f2d8..40e0152 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -51,4 +51,4 @@ define LVM2_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
 endef
 
-$(eval $(call AUTOTARGETS,package,lvm2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
index 9bdcc35..4614116 100644
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -10,7 +10,7 @@ LZMA_INSTALL_STAGING = YES
 LZMA_INSTALL_TARGET = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
-$(eval $(call AUTOTARGETS,package,lzma))
-$(eval $(call AUTOTARGETS,package,lzma,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 LZMA=$(HOST_DIR)/usr/bin/lzma
diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index d4195f6..55b4327 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -7,5 +7,5 @@ LZO_VERSION = 2.05
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,lzo))
-$(eval $(call AUTOTARGETS,package,lzo,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
index 796686a..937d9eb 100644
--- a/package/lzop/lzop.mk
+++ b/package/lzop/lzop.mk
@@ -9,4 +9,4 @@ LZOP_SITE:=http://www.lzop.org/download/
 LZOP_CONF_OPT:=--program-prefix=""
 LZOP_DEPENDENCIES:=lzo
 
-$(eval $(call AUTOTARGETS,package,lzop))
+$(eval $(call AUTOTARGETS))
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index d713b6d..4f18aa4 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -15,5 +15,5 @@ endif
 
 HOST_M4_CONF_OPT = --disable-static
 
-$(eval $(call AUTOTARGETS,package,m4))
-$(eval $(call AUTOTARGETS,package,m4,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/make/make.mk b/package/make/make.mk
index 12d236a..2886032 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -13,4 +13,4 @@ MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
 		GLOBLIB=glob/libglob.a
 
-$(eval $(call AUTOTARGETS,package,make))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index d35d11b..0468d99 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -15,4 +15,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-common))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
index d5f61c1..611323d 100644
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-desktop))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
index dc448b8..4246626 100644
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -20,4 +20,4 @@ MATCHBOX_FAKEKEY_POST_CONFIGURE_HOOKS += MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-fakekey))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
index 3d7178d..558a4f7 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -28,4 +28,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-keyboard))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
index 817a8da..b0be393 100644
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -55,4 +55,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-lib))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index 573e323..fe43cb9 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -21,4 +21,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-panel))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
index 954709a..2540e4b 100644
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -12,4 +12,4 @@ MATCHBOX_STARTUP_MONITOR_CONF_OPT =
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-startup-monitor))
+$(eval $(call AUTOTARGETS))
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 0334d0f..4b32073 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -39,4 +39,4 @@ endif
 
 #############################################################
 
-$(eval $(call AUTOTARGETS,package/matchbox,matchbox-wm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index fbd5f16..087a2d2 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -25,4 +25,4 @@ define MDADM_CONFIGURE_CMDS
 	# Do nothing
 endef
 
-$(eval $(call AUTOTARGETS,package,mdadm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 04cfa10..5f5fcfa 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -25,4 +25,4 @@ endef
 
 METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
 
-$(eval $(call AUTOTARGETS,package,metacity))
+$(eval $(call AUTOTARGETS))
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 27d0159..d7e7c24 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -18,6 +18,6 @@ MODULE_INIT_TOOLS_AUTORECONF=YES
 HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
 HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 
-$(eval $(call AUTOTARGETS,package,module-init-tools))
-$(eval $(call AUTOTARGETS,package,module-init-tools,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index b344f28..608c9f4 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -12,5 +12,5 @@ MPC_AUTORECONF = YES
 HOST_MPC_AUTORECONF = YES
 HOST_MPC_DEPENDENCIES = host-gmp host-mpfr
 
-$(eval $(call AUTOTARGETS,package,mpc))
-$(eval $(call AUTOTARGETS,package,mpc,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 0aeecbe..7f33599 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -12,5 +12,5 @@ MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 HOST_MPFR_DEPENDENCIES = host-gmp
 
-$(eval $(call AUTOTARGETS,package,mpfr))
-$(eval $(call AUTOTARGETS,package,mpfr,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 9374037..62a3b1d 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -78,4 +78,4 @@ define ALSA_LIB_UNINSTALL_STAGING_CMDS
 	-rm -rf $(STAGING_DIR)/usr/share/alsa
 endef
 
-$(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index f395420..59579c2 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -57,4 +57,4 @@ define ALSA_UTILS_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/,$(ALSA_UTILS_TARGETS_) $(ALSA_UTILS_TARGETS_y))
 endef
 
-$(eval $(call AUTOTARGETS,package/multimedia,alsa-utils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index 65d9d39..b6fbdd2 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -18,4 +18,4 @@ AUMIX_CONF_OPT = \
 
 AUMIX_DEPENDENCIES = ncurses
 
-$(eval $(call AUTOTARGETS,package/multimedia,aumix))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index 04aee18..366515c 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -8,4 +8,4 @@ FAAD2_VERSION = 2.7
 FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
 FAAD2_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,faad2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index b50503b..ca41892 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -172,4 +172,4 @@ define FFMPEG_CONFIGURE_CMDS
 	)
 endef
 
-$(eval $(call AUTOTARGETS,package/multimedia,ffmpeg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/flac/flac.mk b/package/multimedia/flac/flac.mk
index 4c278b4..79ecfd1 100644
--- a/package/multimedia/flac/flac.mk
+++ b/package/multimedia/flac/flac.mk
@@ -20,4 +20,4 @@ else
 FLAC_CONF_OPT += --disable-ogg
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,flac))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
index ebe87dc..41a7f3b 100644
--- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -15,4 +15,4 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 GST_FFMPEG_DEPENDENCIES += bzip2
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,gst-ffmpeg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 5012be2..11a4014 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -442,4 +442,4 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-bad))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 79ced30..0c1af86 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -170,4 +170,4 @@ else
 GST_PLUGINS_BASE_CONF_OPT += --disable-vorbis
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-base))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index ff7b4c0..21988be 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -353,4 +353,4 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index ab557a3..71e269b 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -74,4 +74,4 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-ugly))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
index db5ccaf..2b39ef0 100644
--- a/package/multimedia/gstreamer/gstreamer.mk
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -23,4 +23,4 @@ GSTREAMER_CONF_OPT = \
 
 GSTREAMER_DEPENDENCIES = libglib2 host-pkg-config
 
-$(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index 281c1e8..7609f2d 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -27,4 +27,4 @@ endif
 
 LAME_POST_CONFIGURE_HOOKS += LAME_BIGENDIAN_ARCH
 
-$(eval $(call AUTOTARGETS,package/multimedia,lame))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libao/libao.mk b/package/multimedia/libao/libao.mk
index ee02d18..201d33f 100644
--- a/package/multimedia/libao/libao.mk
+++ b/package/multimedia/libao/libao.mk
@@ -18,4 +18,4 @@ else
 LIBAO_CONF_OPT += --disable-alsa
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,libao))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libcdaudio/libcdaudio.mk b/package/multimedia/libcdaudio/libcdaudio.mk
index 2f37cc2..d240c07 100644
--- a/package/multimedia/libcdaudio/libcdaudio.mk
+++ b/package/multimedia/libcdaudio/libcdaudio.mk
@@ -12,4 +12,4 @@ LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,libcdaudio))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libcue/libcue.mk b/package/multimedia/libcue/libcue.mk
index 2de0423..b815c0f 100644
--- a/package/multimedia/libcue/libcue.mk
+++ b/package/multimedia/libcue/libcue.mk
@@ -10,4 +10,4 @@ LIBCUE_SOURCE = libcue-$(LIBCUE_VERSION).tar.bz2
 LIBCUE_DEPENDENCIES = flex
 LIBCUE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,libcue))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/multimedia/libdvdnav/libdvdnav.mk
index b3fea2f..4e9a92b 100644
--- a/package/multimedia/libdvdnav/libdvdnav.mk
+++ b/package/multimedia/libdvdnav/libdvdnav.mk
@@ -17,4 +17,4 @@ LIBDVDNAV_DEPENDENCIES = libdvdread
 # of cross compilation, we prefer using pkg-config.
 LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
-$(eval $(call AUTOTARGETS,package/multimedia,libdvdnav))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/multimedia/libdvdread/libdvdread.mk
index 98b2ef5..3f456ef 100644
--- a/package/multimedia/libdvdread/libdvdread.mk
+++ b/package/multimedia/libdvdread/libdvdread.mk
@@ -12,4 +12,4 @@ LIBDVDREAD_LIBTOOL_PATCH = YES
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,libdvdread))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libid3tag/libid3tag.mk b/package/multimedia/libid3tag/libid3tag.mk
index bcb110f..def2dbc 100644
--- a/package/multimedia/libid3tag/libid3tag.mk
+++ b/package/multimedia/libid3tag/libid3tag.mk
@@ -11,4 +11,4 @@ LIBID3TAG_INSTALL_STAGING=YES
 LIBID3TAG_DEPENDENCIES=zlib
 LIBID3TAG_LIBTOOL_PATCH=NO
 
-$(eval $(call AUTOTARGETS,package/multimedia,libid3tag))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libmad/libmad.mk b/package/multimedia/libmad/libmad.mk
index d129aad..a469fec 100644
--- a/package/multimedia/libmad/libmad.mk
+++ b/package/multimedia/libmad/libmad.mk
@@ -32,4 +32,4 @@ LIBMAD_CONF_OPT = \
 		--disable-debugging \
 		--enable-speed
 
-$(eval $(call AUTOTARGETS,package/multimedia,libmad))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libmms/libmms.mk b/package/multimedia/libmms/libmms.mk
index d11f0be..50ece53 100644
--- a/package/multimedia/libmms/libmms.mk
+++ b/package/multimedia/libmms/libmms.mk
@@ -13,4 +13,4 @@ LIBMMS_INSTALL_TARGET = YES
 
 LIBMMS_DEPENDENCIES = host-pkg-config libglib2
 
-$(eval $(call AUTOTARGETS,package/multimedia,libmms))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libmpd/libmpd.mk b/package/multimedia/libmpd/libmpd.mk
index 47a802a..a58b537 100644
--- a/package/multimedia/libmpd/libmpd.mk
+++ b/package/multimedia/libmpd/libmpd.mk
@@ -9,4 +9,4 @@ LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 
-$(eval $(call AUTOTARGETS,package/multimedia,libmpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libmpeg2/libmpeg2.mk b/package/multimedia/libmpeg2/libmpeg2.mk
index 8bcc999..8713c87 100644
--- a/package/multimedia/libmpeg2/libmpeg2.mk
+++ b/package/multimedia/libmpeg2/libmpeg2.mk
@@ -26,4 +26,4 @@ endef
 LIBMPEG2_POST_INSTALL_TARGET_HOOKS += LIBMPEG2_REMOVE_BINS
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,libmpeg2))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libogg/libogg.mk b/package/multimedia/libogg/libogg.mk
index 0fd6b27..86d5b01 100644
--- a/package/multimedia/libogg/libogg.mk
+++ b/package/multimedia/libogg/libogg.mk
@@ -12,4 +12,4 @@ LIBOGG_INSTALL_TARGET = YES
 
 LIBOGG_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package/multimedia,libogg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libreplaygain/libreplaygain.mk b/package/multimedia/libreplaygain/libreplaygain.mk
index c941092..29e9c72 100644
--- a/package/multimedia/libreplaygain/libreplaygain.mk
+++ b/package/multimedia/libreplaygain/libreplaygain.mk
@@ -11,4 +11,4 @@ LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
 LIBREPLAYGAIN_AUTORECONF = YES
 LIBREPLAYGAIN_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,libreplaygain))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libsamplerate/libsamplerate.mk b/package/multimedia/libsamplerate/libsamplerate.mk
index 94b07a4..54f5db4 100644
--- a/package/multimedia/libsamplerate/libsamplerate.mk
+++ b/package/multimedia/libsamplerate/libsamplerate.mk
@@ -14,4 +14,4 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LIBSAMPLERATE_DEPENDENCIES += libsndfile
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,libsamplerate))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libsndfile/libsndfile.mk b/package/multimedia/libsndfile/libsndfile.mk
index d554699..ddc49ca 100644
--- a/package/multimedia/libsndfile/libsndfile.mk
+++ b/package/multimedia/libsndfile/libsndfile.mk
@@ -8,4 +8,4 @@ LIBSNDFILE_VERSION = 1.0.23
 LIBSNDFILE_SITE = http://www.mega-nerd.com/libsndfile/files
 LIBSNDFILE_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,libsndfile))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libtheora/libtheora.mk b/package/multimedia/libtheora/libtheora.mk
index e572d1a..89489b7 100644
--- a/package/multimedia/libtheora/libtheora.mk
+++ b/package/multimedia/libtheora/libtheora.mk
@@ -17,4 +17,4 @@ LIBTHEORA_CONF_OPT = \
 
 LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkg-config
 
-$(eval $(call AUTOTARGETS,package/multimedia,libtheora))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index 0570ea6..dfe7bce 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -15,4 +15,4 @@ LIBVORBIS_CONF_OPT = --disable-oggtest
 
 LIBVORBIS_DEPENDENCIES = host-pkg-config libogg
 
-$(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/madplay/madplay.mk b/package/multimedia/madplay/madplay.mk
index a2ac14d..9fad45f 100644
--- a/package/multimedia/madplay/madplay.mk
+++ b/package/multimedia/madplay/madplay.mk
@@ -16,4 +16,4 @@ MADPLAY_CONF_OPT+=--with-alsa
 MADPLAY_DEPENDENCIES+=alsa-lib
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,madplay))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index d418f61..80199e4 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -126,4 +126,4 @@ endef
 
 MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
 
-$(eval $(call AUTOTARGETS,package/multimedia,mpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/mpg123/mpg123.mk b/package/multimedia/mpg123/mpg123.mk
index 8eeb56d..8e6627a 100644
--- a/package/multimedia/mpg123/mpg123.mk
+++ b/package/multimedia/mpg123/mpg123.mk
@@ -41,4 +41,4 @@ MPG123_CONF_OPT += --with-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,mpg123))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index 34581b6..413894d 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -11,4 +11,4 @@ MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_AUTORECONF = YES
 MUSEPACK_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,musepack))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/speex/speex.mk b/package/multimedia/speex/speex.mk
index 7de3b38..dfb426b 100644
--- a/package/multimedia/speex/speex.mk
+++ b/package/multimedia/speex/speex.mk
@@ -33,4 +33,4 @@ define SPEEX_BUILD_CMDS
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 endef
 
-$(eval $(call AUTOTARGETS,package/multimedia,speex))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
index 9b4b729..f88d7db 100644
--- a/package/multimedia/swfdec/swfdec.mk
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -29,7 +29,7 @@ else
 SWFDEC_CONF_OPT += --disable-gtk
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,swfdec))
+$(eval $(call AUTOTARGETS))
 
 # swfdec uses glib-* at install time
 # Notice: must come after AUTOTARGETS as that's where these variables gets set
diff --git a/package/multimedia/taglib/taglib.mk b/package/multimedia/taglib/taglib.mk
index e5433a4..ce97b8b 100644
--- a/package/multimedia/taglib/taglib.mk
+++ b/package/multimedia/taglib/taglib.mk
@@ -24,4 +24,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 TAGLIB_POST_INSTALL_TARGET_HOOKS += TAGLIB_REMOVE_DEVFILE
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,taglib))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/tremor/tremor.mk b/package/multimedia/tremor/tremor.mk
index 654a403..cf228b8 100644
--- a/package/multimedia/tremor/tremor.mk
+++ b/package/multimedia/tremor/tremor.mk
@@ -12,4 +12,4 @@ TREMOR_AUTORECONF = YES
 TREMOR_INSTALL_STAGING = YES
 TREMOR_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,tremor))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/multimedia/vorbis-tools/vorbis-tools.mk
index 6fd6c2a..fc79b3f 100644
--- a/package/multimedia/vorbis-tools/vorbis-tools.mk
+++ b/package/multimedia/vorbis-tools/vorbis-tools.mk
@@ -17,4 +17,4 @@ ifeq ($(BR2_PACKAGE_SPEEX),y)
 VORBIS_TOOLS_DEPENDENCIES += speex
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,vorbis-tools))
+$(eval $(call AUTOTARGETS))
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
index 035963a..8b0af0b 100644
--- a/package/multimedia/wavpack/wavpack.mk
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -13,4 +13,4 @@ ifneq ($(BR2_ENABLE_LOCALE),y)
 WAVPACK_DEPENDENCIES += libiconv
 endif
 
-$(eval $(call AUTOTARGETS,package/multimedia,wavpack))
+$(eval $(call AUTOTARGETS))
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index d021aef..ab8c446 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -22,4 +22,4 @@ endef
 
 MUTT_POST_PATCH_HOOKS += MUTT_APPLY_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS,package,mutt))
\ No newline at end of file
+$(eval $(call AUTOTARGETS))
\ No newline at end of file
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index e45abe9..fb73670 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -12,4 +12,4 @@ MXML_INSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) install
 MXML_UNINSTALL_STAGING_OPT = DSTROOT=$(TARGET_DIR) uninstall
 MXML_UNINSTALL_TARGET_OPT = DSTROOT=$(TARGET_DIR) uninstall
 
-$(eval $(call AUTOTARGETS,package,mxml))
+$(eval $(call AUTOTARGETS))
diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 9cd088c..ad2a354 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -43,4 +43,4 @@ endef
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_REMOVE_TEST_PROGS
 MYSQL_CLIENT_POST_INSTALL_TARGET_HOOKS += MYSQL_CLIENT_ADD_MYSQL_LIB_PATH
 
-$(eval $(call AUTOTARGETS,package,mysql_client))
+$(eval $(call AUTOTARGETS))
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 87852a1..c4162c1 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -18,4 +18,4 @@ define NANO_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/nano
 endef
 
-$(eval $(call AUTOTARGETS,package,nano))
+$(eval $(call AUTOTARGETS))
diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 03e8394..b819df0 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -14,5 +14,5 @@ NASM_VERSION=2.08.01
 NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
 NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
 
-$(eval $(call AUTOTARGETS,package,nasm))
-$(eval $(call AUTOTARGETS,package,nasm,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index a09b10b..69a55ae 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -23,4 +23,4 @@ endef
 
 NBD_POST_INSTALL_TARGET_HOOKS += NBD_CLEANUP_AFTER_INSTALL
 
-$(eval $(call AUTOTARGETS,package,nbd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index f3f4780..7fdee9a 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -41,4 +41,4 @@ define NCFTP_UNINSTALL_TARGET_CMDS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS) ncftpspooler)
 endef
 
-$(eval $(call AUTOTARGETS,package,ncftp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index ac4c12b..655e05f 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -133,5 +133,5 @@ endef
 HOST_NCURSES_CONF_OPT = \
 	--without-shared
 
-$(eval $(call AUTOTARGETS,package,ncurses))
-$(eval $(call AUTOTARGETS,package,ncurses,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 87eb982..4e17188 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -53,4 +53,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
-$(eval $(call AUTOTARGETS,package,neon))
+$(eval $(call AUTOTARGETS))
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index f8263ef..7e82482 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -12,4 +12,4 @@ NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
 NETCAT_CONF_OPT = --program-prefix=''
 
-$(eval $(call AUTOTARGETS,package,netcat))
+$(eval $(call AUTOTARGETS))
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index 6bf9b5c..a66d4ef 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -20,4 +20,4 @@ define NETPERF_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/netserver
 endef
 
-$(eval $(call AUTOTARGETS,package,netperf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 5704327..3745dcb 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -78,4 +78,4 @@ endef
 
 NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
 
-$(eval $(call AUTOTARGETS,package,netsnmp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index 412b6fe..fbe1939 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -7,4 +7,4 @@
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
 
-$(eval $(call AUTOTARGETS,package,netstat-nat))
+$(eval $(call AUTOTARGETS))
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 382676c..bbe25fe 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -29,4 +29,4 @@ endef
 
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
-$(eval $(call AUTOTARGETS,package,nfs-utils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index d2aed23..a55f7ba 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -8,4 +8,4 @@ NGIRCD_VERSION = 17.1
 NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
 NGIRCD_DEPENDENCIES = zlib
 
-$(eval $(call AUTOTARGETS,package,ngircd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 796e269..b45fbc1 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -10,4 +10,4 @@ NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPT = --disable-ldconfig --program-prefix=""
 NTFS_3G_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,ntfs-3g))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ntfsprogs/ntfsprogs.mk b/package/ntfsprogs/ntfsprogs.mk
index 4557747..6c9b272 100644
--- a/package/ntfsprogs/ntfsprogs.mk
+++ b/package/ntfsprogs/ntfsprogs.mk
@@ -23,4 +23,4 @@ define NTFSPROGS_UNINSTALL_TARGET_CMDS
 	-unlink $(TARGET_DIR)/sbin/mkfs.ntfs
 endef
 
-$(eval $(call AUTOTARGETS,package,ntfsprogs))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 72e462e..5f2f993 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -58,4 +58,4 @@ endef
 
 NTP_POST_PATCH_HOOKS += NTP_PATCH_FIXUPS
 
-$(eval $(call AUTOTARGETS,package,ntp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
index 3555ffa..3358905 100644
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -14,4 +14,4 @@ define OPENNTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/man/man?/ntpd*
 endef
 
-$(eval $(call AUTOTARGETS,package,openntpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 7a6cc90..fbeb565 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -18,4 +18,4 @@ endef
 
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS,package,openssh))
+$(eval $(call AUTOTARGETS))
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index b7587fd..587368b 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -34,4 +34,4 @@ define OPENVPN_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/init.d/openvpn
 endef
 
-$(eval $(call AUTOTARGETS,package,openvpn))
+$(eval $(call AUTOTARGETS))
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 4522cda..ae4cdde 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -38,4 +38,4 @@ define OPROFILE_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/oprofile
 endef
 
-$(eval $(call AUTOTARGETS,package,oprofile))
+$(eval $(call AUTOTARGETS))
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 37b6e99..d4ff3e2 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -21,4 +21,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 ORC_POST_INSTALL_TARGET_HOOKS += ORC_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS,package,orc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 5636b73..2691b88 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -60,4 +60,4 @@ endef
 
 PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS,package,pango))
+$(eval $(call AUTOTARGETS))
diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 5c46c77..2062b9f 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -7,4 +7,4 @@
 PATCH_VERSION = 2.6
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 
-$(eval $(call AUTOTARGETS,package,patch))
+$(eval $(call AUTOTARGETS))
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index 370cf80..72c2369 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -14,5 +14,5 @@ PCMANFM_CONF_OPT = --disable-hal
 
 PCMANFM_DEPENDENCIES = host-pkg-config libgtk2 gamin startup-notification xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package,pcmanfm))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index d2a1331..4535656 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -29,4 +29,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 PCRE_POST_INSTALL_TARGET_HOOKS += PCRE_TARGET_REMOVE_PCRE_CONFIG
 endif
 
-$(eval $(call AUTOTARGETS,package,pcre))
+$(eval $(call AUTOTARGETS))
diff --git a/package/php/php.mk b/package/php/php.mk
index ad0ae43..a1dde51 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -195,4 +195,4 @@ endef
 
 PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
 
-$(eval $(call AUTOTARGETS,package,php))
+$(eval $(call AUTOTARGETS))
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8c7a233..2b39a77 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -9,5 +9,5 @@ PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package,pixman))
-$(eval $(call AUTOTARGETS,package,pixman,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index 7189c91..f347a53 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -18,7 +18,7 @@ HOST_PKG_CONFIG_CONF_OPT = \
 
 HOST_PKG_CONFIG_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS,package,pkg-config))
-$(eval $(call AUTOTARGETS,package,pkg-config,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 4fdc01d..98f438d 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -15,4 +15,4 @@ POPT_CONF_ENV += am_cv_lib_iconv=yes
 POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
-$(eval $(call AUTOTARGETS,package,popt))
+$(eval $(call AUTOTARGETS))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 3733cd6..2523dd2 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -42,4 +42,4 @@ define PROFTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/etc/proftpd.conf
 endef
 
-$(eval $(call AUTOTARGETS,package,proftpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 3cbf941..dca5021 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -13,4 +13,4 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PSMISC_DEPENDENCIES += busybox
 endif
 
-$(eval $(call AUTOTARGETS,package,psmisc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/python/python.mk b/package/python/python.mk
index 724fd1a..37abf1a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -159,5 +159,5 @@ PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
 
 PYTHON_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS,package,python))
-$(eval $(call AUTOTARGETS,package,python,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index eb3b301..b7a23ab 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -87,4 +87,4 @@ else
 QUAGGA_CONF_OPT+=--disable-opaque-lsa
 endif
 
-$(eval $(call AUTOTARGETS,package,quagga))
+$(eval $(call AUTOTARGETS))
diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index fe8be5d..c96be30 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -15,4 +15,4 @@ endef
 
 RADVD_POST_INSTALL_TARGET_HOOKS += RADVD_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS,package,radvd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index a55d58f..732a08b 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -10,4 +10,4 @@ RDESKTOP_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 
-$(eval $(call AUTOTARGETS,package,rdesktop))
+$(eval $(call AUTOTARGETS))
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index e34c650..03a5377 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -24,4 +24,4 @@ define READLINE_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/lib/libhistory.so.$(READLINE_VERSION)
 endef
 
-$(eval $(call AUTOTARGETS,package,readline))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 9ae5616..7642c82 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,4 +9,4 @@ RNG_TOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge
 RNG_TOOLS_CONF_ENV = LIBS="-largp"
 RNG_TOOLS_DEPENDENCIES = argp-standalone
 
-$(eval $(call AUTOTARGETS,package,rng-tools))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index cac994a..30bc1a4 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -33,4 +33,4 @@ define RP_PPPOE_UNINSTALL_TARGET_CMDS
 	done
 endef
 
-$(eval $(call AUTOTARGETS,package,rp-pppoe))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 1a4c10b..3407f49 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -32,4 +32,4 @@ RPM_MAKE = $(MAKE1)
 
 RPM_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) program_transform_name= install
 
-$(eval $(call AUTOTARGETS,package,rpm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 80789c6..55aed9e 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -25,4 +25,4 @@ define RRDTOOL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/librrd*
 endef
 
-$(eval $(call AUTOTARGETS,package,rrdtool))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5030fae..0378a55 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -11,4 +11,4 @@ RSYNC_INSTALL_STAGING = NO
 RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 RSYNC_CONF_OPT = --with-included-popt
 
-$(eval $(call AUTOTARGETS,package,rsync))
+$(eval $(call AUTOTARGETS))
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index af7ac2e..6582812 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -23,4 +23,4 @@ endef
 
 RSYSLOG_POST_INSTALL_TARGET_HOOKS += RSYSLOG_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS,package,rsyslog))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 966a6a1..3495333 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -31,5 +31,5 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
 
-$(eval $(call AUTOTARGETS,package,ruby))
-$(eval $(call AUTOTARGETS,package,ruby,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index dfc7636..5a76c76 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -186,4 +186,4 @@ endef
 
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_INITSCRIPTS_CONFIG
 
-$(eval $(call AUTOTARGETS,package,samba))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sawman/sawman.mk b/package/sawman/sawman.mk
index d2d15d8..71d52ae 100644
--- a/package/sawman/sawman.mk
+++ b/package/sawman/sawman.mk
@@ -9,5 +9,5 @@ SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_DEPENDENCIES = directfb
 
-$(eval $(call AUTOTARGETS,package,sawman))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 54a9c9c..2dfb8f2 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -11,4 +11,4 @@ SCREEN_CONF_ENV = CFLAGS=-DSYSV=1
 SCREEN_MAKE_OPT = -j1
 SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
-$(eval $(call AUTOTARGETS,package,screen))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index af462c4..b5d9152 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -67,4 +67,4 @@ define SDL_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libSDL*.so* $(TARGET_DIR)/usr/lib/
 endef
 
-$(eval $(call AUTOTARGETS,package,sdl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
index c5a6d7e..b8c5d80 100644
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -23,4 +23,4 @@ else
 SDL_GFX_CONF_OPT += --disable-mmx
 endif
 
-$(eval $(call AUTOTARGETS,package,sdl_gfx))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
index ab838b1..8dec472 100644
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -34,4 +34,4 @@ SDL_IMAGE_DEPENDENCIES:=sdl \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_PNG),libpng) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff)
 
-$(eval $(call AUTOTARGETS,package,sdl_image))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 01129fa..eee3e14 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -41,4 +41,4 @@ define SDL_MIXER_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
-$(eval $(call AUTOTARGETS,package,sdl_mixer))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
index f01a04c..a2d7692 100644
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -14,6 +14,6 @@ SDL_NET_INSTALL_STAGING = YES
 
 SDL_NET_DEPENDENCIES = sdl
 
-$(eval $(call AUTOTARGETS,package,SDL_net))
+$(eval $(call AUTOTARGETS))
 
 sdl_net: SDL_net
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
index 8f51e05..af090bc 100644
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -56,4 +56,4 @@ define SDL_SOUND_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libSDL_sound*so*
 endef
 
-$(eval $(call AUTOTARGETS,package,sdl_sound))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
index 0a8a9e9..efba5fa 100644
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -14,4 +14,4 @@ SDL_TTF_CONF_OPT = --without-x \
 		--with-sdl-prefix=$(STAGING_DIR)/usr
 
 SDL_TTF_MAKE_OPT = INCLUDES="-I$(STAGING_DIR)/usr/include/SDL"  LDFLAGS="-L$(STAGING_DIR)/usr/lib"
-$(eval $(call AUTOTARGETS,package,sdl_ttf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index ecb30c5..21befd6 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -2,4 +2,4 @@ SDPARM_VERSION = 1.06
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
 SDPARM_SITE = http://sg.danny.cz/sg/p/
 
-$(eval $(call AUTOTARGETS,package,sdparm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 1a313eb..79467ef 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -23,4 +23,4 @@ endef
 
 SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
 
-$(eval $(call AUTOTARGETS,package,sed))
+$(eval $(call AUTOTARGETS))
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 9c3d136..1fd589c 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -8,4 +8,4 @@ SER2NET_VERSION = 2.7
 SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
 SER2NET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ser2net
 
-$(eval $(call AUTOTARGETS,package,ser2net))
+$(eval $(call AUTOTARGETS))
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index f24af73..161b489 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -19,4 +19,4 @@ endef
 
 SETSERIAL_POST_PATCH_HOOKS += SETSERIAL_APPLY_DEBIAN_PATCHES
 
-$(eval $(call AUTOTARGETS,package,setserial))
+$(eval $(call AUTOTARGETS))
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index b24540d..dc53fce 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -25,8 +25,8 @@ define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(STAGING_DIR)/usr/share/mime/mime.cache $(TARGET_DIR)/usr/share/mime/mime.cache
 endef
 
-$(eval $(call AUTOTARGETS,package,shared-mime-info))
-$(eval $(call AUTOTARGETS,package,shared-mime-info,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
 # shared-mime-info for the host
 SHARED_MIME_INFO_HOST_BINARY:=$(HOST_DIR)/usr/bin/update-mime-database
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d982863..d941504 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -7,4 +7,4 @@
 SMARTMONTOOLS_VERSION = 5.40
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
 
-$(eval $(call AUTOTARGETS,package,smartmontools))
+$(eval $(call AUTOTARGETS))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index b110790..5f7feac 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -12,4 +12,4 @@ SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
 		 sc_cv_sys_tabdly_shift=11 \
 		 sc_cv_sys_csize_shift=4
 
-$(eval $(call AUTOTARGETS,package,socat))
+$(eval $(call AUTOTARGETS))
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 5070f73..2502b11 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -12,4 +12,4 @@ ifneq ($(BR2_INET_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
 endif
 
-$(eval $(call AUTOTARGETS,package,spawn-fcgi))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index de2e499..528abff 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -41,4 +41,4 @@ define SQLITE_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
 endef
 
-$(eval $(call AUTOTARGETS,package,sqlite))
+$(eval $(call AUTOTARGETS))
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 2184f1a..9b23f25 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -33,4 +33,4 @@ endef
 
 SQUID_POST_INSTALL_TARGET_HOOKS += SQUID_CLEANUP_TARGET
 
-$(eval $(call AUTOTARGETS,package,squid))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index ae837bb..81eb4c6 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -12,4 +12,4 @@ SSHFS_DEPENDENCIES = \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
-$(eval $(call AUTOTARGETS,package,sshfs))
+$(eval $(call AUTOTARGETS))
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
index ad669ac..bebb8e9 100644
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -16,5 +16,5 @@ STARTUP_NOTIFICATION_CONF_OPT = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
 
-$(eval $(call AUTOTARGETS,package,startup-notification))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 85e82c1..8cda09b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -18,4 +18,4 @@ endef
 
 STRACE_POST_INSTALL_TARGET_HOOKS += STRACE_REMOVE_STRACE_GRAPH
 
-$(eval $(call AUTOTARGETS,package,strace))
+$(eval $(call AUTOTARGETS))
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9b31fd2..1f40397 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -22,4 +22,4 @@ endef
 
 STUNNEL_POST_INSTALL_TARGET_HOOKS += STUNNEL_INSTALL_CONF_SCRIPT
 
-$(eval $(call AUTOTARGETS,package,stunnel))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 688df16..4263762 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -21,4 +21,4 @@ define SUDO_INSTALL_TARGET_CMDS
 	install -m 0440 -D $(@D)/sudoers $(TARGET_DIR)/etc/sudoers
 endef
 
-$(eval $(call AUTOTARGETS,package,sudo))
\ No newline at end of file
+$(eval $(call AUTOTARGETS))
\ No newline at end of file
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index dbd2408..93109f8 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -21,4 +21,4 @@ else
 SYLPHEED_CONF_OPT += --disable-ssl
 endif
 
-$(eval $(call AUTOTARGETS,package,sylpheed))
+$(eval $(call AUTOTARGETS))
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index d56bd3e..5a09359 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -12,4 +12,4 @@ SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 SYNERGY_DEPENDENCIES = xserver_xorg-server xlib_libXtst
 
-$(eval $(call AUTOTARGETS,package,synergy))
+$(eval $(call AUTOTARGETS))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 09e5177..30eaa73 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -22,4 +22,4 @@ endif
 # among other things. So we don't install it.
 SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
 
-$(eval $(call AUTOTARGETS,package,sysstat))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index e1e16a2..d1c51e4 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -7,4 +7,4 @@
 TAR_VERSION = 1.25
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 
-$(eval $(call AUTOTARGETS,package,tar))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 532cacf..cf9a409 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -24,4 +24,4 @@ endef
 
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
-$(eval $(call AUTOTARGETS,package,tcl))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 720a29a..1534543 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -21,4 +21,4 @@ endef
 
 TCPDUMP_POST_INSTALL_TARGET_HOOKS += TCPDUMP_REMOVE_DUPLICATED_BINARY
 
-$(eval $(call AUTOTARGETS,package,tcpdump))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index f82867c..e0a333c 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -11,5 +11,5 @@ TCPREPLAY_CONF_OPT = --program-prefix="" --with-libpcap=$(STAGING_DIR)/usr
 
 TCPREPLAY_DEPENDENCIES = uclibc libpcap
 
-$(eval $(call AUTOTARGETS,package,tcpreplay))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index c3b9e1d..98c3c2a 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -13,4 +13,4 @@ define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
 endef
 
-$(eval $(call AUTOTARGETS,package,tftpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
index c67aa49..d2eac16 100644
--- a/package/thttpd/thttpd.mk
+++ b/package/thttpd/thttpd.mk
@@ -48,4 +48,4 @@ define THTTPD_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/syslogtocern
 endef
 
-$(eval $(call AUTOTARGETS,package,thttpd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 84e5a5f..1d57db7 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -18,4 +18,4 @@ define TIFF_INSTALL_TARGET_CMDS
 	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
 endef
 
-$(eval $(call AUTOTARGETS,package,tiff))
+$(eval $(call AUTOTARGETS))
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
index 63c6c6c..7a4c0f2 100644
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -29,4 +29,4 @@ define TN5250_UNINSTALL_TARGET_CMDS
 	rm -rf $(TARGET_DIR)/usr/share/tn5250
 endef
 
-$(eval $(call AUTOTARGETS,package,tn5250))
+$(eval $(call AUTOTARGETS))
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
index 2b1cb8d..f81ce51 100644
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -16,5 +16,5 @@ TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries=
 
 TORSMO_DEPENDENCIES = xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package,torsmo))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 23c1f5b..37dfbe9 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -14,4 +14,4 @@ TSLIB_CONF_OPT = \
 	--prefix=/usr	\
 	--sysconfdir=/etc
 
-$(eval $(call AUTOTARGETS,package,tslib))
+$(eval $(call AUTOTARGETS))
diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 567bbfb..78c243f 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -33,4 +33,4 @@ endef
 
 UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
 
-$(eval $(call AUTOTARGETS,package,udev))
+$(eval $(call AUTOTARGETS))
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 8672dd5..212609f 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -26,4 +26,4 @@ ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
 UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
 endif
 
-$(eval $(call AUTOTARGETS,package,udpcast))
+$(eval $(call AUTOTARGETS))
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1ddadbe..a294d23 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -45,4 +45,4 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 USBUTILS_POST_INSTALL_TARGET_HOOKS += USBUTILS_REMOVE_DEVFILES
 endif
 
-$(eval $(call AUTOTARGETS,package,usbutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 9d2f9be..6d1e249 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -67,7 +67,7 @@ UTIL_LINUX_CONF_OPT += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-login-utils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write)
 
-$(eval $(call AUTOTARGETS,package,util-linux))
+$(eval $(call AUTOTARGETS))
 
 # MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
 # one, so it disappears
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 551aecf..537639f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -26,4 +26,4 @@ endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
 
-$(eval $(call AUTOTARGETS,package,valgrind))
+$(eval $(call AUTOTARGETS))
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 917d1d4..f5988d1 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -38,4 +38,4 @@ ifeq ($(BR2_PACKAGE_VIM_RUNTIME),y)
 VIM_POST_INSTALL_TARGET_HOOKS += VIM_INSTALL_RUNTIME_CMDS
 endif
 
-$(eval $(call AUTOTARGETS,package,vim))
+$(eval $(call AUTOTARGETS))
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
index 78ea44f..07334ad 100644
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -16,4 +16,4 @@ VTUN_CONF_OPT = \
 		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 		--with-lzo-lib=$(STAGING_DIR)/usr/lib
 
-$(eval $(call AUTOTARGETS,package,vtun))
+$(eval $(call AUTOTARGETS))
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 3a06f43..b71103a 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -21,4 +21,4 @@ endif
 
 WEBKIT_CONF_OPT += --disable-video
 
-$(eval $(call AUTOTARGETS,package,webkit))
+$(eval $(call AUTOTARGETS))
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 23c82af..c34a51c 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,4 +12,4 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	WGET_DEPENDENCIES += openssl
 endif
 
-$(eval $(call AUTOTARGETS,package,wget))
+$(eval $(call AUTOTARGETS))
diff --git a/package/which/which.mk b/package/which/which.mk
index 3bdfaca..628711d 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -10,4 +10,4 @@ WHICH_AUTORECONF:=NO
 WHICH_INSTALL_STAGING:=NO
 WHICH_INSTALL_TARGET:=YES
 
-$(eval $(call AUTOTARGETS,package,which))
+$(eval $(call AUTOTARGETS))
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 443a358..4636042 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -107,4 +107,4 @@ define WPA_SUPPLICANT_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
 endef
 
-$(eval $(call AUTOTARGETS,package,wpa_supplicant))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index a3c87d1..249217c 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -21,6 +21,6 @@ HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
 	host-xlib_libXau host-python
 
-$(eval $(call AUTOTARGETS,package/x11r7,libxcb))
-$(eval $(call AUTOTARGETS,package/x11r7,libxcb,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk
index cb0690d..1fc1631 100644
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
@@ -13,4 +13,4 @@ MESA3D_INSTALL_STAGING = YES
 
 MESA3D_DEPENDENCIES = xproto_glproto xlib_libXxf86vm xlib_libXdamage xlib_libXfixes xproto_dri2proto libdrm expat
 
-$(eval $(call AUTOTARGETS,package/x11r7,mesa3d))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index 75980c8..25b4433 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -9,6 +9,6 @@ PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs))
-$(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 308634c..faa9937 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -10,4 +10,4 @@ XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_AUTORECONF = NO
 XAPP_APPRES_DEPENDENCIES = xlib_libX11 xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_appres))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index 0350a87..c2f5896 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -11,5 +11,5 @@ XAPP_BDFTOPCF_AUTORECONF = NO
 XAPP_BDFTOPCF_DEPENDENCIES = xlib_libXfont
 HOST_XAPP_BDFTOPCF_DEPENDENCIES = host-xlib_libXfont
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_bdftopcf))
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_bdftopcf,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_beforelight/xapp_beforelight.mk b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
index 8c1273f..8d4cb75 100644
--- a/package/x11r7/xapp_beforelight/xapp_beforelight.mk
+++ b/package/x11r7/xapp_beforelight/xapp_beforelight.mk
@@ -10,4 +10,4 @@ XAPP_BEFORELIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BEFORELIGHT_AUTORECONF = NO
 XAPP_BEFORELIGHT_DEPENDENCIES = xlib_libX11 xlib_libXScrnSaver xlib_libXaw xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_beforelight))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index 252507e..4cca623 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -10,4 +10,4 @@ XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_AUTORECONF = NO
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_bitmap))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 54f1b01..a2ab2aa 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -10,4 +10,4 @@ XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_AUTORECONF = NO
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_editres))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
index 00b64f1..6c8ebcc 100644
--- a/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
+++ b/package/x11r7/xapp_fonttosfnt/xapp_fonttosfnt.mk
@@ -10,4 +10,4 @@ XAPP_FONTTOSFNT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FONTTOSFNT_AUTORECONF = NO
 XAPP_FONTTOSFNT_DEPENDENCIES = freetype xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_fonttosfnt))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
index 469fb4c..737a430 100644
--- a/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
+++ b/package/x11r7/xapp_fslsfonts/xapp_fslsfonts.mk
@@ -10,4 +10,4 @@ XAPP_FSLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSLSFONTS_AUTORECONF = NO
 XAPP_FSLSFONTS_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_fslsfonts))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index 052b572..e555179 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -10,4 +10,4 @@ XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_FSTOBDF_AUTORECONF = NO
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_fstobdf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 3b9e373..19c4297 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -10,4 +10,4 @@ XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_AUTORECONF = NO
 XAPP_ICEAUTH_DEPENDENCIES = xlib_libICE xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_iceauth))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_ico/xapp_ico.mk b/package/x11r7/xapp_ico/xapp_ico.mk
index 9edeacb..41031f5 100644
--- a/package/x11r7/xapp_ico/xapp_ico.mk
+++ b/package/x11r7/xapp_ico/xapp_ico.mk
@@ -10,4 +10,4 @@ XAPP_ICO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICO_AUTORECONF = NO
 XAPP_ICO_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_ico))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index f856d7c..b86d181 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -10,4 +10,4 @@ XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LISTRES_AUTORECONF = NO
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_listres))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index dc53e05..ec7d894 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -10,4 +10,4 @@ XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LUIT_AUTORECONF = NO
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_luit))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index 443b44f..ece5dd3 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -11,5 +11,5 @@ XAPP_MKFONTDIR_AUTORECONF = NO
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
 HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontdir))
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontdir,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index beec9f1..1c460d6 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -11,5 +11,5 @@ XAPP_MKFONTSCALE_AUTORECONF = NO
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xproto_xproto
 HOST_XAPP_MKFONTSCALE_DEPENDENCIES = host-zlib host-freetype host-xlib_libfontenc host-xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontscale))
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_mkfontscale,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_oclock/xapp_oclock.mk b/package/x11r7/xapp_oclock/xapp_oclock.mk
index d3f09c0..00bb644 100644
--- a/package/x11r7/xapp_oclock/xapp_oclock.mk
+++ b/package/x11r7/xapp_oclock/xapp_oclock.mk
@@ -10,4 +10,4 @@ XAPP_OCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_OCLOCK_AUTORECONF = NO
 XAPP_OCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_oclock))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_rgb/xapp_rgb.mk b/package/x11r7/xapp_rgb/xapp_rgb.mk
index 95ee70b..e8c89fe 100644
--- a/package/x11r7/xapp_rgb/xapp_rgb.mk
+++ b/package/x11r7/xapp_rgb/xapp_rgb.mk
@@ -10,4 +10,4 @@ XAPP_RGB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RGB_AUTORECONF = NO
 XAPP_RGB_DEPENDENCIES = xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_rgb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_rstart/xapp_rstart.mk b/package/x11r7/xapp_rstart/xapp_rstart.mk
index aa37f29..e5fb084 100644
--- a/package/x11r7/xapp_rstart/xapp_rstart.mk
+++ b/package/x11r7/xapp_rstart/xapp_rstart.mk
@@ -10,4 +10,4 @@ XAPP_RSTART_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_RSTART_AUTORECONF = NO
 XAPP_RSTART_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_rstart))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_scripts/xapp_scripts.mk b/package/x11r7/xapp_scripts/xapp_scripts.mk
index 00fb695..a2a050c 100644
--- a/package/x11r7/xapp_scripts/xapp_scripts.mk
+++ b/package/x11r7/xapp_scripts/xapp_scripts.mk
@@ -10,4 +10,4 @@ XAPP_SCRIPTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SCRIPTS_AUTORECONF = NO
 XAPP_SCRIPTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_scripts))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_sessreg/xapp_sessreg.mk b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
index 699537d..b207f2c 100644
--- a/package/x11r7/xapp_sessreg/xapp_sessreg.mk
+++ b/package/x11r7/xapp_sessreg/xapp_sessreg.mk
@@ -10,4 +10,4 @@ XAPP_SESSREG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SESSREG_AUTORECONF = NO
 XAPP_SESSREG_DEPENDENCIES = xlib_libX11 xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_sessreg))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
index 7c9d0f8..e5be077 100644
--- a/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
+++ b/package/x11r7/xapp_setxkbmap/xapp_setxkbmap.mk
@@ -10,4 +10,4 @@ XAPP_SETXKBMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SETXKBMAP_AUTORECONF = NO
 XAPP_SETXKBMAP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_setxkbmap))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index 21273e4..a5ff670 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -10,4 +10,4 @@ XAPP_SHOWFONT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SHOWFONT_AUTORECONF = NO
 XAPP_SHOWFONT_DEPENDENCIES = xlib_libFS
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_showfont))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index fa2acb3..d1e79ae 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -10,4 +10,4 @@ XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_SMPROXY_AUTORECONF = NO
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_smproxy))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index bc35293..7e63353 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -10,4 +10,4 @@ XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_AUTORECONF = NO
 XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_twm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_viewres/xapp_viewres.mk b/package/x11r7/xapp_viewres/xapp_viewres.mk
index a2cd1ea..7396d93 100644
--- a/package/x11r7/xapp_viewres/xapp_viewres.mk
+++ b/package/x11r7/xapp_viewres/xapp_viewres.mk
@@ -10,4 +10,4 @@ XAPP_VIEWRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_VIEWRES_AUTORECONF = NO
 XAPP_VIEWRES_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_viewres))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_x11perf/xapp_x11perf.mk b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
index ac8cd7a..b08dfc9 100644
--- a/package/x11r7/xapp_x11perf/xapp_x11perf.mk
+++ b/package/x11r7/xapp_x11perf/xapp_x11perf.mk
@@ -10,4 +10,4 @@ XAPP_X11PERF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_X11PERF_AUTORECONF = NO
 XAPP_X11PERF_DEPENDENCIES = xlib_libX11 xlib_libXmu xlib_libXft
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_x11perf))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index c0ab92d..a221266 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -10,4 +10,4 @@ XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XAUTH_AUTORECONF = NO
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xauth))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 9da0c65..f5afa5c 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -10,4 +10,4 @@ XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_AUTORECONF = NO
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xbacklight))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index 6959398..3862794 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -10,4 +10,4 @@ XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBIFF_AUTORECONF = NO
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xbiff))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index e3ef39c..a6f0fc1 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -11,4 +11,4 @@ XAPP_XCALC_AUTORECONF = NO
 XAPP_XCALC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec install-data
 XAPP_XCALC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xcalc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index 9cfeddd..a7ff739 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -10,4 +10,4 @@ XAPP_XCLIPBOARD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLIPBOARD_AUTORECONF = NO
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xclipboard))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 56b22fc..96fad91 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -10,4 +10,4 @@ XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_AUTORECONF = NO
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xclock))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
index 06af50d..11b17f5 100644
--- a/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
+++ b/package/x11r7/xapp_xcmsdb/xapp_xcmsdb.mk
@@ -10,4 +10,4 @@ XAPP_XCMSDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCMSDB_AUTORECONF = NO
 XAPP_XCMSDB_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xcmsdb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 746564f..55ddcdc 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -10,4 +10,4 @@ XAPP_XCURSORGEN_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCURSORGEN_AUTORECONF = NO
 XAPP_XCURSORGEN_DEPENDENCIES = libpng xlib_libX11 xlib_libXcursor
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xcursorgen))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
index 9f81357..aa57f7c 100644
--- a/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
+++ b/package/x11r7/xapp_xdbedizzy/xapp_xdbedizzy.mk
@@ -10,4 +10,4 @@ XAPP_XDBEDIZZY_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDBEDIZZY_AUTORECONF = NO
 XAPP_XDBEDIZZY_DEPENDENCIES = xlib_libXext xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xdbedizzy))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 9d69d81..5241e43 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -10,4 +10,4 @@ XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_AUTORECONF = NO
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xditview))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index e05ffc8..8d17d5c 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -11,4 +11,4 @@ XAPP_XDM_AUTORECONF = NO
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_xinit xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xdm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index 36cc067..663c1e1 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -10,4 +10,4 @@ XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_AUTORECONF = NO
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXi xlib_libXp xlib_libXrender xlib_libXtst xlib_libXxf86dga xlib_libXxf86vm xproto_inputproto xproto_kbproto xproto_printproto xproto_renderproto xproto_xf86dgaproto xproto_xf86vidmodeproto xlib_libdmx
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xdpyinfo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
index ce4716d..3be1fb1 100644
--- a/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
+++ b/package/x11r7/xapp_xdriinfo/xapp_xdriinfo.mk
@@ -10,4 +10,4 @@ XAPP_XDRIINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDRIINFO_AUTORECONF = NO
 XAPP_XDRIINFO_DEPENDENCIES = xlib_libX11 xproto_glproto mesa3d
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xdriinfo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 888d54e..72f2f7b 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -10,4 +10,4 @@ XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_AUTORECONF = NO
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xedit))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 19be2c1..3662c23 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -10,4 +10,4 @@ XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_AUTORECONF = NO
 XAPP_XEV_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xev))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 74358d5..270ad6c 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -10,4 +10,4 @@ XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_AUTORECONF = NO
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xeyes))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
index da141ae..fb78f1a 100644
--- a/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
+++ b/package/x11r7/xapp_xf86dga/xapp_xf86dga.mk
@@ -10,4 +10,4 @@ XAPP_XF86DGA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XF86DGA_AUTORECONF = NO
 XAPP_XF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXxf86dga
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xf86dga))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 622dafd..f132c60 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -10,4 +10,4 @@ XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFD_AUTORECONF = NO
 XAPP_XFD_DEPENDENCIES = freetype fontconfig xlib_libXaw xlib_libXft
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 2b27160..b1c39b8 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -10,4 +10,4 @@ XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_AUTORECONF = NO
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfontsel))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 2398d6b..b01c756 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -10,4 +10,4 @@ XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_AUTORECONF = NO
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont xproto_fontsproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfs))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
index 1ea7306..c0fb600 100644
--- a/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
+++ b/package/x11r7/xapp_xfsinfo/xapp_xfsinfo.mk
@@ -10,4 +10,4 @@ XAPP_XFSINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFSINFO_AUTORECONF = NO
 XAPP_XFSINFO_DEPENDENCIES = xlib_libFS xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xfsinfo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 2bdaa27..2505306 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -10,4 +10,4 @@ XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGAMMA_AUTORECONF = NO
 XAPP_XGAMMA_DEPENDENCIES = xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xgamma))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 9e642e2..f9de641 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -10,4 +10,4 @@ XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_AUTORECONF = NO
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xgc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index fd81537..f5cdc5c 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -10,4 +10,4 @@ XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_AUTORECONF = NO
 XAPP_XHOST_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xhost))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 52105c2..48637f2 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -9,4 +9,4 @@ XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xinit))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xinput/xapp_xinput.mk b/package/x11r7/xapp_xinput/xapp_xinput.mk
index 423c7c2..38c45cb 100644
--- a/package/x11r7/xapp_xinput/xapp_xinput.mk
+++ b/package/x11r7/xapp_xinput/xapp_xinput.mk
@@ -10,4 +10,4 @@ XAPP_XINPUT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINPUT_AUTORECONF = NO
 XAPP_XINPUT_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xinput))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index e9f7174..04a558e 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -11,5 +11,5 @@ XAPP_XKBCOMP_AUTORECONF = NO
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbcomp))
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbcomp,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 48d6565..efd3c37 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -10,4 +10,4 @@ XAPP_XKBEVD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBEVD_AUTORECONF = NO
 XAPP_XKBEVD_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbevd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index ec96c94..214ccc1 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -10,4 +10,4 @@ XAPP_XKBPRINT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBPRINT_AUTORECONF = NO
 XAPP_XKBPRINT_DEPENDENCIES = xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbprint))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 07a34f4..7daca60 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -10,4 +10,4 @@ XAPP_XKBUTILS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_AUTORECONF = NO
 XAPP_XKBUTILS_DEPENDENCIES = xlib_libXaw xlib_libxkbfile
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkbutils))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xkill/xapp_xkill.mk b/package/x11r7/xapp_xkill/xapp_xkill.mk
index 894c552..d9364c5 100644
--- a/package/x11r7/xapp_xkill/xapp_xkill.mk
+++ b/package/x11r7/xapp_xkill/xapp_xkill.mk
@@ -10,4 +10,4 @@ XAPP_XKILL_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKILL_AUTORECONF = NO
 XAPP_XKILL_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xkill))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index e1ae662..9130096 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -10,4 +10,4 @@ XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_AUTORECONF = NO
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xload))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlogo/xapp_xlogo.mk b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
index eb35a6d..2057031 100644
--- a/package/x11r7/xapp_xlogo/xapp_xlogo.mk
+++ b/package/x11r7/xapp_xlogo/xapp_xlogo.mk
@@ -11,4 +11,4 @@ XAPP_XLOGO_AUTORECONF = NO
 XAPP_XLOGO_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil xlib_libXrender \
 			  xlib_libXft host-pkg-config
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xlogo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index d202114..379994d 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -10,4 +10,4 @@ XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_AUTORECONF = NO
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsatoms))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
index cd522db..2374215 100644
--- a/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
+++ b/package/x11r7/xapp_xlsclients/xapp_xlsclients.mk
@@ -10,4 +10,4 @@ XAPP_XLSCLIENTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSCLIENTS_AUTORECONF = NO
 XAPP_XLSCLIENTS_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsclients))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
index 120669c..944c6fc 100644
--- a/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
+++ b/package/x11r7/xapp_xlsfonts/xapp_xlsfonts.mk
@@ -10,4 +10,4 @@ XAPP_XLSFONTS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSFONTS_AUTORECONF = NO
 XAPP_XLSFONTS_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xlsfonts))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 518fe48..f848601 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -10,4 +10,4 @@ XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_AUTORECONF = NO
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xmag))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index 8ef0a1f..703d8dc 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -15,4 +15,4 @@ XAPP_XMAN_CONF_ENV = ac_cv_file__etc_man_conf=no \
 
 XAPP_XMAN_CONF_OPT = --disable-IPv6
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xman))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmessage/xapp_xmessage.mk b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
index 9f1aa74..4a0ecc8 100644
--- a/package/x11r7/xapp_xmessage/xapp_xmessage.mk
+++ b/package/x11r7/xapp_xmessage/xapp_xmessage.mk
@@ -10,4 +10,4 @@ XAPP_XMESSAGE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMESSAGE_AUTORECONF = NO
 XAPP_XMESSAGE_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xmessage))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 500801b..ed8276a 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -10,4 +10,4 @@ XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMH_AUTORECONF = NO
 XAPP_XMH_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xmh))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index df4280b..d498d98 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -10,4 +10,4 @@ XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_AUTORECONF = NO
 XAPP_XMODMAP_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xmodmap))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index 0b68e71..ecbdbaf 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -10,4 +10,4 @@ XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMORE_AUTORECONF = NO
 XAPP_XMORE_DEPENDENCIES = xlib_libXprintUtil xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xmore))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
index e16733b..b39e4b5 100644
--- a/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
+++ b/package/x11r7/xapp_xplsprinters/xapp_xplsprinters.mk
@@ -10,4 +10,4 @@ XAPP_XPLSPRINTERS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPLSPRINTERS_AUTORECONF = NO
 XAPP_XPLSPRINTERS_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xplsprinters))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 257d10b..871d711 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -10,4 +10,4 @@ XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_AUTORECONF = NO
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xpr))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
index e9f8f43..00c429c 100644
--- a/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
+++ b/package/x11r7/xapp_xprehashprinterlist/xapp_xprehashprinterlist.mk
@@ -10,4 +10,4 @@ XAPP_XPREHASHPRINTERLIST_SITE = http://xorg.freedesktop.org/releases/individual/
 XAPP_XPREHASHPRINTERLIST_AUTORECONF = NO
 XAPP_XPREHASHPRINTERLIST_DEPENDENCIES = xlib_libX11 xlib_libXp
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xprehashprinterlist))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 7bcd1f0..5b31506 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -10,4 +10,4 @@ XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_AUTORECONF = NO
 XAPP_XPROP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xprop))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 70c7e1a..254fead 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -11,4 +11,4 @@ XAPP_XRANDR_AUTORECONF = NO
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
 XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xrandr))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index c7b24b5..425cef4 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -10,4 +10,4 @@ XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRDB_AUTORECONF = NO
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xrdb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
index 9a9022c..d6d04d6 100644
--- a/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
+++ b/package/x11r7/xapp_xrefresh/xapp_xrefresh.mk
@@ -10,4 +10,4 @@ XAPP_XREFRESH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XREFRESH_AUTORECONF = NO
 XAPP_XREFRESH_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xrefresh))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xset/xapp_xset.mk b/package/x11r7/xapp_xset/xapp_xset.mk
index 51ddd98..fcd8df0 100644
--- a/package/x11r7/xapp_xset/xapp_xset.mk
+++ b/package/x11r7/xapp_xset/xapp_xset.mk
@@ -10,4 +10,4 @@ XAPP_XSET_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSET_AUTORECONF = NO
 XAPP_XSET_DEPENDENCIES = xlib_libXfontcache xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xset))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
index 23db1f9..650afb0 100644
--- a/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
+++ b/package/x11r7/xapp_xsetmode/xapp_xsetmode.mk
@@ -10,4 +10,4 @@ XAPP_XSETMODE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETMODE_AUTORECONF = NO
 XAPP_XSETMODE_DEPENDENCIES = xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetmode))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
index 7c65bc7..5f9ef25 100644
--- a/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
+++ b/package/x11r7/xapp_xsetpointer/xapp_xsetpointer.mk
@@ -10,4 +10,4 @@ XAPP_XSETPOINTER_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETPOINTER_AUTORECONF = NO
 XAPP_XSETPOINTER_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXi
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetpointer))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
index 523c89a..0f797a3 100644
--- a/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
+++ b/package/x11r7/xapp_xsetroot/xapp_xsetroot.mk
@@ -10,4 +10,4 @@ XAPP_XSETROOT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSETROOT_AUTORECONF = NO
 XAPP_XSETROOT_DEPENDENCIES = xlib_libX11 xlib_libXmu xdata_xbitmaps
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xsetroot))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xsm/xapp_xsm.mk b/package/x11r7/xapp_xsm/xapp_xsm.mk
index 76cc07b..3017552 100644
--- a/package/x11r7/xapp_xsm/xapp_xsm.mk
+++ b/package/x11r7/xapp_xsm/xapp_xsm.mk
@@ -10,4 +10,4 @@ XAPP_XSM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSM_AUTORECONF = NO
 XAPP_XSM_DEPENDENCIES = xlib_libXaw
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xsm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index 6137974..b0b9960 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -10,4 +10,4 @@ XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSTDCMAP_AUTORECONF = NO
 XAPP_XSTDCMAP_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xstdcmap))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
index 039da18..e89dc5d 100644
--- a/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
+++ b/package/x11r7/xapp_xvidtune/xapp_xvidtune.mk
@@ -10,4 +10,4 @@ XAPP_XVIDTUNE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVIDTUNE_AUTORECONF = NO
 XAPP_XVIDTUNE_DEPENDENCIES = xlib_libXaw xlib_libXxf86vm
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xvidtune))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
index 59d8ad3..9541c2d 100644
--- a/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
+++ b/package/x11r7/xapp_xvinfo/xapp_xvinfo.mk
@@ -10,4 +10,4 @@ XAPP_XVINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XVINFO_AUTORECONF = NO
 XAPP_XVINFO_DEPENDENCIES = xlib_libX11 xlib_libXv
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xvinfo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index bdd6182..3a96627 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -10,4 +10,4 @@ XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_AUTORECONF = NO
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xwd))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 36f11f7..7c7012c 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -10,4 +10,4 @@ XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWININFO_AUTORECONF = NO
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xwininfo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 0640f78..97ecf0f 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -10,4 +10,4 @@ XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_AUTORECONF = NO
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
 
-$(eval $(call AUTOTARGETS,package/x11r7,xapp_xwud))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 47a38cb..3479a23 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -11,6 +11,6 @@ XCB_PROTO_INSTALL_STAGING = YES
 
 XCB_PROTO_DEPENDENCIES = host-python
 
-$(eval $(call AUTOTARGETS,package/x11r7,xcb-proto))
-$(eval $(call AUTOTARGETS,package/x11r7,xcb-proto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
 
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 2983280..0158c9f 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -8,5 +8,5 @@ XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist/
 XCB_UTIL_DEPENDENCIES = host-gperf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xcb-util))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
index c1bb301..e400934 100644
--- a/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
+++ b/package/x11r7/xdata_xbitmaps/xdata_xbitmaps.mk
@@ -11,4 +11,4 @@ XDATA_XBITMAPS_AUTORECONF = NO
 XDATA_XBITMAPS_INSTALL_STAGING = YES
 XDATA_XBITMAPS_INSTALL_TARGET = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdata_xbitmaps))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index da928f4..fe5c0da 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -11,4 +11,4 @@ XDATA_XCURSOR_THEMES_INSTALL_STAGING = YES
 XDATA_XCURSOR_THEMES_INSTALL_TARGET = YES
 XDATA_XCURSOR_THEMES_DEPENDENCIES = xlib_libXcursor
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdata_xcursor-themes))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
index d6f958c..2b9acfb 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
+++ b/package/x11r7/xdriver_xf86-input-acecad/xdriver_xf86-input-acecad.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_ACECAD_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_INPUT_ACECAD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_ACECAD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-acecad))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index aa93fdc..6b92700 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_INPUT_AIPTEK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-aiptek))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index bb5a1d7..0195876 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = NO
 XDRIVER_XF86_INPUT_EVDEV_DEPENDENCIES = xproto_inputproto xserver_xorg-server xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-evdev))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
index f6d5619..dbd1bde 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_JOYSTICK_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_JOYSTICK_AUTORECONF = NO
 XDRIVER_XF86_INPUT_JOYSTICK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-joystick))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
index 15b0715..b28843d 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_KEYBOARD_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_INPUT_KEYBOARD_AUTORECONF = NO
 XDRIVER_XF86_INPUT_KEYBOARD_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_kbproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-keyboard))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 6be28c7..5be5cb9 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-mouse))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
index 4cb16ea..129f212 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
+++ b/package/x11r7/xdriver_xf86-input-synaptics/xdriver_xf86-input-synaptics.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_SYNAPTICS_SITE = http://xorg.freedesktop.org/releases/individ
 XDRIVER_XF86_INPUT_SYNAPTICS_AUTORECONF = NO
 XDRIVER_XF86_INPUT_SYNAPTICS_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-synaptics))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
index 3526236..20328b2 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_VMMOUSE_SITE = http://xorg.freedesktop.org/releases/individua
 XDRIVER_XF86_INPUT_VMMOUSE_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VMMOUSE_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-vmmouse))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index fb16bb7..c92af15 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_INPUT_VOID_AUTORECONF = NO
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-input-void))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
index c0f4b82..162e9b3 100644
--- a/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
+++ b/package/x11r7/xdriver_xf86-video-apm/xdriver_xf86-video-apm.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_APM_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_APM_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_APM_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86rushproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-apm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
index 7442706..2976ae4 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_ARK_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_ARK_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_ARK_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ark))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
index daa94bb..c77c7ac 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.mk
@@ -9,4 +9,4 @@ XDRIVER_XF86_VIDEO_AST_SOURCE = xf86-video-ast-$(XDRIVER_XF86_VIDEO_AST_VERSION)
 XDRIVER_XF86_VIDEO_AST_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_AST_AUTORECONF = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ast))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 8a5a1d0..a357cf2 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-ati))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
index 0dc5dd1..532fda1 100644
--- a/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
+++ b/package/x11r7/xdriver_xf86-video-chips/xdriver_xf86-video-chips.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_CHIPS_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_CHIPS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CHIPS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-chips))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
index 47c3c9b..64548d3 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_CIRRUS_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_CIRRUS_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_CIRRUS_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-cirrus))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 2121748..4a4ce7a 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_DUMMY_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_DUMMY_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-dummy))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
index 97c20fa..6964a35 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_FBDEV_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_FBDEV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_FBDEV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-fbdev))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index cd94246..8284d04 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GEODE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-geode))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index 0115cec..122837b 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GLIDE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glide))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
index 5d50da1..2ff7669 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_GLINT_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_GLINT_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_GLINT_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-glint))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
index 63c9ad7..96628cf 100644
--- a/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
+++ b/package/x11r7/xdriver_xf86-video-i128/xdriver_xf86-video-i128.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_I128_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_I128_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i128))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
index 493fd34..2b137d7 100644
--- a/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
+++ b/package/x11r7/xdriver_xf86-video-i740/xdriver_xf86-video-i740.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_I740_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_I740_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_I740_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-i740))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 83d0a44..a24a241 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -11,4 +11,4 @@ XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = --enable-dri
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-intel))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 5b72769..0636085 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-mach64))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index 033a32c..64bae46 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MGA_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-mga))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index db9c2c0..759d5b2 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individu
 XDRIVER_XF86_VIDEO_NEOMAGIC_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEOMAGIC_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-neomagic))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index b9bf3e7..f532f2e 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individua
 XDRIVER_XF86_VIDEO_NEWPORT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NEWPORT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-newport))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 9f969e5..50080f9 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_NV_SITE = http://xorg.freedesktop.org/releases/individual/dri
 XDRIVER_XF86_VIDEO_NV_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_NV_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-nv))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 19d67cc..c166559 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -24,4 +24,4 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 
 XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-openchrome))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 0e74607..8430d73 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_R128_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_R128_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_R128_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-r128))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
index dc03a87..9684f41 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
+++ b/package/x11r7/xdriver_xf86-video-rendition/xdriver_xf86-video-rendition.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_RENDITION_SITE = http://xorg.freedesktop.org/releases/individ
 XDRIVER_XF86_VIDEO_RENDITION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_RENDITION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-rendition))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
index d6f7327..f9c6f08 100644
--- a/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
+++ b/package/x11r7/xdriver_xf86-video-s3/xdriver_xf86-video-s3.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_S3_SITE = http://xorg.freedesktop.org/releases/individual/dri
 XDRIVER_XF86_VIDEO_S3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
index 9c7b2c2..08c527d 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
+++ b/package/x11r7/xdriver_xf86-video-s3virge/xdriver_xf86-video-s3virge.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_S3VIRGE_SITE = http://xorg.freedesktop.org/releases/individua
 XDRIVER_XF86_VIDEO_S3VIRGE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_S3VIRGE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-s3virge))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 4470736..32ef7f5 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-savage))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 97e416a..8b52933 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/ind
 XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-siliconmotion))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 0fb335c..8343761 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_SIS_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sis))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
index 3cd6012..aaf86f2 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
+++ b/package/x11r7/xdriver_xf86-video-sisusb/xdriver_xf86-video-sisusb.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SISUSB_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SISUSB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SISUSB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sisusb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
index 6a0fb04..7e9e1c7 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg14/xdriver_xf86-video-suncg14.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNCG14_SITE = http://xorg.freedesktop.org/releases/individua
 XDRIVER_XF86_VIDEO_SUNCG14_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG14_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg14))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
index 7ba7ecd..939d4de 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg3/xdriver_xf86-video-suncg3.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNCG3_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SUNCG3_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG3_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg3))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
index 7234e98..f5e1a7b 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
+++ b/package/x11r7/xdriver_xf86-video-suncg6/xdriver_xf86-video-suncg6.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNCG6_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SUNCG6_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNCG6_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suncg6))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index 7c6019b..0e365d8 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunffb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
index 38af6d0..81dc5f5 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
+++ b/package/x11r7/xdriver_xf86-video-sunleo/xdriver_xf86-video-sunleo.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNLEO_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SUNLEO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNLEO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-sunleo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
index b26d659..4c1f35a 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
+++ b/package/x11r7/xdriver_xf86-video-suntcx/xdriver_xf86-video-suntcx.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_SUNTCX_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_SUNTCX_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNTCX_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-suntcx))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index c11e408..dd2643a 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_TDFX_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tdfx))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 68e58fb..c6c55d6 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_TGA_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TGA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tga))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
index da3edbb..4a722b8 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TRIDENT_SITE = http://xorg.freedesktop.org/releases/individua
 XDRIVER_XF86_VIDEO_TRIDENT_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TRIDENT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-trident))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
index 6ad8023..21cb2db 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
+++ b/package/x11r7/xdriver_xf86-video-tseng/xdriver_xf86-video-tseng.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_TSENG_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_TSENG_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_TSENG_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-tseng))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
index dffcf13..2e265b7 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
+++ b/package/x11r7/xdriver_xf86-video-v4l/xdriver_xf86-video-v4l.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_V4L_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_V4L_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_V4L_DEPENDENCIES = xserver_xorg-server xproto_randrproto xproto_videoproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-v4l))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 5d0ed12..bc4c38e 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vesa))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index a92bc3b..255bde1 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_VMWARE_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VMWARE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xineramaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-vmware))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
index dadd3f4..8fc7fa4 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
+++ b/package/x11r7/xdriver_xf86-video-voodoo/xdriver_xf86-video-voodoo.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_VOODOO_SITE = http://xorg.freedesktop.org/releases/individual
 XDRIVER_XF86_VIDEO_VOODOO_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_VOODOO_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86dgaproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-voodoo))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index e71715a..da7a5c6 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/d
 XDRIVER_XF86_VIDEO_WSFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-wsfb))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 49fb8b0..837c9dd 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/dr
 XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-xgi))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
index c55390a..a3edd20 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
+++ b/package/x11r7/xdriver_xf86-video-xgixp/xdriver_xf86-video-xgixp.mk
@@ -10,4 +10,4 @@ XDRIVER_XF86_VIDEO_XGIXP_SITE = http://xorg.freedesktop.org/releases/individual/
 XDRIVER_XF86_VIDEO_XGIXP_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGIXP_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-xgixp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index ed94e49..3bf7bc0 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -12,5 +12,5 @@ XFONT_ENCODINGS_MAKE_OPT =
 XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 HOST_XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings))
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_encodings,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
index 2b9c50c..9a7503c 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ADOBE_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE
 XFONT_FONT_ADOBE_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-100dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
index 2d7791a..82ae78b 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ADOBE_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ADOBE_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-75dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
index 2ed27f4..fad8dcd 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFO
 XFONT_FONT_ADOBE_UTOPIA_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-100dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index ead4196..e6bd35f 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-75dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
index 983bab6..bb553ee 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFON
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ADOBE_UTOPIA_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-adobe-utopia-type1))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-alias/xfont_font-alias.mk b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
index 1e85f3e..29cb369 100644
--- a/package/x11r7/xfont_font-alias/xfont_font-alias.mk
+++ b/package/x11r7/xfont_font-alias/xfont_font-alias.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ALIAS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOST
 XFONT_FONT_ALIAS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ALIAS_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-alias))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
index 5a1253a..5d20d57 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ARABIC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_ARABIC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ARABIC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-arabic-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
index f2f796a..8003d2b 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_BH_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-100dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
index 4d08be4..4236923 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-75dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
index a7897c2..dafc4eb 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DI
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-lucidatypewriter-100dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
index 04a3246..6812fc7 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_LUCIDATYPEWRITER_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-lucidatypewriter-75dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
index ea2c82a..13c8c4d 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_TTF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(HOS
 XFONT_FONT_BH_TTF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TTF_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-ttf))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
index 3f5a025..b4b612f 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BH_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_BH_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BH_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bh-type1))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
index a89db53..2fb3b3c 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BITSTREAM_100DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_100DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_100DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-100dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
index ea2fd41..b815f7c 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BITSTREAM_75DPI_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_75DPI_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_75DPI_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-75dpi))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
index f867c7e..19d4107 100644
--- a/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
+++ b/package/x11r7/xfont_font-bitstream-speedo/xfont_font-bitstream-speedo.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTS
 XFONT_FONT_BITSTREAM_SPEEDO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_SPEEDO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-speedo))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
index 75a60de..df1bc97 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.mk
@@ -12,5 +12,5 @@ XFONT_FONT_BITSTREAM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_BITSTREAM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_BITSTREAM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-bitstream-type1))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
index 484bf4b..919738a 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.mk
@@ -12,5 +12,5 @@ XFONT_FONT_CRONYX_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_CRONYX_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CRONYX_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-cronyx-cyrillic))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
index 755f6ec..05a5262 100644
--- a/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
+++ b/package/x11r7/xfont_font-cursor-misc/xfont_font-cursor-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_CURSOR_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_CURSOR_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_CURSOR_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-cursor-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
index c66bbbb..d6514f3 100644
--- a/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
+++ b/package/x11r7/xfont_font-daewoo-misc/xfont_font-daewoo-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_DAEWOO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_DAEWOO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DAEWOO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-daewoo-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
index 9c510a1..00dc676 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_DEC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_DEC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_DEC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-dec-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
index 075f4ba..f03eb4f 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.mk
@@ -12,5 +12,5 @@ XFONT_FONT_IBM_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_IBM_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_IBM_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-ibm-type1))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
index 5635ff6..db66a74 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_ISAS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_ISAS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_ISAS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-isas-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
index 4f1a74e..3f00e32 100644
--- a/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
+++ b/package/x11r7/xfont_font-jis-misc/xfont_font-jis-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_JIS_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_JIS_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_JIS_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-jis-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
index 0b1f35c..7367287 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_MICRO_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$
 XFONT_FONT_MICRO_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MICRO_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-micro-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
index 3ae408d..a537b37 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.mk
@@ -12,5 +12,5 @@ XFONT_FONT_MISC_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-cyrillic))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
index e093781..f7ffcf6 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.mk
@@ -12,5 +12,5 @@ XFONT_FONT_MISC_ETHIOPIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_MISC_ETHIOPIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_ETHIOPIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-ethiopic))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
index e04f01d..3f5d536 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.mk
@@ -12,5 +12,5 @@ XFONT_FONT_MISC_MELTHO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=
 XFONT_FONT_MISC_MELTHO_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MELTHO_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-meltho))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index f6a5564..8e28f9c 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -12,5 +12,4 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-misc))
-
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
index 28995ef..494c1cc 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_MUTT_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MUTT_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MUTT_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-mutt-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
index 86dc54b..37f0b70 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_SCHUMACHER_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCHUMACHER_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCHUMACHER_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-schumacher-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
index d0db502..ecb2d80 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.mk
@@ -12,5 +12,5 @@ XFONT_FONT_SCREEN_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSC
 XFONT_FONT_SCREEN_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SCREEN_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-screen-cyrillic))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
index 7fc9cbf..75d5baa 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_SONY_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_SONY_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SONY_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-sony-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
index 9364e4a..8419842 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.mk
@@ -12,5 +12,5 @@ XFONT_FONT_SUN_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(H
 XFONT_FONT_SUN_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_SUN_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-sun-misc))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 82b66a5..680fdc7 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -13,5 +13,5 @@ XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
 HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
index 377f281..66eac4e 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.mk
@@ -12,5 +12,5 @@ XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONT
 XFONT_FONT_WINITZKI_CYRILLIC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_WINITZKI_CYRILLIC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-winitzki-cyrillic))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
index 6e3e564..7d3d8ca 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.mk
@@ -12,5 +12,5 @@ XFONT_FONT_XFREE86_TYPE1_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCAL
 XFONT_FONT_XFREE86_TYPE1_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_XFREE86_TYPE1_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-$(eval $(call AUTOTARGETS,package/x11r7,xfont_font-xfree86-type1))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index f5ad44d..955c523 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -13,5 +13,5 @@ XKEYBOARD_CONFIG_DEPENDENCIES = host-intltool host-xapp_xkbcomp
 
 XKEYBOARD_CONFIG_CONF_OPT = GMSGFMT=/usr/bin/msgfmt
 
-$(eval $(call AUTOTARGETS,package/x11r7,xkeyboard-config))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index f121f24..7528102 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -12,4 +12,4 @@ XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto
 XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libFS))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index 168f899..338d74b 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -11,4 +11,4 @@ XLIB_LIBICE_AUTORECONF = NO
 XLIB_LIBICE_INSTALL_STAGING = YES
 XLIB_LIBICE_DEPENDENCIES = xlib_xtrans xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libICE))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index e22c04b..0b92f93 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -12,4 +12,4 @@ XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
 XLIB_LIBSM_CONF_OPT = --without-libuuid
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libSM))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 95b1483..e017fea 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -39,5 +39,5 @@ endef
 
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 4b60fdc..479cd35 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -12,4 +12,4 @@ XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
 XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXScrnSaver))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 2b008e9..2404a3e 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -13,5 +13,5 @@ XLIB_LIBXAU_DEPENDENCIES = xutil_util-macros xproto_xproto
 
 HOST_XLIB_LIBXAU_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXau,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index d06ff6e..1142c76 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -11,4 +11,4 @@ XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto xlib_libXp
 XLIB_LIBXAW_CONF_OPT = --disable-docs
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXaw))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
index e1a1852..9a5a33a 100644
--- a/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
+++ b/package/x11r7/xlib_libXcomposite/xlib_libXcomposite.mk
@@ -11,4 +11,4 @@ XLIB_LIBXCOMPOSITE_AUTORECONF = NO
 XLIB_LIBXCOMPOSITE_INSTALL_STAGING = YES
 XLIB_LIBXCOMPOSITE_DEPENDENCIES = xproto_compositeproto xlib_libX11 xlib_libXext xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXcomposite))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index a6bbcc8..ffe1b4d 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -11,4 +11,4 @@ XLIB_LIBXCURSOR_AUTORECONF = NO
 XLIB_LIBXCURSOR_INSTALL_STAGING = YES
 XLIB_LIBXCURSOR_DEPENDENCIES = xlib_libX11 xlib_libXfixes xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXcursor))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
index 3240355..c2ba616 100644
--- a/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
+++ b/package/x11r7/xlib_libXdamage/xlib_libXdamage.mk
@@ -11,4 +11,4 @@ XLIB_LIBXDAMAGE_AUTORECONF = NO
 XLIB_LIBXDAMAGE_INSTALL_STAGING = YES
 XLIB_LIBXDAMAGE_DEPENDENCIES = xproto_damageproto xlib_libX11 xlib_libXfixes xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdamage))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 8d03fc8..1aec4de 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -13,5 +13,5 @@ XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
 
 HOST_XLIB_LIBXDMCP_DEPENDENCIES = host-xutil_util-macros host-xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXdmcp,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 6b60042..c97a9a5 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -12,4 +12,4 @@ XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
 XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXext))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 2d07d69..2450bce 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFIXES_AUTORECONF = NO
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfixes))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index b30a88c..303992f 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -15,5 +15,5 @@ XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 HOST_XLIB_LIBXFONT_DEPENDENCIES = host-freetype host-xlib_libfontenc host-xlib_xtrans host-xproto_fontcacheproto host-xproto_fontsproto host-xproto_xproto host-xfont_encodings
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index bf64a4d..d90a962 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -12,4 +12,4 @@ XLIB_LIBXFONTCACHE_INSTALL_STAGING = YES
 XLIB_LIBXFONTCACHE_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_fontcacheproto
 XLIB_LIBXFONTCACHE_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfontcache))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 942b9a6..44ddcbe 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -11,4 +11,4 @@ XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXft))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 3cca1e6..d6ce633 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -12,4 +12,4 @@ XLIB_LIBXI_INSTALL_STAGING = YES
 XLIB_LIBXI_DEPENDENCIES = xproto_inputproto xlib_libX11 xlib_libXext xproto_xproto
 XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXi))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
index fe7c5ed..0b82622 100644
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -12,4 +12,4 @@ XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
 XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXinerama))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index c1c9503..ceebc14 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -11,4 +11,4 @@ XLIB_LIBXMU_AUTORECONF = NO
 XLIB_LIBXMU_INSTALL_STAGING = YES
 XLIB_LIBXMU_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXmu))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
index f030082..bc8bfcd 100644
--- a/package/x11r7/xlib_libXp/xlib_libXp.mk
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -12,4 +12,4 @@ XLIB_LIBXP_INSTALL_STAGING = YES
 XLIB_LIBXP_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xproto_printproto
 XLIB_LIBXP_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXp))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index 459a299..ef67b6d 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -11,4 +11,4 @@ XLIB_LIBXPM_AUTORECONF = NO
 XLIB_LIBXPM_INSTALL_STAGING = YES
 XLIB_LIBXPM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXpm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
index f980594..c9b2924 100644
--- a/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
+++ b/package/x11r7/xlib_libXprintAppUtil/xlib_libXprintAppUtil.mk
@@ -11,4 +11,4 @@ XLIB_LIBXPRINTAPPUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTAPPUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTAPPUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXprintUtil
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXprintAppUtil))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
index ed801ff..cf6ec1e 100644
--- a/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
+++ b/package/x11r7/xlib_libXprintUtil/xlib_libXprintUtil.mk
@@ -11,4 +11,4 @@ XLIB_LIBXPRINTUTIL_AUTORECONF = NO
 XLIB_LIBXPRINTUTIL_INSTALL_STAGING = YES
 XLIB_LIBXPRINTUTIL_DEPENDENCIES = xlib_libX11 xlib_libXp xlib_libXt xproto_printproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXprintUtil))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 20b61d1..96e71ea 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -12,4 +12,4 @@ XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
 XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXrandr))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 1148a6c..3649503 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -12,4 +12,4 @@ XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
 XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXrender))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 51451a0..cf7fc10 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -12,4 +12,4 @@ XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
 XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXres))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
index 41bf26d..765f0d5 100644
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -12,4 +12,4 @@ XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
 XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXt))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index dd1cfd0..feab32a 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -15,4 +15,4 @@ XLIB_LIBXTST_DEPENDENCIES = \
 	xlib_libXi \
 	xproto_recordproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXtst))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index c827938..fed9ce4 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -12,4 +12,4 @@ XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
 XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXv))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index e2a5aed..6a99b9b 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -12,4 +12,4 @@ XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
 XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXvMC))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
index 2a8ef9f..acfd08a 100644
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -12,4 +12,4 @@ XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
 XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXxf86dga))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index a73ba6b..c80d5b3 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -12,4 +12,4 @@ XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
 XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libXxf86vm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 073005c..3de2537 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -12,4 +12,4 @@ XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
 XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libdmx))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index c2ce11f..20cfc8d 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -13,5 +13,5 @@ XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 
 HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_liboldX/xlib_liboldX.mk b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
index 94a38fa..0d576ef 100644
--- a/package/x11r7/xlib_liboldX/xlib_liboldX.mk
+++ b/package/x11r7/xlib_liboldX/xlib_liboldX.mk
@@ -12,4 +12,4 @@ XLIB_LIBOLDX_INSTALL_STAGING = YES
 XLIB_LIBOLDX_DEPENDENCIES = xlib_libX11
 XLIB_LIBOLDX_CONF_OPT = --disable-malloc0returnsnull
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_liboldX))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 5929a62..6c78225 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -9,4 +9,4 @@ XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libpciaccess))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
index 96420c3..35b6171 100644
--- a/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
+++ b/package/x11r7/xlib_libxkbfile/xlib_libxkbfile.mk
@@ -13,5 +13,5 @@ XLIB_LIBXKBFILE_DEPENDENCIES = xlib_libX11 xproto_kbproto
 
 HOST_XLIB_LIBXKBFILE_DEPENDENCIES = host-xlib_libX11 host-xproto_kbproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbfile,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
index 8253ac5..c822a4d 100644
--- a/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
+++ b/package/x11r7/xlib_libxkbui/xlib_libxkbui.mk
@@ -11,4 +11,4 @@ XLIB_LIBXKBUI_AUTORECONF = NO
 XLIB_LIBXKBUI_INSTALL_STAGING = YES
 XLIB_LIBXKBUI_DEPENDENCIES = xlib_libxkbfile xlib_libXt xproto_kbproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_libxkbui))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index aaf2208..62fb51d 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -10,5 +10,5 @@ XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_AUTORECONF = NO
 XLIB_XTRANS_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans))
-$(eval $(call AUTOTARGETS,package/x11r7,xlib_xtrans,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 189c24f..2d7b5d1 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -11,4 +11,4 @@ XPROTO_APPLEWMPROTO_AUTORECONF = NO
 XPROTO_APPLEWMPROTO_INSTALL_STAGING = YES
 XPROTO_APPLEWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_applewmproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 7ae7795..bb4af54 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -11,4 +11,4 @@ XPROTO_BIGREQSPROTO_AUTORECONF = NO
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES
 XPROTO_BIGREQSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_bigreqsproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
index b176b69..e5a34c0 100644
--- a/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
+++ b/package/x11r7/xproto_compositeproto/xproto_compositeproto.mk
@@ -11,4 +11,4 @@ XPROTO_COMPOSITEPROTO_AUTORECONF = NO
 XPROTO_COMPOSITEPROTO_INSTALL_STAGING = YES
 XPROTO_COMPOSITEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_compositeproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index a2f8c71..5eb25fd 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -11,4 +11,4 @@ XPROTO_DAMAGEPROTO_AUTORECONF = NO
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES
 XPROTO_DAMAGEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_damageproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index ff31e7e..0fcf00d 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -11,4 +11,4 @@ XPROTO_DMXPROTO_AUTORECONF = NO
 XPROTO_DMXPROTO_INSTALL_STAGING = YES
 XPROTO_DMXPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_dmxproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index f3b37c9..a441c9b 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -11,4 +11,4 @@ XPROTO_DRI2PROTO_AUTORECONF = NO
 XPROTO_DRI2PROTO_INSTALL_STAGING = YES
 XPROTO_DRI2PROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_dri2proto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 1395e0c..d569de8 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -11,4 +11,4 @@ XPROTO_FIXESPROTO_AUTORECONF = NO
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES
 XPROTO_FIXESPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_fixesproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 40917cd..fec4e87 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -11,5 +11,5 @@ XPROTO_FONTCACHEPROTO_AUTORECONF = NO
 XPROTO_FONTCACHEPROTO_INSTALL_STAGING = YES
 XPROTO_FONTCACHEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontcacheproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontcacheproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 5e2a64a..d947009 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -11,5 +11,5 @@ XPROTO_FONTSPROTO_AUTORECONF = NO
 XPROTO_FONTSPROTO_INSTALL_STAGING = YES
 XPROTO_FONTSPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontsproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_fontsproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index 98c6b2f..7bdf057 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -11,4 +11,4 @@ XPROTO_GLPROTO_AUTORECONF = NO
 XPROTO_GLPROTO_INSTALL_STAGING = YES
 XPROTO_GLPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_glproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 825ebed..d8fa543 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -11,5 +11,5 @@ XPROTO_INPUTPROTO_AUTORECONF = NO
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_inputproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_inputproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index ecdabf1..9b30fbb 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -11,5 +11,5 @@ XPROTO_KBPROTO_AUTORECONF = NO
 XPROTO_KBPROTO_INSTALL_STAGING = YES
 XPROTO_KBPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_kbproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_kbproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_printproto/xproto_printproto.mk b/package/x11r7/xproto_printproto/xproto_printproto.mk
index c06c5c3..82ba821 100644
--- a/package/x11r7/xproto_printproto/xproto_printproto.mk
+++ b/package/x11r7/xproto_printproto/xproto_printproto.mk
@@ -11,4 +11,4 @@ XPROTO_PRINTPROTO_AUTORECONF = NO
 XPROTO_PRINTPROTO_INSTALL_STAGING = YES
 XPROTO_PRINTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_printproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index e6befea..cfbb213 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -11,4 +11,4 @@ XPROTO_RANDRPROTO_AUTORECONF = NO
 XPROTO_RANDRPROTO_INSTALL_STAGING = YES
 XPROTO_RANDRPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_randrproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_recordproto/xproto_recordproto.mk b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
index 83178bd..4c35605 100644
--- a/package/x11r7/xproto_recordproto/xproto_recordproto.mk
+++ b/package/x11r7/xproto_recordproto/xproto_recordproto.mk
@@ -11,4 +11,4 @@ XPROTO_RECORDPROTO_AUTORECONF = NO
 XPROTO_RECORDPROTO_INSTALL_STAGING = YES
 XPROTO_RECORDPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_recordproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index 1763efd..7960517 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -11,4 +11,4 @@ XPROTO_RENDERPROTO_AUTORECONF = NO
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES
 XPROTO_RENDERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_renderproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
index c5e0d47..0812978 100644
--- a/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
+++ b/package/x11r7/xproto_resourceproto/xproto_resourceproto.mk
@@ -11,4 +11,4 @@ XPROTO_RESOURCEPROTO_AUTORECONF = NO
 XPROTO_RESOURCEPROTO_INSTALL_STAGING = YES
 XPROTO_RESOURCEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_resourceproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
index f7f53e6..2705a3a 100644
--- a/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
+++ b/package/x11r7/xproto_scrnsaverproto/xproto_scrnsaverproto.mk
@@ -11,4 +11,4 @@ XPROTO_SCRNSAVERPROTO_AUTORECONF = NO
 XPROTO_SCRNSAVERPROTO_INSTALL_STAGING = YES
 XPROTO_SCRNSAVERPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_scrnsaverproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 3b98370..4dafe3b 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -11,4 +11,4 @@ XPROTO_VIDEOPROTO_AUTORECONF = NO
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES
 XPROTO_VIDEOPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_videoproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
index 827d797..bf0b59b 100644
--- a/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
+++ b/package/x11r7/xproto_windowswmproto/xproto_windowswmproto.mk
@@ -11,4 +11,4 @@ XPROTO_WINDOWSWMPROTO_AUTORECONF = NO
 XPROTO_WINDOWSWMPROTO_INSTALL_STAGING = YES
 XPROTO_WINDOWSWMPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_windowswmproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 1846f20..59f2592 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -11,5 +11,5 @@ XPROTO_XCMISCPROTO_AUTORECONF = NO
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
 XPROTO_XCMISCPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xcmiscproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xcmiscproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index 1fd39c9..0a61fb2 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -11,5 +11,5 @@ XPROTO_XEXTPROTO_AUTORECONF = NO
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
 XPROTO_XEXTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xextproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xextproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
index 1872873..d7524e6 100644
--- a/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
+++ b/package/x11r7/xproto_xf86bigfontproto/xproto_xf86bigfontproto.mk
@@ -11,5 +11,5 @@ XPROTO_XF86BIGFONTPROTO_AUTORECONF = NO
 XPROTO_XF86BIGFONTPROTO_INSTALL_STAGING = YES
 XPROTO_XF86BIGFONTPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86bigfontproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86bigfontproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
index d654a1c..41fcfed 100644
--- a/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
+++ b/package/x11r7/xproto_xf86dgaproto/xproto_xf86dgaproto.mk
@@ -11,4 +11,4 @@ XPROTO_XF86DGAPROTO_AUTORECONF = NO
 XPROTO_XF86DGAPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DGAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86dgaproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 4c37fa1..c8ec7fc 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -11,4 +11,4 @@ XPROTO_XF86DRIPROTO_AUTORECONF = NO
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES
 XPROTO_XF86DRIPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86driproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
index 032b839..d4145ec 100644
--- a/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
+++ b/package/x11r7/xproto_xf86rushproto/xproto_xf86rushproto.mk
@@ -11,4 +11,4 @@ XPROTO_XF86RUSHPROTO_AUTORECONF = NO
 XPROTO_XF86RUSHPROTO_INSTALL_STAGING = YES
 XPROTO_XF86RUSHPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86rushproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
index c3f3fe5..0910867 100644
--- a/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
+++ b/package/x11r7/xproto_xf86vidmodeproto/xproto_xf86vidmodeproto.mk
@@ -11,4 +11,4 @@ XPROTO_XF86VIDMODEPROTO_AUTORECONF = NO
 XPROTO_XF86VIDMODEPROTO_INSTALL_STAGING = YES
 XPROTO_XF86VIDMODEPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xf86vidmodeproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index bca3c8f..a73ded9 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -11,4 +11,4 @@ XPROTO_XINERAMAPROTO_AUTORECONF = NO
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES
 XPROTO_XINERAMAPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xineramaproto))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index c1e2449..65510e9 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -11,5 +11,5 @@ XPROTO_XPROTO_AUTORECONF = NO
 XPROTO_XPROTO_INSTALL_STAGING = YES
 XPROTO_XPROTO_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xproto))
-$(eval $(call AUTOTARGETS,package/x11r7,xproto_xproto,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 70ba8b2..54f98b7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -153,4 +153,4 @@ else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
 endif
 
-$(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
+$(eval $(call AUTOTARGETS))
diff --git a/package/x11r7/xutil_makedepend/xutil_makedepend.mk b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
index 660323d..657a2fc 100644
--- a/package/x11r7/xutil_makedepend/xutil_makedepend.mk
+++ b/package/x11r7/xutil_makedepend/xutil_makedepend.mk
@@ -13,5 +13,5 @@ XUTIL_MAKEDEPEND_INSTALL_TARGET = YES
 
 HOST_XUTIL_MAKEDEPEND_DEPENDENCIES = host-xproto_xproto
 
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend))
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_makedepend,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index b600a46..8bb7f8f 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -11,5 +11,5 @@ XUTIL_UTIL_MACROS_AUTORECONF = NO
 XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
 XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
 
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_util-macros))
-$(eval $(call AUTOTARGETS,package/x11r7,xutil_util-macros,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 9e1db05..b423f46 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -14,4 +14,4 @@ X11VNC_CONF_OPT = \
 
 X11VNC_DEPENDENCIES = xserver_xorg-server xlib_libXt
 
-$(eval $(call AUTOTARGETS,package,x11vnc))
+$(eval $(call AUTOTARGETS))
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 305fee3..2a8817c 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -23,4 +23,4 @@ else
 XERCES_CONF_OPT += --disable-network
 endif
 
-$(eval $(call AUTOTARGETS,package,xerces))
+$(eval $(call AUTOTARGETS))
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index d7613f8..bb42f5d 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -18,4 +18,4 @@ XMLSTARLET_CONF_OPT += --disable-static-libs \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
-$(eval $(call AUTOTARGETS,package,xmlstarlet))
+$(eval $(call AUTOTARGETS))
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
index f6795b5..16b45d7 100644
--- a/package/xstroke/xstroke.mk
+++ b/package/xstroke/xstroke.mk
@@ -9,5 +9,5 @@ XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
 
 XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm
 
-$(eval $(call AUTOTARGETS,package,xstroke))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index d5d193d..6fb29d9 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -10,4 +10,4 @@ XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
 XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-$(eval $(call AUTOTARGETS,package,xterm))
+$(eval $(call AUTOTARGETS))
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index fc66554..9d7d506 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -15,5 +15,5 @@ XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 
 XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
 
-$(eval $(call AUTOTARGETS,package,xvkbd))
+$(eval $(call AUTOTARGETS))
 
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index ed4734b..8f2e0f1 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -9,5 +9,5 @@ XZ_SITE = http://tukaani.org/xz/
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
-$(eval $(call AUTOTARGETS,package,xz))
-$(eval $(call AUTOTARGETS,package,xz,host))
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
