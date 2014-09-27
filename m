From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 27 Sep 2014 21:32:44 +0200
Subject: [Buildroot] [PATCH 07 of 15] packages: rename FOO_CONF_OPT into
	FOO_CONF_OPTS
In-Reply-To: <patchbomb.1411846357@localhost>
References: <patchbomb.1411846357@localhost>
Message-ID: <0c4d3dbcb36ecaeed371.1411846364@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
make the same change for FOO_CONF_OPT.

Sed command used:
   find * -type f | xargs sed -i 's#_CONF_OPT\>#&S#g'

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: rebase

 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk                     |    2 +-
 boot/grub/grub.mk                                                     |    2 +-
 boot/grub2/grub2.mk                                                   |    2 +-
 boot/gummiboot/gummiboot.mk                                           |    2 +-
 docs/manual/adding-packages-autotools.txt                             |    4 +-
 docs/manual/adding-packages-cmake.txt                                 |    4 +-
 docs/manual/adding-packages-perl.txt                                  |    2 +-
 docs/manual/writing-rules.txt                                         |    8 +-
 package/acl/acl.mk                                                    |    2 +-
 package/agentpp/agentpp.mk                                            |    2 +-
 package/alsa-lib/alsa-lib.mk                                          |   30 +-
 package/alsa-utils/alsa-utils.mk                                      |    4 +-
 package/apitrace/apitrace.mk                                          |    2 +-
 package/apr-util/apr-util.mk                                          |    2 +-
 package/at/at.mk                                                      |    2 +-
 package/atftp/atftp.mk                                                |   10 +-
 package/atk/atk.mk                                                    |    2 +-
 package/attr/attr.mk                                                  |    2 +-
 package/audiofile/audiofile.mk                                        |    6 +-
 package/aumix/aumix.mk                                                |    2 +-
 package/avahi/avahi.mk                                                |   20 +-
 package/bandwidthd/bandwidthd.mk                                      |   10 +-
 package/bash/bash.mk                                                  |    4 +-
 package/bcusdk/bcusdk.mk                                              |    2 +-
 package/beecrypt/beecrypt.mk                                          |    4 +-
 package/bind/bind.mk                                                  |   22 +-
 package/binutils/binutils.mk                                          |   10 +-
 package/blackbox/blackbox.mk                                          |    2 +-
 package/bluez5_utils/bluez5_utils.mk                                  |   26 +-
 package/bluez_utils/bluez_utils.mk                                    |   16 +-
 package/bmon/bmon.mk                                                  |    4 +-
 package/bootutils/bootutils.mk                                        |    2 +-
 package/bridge-utils/bridge-utils.mk                                  |    2 +-
 package/bwm-ng/bwm-ng.mk                                              |    4 +-
 package/cairo/cairo.mk                                                |   58 +-
 package/ccache/ccache.mk                                              |    2 +-
 package/cdrkit/cdrkit.mk                                              |   12 +-
 package/cegui06/cegui06.mk                                            |    2 +-
 package/celt051/celt051.mk                                            |    2 +-
 package/chrony/chrony.mk                                              |   10 +-
 package/cifs-utils/cifs-utils.mk                                      |    2 +-
 package/civetweb/civetweb.mk                                          |   10 +-
 package/clapack/clapack.mk                                            |    4 +-
 package/classpath/classpath.mk                                        |   24 +-
 package/cloog/cloog.mk                                                |    2 +-
 package/collectd/collectd.mk                                          |   12 +-
 package/connman/connman.mk                                            |    6 +-
 package/coreutils/coreutils.mk                                        |    2 +-
 package/cppcms/cppcms.mk                                              |    4 +-
 package/cppdb/cppdb.mk                                                |    2 +-
 package/ctorrent/ctorrent.mk                                          |    4 +-
 package/cups/cups.mk                                                  |   14 +-
 package/cvs/cvs.mk                                                    |    2 +-
 package/cwiid/cwiid.mk                                                |    6 +-
 package/dbus-cpp/dbus-cpp.mk                                          |   12 +-
 package/dbus-glib/dbus-glib.mk                                        |    4 +-
 package/dbus-python/dbus-python.mk                                    |    2 +-
 package/dbus/dbus.mk                                                  |   16 +-
 package/dhcp/dhcp.mk                                                  |    6 +-
 package/dialog/dialog.mk                                              |    4 +-
 package/dillo/dillo.mk                                                |   16 +-
 package/directfb/directfb.mk                                          |   54 +-
 package/distcc/distcc.mk                                              |    2 +-
 package/dmalloc/dmalloc.mk                                            |   10 +-
 package/dropbear/dropbear.mk                                          |    6 +-
 package/e2fsprogs/e2fsprogs.mk                                        |    2 +-
 package/ecryptfs-utils/ecryptfs-utils.mk                              |    6 +-
 package/ed/ed.mk                                                      |    2 +-
 package/efl/libecore/libecore.mk                                      |   36 +-
 package/efl/libedbus/libedbus.mk                                      |   12 +-
 package/efl/libedje/libedje.mk                                        |    6 +-
 package/efl/libeet/libeet.mk                                          |    4 +-
 package/efl/libelementary/libelementary.mk                            |    6 +-
 package/efl/libethumb/libethumb.mk                                    |    2 +-
 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk        |    6 +-
 package/efl/libevas/libevas.mk                                        |   90 +-
 package/elf2flt/elf2flt.mk                                            |    2 +-
 package/elfutils/elfutils.mk                                          |   18 +-
 package/enlightenment/enlightenment.mk                                |    2 +-
 package/enscript/enscript.mk                                          |    4 +-
 package/erlang/erlang.mk                                              |   16 +-
 package/eudev/eudev.mk                                                |    8 +-
 package/evemu/evemu.mk                                                |    6 +-
 package/expect/expect.mk                                              |    2 +-
 package/fbdump/fbdump.mk                                              |    4 +-
 package/fetchmail/fetchmail.mk                                        |    2 +-
 package/ffmpeg/ffmpeg.mk                                              |  148 +-
 package/flac/flac.mk                                                  |   10 +-
 package/flann/flann.mk                                                |    2 +-
 package/flickcurl/flickcurl.mk                                        |    2 +-
 package/flite/flite.mk                                                |    4 +-
 package/fltk/fltk.mk                                                  |    8 +-
 package/fluxbox/fluxbox.mk                                            |    6 +-
 package/fontconfig/fontconfig.mk                                      |    4 +-
 package/foomatic-filters/foomatic-filters.mk                          |    6 +-
 package/freerdp/freerdp.mk                                            |   28 +-
 package/freetype/freetype.mk                                          |   14 +-
 package/gamin/gamin.mk                                                |    4 +-
 package/gcc/gcc-final/gcc-final.mk                                    |   16 +-
 package/gcc/gcc-initial/gcc-initial.mk                                |    4 +-
 package/gcc/gcc.mk                                                    |   52 +-
 package/gd/gd.mk                                                      |   16 +-
 package/gdb/gdb.mk                                                    |   26 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                                      |   12 +-
 package/gettext/gettext.mk                                            |    6 +-
 package/giblib/giblib.mk                                              |    2 +-
 package/git/git.mk                                                    |   24 +-
 package/glib-networking/glib-networking.mk                            |    4 +-
 package/gmpc/gmpc.mk                                                  |    2 +-
 package/gnupg/gnupg.mk                                                |   12 +-
 package/gnupg2/gnupg2.mk                                              |    2 +-
 package/gnuplot/gnuplot.mk                                            |   10 +-
 package/gnutls/gnutls.mk                                              |   14 +-
 package/google-breakpad/google-breakpad.mk                            |    2 +-
 package/gpm/gpm.mk                                                    |    2 +-
 package/grep/grep.mk                                                  |    4 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk                            |    2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk                  |    4 +-
 package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk                  |  366 ++++----
 package/gstreamer/gst-plugins-base/gst-plugins-base.mk                |   98 +-
 package/gstreamer/gst-plugins-good/gst-plugins-good.mk                |  234 ++--
 package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk                |   46 +-
 package/gstreamer/gstreamer/gstreamer.mk                              |    2 +-
 package/gstreamer1/gst-omx/gst-omx.mk                                 |    4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk                           |    2 +-
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk               |  392 +++++-----
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk             |  102 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk             |  246 +++---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk             |   42 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk                           |    2 +-
 package/gtest/gtest.mk                                                |    2 +-
 package/gtk2-engines/gtk2-engines.mk                                  |    2 +-
 package/gutenprint/gutenprint.mk                                      |    4 +-
 package/gvfs/gvfs.mk                                                  |   22 +-
 package/harfbuzz/harfbuzz.mk                                          |   18 +-
 package/haserl/haserl.mk                                              |    4 +-
 package/heimdal/heimdal.mk                                            |    2 +-
 package/hiawatha/hiawatha.mk                                          |    6 +-
 package/hplip/hplip.mk                                                |    6 +-
 package/htop/htop.mk                                                  |    2 +-
 package/icu/icu.mk                                                    |    4 +-
 package/ifplugd/ifplugd.mk                                            |    2 +-
 package/igh-ethercat/igh-ethercat.mk                                  |   12 +-
 package/imagemagick/imagemagick.mk                                    |   42 +-
 package/imlib2/imlib2.mk                                              |   26 +-
 package/iperf/iperf.mk                                                |    2 +-
 package/ipmitool/ipmitool.mk                                          |    2 +-
 package/ipsec-tools/ipsec-tools.mk                                    |   30 +-
 package/ipset/ipset.mk                                                |    2 +-
 package/iptables/iptables.mk                                          |    2 +-
 package/jamvm/jamvm.mk                                                |    2 +-
 package/joe/joe.mk                                                    |    4 +-
 package/jpeg-turbo/jpeg-turbo.mk                                      |    6 +-
 package/json-c/json-c.mk                                              |    2 +-
 package/kbd/kbd.mk                                                    |    2 +-
 package/kexec/kexec.mk                                                |    4 +-
 package/kismet/kismet.mk                                              |    2 +-
 package/kmod/kmod.mk                                                  |   14 +-
 package/knock/knock.mk                                                |    2 +-
 package/lame/lame.mk                                                  |    4 +-
 package/lbreakout2/lbreakout2.mk                                      |    8 +-
 package/lcdproc/lcdproc.mk                                            |    4 +-
 package/lcms2/lcms2.mk                                                |   14 +-
 package/lesstif/lesstif.mk                                            |    2 +-
 package/lftp/lftp.mk                                                  |   10 +-
 package/libao/libao.mk                                                |    6 +-
 package/libarchive/libarchive.mk                                      |   32 +-
 package/libargtable2/libargtable2.mk                                  |    2 +-
 package/libass/libass.mk                                              |   12 +-
 package/libassuan/libassuan.mk                                        |    2 +-
 package/libbluray/libbluray.mk                                        |    4 +-
 package/libcap-ng/libcap-ng.mk                                        |    2 +-
 package/libcdio/libcdio.mk                                            |    6 +-
 package/libcec/libcec.mk                                              |    4 +-
 package/libcgicc/libcgicc.mk                                          |    2 +-
 package/libcgroup/libcgroup.mk                                        |    6 +-
 package/libconfig/libconfig.mk                                        |    4 +-
 package/libconfuse/libconfuse.mk                                      |    2 +-
 package/libcurl/libcurl.mk                                            |   14 +-
 package/libdaemon/libdaemon.mk                                        |    2 +-
 package/libdnet/libdnet.mk                                            |    4 +-
 package/libdrm/libdrm.mk                                              |   36 +-
 package/libdvdnav/libdvdnav.mk                                        |    2 +-
 package/libeXosip2/libeXosip2.mk                                      |    6 +-
 package/libedit/libedit.mk                                            |    2 +-
 package/libexif/libexif.mk                                            |    2 +-
 package/libftdi/libftdi.mk                                            |    6 +-
 package/libfuse/libfuse.mk                                            |    2 +-
 package/libgail/libgail.mk                                            |    2 +-
 package/libgcrypt/libgcrypt.mk                                        |    2 +-
 package/libglib2/libglib2.mk                                          |   12 +-
 package/libgpgme/libgpgme.mk                                          |    2 +-
 package/libgtk2/libgtk2.mk                                            |   22 +-
 package/libhid/libhid.mk                                              |    2 +-
 package/libidn/libidn.mk                                              |    2 +-
 package/libinput/libinput.mk                                          |    2 +-
 package/libksba/libksba.mk                                            |    2 +-
 package/liblockfile/liblockfile.mk                                    |    2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk                      |    2 +-
 package/liblogging/liblogging.mk                                      |    6 +-
 package/libmad/libmad.mk                                              |    2 +-
 package/libmbim/libmbim.mk                                            |    2 +-
 package/libmemcached/libmemcached.mk                                  |    2 +-
 package/libmicrohttpd/libmicrohttpd.mk                                |    8 +-
 package/libmpeg2/libmpeg2.mk                                          |    6 +-
 package/libndp/libndp.mk                                              |    2 +-
 package/libnfc/libnfc.mk                                              |    6 +-
 package/libnftnl/libnftnl.mk                                          |    8 +-
 package/libnl/libnl.mk                                                |    4 +-
 package/libnspr/libnspr.mk                                            |   10 +-
 package/liboauth/liboauth.mk                                          |    2 +-
 package/liboping/liboping.mk                                          |    2 +-
 package/libosip2/libosip2.mk                                          |    2 +-
 package/libpcap/libpcap.mk                                            |   14 +-
 package/libphidget/libphidget.mk                                      |    2 +-
 package/libplayer/libplayer.mk                                        |   12 +-
 package/libpng/libpng.mk                                              |    2 +-
 package/libpthsem/libpthsem.mk                                        |    4 +-
 package/libqmi/libqmi.mk                                              |    2 +-
 package/libqrencode/libqrencode.mk                                    |    6 +-
 package/libraw/libraw.mk                                              |    2 +-
 package/libroxml/libroxml.mk                                          |    2 +-
 package/librsvg/librsvg.mk                                            |    2 +-
 package/librtlsdr/librtlsdr.mk                                        |    4 +-
 package/libsamplerate/libsamplerate.mk                                |    2 +-
 package/libsecret/libsecret.mk                                        |    6 +-
 package/libsoc/libsoc.mk                                              |    2 +-
 package/libsoup/libsoup.mk                                            |    8 +-
 package/libsoxr/libsoxr.mk                                            |    8 +-
 package/libssh2/libssh2.mk                                            |   10 +-
 package/libstrophe/libstrophe.mk                                      |    2 +-
 package/libsvg-cairo/libsvg-cairo.mk                                  |    2 +-
 package/libsvg/libsvg.mk                                              |    4 +-
 package/libtheora/libtheora.mk                                        |    2 +-
 package/libtirpc/libtirpc.mk                                          |    2 +-
 package/libtorrent/libtorrent.mk                                      |    2 +-
 package/libubox/libubox.mk                                            |    4 +-
 package/libuci/libuci.mk                                              |    4 +-
 package/libungif/libungif.mk                                          |    2 +-
 package/libusb/libusb.mk                                              |    6 +-
 package/libv4l/libv4l.mk                                              |    8 +-
 package/libva-intel-driver/libva-intel-driver.mk                      |    8 +-
 package/libva/libva.mk                                                |   18 +-
 package/libvncserver/libvncserver.mk                                  |   16 +-
 package/libvorbis/libvorbis.mk                                        |    2 +-
 package/libvpx/libvpx.mk                                              |    4 +-
 package/libwebsockets/libwebsockets.mk                                |    4 +-
 package/libxml2/libxml2.mk                                            |   12 +-
 package/libxmlrpc/libxmlrpc.mk                                        |    2 +-
 package/libxslt/libxslt.mk                                            |    6 +-
 package/lighttpd/lighttpd.mk                                          |   26 +-
 package/linknx/linknx.mk                                              |   10 +-
 package/links/links.mk                                                |   10 +-
 package/linphone/linphone.mk                                          |    6 +-
 package/linux-pam/linux-pam.mk                                        |    2 +-
 package/linux-zigbee/linux-zigbee.mk                                  |    8 +-
 package/localedef/localedef.mk                                        |    2 +-
 package/log4cxx/log4cxx.mk                                            |    2 +-
 package/lrzsz/lrzsz.mk                                                |    2 +-
 package/ltrace/ltrace.mk                                              |    6 +-
 package/ltris/ltris.mk                                                |    4 +-
 package/lttng-tools/lttng-tools.mk                                    |    6 +-
 package/lua-ev/lua-ev.mk                                              |    2 +-
 package/luaposix/luaposix.mk                                          |    2 +-
 package/luarocks/luarocks.mk                                          |    6 +-
 package/lvm2/lvm2.mk                                                  |    8 +-
 package/lxc/lxc.mk                                                    |    2 +-
 package/lzma/lzma.mk                                                  |    2 +-
 package/m4/m4.mk                                                      |    2 +-
 package/madplay/madplay.mk                                            |    2 +-
 package/matchbox/matchbox-common/matchbox-common.mk                   |    2 +-
 package/matchbox/matchbox-desktop/matchbox-desktop.mk                 |    6 +-
 package/matchbox/matchbox-fakekey/matchbox-fakekey.mk                 |    2 +-
 package/matchbox/matchbox-keyboard/matchbox-keyboard.mk               |    2 +-
 package/matchbox/matchbox-lib/matchbox-lib.mk                         |   18 +-
 package/matchbox/matchbox-panel/matchbox-panel.mk                     |    6 +-
 package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk |    2 +-
 package/matchbox/matchbox-wm/matchbox-wm.mk                           |    8 +-
 package/mcrypt/mcrypt.mk                                              |    2 +-
 package/media-ctl/media-ctl.mk                                        |    2 +-
 package/mediastreamer/mediastreamer.mk                                |   42 +-
 package/memcached/memcached.mk                                        |    2 +-
 package/mesa3d/mesa3d.mk                                              |   32 +-
 package/metacity/metacity.mk                                          |    2 +-
 package/minidlna/minidlna.mk                                          |    2 +-
 package/modem-manager/modem-manager.mk                                |    8 +-
 package/monit/monit.mk                                                |   10 +-
 package/mpd/mpd.mk                                                    |   90 +-
 package/mpdecimal/mpdecimal.mk                                        |    2 +-
 package/mpg123/mpg123.mk                                              |   14 +-
 package/msmtp/msmtp.mk                                                |    8 +-
 package/mtools/mtools.mk                                              |    2 +-
 package/mtr/mtr.mk                                                    |    2 +-
 package/mutt/mutt.mk                                                  |   18 +-
 package/mysql/mysql.mk                                                |   12 +-
 package/nano/nano.mk                                                  |    4 +-
 package/nbd/nbd.mk                                                    |    2 +-
 package/ncurses/ncurses.mk                                            |    8 +-
 package/ndisc6/ndisc6.mk                                              |    2 +-
 package/ne10/ne10.mk                                                  |    4 +-
 package/neard/neard.mk                                                |    4 +-
 package/neon/neon.mk                                                  |   20 +-
 package/netatalk/netatalk.mk                                          |   12 +-
 package/netperf/netperf.mk                                            |    2 +-
 package/netsnmp/netsnmp.mk                                            |   16 +-
 package/nettle/nettle.mk                                              |    8 +-
 package/network-manager/network-manager.mk                            |   20 +-
 package/newt/newt.mk                                                  |    2 +-
 package/nfs-utils/nfs-utils.mk                                        |    6 +-
 package/ngrep/ngrep.mk                                                |    2 +-
 package/nmap/nmap.mk                                                  |    8 +-
 package/nss-mdns/nss-mdns.mk                                          |    2 +-
 package/ntfs-3g/ntfs-3g.mk                                            |    8 +-
 package/ntp/ntp.mk                                                    |   10 +-
 package/nut/nut.mk                                                    |   34 +-
 package/ofono/ofono.mk                                                |   10 +-
 package/ola/ola.mk                                                    |   74 +-
 package/omniorb/omniorb.mk                                            |    8 +-
 package/opencv/opencv.mk                                              |   72 +-
 package/openntpd/openntpd.mk                                          |    2 +-
 package/openobex/openobex.mk                                          |   10 +-
 package/openocd/openocd.mk                                            |   10 +-
 package/openpowerlink/openpowerlink.mk                                |   38 +-
 package/openssh/openssh.mk                                            |    6 +-
 package/openvmtools/openvmtools.mk                                    |   14 +-
 package/openvpn/openvpn.mk                                            |   10 +-
 package/opkg/opkg.mk                                                  |    6 +-
 package/oprofile/oprofile.mk                                          |    2 +-
 package/opus-tools/opus-tools.mk                                      |    8 +-
 package/opus/opus.mk                                                  |    4 +-
 package/ortp/ortp.mk                                                  |    2 +-
 package/p11-kit/p11-kit.mk                                            |    2 +-
 package/pango/pango.mk                                                |    6 +-
 package/parted/parted.mk                                              |   12 +-
 package/pcmanfm/pcmanfm.mk                                            |    2 +-
 package/pcre/pcre.mk                                                  |   12 +-
 package/pcsc-lite/pcsc-lite.mk                                        |   10 +-
 package/perl-gd/perl-gd.mk                                            |    2 +-
 package/perl-xml-libxml/perl-xml-libxml.mk                            |    2 +-
 package/perl-xml-parser/perl-xml-parser.mk                            |    2 +-
 package/perl/perl.mk                                                  |   12 +-
 package/php-geoip/php-geoip.mk                                        |    2 +-
 package/php-gnupg/php-gnupg.mk                                        |    2 +-
 package/php-imagick/php-imagick.mk                                    |    2 +-
 package/php-memcached/php-memcached.mk                                |    2 +-
 package/php-ssh2/php-ssh2.mk                                          |    2 +-
 package/php-yaml/php-yaml.mk                                          |    2 +-
 package/php-zmq/php-zmq.mk                                            |    2 +-
 package/php/php.mk                                                    |   64 +-
 package/pinentry/pinentry.mk                                          |   24 +-
 package/pixman/pixman.mk                                              |    4 +-
 package/pkg-autotools.mk                                              |    6 +-
 package/pkg-cmake.mk                                                  |    6 +-
 package/pkg-perl.mk                                                   |    8 +-
 package/poco/poco.mk                                                  |    6 +-
 package/polarssl/polarssl.mk                                          |    2 +-
 package/polkit/polkit.mk                                              |    2 +-
 package/poppler/poppler.mk                                            |   30 +-
 package/popt/popt.mk                                                  |    2 +-
 package/portaudio/portaudio.mk                                        |    2 +-
 package/postgresql/postgresql.mk                                      |   12 +-
 package/powerpc-utils/powerpc-utils.mk                                |    2 +-
 package/prboom/prboom.mk                                              |    2 +-
 package/procps-ng/procps-ng.mk                                        |    4 +-
 package/proftpd/proftpd.mk                                            |    4 +-
 package/protobuf-c/protobuf-c.mk                                      |    2 +-
 package/protobuf/protobuf.mk                                          |    2 +-
 package/psmisc/psmisc.mk                                              |    2 +-
 package/ptpd2/ptpd2.mk                                                |    4 +-
 package/pulseaudio/pulseaudio.mk                                      |   18 +-
 package/python/python.mk                                              |   26 +-
 package/python3/python3.mk                                            |   24 +-
 package/quagga/quagga.mk                                              |   28 +-
 package/rdesktop/rdesktop.mk                                          |    4 +-
 package/rp-pppoe/rp-pppoe.mk                                          |    2 +-
 package/rpcbind/rpcbind.mk                                            |    2 +-
 package/rpi-userland/rpi-userland.mk                                  |    2 +-
 package/rpm/rpm.mk                                                    |   14 +-
 package/rrdtool/rrdtool.mk                                            |    2 +-
 package/rsync/rsync.mk                                                |    4 +-
 package/rsyslog/rsyslog.mk                                            |    6 +-
 package/rtai/rtai.mk                                                  |    2 +-
 package/ruby/ruby.mk                                                  |    8 +-
 package/samba/samba.mk                                                |    8 +-
 package/samba4/samba4.mk                                              |   32 +-
 package/sane-backends/sane-backends.mk                                |    8 +-
 package/sconeserver/sconeserver.mk                                    |   56 +-
 package/sdl/sdl.mk                                                    |   22 +-
 package/sdl_gfx/sdl_gfx.mk                                            |    6 +-
 package/sdl_image/sdl_image.mk                                        |    4 +-
 package/sdl_mixer/sdl_mixer.mk                                        |   10 +-
 package/sdl_net/sdl_net.mk                                            |    2 +-
 package/sdl_sound/sdl_sound.mk                                        |    6 +-
 package/sdl_ttf/sdl_ttf.mk                                            |    2 +-
 package/sed/sed.mk                                                    |    2 +-
 package/shared-mime-info/shared-mime-info.mk                          |    4 +-
 package/sispmctl/sispmctl.mk                                          |    2 +-
 package/slang/slang.mk                                                |   16 +-
 package/smcroute/smcroute.mk                                          |    2 +-
 package/snmppp/snmppp.mk                                              |    6 +-
 package/socat/socat.mk                                                |    4 +-
 package/socketcand/socketcand.mk                                      |    2 +-
 package/sox/sox.mk                                                    |   30 +-
 package/spawn-fcgi/spawn-fcgi.mk                                      |    2 +-
 package/speex/speex.mk                                                |    6 +-
 package/spice/spice.mk                                                |   16 +-
 package/sqlcipher/sqlcipher.mk                                        |    6 +-
 package/sqlite/sqlite.mk                                              |   12 +-
 package/squid/squid.mk                                                |    4 +-
 package/startup-notification/startup-notification.mk                  |    2 +-
 package/stress/stress.mk                                              |    2 +-
 package/strongswan/strongswan.mk                                      |    4 +-
 package/stunnel/stunnel.mk                                            |    2 +-
 package/subversion/subversion.mk                                      |    2 +-
 package/sudo/sudo.mk                                                  |    2 +-
 package/swig/swig.mk                                                  |    2 +-
 package/sylpheed/sylpheed.mk                                          |    6 +-
 package/synergy/synergy.mk                                            |    2 +-
 package/sysstat/sysstat.mk                                            |    2 +-
 package/systemd/systemd.mk                                            |   36 +-
 package/taglib/taglib.mk                                              |    4 +-
 package/tcl/tcl.mk                                                    |    4 +-
 package/tcpdump/tcpdump.mk                                            |    2 +-
 package/tcpreplay/tcpreplay.mk                                        |    2 +-
 package/tftpd/tftpd.mk                                                |    4 +-
 package/thrift/thrift.mk                                              |   12 +-
 package/tiff/tiff.mk                                                  |   26 +-
 package/tn5250/tn5250.mk                                              |    4 +-
 package/torsmo/torsmo.mk                                              |    2 +-
 package/transmission/transmission.mk                                  |   22 +-
 package/udisks/udisks.mk                                              |    4 +-
 package/ulogd/ulogd.mk                                                |    8 +-
 package/urg/urg.mk                                                    |    4 +-
 package/usbutils/usbutils.mk                                          |    2 +-
 package/util-linux/util-linux.mk                                      |   10 +-
 package/valgrind/valgrind.mk                                          |    4 +-
 package/vde2/vde2.mk                                                  |    2 +-
 package/vim/vim.mk                                                    |    2 +-
 package/vlc/vlc.mk                                                    |  140 +-
 package/vo-aacenc/vo-aacenc.mk                                        |    8 +-
 package/vorbis-tools/vorbis-tools.mk                                  |    2 +-
 package/vtun/vtun.mk                                                  |    2 +-
 package/wayland/wayland.mk                                            |    2 +-
 package/webkit/webkit.mk                                              |   12 +-
 package/webp/webp.mk                                                  |    2 +-
 package/webrtc-audio-processing/webrtc-audio-processing.mk            |    2 +-
 package/weston/weston.mk                                              |   16 +-
 package/wget/wget.mk                                                  |    6 +-
 package/wireshark/wireshark.mk                                        |    2 +-
 package/wvstreams/wvstreams.mk                                        |   16 +-
 package/x11r7/libxcb/libxcb.mk                                        |    4 +-
 package/x11r7/xapp_xdm/xapp_xdm.mk                                    |    2 +-
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk                          |    8 +-
 package/x11r7/xapp_xrandr/xapp_xrandr.mk                              |    2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk    |   14 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk                    |    2 +-
 package/x11r7/xlib_libFS/xlib_libFS.mk                                |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk                                |    2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk                              |    4 +-
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk                |    2 +-
 package/x11r7/xlib_libXaw/xlib_libXaw.mk                              |    2 +-
 package/x11r7/xlib_libXext/xlib_libXext.mk                            |    2 +-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk                          |    4 +-
 package/x11r7/xlib_libXi/xlib_libXi.mk                                |    2 +-
 package/x11r7/xlib_libXinerama/xlib_libXinerama.mk                    |    2 +-
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk                        |    2 +-
 package/x11r7/xlib_libXrender/xlib_libXrender.mk                      |    2 +-
 package/x11r7/xlib_libXres/xlib_libXres.mk                            |    2 +-
 package/x11r7/xlib_libXt/xlib_libXt.mk                                |    2 +-
 package/x11r7/xlib_libXv/xlib_libXv.mk                                |    2 +-
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk                            |    2 +-
 package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk                    |    2 +-
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk                      |    2 +-
 package/x11r7/xlib_libdmx/xlib_libdmx.mk                              |    2 +-
 package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk                |    4 +-
 package/x11r7/xproto_xextproto/xproto_xextproto.mk                    |    4 +-
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk              |   72 +-
 package/x11vnc/x11vnc.mk                                              |   20 +-
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk                            |    6 +-
 package/xbmc/xbmc.mk                                                  |   72 +-
 package/xenomai/xenomai.mk                                            |    2 +-
 package/xerces/xerces.mk                                              |    6 +-
 package/xfsprogs/xfsprogs.mk                                          |    2 +-
 package/xmlstarlet/xmlstarlet.mk                                      |    6 +-
 package/xscreensaver/xscreensaver.mk                                  |    2 +-
 package/zeromq/zeromq.mk                                              |    4 +-
 package/znc/znc.mk                                                    |   18 +-
 487 files changed, 2857 insertions(+), 2857 deletions(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -26,7 +26,7 @@
 
 BOOT_WRAPPER_AARCH64_PRE_PATCH_HOOKS += BOOT_WRAPPER_AARCH64_FIX_DTB_NAME
 
-BOOT_WRAPPER_AARCH64_CONF_OPT = \
+BOOT_WRAPPER_AARCH64_CONF_OPTS = \
 	--with-kernel-dir=$(LINUX_DIR) \
 	--with-cmdline=$(BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS)
 
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -75,7 +75,7 @@
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS) $(GRUB_CFLAGS) -m32"
 
-GRUB_CONF_OPT = \
+GRUB_CONF_OPTS = \
 	--disable-auto-linux-mem-opt \
 	$(GRUB_CONFIG-y)
 
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -50,7 +50,7 @@
 	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
 	TARGET_CPPFLAGS="$(TARGET_CPPFLAGS)"
 
-GRUB2_CONF_OPT = \
+GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
 	--with-platform=$(GRUB2_PLATFORM) \
 	--disable-grub-mkfont \
diff --git a/boot/gummiboot/gummiboot.mk b/boot/gummiboot/gummiboot.mk
--- a/boot/gummiboot/gummiboot.mk
+++ b/boot/gummiboot/gummiboot.mk
@@ -21,7 +21,7 @@
 GUMMIBOOT_IMGARCH = x64
 endif
 
-GUMMIBOOT_CONF_OPT = \
+GUMMIBOOT_CONF_OPTS = \
 	--host=$(BR2_ARCH) \
 	--with-efi-libdir=$(STAGING_DIR)/usr/lib \
 	--with-efi-ldsdir=$(STAGING_DIR)/usr/lib \
diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -22,7 +22,7 @@
 09: LIBFOO_SITE = http://www.foosoftware.org/download
 10: LIBFOO_INSTALL_STAGING = YES
 11: LIBFOO_INSTALL_TARGET = NO
-12: LIBFOO_CONF_OPT = --disable-shared
+12: LIBFOO_CONF_OPTS = --disable-shared
 13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 14:
 15: $(eval $(autotools-package))
@@ -96,7 +96,7 @@
 * +LIBFOO_CONF_ENV+, to specify additional environment
   variables to pass to the configure script. By default, empty.
 
-* +LIBFOO_CONF_OPT+, to specify additional configure
+* +LIBFOO_CONF_OPTS+, to specify additional configure
   options to pass to the configure script. By default, empty.
 
 * +LIBFOO_MAKE+, to specify an alternate +make+
diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -22,7 +22,7 @@
 09: LIBFOO_SITE = http://www.foosoftware.org/download
 10: LIBFOO_INSTALL_STAGING = YES
 11: LIBFOO_INSTALL_TARGET = NO
-12: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
+12: LIBFOO_CONF_OPTS = -DBUILD_DEMOS=ON
 13: LIBFOO_DEPENDENCIES = libglib2 host-pkgconf
 14:
 15: $(eval $(cmake-package))
@@ -94,7 +94,7 @@
 * +LIBFOO_CONF_ENV+, to specify additional environment variables to
   pass to CMake. By default, empty.
 
-* +LIBFOO_CONF_OPT+, to specify additional configure options to pass
+* +LIBFOO_CONF_OPTS+, to specify additional configure options to pass
   to CMake. By default, empty.
 
 * +LIBFOO_MAKE+, to specify an alternate +make+ command. This is
diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -101,7 +101,7 @@
   environment variables to pass to the +perl Makefile.PL+ or +perl Build.PL+.
   By default, empty.
 
-* +PERL_FOO_CONF_OPT+/+HOST_PERL_FOO_CONF_OPT+, to specify additional
+* +PERL_FOO_CONF_OPTS+/+HOST_PERL_FOO_CONF_OPTS+, to specify additional
   configure options to pass to the +perl Makefile.PL+ or +perl Build.PL+.
   By default, empty.
 
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -65,7 +65,7 @@
 +
 ---------------------
 LIBFOO_VERSION = 1.0
-LIBFOO_CONF_OPT += --without-python-support
+LIBFOO_CONF_OPTS += --without-python-support
 ---------------------
 +
 Do not align the +=+ signs.
@@ -90,17 +90,17 @@
 +
 ---------------------
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-LIBFOO_CONF_OPT += --with-python-support
+LIBFOO_CONF_OPTS += --with-python-support
 LIBFOO_DEPENDENCIES += python
 else
-LIBFOO_CONF_OPT += --without-python-support
+LIBFOO_CONF_OPTS += --without-python-support
 endif
 ---------------------
 +
 NO:
 +
 ---------------------
-LIBFOO_CONF_OPT += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
+LIBFOO_CONF_OPTS += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
 LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)
 ---------------------
 
diff --git a/package/acl/acl.mk b/package/acl/acl.mk
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -9,7 +9,7 @@
 ACL_SITE = http://download.savannah.gnu.org/releases/acl
 ACL_INSTALL_STAGING = YES
 ACL_DEPENDENCIES = attr
-ACL_CONF_OPT = --enable-gettext=no
+ACL_CONF_OPTS = --enable-gettext=no
 ACL_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
diff --git a/package/agentpp/agentpp.mk b/package/agentpp/agentpp.mk
--- a/package/agentpp/agentpp.mk
+++ b/package/agentpp/agentpp.mk
@@ -11,7 +11,7 @@
 AGENTPP_LICENSE_FILES = LICENSE-2_0.txt
 AGENTPP_INSTALL_STAGING = YES
 AGENTPP_DEPENDENCIES = host-pkgconf snmppp
-AGENTPP_CONF_OPT += \
+AGENTPP_CONF_OPTS += \
 	--disable-proxy \
 	--disable-forwarder \
 	--disable-rpath
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -12,45 +12,45 @@
 ALSA_LIB_INSTALL_STAGING = YES
 ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
 ALSA_LIB_AUTORECONF = YES
-ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
+ALSA_LIB_CONF_OPTS = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 		    --with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))" \
 		    --without-versioned
 
 # Can't build with static & shared at the same time (1.0.25+)
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-ALSA_LIB_CONF_OPT += --enable-shared=no
+ALSA_LIB_CONF_OPTS += --enable-shared=no
 else
-ALSA_LIB_CONF_OPT += --enable-static=no
+ALSA_LIB_CONF_OPTS += --enable-static=no
 endif
 
 ifneq ($(BR2_PACKAGE_ALSA_LIB_ALOAD),y)
-ALSA_LIB_CONF_OPT += --disable-aload
+ALSA_LIB_CONF_OPTS += --disable-aload
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_MIXER),y)
-ALSA_LIB_CONF_OPT += --disable-mixer
+ALSA_LIB_CONF_OPTS += --disable-mixer
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
-ALSA_LIB_CONF_OPT += --disable-pcm
+ALSA_LIB_CONF_OPTS += --disable-pcm
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_RAWMIDI),y)
-ALSA_LIB_CONF_OPT += --disable-rawmidi
+ALSA_LIB_CONF_OPTS += --disable-rawmidi
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_HWDEP),y)
-ALSA_LIB_CONF_OPT += --disable-hwdep
+ALSA_LIB_CONF_OPTS += --disable-hwdep
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
-ALSA_LIB_CONF_OPT += --disable-seq
+ALSA_LIB_CONF_OPTS += --disable-seq
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_ALISP),y)
-ALSA_LIB_CONF_OPT += --disable-alisp
+ALSA_LIB_CONF_OPTS += --disable-alisp
 endif
 ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
-ALSA_LIB_CONF_OPT += --disable-old-symbols
+ALSA_LIB_CONF_OPTS += --disable-old-symbols
 endif
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-ALSA_LIB_CONF_OPT += --enable-debug
+ALSA_LIB_CONF_OPTS += --enable-debug
 endif
 
 ifeq ($(BR2_avr32),y)
@@ -58,17 +58,17 @@
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
-ALSA_LIB_CONF_OPT += \
+ALSA_LIB_CONF_OPTS += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python
 else
-ALSA_LIB_CONF_OPT += --disable-python
+ALSA_LIB_CONF_OPTS += --disable-python
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-ALSA_LIB_CONF_OPT += --with-softfloat
+ALSA_LIB_CONF_OPTS += --with-softfloat
 endif
 
 ifeq ($(BR2_bfin),y)
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -16,12 +16,12 @@
 ALSA_UTILS_CONF_ENV = \
 	ac_cv_prog_ncurses5_config=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
-ALSA_UTILS_CONF_OPT = \
+ALSA_UTILS_CONF_OPTS = \
 	--disable-xmlto \
 	--with-curses=$(if $(BR2_PACKAGE_NCURSES_WCHAR),ncursesw,ncurses)
 
 ifneq ($(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER),y)
-ALSA_UTILS_CONF_OPT += --disable-alsamixer --disable-alsatest
+ALSA_UTILS_CONF_OPTS += --disable-alsamixer --disable-alsatest
 endif
 
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -12,6 +12,6 @@
 APITRACE_DEPENDENCIES = xlib_libX11 host-python
 
 # Gui was never tested, so we prefer to explicitly disable it
-APITRACE_CONF_OPT += -DENABLE_GUI=false
+APITRACE_CONF_OPTS += -DENABLE_GUI=false
 
 $(eval $(cmake-package))
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -10,7 +10,7 @@
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
 APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
-APR_UTIL_CONF_OPT = \
+APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 
diff --git a/package/at/at.mk b/package/at/at.mk
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -14,7 +14,7 @@
 AT_LICENSE = GPLv2+, GPLv3+, ISC
 AT_LICENSE_FILES = Copyright COPYING
 
-AT_CONF_OPT = \
+AT_CONF_OPTS = \
         --with-jobdir=/var/spool/cron/atjobs \
         --with-atspool=/var/spool/cron/atspool \
         --with-daemon_username=root \
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -8,25 +8,25 @@
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPLv2+
 ATFTP_LICENSE_FILES = LICENSE
-ATFTP_CONF_OPT = --disable-libwrap --disable-mtftp
+ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
 ATFTP_CONF_ENV = LIBS="$(ATFTP_LIBS)"
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 ATFTP_DEPENDENCIES += readline
-ATFTP_CONF_OPT += --enable-libreadline
+ATFTP_CONF_OPTS += --enable-libreadline
 # For static, readline links with ncurses
 ATFTP_LIBS += -lncurses
 else
-ATFTP_CONF_OPT += --disable-libreadline
+ATFTP_CONF_OPTS += --disable-libreadline
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 ATFTP_DEPENDENCIES += pcre
-ATFTP_CONF_OPT += --enable-libpcre
+ATFTP_CONF_OPTS += --enable-libpcre
 else
-ATFTP_CONF_OPT += --disable-libpcre
+ATFTP_CONF_OPTS += --disable-libpcre
 endif
 
 $(eval $(autotools-package))
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,7 +41,7 @@
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
-ATK_CONF_OPT =  --disable-glibtest --enable-explicit-deps=no \
+ATK_CONF_OPTS =  --disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
 ATK_DEPENDENCIES = libglib2 host-pkgconf
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -8,7 +8,7 @@
 ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
-ATTR_CONF_OPT = --enable-gettext=no
+ATTR_CONF_OPTS = --enable-gettext=no
 ATTR_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
diff --git a/package/audiofile/audiofile.mk b/package/audiofile/audiofile.mk
--- a/package/audiofile/audiofile.mk
+++ b/package/audiofile/audiofile.mk
@@ -8,7 +8,7 @@
 AUDIOFILE_SITE = http://audiofile.68k.org
 AUDIOFILE_INSTALL_STAGING = YES
 AUDIOFILE_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-AUDIOFILE_CONF_OPT = --disable-examples --disable-docs
+AUDIOFILE_CONF_OPTS = --disable-examples --disable-docs
 AUDIOFILE_DEPENDENCIES = host-pkgconf
 # configure is outdated and has old bugs because of it
 AUDIOFILE_AUTORECONF = YES
@@ -17,9 +17,9 @@
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 AUDIOFILE_DEPENDENCIES += flac
-AUDIOFILE_CONF_OPT += --enable-flac
+AUDIOFILE_CONF_OPTS += --enable-flac
 else
-AUDIOFILE_CONF_OPT += --disable-flac
+AUDIOFILE_CONF_OPTS += --disable-flac
 endif
 
 $(eval $(autotools-package))
diff --git a/package/aumix/aumix.mk b/package/aumix/aumix.mk
--- a/package/aumix/aumix.mk
+++ b/package/aumix/aumix.mk
@@ -11,7 +11,7 @@
 AUMIX_LICENSE = GPLv2+
 AUMIX_LICENSE_FILES = COPYING
 
-AUMIX_CONF_OPT = \
+AUMIX_CONF_OPTS = \
 	--without-gtk \
 	--without-gtk1 \
 	--without-alsa \
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -67,7 +67,7 @@
 		avahi_cv_sys_cxx_works=yes \
 		DATADIRNAME=share
 
-AVAHI_CONF_OPT = --localstatedir=/var \
+AVAHI_CONF_OPTS = --localstatedir=/var \
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gdbm \
@@ -91,36 +91,36 @@
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
 else
-AVAHI_CONF_OPT += --disable-libdaemon
+AVAHI_CONF_OPTS += --disable-libdaemon
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_DEPENDENCIES += expat
-AVAHI_CONF_OPT += --with-xml=expat
+AVAHI_CONF_OPTS += --with-xml=expat
 else
-AVAHI_CONF_OPT += --with-xml=none
+AVAHI_CONF_OPTS += --with-xml=none
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
-AVAHI_CONF_OPT += --enable-compat-libdns_sd
+AVAHI_CONF_OPTS += --enable-compat-libdns_sd
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 AVAHI_DEPENDENCIES += dbus
 else
-AVAHI_CONF_OPT += --disable-dbus
+AVAHI_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 AVAHI_DEPENDENCIES += libglib2
 else
-AVAHI_CONF_OPT += --disable-glib --disable-gobject
+AVAHI_CONF_OPTS += --disable-glib --disable-gobject
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLADE),y)
 AVAHI_DEPENDENCIES += libglade
 else
-AVAHI_CONF_OPT += --disable-gtk
+AVAHI_CONF_OPTS += --disable-gtk
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
@@ -133,9 +133,9 @@
 		py_cv_mod_socket_=yes
 
 AVAHI_DEPENDENCIES += python
-AVAHI_CONF_OPT += --enable-python
+AVAHI_CONF_OPTS += --enable-python
 else
-AVAHI_CONF_OPT += --disable-python
+AVAHI_CONF_OPTS += --disable-python
 endif
 
 AVAHI_MAKE_OPTS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -15,20 +15,20 @@
 
 BANDWIDTHD_AUTORECONF = YES
 
-BANDWIDTHD_CONF_OPT += --without-x
+BANDWIDTHD_CONF_OPTS += --without-x
 
 ifeq ($(BR2_PACKAGE_BANDWIDTHD_POSTGRESQL),y)
 BANDWIDTHD_DEPENDENCIES += postgresql
-BANDWIDTHD_CONF_OPT += --with-postgresql-logging=true
+BANDWIDTHD_CONF_OPTS += --with-postgresql-logging=true
 else
-BANDWIDTHD_CONF_OPT += --with-postgresql-logging=false
+BANDWIDTHD_CONF_OPTS += --with-postgresql-logging=false
 endif
 
 ifeq ($(BR2_PACKAGE_BANDWIDTHD_SQLITE3),y)
 BANDWIDTHD_DEPENDENCIES += sqlite
-BANDWIDTHD_CONF_OPT += --with-sqlite-storage=true
+BANDWIDTHD_CONF_OPTS += --with-sqlite-storage=true
 else
-BANDWIDTHD_CONF_OPT += --with-sqlite-storage=false
+BANDWIDTHD_CONF_OPTS += --with-sqlite-storage=false
 endif
 
 $(eval $(autotools-package))
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -7,7 +7,7 @@
 BASH_VERSION = 4.3
 BASH_SITE = $(BR2_GNU_MIRROR)/bash
 BASH_DEPENDENCIES = ncurses readline host-bison
-BASH_CONF_OPT = --with-installed-readline
+BASH_CONF_OPTS = --with-installed-readline
 BASH_LICENSE = GPLv3+
 BASH_LICENSE_FILES = COPYING
 
@@ -25,7 +25,7 @@
 
 # The static build needs some trickery
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-BASH_CONF_OPT += --enable-static-link --without-bash-malloc
+BASH_CONF_OPTS += --enable-static-link --without-bash-malloc
 endif
 
 # Make sure we build after busybox so that /bin/sh links to bash
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -10,7 +10,7 @@
 BCUSDK_LICENSE = GPLv2+
 BCUSDK_LICENSE_FILES = COPYING
 BCUSDK_INSTALL_STAGING = YES
-BCUSDK_CONF_OPT =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+BCUSDK_CONF_OPTS =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
 		 --enable-eibnetip --enable-eibnetipserver \
 		 --enable-eibnetiptunnel --without-pth-test \
 		 --with-pth=$(STAGING_DIR)/usr
diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -17,7 +17,7 @@
 BEECRYPT_CONF_ENV = \
 	CXXFLAGS="$(TARGET_CXXFLAGS) -fpermissive"
 
-BEECRYPT_CONF_OPT = \
+BEECRYPT_CONF_OPTS = \
 		--without-java \
 		--without-python \
 		--disable-openmp
@@ -25,7 +25,7 @@
 ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
 BEECRYPT_DEPENDENCIES += icu
 else
-BEECRYPT_CONF_OPT += --without-cplusplus
+BEECRYPT_CONF_OPTS += --without-cplusplus
 
 # automake/libtool uses the C++ compiler to link libbeecrypt because of
 # (the optional) cppglue.cxx. Force it to use the C compiler instead.
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -20,50 +20,50 @@
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
-BIND_CONF_OPT = --localstatedir=/var \
+BIND_CONF_OPTS = --localstatedir=/var \
 		--with-randomdev=/dev/urandom \
 		--enable-epoll --with-libtool \
 		--with-gssapi=no --enable-rrl
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-	BIND_CONF_OPT += --enable-linux-caps
+	BIND_CONF_OPTS += --enable-linux-caps
 	BIND_DEPENDENCIES += libcap
 else
-	BIND_CONF_OPT += --disable-linux-caps
+	BIND_CONF_OPTS += --disable-linux-caps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	BIND_CONF_OPT += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
+	BIND_CONF_OPTS += --with-libxml2=$(STAGING_DIR)/usr --enable-newstats
 	BIND_DEPENDENCIES += libxml2
 else
-	BIND_CONF_OPT += --with-libxml2=no
+	BIND_CONF_OPTS += --with-libxml2=no
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
 	BIND_CONF_ENV += ac_cv_func_EVP_sha256=yes \
 		ac_cv_func_EVP_sha384=yes ac_cv_func_EVP_sha512=yes
-	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
+	BIND_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
 		--with-ecdsa=yes
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
-	BIND_CONF_OPT += --with-gost=yes
+	BIND_CONF_OPTS += --with-gost=yes
 else
-	BIND_CONF_OPT += --with-gost=no
+	BIND_CONF_OPTS += --with-gost=no
 endif
 else
-	BIND_CONF_OPT += --with-openssl=no
+	BIND_CONF_OPTS += --with-openssl=no
 endif
 
 # Used by dnssec-checkds and dnssec-coverage
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
-	BIND_CONF_OPT += --with-python=no
+	BIND_CONF_OPTS += --with-python=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 	BIND_DEPENDENCIES += readline
 else
-	BIND_CONF_OPT += --with-readline=no
+	BIND_CONF_OPTS += --with-readline=no
 endif
 
 define BIND_TARGET_REMOVE_SERVER
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -45,15 +45,15 @@
 # When binutils sources are fetched from the binutils-gdb repository,
 # they also contain the gdb sources, but gdb shouldn't be built, so we
 # disable it.
-BINUTILS_DISABLE_GDB_CONF_OPT = \
+BINUTILS_DISABLE_GDB_CONF_OPTS = \
 	--disable-sim --disable-gdb
 
 # We need to specify host & target to avoid breaking ARM EABI
-BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
+BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
 		--enable-install-libiberty \
-		$(BINUTILS_DISABLE_GDB_CONF_OPT) \
+		$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
@@ -68,11 +68,11 @@
 
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
-HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
+HOST_BINUTILS_CONF_OPTS = --disable-multilib --disable-werror \
 			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
-			$(BINUTILS_DISABLE_GDB_CONF_OPT) \
+			$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,7 +7,7 @@
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
-BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+BLACKBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 BLACKBOX_DEPENDENCIES = xlib_libX11
 BLACKBOX_LICENSE = MIT
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -12,30 +12,30 @@
 BLUEZ5_UTILS_LICENSE = GPLv2+ LGPLv2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
-BLUEZ5_UTILS_CONF_OPT = 	\
+BLUEZ5_UTILS_CONF_OPTS = 	\
 	--enable-tools 		\
 	--enable-library 	\
 	--disable-cups
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-obex
+BLUEZ5_UTILS_CONF_OPTS += --enable-obex
 BLUEZ5_UTILS_DEPENDENCIES += libical
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-obex
+BLUEZ5_UTILS_CONF_OPTS += --disable-obex
 endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_CLIENT),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-client
+BLUEZ5_UTILS_CONF_OPTS += --enable-client
 BLUEZ5_UTILS_DEPENDENCIES += readline
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-client
+BLUEZ5_UTILS_CONF_OPTS += --disable-client
 endif
 
 # experimental plugins
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-experimental
+BLUEZ5_UTILS_CONF_OPTS += --enable-experimental
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-experimental
+BLUEZ5_UTILS_CONF_OPTS += --disable-experimental
 endif
 
 # install gatttool (For some reason upstream choose not to do it by default)
@@ -48,25 +48,25 @@
 
 # enable test
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TEST),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-test
+BLUEZ5_UTILS_CONF_OPTS += --enable-test
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-test
+BLUEZ5_UTILS_CONF_OPTS += --disable-test
 endif
 
 # use udev if available
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-udev
+BLUEZ5_UTILS_CONF_OPTS += --enable-udev
 BLUEZ5_UTILS_DEPENDENCIES += udev
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-udev
+BLUEZ5_UTILS_CONF_OPTS += --disable-udev
 endif
 
 # integrate with systemd if available
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-BLUEZ5_UTILS_CONF_OPT += --enable-systemd
+BLUEZ5_UTILS_CONF_OPTS += --enable-systemd
 BLUEZ5_UTILS_DEPENDENCIES += systemd
 else
-BLUEZ5_UTILS_CONF_OPT += --disable-systemd
+BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
 $(eval $(autotools-package))
diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -9,14 +9,14 @@
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
 BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
-BLUEZ_UTILS_CONF_OPT = --enable-test --enable-tools
+BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
 BLUEZ_UTILS_LICENSE = GPLv2+ LGPLv2.1+
 BLUEZ_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
 # BlueZ 3.x compatibility
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_COMPAT),y)
-BLUEZ_UTILS_CONF_OPT +=	\
+BLUEZ_UTILS_CONF_OPTS +=	\
 	--enable-hidd	\
 	--enable-pand	\
 	--enable-sdp	\
@@ -28,29 +28,29 @@
 BLUEZ_UTILS_DEPENDENCIES +=	\
 	alsa-lib		\
 	libsndfile
-BLUEZ_UTILS_CONF_OPT +=	\
+BLUEZ_UTILS_CONF_OPTS +=	\
 	--enable-alsa	\
 	--enable-audio
 else
-BLUEZ_UTILS_CONF_OPT +=	\
+BLUEZ_UTILS_CONF_OPTS +=	\
 	--disable-alsa	\
 	--disable-audio
 endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_GATT),y)
 BLUEZ_UTILS_DEPENDENCIES += readline
-BLUEZ_UTILS_CONF_OPT += --enable-gatt
+BLUEZ_UTILS_CONF_OPTS += --enable-gatt
 else
-BLUEZ_UTILS_CONF_OPT += --disable-gatt
+BLUEZ_UTILS_CONF_OPTS += --disable-gatt
 endif
 
 # USB support
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS_USB),y)
 BLUEZ_UTILS_DEPENDENCIES += libusb
-BLUEZ_UTILS_CONF_OPT +=	\
+BLUEZ_UTILS_CONF_OPTS +=	\
 	--enable-usb
 else
-BLUEZ_UTILS_CONF_OPT +=	\
+BLUEZ_UTILS_CONF_OPTS +=	\
 	--disable-usb
 endif
 
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -14,10 +14,10 @@
 
 # link dynamically unless explicitly requested otherwise
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-BMON_CONF_OPT += --disable-static
+BMON_CONF_OPTS += --disable-static
 else
 # forgets to explicitly link with pthread for libnl
-BMON_CONF_OPT += LIBS=-lpthread
+BMON_CONF_OPTS += LIBS=-lpthread
 endif
 
 $(eval $(autotools-package))
diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -6,7 +6,7 @@
 
 BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://downloads.sourceforge.net/project/bootutils/Stable/v$(BOOTUTILS_VERSION)
-BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
+BOOTUTILS_CONF_OPTS = --prefix=/ --exec-prefix=/
 BOOTUTILS_LICENSE = GPLv2+
 BOOTUTILS_LICENSE_FILES = COPYING
 
diff --git a/package/bridge-utils/bridge-utils.mk b/package/bridge-utils/bridge-utils.mk
--- a/package/bridge-utils/bridge-utils.mk
+++ b/package/bridge-utils/bridge-utils.mk
@@ -7,7 +7,7 @@
 BRIDGE_UTILS_VERSION = 1.5
 BRIDGE_UTILS_SITE = http://downloads.sourceforge.net/project/bridge/bridge
 BRIDGE_UTILS_AUTORECONF = YES
-BRIDGE_UTILS_CONF_OPT = --with-linux-headers=$(LINUX_HEADERS_DIR)
+BRIDGE_UTILS_CONF_OPTS = --with-linux-headers=$(LINUX_HEADERS_DIR)
 BRIDGE_UTILS_LICENSE = GPLv2+
 BRIDGE_UTILS_LICENSE_FILES = COPYING
 
diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
--- a/package/bwm-ng/bwm-ng.mk
+++ b/package/bwm-ng/bwm-ng.mk
@@ -6,12 +6,12 @@
 
 BWM_NG_VERSION = 0.6
 BWM_NG_SITE = http://downloads.sourceforge.net/project/bwmng/bwmng/$(BWM_NG_VERSION)
-BWM_NG_CONF_OPT = --with-procnetdev --with-diskstats
+BWM_NG_CONF_OPTS = --with-procnetdev --with-diskstats
 BWM_NG_LICENSE = GPLv2
 BWM_NG_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-BWM_NG_CONF_OPT += --with-ncurses
+BWM_NG_CONF_OPTS += --with-ncurses
 BWM_NG_DEPENDENCIES += ncurses
 endif
 
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -42,7 +42,7 @@
 	CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
 endif
 
-CAIRO_CONF_OPT = \
+CAIRO_CONF_OPTS = \
 	--enable-trace=no \
 	--enable-interpreter=no
 
@@ -52,97 +52,97 @@
 # DirectFB. Break circular dependency by disabling DirectFB support in Cairo
 # (which is experimental)
 ifeq ($(BR2_PACKAGE_DIRECTFB)x$(BR2_PACKAGE_DIRECTFB_SVG),yx)
-	CAIRO_CONF_OPT += --enable-directfb
+	CAIRO_CONF_OPTS += --enable-directfb
 	CAIRO_DEPENDENCIES += directfb
 else
-	CAIRO_CONF_OPT += --disable-directfb
+	CAIRO_CONF_OPTS += --disable-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-	CAIRO_CONF_OPT += --enable-ft
+	CAIRO_CONF_OPTS += --enable-ft
 	CAIRO_DEPENDENCIES += freetype
 else
-	CAIRO_CONF_OPT += --disable-ft
+	CAIRO_CONF_OPTS += --disable-ft
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	CAIRO_CONF_OPT += --enable-gobject
+	CAIRO_CONF_OPTS += --enable-gobject
 	CAIRO_DEPENDENCIES += libglib2
 else
-	CAIRO_CONF_OPT += --disable-gobject
+	CAIRO_CONF_OPTS += --disable-gobject
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-	CAIRO_CONF_OPT += --enable-glesv2
+	CAIRO_CONF_OPTS += --enable-glesv2
 	CAIRO_DEPENDENCIES += libgles
 else
-	CAIRO_CONF_OPT += --disable-glesv2
+	CAIRO_CONF_OPTS += --disable-glesv2
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBOPENVG),y)
-	CAIRO_CONF_OPT += --enable-vg
+	CAIRO_CONF_OPTS += --enable-vg
 	CAIRO_DEPENDENCIES += libopenvg
 else
-	CAIRO_CONF_OPT += --disable-vg
+	CAIRO_CONF_OPTS += --disable-vg
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	CAIRO_CONF_OPT += --enable-xlib --enable-xcb --with-x
+	CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x
 	CAIRO_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	CAIRO_CONF_OPT += --disable-xlib --disable-xcb --without-x
+	CAIRO_CONF_OPTS += --disable-xlib --disable-xcb --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
-	CAIRO_CONF_OPT += --enable-xlib-xrender
+	CAIRO_CONF_OPTS += --enable-xlib-xrender
 	CAIRO_DEPENDENCIES += xlib_libXrender
 else
-	CAIRO_CONF_OPT += --disable-xlib-xrender
+	CAIRO_CONF_OPTS += --disable-xlib-xrender
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
-	CAIRO_CONF_OPT += --enable-ps
+	CAIRO_CONF_OPTS += --enable-ps
 	CAIRO_DEPENDENCIES += zlib
 else
-	CAIRO_CONF_OPT += --disable-ps
+	CAIRO_CONF_OPTS += --disable-ps
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PDF),y)
-	CAIRO_CONF_OPT += --enable-pdf
+	CAIRO_CONF_OPTS += --enable-pdf
 	CAIRO_DEPENDENCIES += zlib
 else
-	CAIRO_CONF_OPT += --disable-pdf
+	CAIRO_CONF_OPTS += --disable-pdf
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_PNG),y)
-	CAIRO_CONF_OPT += --enable-png
+	CAIRO_CONF_OPTS += --enable-png
 	CAIRO_DEPENDENCIES += libpng
 else
-	CAIRO_CONF_OPT += --disable-png
+	CAIRO_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
-	CAIRO_CONF_OPT += --enable-script
+	CAIRO_CONF_OPTS += --enable-script
 else
-	CAIRO_CONF_OPT += --disable-script
+	CAIRO_CONF_OPTS += --disable-script
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
-	CAIRO_CONF_OPT += --enable-svg
+	CAIRO_CONF_OPTS += --enable-svg
 else
-	CAIRO_CONF_OPT += --disable-svg
+	CAIRO_CONF_OPTS += --disable-svg
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
-	CAIRO_CONF_OPT += --enable-tee
+	CAIRO_CONF_OPTS += --enable-tee
 else
-	CAIRO_CONF_OPT += --disable-tee
+	CAIRO_CONF_OPTS += --disable-tee
 endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
-	CAIRO_CONF_OPT += --enable-xml
+	CAIRO_CONF_OPTS += --enable-xml
 else
-	CAIRO_CONF_OPT += --disable-xml
+	CAIRO_CONF_OPTS += --disable-xml
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -19,7 +19,7 @@
 # to use HOSTCC_NOCCACHE as the compiler. Instead, we take the easy
 # path: tell ccache to use its internal copy of zlib, so that ccache
 # has zero dependency besides the C library.
-HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
+HOST_CCACHE_CONF_OPTS += ccache_cv_zlib_1_2_3=no
 
 # Patch host-ccache as follows:
 #  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -11,17 +11,17 @@
 CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
-CDRKIT_CONF_OPT += -DBITFIELDS_HTOL=1
+CDRKIT_CONF_OPTS += -DBITFIELDS_HTOL=1
 else
-CDRKIT_CONF_OPT += -DBITFIELDS_HTOL=0
+CDRKIT_CONF_OPTS += -DBITFIELDS_HTOL=0
 endif
 
 ## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
 ## some extra flags so it finds needed libs and headers.
-CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(STAGING_DIR)/usr/include"
-CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
-HOST_CDRKIT_CONF_OPT += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
+CDRKIT_CONF_OPTS += -DCMAKE_C_FLAGS="-I$(STAGING_DIR)/usr/include"
+CDRKIT_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="$(TARGET_LDFLAGS)"
+HOST_CDRKIT_CONF_OPTS += -DCMAKE_C_FLAGS="-I$(HOST_DIR)/usr/include"
+HOST_CDRKIT_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS="$(HOST_LDFLAGS)"
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
diff --git a/package/cegui06/cegui06.mk b/package/cegui06/cegui06.mk
--- a/package/cegui06/cegui06.mk
+++ b/package/cegui06/cegui06.mk
@@ -18,7 +18,7 @@
     freetype                    \
     pcre                        \
 
-CEGUI06_CONF_OPT =              \
+CEGUI06_CONF_OPTS =              \
     --enable-expat              \
     --disable-external-tinyxml  \
     --disable-xerces-c          \
diff --git a/package/celt051/celt051.mk b/package/celt051/celt051.mk
--- a/package/celt051/celt051.mk
+++ b/package/celt051/celt051.mk
@@ -18,7 +18,7 @@
 # if target is the same kind as host (ie. same arch, same bitness,
 # same endianness, so that /usr/lib contains libraries linkable by
 # our cross-compiler)
-CELT051_CONF_OPT =                  \
+CELT051_CONF_OPTS =                  \
   --enable-fixed-point              \
   --disable-fixed-point-debug       \
   --disable-experimental-postfilter \
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -9,22 +9,22 @@
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
 
-CHRONY_CONF_OPT = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
+CHRONY_CONF_OPTS = --host-system=Linux --host-machine=$(BR2_ARCH) --prefix=/usr
 
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 CHRONY_DEPENDENCIES += host-pkgconf libnss
 else
-CHRONY_CONF_OPT += --without-nss
+CHRONY_CONF_OPTS += --without-nss
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 CHRONY_DEPENDENCIES += readline
 else
-CHRONY_CONF_OPT += --disable-readline
+CHRONY_CONF_OPTS += --disable-readline
 endif
 
 ifneq ($(BR2_INET_IPV6),y)
-CHRONY_CONF_OPT += --disable-ipv6
+CHRONY_CONF_OPTS += --disable-ipv6
 endif
 
 # Ditch the doc build, needs makeinfo and we don't need them
@@ -34,7 +34,7 @@
 CHRONY_POST_PATCH_HOOKS += CHRONY_DISABLE_DOCS
 
 define CHRONY_CONFIGURE_CMDS
-	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPT)
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPTS)
 endef
 
 define CHRONY_BUILD_CMDS
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -11,7 +11,7 @@
 CIFS_UTILS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-CIFS_UTILS_CONF_OPT += --disable-pie
+CIFS_UTILS_CONF_OPTS += --disable-pie
 endif
 
 define CIFS_UTILS_NO_WERROR
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -9,7 +9,7 @@
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
-CIVETWEB_CONF_OPT = TARGET_OS=LINUX
+CIVETWEB_CONF_OPTS = TARGET_OS=LINUX
 CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
 CIVETWEB_LIBS = -lpthread -lm -ldl
 CIVETWEB_SYSCONFDIR = /etc
@@ -20,11 +20,11 @@
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	CIVETWEB_CONF_OPT += WITH_IPV6=1
+	CIVETWEB_CONF_OPTS += WITH_IPV6=1
 endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
-	CIVETWEB_CONF_OPT += WITH_LUA=1
+	CIVETWEB_CONF_OPTS += WITH_LUA=1
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
@@ -37,7 +37,7 @@
 
 define CIVETWEB_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) build \
-		$(CIVETWEB_CONF_OPT) \
+		$(CIVETWEB_CONF_OPTS) \
 		COPT="$(CIVETWEB_COPT)" LIBS="$(CIVETWEB_LIBS)"
 endef
 
@@ -48,7 +48,7 @@
 		HTMLDIR="$(TARGET_DIR)$(CIVETWEB_HTMLDIR)" \
 		SYSCONFDIR="$(TARGET_DIR)$(CIVETWEB_SYSCONFDIR)" \
 		PREFIX="$(TARGET_DIR)/usr" \
-		$(CIVETWEB_CONF_OPT) \
+		$(CIVETWEB_CONF_OPTS) \
 		COPT='$(CIVETWEB_COPT)'
 endef
 
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
--- a/package/clapack/clapack.mk
+++ b/package/clapack/clapack.mk
@@ -14,10 +14,10 @@
 CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
 CLAPACK_SITE = http://www.netlib.org/clapack
 CLAPACK_INSTALL_STAGING = YES
-CLAPACK_CONF_OPT = -DBUILDTESTING=OFF
+CLAPACK_CONF_OPTS = -DBUILDTESTING=OFF
 
 ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
-CLAPACK_CONF_OPT += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
+CLAPACK_CONF_OPTS += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
 endif
 
 $(eval $(cmake-package))
diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -6,7 +6,7 @@
 
 CLASSPATH_VERSION = 0.98
 CLASSPATH_SITE = $(BR2_GNU_MIRROR)/classpath
-CLASSPATH_CONF_OPT = \
+CLASSPATH_CONF_OPTS = \
 	--disable-examples \
 	--disable-plugin \
 	--disable-rpath \
@@ -16,7 +16,7 @@
 
 # classpath assumes qt runs on top of X11, but we
 # don't support qt4 on X11
-CLASSPATH_CONF_OPT += --disable-qt-peer
+CLASSPATH_CONF_OPTS += --disable-qt-peer
 CLASSPATH_DEPENDENCIES = host-pkgconf
 CLASSPATH_AUTORECONF = YES
 CLASSPATH_LICENSE = GPLv2+ with exception
@@ -25,39 +25,39 @@
 # Needs ALSA pcm and sequencer (midi) support
 # pcm is always on for alsa-lib
 ifeq ($(BR2_PACKAGE_ALSA_LIB_SEQ),y)
-CLASSPATH_CONF_OPT += --enable-alsa
+CLASSPATH_CONF_OPTS += --enable-alsa
 CLASSPATH_DEPENDENCIES += alsa-lib
 else
-CLASSPATH_CONF_OPT += --disable-alsa
+CLASSPATH_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_GMP),y)
-CLASSPATH_CONF_OPT += --enable-gmp --with-gmp="$(STAGING_DIR)/usr"
+CLASSPATH_CONF_OPTS += --enable-gmp --with-gmp="$(STAGING_DIR)/usr"
 CLASSPATH_DEPENDENCIES += gmp
 else
-CLASSPATH_CONF_OPT += --disable-gmp
+CLASSPATH_CONF_OPTS += --disable-gmp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
-CLASSPATH_CONF_OPT += --enable-gtk-peer
+CLASSPATH_CONF_OPTS += --enable-gtk-peer
 CLASSPATH_DEPENDENCIES += libgtk2
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
-CLASSPATH_CONF_OPT += --enable-gstreamer-peer
+CLASSPATH_CONF_OPTS += --enable-gstreamer-peer
 CLASSPATH_DEPENDENCIES += gst-plugins-base
 else
-CLASSPATH_CONF_OPT += --disable-gstreamer-peer
+CLASSPATH_CONF_OPTS += --disable-gstreamer-peer
 endif
 
 else
-CLASSPATH_CONF_OPT += --disable-gtk-peer --disable-gstreamer-peer
+CLASSPATH_CONF_OPTS += --disable-gtk-peer --disable-gstreamer-peer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
-CLASSPATH_CONF_OPT += --enable-xmlj
+CLASSPATH_CONF_OPTS += --enable-xmlj
 CLASSPATH_DEPENDENCIES += libxml2 libxslt
 else
-CLASSPATH_CONF_OPT += --disable-xmlj
+CLASSPATH_CONF_OPTS += --disable-xmlj
 endif
 
 $(eval $(autotools-package))
diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -12,6 +12,6 @@
 # built for the host, we don't really care about it.
 CLOOG_LIBTOOL_PATCH = NO
 
-HOST_CLOOG_CONF_OPT = --with-isl=system --with-polylib=no
+HOST_CLOOG_CONF_OPTS = --with-isl=system --with-polylib=no
 
 $(eval $(host-autotools-package))
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -23,7 +23,7 @@
 
 COLLECTD_CONF_ENV += LIBS="-lm"
 
-COLLECTD_CONF_OPT += --with-nan-emulation --with-fp-layout=nothing \
+COLLECTD_CONF_OPTS += --with-nan-emulation --with-fp-layout=nothing \
 	--localstatedir=/var --with-perl-bindings=no \
 	$(foreach p, $(COLLECTD_PLUGINS_DISABLE), --disable-$(p)) \
 	$(if $(BR2_PACKAGE_COLLECTD_AGGREGATION),--enable-aggregation,--disable-aggregation) \
@@ -118,22 +118,22 @@
 
 # include/library fixups
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-	COLLECTD_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr
+	COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	COLLECTD_CONF_OPT += --with-libmysql=$(STAGING_DIR)/usr
+	COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
-	COLLECTD_CONF_OPT += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
+	COLLECTD_CONF_OPTS += --with-libnetsnmp=$(STAGING_DIR)/usr/bin/net-snmp-config
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
-	COLLECTD_CONF_OPT += --with-yajl=$(STAGING_DIR)/usr
+	COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
 endif
 
 # network can use libgcrypt
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	COLLECTD_DEPENDENCIES += libgcrypt
-	COLLECTD_CONF_OPT += --with-libgcrypt=$(STAGING_DIR)/usr
+	COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
 endif
 
 # released software should not break on minor warnings
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -11,7 +11,7 @@
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
-CONNMAN_CONF_OPT += --localstatedir=/var \
+CONNMAN_CONF_OPTS += --localstatedir=/var \
 	$(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)		\
 	$(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)	\
 	$(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)			\
@@ -33,7 +33,7 @@
 
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
-CONNMAN_CONF_OPT += --enable-client
+CONNMAN_CONF_OPTS += --enable-client
 CONNMAN_DEPENDENCIES += readline
 
 define CONNMAN_INSTALL_CM
@@ -42,7 +42,7 @@
 
 CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_CM
 else
-CONNMAN_CONF_OPT += --disable-client
+CONNMAN_CONF_OPTS += --disable-client
 endif
 
 $(eval $(autotools-package))
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -61,7 +61,7 @@
 		utils_cv_localtime_cache=no \
 		PERL=missing
 
-COREUTILS_CONF_OPT = --disable-rpath
+COREUTILS_CONF_OPTS = --disable-rpath
 
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -14,13 +14,13 @@
 CPPCMS_DEPENDENCIES = zlib pcre libgcrypt
 
 ifeq ($(BR2_PACKAGE_CPPCMS_ICU),y)
-CPPCMS_CONF_OPT += -DDISABLE_ICONV=ON
+CPPCMS_CONF_OPTS += -DDISABLE_ICONV=ON
 CPPCMS_DEPENDENCIES += icu
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
-CPPCMS_CONF_OPT += -DDISABLE_POSIX_LOCALE=on
+CPPCMS_CONF_OPTS += -DDISABLE_POSIX_LOCALE=on
 endif
 
 # We copy cppcms_tmpl_cc from staging to host because this file can be
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
--- a/package/cppdb/cppdb.mk
+++ b/package/cppdb/cppdb.mk
@@ -14,7 +14,7 @@
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 CPPDB_DEPENDENCIES += mysql
-CPPDB_CONF_OPT += -DMYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql
+CPPDB_CONF_OPTS += -DMYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql
 endif
 
 $(eval $(cmake-package))
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
--- a/package/ctorrent/ctorrent.mk
+++ b/package/ctorrent/ctorrent.mk
@@ -10,10 +10,10 @@
 CTORRENT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CTORRENT_CONF_OPT += --with-ssl=yes
+CTORRENT_CONF_OPTS += --with-ssl=yes
 CTORRENT_DEPENDENCIES += openssl
 else
-CTORRENT_CONF_OPT += --with-ssl=no
+CTORRENT_CONF_OPTS += --with-ssl=no
 endif
 
 $(eval $(autotools-package))
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -12,7 +12,7 @@
 CUPS_INSTALL_STAGING = YES
 CUPS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) DSTROOT=$(STAGING_DIR) install
 CUPS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
-CUPS_CONF_OPT = --without-perl \
+CUPS_CONF_OPTS = --without-perl \
 		--without-java \
 		--without-php \
 		--disable-gnutls \
@@ -27,10 +27,10 @@
 		    $(if $(BR2_PACKAGE_TIFF),tiff)
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	CUPS_CONF_OPT += --enable-dbus
+	CUPS_CONF_OPTS += --enable-dbus
 	CUPS_DEPENDENCIES += dbus
 else
-	CUPS_CONF_OPT += --disable-dbus
+	CUPS_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -38,16 +38,16 @@
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-	CUPS_CONF_OPT += --with-python
+	CUPS_CONF_OPTS += --with-python
 	CUPS_DEPENDENCIES += python
 else
-	CUPS_CONF_OPT += --without-python
+	CUPS_CONF_OPTS += --without-python
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS_PDFTOPS),y)
-	CUPS_CONF_OPT += --enable-pdftops
+	CUPS_CONF_OPTS += --enable-pdftops
 else
-	CUPS_CONF_OPT += --disable-pdftops
+	CUPS_CONF_OPTS += --disable-pdftops
 endif
 
 # standard autoreconf fails with autoheader failures
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -22,7 +22,7 @@
 CVS_CONFIGURE_ARGS += --with-external-zlib
 endif
 
-CVS_CONF_OPT = $(CVS_CONFIGURE_ARGS)
+CVS_CONF_OPTS = $(CVS_CONFIGURE_ARGS)
 
 define CVS_BZIP_UNPACK
 	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
diff --git a/package/cwiid/cwiid.mk b/package/cwiid/cwiid.mk
--- a/package/cwiid/cwiid.mk
+++ b/package/cwiid/cwiid.mk
@@ -18,13 +18,13 @@
 # Disable python support. This disables the 2 following things:
 #   - wminput Python plugin support
 #   - cwiid Python module
-CWIID_CONF_OPT = --without-python --disable-ldconfig
+CWIID_CONF_OPTS = --without-python --disable-ldconfig
 
 ifeq ($(BR2_PACKAGE_CWIID_WMGUI),y)
 CWIID_DEPENDENCIES += libgtk2 libglib2
-CWIID_CONF_OPT += --enable-wmgui
+CWIID_CONF_OPTS += --enable-wmgui
 else
-CWIID_CONF_OPT += --disable-wmgui
+CWIID_CONF_OPTS += --disable-wmgui
 endif
 
 $(eval $(autotools-package))
diff --git a/package/dbus-cpp/dbus-cpp.mk b/package/dbus-cpp/dbus-cpp.mk
--- a/package/dbus-cpp/dbus-cpp.mk
+++ b/package/dbus-cpp/dbus-cpp.mk
@@ -11,26 +11,26 @@
 # expat is required for the tools irrespective of dbus xml backend
 DBUS_CPP_DEPENDENCIES = host-dbus-cpp host-pkgconf dbus expat
 HOST_DBUS_CPP_DEPENDENCIES = host-pkgconf host-dbus host-expat
-DBUS_CPP_CONF_OPT = --disable-examples --disable-tests --disable-doxygen-docs \
+DBUS_CPP_CONF_OPTS = --disable-examples --disable-tests --disable-doxygen-docs \
 	--with-build-libdbus-cxx=$(HOST_DBUS_CPP_BUILDDIR)
-HOST_DBUS_CPP_CONF_OPT = --disable-examples --disable-tests \
+HOST_DBUS_CPP_CONF_OPTS = --disable-examples --disable-tests \
 	--disable-doxygen-docs --disable-ecore --disable-glib
 DBUS_CPP_AUTORECONF = YES
 DBUS_CPP_LICENSE = LGPLv2.1+
 DBUS_CPP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBECORE),y)
-	DBUS_CPP_CONF_OPT += --enable-ecore
+	DBUS_CPP_CONF_OPTS += --enable-ecore
 	DBUS_CPP_DEPENDENCIES += libecore
 else
-	DBUS_CPP_CONF_OPT += --disable-ecore
+	DBUS_CPP_CONF_OPTS += --disable-ecore
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-	DBUS_CPP_CONF_OPT += --enable-glib
+	DBUS_CPP_CONF_OPTS += --enable-glib
 	DBUS_CPP_DEPENDENCIES += libglib2
 else
-	DBUS_CPP_CONF_OPT += --disable-glib
+	DBUS_CPP_CONF_OPTS += --disable-glib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -14,7 +14,7 @@
 		ac_cv_func_posix_getpwnam_r=yes \
 		have_abstract_sockets=yes
 
-DBUS_GLIB_CONF_OPT = --localstatedir=/var \
+DBUS_GLIB_CONF_OPTS = --localstatedir=/var \
 		--disable-tests \
 		--disable-xml-docs \
 		--with-introspect-xml=$(DBUS_HOST_INTROSPECT) \
@@ -27,7 +27,7 @@
 
 HOST_DBUS_GLIB_DEPENDENCIES = host-dbus host-expat host-libglib2
 
-HOST_DBUS_GLIB_CONF_OPT = \
+HOST_DBUS_GLIB_CONF_OPTS = \
 		--disable-tests \
 		--disable-xml-docs \
 		--disable-bash-completion \
diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -18,7 +18,7 @@
 		am_cv_python_pyexecdir=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
 		am_cv_python_includes=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 
-DBUS_PYTHON_CONF_OPT = --disable-html-docs --disable-api-docs
+DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
 DBUS_PYTHON_DEPENDENCIES = dbus-glib python host-python
 
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -17,7 +17,7 @@
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
-DBUS_CONF_OPT = --with-dbus-user=dbus \
+DBUS_CONF_OPTS = --with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
 		--enable-abstract-sockets \
@@ -35,28 +35,28 @@
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-DBUS_CONF_OPT += LIBS='-pthread'
+DBUS_CONF_OPTS += LIBS='-pthread'
 endif
 
 ifeq ($(BR2_microblaze),y)
 # microblaze toolchain doesn't provide inotify_rm_* but does have sys/inotify.h
-DBUS_CONF_OPT += --disable-inotify
+DBUS_CONF_OPTS += --disable-inotify
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-DBUS_CONF_OPT += --with-x
+DBUS_CONF_OPTS += --with-x
 DBUS_DEPENDENCIES += xlib_libX11
 else
-DBUS_CONF_OPT += --without-x
+DBUS_CONF_OPTS += --without-x
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-DBUS_CONF_OPT += \
+DBUS_CONF_OPTS += \
 	--enable-systemd \
 	--with-systemdsystemunitdir=/lib/systemd/system
 DBUS_DEPENDENCIES += systemd
 else
-DBUS_CONF_OPT += --disable-systemd
+DBUS_CONF_OPTS += --disable-systemd
 endif
 
 # fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
@@ -86,7 +86,7 @@
 endef
 
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
-HOST_DBUS_CONF_OPT = \
+HOST_DBUS_CONF_OPTS = \
 		--with-dbus-user=dbus \
 		--disable-tests \
 		--disable-asserts \
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -13,7 +13,7 @@
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	ac_cv_file__dev_random=yes
-DHCP_CONF_OPT = \
+DHCP_CONF_OPTS = \
 	--localstatedir=/var/lib/dhcp \
 	--with-srv-lease-file=/var/lib/dhcp/dhcpd.leases \
 	--with-srv6-lease-file=/var/lib/dhcp/dhcpd6.leases \
@@ -27,11 +27,11 @@
 	--with-relay6-pid-file=/var/run/dhcrelay6.pid
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER_DELAYED_ACK),y)
-        DHCP_CONF_OPT += --enable-delayed-ack
+        DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 ifneq ($(BR2_INET_IPV6),y)
-        DHCP_CONF_OPT += --disable-dhcpv6
+        DHCP_CONF_OPTS += --disable-dhcpv6
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -7,7 +7,7 @@
 DIALOG_VERSION = 1.2-20140219
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = ftp://invisible-island.net/dialog
-DIALOG_CONF_OPT = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
+DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
 	--disable-rpath-hack
 DIALOG_DEPENDENCIES = host-pkgconf ncurses
 DIALOG_LICENSE = LGPLv2.1
@@ -17,6 +17,6 @@
 DIALOG_DEPENDENCIES += libiconv
 endif
 
-DIALOG_CONF_OPT += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+DIALOG_CONF_OPTS += NCURSES_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 
 $(eval $(autotools-package))
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
--- a/package/dillo/dillo.mk
+++ b/package/dillo/dillo.mk
@@ -18,31 +18,31 @@
 DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	DILLO_CONF_OPT += --enable-ssl
+	DILLO_CONF_OPTS += --enable-ssl
 	DILLO_DEPENDENCIES += openssl
 else
-	DILLO_CONF_OPT += --disable-ssl
+	DILLO_CONF_OPTS += --disable-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	DILLO_CONF_OPT += --enable-png
+	DILLO_CONF_OPTS += --enable-png
 	DILLO_DEPENDENCIES += libpng
 	DILLO_CONF_ENV += PNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
-	DILLO_CONF_OPT += --disable-png
+	DILLO_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	DILLO_CONF_OPT += --enable-jpeg
+	DILLO_CONF_OPTS += --enable-jpeg
 	DILLO_DEPENDENCIES += libjpeg
 else
-	DILLO_CONF_OPT += --disable-jpeg
+	DILLO_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	DILLO_CONF_OPT += --enable-threaded-dns
+	DILLO_CONF_OPTS += --enable-threaded-dns
 else
-	DILLO_CONF_OPT += --disable-threaded-dns
+	DILLO_CONF_OPTS += --disable-threaded-dns
 endif
 
 $(eval $(autotools-package))
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -13,7 +13,7 @@
 DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_AUTORECONF = YES
 
-DIRECTFB_CONF_OPT = \
+DIRECTFB_CONF_OPTS = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
 	--enable-zlib \
@@ -28,7 +28,7 @@
 	--without-tools
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-DIRECTFB_CONF_OPT += --disable-dynload
+DIRECTFB_CONF_OPTS += --disable-dynload
 endif
 
 DIRECTFB_CONFIG_SCRIPTS = directfb-config
@@ -36,28 +36,28 @@
 DIRECTFB_DEPENDENCIES = freetype zlib
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_CONF_OPT += --enable-multi --enable-fusion
+DIRECTFB_CONF_OPTS += --enable-multi --enable-fusion
 DIRECTFB_DEPENDENCIES += linux-fusion
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
-DIRECTFB_CONF_OPT += --enable-debug
+DIRECTFB_CONF_OPTS += --enable-debug
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_TRACE),y)
-DIRECTFB_CONF_OPT += --enable-trace
+DIRECTFB_CONF_OPTS += --enable-trace
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER),y)
-DIRECTFB_CONF_OPT += --enable-x11
+DIRECTFB_CONF_OPTS += --enable-x11
 else
-DIRECTFB_CONF_OPT += --disable-x11
+DIRECTFB_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_UNIQUE),y)
-DIRECTFB_CONF_OPT += --enable-unique
+DIRECTFB_CONF_OPTS += --enable-unique
 else
-DIRECTFB_CONF_OPT += --disable-unique
+DIRECTFB_CONF_OPTS += --disable-unique
 endif
 
 DIRECTFB_GFX = \
@@ -71,9 +71,9 @@
 	$(if $(BR2_PACKAGE_DIRECTFB_EP9X),ep9x)
 
 ifeq ($(strip $(DIRECTFB_GFX)),)
-DIRECTFB_CONF_OPT += --with-gfxdrivers=none
+DIRECTFB_CONF_OPTS += --with-gfxdrivers=none
 else
-DIRECTFB_CONF_OPT += \
+DIRECTFB_CONF_OPTS += \
 	--with-gfxdrivers=$(subst $(space),$(comma),$(strip $(DIRECTFB_GFX)))
 endif
 
@@ -89,62 +89,62 @@
 endif
 
 ifeq ($(strip $(DIRECTFB_INPUT)),)
-DIRECTFB_CONF_OPT += --with-inputdrivers=none
+DIRECTFB_CONF_OPTS += --with-inputdrivers=none
 else
-DIRECTFB_CONF_OPT += \
+DIRECTFB_CONF_OPTS += \
 	--with-inputdrivers=$(subst $(space),$(comma),$(strip $(DIRECTFB_INPUT)))
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_GIF),y)
-DIRECTFB_CONF_OPT += --enable-gif
+DIRECTFB_CONF_OPTS += --enable-gif
 else
-DIRECTFB_CONF_OPT += --disable-gif
+DIRECTFB_CONF_OPTS += --disable-gif
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_PNG),y)
-DIRECTFB_CONF_OPT += --enable-png
+DIRECTFB_CONF_OPTS += --enable-png
 DIRECTFB_DEPENDENCIES += libpng
 DIRECTFB_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
 else
-DIRECTFB_CONF_OPT += --disable-png
+DIRECTFB_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_JPEG),y)
-DIRECTFB_CONF_OPT += --enable-jpeg
+DIRECTFB_CONF_OPTS += --enable-jpeg
 DIRECTFB_DEPENDENCIES += jpeg
 else
-DIRECTFB_CONF_OPT += --disable-jpeg
+DIRECTFB_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_SVG),y)
-DIRECTFB_CONF_OPT += --enable-svg
+DIRECTFB_CONF_OPTS += --enable-svg
 # needs some help to find cairo includes
 DIRECTFB_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -I$(STAGING_DIR)/usr/include/cairo"
 DIRECTFB_DEPENDENCIES += libsvg-cairo
 else
-DIRECTFB_CONF_OPT += --disable-svg
+DIRECTFB_CONF_OPTS += --disable-svg
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_IMLIB2),y)
-DIRECTFB_CONF_OPT += --enable-imlib2
+DIRECTFB_CONF_OPTS += --enable-imlib2
 DIRECTFB_DEPENDENCIES += imlib2
 DIRECTFB_CONF_ENV += ac_cv_path_IMLIB2_CONFIG=$(STAGING_DIR)/usr/bin/imlib2-config
 else
-DIRECTFB_CONF_OPT += --disable-imlib2
+DIRECTFB_CONF_OPTS += --disable-imlib2
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_DITHER_RGB16),y)
-DIRECTFB_CONF_OPT += --with-dither-rgb16=advanced
+DIRECTFB_CONF_OPTS += --with-dither-rgb16=advanced
 else
-DIRECTFB_CONF_OPT += --with-dither-rgb16=none
+DIRECTFB_CONF_OPTS += --with-dither-rgb16=none
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_TESTS),y)
-DIRECTFB_CONF_OPT += --with-tests
+DIRECTFB_CONF_OPTS += --with-tests
 endif
 
 HOST_DIRECTFB_DEPENDENCIES = host-pkgconf host-libpng
-HOST_DIRECTFB_CONF_OPT = \
+HOST_DIRECTFB_CONF_OPTS = \
 		--disable-debug \
 		--disable-multi \
 		--enable-png \
diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
--- a/package/distcc/distcc.mk
+++ b/package/distcc/distcc.mk
@@ -7,7 +7,7 @@
 DISTCC_VERSION = 2.18.3
 DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
 DISTCC_SITE = http://distcc.googlecode.com/files
-DISTCC_CONF_OPT = --with-included-popt --without-gtk --without-gnome
+DISTCC_CONF_OPTS = --with-included-popt --without-gtk --without-gnome
 DISTCC_LICENSE = GPLv2+
 DISTCC_LICENSE_FILES = COPYING
 
diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -13,18 +13,18 @@
 DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CONF_OPT = --enable-shlib
+DMALLOC_CONF_OPTS = --enable-shlib
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-DMALLOC_CONF_OPT += --enable-cxx
+DMALLOC_CONF_OPTS += --enable-cxx
 else
-DMALLOC_CONF_OPT += --disable-cxx
+DMALLOC_CONF_OPTS += --disable-cxx
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-DMALLOC_CONF_OPT += --enable-threads
+DMALLOC_CONF_OPTS += --enable-threads
 else
-DMALLOC_CONF_OPT += --disable-threads
+DMALLOC_CONF_OPTS += --disable-threads
 endif
 
 define DMALLOC_POST_PATCH
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -66,18 +66,18 @@
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_SMALL
-DROPBEAR_CONF_OPT += --disable-zlib
+DROPBEAR_CONF_OPTS += --disable-zlib
 else
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_BUILD_FEATURED
 DROPBEAR_DEPENDENCIES += zlib
 endif
 
 ifneq ($(BR2_PACKAGE_DROPBEAR_WTMP),y)
-DROPBEAR_CONF_OPT += --disable-wtmp
+DROPBEAR_CONF_OPTS += --disable-wtmp
 endif
 
 ifneq ($(BR2_PACKAGE_DROPBEAR_LASTLOG),y)
-DROPBEAR_CONF_OPT += --disable-lastlog
+DROPBEAR_CONF_OPTS += --disable-lastlog
 endif
 
 define DROPBEAR_INSTALL_TARGET_CMDS
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,7 +11,7 @@
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
 
-E2FSPROGS_CONF_OPT = \
+E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_PREFER_STATIC_LIB),,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -11,7 +11,7 @@
 ECRYPTFS_UTILS_LICENSE_FILES   = COPYING
 
 ECRYPTFS_UTILS_DEPENDENCIES    = keyutils libnss host-intltool
-ECRYPTFS_UTILS_CONF_OPT        = --disable-pywrap --disable-pam
+ECRYPTFS_UTILS_CONF_OPTS        = --disable-pywrap --disable-pam
 
 #Needed for build system to find pk11func.h and libnss3.so
 ECRYPTFS_UTILS_CONF_ENV = \
@@ -19,10 +19,10 @@
   NSS_LIBS="-lnss3"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	ECRYPTFS_UTILS_CONF_OPT += --enable-openssl
+	ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 	ECRYPTFS_UTILS_DEPENDENCIES += openssl
 else
-	ECRYPTFS_UTILS_CONF_OPT += --disable-openssl
+	ECRYPTFS_UTILS_CONF_OPTS += --disable-openssl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -6,7 +6,7 @@
 
 ED_VERSION = 1.9
 ED_SITE = $(BR2_GNU_MIRROR)/ed
-ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+ED_CONF_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
 ED_LICENSE = GPLv3+
 ED_LICENSE_FILES = COPYING
diff --git a/package/efl/libecore/libecore.mk b/package/efl/libecore/libecore.mk
--- a/package/efl/libecore/libecore.mk
+++ b/package/efl/libecore/libecore.mk
@@ -15,7 +15,7 @@
 LIBECORE_DEPENDENCIES = host-pkgconf libeina
 
 HOST_LIBECORE_DEPENDENCIES = host-pkgconf host-libeina host-libevas
-HOST_LIBECORE_CONF_OPT += 		\
+HOST_LIBECORE_CONF_OPTS += 		\
 	--enable-ecore-evas 		\
 	--disable-simple-x11 		\
 	--disable-ecore-directfb 	\
@@ -24,7 +24,7 @@
 	--disable-ecore-imf-xim
 
 # default options
-LIBECORE_CONF_OPT = --disable-simple-x11
+LIBECORE_CONF_OPTS = --disable-simple-x11
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 LIBECORE_DEPENDENCIES += tslib
@@ -36,16 +36,16 @@
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBECORE_DEPENDENCIES += openssl
-LIBECORE_CONF_OPT += --enable-openssl
+LIBECORE_CONF_OPTS += --enable-openssl
 else
-LIBECORE_CONF_OPT += --disable-openssl
+LIBECORE_CONF_OPTS += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBECORE_DEPENDENCIES += gnutls libgcrypt
-LIBECORE_CONF_OPT += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBECORE_CONF_OPTS += --enable-gnutls --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-LIBECORE_CONF_OPT += --disable-gnutls
+LIBECORE_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
@@ -54,34 +54,34 @@
 
 # libecore
 ifeq ($(BR2_PACKAGE_LIBECORE_DIRECTFB),y)
-LIBECORE_CONF_OPT += --enable-ecore-directfb
+LIBECORE_CONF_OPTS += --enable-ecore-directfb
 LIBECORE_DEPENDENCIES += directfb
 else
-LIBECORE_CONF_OPT += --disable-ecore-directfb
+LIBECORE_CONF_OPTS += --disable-ecore-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_FB),y)
-LIBECORE_CONF_OPT += --enable-ecore-fb
+LIBECORE_CONF_OPTS += --enable-ecore-fb
 else
-LIBECORE_CONF_OPT += --disable-ecore-fb
+LIBECORE_CONF_OPTS += --disable-ecore-fb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_SDL),y)
-LIBECORE_CONF_OPT += --enable-ecore-sdl
+LIBECORE_CONF_OPTS += --enable-ecore-sdl
 LIBECORE_DEPENDENCIES += sdl
 else
-LIBECORE_CONF_OPT += --disable-ecore-sdl
+LIBECORE_CONF_OPTS += --disable-ecore-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_X),y)
-LIBECORE_CONF_OPT += --enable-ecore-x
+LIBECORE_CONF_OPTS += --enable-ecore-x
 LIBECORE_DEPENDENCIES += xlib_libXext xlib_libX11
 else
-LIBECORE_CONF_OPT += --disable-ecore-x --disable-ecore-imf-xim
+LIBECORE_CONF_OPTS += --disable-ecore-x --disable-ecore-imf-xim
 endif
 
 ifeq ($(BR2_PACKAGE_LIBECORE_X_XCB),y)
-LIBECORE_CONF_OPT += --enable-ecore-x-xcb
+LIBECORE_CONF_OPTS += --enable-ecore-x-xcb
 LIBECORE_DEPENDENCIES += libxcb xlib_libX11 xcb-util pixman
 
 # src/util/makekeys is executed at build time to generate
@@ -96,15 +96,15 @@
 
 LIBECORE_POST_EXTRACT_HOOKS += LIBECORE_BUILD_MAKEKEYS_FOR_HOST
 else
-LIBECORE_CONF_OPT += --disable-ecore-x-xcb
+LIBECORE_CONF_OPTS += --disable-ecore-x-xcb
 endif
 
 # libecore-evas
 ifeq ($(BR2_PACKAGE_LIBECORE_EVAS),y)
-LIBECORE_CONF_OPT += --enable-ecore-evas
+LIBECORE_CONF_OPTS += --enable-ecore-evas
 LIBECORE_DEPENDENCIES += libevas
 else
-LIBECORE_CONF_OPT += --disable-ecore-evas
+LIBECORE_CONF_OPTS += --disable-ecore-evas
 endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
--- a/package/efl/libedbus/libedbus.mk
+++ b/package/efl/libedbus/libedbus.mk
@@ -15,23 +15,23 @@
 LIBEDBUS_DEPENDENCIES = host-pkgconf dbus libeina libecore
 
 ifeq ($(BR2_PACKAGE_LIBEDBUS_BLUEZ),y)
-LIBEDBUS_CONF_OPT += --enable-ebluez
+LIBEDBUS_CONF_OPTS += --enable-ebluez
 LIBEDBUS_DEPENDENCIES += bluez_utils
 else
-LIBEDBUS_CONF_OPT += --disable-ebluez
+LIBEDBUS_CONF_OPTS += --disable-ebluez
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEDBUS_CONNMAN),y)
-LIBEDBUS_CONF_OPT += --enable-econnman0_7x
+LIBEDBUS_CONF_OPTS += --enable-econnman0_7x
 LIBEDBUS_DEPENDENCIES += connman
 else
-LIBEDBUS_CONF_OPT += --disable-econnman0_7x
+LIBEDBUS_CONF_OPTS += --disable-econnman0_7x
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEDBUS_NOTIFY),y)
-LIBEDBUS_CONF_OPT += --enable-enotify --disable-edbus-notify-test
+LIBEDBUS_CONF_OPTS += --enable-enotify --disable-edbus-notify-test
 else
-LIBEDBUS_CONF_OPT += --disable-enotify
+LIBEDBUS_CONF_OPTS += --disable-enotify
 endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -16,12 +16,12 @@
 			libembryo
 
 ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
-LIBEDJE_CONF_OPT += --enable-edje-cc
+LIBEDJE_CONF_OPTS += --enable-edje-cc
 else
-LIBEDJE_CONF_OPT += --disable-edje-cc
+LIBEDJE_CONF_OPTS += --disable-edje-cc
 endif
 
-HOST_LIBEDJE_CONF_OPT = --enable-edje-cc
+HOST_LIBEDJE_CONF_OPTS = --enable-edje-cc
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
--- a/package/efl/libeet/libeet.mk
+++ b/package/efl/libeet/libeet.mk
@@ -18,9 +18,9 @@
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBEET_DEPENDENCIES += gnutls libgcrypt
 LIBEET_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-LIBEET_CONF_OPT += --enable-gnutls
+LIBEET_CONF_OPTS += --enable-gnutls
 else
-LIBEET_CONF_OPT += --disable-gnutls
+LIBEET_CONF_OPTS += --disable-gnutls
 endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libelementary/libelementary.mk b/package/efl/libelementary/libelementary.mk
--- a/package/efl/libelementary/libelementary.mk
+++ b/package/efl/libelementary/libelementary.mk
@@ -15,16 +15,16 @@
 LIBELEMENTARY_DEPENDENCIES = libeina libevas libecore libedje host-libedje \
 				host-libeet
 
-LIBELEMENTARY_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+LIBELEMENTARY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet
 
 # libethumb_client is only built when ethumbd is built.
 # ethumbd is only built if edbus is built.
 ifeq ($(BR2_PACKAGE_LIBETHUMB)$(BR2_PACKAGE_LIBEDBUS),yy)
 LIBELEMENTARY_DEPENDENCIES += libethumb
-LIBELEMENTARY_CONF_OPT += --enable-ethumb
+LIBELEMENTARY_CONF_OPTS += --enable-ethumb
 else
-LIBELEMENTARY_CONF_OPT += --disable-ethumb
+LIBELEMENTARY_CONF_OPTS += --disable-ethumb
 endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
--- a/package/efl/libethumb/libethumb.mk
+++ b/package/efl/libethumb/libethumb.mk
@@ -14,7 +14,7 @@
 
 LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
 
-LIBETHUMB_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
 
 ifeq ($(BR2_PACKAGE_LIBEXIF),y)
 LIBETHUMB_DEPENDENCIES += libexif
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -15,7 +15,7 @@
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
 
 # For now, we only support the SVG loader
-LIBEVAS_GENERIC_LOADERS_CONF_OPT += \
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
 	--disable-poppler \
 	--disable-spectre \
 	--disable-libraw \
@@ -23,9 +23,9 @@
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
-LIBEVAS_GENERIC_LOADERS_CONF_OPT += --enable-svg
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
 else
-LIBEVAS_GENERIC_LOADERS_CONF_OPT += --disable-svg
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-svg
 endif
 
 $(eval $(autotools-package))
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -16,7 +16,7 @@
 
 HOST_LIBEVAS_DEPENDENCIES = host-pkgconf host-zlib host-libeina \
 				host-freetype host-libpng host-libjpeg
-HOST_LIBEVAS_CONF_OPT += \
+HOST_LIBEVAS_CONF_OPTS += \
 	--enable-image-loader-png \
 	--enable-image-loader-jpeg \
 	--disable-image-loader-gif \
@@ -33,71 +33,71 @@
 
 # rendering options
 ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
-LIBEVAS_CONF_OPT += --enable-scale-sample
+LIBEVAS_CONF_OPTS += --enable-scale-sample
 else
-LIBEVAS_CONF_OPT += --disable-scale-sample
+LIBEVAS_CONF_OPTS += --disable-scale-sample
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
-LIBEVAS_CONF_OPT += --enable-scale-smooth
+LIBEVAS_CONF_OPTS += --enable-scale-smooth
 else
-LIBEVAS_CONF_OPT += --disable-scale-smooth
+LIBEVAS_CONF_OPTS += --disable-scale-smooth
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_SMALL_DITHERING),y)
-LIBEVAS_CONF_OPT += --enable-small-dither-mask
+LIBEVAS_CONF_OPTS += --enable-small-dither-mask
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_LINE_DITHERING),y)
-LIBEVAS_CONF_OPT += --enable-line-dither-mask
+LIBEVAS_CONF_OPTS += --enable-line-dither-mask
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_NO_DITHERING),y)
-LIBEVAS_CONF_OPT += --enable-no-dither-mask
+LIBEVAS_CONF_OPTS += --enable-no-dither-mask
 endif
 
 # backends
 ifeq ($(BR2_PACKAGE_LIBEVAS_BUFFER),y)
-LIBEVAS_CONF_OPT += --enable-buffer
+LIBEVAS_CONF_OPTS += --enable-buffer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
-LIBEVAS_CONF_OPT += --enable-software-xlib
+LIBEVAS_CONF_OPTS += --enable-software-xlib
 LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
-LIBEVAS_CONF_OPT += --enable-gl-xlib
+LIBEVAS_CONF_OPTS += --enable-gl-xlib
 LIBEVAS_DEPENDENCIES += xproto_glproto xlib_libX11 xlib_libXrender \
 			xlib_libXext libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
-LIBEVAS_CONF_OPT += --enable-software-xcb
+LIBEVAS_CONF_OPTS += --enable-software-xcb
 LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util pixman
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XCB_GLX),y)
-LIBEVAS_CONF_OPT += --enable-gl-xcb
+LIBEVAS_CONF_OPTS += --enable-gl-xcb
 LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util xproto_glproto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_FB),y)
-LIBEVAS_CONF_OPT += --enable-fb
+LIBEVAS_CONF_OPTS += --enable-fb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_DIRECTFB),y)
-LIBEVAS_CONF_OPT += --enable-directfb
+LIBEVAS_CONF_OPTS += --enable-directfb
 LIBEVAS_DEPENDENCIES += directfb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_SDL),y)
-LIBEVAS_CONF_OPT += --enable-software-sdl
+LIBEVAS_CONF_OPTS += --enable-software-sdl
 LIBEVAS_DEPENDENCIES += sdl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
-LIBEVAS_CONF_OPT += --enable-gl-sdl
+LIBEVAS_CONF_OPTS += --enable-gl-sdl
 LIBEVAS_DEPENDENCIES += sdl
 # configure script forgets to check for eet / fill this out
 LIBEVAS_CONF_ENV += \
@@ -110,97 +110,97 @@
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
-LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-sgx
+LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
-LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
+LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
 endif
 
 # code options
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-LIBEVAS_CONF_OPT += --enable-cpu-mmx
+LIBEVAS_CONF_OPTS += --enable-cpu-mmx
 else
-LIBEVAS_CONF_OPT += --disable-cpu-mmx
+LIBEVAS_CONF_OPTS += --disable-cpu-mmx
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-LIBEVAS_CONF_OPT += --enable-cpu-sse
+LIBEVAS_CONF_OPTS += --enable-cpu-sse
 else
-LIBEVAS_CONF_OPT += --disable-cpu-sse
+LIBEVAS_CONF_OPTS += --disable-cpu-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
-LIBEVAS_CONF_OPT += --enable-cpu-sse3
+LIBEVAS_CONF_OPTS += --enable-cpu-sse3
 else
-LIBEVAS_CONF_OPT += --disable-cpu-sse3
+LIBEVAS_CONF_OPTS += --disable-cpu-sse3
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-LIBEVAS_CONF_OPT += --enable-cpu-altivec
+LIBEVAS_CONF_OPTS += --enable-cpu-altivec
 else
-LIBEVAS_CONF_OPT += --disable-cpu-altivec
+LIBEVAS_CONF_OPTS += --disable-cpu-altivec
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-LIBEVAS_CONF_OPT += --enable-cpu-neon
+LIBEVAS_CONF_OPTS += --enable-cpu-neon
 else
-LIBEVAS_CONF_OPT += --disable-cpu-neon
+LIBEVAS_CONF_OPTS += --disable-cpu-neon
 endif
 
 # loaders
 ifeq ($(BR2_PACKAGE_LIBEVAS_PNG),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-png
+LIBEVAS_CONF_OPTS += --enable-image-loader-png
 LIBEVAS_DEPENDENCIES += libpng
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-png
+LIBEVAS_CONF_OPTS += --disable-image-loader-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_JPEG),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-jpeg
+LIBEVAS_CONF_OPTS += --enable-image-loader-jpeg
 LIBEVAS_DEPENDENCIES += jpeg
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-jpeg
+LIBEVAS_CONF_OPTS += --disable-image-loader-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-gif
+LIBEVAS_CONF_OPTS += --enable-image-loader-gif
 LIBEVAS_DEPENDENCIES += libungif
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-gif
+LIBEVAS_CONF_OPTS += --disable-image-loader-gif
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_PMAPS),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-pmaps
+LIBEVAS_CONF_OPTS += --enable-image-loader-pmaps
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-pmaps
+LIBEVAS_CONF_OPTS += --disable-image-loader-pmaps
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-tiff
+LIBEVAS_CONF_OPTS += --enable-image-loader-tiff
 LIBEVAS_DEPENDENCIES += tiff
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-tiff
+LIBEVAS_CONF_OPTS += --disable-image-loader-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_XPM),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-xpm
+LIBEVAS_CONF_OPTS += --enable-image-loader-xpm
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-xpm
+LIBEVAS_CONF_OPTS += --disable-image-loader-xpm
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_EET),y)
-LIBEVAS_CONF_OPT += --enable-image-loader-eet
+LIBEVAS_CONF_OPTS += --enable-image-loader-eet
 LIBEVAS_DEPENDENCIES += libeet
 else
-LIBEVAS_CONF_OPT += --disable-image-loader-eet
+LIBEVAS_CONF_OPTS += --disable-image-loader-eet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_EET_FONT),y)
-LIBEVAS_CONF_OPT += --enable-font-loader-eet
+LIBEVAS_CONF_OPTS += --enable-font-loader-eet
 LIBEVAS_DEPENDENCIES += libeet
 else
-LIBEVAS_CONF_OPT += --disable-font-loader-eet
+LIBEVAS_CONF_OPTS += --disable-font-loader-eet
 endif
 
 # libevas installs the source code of examples on the target, which
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -14,7 +14,7 @@
 
 # It is not exactly a host variant, but more a cross variant, which is
 # why we pass a special --target option.
-HOST_ELF2FLT_CONF_OPT = \
+HOST_ELF2FLT_CONF_OPTS = \
 	--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
 	--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
 	--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -12,7 +12,7 @@
 
 # The tarball does not have a generated configure script
 ELFUTILS_AUTORECONF = YES
-ELFUTILS_CONF_OPT += --disable-werror
+ELFUTILS_CONF_OPTS += --disable-werror
 ELFUTILS_PATCH = \
 	elfutils-portability.patch \
 	elfutils-robustify.patch
@@ -43,29 +43,29 @@
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
  ELFUTILS_DEPENDENCIES += zlib
- ELFUTILS_CONF_OPT += --with-zlib
+ ELFUTILS_CONF_OPTS += --with-zlib
 else
- ELFUTILS_CONF_OPT += --without-zlib
+ ELFUTILS_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
  ELFUTILS_DEPENDENCIES += bzip2
- ELFUTILS_CONF_OPT += --with-bzlib
+ ELFUTILS_CONF_OPTS += --with-bzlib
 else
- ELFUTILS_CONF_OPT += --without-bzlib
+ ELFUTILS_CONF_OPTS += --without-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
  ELFUTILS_DEPENDENCIES += xz
- ELFUTILS_CONF_OPT += --with-lzma
+ ELFUTILS_CONF_OPTS += --with-lzma
 else
- ELFUTILS_CONF_OPT += --without-lzma
+ ELFUTILS_CONF_OPTS += --without-lzma
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS_PROGS),y)
- ELFUTILS_CONF_OPT += --enable-progs
+ ELFUTILS_CONF_OPTS += --enable-progs
 else
- ELFUTILS_CONF_OPT += --disable-progs
+ ELFUTILS_CONF_OPTS += --disable-progs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -24,7 +24,7 @@
 	host-libeet		\
 	xcb-util-keysyms
 
-ENLIGHTENMENT_CONF_OPT = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
+ENLIGHTENMENT_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 			 --with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 			 --disable-rpath
 
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -11,9 +11,9 @@
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	ENSCRIPT_CONF_OPT += --enable-threads=pth
+	ENSCRIPT_CONF_OPTS += --enable-threads=pth
 else
-	ENSCRIPT_CONF_OPT += --disable-threads
+	ENSCRIPT_CONF_OPTS += --disable-threads
 endif
 
 $(eval $(autotools-package))
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -21,30 +21,30 @@
 # for documentation.
 ERLANG_CONF_ENV += erl_xcomp_sysroot=$(STAGING_DIR)
 
-ERLANG_CONF_OPT = --without-javac
-HOST_ERLANG_CONF_OPT = --without-javac
+ERLANG_CONF_OPTS = --without-javac
+HOST_ERLANG_CONF_OPTS = --without-javac
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-ERLANG_CONF_OPT += --with-termcap
+ERLANG_CONF_OPTS += --with-termcap
 ERLANG_DEPENDENCIES += ncurses
 else
-ERLANG_CONF_OPT += --without-termcap
+ERLANG_CONF_OPTS += --without-termcap
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-ERLANG_CONF_OPT += --with-ssl
+ERLANG_CONF_OPTS += --with-ssl
 ERLANG_DEPENDENCIES += openssl
 else
-ERLANG_CONF_OPT += --without-ssl
+ERLANG_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-ERLANG_CONF_OPT += --enable-shared-zlib
+ERLANG_CONF_OPTS += --enable-shared-zlib
 ERLANG_DEPENDENCIES += zlib
 endif
 
 ifeq ($(BR2_PACKAGE_ERLANG_SMP),)
-ERLANG_CONF_OPT += --disable-smp-support
+ERLANG_CONF_OPTS += --disable-smp-support
 endif
 
 # Remove source, example, gs and wx files from the target
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -14,7 +14,7 @@
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
 
-EUDEV_CONF_OPT =		\
+EUDEV_CONF_OPTS =		\
 	--disable-manpages	\
 	--sbindir=/sbin		\
 	--with-rootlibdir=/lib	\
@@ -28,14 +28,14 @@
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_PACKAGE_EUDEV_RULES_GEN),y)
-EUDEV_CONF_OPT += --enable-rule_generator
+EUDEV_CONF_OPTS += --enable-rule_generator
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-EUDEV_CONF_OPT += --enable-gudev
+EUDEV_CONF_OPTS += --enable-gudev
 EUDEV_DEPENDENCIES += libglib2
 else
-EUDEV_CONF_OPT += --disable-gudev
+EUDEV_CONF_OPTS += --disable-gudev
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -19,7 +19,7 @@
 EVEMU_MAKE_ENV = SYSROOT=$(STAGING_DIR)
 
 # disable tests generation because of C++ dependency
-EVEMU_CONF_OPT += --disable-tests
+EVEMU_CONF_OPTS += --disable-tests
 
 # Uses PKG_CHECK_MODULES() in configure.ac
 EVEMU_DEPENDENCIES = host-pkgconf libevdev
@@ -29,10 +29,10 @@
 
 # Check for target python
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-EVEMU_CONF_OPT += --enable-python-bindings
+EVEMU_CONF_OPTS += --enable-python-bindings
 EVEMU_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
 else
-EVEMU_CONF_OPT += --disable-python-bindings
+EVEMU_CONF_OPTS += --disable-python-bindings
 endif
 
 # package source code coming from git, so it doesn't have generated
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -12,7 +12,7 @@
 
 EXPECT_AUTORECONF = YES
 EXPECT_DEPENDENCIES = tcl
-EXPECT_CONF_OPT = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
+EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
 
 # Since we don't want examples installed
 EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)  install-binaries
diff --git a/package/fbdump/fbdump.mk b/package/fbdump/fbdump.mk
--- a/package/fbdump/fbdump.mk
+++ b/package/fbdump/fbdump.mk
@@ -13,9 +13,9 @@
 # of the x86/x86-64 architectures, and causes build problems on some
 # architectures as outw() is not always available.
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
-FBDUMP_CONF_OPT += --enable-vga16fb
+FBDUMP_CONF_OPTS += --enable-vga16fb
 else
-FBDUMP_CONF_OPT += --disable-vga16fb
+FBDUMP_CONF_OPTS += --disable-vga16fb
 endif
 
 $(eval $(autotools-package))
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -15,7 +15,7 @@
 
 FETCHMAIL_CONF_ENV += LIBS="-lz"
 
-FETCHMAIL_CONF_OPT = \
+FETCHMAIL_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr
 
 FETCHMAIL_DEPENDENCIES = \
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -16,7 +16,7 @@
 FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
-FFMPEG_CONF_OPT = \
+FFMPEG_CONF_OPTS = \
 	--prefix=/usr		\
 	--enable-avfilter \
 	--disable-version3 \
@@ -67,257 +67,257 @@
 FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
 ifeq ($(BR2_ENABLE_DEBUG),y)
-FFMPEG_CONF_OPT += --enable-debug
+FFMPEG_CONF_OPTS += --enable-debug
 else
-FFMPEG_CONF_OPT += --disable-debug
+FFMPEG_CONF_OPTS += --disable-debug
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
-FFMPEG_CONF_OPT += --enable-gpl
+FFMPEG_CONF_OPTS += --enable-gpl
 else
-FFMPEG_CONF_OPT += --disable-gpl
+FFMPEG_CONF_OPTS += --disable-gpl
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_NONFREE),y)
-FFMPEG_CONF_OPT += --enable-nonfree
+FFMPEG_CONF_OPTS += --enable-nonfree
 else
-FFMPEG_CONF_OPT += --disable-nonfree
+FFMPEG_CONF_OPTS += --disable-nonfree
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_FFMPEG),y)
-FFMPEG_CONF_OPT += --enable-ffmpeg
+FFMPEG_CONF_OPTS += --enable-ffmpeg
 else
-FFMPEG_CONF_OPT += --disable-ffmpeg
+FFMPEG_CONF_OPTS += --disable-ffmpeg
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_FFPLAY),y)
 FFMPEG_DEPENDENCIES += sdl
-FFMPEG_CONF_OPT += --enable-ffplay
+FFMPEG_CONF_OPTS += --enable-ffplay
 FFMPEG_CONF_ENV += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 else
-FFMPEG_CONF_OPT += --disable-ffplay
+FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_FFSERVER),y)
-FFMPEG_CONF_OPT += --enable-ffserver
+FFMPEG_CONF_OPTS += --enable-ffserver
 else
-FFMPEG_CONF_OPT += --disable-ffserver
+FFMPEG_CONF_OPTS += --disable-ffserver
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
-FFMPEG_CONF_OPT += --enable-postproc
+FFMPEG_CONF_OPTS += --enable-postproc
 else
-FFMPEG_CONF_OPT += --disable-postproc
+FFMPEG_CONF_OPTS += --disable-postproc
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
-FFMPEG_CONF_OPT += --enable-swscale
+FFMPEG_CONF_OPTS += --enable-swscale
 else
-FFMPEG_CONF_OPT += --disable-swscale
+FFMPEG_CONF_OPTS += --disable-swscale
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),all)
-FFMPEG_CONF_OPT += --disable-encoders \
+FFMPEG_CONF_OPTS += --disable-encoders \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),--enable-encoder=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_DECODERS)),all)
-FFMPEG_CONF_OPT += --disable-decoders \
+FFMPEG_CONF_OPTS += --disable-decoders \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_DECODERS)),--enable-decoder=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_MUXERS)),all)
-FFMPEG_CONF_OPT += --disable-muxers \
+FFMPEG_CONF_OPTS += --disable-muxers \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_MUXERS)),--enable-muxer=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_DEMUXERS)),all)
-FFMPEG_CONF_OPT += --disable-demuxers \
+FFMPEG_CONF_OPTS += --disable-demuxers \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_DEMUXERS)),--enable-demuxer=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PARSERS)),all)
-FFMPEG_CONF_OPT += --disable-parsers \
+FFMPEG_CONF_OPTS += --disable-parsers \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_PARSERS)),--enable-parser=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),all)
-FFMPEG_CONF_OPT += --disable-bsfs \
+FFMPEG_CONF_OPTS += --disable-bsfs \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsfs=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),all)
-FFMPEG_CONF_OPT += --disable-protocols \
+FFMPEG_CONF_OPTS += --disable-protocols \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),--enable-protocol=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_FILTERS)),all)
-FFMPEG_CONF_OPT += --disable-filters \
+FFMPEG_CONF_OPTS += --disable-filters \
 	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_FILTERS)),--enable-filter=$(x))
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS),y)
-FFMPEG_CONF_OPT += --enable-indevs
+FFMPEG_CONF_OPTS += --enable-indevs
 else
-FFMPEG_CONF_OPT += --disable-indevs
+FFMPEG_CONF_OPTS += --disable-indevs
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_OUTDEVS),y)
-FFMPEG_CONF_OPT += --enable-outdevs
+FFMPEG_CONF_OPTS += --enable-outdevs
 else
-FFMPEG_CONF_OPT += --disable-outdevs
+FFMPEG_CONF_OPTS += --disable-outdevs
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-FFMPEG_CONF_OPT += --enable-pthreads
+FFMPEG_CONF_OPTS += --enable-pthreads
 else
-FFMPEG_CONF_OPT += --disable-pthreads
+FFMPEG_CONF_OPTS += --disable-pthreads
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-FFMPEG_CONF_OPT += --enable-zlib
+FFMPEG_CONF_OPTS += --enable-zlib
 FFMPEG_DEPENDENCIES += zlib
 else
-FFMPEG_CONF_OPT += --disable-zlib
+FFMPEG_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-FFMPEG_CONF_OPT += --enable-bzlib
+FFMPEG_CONF_OPTS += --enable-bzlib
 FFMPEG_DEPENDENCIES += bzip2
 else
-FFMPEG_CONF_OPT += --disable-bzlib
+FFMPEG_CONF_OPTS += --disable-bzlib
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # openssl isn't license compatible with GPL
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
-FFMPEG_CONF_OPT += --disable-openssl
+FFMPEG_CONF_OPTS += --disable-openssl
 else
-FFMPEG_CONF_OPT += --enable-openssl
+FFMPEG_CONF_OPTS += --enable-openssl
 FFMPEG_DEPENDENCIES += openssl
 endif
 else
-FFMPEG_CONF_OPT += --disable-openssl
+FFMPEG_CONF_OPTS += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 FFMPEG_DEPENDENCIES += libvorbis
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--enable-libvorbis \
 	--enable-muxer=ogg \
 	--enable-encoder=libvorbis
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVA),y)
-FFMPEG_CONF_OPT += --enable-vaapi
+FFMPEG_CONF_OPTS += --enable-vaapi
 FFMPEG_DEPENDENCIES += libva
 else
-FFMPEG_CONF_OPT += --disable-vaapi
+FFMPEG_CONF_OPTS += --disable-vaapi
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-FFMPEG_CONF_OPT += --enable-yasm
+FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
 else
-FFMPEG_CONF_OPT += --disable-yasm
-FFMPEG_CONF_OPT += --disable-mmx
+FFMPEG_CONF_OPTS += --disable-yasm
+FFMPEG_CONF_OPTS += --disable-mmx
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-FFMPEG_CONF_OPT += --enable-sse
+FFMPEG_CONF_OPTS += --enable-sse
 else
-FFMPEG_CONF_OPT += --disable-sse
+FFMPEG_CONF_OPTS += --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-FFMPEG_CONF_OPT += --enable-sse2
+FFMPEG_CONF_OPTS += --enable-sse2
 else
-FFMPEG_CONF_OPT += --disable-sse2
+FFMPEG_CONF_OPTS += --disable-sse2
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
-FFMPEG_CONF_OPT += --enable-sse3
+FFMPEG_CONF_OPTS += --enable-sse3
 else
-FFMPEG_CONF_OPT += --disable-sse3
+FFMPEG_CONF_OPTS += --disable-sse3
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-FFMPEG_CONF_OPT += --enable-ssse3
+FFMPEG_CONF_OPTS += --enable-ssse3
 else
-FFMPEG_CONF_OPT += --disable-ssse3
+FFMPEG_CONF_OPTS += --disable-ssse3
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
-FFMPEG_CONF_OPT += --enable-sse4
+FFMPEG_CONF_OPTS += --enable-sse4
 else
-FFMPEG_CONF_OPT += --disable-sse4
+FFMPEG_CONF_OPTS += --disable-sse4
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
-FFMPEG_CONF_OPT += --enable-sse42
+FFMPEG_CONF_OPTS += --enable-sse42
 else
-FFMPEG_CONF_OPT += --disable-sse42
+FFMPEG_CONF_OPTS += --disable-sse42
 endif
 
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
-FFMPEG_CONF_OPT += --disable-armv5te
+FFMPEG_CONF_OPTS += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
-FFMPEG_CONF_OPT += --enable-armv6
+FFMPEG_CONF_OPTS += --enable-armv6
 else
-FFMPEG_CONF_OPT += --disable-armv6 --disable-armv6t2
+FFMPEG_CONF_OPTS += --disable-armv6 --disable-armv6t2
 endif
 ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s)$(BR2_cortex_a5)$(BR2_cortex_a8)$(BR2_cortex_a9)$(BR2_cortex_a15),y)
-FFMPEG_CONF_OPT += --enable-vfp
+FFMPEG_CONF_OPTS += --enable-vfp
 else
-FFMPEG_CONF_OPT += --disable-vfp
+FFMPEG_CONF_OPTS += --disable-vfp
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-FFMPEG_CONF_OPT += --enable-neon
+FFMPEG_CONF_OPTS += --enable-neon
 endif
 
 ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--disable-mipsfpu
 else
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--enable-mipsfpu
 endif
 
 ifeq ($(BR2_mips_32r2),y)
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--enable-mips32r2
 else
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--disable-mips32r2
 endif
 
 ifeq ($(BR2_mips_64r2),y)
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--enable-mipsdspr1 \
 	--enable-mipsdspr2
 else
-FFMPEG_CONF_OPT += \
+FFMPEG_CONF_OPTS += \
 	--disable-mipsdspr1 \
 	--disable-mipsdspr2
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-FFMPEG_CONF_OPT += --enable-altivec
+FFMPEG_CONF_OPTS += --enable-altivec
 else
-FFMPEG_CONF_OPT += --disable-altivec
+FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-FFMPEG_CONF_OPT += --enable-pic
+FFMPEG_CONF_OPTS += --enable-pic
 else
-FFMPEG_CONF_OPT += --disable-pic
+FFMPEG_CONF_OPTS += --disable-pic
 endif
 
-FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
+FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
@@ -336,7 +336,7 @@
 		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
 		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
-		$(FFMPEG_CONF_OPT) \
+		$(FFMPEG_CONF_OPTS) \
 	)
 endef
 
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -12,23 +12,23 @@
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPLv2+ (tools), LGPLv2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
-FLAC_CONF_OPT = \
+FLAC_CONF_OPTS = \
 	--disable-cpplibs \
 	--disable-xmms-plugin \
 	--disable-altivec
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
-FLAC_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
+FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
 FLAC_DEPENDENCIES += libogg
 else
-FLAC_CONF_OPT += --disable-ogg
+FLAC_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
 FLAC_DEPENDENCIES += host-nasm
-FLAC_CONF_OPT += --enable-sse
+FLAC_CONF_OPTS += --enable-sse
 else
-FLAC_CONF_OPT += --disable-sse
+FLAC_CONF_OPTS += --disable-sse
 endif
 
 $(eval $(autotools-package))
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -9,7 +9,7 @@
 FLANN_INSTALL_STAGING = YES
 FLANN_LICENSE = BSD-3c
 FLANN_LICENSE_FILES = COPYING
-FLANN_CONF_OPT = \
+FLANN_CONF_OPTS = \
 	-DBUILD_C_BINDINGS=ON \
 	-DBUILD_PYTHON_BINDINGS=OFF \
 	-DBUILD_MATLAB_BINDINGS=OFF \
diff --git a/package/flickcurl/flickcurl.mk b/package/flickcurl/flickcurl.mk
--- a/package/flickcurl/flickcurl.mk
+++ b/package/flickcurl/flickcurl.mk
@@ -10,7 +10,7 @@
 FLICKCURL_LICENSE_FILES = COPYING COPYING.LIB LICENSE-2.0.txt LICENSE.html
 FLICKCURL_INSTALL_STAGING = YES
 FLICKCURL_CONFIG_SCRIPTS = flickcurl-config
-FLICKCURL_CONF_OPT = --without-curl-config --without-xml2-config --without-raptor
+FLICKCURL_CONF_OPTS = --without-curl-config --without-xml2-config --without-raptor
 FLICKCURL_DEPENDENCIES = libcurl libxml2 host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FLICKCURL_UTILS),)
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -43,9 +43,9 @@
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 FLITE_DEPENDENCIES += alsa-lib
-FLITE_CONF_OPT += --with-audio=alsa
+FLITE_CONF_OPTS += --with-audio=alsa
 else
-FLITE_CONF_OPT += --with-audio=oss
+FLITE_CONF_OPTS += --with-audio=oss
 endif
 
 $(eval $(autotools-package))
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -8,7 +8,7 @@
 FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
-FLTK_CONF_OPT = --enable-threads --with-x --disable-gl \
+FLTK_CONF_OPTS = --enable-threads --with-x --disable-gl \
 	--disable-localjpeg --disable-localpng --disable-localzlib
 FLTK_DEPENDENCIES = jpeg libpng xlib_libX11 xlib_libXext xlib_libXt
 FLTK_CONFIG_SCRIPTS = fltk-config
@@ -16,7 +16,7 @@
 FLTK_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
-FLTK_CONF_OPT += --enable-cairo
+FLTK_CONF_OPTS += --enable-cairo
 FLTK_DEPENDENCIES += cairo
 endif
 
@@ -24,13 +24,13 @@
 FLTK_CONF_ENV += ac_cv_path_FTCONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 FLTK_DEPENDENCIES += xlib_libXft
 else
-FLTK_CONF_OPT += --disable-xft
+FLTK_CONF_OPTS += --disable-xft
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 FLTK_DEPENDENCIES += xlib_libXinerama
 else
-FLTK_CONF_OPT += --disable-xinerama
+FLTK_CONF_OPTS += --disable-xinerama
 endif
 
 $(eval $(autotools-package))
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -12,15 +12,15 @@
 
 FLUXBOX_AUTORECONF = YES
 
-FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+FLUXBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
-FLUXBOX_CONF_OPT += --enable-imlib2 --with-imlib2-prefix=$(STAGING_DIR)/usr
+FLUXBOX_CONF_OPTS += --enable-imlib2 --with-imlib2-prefix=$(STAGING_DIR)/usr
 FLUXBOX_DEPENDENCIES += imlib2
 else
-FLUXBOX_CONF_OPT += --disable-imlib2
+FLUXBOX_CONF_OPTS += --disable-imlib2
 endif
 
 define FLUXBOX_INSTALL_XSESSION_FILE
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -11,11 +11,11 @@
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 
-FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
+FONTCONFIG_CONF_OPTS = --with-arch=$(GNU_TARGET_NAME) \
 		--with-cache-dir=/var/cache/fontconfig \
 		--disable-docs
 
-HOST_FONTCONFIG_CONF_OPT = \
+HOST_FONTCONFIG_CONF_OPTS = \
 		--disable-static
 
 $(eval $(autotools-package))
diff --git a/package/foomatic-filters/foomatic-filters.mk b/package/foomatic-filters/foomatic-filters.mk
--- a/package/foomatic-filters/foomatic-filters.mk
+++ b/package/foomatic-filters/foomatic-filters.mk
@@ -9,14 +9,14 @@
 FOOMATIC_FILTERS_LICENSE = GPLv2+
 FOOMATIC_FILTERS_LICENSE_FILES = COPYING
 FOOMATIC_FILTERS_DEPENDENCIES = cups libusb enscript
-FOOMATIC_FILTERS_CONF_OPT = --with-file-converter=enscript
+FOOMATIC_FILTERS_CONF_OPTS = --with-file-converter=enscript
 FOOMATIC_FILTERS_CONF_ENV = ac_cv_path_ENSCRIPT="/usr/bin/enscript"
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-FOOMATIC_FILTERS_CONF_OPT += --enable-dbus
+FOOMATIC_FILTERS_CONF_OPTS += --enable-dbus
 FOOMATIC_FILTERS_DEPENDENCIES += dbus
 else
-FOOMATIC_FILTERS_CONF_OPT += --disable-dbus
+FOOMATIC_FILTERS_CONF_OPTS += --disable-dbus
 endif
 
 $(eval $(autotools-package))
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -13,52 +13,52 @@
 FREERDP_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-FREERDP_CONF_OPT += -DWITH_CUPS=ON
+FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
 else
-FREERDP_CONF_OPT += -DWITH_CUPS=OFF
+FREERDP_CONF_OPTS += -DWITH_CUPS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-FREERDP_CONF_OPT += -DWITH_FFMPEG=ON
+FREERDP_CONF_OPTS += -DWITH_FFMPEG=ON
 FREERDP_DEPENDENCIES += ffmpeg
 else
-FREERDP_CONF_OPT += -DWITH_FFMPEG=OFF
+FREERDP_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-FREERDP_CONF_OPT += -DWITH_ALSA=ON
+FREERDP_CONF_OPTS += -DWITH_ALSA=ON
 FREERDP_DEPENDENCIES += alsa-lib
 else
-FREERDP_CONF_OPT += -DWITH_ALSA=OFF
+FREERDP_CONF_OPTS += -DWITH_ALSA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-FREERDP_CONF_OPT += -DWITH_PULSEAUDIO=ON
+FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=ON
 FREERDP_DEPENDENCIES += pulseaudio
 else
-FREERDP_CONF_OPT += -DWITH_PULSEAUDIO=OFF
+FREERDP_CONF_OPTS += -DWITH_PULSEAUDIO=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-FREERDP_CONF_OPT += -DWITH_XINERAMA=ON
+FREERDP_CONF_OPTS += -DWITH_XINERAMA=ON
 FREERDP_DEPENDENCIES += xlib_libXinerama
 else
-FREERDP_CONF_OPT += -DWITH_XINERAMA=OFF
+FREERDP_CONF_OPTS += -DWITH_XINERAMA=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
-FREERDP_CONF_OPT += -DWITH_XKBFILE=ON
+FREERDP_CONF_OPTS += -DWITH_XKBFILE=ON
 FREERDP_DEPENDENCIES += xlib_libxkbfile
 else
-FREERDP_CONF_OPT += -DWITH_XKBFILE=OFF
+FREERDP_CONF_OPTS += -DWITH_XKBFILE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-FREERDP_CONF_OPT += -DWITH_XV=ON
+FREERDP_CONF_OPTS += -DWITH_XV=ON
 FREERDP_DEPENDENCIES += xlib_libXv
 else
-FREERDP_CONF_OPT += -DWITH_XV=OFF
+FREERDP_CONF_OPTS += -DWITH_XV=OFF
 endif
 
 $(eval $(cmake-package))
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -15,7 +15,7 @@
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
-HOST_FREETYPE_CONF_OPT = --without-zlib --without-bzip2 --without-png
+HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
 
 # Regen required because the tarball ships with an experimental ltmain.sh
 # that can't be patched by our infra.
@@ -32,25 +32,25 @@
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 FREETYPE_DEPENDENCIES += zlib
-FREETYPE_CONF_OPT += --with-zlib
+FREETYPE_CONF_OPTS += --with-zlib
 else
-FREETYPE_CONF_OPT += --without-zlib
+FREETYPE_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 FREETYPE_DEPENDENCIES += bzip2
-FREETYPE_CONF_OPT += --with-bzip2
+FREETYPE_CONF_OPTS += --with-bzip2
 else
-FREETYPE_CONF_OPT += --without-bzip2
+FREETYPE_CONF_OPTS += --without-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREETYPE_DEPENDENCIES += libpng
-FREETYPE_CONF_OPT += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
+FREETYPE_CONF_OPTS += LIBPNG_CFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --cflags`" \
 	LIBPNG_LDFLAGS="`$(STAGING_DIR)/usr/bin/libpng-config --ldflags`"
 FREETYPE_LIBPNG_LIBS = "`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
 else
-FREETYPE_CONF_OPT += --without-png
+FREETYPE_CONF_OPTS += --without-png
 endif
 
 # Extra fixing since includedir and libdir are expanded from configure values
diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -10,10 +10,10 @@
 GAMIN_INSTALL_STAGING = YES
 GAMIN_LICENSE = LGPLv2+
 GAMIN_LICENSE_FILES = COPYING
-GAMIN_CONF_OPT = --disable-debug
+GAMIN_CONF_OPTS = --disable-debug
 
 # python support broken
-GAMIN_CONF_OPT += --without-python
+GAMIN_CONF_OPTS += --without-python
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
 
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -36,7 +36,7 @@
                 --prefix="$(HOST_DIR)/usr" \
                 --sysconfdir="$(HOST_DIR)/etc" \
                 --enable-static \
-                $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
+                $(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
         )
 endef
 
@@ -48,28 +48,28 @@
 GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
 GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
 
-HOST_GCC_FINAL_CONF_OPT = \
-	$(HOST_GCC_COMMON_CONF_OPT) \
+HOST_GCC_FINAL_CONF_OPTS = \
+	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
 	$(DISABLE_LARGEFILE) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-HOST_GCC_FINAL_CONF_OPT += --disable-shared
+HOST_GCC_FINAL_CONF_OPTS += --disable-shared
 else
-HOST_GCC_FINAL_CONF_OPT += --enable-shared
+HOST_GCC_FINAL_CONF_OPTS += --enable-shared
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-HOST_GCC_FINAL_CONF_OPT += --enable-libgomp
+HOST_GCC_FINAL_CONF_OPTS += --enable-libgomp
 else
-HOST_GCC_FINAL_CONF_OPT += --disable-libgomp
+HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
 endif
 
 # End with user-provided options, so that they can override previously
 # defined options.
-HOST_GCC_FINAL_CONF_OPT += \
+HOST_GCC_FINAL_CONF_OPTS += \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 HOST_GCC_FINAL_CONF_ENV = \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -36,8 +36,8 @@
 HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
 endif
 
-HOST_GCC_INITIAL_CONF_OPT = \
-	$(HOST_GCC_COMMON_CONF_OPT) \
+HOST_GCC_INITIAL_CONF_OPTS = \
+	$(HOST_GCC_COMMON_CONF_OPTS) \
 	--enable-languages=c \
 	--disable-shared \
 	--without-headers \
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -91,7 +91,7 @@
 	host-mpfr \
 	$(if $(BR2_BINFMT_FLAT),host-elf2flt)
 
-HOST_GCC_COMMON_CONF_OPT = \
+HOST_GCC_COMMON_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--with-sysroot=$(STAGING_DIR) \
 	--disable-__cxa_atexit \
@@ -110,54 +110,54 @@
 # Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-HOST_GCC_COMMON_CONF_OPT += --disable-target-optspace
+HOST_GCC_COMMON_CONF_OPTS += --disable-target-optspace
 endif
 else
-HOST_GCC_COMMON_CONF_OPT += --enable-target-optspace
+HOST_GCC_COMMON_CONF_OPTS += --enable-target-optspace
 endif
 
 # gcc 4.6.x quadmath requires wchar
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-libquadmath
+HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
 # libsanitizer requires wordexp, not in default uClibc config. Also
 # doesn't build properly with musl.
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-libsanitizer
+HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
 ifeq ($(BR2_GCC_ENABLE_TLS),y)
-HOST_GCC_COMMON_CONF_OPT += --enable-tls
+HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 else
-HOST_GCC_COMMON_CONF_OPT += --disable-tls
+HOST_GCC_COMMON_CONF_OPTS += --disable-tls
 endif
 
 ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
-HOST_GCC_COMMON_CONF_OPT += --enable-libmudflap
+HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
 else
-HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+HOST_GCC_COMMON_CONF_OPTS += --disable-libmudflap
 endif
 
 ifeq ($(BR2_PTHREADS_NONE),y)
-HOST_GCC_COMMON_CONF_OPT += \
+HOST_GCC_COMMON_CONF_OPTS += \
 	--disable-threads \
 	--disable-libitm \
 	--disable-libatomic
 else
-HOST_GCC_COMMON_CONF_OPT += --enable-threads
+HOST_GCC_COMMON_CONF_OPTS += --enable-threads
 endif
 
 ifeq ($(BR2_GCC_NEEDS_MPC),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-mpc
-HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-mpc=$(HOST_DIR)/usr
 endif
 
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-isl host-cloog
-HOST_GCC_COMMON_CONF_OPT += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
+HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)/usr --with-cloog=$(HOST_DIR)/usr
 else
-HOST_GCC_COMMON_CONF_OPT += --without-isl --without-cloog
+HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
 ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
@@ -168,60 +168,60 @@
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 # powerpc seems to be needing it as well
 ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
-HOST_GCC_COMMON_CONF_OPT += --with-float=soft
+HOST_GCC_COMMON_CONF_OPTS += --with-float=soft
 endif
 endif
 
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-decimal-float
+HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
 endif
 
 # Determine arch/tune/abi/cpu options
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-HOST_GCC_COMMON_CONF_OPT += --with-arch=$(BR2_GCC_TARGET_ARCH)
+HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-HOST_GCC_COMMON_CONF_OPT += --with-tune=$(BR2_GCC_TARGET_TUNE)
+HOST_GCC_COMMON_CONF_OPTS += --with-tune=$(BR2_GCC_TARGET_TUNE)
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-HOST_GCC_COMMON_CONF_OPT += --with-abi=$(BR2_GCC_TARGET_ABI)
+HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
 endif
 # GCC doesn't support --with-cpu for bfin
 ifeq ($(BR2_bfin),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
 else
-HOST_GCC_COMMON_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
 endif
 endif
 endif
 
 GCC_TARGET_FPU = $(call qstrip,$(BR2_GCC_TARGET_FPU))
 ifneq ($(GCC_TARGET_FPU),)
-HOST_GCC_COMMON_CONF_OPT += --with-fpu=$(GCC_TARGET_FPU)
+HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
 endif
 
 GCC_TARGET_FLOAT_ABI = $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 ifneq ($(GCC_TARGET_FLOAT_ABI),)
-HOST_GCC_COMMON_CONF_OPT += --with-float=$(GCC_TARGET_FLOAT_ABI)
+HOST_GCC_COMMON_CONF_OPTS += --with-float=$(GCC_TARGET_FLOAT_ABI)
 endif
 
 GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 ifneq ($(GCC_TARGET_MODE),)
-HOST_GCC_COMMON_CONF_OPT += --with-mode=$(GCC_TARGET_MODE)
+HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
 
 # Branding works on >= 4.3
 ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
-HOST_GCC_COMMON_CONF_OPT += \
+HOST_GCC_COMMON_CONF_OPTS += \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 	--with-bugurl="http://bugs.buildroot.net/"
 endif
 
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
-HOST_GCC_COMMON_CONF_OPT += \
+HOST_GCC_COMMON_CONF_OPTS += \
 	--enable-e500_double \
 	--with-long-double-128
 endif
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -12,35 +12,35 @@
 GD_LICENSE_FILES = COPYING
 
 GD_CONFIG_SCRIPTS = gdlib-config
-GD_CONF_OPT = --without-x --disable-rpath
+GD_CONF_OPTS = --without-x --disable-rpath
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 GD_DEPENDENCIES += fontconfig
-GD_CONF_OPT += --with-fontconfig
+GD_CONF_OPTS += --with-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 GD_DEPENDENCIES += freetype
-GD_CONF_OPT += --with-freetype=$(STAGING_DIR)/usr
+GD_CONF_OPTS += --with-freetype=$(STAGING_DIR)/usr
 else
-GD_CONF_OPT += --without-freetype
+GD_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 GD_DEPENDENCIES += jpeg
-GD_CONF_OPT += --with-jpeg
+GD_CONF_OPTS += --with-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
-GD_CONF_OPT += --with-png=$(STAGING_DIR)/usr
+GD_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
 else
-GD_CONF_OPT += --without-png
+GD_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 GD_DEPENDENCIES += xlib_libXpm
-GD_CONF_OPT += --with-xpm
+GD_CONF_OPTS += --with-xpm
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -58,7 +58,7 @@
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it.
-GDB_DISABLE_BINUTILS_CONF_OPT = \
+GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-binutils \
 	--disable-ld \
 	--disable-gas
@@ -74,28 +74,28 @@
 	bash_cv_have_mbstate_t=yes \
 	gdb_cv_func_sigsetjmp=yes
 
-GDB_CONF_OPT = \
+GDB_CONF_OPTS = \
 	--without-uiout \
 	--disable-gdbtk \
 	--without-x \
 	--disable-sim \
-	$(GDB_DISABLE_BINUTILS_CONF_OPT) \
+	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
 	--with-curses \
 	--without-included-gettext \
 	--disable-werror
 
 ifeq ($(BR2_PACKAGE_GDB_TUI),y)
-	GDB_CONF_OPT += --enable-tui
+	GDB_CONF_OPTS += --enable-tui
 else
-	GDB_CONF_OPT += --disable-tui
+	GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),y)
-	GDB_CONF_OPT += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
+	GDB_CONF_OPTS += --with-python=$(TOPDIR)/package/gdb/gdb-python-config
 	GDB_DEPENDENCIES += python
 else
-	GDB_CONF_OPT += --without-python
+	GDB_CONF_OPTS += --without-python
 endif
 
 # This removes some unneeded Python scripts and XML target description
@@ -127,7 +127,7 @@
 #  * --disable-shared, otherwise the old 6.7 version specific to AVR32
 #    doesn't build because it wants to link a shared libbfd.so against
 #    non-PIC liberty.a.
-HOST_GDB_CONF_OPT = \
+HOST_GDB_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--enable-static --disable-shared \
 	--without-uiout \
@@ -136,20 +136,20 @@
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
-	$(GDB_DISABLE_BINUTILS_CONF_OPT) \
+	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--disable-sim
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
-	HOST_GDB_CONF_OPT += --enable-tui
+	HOST_GDB_CONF_OPTS += --enable-tui
 else
-	HOST_GDB_CONF_OPT += --disable-tui
+	HOST_GDB_CONF_OPTS += --disable-tui
 endif
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_PYTHON),y)
-	HOST_GDB_CONF_OPT += --with-python
+	HOST_GDB_CONF_OPTS += --with-python
 	HOST_GDB_DEPENDENCIES += host-python
 else
-	HOST_GDB_CONF_OPT += --without-python
+	HOST_GDB_CONF_OPTS += --without-python
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -16,28 +16,28 @@
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
 	gio_can_sniff=no
 
-GDK_PIXBUF_CONF_OPT = --disable-glibtest
+GDK_PIXBUF_CONF_OPTS = --disable-glibtest
 
 ifneq ($(BR2_PACKAGE_LIBPNG),y)
-GDK_PIXBUF_CONF_OPT += --without-libpng
+GDK_PIXBUF_CONF_OPTS += --without-libpng
 else
 GDK_PIXBUF_DEPENDENCIES += libpng
 endif
 
 ifneq ($(BR2_PACKAGE_JPEG),y)
-GDK_PIXBUF_CONF_OPT += --without-libjpeg
+GDK_PIXBUF_CONF_OPTS += --without-libjpeg
 else
 GDK_PIXBUF_DEPENDENCIES += jpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF),y)
-GDK_PIXBUF_CONF_OPT += --without-libtiff
+GDK_PIXBUF_CONF_OPTS += --without-libtiff
 else
 GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GDK_PIXBUF_CONF_OPT += --with-x11
+GDK_PIXBUF_CONF_OPTS += --with-x11
 GDK_PIXBUF_DEPENDENCIES += xlib_libX11
 endif
 
@@ -54,7 +54,7 @@
 
 $(eval $(autotools-package))
 
-HOST_GDK_PIXBUF_CONF_OPT = \
+HOST_GDK_PIXBUF_CONF_OPTS = \
 	--without-libjpeg \
 	--without-libtiff
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -13,7 +13,7 @@
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
 
-GETTEXT_CONF_OPT += \
+GETTEXT_CONF_OPTS += \
 	--disable-libasprintf \
 	--disable-acl \
 	--disable-openmp \
@@ -24,7 +24,7 @@
 	--disable-relocatable \
 	--without-emacs
 
-HOST_GETTEXT_CONF_OPT = \
+HOST_GETTEXT_CONF_OPTS = \
 	--disable-libasprintf \
 	--disable-acl \
 	--disable-openmp \
@@ -69,7 +69,7 @@
 # instead select BR2_PACKAGE_GETTEXT. Those packages need to be
 # fixed before we can remove the following 3 lines... :-(
 ifeq ($(BR2_ENABLE_LOCALE),)
-GETTEXT_CONF_OPT += --enable-nls
+GETTEXT_CONF_OPTS += --enable-nls
 endif
 
 # Disable interactive confirmation in host gettextize for package fixups
diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -9,7 +9,7 @@
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
-GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
+GIBLIB_CONF_OPTS = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
 GIBLIB_LICENSE = MIT
diff --git a/package/git/git.mk b/package/git/git.mk
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -12,45 +12,45 @@
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	GIT_DEPENDENCIES += openssl
-	GIT_CONF_OPT += --with-openssl
+	GIT_CONF_OPTS += --with-openssl
 else
-	GIT_CONF_OPT += --without-openssl
+	GIT_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_PERL),y)
 	GIT_DEPENDENCIES += perl
-	GIT_CONF_OPT += --with-libpcre
+	GIT_CONF_OPTS += --with-libpcre
 else
-	GIT_CONF_OPT += --without-libpcre
+	GIT_CONF_OPTS += --without-libpcre
 endif
 
 ifeq ($(BR2_PACKAGE_CURL),y)
 	GIT_DEPENDENCIES += curl
-	GIT_CONF_OPT += --with-curl
+	GIT_CONF_OPTS += --with-curl
 else
-	GIT_CONF_OPT += --without-curl
+	GIT_CONF_OPTS += --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 	GIT_DEPENDENCIES += expat
-	GIT_CONF_OPT += --with-expat
+	GIT_CONF_OPTS += --with-expat
 else
-	GIT_CONF_OPT += --without-expat
+	GIT_CONF_OPTS += --without-expat
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 	GIT_DEPENDENCIES += libiconv
 	GIT_CONF_ENV += LIBS=-liconv
-	GIT_CONF_OPT += --with-iconv=/usr/lib
+	GIT_CONF_OPTS += --with-iconv=/usr/lib
 else
-	GIT_CONF_OPT += --without-iconv
+	GIT_CONF_OPTS += --without-iconv
 endif
 
 ifeq ($(BR2_PACKAGE_TCL),y)
 	GIT_DEPENDENCIES += tcl
-	GIT_CONF_OPT += --with-tcltk
+	GIT_CONF_OPTS += --with-tcltk
 else
-	GIT_CONF_OPT += --without-tcltk
+	GIT_CONF_OPTS += --without-tcltk
 endif
 
 # assume yes for these tests, configure will bail out otherwise
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -19,9 +19,9 @@
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
-GLIB_NETWORKING_CONF_OPT += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+GLIB_NETWORKING_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-GLIB_NETWORKING_CONF_OPT += --without-gnutls
+GLIB_NETWORKING_CONF_OPTS += --without-gnutls
 endif
 
 # gnutls 3.x+ doesn't use libgcrypt, it uses nettle/hogweed
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -7,7 +7,7 @@
 GMPC_VERSION = 11.8.16
 GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
 GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
-GMPC_CONF_OPT = --disable-mmkeys --disable-unique
+GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
 GMPC_LICENSE = GPLv2+
 GMPC_LICENSE_FILES = COPYING
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -11,10 +11,10 @@
 GNUPG_LICENSE_FILES = COPYING
 GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
-GNUPG_CONF_OPT = --disable-rpath --enable-minimal --disable-regex
+GNUPG_CONF_OPTS = --disable-rpath --enable-minimal --disable-regex
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-GNUPG_CONF_OPT += --enable-bzip2
+GNUPG_CONF_OPTS += --enable-bzip2
 GNUPG_DEPENDENCIES += bzip2
 endif
 
@@ -22,19 +22,19 @@
 GNUPG_CONF_ENV += ac_cv_path__libcurl_config=$(STAGING_DIR)/usr/bin/curl-config
 GNUPG_DEPENDENCIES += libcurl
 else
-GNUPG_CONF_OPT += --without-libcurl
+GNUPG_CONF_OPTS += --without-libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GNUPG_DEPENDENCIES += readline
 else
-GNUPG_CONF_OPT += --without-readline
+GNUPG_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_GNUPG_RSA),y)
-GNUPG_CONF_OPT += --enable-rsa
+GNUPG_CONF_OPTS += --enable-rsa
 else
-GNUPG_CONF_OPT += --disable-rsa
+GNUPG_CONF_OPTS += --disable-rsa
 endif
 
 ifneq ($(BR2_PACKAGE_GNUPG_GPGV),y)
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -11,7 +11,7 @@
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libpthsem \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-GNUPG2_CONF_OPT = \
+GNUPG2_CONF_OPTS = \
 	--disable-rpath --disable-regex --disable-doc \
 	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -11,7 +11,7 @@
 
 GNUPLOT_AUTORECONF = YES
 
-GNUPLOT_CONF_OPT = --without-x \
+GNUPLOT_CONF_OPTS = --without-x \
 		--disable-raise-console \
 		--disable-mouse \
 	        --without-tutorial \
@@ -25,19 +25,19 @@
 	        --without-cairo
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
-GNUPLOT_CONF_OPT += --with-gd
+GNUPLOT_CONF_OPTS += --with-gd
 GNUPLOT_DEPENDENCIES += gd
 GNUPLOT_CONF_ENV += \
 	ac_cv_path_GDLIB_CONFIG=$(STAGING_DIR)/usr/bin/gdlib-config
 else
-GNUPLOT_CONF_OPT += --without-gd
+GNUPLOT_CONF_OPTS += --without-gd
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-GNUPLOT_CONF_OPT += --with-readline=gnu
+GNUPLOT_CONF_OPTS += --with-readline=gnu
 GNUPLOT_DEPENDENCIES += readline
 else
-GNUPLOT_CONF_OPT += --without-readline
+GNUPLOT_CONF_OPTS += --without-readline
 endif
 
 # Remove Javascript scripts, lua scripts, PostScript files
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -15,7 +15,7 @@
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
 	$(if $(BR2_PACKAGE_LIBTASN1),libtasn1) \
 	$(if $(BR2_PACKAGE_ZLIB),zlib)
-GNUTLS_CONF_OPT = \
+GNUTLS_CONF_OPTS = \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--disable-rpath \
 	--disable-doc \
@@ -29,26 +29,26 @@
 GNUTLS_INSTALL_STAGING = YES
 
 # libpthread and libz autodetection poison the linkpath
-GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
-GNUTLS_CONF_OPT += $(if $(BR2_PACKAGE_ZLIB),--with-libz-prefix=$(STAGING_DIR)/usr)
+GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
+GNUTLS_CONF_OPTS += $(if $(BR2_PACKAGE_ZLIB),--with-libz-prefix=$(STAGING_DIR)/usr)
 
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
 GNUTLS_CONF_ENV += libopts_cv_with_libregex=yes
-GNUTLS_CONF_OPT += --with-regex-header=pcreposix.h \
+GNUTLS_CONF_OPTS += --with-regex-header=pcreposix.h \
 	--with-libregex-cflags="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --cflags`" \
 	--with-libregex-libs="`$(PKG_CONFIG_HOST_BINARY) libpcreposix --libs`"
 
 # Consider crywrap as part of tools because it needs WCHAR, and it's so too
 ifeq ($(BR2_PACKAGE_GNUTLS_TOOLS),)
-	GNUTLS_CONF_OPT += --disable-crywrap
+	GNUTLS_CONF_OPTS += --disable-crywrap
 endif
 
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
-GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
+GNUTLS_CONF_OPTS += $(if $(BR2_USE_MMU),,--disable-crywrap)
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
-	GNUTLS_CONF_OPT += --enable-cryptodev
+	GNUTLS_CONF_OPTS += --enable-cryptodev
 	GNUTLS_DEPENDENCIES += cryptodev-linux
 endif
 
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -7,7 +7,7 @@
 GOOGLE_BREAKPAD_VERSION = 1373
 GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
 GOOGLE_BREAKPAD_SITE_METHOD = svn
-GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
+GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
 # Only a static library is installed
 GOOGLE_BREAKPAD_INSTALL_TARGET = NO
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -30,7 +30,7 @@
 # and as it's better to have gpm support in ncurses that the contrary, we force
 # gpm to not look after ncurses explicitly.
 # http://invisible-island.net/ncurses/ncurses.faq.html#using_gpm_lib
-GPM_CONF_OPT = --without-curses
+GPM_CONF_OPTS = --without-curses
 
 # configure is missing but gpm seems not compatible with our autoreconf
 # mechanism so we have to do it manually instead of using GPM_AUTORECONF = YES
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,7 +9,7 @@
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
+GREP_CONF_OPTS = --disable-perl-regexp --without-included-regex
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # link with iconv if enabled
@@ -20,7 +20,7 @@
 
 # link with pcre if enabled
 ifeq ($(BR2_PACKAGE_PCRE),y)
-GREP_CONF_OPT += --enable-perl-regexp
+GREP_CONF_OPTS += --enable-perl-regexp
 GREP_DEPENDENCIES += pcre
 endif
 
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -73,6 +73,6 @@
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
 endif
 
-GST_FFMPEG_CONF_OPT = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
+GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -28,9 +28,9 @@
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 GST_FSL_PLUGINS_DEPENDENCIES += xlib_libX11
-GST_FSL_PLUGINS_CONF_OPT += --enable-x11
+GST_FSL_PLUGINS_CONF_OPTS += --enable-x11
 else
-GST_FSL_PLUGINS_CONF_OPT += --disable-x11
+GST_FSL_PLUGINS_CONF_OPTS += --disable-x11
 endif
 
 # Autoreconf requires an m4 directory to exist
diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
--- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
@@ -8,7 +8,7 @@
 GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
 GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 
-GST_PLUGINS_BAD_CONF_OPT = \
+GST_PLUGINS_BAD_CONF_OPTS = \
 		--disable-examples
 
 GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
@@ -18,564 +18,564 @@
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
+GST_PLUGINS_BAD_CONF_OPTS += --enable-adpcmdec
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmdec
+GST_PLUGINS_BAD_CONF_OPTS += --disable-adpcmdec
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-adpcmenc
+GST_PLUGINS_BAD_CONF_OPTS += --enable-adpcmenc
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-adpcmenc
+GST_PLUGINS_BAD_CONF_OPTS += --disable-adpcmenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AIFF),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-aiff
+GST_PLUGINS_BAD_CONF_OPTS += --enable-aiff
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-aiff
+GST_PLUGINS_BAD_CONF_OPTS += --disable-aiff
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ASFMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-asfmux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-asfmux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-asfmux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-asfmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
+GST_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-audiovisualizers
+GST_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
+GST_PLUGINS_BAD_CONF_OPTS += --enable-autoconvert
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
+GST_PLUGINS_BAD_CONF_OPTS += --disable-autoconvert
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-bayer
+GST_PLUGINS_BAD_CONF_OPTS += --enable-bayer
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-bayer
+GST_PLUGINS_BAD_CONF_OPTS += --disable-bayer
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin
+GST_PLUGINS_BAD_CONF_OPTS += --enable-camerabin
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin
+GST_PLUGINS_BAD_CONF_OPTS += --disable-camerabin
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-camerabin2
+GST_PLUGINS_BAD_CONF_OPTS += --enable-camerabin2
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-camerabin2
+GST_PLUGINS_BAD_CONF_OPTS += --disable-camerabin2
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-cdxaparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-cdxaparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-cdxaparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
+GST_PLUGINS_BAD_CONF_OPTS += --enable-coloreffects
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
+GST_PLUGINS_BAD_CONF_OPTS += --disable-coloreffects
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_COLORSPACE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-colorspace
+GST_PLUGINS_BAD_CONF_OPTS += --enable-colorspace
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-colorspace
+GST_PLUGINS_BAD_CONF_OPTS += --disable-colorspace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dataurisrc
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dataurisrc
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dataurisrc
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dataurisrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dccp
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dccp
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dccp
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dccp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-debugutils
+GST_PLUGINS_BAD_CONF_OPTS += --enable-debugutils
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-debugutils
+GST_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DECKLINK),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-decklink
+GST_PLUGINS_BAD_CONF_OPTS += --enable-decklink
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-decklink
+GST_PLUGINS_BAD_CONF_OPTS += --disable-decklink
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dtmf
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dtmf
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dtmf
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvbsuboverlay
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dvbsuboverlay
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dvdspu
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dvdspu
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-faceoverlay
+GST_PLUGINS_BAD_CONF_OPTS += --enable-faceoverlay
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-faceoverlay
+GST_PLUGINS_BAD_CONF_OPTS += --disable-faceoverlay
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-festival
+GST_PLUGINS_BAD_CONF_OPTS += --enable-festival
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-festival
+GST_PLUGINS_BAD_CONF_OPTS += --disable-festival
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-fieldanalysis
+GST_PLUGINS_BAD_CONF_OPTS += --enable-fieldanalysis
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
+GST_PLUGINS_BAD_CONF_OPTS += --disable-fieldanalysis
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-freeze
+GST_PLUGINS_BAD_CONF_OPTS += --enable-freeze
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-freeze
+GST_PLUGINS_BAD_CONF_OPTS += --disable-freeze
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-freeverb
+GST_PLUGINS_BAD_CONF_OPTS += --enable-freeverb
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-freeverb
+GST_PLUGINS_BAD_CONF_OPTS += --disable-freeverb
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREI0R),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-frei0r
+GST_PLUGINS_BAD_CONF_OPTS += --enable-frei0r
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-frei0r
+GST_PLUGINS_BAD_CONF_OPTS += --disable-frei0r
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-gaudieffects
+GST_PLUGINS_BAD_CONF_OPTS += --enable-gaudieffects
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-gaudieffects
+GST_PLUGINS_BAD_CONF_OPTS += --disable-gaudieffects
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-geometrictransform
+GST_PLUGINS_BAD_CONF_OPTS += --enable-geometrictransform
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-geometrictransform
+GST_PLUGINS_BAD_CONF_OPTS += --disable-geometrictransform
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_GSETTINGS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-gsettings
+GST_PLUGINS_BAD_CONF_OPTS += --enable-gsettings
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-gsettings
+GST_PLUGINS_BAD_CONF_OPTS += --disable-gsettings
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_H264PARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-h264parse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-h264parse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-h264parse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-h264parse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-hdvparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-hdvparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-hdvparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_HLS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-hls
+GST_PLUGINS_BAD_CONF_OPTS += --enable-hls
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-hls
+GST_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_ID3TAG),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-id3tag
+GST_PLUGINS_BAD_CONF_OPTS += --enable-id3tag
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-id3tag
+GST_PLUGINS_BAD_CONF_OPTS += --disable-id3tag
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-inter
+GST_PLUGINS_BAD_CONF_OPTS += --enable-inter
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-inter
+GST_PLUGINS_BAD_CONF_OPTS += --disable-inter
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_INTERLACE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-interlace
+GST_PLUGINS_BAD_CONF_OPTS += --enable-interlace
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-interlace
+GST_PLUGINS_BAD_CONF_OPTS += --disable-interlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-ivfparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-ivfparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-ivfparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
+GST_PLUGINS_BAD_CONF_OPTS += --enable-jp2kdecimator
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-jp2kdecimator
+GST_PLUGINS_BAD_CONF_OPTS += --disable-jp2kdecimator
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-jpegformat
+GST_PLUGINS_BAD_CONF_OPTS += --enable-jpegformat
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
+GST_PLUGINS_BAD_CONF_OPTS += --disable-jpegformat
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-legacyresample
+GST_PLUGINS_BAD_CONF_OPTS += --enable-legacyresample
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-legacyresample
+GST_PLUGINS_BAD_CONF_OPTS += --disable-legacyresample
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBRFB),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-librfb
+GST_PLUGINS_BAD_CONF_OPTS += --enable-librfb
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-librfb
+GST_PLUGINS_BAD_CONF_OPTS += --disable-librfb
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LINSYS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-linsys
+GST_PLUGINS_BAD_CONF_OPTS += --enable-linsys
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-linsys
+GST_PLUGINS_BAD_CONF_OPTS += --disable-linsys
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-liveadder
+GST_PLUGINS_BAD_CONF_OPTS += --enable-liveadder
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-liveadder
+GST_PLUGINS_BAD_CONF_OPTS += --disable-liveadder
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegdemux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegpsmux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegpsmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsdemux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsdemux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsdemux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsmux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MPEGVIDEOPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mpegvideoparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mpegvideoparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mpegvideoparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mpegvideoparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MVE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mve
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mve
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mve
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mve
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MXF),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-mxf
+GST_PLUGINS_BAD_CONF_OPTS += --enable-mxf
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-mxf
+GST_PLUGINS_BAD_CONF_OPTS += --disable-mxf
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NSF),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-nsf
+GST_PLUGINS_BAD_CONF_OPTS += --enable-nsf
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-nsf
+GST_PLUGINS_BAD_CONF_OPTS += --disable-nsf
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-nuvdemux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-nuvdemux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-nuvdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-patchdetect
+GST_PLUGINS_BAD_CONF_OPTS += --enable-patchdetect
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-patchdetect
+GST_PLUGINS_BAD_CONF_OPTS += --disable-patchdetect
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-pcapparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-pcapparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_PNM),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-pnm
+GST_PLUGINS_BAD_CONF_OPTS += --enable-pnm
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-pnm
+GST_PLUGINS_BAD_CONF_OPTS += --disable-pnm
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-rawparse
+GST_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-rawparse
+GST_PLUGINS_BAD_CONF_OPTS += --disable-rawparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REAL),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-real
+GST_PLUGINS_BAD_CONF_OPTS += --enable-real
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-real
+GST_PLUGINS_BAD_CONF_OPTS += --disable-real
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-removesilence
+GST_PLUGINS_BAD_CONF_OPTS += --enable-removesilence
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-removesilence
+GST_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPMUX),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-rtpmux
+GST_PLUGINS_BAD_CONF_OPTS += --enable-rtpmux
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-rtpmux
+GST_PLUGINS_BAD_CONF_OPTS += --disable-rtpmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RTPVP8),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-rtpvp8
+GST_PLUGINS_BAD_CONF_OPTS += --enable-rtpvp8
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-rtpvp8
+GST_PLUGINS_BAD_CONF_OPTS += --disable-rtpvp8
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SCALETEMPO),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-scaletempo
+GST_PLUGINS_BAD_CONF_OPTS += --enable-scaletempo
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-scaletempo
+GST_PLUGINS_BAD_CONF_OPTS += --disable-scaletempo
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDI),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-sdi
+GST_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-sdi
+GST_PLUGINS_BAD_CONF_OPTS += --disable-sdi
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDP),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-sdp
+GST_PLUGINS_BAD_CONF_OPTS += --enable-sdp
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-sdp
+GST_PLUGINS_BAD_CONF_OPTS += --disable-sdp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-segmentclip
+GST_PLUGINS_BAD_CONF_OPTS += --enable-segmentclip
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-segmentclip
+GST_PLUGINS_BAD_CONF_OPTS += --disable-segmentclip
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SIREN),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-siren
+GST_PLUGINS_BAD_CONF_OPTS += --enable-siren
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-siren
+GST_PLUGINS_BAD_CONF_OPTS += --disable-siren
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SMOOTH),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-smooth
+GST_PLUGINS_BAD_CONF_OPTS += --enable-smooth
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-smooth
+GST_PLUGINS_BAD_CONF_OPTS += --disable-smooth
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SPEED),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-speed
+GST_PLUGINS_BAD_CONF_OPTS += --enable-speed
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-speed
+GST_PLUGINS_BAD_CONF_OPTS += --disable-speed
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SUBENC),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-subenc
+GST_PLUGINS_BAD_CONF_OPTS += --enable-subenc
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-subenc
+GST_PLUGINS_BAD_CONF_OPTS += --disable-subenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_STEREO),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-stereo
+GST_PLUGINS_BAD_CONF_OPTS += --enable-stereo
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-stereo
+GST_PLUGINS_BAD_CONF_OPTS += --disable-stereo
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TTA),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-tta
+GST_PLUGINS_BAD_CONF_OPTS += --enable-tta
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-tta
+GST_PLUGINS_BAD_CONF_OPTS += --disable-tta
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-videofilters
+GST_PLUGINS_BAD_CONF_OPTS += --enable-videofilters
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-videofilters
+GST_PLUGINS_BAD_CONF_OPTS += --disable-videofilters
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMAXRATE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-videomaxrate
+GST_PLUGINS_BAD_CONF_OPTS += --enable-videomaxrate
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-videomaxrate
+GST_PLUGINS_BAD_CONF_OPTS += --disable-videomaxrate
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-videomeasure
+GST_PLUGINS_BAD_CONF_OPTS += --enable-videomeasure
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
+GST_PLUGINS_BAD_CONF_OPTS += --disable-videomeasure
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-videoparsers
+GST_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-videoparsers
+GST_PLUGINS_BAD_CONF_OPTS += --disable-videoparsers
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-videosignal
+GST_PLUGINS_BAD_CONF_OPTS += --enable-videosignal
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-videosignal
+GST_PLUGINS_BAD_CONF_OPTS += --disable-videosignal
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VMNC),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-vmnc
+GST_PLUGINS_BAD_CONF_OPTS += --enable-vmnc
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-vmnc
+GST_PLUGINS_BAD_CONF_OPTS += --disable-vmnc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-y4m
+GST_PLUGINS_BAD_CONF_OPTS += --enable-y4m
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-y4m
+GST_PLUGINS_BAD_CONF_OPTS += --disable-y4m
 endif
 
 # plugins with deps
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
 GST_PLUGINS_BAD_DEPENDENCIES += openssl
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+GST_PLUGINS_BAD_CONF_OPTS += --disable-apexsink
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BZ2),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-bz2
+GST_PLUGINS_BAD_CONF_OPTS += --enable-bz2
 GST_PLUGINS_BAD_DEPENDENCIES += bzip2
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-bz2
+GST_PLUGINS_BAD_CONF_OPTS += --disable-bz2
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST_PLUGINS_BAD_CONF_OPTS += --enable-cdaudio
 GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+GST_PLUGINS_BAD_CONF_OPTS += --disable-cdaudio
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-curl
+GST_PLUGINS_BAD_CONF_OPTS += --enable-curl
 GST_PLUGINS_BAD_DEPENDENCIES += libcurl
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-curl
+GST_PLUGINS_BAD_CONF_OPTS += --disable-curl
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-directfb
+GST_PLUGINS_BAD_CONF_OPTS += --enable-directfb
 GST_PLUGINS_BAD_DEPENDENCIES += directfb
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-directfb
+GST_PLUGINS_BAD_CONF_OPTS += --disable-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-dvb
+GST_PLUGINS_BAD_CONF_OPTS += --enable-dvb
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
+GST_PLUGINS_BAD_CONF_OPTS += --disable-dvb
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST_PLUGINS_BAD_CONF_OPTS += --enable-faad
 GST_PLUGINS_BAD_DEPENDENCIES += faad2
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-faad
+GST_PLUGINS_BAD_CONF_OPTS += --disable-faad
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
+GST_PLUGINS_BAD_CONF_OPTS += --enable-fbdev
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-fbdev
+GST_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-libmms
+GST_PLUGINS_BAD_CONF_OPTS += --enable-libmms
 GST_PLUGINS_BAD_DEPENDENCIES += libmms
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-libmms
+GST_PLUGINS_BAD_CONF_OPTS += --disable-libmms
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-musepack
+GST_PLUGINS_BAD_CONF_OPTS += --enable-musepack
 GST_PLUGINS_BAD_DEPENDENCIES += musepack
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-musepack
+GST_PLUGINS_BAD_CONF_OPTS += --disable-musepack
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_NEON),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-neon
+GST_PLUGINS_BAD_CONF_OPTS += --enable-neon
 GST_PLUGINS_BAD_DEPENDENCIES += neon
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-neon
+GST_PLUGINS_BAD_CONF_OPTS += --disable-neon
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-opus
+GST_PLUGINS_BAD_CONF_OPTS += --enable-opus
 GST_PLUGINS_BAD_DEPENDENCIES += opus
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-opus
+GST_PLUGINS_BAD_CONF_OPTS += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-rsvg
+GST_PLUGINS_BAD_CONF_OPTS += --enable-rsvg
 GST_PLUGINS_BAD_DEPENDENCIES += librsvg
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-rsvg
+GST_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
 GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
+GST_PLUGINS_BAD_CONF_OPTS += --enable-sdl
 GST_PLUGINS_BAD_DEPENDENCIES += sdl
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-sdl
+GST_PLUGINS_BAD_CONF_OPTS += --disable-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SNDFILE),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-sndfile
+GST_PLUGINS_BAD_CONF_OPTS += --enable-sndfile
 GST_PLUGINS_BAD_DEPENDENCIES += libsndfile
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-sndfile
+GST_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_VCD),y)
-GST_PLUGINS_BAD_CONF_OPT += --enable-vcd
+GST_PLUGINS_BAD_CONF_OPTS += --enable-vcd
 else
-GST_PLUGINS_BAD_CONF_OPT += --disable-vcd
+GST_PLUGINS_BAD_CONF_OPTS += --disable-vcd
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
--- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
+++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
@@ -16,7 +16,7 @@
 		FT2_CONFIG=/bin/false \
 		ac_cv_header_stdint_t="stdint.h"
 
-GST_PLUGINS_BASE_CONF_OPT = \
+GST_PLUGINS_BASE_CONF_OPTS = \
 		--disable-examples \
 		--disable-oggtest \
 		--disable-vorbistest \
@@ -26,12 +26,12 @@
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST_PLUGINS_BASE_CONF_OPT += \
+GST_PLUGINS_BASE_CONF_OPTS += \
 	--enable-x \
 	--enable-xshm \
 	--enable-xvideo
 else
-GST_PLUGINS_BASE_CONF_OPT += \
+GST_PLUGINS_BASE_CONF_OPTS += \
 	--disable-x \
 	--disable-xshm \
 	--disable-xvideo
@@ -44,150 +44,150 @@
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ALSA),y)
 GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-alsa
+GST_PLUGINS_BASE_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-adder
+GST_PLUGINS_BASE_CONF_OPTS += --enable-adder
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-adder
+GST_PLUGINS_BASE_CONF_OPTS += --disable-adder
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-app
+GST_PLUGINS_BASE_CONF_OPTS += --enable-app
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-app
+GST_PLUGINS_BASE_CONF_OPTS += --disable-app
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-audioconvert
+GST_PLUGINS_BASE_CONF_OPTS += --enable-audioconvert
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-audioconvert
+GST_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-audiorate
+GST_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-audiorate
+GST_PLUGINS_BASE_CONF_OPTS += --disable-audiorate
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-audioresample
+GST_PLUGINS_BASE_CONF_OPTS += --enable-audioresample
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-audioresample
+GST_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-audiotestsrc
+GST_PLUGINS_BASE_CONF_OPTS += --enable-audiotestsrc
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-audiotestsrc
+GST_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ENCODING),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-encoding
+GST_PLUGINS_BASE_CONF_OPTS += --enable-encoding
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-encoding
+GST_PLUGINS_BASE_CONF_OPTS += --disable-encoding
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_FFMPEGCOLORSPACE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-ffmpegcolorspace
+GST_PLUGINS_BASE_CONF_OPTS += --enable-ffmpegcolorspace
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-ffmpegcolorspace
+GST_PLUGINS_BASE_CONF_OPTS += --disable-ffmpegcolorspace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_GDP),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-gdp
+GST_PLUGINS_BASE_CONF_OPTS += --enable-gdp
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-gdp
+GST_PLUGINS_BASE_CONF_OPTS += --disable-gdp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-playback
+GST_PLUGINS_BASE_CONF_OPTS += --enable-playback
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-playback
+GST_PLUGINS_BASE_CONF_OPTS += --disable-playback
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-subparse
+GST_PLUGINS_BASE_CONF_OPTS += --enable-subparse
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-subparse
+GST_PLUGINS_BASE_CONF_OPTS += --disable-subparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TCP),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-tcp
+GST_PLUGINS_BASE_CONF_OPTS += --enable-tcp
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-tcp
+GST_PLUGINS_BASE_CONF_OPTS += --disable-tcp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-typefind
+GST_PLUGINS_BASE_CONF_OPTS += --enable-typefind
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-typefind
+GST_PLUGINS_BASE_CONF_OPTS += --disable-typefind
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-videotestsrc
+GST_PLUGINS_BASE_CONF_OPTS += --enable-videotestsrc
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-videotestsrc
+GST_PLUGINS_BASE_CONF_OPTS += --disable-videotestsrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-videorate
+GST_PLUGINS_BASE_CONF_OPTS += --enable-videorate
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-videorate
+GST_PLUGINS_BASE_CONF_OPTS += --disable-videorate
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-videoscale
+GST_PLUGINS_BASE_CONF_OPTS += --enable-videoscale
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-videoscale
+GST_PLUGINS_BASE_CONF_OPTS += --disable-videoscale
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VOLUME),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-volume
+GST_PLUGINS_BASE_CONF_OPTS += --enable-volume
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-volume
+GST_PLUGINS_BASE_CONF_OPTS += --disable-volume
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_OGG),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-ogg
+GST_PLUGINS_BASE_CONF_OPTS += --enable-ogg
 GST_PLUGINS_BASE_DEPENDENCIES += libogg
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-ogg
+GST_PLUGINS_BASE_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-pango
+GST_PLUGINS_BASE_CONF_OPTS += --enable-pango
 GST_PLUGINS_BASE_DEPENDENCIES += pango
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-pango
+GST_PLUGINS_BASE_CONF_OPTS += --disable-pango
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_THEORA),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-theora
+GST_PLUGINS_BASE_CONF_OPTS += --enable-theora
 GST_PLUGINS_BASE_DEPENDENCIES += libtheora
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-theora
+GST_PLUGINS_BASE_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_TREMOR),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-ivorbis
+GST_PLUGINS_BASE_CONF_OPTS += --enable-ivorbis
 GST_PLUGINS_BASE_DEPENDENCIES += tremor
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-ivorbis
+GST_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_VORBIS),y)
-GST_PLUGINS_BASE_CONF_OPT += --enable-vorbis
+GST_PLUGINS_BASE_CONF_OPTS += --enable-vorbis
 GST_PLUGINS_BASE_DEPENDENCIES += libvorbis
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-vorbis
+GST_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_PLUGINS_BASE_DEPENDENCIES += zlib
 else
-GST_PLUGINS_BASE_CONF_OPT += --disable-zlib
+GST_PLUGINS_BASE_CONF_OPTS += --disable-zlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
--- a/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
+++ b/package/gstreamer/gst-plugins-good/gst-plugins-good.mk
@@ -8,7 +8,7 @@
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.xz
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
-GST_PLUGINS_GOOD_CONF_OPT = \
+GST_PLUGINS_GOOD_CONF_OPTS = \
 		--disable-debug \
 		--disable-examples \
 		--disable-directsound \
@@ -25,369 +25,369 @@
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST_PLUGINS_GOOD_CONF_OPT += \
+GST_PLUGINS_GOOD_CONF_OPTS += \
 	--enable-x \
 	--enable-xshm \
 	--enable-xvideo
 else
-GST_PLUGINS_GOOD_CONF_OPT += \
+GST_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-x \
 	--disable-xshm \
 	--disable-xvideo
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-jpeg
 GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PNG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-libpng
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-libpng
 GST_PLUGINS_GOOD_DEPENDENCIES += libpng
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-libpng
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-libpng
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_BZ2),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-bz2
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-bz2
 GST_PLUGINS_GOOD_DEPENDENCIES += bzip2
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-bz2
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-bz2
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_ZLIB),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-zlib
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
 GST_PLUGINS_GOOD_DEPENDENCIES += zlib
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-zlib
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ALPHA),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-alpha
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-alpha
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-alpha
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-alpha
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-apetag
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-apetag
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-apetag
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-apetag
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-audiofx
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-audiofx
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-audiofx
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-audiofx
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-audioparsers
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-audioparsers
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-audioparsers
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-audioparsers
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-auparse
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-auparse
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-auparse
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-auparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-autodetect
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-autodetect
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-autodetect
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-autodetect
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AVI),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-avi
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-avi
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-avi
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-avi
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CUTTER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-cutter
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-cutter
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-cutter
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-cutter
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-debugutils
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-debugutils
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-debugutils
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-debugutils
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-deinterlace
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-deinterlace
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-deinterlace
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-deinterlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-effectv
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-effectv
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-effectv
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-effectv
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-equalizer
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-equalizer
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-equalizer
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-equalizer
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLV),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-flv
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-flv
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-flv
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-flv
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-flx
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-flx
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-flx
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-flx
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-goom
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-goom
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-goom
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-goom
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-goom2k1
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-goom2k1
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-id3demux
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-id3demux
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-id3demux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-icydemux
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-icydemux
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-icydemux
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-icydemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-imagefreeze
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-imagefreeze
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-imagefreeze
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-imagefreeze
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-interleave
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-interleave
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-interleave
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-interleave
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-isomp4
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-isomp4
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-isomp4
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-law
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-law
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-law
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-law
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LEVEL),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-level
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-level
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-level
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-level
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-matroska
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-matroska
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-matroska
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-matroska
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-monoscope
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-monoscope
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-monoscope
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-monoscope
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-multifile
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-multifile
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-multifile
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-multifile
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-multipart
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-multipart
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-multipart
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-multipart
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-replaygain
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-replaygain
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-replaygain
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-replaygain
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTP),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-rtp
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtp
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-rtp
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-rtpmanager
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtpmanager
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-rtpmanager
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtpmanager
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_RTSP),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-rtsp
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-rtsp
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-rtsp
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-rtsp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-shapewipe
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-shapewipe
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-shapewipe
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-shapewipe
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SMPTE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-smpte
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-smpte
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-smpte
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-smpte
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-spectrum
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-spectrum
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-spectrum
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-spectrum
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-udp
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-udp
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-udp
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-udp
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-videobox
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-videobox
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-videobox
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-videobox
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-videocrop
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-videocrop
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-videocrop
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-videocrop
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-videofilter
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-videofilter
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-videomixer
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-videomixer
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-videomixer
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-videomixer
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-wavenc
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavenc
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavparse
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_Y4M),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-y4m
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-y4m
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-y4m
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-y4m
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_V4L2),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-gst_v4l2
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-gst_v4l2
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-gst_v4l2
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ANNODEX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-annodex
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-annodex
 GST_PLUGINS_GOOD_DEPENDENCIES += libxml2
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-annodex
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-annodex
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_CAIRO),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-cairo
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-cairo
 GST_PLUGINS_GOOD_DEPENDENCIES += cairo
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-cairo
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-cairo
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-flac
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-flac
 GST_PLUGINS_GOOD_DEPENDENCIES += flac
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-gdk_pixbuf
 GST_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-gdk_pixbuf
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-oss
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-oss
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-oss
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-oss
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-oss4
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-oss4
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-oss4
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-pulse
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-pulse
 GST_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-pulse
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-pulse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-soup
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-soup
 GST_PLUGINS_GOOD_DEPENDENCIES += libsoup
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-soup
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-soup
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-speex
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-speex
 GST_PLUGINS_GOOD_DEPENDENCIES += speex
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST_PLUGINS_GOOD_CONF_OPTS += --enable-wavpack
 GST_PLUGINS_GOOD_DEPENDENCIES += wavpack
 else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+GST_PLUGINS_GOOD_CONF_OPTS += --disable-wavpack
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
--- a/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/gstreamer/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -8,78 +8,78 @@
 GST_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST_PLUGINS_UGLY_VERSION).tar.xz
 GST_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 
-GST_PLUGINS_UGLY_CONF_OPT = \
+GST_PLUGINS_UGLY_CONF_OPTS = \
 		--disable-examples
 
 GST_PLUGINS_UGLY_DEPENDENCIES = gstreamer gst-plugins-base
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-asfdemux
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-asfdemux
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-dvdlpcmdec
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-dvdlpcmdec
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-dvdsub
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-dvdsub
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_IEC958),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-iec958
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-iec958
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-iec958
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-iec958
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGAUDIOPARSE),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-mpegaudioparse
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpegaudioparse
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-mpegaudioparse
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpegaudioparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEGSTREAM),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-mpegstream
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpegstream
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-mpegstream
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpegstream
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-realmedia
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-realmedia
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-synaesthesia
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-synaesthesia
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-synaesthesia
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-synaesthesia
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-lame
 GST_PLUGINS_UGLY_DEPENDENCIES += lame
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-lame
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-lame
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-mad
 GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-mad
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-mad
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
-GST_PLUGINS_UGLY_CONF_OPT += --enable-mpeg2dec
+GST_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
 else
-GST_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
+GST_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gstreamer/gstreamer.mk b/package/gstreamer/gstreamer/gstreamer.mk
--- a/package/gstreamer/gstreamer/gstreamer.mk
+++ b/package/gstreamer/gstreamer/gstreamer.mk
@@ -19,7 +19,7 @@
 GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
 endif
 
-GSTREAMER_CONF_OPT = \
+GSTREAMER_CONF_OPTS = \
 		--disable-examples \
 		--disable-tests \
 		--disable-failing-tests \
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -12,7 +12,7 @@
 GST_OMX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-GST_OMX_CONF_OPT = \
+GST_OMX_CONF_OPTS = \
 	--with-omx-target=rpi
 GST_OMX_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) \
@@ -22,7 +22,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_BELLAGIO),y)
-GST_OMX_CONF_OPT = \
+GST_OMX_CONF_OPTS = \
 	--with-omx-target=bellagio
 GST_OMX_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) \
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -77,7 +77,7 @@
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
 endif
 
-GST1_LIBAV_CONF_OPT = \
+GST1_LIBAV_CONF_OPTS = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -16,7 +16,7 @@
 GST1_PLUGINS_BAD_AUTORECONF_OPTS = -I $(@D)/common/m4
 GST1_PLUGINS_BAD_GETTEXTIZE = YES
 
-GST1_PLUGINS_BAD_CONF_OPT = \
+GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-examples \
 	--disable-debug \
 	--disable-valgrind \
@@ -34,7 +34,7 @@
 	--disable-acm
 
 # Options which require currently unpackaged libraries
-GST1_PLUGINS_BAD_CONF_OPT += \
+GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-avc \
 	--disable-quicktime \
 	--disable-opensles \
@@ -88,589 +88,589 @@
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
-GST1_PLUGINS_BAD_CONF_OPT += --enable-orc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
 endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += bluez_utils
-GST1_PLUGINS_BAD_CONF_OPT += --enable-bluez
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-bluez
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-bluez
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-bluez
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ACCURIP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-accurip
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-accurip
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-accurip
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-accurip
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMDEC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-adpcmdec
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-adpcmdec
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-adpcmdec
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-adpcmdec
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ADPCMENC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-adpcmenc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-adpcmenc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-adpcmenc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-adpcmenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AIFF),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-aiff
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-aiff
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-aiff
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-aiff
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASFMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-asfmux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-asfmux
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-asfmux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-asfmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-audiofxbad
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiofxbad
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-audiofxbad
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiofxbad
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-audiomixer
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixer
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-audiomixer
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiomixer
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-compositor
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-compositor
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-compositor
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiovisualizers
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-audiovisualizers
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiovisualizers
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUTOCONVERT),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-autoconvert
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-autoconvert
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-autoconvert
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-autoconvert
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BAYER),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-bayer
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-bayer
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-bayer
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-bayer
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CAMERABIN2),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-camerabin2
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-camerabin2
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-camerabin2
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-camerabin2
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDXAPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-cdxaparse
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-cdxaparse
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-cdxaparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COLOREFFECTS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-coloreffects
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-coloreffects
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-coloreffects
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-coloreffects
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DATAURISRC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dataurisrc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dataurisrc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dataurisrc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dataurisrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DCCP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dccp
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dccp
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dccp
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dccp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-debugutils
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-debugutils
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-debugutils
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dvbsuboverlay
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dvbsuboverlay
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvbsuboverlay
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVDSPU),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvdspu
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dvdspu
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvdspu
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FACEOVERLAY),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-faceoverlay
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-faceoverlay
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-faceoverlay
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-faceoverlay
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FESTIVAL),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-festival
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-festival
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-festival
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-festival
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FIELDANALYSIS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-fieldanalysis
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-fieldanalysis
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-fieldanalysis
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-fieldanalysis
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREEVERB),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-freeverb
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-freeverb
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-freeverb
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-freeverb
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FREI0R),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-frei0r
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-frei0r
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-frei0r
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-frei0r
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GAUDIEFFECTS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-gaudieffects
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-gaudieffects
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-gaudieffects
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-gaudieffects
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GEOMETRICTRANSFORM),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-geometrictransform
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-geometrictransform
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-geometrictransform
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-geometrictransform
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GDP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-gdp
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-gdp
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-gdp
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-gdp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HDVPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-hdvparse
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-hdvparse
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-hdvparse
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-hdvparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-id3tag
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-id3tag
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-id3tag
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-id3tag
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTER),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-inter
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-inter
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-inter
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-inter
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_INTERLACE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-interlace
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-interlace
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-interlace
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-interlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVFPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-ivfparse
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-ivfparse
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-ivfparse
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-ivfparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IVTC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-ivtc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-ivtc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-ivtc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-ivtc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JP2KDECIMATOR),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-jp2kdecimator
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-jp2kdecimator
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-jp2kdecimator
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-jp2kdecimator
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_JPEGFORMAT),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-jpegformat
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-jpegformat
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-jpegformat
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-jpegformat
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBRFB),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-librfb
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-librfb
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-librfb
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-librfb
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIVEADDER),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-liveadder
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-liveadder
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-liveadder
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-liveadder
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MIDI),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-midi
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-midi
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-midi
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-midi
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegdemux
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegtsdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsdemux
 GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegtsdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGTSMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegtsmux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegtsmux
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegtsmux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegtsmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEGPSMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpegpsmux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpegpsmux
 GST1_PLUGINS_BAD_HAS_UNKNOWN_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpegpsmux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpegpsmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MVE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mve
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mve
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mve
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mve
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mxf
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mxf
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mxf
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mxf
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-nuvdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-nuvdemux
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-nuvdemux
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-nuvdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-patchdetect
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-patchdetect
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-patchdetect
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-patchdetect
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PCAPPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-pcapparse
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-pcapparse
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-pcapparse
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-pcapparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-pnm
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-pnm
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-pnm
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-rawparse
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-rawparse
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-rawparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-real
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-real
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-real
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-real
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-removesilence
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-removesilence
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-removesilence
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-sdi
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-sdi
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdi
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-sdp
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdp
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-sdp
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SEGMENTCLIP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-segmentclip
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-segmentclip
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-segmentclip
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-segmentclip
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SIREN),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-siren
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-siren
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-siren
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-siren
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SMOOTH),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-smooth
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-smooth
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-smooth
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-smooth
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SPEED),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-speed
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-speed
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-speed
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-speed
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-subenc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-subenc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-subenc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-subenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-stereo
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-stereo
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-stereo
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-stereo
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-tta
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-tta
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-tta
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-tta
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-videofilters
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-videofilters
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-videofilters
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-videofilters
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-videomeasure
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-videomeasure
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-videomeasure
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-videomeasure
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-videoparsers
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-videoparsers
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoparsers
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOSIGNAL),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-videosignal
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-videosignal
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-videosignal
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-videosignal
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VMNC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-vmnc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-vmnc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-vmnc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-vmnc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_Y4M),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-y4m
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-y4m
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-y4m
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-y4m
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_YADIF),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-yadif
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-yadif
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-yadif
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-yadif
 endif
 
 # Plugins with dependencies
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SHM),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-shm
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-shm
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-shm
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-shm
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-vcd
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-vcd
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-vcd
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-vcd
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-apexsink
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-apexsink
 GST1_PLUGINS_BAD_DEPENDENCIES += openssl
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-apexsink
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-apexsink
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-assrender
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-assrender
 GST1_PLUGINS_BAD_DEPENDENCIES += libass
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-assrender
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-assrender
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-voaacenc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-voaacenc
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-voaacenc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-voaacenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-bz2
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-bz2
 GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-bz2
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-bz2
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-cdaudio
 GST1_PLUGINS_BAD_DEPENDENCIES += libcdaudio
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-cdaudio
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-curl
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-curl
 GST1_PLUGINS_BAD_DEPENDENCIES += libcurl
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-curl
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-curl
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DASH),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dash
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dash
 GST1_PLUGINS_BAD_DEPENDENCIES += libxml2
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dash
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dash
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DECKLINK),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-decklink
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-decklink
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-decklink
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-decklink
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-webp
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-webp
 GST1_PLUGINS_BAD_DEPENDENCIES += webp
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-webp
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-webp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DIRECTFB),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-directfb
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-directfb
 GST1_PLUGINS_BAD_DEPENDENCIES += directfb
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-directfb
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-wayland
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
 GST1_PLUGINS_BAD_DEPENDENCIES += wayland
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-wayland
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FAAD),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-faad
 GST1_PLUGINS_BAD_DEPENDENCIES += faad2
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-faad
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-faad
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FBDEV),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-fbdev
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-fbdev
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-fbdev
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-fbdev
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_LIBMMS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-libmms
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-libmms
 GST1_PLUGINS_BAD_DEPENDENCIES += libmms
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-libmms
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-libmms
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpeg2enc
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpeg2enc
 GST1_PLUGINS_BAD_DEPENDENCIES += libmpeg2
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpeg2enc
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpeg2enc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-mpg123
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpg123
 GST1_PLUGINS_BAD_DEPENDENCIES += mpg123
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-mpg123
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpg123
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-musepack
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-musepack
 GST1_PLUGINS_BAD_DEPENDENCIES += musepack
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-musepack
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-musepack
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-neon
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-neon
 GST1_PLUGINS_BAD_DEPENDENCIES += neon
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-neon
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-neon
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-opencv
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-opencv
 GST1_PLUGINS_BAD_DEPENDENCIES += opencv
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-opencv
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-opencv
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-opus
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-opus
 GST1_PLUGINS_BAD_DEPENDENCIES += opus
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-opus
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-rsvg
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-rsvg
 GST1_PLUGINS_BAD_DEPENDENCIES += librsvg
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-rsvg
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-rsvg
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-eglgles
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-eglgles
 GST1_PLUGINS_BAD_DEPENDENCIES += libegl libgles
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 # RPI has odd locations for several required headers.
-GST1_PLUGINS_BAD_CONF_OPT += --with-egl-window-system=rpi
+GST1_PLUGINS_BAD_CONF_OPTS += --with-egl-window-system=rpi
 GST1_PLUGINS_BAD_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) \
 	-I$(STAGING_DIR)/usr/include/IL \
@@ -678,36 +678,36 @@
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
 endif
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-eglgles
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-eglgles
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL),y)
 GST1_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-GST1_PLUGINS_BAD_CONF_OPT += --enable-sdl
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdl
 GST1_PLUGINS_BAD_DEPENDENCIES += sdl
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-sdl
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-sndfile
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-sndfile
 GST1_PLUGINS_BAD_DEPENDENCIES += libsndfile
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-sndfile
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-dvb
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvb
 GST1_PLUGINS_BAD_DEPENDENCIES += dtv-scan-tables
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-dvb
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dvb
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS),y)
-GST1_PLUGINS_BAD_CONF_OPT += --enable-hls
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-hls
 GST1_PLUGINS_BAD_DEPENDENCIES += gnutls
 else
-GST1_PLUGINS_BAD_CONF_OPT += --disable-hls
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
 
 # Add GPL license if GPL licensed plugins enabled.
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -18,7 +18,7 @@
 	FT2_CONFIG=/bin/false \
 	ac_cv_header_stdint_t="stdint.h"
 
-GST1_PLUGINS_BASE_CONF_OPT = \
+GST1_PLUGINS_BASE_CONF_OPTS = \
 	--disable-examples \
 	--disable-oggtest \
 	--disable-vorbistest \
@@ -27,7 +27,7 @@
 	--disable-debug
 
 # Options which require currently unpackaged libraries
-GST1_PLUGINS_BASE_CONF_OPT += \
+GST1_PLUGINS_BASE_CONF_OPTS += \
 	--disable-cdparanoia \
 	--disable-libvisual \
 	--disable-iso-codes
@@ -38,125 +38,125 @@
 
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
-GST1_PLUGINS_BASE_CONF_OPT += --enable-orc
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-orc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ADDER),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-adder
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-adder
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-adder
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-adder
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-app
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-app
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-app
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-app
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-audioconvert
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioconvert
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-audioconvert
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioconvert
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORATE),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-audiorate
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiorate
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-audiorate
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiorate
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-audiotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audiotestsrc
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-audiotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audiotestsrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ENCODING),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-encoding
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-encoding
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-encoding
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-encoding
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-videoconvert
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoconvert
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-videoconvert
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoconvert
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-gio
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-gio
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-gio
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-gio
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-playback
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-playback
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-playback
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-playback
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-audioresample
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-audioresample
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-audioresample
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-audioresample
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_SUBPARSE),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-subparse
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-subparse
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-subparse
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-subparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TCP),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-tcp
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-tcp
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-tcp
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-tcp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TYPEFIND),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-typefind
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-typefind
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-typefind
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-typefind
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-videotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-videotestsrc
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-videotestsrc
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-videotestsrc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEORATE),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-videorate
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-videorate
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-videorate
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-videorate
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-videoscale
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-videoscale
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-videoscale
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-videoscale
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-volume
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-volume
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-volume
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-volume
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += zlib
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-zlib
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST1_PLUGINS_BASE_CONF_OPT += \
+GST1_PLUGINS_BASE_CONF_OPTS += \
 	--enable-x \
 	--enable-xshm \
 	--enable-xvideo
 else
-GST1_PLUGINS_BASE_CONF_OPT += \
+GST1_PLUGINS_BASE_CONF_OPTS += \
 	--disable-x \
 	--disable-xshm \
 	--disable-xvideo
@@ -165,42 +165,42 @@
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += alsa-lib
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-alsa
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_TREMOR),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-ivorbis
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-ivorbis
 GST1_PLUGINS_BASE_DEPENDENCIES += tremor
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-ivorbis
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-ivorbis
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-ogg
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-ogg
 GST1_PLUGINS_BASE_DEPENDENCIES += libogg
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-ogg
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-ogg
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-pango
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-pango
 GST1_PLUGINS_BASE_DEPENDENCIES += pango
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-pango
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-pango
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-theora
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-theora
 GST1_PLUGINS_BASE_DEPENDENCIES += libtheora
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-theora
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS),y)
-GST1_PLUGINS_BASE_CONF_OPT += --enable-vorbis
+GST1_PLUGINS_BASE_CONF_OPTS += --enable-vorbis
 GST1_PLUGINS_BASE_DEPENDENCIES += libvorbis
 else
-GST1_PLUGINS_BASE_CONF_OPT += --disable-vorbis
+GST1_PLUGINS_BASE_CONF_OPTS += --disable-vorbis
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -10,7 +10,7 @@
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
 GST1_PLUGINS_GOOD_LICENSE = LGPLv2.1+
 
-GST1_PLUGINS_GOOD_CONF_OPT = \
+GST1_PLUGINS_GOOD_CONF_OPTS = \
 	--disable-debug \
 	--disable-valgrind \
 	--disable-examples \
@@ -27,7 +27,7 @@
 
 
 # Options which require currently unpackaged libraries
-GST1_PLUGINS_GOOD_CONF_OPT += \
+GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-jack \
 	--disable-libdv \
 	--disable-dv1394 \
@@ -37,388 +37,388 @@
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-orc
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-orc
 GST1_PLUGINS_GOOD_DEPENDENCIES += orc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ALPHA),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-alpha
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-alpha
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-alpha
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-alpha
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_APETAG),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-apetag
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-apetag
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-apetag
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-apetag
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-audiofx
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-audiofx
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-audiofx
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-audiofx
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-audioparsers
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-audioparsers
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-audioparsers
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-audioparsers
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-auparse
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-auparse
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-auparse
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-auparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-autodetect
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-autodetect
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-autodetect
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-autodetect
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AVI),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-avi
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-avi
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-avi
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-avi
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CUTTER),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-cutter
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-cutter
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-cutter
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-cutter
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-debugutils
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-debugutils
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-debugutils
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-debugutils
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEINTERLACE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-deinterlace
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-deinterlace
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-deinterlace
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-deinterlace
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DTMF),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-dtmf
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-dtmf
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-dtmf
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-dtmf
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EFFECTV),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-effectv
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-effectv
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-effectv
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-effectv
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_EQUALIZER),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-equalizer
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-equalizer
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-equalizer
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-equalizer
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLV),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-flv
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flv
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-flv
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flv
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-flx
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flx
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-flx
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flx
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-goom
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-goom
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-goom
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-goom
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GOOM2K1),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-goom2k1
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-goom2k1
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-goom2k1
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-goom2k1
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ICYDEMUX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-icydemux
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-icydemux
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-icydemux
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-icydemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-id3demux
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-id3demux
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-id3demux
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-id3demux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-imagefreeze
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-imagefreeze
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-imagefreeze
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-imagefreeze
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_INTERLEAVE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-interleave
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-interleave
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-interleave
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-interleave
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-isomp4
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-isomp4
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-isomp4
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-isomp4
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-law
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-law
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-law
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-law
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LEVEL),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-level
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-level
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-level
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-level
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-matroska
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-matroska
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-matroska
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-matroska
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MONOSCOPE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-monoscope
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-monoscope
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-monoscope
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-monoscope
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIFILE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-multifile
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-multifile
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-multifile
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-multifile
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MULTIPART),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-multipart
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-multipart
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-multipart
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-multipart
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-replaygain
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-replaygain
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-replaygain
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-replaygain
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtp
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtp
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtp
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTPMANAGER),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtpmanager
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtpmanager
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtpmanager
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtpmanager
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-rtsp
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-rtsp
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-rtsp
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-rtsp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHAPEWIPE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-shapewipe
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-shapewipe
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-shapewipe
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-shapewipe
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SMPTE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-smpte
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-smpte
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-smpte
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-smpte
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPECTRUM),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-spectrum
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-spectrum
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-spectrum
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-spectrum
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_UDP),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-udp
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-udp
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-udp
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-udp
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOBOX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-videobox
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videobox
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-videobox
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videobox
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOCROP),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-videocrop
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videocrop
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-videocrop
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videocrop
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOFILTER),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-videofilter
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videofilter
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-videofilter
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videofilter
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VIDEOMIXER),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-videomixer
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-videomixer
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-videomixer
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-videomixer
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVENC),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavenc
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavenc
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavenc
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavenc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPARSE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavparse
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavparse
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavparse
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavparse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-y4m
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-y4m
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-y4m
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-y4m
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-oss
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-oss
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-oss
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_OSS4),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-oss4
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-oss4
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-oss4
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-oss4
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-gst_v4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gst_v4l2
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-gst_v4l2
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-gst_v4l2
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 GST1_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
-GST1_PLUGINS_GOOD_CONF_OPT += \
+GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--enable-x \
 	--enable-xshm \
 	$(if $(BR2_PACKAGE_XLIB_LIBXFIXES),xlib_libXfixes) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXDAMAGE),xlib_libXdamage)
 else
-GST1_PLUGINS_GOOD_CONF_OPT += \
+GST1_PLUGINS_GOOD_CONF_OPTS += \
 	--disable-x \
 	--disable-xshm
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-cairo
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-cairo
 GST1_PLUGINS_GOOD_DEPENDENCIES += cairo
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-cairo
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-cairo
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-flac
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-flac
 GST1_PLUGINS_GOOD_DEPENDENCIES += flac
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-flac
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_GDKPIXBUF),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-gdk_pixbuf
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-gdk_pixbuf
 GST1_PLUGINS_GOOD_DEPENDENCIES += gdk-pixbuf
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-gdk_pixbuf
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-gdk_pixbuf
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_JPEG),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-jpeg
 GST1_PLUGINS_GOOD_DEPENDENCIES += jpeg
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-jpeg
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PNG),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-libpng
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-libpng
 GST1_PLUGINS_GOOD_DEPENDENCIES += libpng
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-libpng
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-libpng
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-pulse
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-pulse
 GST1_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-pulse
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-pulse
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-soup
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-soup
 GST1_PLUGINS_GOOD_DEPENDENCIES += libsoup
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-soup
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-soup
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-speex
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-speex
 GST1_PLUGINS_GOOD_DEPENDENCIES += speex
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-speex
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-taglib
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-taglib
 GST1_PLUGINS_GOOD_DEPENDENCIES += taglib
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-taglib
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-taglib
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-vpx
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-vpx
 GST1_PLUGINS_GOOD_DEPENDENCIES += libvpx
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-vpx
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-vpx
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-wavpack
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-wavpack
 GST1_PLUGINS_GOOD_DEPENDENCIES += wavpack
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-wavpack
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-wavpack
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_ZLIB),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-zlib
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-zlib
 GST1_PLUGINS_GOOD_DEPENDENCIES += zlib
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-zlib
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_BZ2),y)
-GST1_PLUGINS_GOOD_CONF_OPT += --enable-bz2
+GST1_PLUGINS_GOOD_CONF_OPTS += --enable-bz2
 GST1_PLUGINS_GOOD_DEPENDENCIES += bzip2
 else
-GST1_PLUGINS_GOOD_CONF_OPT += --disable-bz2
+GST1_PLUGINS_GOOD_CONF_OPTS += --disable-bz2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -11,12 +11,12 @@
 # GPL licensed plugins will append to GST1_PLUGINS_UGLY_LICENSE if enabled.
 GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
 
-GST1_PLUGINS_UGLY_CONF_OPT = \
+GST1_PLUGINS_UGLY_CONF_OPTS = \
 	--disable-examples \
 	--disable-debug \
 	--disable-valgrind
 
-GST_PLUGINS_BAD1_CONF_OPT += \
+GST_PLUGINS_BAD1_CONF_OPTS += \
 	--disable-a52dec \
 	--disable-amrnb \
 	--disable-amrwb \
@@ -28,69 +28,69 @@
 GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
 ifeq ($(BR2_PACKAGE_ORC),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-orc
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-orc
 GST1_PLUGINS_UGLY_DEPENDENCIES += orc
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_ASFDEMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-asfdemux
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-asfdemux
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-asfdemux
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-asfdemux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDLPCMDEC),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdlpcmdec
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdlpcmdec
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdlpcmdec
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdlpcmdec
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDSUB),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdsub
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdsub
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdsub
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-xingmux
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-xingmux
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-xingmux
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-xingmux
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_REALMEDIA),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-realmedia
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-realmedia
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-realmedia
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-realmedia
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_DVDREAD),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-dvdread
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-dvdread
 GST1_PLUGINS_UGLY_DEPENDENCIES += libdvdread
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-dvdread
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdread
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-lame
 GST1_PLUGINS_UGLY_DEPENDENCIES += lame
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-lame
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-lame
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-mad
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mad
 GST1_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
 GST1_PLUGINS_UGLY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-mad
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mad
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC),y)
-GST1_PLUGINS_UGLY_CONF_OPT += --enable-mpeg2dec
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-mpeg2dec
 GST1_PLUGINS_UGLY_DEPENDENCIES += libmpeg2
 GST1_PLUGINS_ULGY_HAS_GPL_LICENSE = y
 else
-GST1_PLUGINS_UGLY_CONF_OPT += --disable-mpeg2dec
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
 endif
 
 # Add GPL license if GPL plugins enabled.
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -21,7 +21,7 @@
 GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
 endif
 
-GSTREAMER1_CONF_OPT = \
+GSTREAMER1_CONF_OPTS = \
 	--disable-examples \
 	--disable-tests \
 	--disable-failing-tests \
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -19,7 +19,7 @@
 #
 # For further details, refer to the explaination given in the README file from
 # the gtest sources.
-GTEST_CONF_OPT = -DBUILD_SHARED_LIBS=OFF
+GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
 define GTEST_EXTRACT_CMDS
 	unzip $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
--- a/package/gtk2-engines/gtk2-engines.mk
+++ b/package/gtk2-engines/gtk2-engines.mk
@@ -65,7 +65,7 @@
 		gl_cv_c_restrict=no \
 		ac_cv_path_CUPS_CONFIG=no
 
-GTK2_ENGINES_CONF_OPT = \
+GTK2_ENGINES_CONF_OPTS = \
 		--with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -25,7 +25,7 @@
 GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config \
 	ac_cv_path_IJS_CONFIG=""
 
-GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
+GUTENPRINT_CONF_OPTS = --disable-libgutenprintui2 \
                       --disable-samples \
                       --without-doc \
                       --without-gimp2 \
@@ -53,7 +53,7 @@
 # empty string to to disable this, not just to /bin/false like elsewhere.
 HOST_GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=''
 
-HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
+HOST_GUTENPRINT_CONF_OPTS = --disable-libgutenprintui2 \
                            --disable-samples \
                            --without-gimp2 \
                            --without-doc \
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -17,7 +17,7 @@
 # build system from searching the host paths.
 GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 
-GVFS_CONF_OPT = \
+GVFS_CONF_OPTS = \
 	--disable-gconf			\
 	--disable-cdda			\
 	--disable-obexftp		\
@@ -28,23 +28,23 @@
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
-GVFS_CONF_OPT += --enable-avahi
+GVFS_CONF_OPTS += --enable-avahi
 else
-GVFS_CONF_OPT += --disable-avahi
+GVFS_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 GVFS_DEPENDENCIES += libarchive
-GVFS_CONF_OPT += --enable-archive
+GVFS_CONF_OPTS += --enable-archive
 else
-GVFS_CONF_OPT += --disable-archive
+GVFS_CONF_OPTS += --disable-archive
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 GVFS_DEPENDENCIES += libfuse
-GVFS_CONF_OPT += --enable-fuse
+GVFS_CONF_OPTS += --enable-fuse
 else
-GVFS_CONF_OPT += --disable-fuse
+GVFS_CONF_OPTS += --disable-fuse
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
@@ -53,20 +53,20 @@
 
 ifeq ($(BR2_PACKAGE_LIBSOUP),y)
 GVFS_DEPENDENCIES += libsoup
-GVFS_CONF_OPT += --enable-http
+GVFS_CONF_OPTS += --enable-http
 else
-GVFS_CONF_OPT += --disable-http
+GVFS_CONF_OPTS += --disable-http
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
 GVFS_DEPENDENCIES += samba
-GVFS_CONF_OPT += \
+GVFS_CONF_OPTS += \
 	--enable-samba \
 	--with-samba-includes=$(STAGING_DIR)/usr/include \
 	--with-samba-libs=$(STAGING_DIR)/usr/lib \
 	ac_cv_lib_smbclient_smbc_option_get=yes
 else
-GVFS_CONF_OPT += --disable-samba
+GVFS_CONF_OPTS += --disable-samba
 endif
 
 define GVFS_REMOVE_USELESS_BINARY
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -11,7 +11,7 @@
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 
-HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
+HARFBUZZ_CONF_OPTS = --without-coretext --without-uniscribe --without-graphite2
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 # forgets to link test programs with -pthread breaking static link
@@ -20,30 +20,30 @@
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 	HARFBUZZ_DEPENDENCIES += cairo
-	HARFBUZZ_CONF_OPT += --with-cairo=yes
+	HARFBUZZ_CONF_OPTS += --with-cairo=yes
 else
-	HARFBUZZ_CONF_OPT += --with-cairo=no
+	HARFBUZZ_CONF_OPTS += --with-cairo=no
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 	HARFBUZZ_DEPENDENCIES += freetype
-	HARFBUZZ_CONF_OPT += --with-freetype=yes
+	HARFBUZZ_CONF_OPTS += --with-freetype=yes
 else
-	HARFBUZZ_CONF_OPT += --with-freetype=no
+	HARFBUZZ_CONF_OPTS += --with-freetype=no
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 	HARFBUZZ_DEPENDENCIES += libglib2
-	HARFBUZZ_CONF_OPT += --with-glib=yes
+	HARFBUZZ_CONF_OPTS += --with-glib=yes
 else
-	HARFBUZZ_CONF_OPT += --with-glib=no
+	HARFBUZZ_CONF_OPTS += --with-glib=no
 endif
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 	HARFBUZZ_DEPENDENCIES += icu
-	HARFBUZZ_CONF_OPT += --with-icu=yes
+	HARFBUZZ_CONF_OPTS += --with-icu=yes
 else
-	HARFBUZZ_CONF_OPT += --with-icu=no
+	HARFBUZZ_CONF_OPTS += --with-icu=no
 endif
 
 $(eval $(autotools-package))
diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -15,7 +15,7 @@
 HASERL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
-	HASERL_CONF_OPT += --with-lua
+	HASERL_CONF_OPTS += --with-lua
 	HASERL_DEPENDENCIES += lua
 
 # liblua uses dlopen when dynamically linked
@@ -24,7 +24,7 @@
 endif
 
 else
-	HASERL_CONF_OPT += --without-lua
+	HASERL_CONF_OPTS += --without-lua
 endif
 
 define HASERL_REMOVE_EXAMPLES
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -9,7 +9,7 @@
 HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
-HOST_HEIMDAL_CONF_OPT = --with-x=no --disable-shared --enable-static
+HOST_HEIMDAL_CONF_OPTS = --with-x=no --disable-shared --enable-static
 HOST_HEIMDAL_CONF_ENV = MAKEINFO=true
 HEIMDAL_MAKE = $(MAKE1)
 # For heimdal-0004-compile_et.patch
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -10,13 +10,13 @@
 HIAWATHA_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
-HIAWATHA_CONF_OPT += -DUSE_SYSTEM_POLARSSL=ON
+HIAWATHA_CONF_OPTS += -DUSE_SYSTEM_POLARSSL=ON
 HIAWATHA_DEPENDENCIES += polarssl
 else
-HIAWATHA_CONF_OPT += -DENABLE_SSL=OFF
+HIAWATHA_CONF_OPTS += -DENABLE_SSL=OFF
 endif
 
-HIAWATHA_CONF_OPT += \
+HIAWATHA_CONF_OPTS += \
 	$(if $(BR2_INET_IPV6),,-DENABLE_IPV6=OFF) \
 	-DENABLE_TOOLKIT=OFF \
 	-DENABLE_XSLT=OFF \
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -11,7 +11,7 @@
 HPLIP_LICENSE = GPLv2 BSD-3c MIT
 HPLIP_LICENSE_FILES = COPYING
 
-HPLIP_CONF_OPT = \
+HPLIP_CONF_OPTS = \
 	--disable-qt4 \
 	--disable-scan-build \
 	--disable-gui-build \
@@ -30,10 +30,10 @@
 	--includedir=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	HPLIP_CONF_OPT += --enable-dbus-build
+	HPLIP_CONF_OPTS += --enable-dbus-build
 	HPLIP_DEPENDENCIES += dbus
 else
-	HPLIP_CONF_OPT += --disable-dbus-build
+	HPLIP_CONF_OPTS += --disable-dbus-build
 endif
 
 define HPLIP_POST_INSTALL_TARGET_FIXUP
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -9,7 +9,7 @@
 HTOP_DEPENDENCIES = ncurses
 # For htop-01-native-affinity.patch
 HTOP_AUTORECONF = YES
-HTOP_CONF_OPT = --disable-unicode
+HTOP_CONF_OPTS = --disable-unicode
 HTOP_CONF_ENV = ac_cv_file__proc_stat=yes ac_cv_file__proc_meminfo=yes
 HTOP_LICENSE = GPLv2
 HTOP_LICENSE_FILES = COPYING
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -13,9 +13,9 @@
 ICU_DEPENDENCIES = host-icu
 ICU_INSTALL_STAGING = YES
 ICU_CONFIG_SCRIPTS = icu-config
-ICU_CONF_OPT = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
+ICU_CONF_OPTS = --with-cross-build=$(HOST_ICU_DIR)/source --disable-samples \
 		--disable-tests
-HOST_ICU_CONF_OPT = \
+HOST_ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests \
 	--disable-extras \
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -12,7 +12,7 @@
 
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
-IFPLUGD_CONF_OPT = --disable-lynx --with-initdir=/etc/init.d/
+IFPLUGD_CONF_OPTS = --disable-lynx --with-initdir=/etc/init.d/
 IFPLUGD_DEPENDENCIES = libdaemon
 
 # Prefer big ifplugd
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -13,14 +13,14 @@
 IGH_ETHERCAT_DEPENDENCIES    = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
-IGH_ETHERCAT_CONF_OPT = \
+IGH_ETHERCAT_CONF_OPTS = \
 	--with-linux-dir=$(LINUX_DIR)
 
-IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
-IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
-IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
-IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
-IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
+IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
 define IGH_ETHERCAT_BUILD_MODULES
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -28,7 +28,7 @@
 IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
 endif
 
-IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
+IMAGEMAGICK_CONF_OPTS = --program-transform-name='s,,,' \
 		--disable-openmp \
 		--without-perl \
 		--without-wmf \
@@ -45,78 +45,78 @@
 IMAGEMAGICK_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-IMAGEMAGICK_CONF_OPT += --with-fontconfig
+IMAGEMAGICK_CONF_OPTS += --with-fontconfig
 IMAGEMAGICK_DEPENDENCIES += fontconfig
 else
-IMAGEMAGICK_CONF_OPT += --without-fontconfig
+IMAGEMAGICK_CONF_OPTS += --without-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
-IMAGEMAGICK_CONF_OPT += --with-freetype
+IMAGEMAGICK_CONF_OPTS += --with-freetype
 IMAGEMAGICK_CONF_ENV += \
 	ac_cv_path_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config
 IMAGEMAGICK_DEPENDENCIES += freetype
 else
-IMAGEMAGICK_CONF_OPT += --without-freetype
+IMAGEMAGICK_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-IMAGEMAGICK_CONF_OPT += --with-jpeg
+IMAGEMAGICK_CONF_OPTS += --with-jpeg
 IMAGEMAGICK_DEPENDENCIES += jpeg
 else
-IMAGEMAGICK_CONF_OPT += --without-jpeg
+IMAGEMAGICK_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-IMAGEMAGICK_CONF_OPT += --with-png
+IMAGEMAGICK_CONF_OPTS += --with-png
 IMAGEMAGICK_DEPENDENCIES += libpng
 else
-IMAGEMAGICK_CONF_OPT += --without-png
+IMAGEMAGICK_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-IMAGEMAGICK_CONF_OPT += --with-rsvg
+IMAGEMAGICK_CONF_OPTS += --with-rsvg
 IMAGEMAGICK_DEPENDENCIES += librsvg
 else
-IMAGEMAGICK_CONF_OPT += --without-rsvg
+IMAGEMAGICK_CONF_OPTS += --without-rsvg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-IMAGEMAGICK_CONF_OPT += --with-xml
+IMAGEMAGICK_CONF_OPTS += --with-xml
 IMAGEMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(STAGING_DIR)/usr/bin/xml2-config
 IMAGEMAGICK_DEPENDENCIES += libxml2
 else
-IMAGEMAGICK_CONF_OPT += --without-xml
+IMAGEMAGICK_CONF_OPTS += --without-xml
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-IMAGEMAGICK_CONF_OPT += --with-tiff
+IMAGEMAGICK_CONF_OPTS += --with-tiff
 IMAGEMAGICK_DEPENDENCIES += tiff
 else
-IMAGEMAGICK_CONF_OPT += --without-tiff
+IMAGEMAGICK_CONF_OPTS += --without-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW),y)
 # configure script misdetects these leading to build errors
 IMAGEMAGICK_CONF_ENV += ac_cv_func_creal=yes ac_cv_func_cimag=yes
-IMAGEMAGICK_CONF_OPT += --with-fftw
+IMAGEMAGICK_CONF_OPTS += --with-fftw
 IMAGEMAGICK_DEPENDENCIES += fftw
 else
-IMAGEMAGICK_CONF_OPT += --without-fftw
+IMAGEMAGICK_CONF_OPTS += --without-fftw
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-IMAGEMAGICK_CONF_OPT += --with-zlib
+IMAGEMAGICK_CONF_OPTS += --with-zlib
 IMAGEMAGICK_DEPENDENCIES += zlib
 else
-IMAGEMAGICK_CONF_OPT += --without-zlib
+IMAGEMAGICK_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-IMAGEMAGICK_CONF_OPT += --with-bzlib
+IMAGEMAGICK_CONF_OPTS += --with-bzlib
 IMAGEMAGICK_DEPENDENCIES += bzip2
 else
-IMAGEMAGICK_CONF_OPT += --without-bzlib
+IMAGEMAGICK_CONF_OPTS += --without-bzlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/imlib2/imlib2.mk b/package/imlib2/imlib2.mk
--- a/package/imlib2/imlib2.mk
+++ b/package/imlib2/imlib2.mk
@@ -12,49 +12,49 @@
 
 IMLIB2_INSTALL_STAGING = YES
 IMLIB2_DEPENDENCIES = host-pkgconf freetype
-IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
+IMLIB2_CONF_OPTS = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 IMLIB2_CONFIG_SCRIPTS = imlib2-config
 
 ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
-	IMLIB2_CONF_OPT += --with-x
+	IMLIB2_CONF_OPTS += --with-x
 	IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	IMLIB2_CONF_OPT += --without-x
+	IMLIB2_CONF_OPTS += --without-x
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_JPEG),y)
-	IMLIB2_CONF_OPT += --with-jpeg
+	IMLIB2_CONF_OPTS += --with-jpeg
 	IMLIB2_DEPENDENCIES += jpeg
 else
-	IMLIB2_CONF_OPT += --without-jpeg
+	IMLIB2_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_PNG),y)
-	IMLIB2_CONF_OPT += --with-png
+	IMLIB2_CONF_OPTS += --with-png
 	IMLIB2_DEPENDENCIES += libpng
 else
-	IMLIB2_CONF_OPT += --without-png
+	IMLIB2_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_GIF),y)
-	IMLIB2_CONF_OPT += --with-gif
+	IMLIB2_CONF_OPTS += --with-gif
 	IMLIB2_DEPENDENCIES += libungif
 else
-	IMLIB2_CONF_OPT += --without-gif
+	IMLIB2_CONF_OPTS += --without-gif
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_TIFF),y)
-	IMLIB2_CONF_OPT += --with-tiff
+	IMLIB2_CONF_OPTS += --with-tiff
 	IMLIB2_DEPENDENCIES += tiff
 else
-	IMLIB2_CONF_OPT += --without-tiff
+	IMLIB2_CONF_OPTS += --without-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_IMLIB2_ID3),y)
-	IMLIB2_CONF_OPT += --with-id3
+	IMLIB2_CONF_OPTS += --with-id3
 	IMLIB2_DEPENDENCIES += libid3tag
 else
-	IMLIB2_CONF_OPT += --without-id3
+	IMLIB2_CONF_OPTS += --without-id3
 endif
 
 # drop -L<dir> from linker flags
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -12,7 +12,7 @@
 	ac_cv_type_bool=yes \
 	ac_cv_sizeof_bool=1
 
-IPERF_CONF_OPT = \
+IPERF_CONF_OPTS = \
 	--disable-web100
 
 $(eval $(autotools-package))
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -13,7 +13,7 @@
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 else
-IPMITOOL_CONF_OPT += --disable-intf-lanplus
+IPMITOOL_CONF_OPTS += --disable-intf-lanplus
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -20,56 +20,56 @@
 IPSEC_TOOLS_CONF_ENV += LIBS=-lz
 endif
 
-IPSEC_TOOLS_CONF_OPT = \
+IPSEC_TOOLS_CONF_OPTS = \
 	  --disable-hybrid \
 	  --without-libpam \
 	  --disable-gssapi \
 	  --with-kernel-headers=$(STAGING_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT), y)
-IPSEC_TOOLS_CONF_OPT += --enable-adminport
+IPSEC_TOOLS_CONF_OPTS += --enable-adminport
 else
-IPSEC_TOOLS_CONF_OPT += --disable-adminport
+IPSEC_TOOLS_CONF_OPTS += --disable-adminport
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_NATT), y)
-IPSEC_TOOLS_CONF_OPT += --enable-natt
+IPSEC_TOOLS_CONF_OPTS += --enable-natt
 else
-IPSEC_TOOLS_CONF_OPT += --disable-natt
+IPSEC_TOOLS_CONF_OPTS += --disable-natt
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_FRAG), y)
-IPSEC_TOOLS_CONF_OPT += --enable-frag
+IPSEC_TOOLS_CONF_OPTS += --enable-frag
 else
-IPSEC_TOOLS_CONF_OPT += --disable-frag
+IPSEC_TOOLS_CONF_OPTS += --disable-frag
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_DPD), y)
-IPSEC_TOOLS_CONF_OPT += --enable-dpd
+IPSEC_TOOLS_CONF_OPTS += --enable-dpd
 else
-IPSEC_TOOLS_CONF_OPT += --disable-dpd
+IPSEC_TOOLS_CONF_OPTS += --disable-dpd
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_STATS), y)
-IPSEC_TOOLS_CONF_OPT += --enable-stats
+IPSEC_TOOLS_CONF_OPTS += --enable-stats
 else
-IPSEC_TOOLS_CONF_OPT += --disable-stats
+IPSEC_TOOLS_CONF_OPTS += --disable-stats
 endif
 
 ifneq ($(BR2_PACKAGE_IPSEC_TOOLS_READLINE), y)
-IPSEC_TOOLS_CONF_OPT += --without-readline
+IPSEC_TOOLS_CONF_OPTS += --without-readline
 else
 IPSEC_DEPENDENCIES += readline
 endif
 
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_DISABLE),y)
-IPSEC_TOOLS_CONF_OPT += --enable-security-context=no
+IPSEC_TOOLS_CONF_OPTS += --enable-security-context=no
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_ENABLE),y)
-IPSEC_TOOLS_CONF_OPT += --enable-security-context=yes
+IPSEC_TOOLS_CONF_OPTS += --enable-security-context=yes
 endif
 ifeq ($(BR2_PACKAGE_IPSEC_SECCTX_KERNEL),y)
-IPSEC_TOOLS_CONF_OPT += --enable-security-context=kernel
+IPSEC_TOOLS_CONF_OPTS += --enable-security-context=kernel
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -8,7 +8,7 @@
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_DEPENDENCIES = libmnl host-pkgconf
-IPSET_CONF_OPT = --with-kmod=no
+IPSET_CONF_OPTS = --with-kmod=no
 IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,7 +12,7 @@
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
-IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
+IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
 # Because of iptables-01-fix-static-link.patch
 IPTABLES_AUTORECONF = YES
 
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -10,7 +10,7 @@
 JAMVM_LICENSE_FILES = COPYING
 JAMVM_DEPENDENCIES = zlib classpath
 # int inlining seems to crash jamvm, don't build shared version of internal lib
-JAMVM_CONF_OPT = \
+JAMVM_CONF_OPTS = \
 	--with-classpath-install-dir=/usr \
 	--disable-int-inlining \
 	--disable-shared \
diff --git a/package/joe/joe.mk b/package/joe/joe.mk
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -11,9 +11,9 @@
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 JOE_DEPENDENCIES += ncurses
-JOE_CONF_OPT += --enable-curses
+JOE_CONF_OPTS += --enable-curses
 else
-JOE_CONF_OPT += --disable-curses
+JOE_CONF_OPTS += --disable-curses
 endif
 
 ifneq ($(BR2_PACKAGE_JOE_FULL),y)
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -10,14 +10,14 @@
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
 JPEG_TURBO_LICENSE_FILES = README README-turbo.txt
 JPEG_TURBO_INSTALL_STAGING = YES
-JPEG_TURBO_CONF_OPT = --with-jpeg8
+JPEG_TURBO_CONF_OPTS = --with-jpeg8
 
 ifeq ($(BR2_X86_CPU_HAS_MMX)$(BR2_ARM_CPU_HAS_NEON),y)
-JPEG_TURBO_CONF_OPT += --with-simd
+JPEG_TURBO_CONF_OPTS += --with-simd
 # x86 simd support needs nasm
 JPEG_TURBO_DEPENDENCIES += $(if $(BR2_X86_CPU_HAS_MMX),host-nasm)
 else
-JPEG_TURBO_CONF_OPT += --without-simd
+JPEG_TURBO_CONF_OPTS += --without-simd
 endif
 
 define JPEG_TURBO_REMOVE_USELESS_TOOLS
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -8,7 +8,7 @@
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_MAKE = $(MAKE1)
-JSON_C_CONF_OPT = --disable-oldname-compat
+JSON_C_CONF_OPTS = --disable-oldname-compat
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -7,7 +7,7 @@
 KBD_VERSION = 1.15.5
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
-KBD_CONF_OPT = --disable-vlock
+KBD_CONF_OPTS = --disable-vlock
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -11,10 +11,10 @@
 KEXEC_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
-KEXEC_CONF_OPT += --with-zlib
+KEXEC_CONF_OPTS += --with-zlib
 KEXEC_DEPENDENCIES = zlib
 else
-KEXEC_CONF_OPT += --without-zlib
+KEXEC_CONF_OPTS += --without-zlib
 endif
 
 define KEXEC_REMOVE_LIB_TOOLS
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -8,7 +8,7 @@
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = host-pkgconf libpcap ncurses libnl
-KISMET_CONF_OPT += --with-netlink-version=3
+KISMET_CONF_OPTS += --with-netlink-version=3
 KISMET_LICENSE = GPLv2+
 KISMET_LICENSE_FILES = debian/copyright
 
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,24 +17,24 @@
 
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
-KMOD_CONF_OPT = --disable-static --enable-shared
+KMOD_CONF_OPTS = --disable-static --enable-shared
 
-KMOD_CONF_OPT += --disable-manpages
-HOST_KMOD_CONF_OPT = --disable-manpages
+KMOD_CONF_OPTS += --disable-manpages
+HOST_KMOD_CONF_OPTS = --disable-manpages
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 KMOD_DEPENDENCIES += zlib
-KMOD_CONF_OPT += --with-zlib
+KMOD_CONF_OPTS += --with-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_XZ),y)
 KMOD_DEPENDENCIES += xz
-KMOD_CONF_OPT += --with-xz
+KMOD_CONF_OPTS += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
-KMOD_CONF_OPT += --enable-python
+KMOD_CONF_OPTS += --enable-python
 endif
 
 # --gc-sections triggers a bug in the current Xtensa binutils
@@ -59,7 +59,7 @@
 
 KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
 else
-KMOD_CONF_OPT += --disable-tools
+KMOD_CONF_OPTS += --disable-tools
 endif
 
 # We only install depmod, since that's the only tool used for the
diff --git a/package/knock/knock.mk b/package/knock/knock.mk
--- a/package/knock/knock.mk
+++ b/package/knock/knock.mk
@@ -11,7 +11,7 @@
 KNOCK_DEPENDENCIES = libpcap
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-KNOCK_CONF_OPT = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+KNOCK_CONF_OPTS = LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lame/lame.mk b/package/lame/lame.mk
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -10,13 +10,13 @@
 LAME_DEPENDENCIES = host-pkgconf
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
-LAME_CONF_OPT = --enable-dynamic-frontends
+LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPLv2+
 LAME_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
-LAME_CONF_OPT += --with-fileio=sndfile
+LAME_CONF_OPTS += --with-fileio=sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
diff --git a/package/lbreakout2/lbreakout2.mk b/package/lbreakout2/lbreakout2.mk
--- a/package/lbreakout2/lbreakout2.mk
+++ b/package/lbreakout2/lbreakout2.mk
@@ -21,16 +21,16 @@
 
 ifeq ($(BR2_PACKAGE_LBREAKOUT2_AUDIO),y)
 LBREAKOUT2_DEPENDENCIES += sdl_mixer
-LBREAKOUT2_CONF_OPT += --enable-audio=yes
+LBREAKOUT2_CONF_OPTS += --enable-audio=yes
 else
-LBREAKOUT2_CONF_OPT += --disable-audio
+LBREAKOUT2_CONF_OPTS += --disable-audio
 endif
 
 ifeq ($(BR2_PACKAGE_LBREAKOUT2_NET),y)
 LBREAKOUT2_DEPENDENCIES += sdl_net
-LBREAKOUT2_CONF_OPT += --enable-network=yes
+LBREAKOUT2_CONF_OPTS += --enable-network=yes
 else
-LBREAKOUT2_CONF_OPT += --disable-network
+LBREAKOUT2_CONF_OPTS += --disable-network
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -10,12 +10,12 @@
 LCDPROC_LICENSE_FILES = COPYING
 LCDPROC_MAKE = $(MAKE1)
 
-LCDPROC_CONF_OPT = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS) \
+LCDPROC_CONF_OPTS = --enable-drivers=$(BR2_PACKAGE_LCDPROC_DRIVERS) \
 	--with-ft-prefix="$(STAGING_DIR)/usr" \
 	--with-ft-exec-prefix="$(STAGING_DIR)/usr"
 
 ifeq ($(BR2_PACKAGE_LCDPROC_MENUS),y)
-LCDPROC_CONF_OPT += --enable-lcdproc-menus
+LCDPROC_CONF_OPTS += --enable-lcdproc-menus
 endif
 
 LCDPROC_DEPENDENCIES = freetype ncurses zlib
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -9,27 +9,27 @@
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
 
-LCMS2_CONF_OPT = \
+LCMS2_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	LCMS2_CONF_OPT += --with-jpeg
+	LCMS2_CONF_OPTS += --with-jpeg
 	LCMS2_DEPENDENCIES += jpeg
 else
-	LCMS2_CONF_OPT += --without-jpeg
+	LCMS2_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-	LCMS2_CONF_OPT += --with-tiff
+	LCMS2_CONF_OPTS += --with-tiff
 	LCMS2_DEPENDENCIES += tiff
 else
-	LCMS2_CONF_OPT += --without-tiff
+	LCMS2_CONF_OPTS += --without-tiff
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	LCMS2_CONF_OPT += --with-zlib
+	LCMS2_CONF_OPTS += --with-zlib
 	LCMS2_DEPENDENCIES += zlib
 else
-	LCMS2_CONF_OPT += --without-zlib
+	LCMS2_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
--- a/package/lesstif/lesstif.mk
+++ b/package/lesstif/lesstif.mk
@@ -13,7 +13,7 @@
 	freetype
 LESSTIF_LICENSE = LGPLv2+
 LESSTIF_LICENSE_FILES = COPYING.LIB
-LESSTIF_CONF_OPT = \
+LESSTIF_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
 	--enable-debug=no \
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -12,21 +12,21 @@
 LFTP_DEPENDENCIES = readline zlib host-pkgconf
 
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-LFTP_CONF_OPT += --with-modules
+LFTP_CONF_OPTS += --with-modules
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LFTP_DEPENDENCIES += gnutls
-LFTP_CONF_OPT += --with-gnutls
+LFTP_CONF_OPTS += --with-gnutls
 else
-LFTP_CONF_OPT += --without-gnutls
+LFTP_CONF_OPTS += --without-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LFTP_DEPENDENCIES += openssl
-LFTP_CONF_OPT += --with-openssl
+LFTP_CONF_OPTS += --with-openssl
 else
-LFTP_CONF_OPT += --without-openssl
+LFTP_CONF_OPTS += --without-openssl
 endif
 
 # Remove /usr/share/lftp
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -10,12 +10,12 @@
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPLv2+
 LIBAO_LICENSE_FILES = COPYING
-LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
+LIBAO_CONF_OPTS = --disable-esd --disable-wmm --disable-arts \
 			--disable-nas --disable-pulse --disable-broken-oss
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 LIBAO_DEPENDENCIES += alsa-lib
-LIBAO_CONF_OPT += --enable-alsa --enable-alsa-mmap
+LIBAO_CONF_OPTS += --enable-alsa --enable-alsa-mmap
 
 # Remove the OSS plugin if ALSA is enabled, as libao will prefer ALSA anyway
 define LIBAO_REMOVE_OSS_PLUGIN
@@ -23,7 +23,7 @@
 endef
 LIBAO_POST_INSTALL_TARGET_HOOKS += LIBAO_REMOVE_OSS_PLUGIN
 else
-LIBAO_CONF_OPT += --disable-alsa
+LIBAO_CONF_OPTS += --disable-alsa
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -9,81 +9,81 @@
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
 LIBARCHIVE_LICENSE_FILES = COPYING
-LIBARCHIVE_CONF_OPT = --without-lzma
+LIBARCHIVE_CONF_OPTS = --without-lzma
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBARCHIVE_CONF_OPT += --enable-bsdtar=static
+LIBARCHIVE_CONF_OPTS += --enable-bsdtar=static
 else
-LIBARCHIVE_CONF_OPT += --enable-bsdtar=shared
+LIBARCHIVE_CONF_OPTS += --enable-bsdtar=shared
 endif
 else
-LIBARCHIVE_CONF_OPT += --disable-bsdtar
+LIBARCHIVE_CONF_OPTS += --disable-bsdtar
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),y)
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBARCHIVE_CONF_OPT += --enable-bsdcpio=static
+LIBARCHIVE_CONF_OPTS += --enable-bsdcpio=static
 else
-LIBARCHIVE_CONF_OPT += --enable-bsdcpio=shared
+LIBARCHIVE_CONF_OPTS += --enable-bsdcpio=shared
 endif
 else
-LIBARCHIVE_CONF_OPT += --disable-bsdcpio
+LIBARCHIVE_CONF_OPTS += --disable-bsdcpio
 endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 LIBARCHIVE_DEPENDENCIES += acl
 else
-LIBARCHIVE_CONF_OPT += --disable-acl
+LIBARCHIVE_CONF_OPTS += --disable-acl
 endif
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
 LIBARCHIVE_DEPENDENCIES += attr
 else
-LIBARCHIVE_CONF_OPT += --disable-xattr
+LIBARCHIVE_CONF_OPTS += --disable-xattr
 endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 LIBARCHIVE_DEPENDENCIES += expat
 else
-LIBARCHIVE_CONF_OPT += --without-expat
+LIBARCHIVE_CONF_OPTS += --without-expat
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBARCHIVE_DEPENDENCIES += libiconv
 else
-LIBARCHIVE_CONF_OPT += --without-libiconv-prefix
+LIBARCHIVE_CONF_OPTS += --without-libiconv-prefix
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBARCHIVE_DEPENDENCIES += libxml2
 LIBARCHIVE_CONF_ENV += XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 else
-LIBARCHIVE_CONF_OPT += --without-xml2
+LIBARCHIVE_CONF_OPTS += --without-xml2
 endif
 
 ifeq ($(BR2_PACKAGE_LZO),y)
 LIBARCHIVE_DEPENDENCIES += lzo
 else
-LIBARCHIVE_CONF_OPT += --without-lzo2
+LIBARCHIVE_CONF_OPTS += --without-lzo2
 endif
 
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 LIBARCHIVE_DEPENDENCIES += nettle
 else
-LIBARCHIVE_CONF_OPT += --without-nettle
+LIBARCHIVE_CONF_OPTS += --without-nettle
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBARCHIVE_DEPENDENCIES += openssl
 else
-LIBARCHIVE_CONF_OPT += --without-openssl
+LIBARCHIVE_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBARCHIVE_DEPENDENCIES += zlib
 else
-LIBARCHIVE_CONF_OPT += --without-zlib
+LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -8,7 +8,7 @@
 LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
 LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
 LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPT = --disable-example \
+LIBARGTABLE2_CONF_OPTS = --disable-example \
 		--disable-kernel-module \
 		--enable-lib \
 		--enable-util
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -17,23 +17,23 @@
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
-LIBASS_CONF_OPT += --enable-fontconfig
+LIBASS_CONF_OPTS += --enable-fontconfig
 else
-LIBASS_CONF_OPT += --disable-fontconfig
+LIBASS_CONF_OPTS += --disable-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 LIBASS_DEPENDENCIES += harfbuzz
-LIBASS_CONF_OPT += --enable-harfbuzz
+LIBASS_CONF_OPTS += --enable-harfbuzz
 else
-LIBASS_CONF_OPT += --disable-harfbuzz
+LIBASS_CONF_OPTS += --disable-harfbuzz
 endif
 
 ifeq ($(BR2_PACKAGE_LIBENCA),y)
 LIBASS_DEPENDENCIES += libenca
-LIBASS_CONF_OPT += --enable-enca
+LIBASS_CONF_OPTS += --enable-enca
 else
-LIBASS_CONF_OPT += --disable-enca
+LIBASS_CONF_OPTS += --disable-enca
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -11,7 +11,7 @@
 LIBASSUAN_LICENSE_FILES = COPYING.LIB COPYING
 LIBASSUAN_INSTALL_STAGING = YES
 LIBASSUAN_DEPENDENCIES = libgpg-error
-LIBASSUAN_CONF_OPT = \
+LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -19,13 +19,13 @@
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 	LIBBLURAY_DEPENDENCIES += freetype
 else
-	LIBBLURAY_CONF_OPT += --without-freetype
+	LIBBLURAY_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 	LIBBLURAY_DEPENDENCIES += libxml2
 else
-	LIBBLURAY_CONF_OPT += --without-libxml2
+	LIBBLURAY_CONF_OPTS += --without-libxml2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -11,6 +11,6 @@
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-LIBCAP_NG_CONF_OPT = --without-python
+LIBCAP_NG_CONF_OPTS = --without-python
 
 $(eval $(autotools-package))
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -9,20 +9,20 @@
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPLv3+
 LIBCDIO_LICENSE_FILES = COPYING
-LIBCDIO_CONF_OPT = --disable-example-progs --disable-cddb
+LIBCDIO_CONF_OPTS = --disable-example-progs --disable-cddb
 
 ifeq ($(BR2_ENABLE_LOCALE),)
 LIBCDIO_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),)
-LIBCDIO_CONF_OPT += --disable-cxx
+LIBCDIO_CONF_OPTS += --disable-cxx
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LIBCDIO_DEPENDENCIES += ncurses
 else
-LIBCDIO_CONF_OPT += --without-cdda-player
+LIBCDIO_CONF_OPTS += --without-cdda-player
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -23,12 +23,12 @@
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCEC_CONF_OPT = --enable-rpi \
+LIBCEC_CONF_OPTS = --enable-rpi \
    --with-rpi-include-path=$(STAGING_DIR)/usr/include
 LIBCEC_DEPENDENCIES += rpi-userland
 LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
 else
-LIBCEC_CONF_OPT = --disable-rpi
+LIBCEC_CONF_OPTS = --disable-rpi
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -12,7 +12,7 @@
 LIBCGICC_INSTALL_STAGING = YES
 LIBCGICC_AUTORECONF = YES
 LIBCGICC_CONFIG_SCRIPTS = cgicc-config
-LIBCGICC_CONF_OPT = \
+LIBCGICC_CONF_OPTS = \
 	--disable-demos \
 	--disable-doc
 
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -19,16 +19,16 @@
 	CXXFLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS" \
 	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
 
-LIBCGROUP_CONF_OPT = \
+LIBCGROUP_CONF_OPTS = \
 	--disable-tools \
 	--disable-daemon \
 	--disable-initscript-install
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 	LIBCGROUP_DEPENDENCIES += linux-pam
-	LIBCGROUP_CONF_OPT += --enable-pam
+	LIBCGROUP_CONF_OPTS += --enable-pam
 else
-	LIBCGROUP_CONF_OPT += --disable-pam
+	LIBCGROUP_CONF_OPTS += --disable-pam
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -9,10 +9,10 @@
 LIBCONFIG_LICENSE = LGPLv2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
-LIBCONFIG_CONF_OPT = --disable-examples
+LIBCONFIG_CONF_OPTS = --disable-examples
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBCONFIG_CONF_OPT += --disable-cxx
+LIBCONFIG_CONF_OPTS += --disable-cxx
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -7,7 +7,7 @@
 LIBCONFUSE_VERSION = V2_7
 LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
-LIBCONFUSE_CONF_OPT = --disable-rpath
+LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = src/confuse.c
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -21,7 +21,7 @@
 # on non-MMU platforms. Moreover, this authentication method is
 # probably almost never used. See
 # http://curl.haxx.se/docs/manpage.html#--ntlm.
-LIBCURL_CONF_OPT = --disable-verbose --disable-manual --disable-ntlm-wb \
+LIBCURL_CONF_OPTS = --disable-verbose --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom
 LIBCURL_CONFIG_SCRIPTS = curl-config
 
@@ -33,27 +33,27 @@
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
 LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:/lib:/usr/lib
-LIBCURL_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr \
+LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LIBCURL_CONF_OPT += --with-gnutls=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
 LIBCURL_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_LIBNSS),y)
-LIBCURL_CONF_OPT += --with-nss=$(STAGING_DIR)/usr
+LIBCURL_CONF_OPTS += --with-nss=$(STAGING_DIR)/usr
 LIBCURL_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) `$(PKG_CONFIG_HOST_BINARY) nspr nss --cflags`"
 LIBCURL_DEPENDENCIES += libnss
 else
 # polarssl support needs 1.3.x
-LIBCURL_CONF_OPT += --without-ssl --without-gnutls \
+LIBCURL_CONF_OPTS += --without-ssl --without-gnutls \
 	--without-polarssl --without-nss
 endif
 
 # Configure curl to support libssh2
 ifeq ($(BR2_PACKAGE_LIBSSH2),y)
 LIBCURL_DEPENDENCIES += libssh2
-LIBCURL_CONF_OPT += --with-libssh2
+LIBCURL_CONF_OPTS += --with-libssh2
 else
-LIBCURL_CONF_OPT += --without-libssh2
+LIBCURL_CONF_OPTS += --without-libssh2
 endif
 
 define LIBCURL_FIX_DOT_PC
diff --git a/package/libdaemon/libdaemon.mk b/package/libdaemon/libdaemon.mk
--- a/package/libdaemon/libdaemon.mk
+++ b/package/libdaemon/libdaemon.mk
@@ -10,7 +10,7 @@
 LIBDAEMON_LICENSE_FILES = LICENSE
 LIBDAEMON_INSTALL_STAGING = YES
 LIBDAEMON_CONF_ENV = ac_cv_func_setpgrp_void=no
-LIBDAEMON_CONF_OPT = --disable-lynx
+LIBDAEMON_CONF_OPTS = --disable-lynx
 LIBDAEMON_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -10,13 +10,13 @@
 LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
-LIBDNET_CONF_OPT = \
+LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-check=no
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES = python
-LIBDNET_CONF_OPT += --with-python
+LIBDNET_CONF_OPTS += --with-python
 LIBDNET_MAKE_OPTS = PYINCDIR=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) PYLIBDIR=$(STAGING_DIR)/usr/lib
 LIBDNET_INSTALL_TARGET_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(TARGET_DIR) INSTALL_STRIP_FLAG=-s install-exec
 LIBDNET_INSTALL_STAGING_OPTS = $(LIBDNET_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -15,62 +15,62 @@
 	libpthread-stubs \
 	host-pkgconf
 
-LIBDRM_CONF_OPT = \
+LIBDRM_CONF_OPTS = \
 	--disable-cairo-tests \
 	--disable-manpages
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
-LIBDRM_CONF_OPT += --enable-intel
+LIBDRM_CONF_OPTS += --enable-intel
 LIBDRM_DEPENDENCIES += libatomic_ops xlib_libpciaccess
 else
-LIBDRM_CONF_OPT += --disable-intel
+LIBDRM_CONF_OPTS += --disable-intel
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
-LIBDRM_CONF_OPT += --enable-radeon
+LIBDRM_CONF_OPTS += --enable-radeon
 else
-LIBDRM_CONF_OPT += --disable-radeon
+LIBDRM_CONF_OPTS += --disable-radeon
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
-LIBDRM_CONF_OPT += --enable-nouveau
+LIBDRM_CONF_OPTS += --enable-nouveau
 else
-LIBDRM_CONF_OPT += --disable-nouveau
+LIBDRM_CONF_OPTS += --disable-nouveau
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
-LIBDRM_CONF_OPT += --enable-vmwgfx
+LIBDRM_CONF_OPTS += --enable-vmwgfx
 else
-LIBDRM_CONF_OPT += --disable-vmwgfx
+LIBDRM_CONF_OPTS += --disable-vmwgfx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
-LIBDRM_CONF_OPT += --enable-omap-experimental-api
+LIBDRM_CONF_OPTS += --enable-omap-experimental-api
 else
-LIBDRM_CONF_OPT += --disable-omap-experimental-api
+LIBDRM_CONF_OPTS += --disable-omap-experimental-api
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
-LIBDRM_CONF_OPT += --enable-exynos-experimental-api
+LIBDRM_CONF_OPTS += --enable-exynos-experimental-api
 else
-LIBDRM_CONF_OPT += --disable-exynos-experimental-api
+LIBDRM_CONF_OPTS += --disable-exynos-experimental-api
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
-LIBDRM_CONF_OPT += --enable-freedreno-experimental-api
+LIBDRM_CONF_OPTS += --enable-freedreno-experimental-api
 else
-LIBDRM_CONF_OPT += --disable-freedreno-experimental-api
+LIBDRM_CONF_OPTS += --disable-freedreno-experimental-api
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBDRM_CONF_OPT += --enable-udev
+LIBDRM_CONF_OPTS += --enable-udev
 LIBDRM_DEPENDENCIES += udev
 else
-LIBDRM_CONF_OPT += --disable-udev
+LIBDRM_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
-LIBDRM_CONF_OPT += --enable-install-test-programs
+LIBDRM_CONF_OPTS += --enable-install-test-programs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -17,6 +17,6 @@
 
 # By default libdvdnav tries to find dvdread-config in $PATH. Because
 # of cross compilation, we prefer using pkg-config.
-LIBDVDNAV_CONF_OPT = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
+LIBDVDNAV_CONF_OPTS = --with-dvdread-config="$(PKG_CONFIG_HOST_BINARY) dvdread"
 
 $(eval $(autotools-package))
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -22,12 +22,12 @@
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBEXOSIP2_DEPENDENCIES += openssl
-LIBEXOSIP2_CONF_OPT += --enable-openssl
+LIBEXOSIP2_CONF_OPTS += --enable-openssl
 else
-LIBEXOSIP2_CONF_OPT += --disable-openssl
+LIBEXOSIP2_CONF_OPTS += --disable-openssl
 endif
 
-LIBEXOSIP2_CONF_OPT += \
+LIBEXOSIP2_CONF_OPTS += \
 	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
 $(eval $(autotools-package))
diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -15,7 +15,7 @@
 LIBEDIT_AUTORECONF = YES
 
 # Doesn't really support !wchar, but support is disabled otherwise
-LIBEDIT_CONF_OPT += --enable-widec
+LIBEDIT_CONF_OPTS += --enable-widec
 
 # Note: libbsd required for *vis functions, but works only with a toolchain
 # with __progname; otherwise, some features are disabled, as if libbsd was
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -8,7 +8,7 @@
 LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
 LIBEXIF_SITE = http://downloads.sourceforge.net/project/libexif/libexif/$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
-LIBEXIF_CONF_OPT = --disable-docs
+LIBEXIF_CONF_OPTS = --disable-docs
 LIBEXIF_DEPENDENCIES = host-pkgconf
 LIBEXIF_LICENSE = LGPLv2.1+
 LIBEXIF_LICENSE_FILES = COPYING
diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -11,13 +11,13 @@
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
 
-LIBFDTI_CONF_OPT = --without-examples
+LIBFDTI_CONF_OPTS = --without-examples
 
 # configure detect it automaticaly so we need to force it
 ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
-LIBFDTI_CONF_OPT += --enable-libftdipp
+LIBFDTI_CONF_OPTS += --enable-libftdipp
 else
-LIBFDTI_CONF_OPT += --disable-libftdipp
+LIBFDTI_CONF_OPTS += --disable-libftdipp
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libfuse/libfuse.mk b/package/libfuse/libfuse.mk
--- a/package/libfuse/libfuse.mk
+++ b/package/libfuse/libfuse.mk
@@ -11,7 +11,7 @@
 LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
 LIBFUSE_INSTALL_STAGING = YES
 LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-LIBFUSE_CONF_OPT = \
+LIBFUSE_CONF_OPTS = \
 		--disable-example \
 		--enable-lib \
 		--enable-util
diff --git a/package/libgail/libgail.mk b/package/libgail/libgail.mk
--- a/package/libgail/libgail.mk
+++ b/package/libgail/libgail.mk
@@ -14,7 +14,7 @@
 LIBGAIL_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-LIBGAIL_CONF_OPT += --disable-x
+LIBGAIL_CONF_OPTS += --disable-x
 endif
 
 LIBGAIL_DEPENDENCIES = host-pkgconf libgtk2 pango
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -15,7 +15,7 @@
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
-LIBGCRYPT_CONF_OPT = \
+LIBGCRYPT_CONF_OPTS = \
 	--disable-optimization \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -61,7 +61,7 @@
 LIBGLIB2_CONF_ENV += ac_cv_header_sys_inotify_h=no
 endif
 
-HOST_LIBGLIB2_CONF_OPT = \
+HOST_LIBGLIB2_CONF_OPTS = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 		--disable-dtrace \
@@ -69,9 +69,9 @@
 		--disable-gcov \
 		--disable-modular-tests
 
-LIBGLIB2_CONF_OPT += --disable-modular-tests
+LIBGLIB2_CONF_OPTS += --disable-modular-tests
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-	LIBGLIB2_CONF_OPT += --with-threads=none --disable-threads
+	LIBGLIB2_CONF_OPTS += --with-threads=none --disable-threads
 endif
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
@@ -83,15 +83,15 @@
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-LIBGLIB2_CONF_OPT += --with-libiconv=gnu
+LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
-LIBGLIB2_CONF_OPT += --with-pcre=system
+LIBGLIB2_CONF_OPTS += --with-pcre=system
 LIBGLIB2_DEPENDENCIES += pcre
 else
-LIBGLIB2_CONF_OPT += --with-pcre=internal
+LIBGLIB2_CONF_OPTS += --with-pcre=internal
 endif
 
 define LIBGLIB2_REMOVE_DEV_FILES
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -13,7 +13,7 @@
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 
 # libgpgme, needs to know the gpg binary path on the target.
-LIBGPGME_CONF_OPT = --with-gpg=/usr/bin/gpg \
+LIBGPGME_CONF_OPTS = --with-gpg=/usr/bin/gpg \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
 	--with-libassuan-prefix=$(STAGING_DIR)/usr \
 	--disable-gpgsm-test \
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -69,14 +69,14 @@
 		ac_cv_prog_F77=no \
 		ac_cv_path_CUPS_CONFIG=no
 
-LIBGTK2_CONF_OPT = --disable-glibtest \
+LIBGTK2_CONF_OPTS = --disable-glibtest \
 		--enable-explicit-deps=no \
 		--disable-debug
 
 LIBGTK2_DEPENDENCIES = host-pkgconf host-libgtk2 libglib2 cairo pango atk gdk-pixbuf
 
 # Xorg dependencies
-LIBGTK2_CONF_OPT += \
+LIBGTK2_CONF_OPTS += \
 	--with-x \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
@@ -85,17 +85,17 @@
 	xlib_libXext xlib_libXrender
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-	LIBGTK2_CONF_OPT += --enable-xinerama
+	LIBGTK2_CONF_OPTS += --enable-xinerama
 	LIBGTK2_DEPENDENCIES += xlib_libXinerama
 else
-	LIBGTK2_CONF_OPT += --disable-xinerama
+	LIBGTK2_CONF_OPTS += --disable-xinerama
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-	LIBGTK2_CONF_OPT += --with-xinput=yes
+	LIBGTK2_CONF_OPTS += --with-xinput=yes
 	LIBGTK2_DEPENDENCIES += xlib_libXi
 else
-	LIBGTK2_CONF_OPT += --with-xinput=no
+	LIBGTK2_CONF_OPTS += --with-xinput=no
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
@@ -121,25 +121,25 @@
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LIBGTK2_DEPENDENCIES += libpng
 else
-LIBGTK2_CONF_OPT += --without-libpng
+LIBGTK2_CONF_OPTS += --without-libpng
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBGTK2_DEPENDENCIES += jpeg
 else
-LIBGTK2_CONF_OPT += --without-libjpeg
+LIBGTK2_CONF_OPTS += --without-libjpeg
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 LIBGTK2_DEPENDENCIES += tiff
 else
-LIBGTK2_CONF_OPT += --without-libtiff
+LIBGTK2_CONF_OPTS += --without-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 LIBGTK2_DEPENDENCIES += cups
 else
-LIBGTK2_CONF_OPT += --disable-cups
+LIBGTK2_CONF_OPTS += --disable-cups
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK2_DEMO),)
@@ -158,7 +158,7 @@
 # for the target.
 
 HOST_LIBGTK2_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
-HOST_LIBGTK2_CONF_OPT = \
+HOST_LIBGTK2_CONF_OPTS = \
 		--disable-static \
 		--disable-glibtest \
 		--without-libtiff \
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
--- a/package/libhid/libhid.mk
+++ b/package/libhid/libhid.mk
@@ -14,7 +14,7 @@
 # configure runs libusb-config for cflags/ldflags. Ensure it picks up
 # the target version
 LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
-LIBHID_CONF_OPT = \
+LIBHID_CONF_OPTS = \
 	--disable-swig \
 	--disable-werror \
 	--without-doxygen \
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -8,7 +8,7 @@
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
+LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPLv2+ GPLv3+ LGPLv3+
 LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -14,6 +14,6 @@
 LIBINPUT_INSTALL_STAGING = YES
 
 # Tests need fork, so just disable them everywhere.
-LIBINPUT_CONF_OPT = --disable-tests
+LIBINPUT_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -11,6 +11,6 @@
 LIBKSBA_LICENSE_FILES = AUTHORS COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv3
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
-LIBKSBA_CONF_OPT = --with-gpg-error-prefix=$(STAGING_DIR)/usr
+LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -13,7 +13,7 @@
 # No license file included, it refers to the gnu.org website
 
 LIBLOCKFILE_INSTALL_STAGING = YES
-LIBLOCKFILE_CONF_OPT = --mandir=/usr/share/man
+LIBLOCKFILE_CONF_OPTS = --mandir=/usr/share/man
 
 define LIBLOCKFILE_INSTALL_STAGING_CMDS
 	mkdir -p $(addprefix $(STAGING_DIR)/usr/share/man/man,1 3)
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -7,7 +7,7 @@
 LIBLOG4C_LOCALTIME_VERSION = v1.0
 LIBLOG4C_LOCALTIME_SITE = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
-LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
+LIBLOG4C_LOCALTIME_CONF_OPTS = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 LIBLOG4C_LOCALTIME_CONFIG_SCRIPTS = log4c-config
 LIBLOG4C_LOCALTIME_LICENSE = LGPLv2.1
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -9,13 +9,13 @@
 LIBLOGGING_LICENSE = BSD-2c
 LIBLOGGING_LICENSE_FILES = COPYING
 LIBLOGGING_INSTALL_STAGING = YES
-LIBLOGGING_CONF_OPT = --enable-cached-man-pages
+LIBLOGGING_CONF_OPTS = --enable-cached-man-pages
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-LIBLOGGING_CONF_OPT += --enable-journal
+LIBLOGGING_CONF_OPTS += --enable-journal
 LIBLOGGING_DEPENDENCIES += systemd
 else
-LIBLOGGING_CONF_OPT += --disable-journal
+LIBLOGGING_CONF_OPTS += --disable-journal
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -30,7 +30,7 @@
 LIBMAD_POST_INSTALL_STAGING_HOOKS += LIBMAD_INSTALL_STAGING_PC
 LIBMAD_POST_INSTALL_TARGET_HOOKS += LIBMAD_INSTALL_TARGET_PC
 
-LIBMAD_CONF_OPT = \
+LIBMAD_CONF_OPTS = \
 		--disable-debugging \
 		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_SPEED),--enable-speed) \
 		$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),--enable-accuracy) \
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -14,6 +14,6 @@
 LIBMBIM_DEPENDENCIES = libglib2 udev
 
 # we don't want -Werror
-LIBMBIM_CONF_OPT = --enable-more-warnings=no
+LIBMBIM_CONF_OPTS = --enable-more-warnings=no
 
 $(eval $(autotools-package))
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -8,7 +8,7 @@
 LIBMEMCACHED_VERSION = $(LIBMEMCACHED_VERSION_MAJOR).18
 LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_VERSION_MAJOR)/$(LIBMEMCACHED_VERSION)/+download
 LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-LIBMEMCACHED_CONF_OPT = --disable-dtrace
+LIBMEMCACHED_CONF_OPTS = --disable-dtrace
 LIBMEMCACHED_INSTALL_STAGING = YES
 LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
 # For libmemcached-01-disable-tests.patch
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,21 +8,21 @@
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
-LIBMICROHTTPD_CONF_OPT = --disable-curl --disable-spdy
+LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-spdy
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPLv2.1+
 LIBMICROHTTPD_DEPENDENCIES += gnutls libgcrypt
-LIBMICROHTTPD_CONF_OPT += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
+LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_LICENSE = LGPLv2.1+ or eCos
-LIBMICROHTTPD_CONF_OPT += --disable-https
+LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
 ifeq ($(BR2_avr32),y)
 # no epoll_create1
-LIBMICROHTTPD_CONF_OPT += --disable-epoll
+LIBMICROHTTPD_CONF_OPTS += --disable-epoll
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -10,14 +10,14 @@
 LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
-LIBMPEG2_CONF_OPT = --without-x --disable-directx
+LIBMPEG2_CONF_OPTS = --without-x --disable-directx
 
 ifeq ($(BR2_PACKAGE_SDL),y)
 LIBMPEG2_CONF_ENV += ac_cv_prog_SDLCONFIG=$(STAGING_DIR)/usr/bin/sdl-config
-LIBMPEG2_CONF_OPT += --enable-sdl
+LIBMPEG2_CONF_OPTS += --enable-sdl
 LIBMPEG2_DEPENDENCIES += sdl
 else
-LIBMPEG2_CONF_OPT += --disable-sdl
+LIBMPEG2_CONF_OPTS += --disable-sdl
 endif
 
 ifneq ($(BR2_PACKAGE_LIBMPEG2_BINS),y)
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -10,6 +10,6 @@
 LIBNDP_LICENSE_FILES = COPYING
 LIBNDP_AUTORECONF = YES
 LIBNDP_INSTALL_STAGING = YES
-LIBNDP_CONF_OPT = --disable-debug
+LIBNDP_CONF_OPTS = --disable-debug
 
 $(eval $(autotools-package))
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -15,13 +15,13 @@
 LIBNFC_DEPENDENCIES = host-pkgconf libusb libusb-compat
 
 # N.B. The acr122 driver requires pcsc-lite.
-LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
+LIBNFC_CONF_OPTS = --with-drivers=arygon,pn53x_usb
 
 ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
-LIBNFC_CONF_OPT += --enable-example
+LIBNFC_CONF_OPTS += --enable-example
 LIBNFC_DEPENDENCIES += readline
 else
-LIBNFC_CONF_OPT += --disable-example
+LIBNFC_CONF_OPTS += --disable-example
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -13,17 +13,17 @@
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
-LIBNFTNL_CONF_OPT += --with-json-parsing
+LIBNFTNL_CONF_OPTS += --with-json-parsing
 LIBNFTNL_DEPENDENCIES += jansson
 else
-LIBNFTNL_CONF_OPT += --without-json-parsing
+LIBNFTNL_CONF_OPTS += --without-json-parsing
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL_XML),y)
-LIBNFTNL_CONF_OPT += --with-xml-parsing
+LIBNFTNL_CONF_OPTS += --with-xml-parsing
 LIBNFTNL_DEPENDENCIES += mxml
 else
-LIBNFTNL_CONF_OPT += --without-xml-parsing
+LIBNFTNL_CONF_OPTS += --without-xml-parsing
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -12,9 +12,9 @@
 LIBNL_DEPENDENCIES = host-bison host-flex
 
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
-LIBNL_CONF_OPT += --enable-cli
+LIBNL_CONF_OPTS += --enable-cli
 else
-LIBNL_CONF_OPT += --disable-cli
+LIBNL_CONF_OPTS += --disable-cli
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -17,15 +17,15 @@
 LIBNSPR_CONF_ENV = HOST_CFLAGS="-g -O2" \
 		   HOST_LDFLAGS="-lc"
 # NSPR mixes up --build and --host
-LIBNSPR_CONF_OPT  = --host=$(GNU_HOST_NAME)
-LIBNSPR_CONF_OPT += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
-LIBNSPR_CONF_OPT += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
+LIBNSPR_CONF_OPTS  = --host=$(GNU_HOST_NAME)
+LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
+LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
 
 ifeq ($(BR2_arm),y)
 ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
-LIBNSPR_CONF_OPT += --enable-thumb2
+LIBNSPR_CONF_OPTS += --enable-thumb2
 else
-LIBNSPR_CONF_OPT += --disable-thumb2
+LIBNSPR_CONF_OPTS += --disable-thumb2
 endif
 endif
 
diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -14,7 +14,7 @@
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOAUTH_DEPENDENCIES += libcurl
 else
-LIBOAUTH_CONF_OPT += --disable-libcurl
+LIBOAUTH_CONF_OPTS += --disable-libcurl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -8,7 +8,7 @@
 LIBOPING_SITE = http://verplant.org/liboping/files
 LIBOPING_INSTALL_STAGING = YES
 LIBOPING_DEPENDENCIES = $(if $(BR2_PACKAGE_NCURSES),ncurses)
-LIBOPING_CONF_OPT = --without-perl-bindings
+LIBOPING_CONF_OPTS = --without-perl-bindings
 LIBOPING_LICENSE = LGPLv2.1+ GPLv2
 LIBOPING_LICENSE_FILES = COPYING
 
diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -15,7 +15,7 @@
 LIBOSIP2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
 endif
 
-LIBOSIP2_CONF_OPT = \
+LIBOSIP2_CONF_OPTS = \
 	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
 $(eval $(autotools-package))
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -17,35 +17,35 @@
 		ac_cv_header_linux_wireless_h=yes \
 		CFLAGS="$(LIBPCAP_CFLAGS)"
 LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
-LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
+LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
 # On purpose, not compatible with bluez5
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 LIBPCAP_DEPENDENCIES += bluez_utils
 else
-LIBPCAP_CONF_OPT += --disable-bluetooth
+LIBPCAP_CONF_OPTS += --disable-bluetooth
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-LIBPCAP_CONF_OPT += --enable-dbus
+LIBPCAP_CONF_OPTS += --enable-dbus
 LIBPCAP_DEPENDENCIES += dbus
 else
-LIBPCAP_CONF_OPT += --disable-dbus
+LIBPCAP_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-LIBPCAP_CONF_OPT += --enable-canusb
+LIBPCAP_CONF_OPTS += --enable-canusb
 LIBPCAP_DEPENDENCIES += libusb
 else
-LIBPCAP_CONF_OPT += --disable-canusb
+LIBPCAP_CONF_OPTS += --disable-canusb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
 LIBPCAP_DEPENDENCIES += libnl
 LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
 else
-LIBPCAP_CONF_OPT += --without-libnl
+LIBPCAP_CONF_OPTS += --without-libnl
 endif
 
 # microblaze needs -fPIC instead of -fpic
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -8,7 +8,7 @@
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
 LIBPHIDGET_SITE = http://www.phidgets.com/downloads/libraries/
 LIBPHIDGET_DEPENDENCIES = libusb
-LIBPHIDGET_CONF_OPT = --disable-ldconfig
+LIBPHIDGET_CONF_OPTS = --disable-ldconfig
 LIBPHIDGET_INSTALL_STAGING = YES
 LIBPHIDGET_LICENSE = LGPLv3
 LIBPHIDGET_LICENSE_FILES = COPYING
diff --git a/package/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
--- a/package/libplayer/libplayer.mk
+++ b/package/libplayer/libplayer.mk
@@ -21,27 +21,27 @@
 		--prefix=/usr \
 		--cross-compile \
 		$(SHARED_STATIC_LIBS_OPTS) \
-		$(LIBPLAYER_CONF_OPT) \
+		$(LIBPLAYER_CONF_OPTS) \
 	)
 endef
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_MPLAYER),y)
 	LIBPLAYER_DEPENDENCIES += mplayer
-	LIBPLAYER_CONF_OPT += --enable-mplayer
+	LIBPLAYER_CONF_OPTS += --enable-mplayer
 else
-	LIBPLAYER_CONF_OPT += --disable-mplayer
+	LIBPLAYER_CONF_OPTS += --disable-mplayer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_GSTREAMER),y)
 	LIBPLAYER_DEPENDENCIES += gstreamer
-	LIBPLAYER_CONF_OPT += --enable-gstreamer
+	LIBPLAYER_CONF_OPTS += --enable-gstreamer
 else
-	LIBPLAYER_CONF_OPT += --disable-gstreamer
+	LIBPLAYER_CONF_OPTS += --disable-gstreamer
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPLAYER_PYTHON),y)
 	LIBPLAYER_DEPENDENCIES += python
-	LIBPLAYER_CONF_OPT += --enable-binding-python
+	LIBPLAYER_CONF_OPTS += --enable-binding-python
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -13,7 +13,7 @@
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
-LIBPNG_CONF_OPT = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
+LIBPNG_CONF_OPTS = $(if $(BR2_ARM_CPU_HAS_NEON),--enable-arm-neon=yes,--enable-arm-neon=no)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
--- a/package/libpthsem/libpthsem.mk
+++ b/package/libpthsem/libpthsem.mk
@@ -15,10 +15,10 @@
 LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
 
 ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
-LIBPTHSEM_CONF_OPT += --enable-compat
+LIBPTHSEM_CONF_OPTS += --enable-compat
 LIBPTHSEM_CONFIG_SCRIPTS += pth-config
 else
-LIBPTHSEM_CONF_OPT += --disable-compat
+LIBPTHSEM_CONF_OPTS += --disable-compat
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -14,6 +14,6 @@
 LIBQMI_DEPENDENCIES = libglib2
 
 # we don't want -Werror
-LIBQMI_CONF_OPT = --enable-more-warnings=no
+LIBQMI_CONF_OPTS = --enable-more-warnings=no
 
 $(eval $(autotools-package))
diff --git a/package/libqrencode/libqrencode.mk b/package/libqrencode/libqrencode.mk
--- a/package/libqrencode/libqrencode.mk
+++ b/package/libqrencode/libqrencode.mk
@@ -15,14 +15,14 @@
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBQRENCODE_CONF_ENV += LIBS='-pthread'
 else
-LIBQRENCODE_CONF_OPT += --disable-thread-safety
+LIBQRENCODE_CONF_OPTS += --disable-thread-safety
 endif
 
 ifeq ($(BR2_PACKAGE_LIBQRENCODE_TOOLS),y)
-LIBQRENCODE_CONF_OPT += --with-tools=yes
+LIBQRENCODE_CONF_OPTS += --with-tools=yes
 LIBQRENCODE_DEPENDENCIES += libpng
 else
-LIBQRENCODE_CONF_OPT += --with-tools=no
+LIBQRENCODE_CONF_OPTS += --with-tools=no
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -8,7 +8,7 @@
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-LIBRAW_CONF_OPT += --disable-examples --disable-lcms \
+LIBRAW_CONF_OPTS += --disable-examples --disable-lcms \
 			--disable-openmp --disable-demosaic-pack-gpl2 \
 			--disable-demosaic-pack-gpl3
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -10,7 +10,7 @@
 LIBROXML_LICENSE = LGPLv2.1+ with static link exception
 LIBROXML_LICENSE_FILES = License.txt
 
-LIBROXML_CONF_OPT = --disable-silent-rules
+LIBROXML_CONF_OPTS = --disable-silent-rules
 
 # libroxml forgets to compile/link with -pthread, even though it uses
 # thread functions breaking static linking
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -8,7 +8,7 @@
 LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).3
 LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_INSTALL_STAGING = YES
-LIBRSVG_CONF_OPT = --disable-tools
+LIBRSVG_CONF_OPTS = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
 LIBRSVG_LICENSE = LGPLv2+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -12,11 +12,11 @@
 LIBRTLSDR_DEPENDENCIES = libusb
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBRTLSDR_CONF_OPT += -DINSTALL_UDEV_RULES=ON
+LIBRTLSDR_CONF_OPTS += -DINSTALL_UDEV_RULES=ON
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
-LIBRTLSDR_CONF_OPT += -DDETACH_KERNEL_DRIVER=1
+LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libsamplerate/libsamplerate.mk b/package/libsamplerate/libsamplerate.mk
--- a/package/libsamplerate/libsamplerate.mk
+++ b/package/libsamplerate/libsamplerate.mk
@@ -8,7 +8,7 @@
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkgconf
-LIBSAMPLERATE_CONF_OPT = --disable-fftw --program-transform-name=''
+LIBSAMPLERATE_CONF_OPTS = --disable-fftw --program-transform-name=''
 LIBSAMPLERATE_LICENSE = Dual GPLv2+ / libsamplerate commercial use license
 LIBSAMPLERATE_LICENSE_FILES = COPYING
 
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -12,14 +12,14 @@
 LIBSECRET_INSTALL_STAGING = YES
 
 LIBSECRET_DEPENDENCIES = libglib2 host-intltool
-LIBSECRET_CONF_OPT = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
+LIBSECRET_CONF_OPTS = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	LIBSECRET_DEPENDENCIES += libgcrypt
-	LIBSECRET_CONF_OPT += --enable-gcrypt \
+	LIBSECRET_CONF_OPTS += --enable-gcrypt \
 		--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-	LIBSECRET_CONF_OPT += --disable-gcrypt
+	LIBSECRET_CONF_OPTS += --disable-gcrypt
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libsoc/libsoc.mk b/package/libsoc/libsoc.mk
--- a/package/libsoc/libsoc.mk
+++ b/package/libsoc/libsoc.mk
@@ -10,6 +10,6 @@
 LIBSOC_LICENSE_FILES = COPYING
 LIBSOC_AUTORECONF = YES
 LIBSOC_INSTALL_STAGING = YES
-LIBSOC_CONF_OPT = --disable-debug
+LIBSOC_CONF_OPTS = --disable-debug
 
 $(eval $(autotools-package))
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -18,21 +18,21 @@
 LIBSOUP_CONF_ENV += soup_cv_ipv6=no
 endif
 
-LIBSOUP_CONF_OPT = --disable-glibtest
+LIBSOUP_CONF_OPTS = --disable-glibtest
 
 LIBSOUP_DEPENDENCIES = host-pkgconf host-libglib2 \
        libglib2 libxml2 sqlite host-intltool
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_GNOME),y)
-LIBSOUP_CONF_OPT += --with-gnome
+LIBSOUP_CONF_OPTS += --with-gnome
 else
-LIBSOUP_CONF_OPT += --without-gnome
+LIBSOUP_CONF_OPTS += --without-gnome
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
 else
-LIBSOUP_CONF_OPT += --disable-tls-check
+LIBSOUP_CONF_OPTS += --disable-tls-check
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -10,16 +10,16 @@
 LIBSOXR_LICENSE = LGPLv2.1+
 LIBSOXR_LICENSE_FILES = LICENCE COPYING.LGPL
 LIBSOXR_INSTALL_STAGING = YES
-LIBSOXR_CONF_OPT = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF
+LIBSOXR_CONF_OPTS = -DWITH_OPENMP:BOOL=OFF -DBUILD_TESTS:BOOL=OFF
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBSOXR_CONF_OPT += -DBUILD_SHARED_LIBS:BOOL=OFF
+LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
 endif
 
 ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
-LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=1
+LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=1
 else
-LIBSOXR_CONF_OPT += -DHAVE_WORDS_BIGENDIAN=0
+LIBSOXR_CONF_OPTS += -DHAVE_WORDS_BIGENDIAN=0
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -9,18 +9,18 @@
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
 LIBSSH2_INSTALL_STAGING = YES
-LIBSSH2_CONF_OPT = --disable-examples-build
+LIBSSH2_CONF_OPTS = --disable-examples-build
 
 # libssh2 must use either libgcrypt or OpenSSL
 # Only select openssl if libgcrypt is not selected
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSSH2_DEPENDENCIES += libgcrypt
-LIBSSH2_CONF_OPT += --with-libgcrypt \
+LIBSSH2_CONF_OPTS += --with-libgcrypt \
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr \
 	--without-openssl
 else
 LIBSSH2_DEPENDENCIES += openssl
-LIBSSH2_CONF_OPT += --with-openssl \
+LIBSSH2_CONF_OPTS += --with-openssl \
 	--with-libssl-prefix=$(STAGING_DIR)/usr \
 	--without-libgcrypt
 endif
@@ -28,9 +28,9 @@
 # Add zlib support if enabled
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH2_DEPENDENCIES += zlib
-LIBSSH2_CONF_OPT += --with-libz
+LIBSSH2_CONF_OPTS += --with-libz
 else
-LIBSSH2_CONF_OPT += --without-libz
+LIBSSH2_CONF_OPTS += --without-libz
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -22,7 +22,7 @@
 # configure script assumes expat should be used.
 LIBSTROPHE_DEPENDENCIES += expat
 else
-LIBSTROPHE_CONF_OPT += --with-libxml2
+LIBSTROPHE_CONF_OPTS += --with-libxml2
 LIBSTROPHE_DEPENDENCIES += libxml2
 endif
 
diff --git a/package/libsvg-cairo/libsvg-cairo.mk b/package/libsvg-cairo/libsvg-cairo.mk
--- a/package/libsvg-cairo/libsvg-cairo.mk
+++ b/package/libsvg-cairo/libsvg-cairo.mk
@@ -11,6 +11,6 @@
 LIBSVG_CAIRO_LICENSE         = LGPLv2.1+
 LIBSVG_CAIRO_LICENSE_FILES   = COPYING
 
-LIBSVG_CAIRO_CONF_OPT = --without-x
+LIBSVG_CAIRO_CONF_OPTS = --without-x
 
 $(eval $(autotools-package))
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
--- a/package/libsvg/libsvg.mk
+++ b/package/libsvg/libsvg.mk
@@ -13,10 +13,10 @@
 
 # libsvg needs at last a XML parser
 ifeq ($(BR2_PACKAGE_EXPAT),y)
-LIBSVG_CONF_OPT += --with-expat
+LIBSVG_CONF_OPTS += --with-expat
 LIBSVG_DEPENDENCIES += expat
 else
-LIBSVG_CONF_OPT += --with-libxml2
+LIBSVG_CONF_OPTS += --with-libxml2
 LIBSVG_DEPENDENCIES += libxml2
 endif
 
diff --git a/package/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
--- a/package/libtheora/libtheora.mk
+++ b/package/libtheora/libtheora.mk
@@ -11,7 +11,7 @@
 LIBTHEORA_LICENSE = BSD-3c
 LIBTHEORA_LICENSE_FILES = COPYING LICENSE
 
-LIBTHEORA_CONF_OPT = \
+LIBTHEORA_CONF_OPTS = \
 		--disable-oggtest \
 		--disable-vorbistest \
 		--disable-sdltest \
diff --git a/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk
--- a/package/libtirpc/libtirpc.mk
+++ b/package/libtirpc/libtirpc.mk
@@ -16,7 +16,7 @@
 # getrpcby{number,name} are only provided if 'GQ' is defined
 LIBTIRPC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DGQ"
 
-LIBTIRPC_CONF_OPT = --disable-gssapi
+LIBTIRPC_CONF_OPTS = --disable-gssapi
 
 # We need host-pkgconf because the configure.ac contains a
 # PKG_CHECK_MODULES macro call, and since we're autoreconfiguring this
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -8,7 +8,7 @@
 LIBTORRENT_SITE = http://libtorrent.rakshasa.no/downloads
 LIBTORRENT_DEPENDENCIES = host-pkgconf libsigc \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
-LIBTORRENT_CONF_OPT = --enable-aligned \
+LIBTORRENT_CONF_OPTS = --enable-aligned \
 	$(if $(BR2_PACKAGE_OPENSSL),--enable-openssl,--disable-openssl)
 LIBTORRENT_INSTALL_STAGING = YES
 LIBTORRENT_AUTORECONF = YES
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -12,10 +12,10 @@
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
-LIBUBOX_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUBOX_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-LIBUBOX_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+LIBUBOX_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -12,10 +12,10 @@
 
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
-LIBUCI_CONF_OPT += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+LIBUCI_CONF_OPTS += -DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
-LIBUCI_CONF_OPT += -DBUILD_LUA:BOOL=OFF
+LIBUCI_CONF_OPTS += -DBUILD_LUA:BOOL=OFF
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libungif/libungif.mk b/package/libungif/libungif.mk
--- a/package/libungif/libungif.mk
+++ b/package/libungif/libungif.mk
@@ -8,7 +8,7 @@
 LIBUNGIF_SOURCE = libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE = http://downloads.sourceforge.net/project/giflib/libungif-4.x/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_INSTALL_STAGING = YES
-LIBUNGIF_CONF_OPT = --without-x
+LIBUNGIF_CONF_OPTS = --without-x
 LIBUNGIF_LICENSE = MIT
 LIBUNGIF_LICENSE_FILES = COPYING
 
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -14,17 +14,17 @@
 LIBUSB_INSTALL_STAGING = YES
 
 # Avoid the discovery of udev for the host variant
-HOST_LIBUSB_CONF_OPT = --disable-udev
+HOST_LIBUSB_CONF_OPTS = --disable-udev
 HOST_LIBUSB_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_avr32),y)
-LIBUSB_CONF_OPT += --disable-timerfd
+LIBUSB_CONF_OPTS += --disable-timerfd
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBUSB_DEPENDENCIES += udev
 else
-LIBUSB_CONF_OPT += --disable-udev
+LIBUSB_CONF_OPTS += --disable-udev
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -21,15 +21,15 @@
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBV4L_DEPENDENCIES += jpeg
-LIBV4L_CONF_OPT += --with-jpeg
+LIBV4L_CONF_OPTS += --with-jpeg
 else
-LIBV4L_CONF_OPT += --without-jpeg
+LIBV4L_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L_UTILS),y)
-LIBV4L_CONF_OPT += --enable-v4l-utils
+LIBV4L_CONF_OPTS += --enable-v4l-utils
 else
-LIBV4L_CONF_OPT += --disable-v4l-utils
+LIBV4L_CONF_OPTS += --disable-v4l-utils
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -14,16 +14,16 @@
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_INTEL_DRIVER_CONF_OPT += --enable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-x11
 else
-LIBVA_INTEL_DRIVER_CONF_OPT += --disable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_INTEL_DRIVER_CONF_OPT += --enable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-wayland
 else
-LIBVA_INTEL_DRIVER_CONF_OPT += --disable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-wayland
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -14,37 +14,37 @@
 LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
-LIBVA_CONF_OPT = \
+LIBVA_CONF_OPTS = \
 	--enable-drm \
 	--disable-dummy-driver \
 	--with-drivers-path="/usr/lib/va"
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 LIBVA_DEPENDENCIES += mesa3d
-LIBVA_CONF_OPT += --enable-glx
+LIBVA_CONF_OPTS += --enable-glx
 else
-LIBVA_CONF_OPT += --disable-glx
+LIBVA_CONF_OPTS += --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_CONF_OPT += --enable-x11
+LIBVA_CONF_OPTS += --enable-x11
 else
-LIBVA_CONF_OPT += --disable-x11
+LIBVA_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_CONF_OPT += --enable-wayland
+LIBVA_CONF_OPTS += --enable-wayland
 else
-LIBVA_CONF_OPT += --disable-wayland
+LIBVA_CONF_OPTS += --disable-wayland
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
 LIBVA_DEPENDENCIES += libegl
-LIBVA_CONF_OPT += --enable-egl
+LIBVA_CONF_OPTS += --enable-egl
 else
-LIBVA_CONF_OPT += --disable-egl
+LIBVA_CONF_OPTS += --disable-egl
 endif
 
 # Autoreconf requires an m4 directory to exist
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -13,46 +13,46 @@
 LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
 
 # only used for examples
-LIBVNCSERVER_CONF_OPT += --with-sdl-config=/bin/false
+LIBVNCSERVER_CONF_OPTS += --with-sdl-config=/bin/false
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBVNCSERVER_CONF_OPT += --without-pthread
+LIBVNCSERVER_CONF_OPTS += --without-pthread
 endif
 
 ifneq ($(BR2_INET_IPV6),y)
-LIBVNCSERVER_CONF_OPT += --without-ipv6
+LIBVNCSERVER_CONF_OPTS += --without-ipv6
 endif
 
 # openssl supports needs pthread
 ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 LIBVNCSERVER_DEPENDENCIES += openssl
 else
-LIBVNCSERVER_CONF_OPT += --without-crypto --without-ssl
+LIBVNCSERVER_CONF_OPTS += --without-crypto --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBVNCSERVER_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 LIBVNCSERVER_DEPENDENCIES += libgcrypt
 else
-LIBVNCSERVER_CONF_OPT += --without-gcrypt
+LIBVNCSERVER_CONF_OPTS += --without-gcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
 LIBVNCSERVER_DEPENDENCIES += gnutls host-pkgconf
 else
-LIBVNCSERVER_CONF_OPT += --without-gnutls
+LIBVNCSERVER_CONF_OPTS += --without-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LIBVNCSERVER_DEPENDENCIES += jpeg
 else
-LIBVNCSERVER_CONF_OPT += --without-jpeg
+LIBVNCSERVER_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBVNCSERVER_DEPENDENCIES += zlib
 else
-LIBVNCSERVER_CONF_OPT += --without-zlib
+LIBVNCSERVER_CONF_OPTS += --without-zlib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -8,7 +8,7 @@
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis
 LIBVORBIS_INSTALL_STAGING = YES
-LIBVORBIS_CONF_OPT = --disable-oggtest
+LIBVORBIS_CONF_OPTS = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3c
 LIBVORBIS_LICENSE_FILES = COPYING
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -18,7 +18,7 @@
 	LD="$(TARGET_CC)" \
 	CROSS=$(GNU_TARGET_NAME)
 
-LIBVPX_CONF_OPT = \
+LIBVPX_CONF_OPTS = \
 	--disable-examples \
 	--disable-docs \
 	--disable-unit-tests
@@ -34,7 +34,7 @@
 		--enable-pic \
 		--prefix=/usr \
 		$(SHARED_STATIC_LIBS_OPTS) \
-		$(LIBVPX_CONF_OPT) \
+		$(LIBVPX_CONF_OPTS) \
 	)
 endef
 
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -12,12 +12,12 @@
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 
-LIBWEBSOCKETS_CONF_OPT += -DWITHOUT_TESTAPPS=ON
+LIBWEBSOCKETS_CONF_OPTS += -DWITHOUT_TESTAPPS=ON
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl
 else
-LIBWEBSOCKETS_CONF_OPT += -DWITH_SSL=OFF
+LIBWEBSOCKETS_CONF_OPTS += -DWITH_SSL=OFF
 endif
 
 $(eval $(cmake-package))
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -16,25 +16,25 @@
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
-LIBXML2_CONF_OPT = --with-gnu-ld --without-python --without-debug --without-lzma
+LIBXML2_CONF_OPTS = --with-gnu-ld --without-python --without-debug --without-lzma
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 
-HOST_LIBXML2_CONF_OPT = --without-zlib --without-lzma --without-python
+HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma --without-python
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBXML2_DEPENDENCIES += zlib
-LIBXML2_CONF_OPT += --with-zlib
+LIBXML2_CONF_OPTS += --with-zlib
 else
-LIBXML2_CONF_OPT += --without-zlib
+LIBXML2_CONF_OPTS += --without-zlib
 endif
 
 LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
-LIBXML2_CONF_OPT += --with-iconv
+LIBXML2_CONF_OPTS += --with-iconv
 else
-LIBXML2_CONF_OPT += --without-iconv
+LIBXML2_CONF_OPTS += --without-iconv
 endif
 
 $(eval $(autotools-package))
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -14,7 +14,7 @@
 LIBXMLRPC_CONFIG_SCRIPTS = xmlrpc-c-config
 LIBXMLRPC_MAKE = $(MAKE1)
 
-LIBXMLRPC_CONF_OPT = \
+LIBXMLRPC_CONF_OPTS = \
 	$(if $(BR2_USE_WCHAR),,ac_cv_header_wchar_h=no) \
 	$(if $(BR2_INSTALL_LIBSTDCPP),,--disable-cplusplus) \
 	have_curl_config=$(STAGING_DIR)/usr/bin/curl-config \
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -10,7 +10,7 @@
 LIBXSLT_LICENSE = MIT
 LIBXSLT_LICENSE_FILES = COPYING
 
-LIBXSLT_CONF_OPT = --with-gnu-ld --without-debug \
+LIBXSLT_CONF_OPTS = --with-gnu-ld --without-debug \
 		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
@@ -20,10 +20,10 @@
 LIBXSLT_DEPENDENCIES += libgcrypt
 LIBXSLT_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
-LIBXSLT_CONF_OPT += --without-crypto
+LIBXSLT_CONF_OPTS += --without-crypto
 endif
 
-HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
+HOST_LIBXSLT_CONF_OPTS = --without-debug --without-python --without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -11,7 +11,7 @@
 LIGHTTPD_LICENSE = BSD-3c
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkgconf
-LIGHTTPD_CONF_OPT = \
+LIGHTTPD_CONF_OPTS = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
 	--localstatedir=/var \
@@ -19,45 +19,45 @@
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
-LIGHTTPD_CONF_OPT += --with-openssl
+LIGHTTPD_CONF_OPTS += --with-openssl
 else
-LIGHTTPD_CONF_OPT += --without-openssl
+LIGHTTPD_CONF_OPTS += --without-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
-LIGHTTPD_CONF_OPT += --with-zlib
+LIGHTTPD_CONF_OPTS += --with-zlib
 else
-LIGHTTPD_CONF_OPT += --without-zlib
+LIGHTTPD_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
-LIGHTTPD_CONF_OPT += --with-bzip2
+LIGHTTPD_CONF_OPTS += --with-bzip2
 else
-LIGHTTPD_CONF_OPT += --without-bzip2
+LIGHTTPD_CONF_OPTS += --without-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
 LIGHTTPD_CONF_ENV = PCRECONFIG=$(STAGING_DIR)/usr/bin/pcre-config
 LIGHTTPD_DEPENDENCIES += pcre
-LIGHTTPD_CONF_OPT += --with-pcre
+LIGHTTPD_CONF_OPTS += --with-pcre
 else
-LIGHTTPD_CONF_OPT += --without-pcre
+LIGHTTPD_CONF_OPTS += --without-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
 LIGHTTPD_DEPENDENCIES += libxml2 sqlite
-LIGHTTPD_CONF_OPT += --with-webdav-props --with-webdav-locks
+LIGHTTPD_CONF_OPTS += --with-webdav-props --with-webdav-locks
 else
-LIGHTTPD_CONF_OPT += --without-webdav-props --without-webdav-locks
+LIGHTTPD_CONF_OPTS += --without-webdav-props --without-webdav-locks
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
-LIGHTTPD_CONF_OPT += --with-lua
+LIGHTTPD_CONF_OPTS += --with-lua
 else
-LIGHTTPD_CONF_OPT += --without-lua
+LIGHTTPD_CONF_OPTS += --without-lua
 endif
 
 define LIGHTTPD_INSTALL_CONFIG
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -8,23 +8,23 @@
 LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-$(LINKNX_VERSION)
 LINKNX_LICENSE = GPLv2+
 LINKNX_INSTALL_STAGING = YES
-LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
+LINKNX_CONF_OPTS = --without-lua --without-log4cpp --without-pth-test \
 		  --with-pth=$(STAGING_DIR)/usr --disable-smtp
 
 LINKNX_DEPENDENCIES = libpthsem
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
+LINKNX_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
 LINKNX_DEPENDENCIES += mysql
 else
-LINKNX_CONF_OPT += --without-mysql
+LINKNX_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-LINKNX_CONF_OPT += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
+LINKNX_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr/bin/curl-config
 LINKNX_DEPENDENCIES += libcurl
 else
-LINKNX_CONF_OPT += --without-libcurl
+LINKNX_CONF_OPTS += --without-libcurl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/links/links.mk b/package/links/links.mk
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -11,20 +11,20 @@
 LINKS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
-LINKS_CONF_OPT += --enable-graphics
+LINKS_CONF_OPTS += --enable-graphics
 LINKS_DEPENDENCIES += libpng
 ifeq ($(BR2_PACKAGE_XLIB_LIBXT),y)
-LINKS_CONF_OPT += --with-x
+LINKS_CONF_OPTS += --with-x
 LINKS_DEPENDENCIES += xlib_libXt
 else
-LINKS_CONF_OPT += --without-x
+LINKS_CONF_OPTS += --without-x
 endif
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 LINKS_CONF_ENV = ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
-LINKS_CONF_OPT += --with-directfb
+LINKS_CONF_OPTS += --with-directfb
 LINKS_DEPENDENCIES += directfb
 else
-LINKS_CONF_OPT += --without-directfb
+LINKS_CONF_OPTS += --without-directfb
 endif
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LINKS_DEPENDENCIES += jpeg
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -7,7 +7,7 @@
 LINPHONE_VERSION_MAJOR = 3.6
 LINPHONE_VERSION = $(LINPHONE_VERSION_MAJOR).1
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/$(LINPHONE_VERSION_MAJOR).x/sources
-LINPHONE_CONF_OPT = \
+LINPHONE_CONF_OPTS = \
 	--enable-external-ortp \
 	--enable-external-mediastreamer \
 	--disable-strict
@@ -23,10 +23,10 @@
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
-LINPHONE_CONF_OPT += --enable-gtk_ui
+LINPHONE_CONF_OPTS += --enable-gtk_ui
 LINPHONE_DEPENDENCIES += libgtk2
 else
-LINPHONE_CONF_OPT += --disable-gtk_ui
+LINPHONE_CONF_OPTS += --disable-gtk_ui
 endif
 
 $(eval $(autotools-package))
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -8,7 +8,7 @@
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
-LINUX_PAM_CONF_OPT = \
+LINUX_PAM_CONF_OPTS = \
 	--disable-prelude \
 	--disable-isadir \
 	--disable-nis \
diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
--- a/package/linux-zigbee/linux-zigbee.mk
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -13,18 +13,18 @@
 # We patch configure.ac/Makefile.am
 LINUX_ZIGBEE_AUTORECONF = YES
 
-LINUX_ZIGBEE_CONF_OPT = \
+LINUX_ZIGBEE_CONF_OPTS = \
 	--disable-manpages \
 	--with-leasefile="$(call qstrip,$(BR2_PACKAGE_LINUX_ZIGBEE_LEASEFILE))"
 
 ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_TESTS),y)
-LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir='/usr/sbin/'
+LINUX_ZIGBEE_CONF_OPTS += --with-zbtestdir='/usr/sbin/'
 else
-LINUX_ZIGBEE_CONF_OPT += --with-zbtestdir=''
+LINUX_ZIGBEE_CONF_OPTS += --with-zbtestdir=''
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_ZIGBEE_OLD_KERNEL_COMPAT),y)
-LINUX_ZIGBEE_CONF_OPT += --enable-kernel-compat
+LINUX_ZIGBEE_CONF_OPTS += --enable-kernel-compat
 endif
 
 $(eval $(autotools-package))
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -8,7 +8,7 @@
 LOCALEDEF_SOURCE  = localedef-eglibc-$(LOCALEDEF_VERSION).tar.bz2
 LOCALEDEF_SITE    = http://www.pengutronix.de/software/ptxdist/temporary-src
 
-HOST_LOCALEDEF_CONF_OPT += \
+HOST_LOCALEDEF_CONF_OPTS += \
 	--prefix=/usr \
 	--with-glibc=./eglibc
 
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -11,7 +11,7 @@
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
 
-LOG4CXX_CONF_OPT = \
+LOG4CXX_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
 	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config
 
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -6,7 +6,7 @@
 
 LRZSZ_VERSION = 0.12.20
 LRZSZ_SITE = http://www.ohse.de/uwe/releases
-LRZSZ_CONF_OPT = --disable-timesync
+LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPLv2+
 LRZSZ_LICENSE_FILES = COPYING
 
diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -7,7 +7,7 @@
 LTRACE_VERSION = 0896ce554f80afdcba81d9754f6104f863dea803
 LTRACE_SITE = git://anonscm.debian.org/collab-maint/ltrace.git
 LTRACE_DEPENDENCIES = elfutils
-LTRACE_CONF_OPT = --disable-werror
+LTRACE_CONF_OPTS = --disable-werror
 LTRACE_LICENSE = GPLv2
 LTRACE_LICENSE_FILES = COPYING
 LTRACE_AUTORECONF = YES
@@ -21,10 +21,10 @@
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
-LTRACE_CONF_OPT += --with-libunwind=yes
+LTRACE_CONF_OPTS += --with-libunwind=yes
 LTRACE_DEPENDENCIES += libunwind
 else
-LTRACE_CONF_OPT += --with-libunwind=no
+LTRACE_CONF_OPTS += --with-libunwind=no
 endif
 endif
 
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
--- a/package/ltris/ltris.mk
+++ b/package/ltris/ltris.mk
@@ -16,9 +16,9 @@
 
 ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
 LTRIS_DEPENDENCIES += sdl_mixer
-LTRIS_CONF_OPT += --enable-audio=yes
+LTRIS_CONF_OPTS += --enable-audio=yes
 else
-LTRIS_CONF_OPT += --disable-audio
+LTRIS_CONF_OPTS += --disable-audio
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -9,7 +9,7 @@
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+; LGPLv2.1+ for include/lttng/* and src/lib/lttng-ctl/*
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
-LTTNG_TOOLS_CONF_OPT += --with-xml-prefix=$(STAGING_DIR)/usr
+LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
 
 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
@@ -20,10 +20,10 @@
 LTTNG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
-LTTNG_TOOLS_CONF_OPT += --enable-lttng-ust
+LTTNG_TOOLS_CONF_OPTS += --enable-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
 else
-LTTNG_TOOLS_CONF_OPT += --disable-lttng-ust
+LTTNG_TOOLS_CONF_OPTS += --disable-lttng-ust
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -9,6 +9,6 @@
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
-LUA_EV_CONF_OPT = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
+LUA_EV_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)"
 
 $(eval $(cmake-package))
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -10,7 +10,7 @@
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
-LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
+LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
     LUAPOSIX_DEPENDENCIES += ncurses
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -14,17 +14,17 @@
 LUAROCKS_CONFIG_DIR  = $(HOST_DIR)/usr/etc/luarocks
 LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/config-$(LUAINTERPRETER_ABIVER).lua
 
-HOST_LUAROCKS_CONF_OPT = \
+HOST_LUAROCKS_CONF_OPTS = \
 	--prefix=$(HOST_DIR)/usr \
 	--sysconfdir=$(LUAROCKS_CONFIG_DIR) \
 	--with-lua=$(HOST_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
-HOST_LUAROCKS_CONF_OPT += --lua-suffix=jit
+HOST_LUAROCKS_CONF_OPTS += --lua-suffix=jit
 endif
 
 define HOST_LUAROCKS_CONFIGURE_CMDS
-	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPT)
+	cd $(@D) && ./configure $(HOST_LUAROCKS_CONF_OPTS)
 endef
 
 define HOST_LUAROCKS_INSTALL_CMDS
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -13,7 +13,7 @@
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
-LVM2_CONF_OPT += \
+LVM2_CONF_OPTS += \
 	--enable-write_install \
 	--enable-pkgconfig \
 	--enable-cmdlib \
@@ -28,7 +28,7 @@
 else
 # v2.02.44: disable readline usage, or binaries are linked against provider
 # of "tgetent" (=> ncurses) even if it's not used..
-LVM2_CONF_OPT += --disable-readline
+LVM2_CONF_OPTS += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),)
@@ -38,9 +38,9 @@
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
-LVM2_CONF_OPT += --enable-applib
+LVM2_CONF_OPTS += --enable-applib
 else
-LVM2_CONF_OPT += --disable-applib
+LVM2_CONF_OPTS += --disable-applib
 endif
 
 $(eval $(autotools-package))
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -11,7 +11,7 @@
 LXC_DEPENDENCIES = libcap host-pkgconf
 # configure not shipped
 LXC_AUTORECONF = YES
-LXC_CONF_OPT = --disable-apparmor --with-distro=buildroot \
+LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-lua --disable-python \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -7,7 +7,7 @@
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
 LZMA_SITE = http://tukaani.org/lzma
-LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
+LZMA_CONF_OPTS = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 $(eval $(host-autotools-package))
 
diff --git a/package/m4/m4.mk b/package/m4/m4.mk
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -15,7 +15,7 @@
 M4_CONF_ENV += gt_cv_c_wchar_t=no gl_cv_absolute_wchar_h=__fpending.h
 endif
 
-HOST_M4_CONF_OPT = --disable-static
+HOST_M4_CONF_OPTS = --disable-static
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -14,7 +14,7 @@
 # Check if ALSA is built, then we should configure after alsa-lib so
 # ./configure can find alsa-lib.
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
-MADPLAY_CONF_OPT += --with-alsa
+MADPLAY_CONF_OPTS += --with-alsa
 MADPLAY_DEPENDENCIES += alsa-lib
 endif
 
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -13,7 +13,7 @@
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
 ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
-	MATCHBOX_COMMON_CONF_OPT += --enable-pda-folders
+	MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
--- a/package/matchbox/matchbox-desktop/matchbox-desktop.mk
+++ b/package/matchbox/matchbox-desktop/matchbox-desktop.mk
@@ -11,7 +11,7 @@
 MATCHBOX_DESKTOP_LICENSE = GPLv2+
 MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
 MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
-MATCHBOX_DESKTOP_CONF_OPT = --enable-expat
+MATCHBOX_DESKTOP_CONF_OPTS = --enable-expat
 
 # The bundled configure script does not properly replace LIBADD_DL, so
 # we force an autoreconf even if we don't have any patches touching
@@ -21,10 +21,10 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_DESKTOP_CONF_OPT += --enable-startup-notification
+  MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
   MATCHBOX_DESKTOP_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_DESKTOP_CONF_OPT += --disable-startup-notification
+  MATCHBOX_DESKTOP_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
--- a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
+++ b/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
@@ -11,7 +11,7 @@
 MATCHBOX_FAKEKEY_LICENSE_FILES = COPYING
 MATCHBOX_FAKEKEY_INSTALL_STAGING = YES
 MATCHBOX_FAKEKEY_DEPENDENCIES = matchbox-lib xlib_libXtst
-MATCHBOX_FAKEKEY_CONF_OPT = --enable-expat
+MATCHBOX_FAKEKEY_CONF_OPTS = --enable-expat
 
 define MATCHBOX_FAKEKEY_POST_CONFIGURE_FIXES
  $(SED) 's:-I[^$$].*/usr/include/freetype2:-I/usr/include/freetype2:' $(STAGING_DIR)/usr/lib/pkgconfig/libmb.pc
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
@@ -23,7 +23,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
-  MATCHBOX_KEYBOARD_CONF_OPT += --enable-cairo
+  MATCHBOX_KEYBOARD_CONF_OPTS += --enable-cairo
   MATCHBOX_KEYBOARD_DEPENDENCIES += cairo
 else
   MATCHBOX_KEYBOARD_DEPENDENCIES += xlib_libXft
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox/matchbox-lib/matchbox-lib.mk
--- a/package/matchbox/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox/matchbox-lib/matchbox-lib.mk
@@ -11,7 +11,7 @@
 MATCHBOX_LIB_LICENSE_FILES = COPYING
 MATCHBOX_LIB_INSTALL_STAGING = YES
 MATCHBOX_LIB_DEPENDENCIES = host-pkgconf expat xlib_libXext
-MATCHBOX_LIB_CONF_OPT = --enable-expat --disable-doxygen-docs
+MATCHBOX_LIB_CONF_OPTS = --enable-expat --disable-doxygen-docs
 MATCHBOX_LIB_CONF_ENV = LIBS="-lX11"
 
 define MATCHBOX_LIB_POST_INSTALL_FIXES
@@ -29,31 +29,31 @@
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-  MATCHBOX_LIB_CONF_OPT += --enable-jpeg
+  MATCHBOX_LIB_CONF_OPTS += --enable-jpeg
   MATCHBOX_LIB_DEPENDENCIES += jpeg
 else
-  MATCHBOX_LIB_CONF_OPT += --disable-jpeg
+  MATCHBOX_LIB_CONF_OPTS += --disable-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-  MATCHBOX_LIB_CONF_OPT += --enable-png
+  MATCHBOX_LIB_CONF_OPTS += --enable-png
   MATCHBOX_LIB_DEPENDENCIES += libpng
 else
-  MATCHBOX_LIB_CONF_OPT += --disable-png
+  MATCHBOX_LIB_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_PANGO)$(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yyy)
-  MATCHBOX_LIB_CONF_OPT += --enable-pango
+  MATCHBOX_LIB_CONF_OPTS += --enable-pango
   MATCHBOX_LIB_DEPENDENCIES += pango
 else
-  MATCHBOX_LIB_CONF_OPT += --disable-pango
+  MATCHBOX_LIB_CONF_OPTS += --disable-pango
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-  MATCHBOX_LIB_CONF_OPT += --enable-xft
+  MATCHBOX_LIB_CONF_OPTS += --enable-xft
   MATCHBOX_LIB_DEPENDENCIES += xlib_libXft
 else
-  MATCHBOX_LIB_CONF_OPT += --disable-xft
+  MATCHBOX_LIB_CONF_OPTS += --disable-xft
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -11,15 +11,15 @@
 MATCHBOX_PANEL_LICENSE = GPLv2+
 MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
-MATCHBOX_PANEL_CONF_OPT = --enable-expat
+MATCHBOX_PANEL_CONF_OPTS = --enable-expat
 
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_PANEL_CONF_OPT += --enable-startup-notification
+  MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
   MATCHBOX_PANEL_DEPENDENCIES += startup-notification matchbox-startup-monitor
 else
-  MATCHBOX_PANEL_CONF_OPT += --disable-startup-notification
+  MATCHBOX_PANEL_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
--- a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
+++ b/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
@@ -10,7 +10,7 @@
 MATCHBOX_STARTUP_MONITOR_LICENSE = GPLv2+
 MATCHBOX_STARTUP_MONITOR_LICENSE_FILES = COPYING
 MATCHBOX_STARTUP_MONITOR_DEPENDENCIES = matchbox-lib startup-notification
-MATCHBOX_STARTUP_MONITOR_CONF_OPT =
+MATCHBOX_STARTUP_MONITOR_CONF_OPTS =
 
 ################################################################################
 
diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -11,7 +11,7 @@
 MATCHBOX_WM_LICENSE_FILES = COPYING
 
 MATCHBOX_WM_DEPENDENCIES = matchbox-lib
-MATCHBOX_WM_CONF_OPT = --enable-expat
+MATCHBOX_WM_CONF_OPTS = --enable-expat
 
 # Workaround bug in configure script
 MATCHBOX_WM_CONF_ENV = expat=yes
@@ -20,7 +20,7 @@
 
 ifeq ($(BR2_PACKAGE_X11R7_LIBXCOMPOSITE),y)
 ifeq ($(BR2_PACKAGE_X11R7_LIBXPM),y)
-  MATCHBOX_WM_CONF_OPT += --enable-composite
+  MATCHBOX_WM_CONF_OPTS += --enable-composite
   MATCHBOX_WM_DEPENDENCIES += xlib_libXcomposite
   MATCHBOX_WM_DEPENDENCIES += xlib_libXpm
 endif
@@ -34,10 +34,10 @@
 endif
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-  MATCHBOX_WM_CONF_OPT += --enable-startup-notification
+  MATCHBOX_WM_CONF_OPTS += --enable-startup-notification
   MATCHBOX_WM_DEPENDENCIES += startup-notification
 else
-  MATCHBOX_WM_CONF_OPT += --disable-startup-notification
+  MATCHBOX_WM_CONF_OPTS += --disable-startup-notification
 endif
 
 ################################################################################
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
--- a/package/mcrypt/mcrypt.mk
+++ b/package/mcrypt/mcrypt.mk
@@ -10,7 +10,7 @@
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-MCRYPT_CONF_OPT = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
+MCRYPT_CONF_OPTS = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
 MCRYPT_LICENSE = GPLv3
 MCRYPT_LICENSE_FILES = COPYING
 
diff --git a/package/media-ctl/media-ctl.mk b/package/media-ctl/media-ctl.mk
--- a/package/media-ctl/media-ctl.mk
+++ b/package/media-ctl/media-ctl.mk
@@ -11,7 +11,7 @@
 MEDIA_CTL_LICENSE_FILES = COPYING.LIB
 
 MEDIA_CTL_AUTORECONF = YES
-MEDIA_CTL_CONF_OPT = --with-kernel-headers=$(STAGING_DIR)/usr/include
+MEDIA_CTL_CONF_OPTS = --with-kernel-headers=$(STAGING_DIR)/usr/include
 MEDIA_CTL_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -9,80 +9,80 @@
 MEDIASTREAMER_INSTALL_STAGING = YES
 MEDIASTREAMER_DEPENDENCIES = host-intltool host-pkgconf ortp host-gettext
 # tests fail linking on some architectures, so disable them
-MEDIASTREAMER_CONF_OPT = --disable-tests --disable-glx --disable-strict
+MEDIASTREAMER_CONF_OPTS = --disable-tests --disable-glx --disable-strict
 MEDIASTREAMER_LICENSE = GPLv2+
 MEDIASTREAMER_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
-MEDIASTREAMER_CONF_OPT += --enable-alsa
+MEDIASTREAMER_CONF_OPTS += --enable-alsa
 MEDIASTREAMER_DEPENDENCIES += alsa-lib
 else
-MEDIASTREAMER_CONF_OPT += --disable-alsa
+MEDIASTREAMER_CONF_OPTS += --disable-alsa
 endif
 
 # portaudio backend needs speex as well
 ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX),yy)
-MEDIASTREAMER_CONF_OPT += --enable-portaudio
+MEDIASTREAMER_CONF_OPTS += --enable-portaudio
 MEDIASTREAMER_DEPENDENCIES += portaudio speex
 else
-MEDIASTREAMER_CONF_OPT += --disable-portaudio
+MEDIASTREAMER_CONF_OPTS += --disable-portaudio
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
-MEDIASTREAMER_CONF_OPT += --enable-pulseaudio
+MEDIASTREAMER_CONF_OPTS += --enable-pulseaudio
 MEDIASTREAMER_DEPENDENCIES += pulseaudio
 else
-MEDIASTREAMER_CONF_OPT += --disable-pulseaudio
+MEDIASTREAMER_CONF_OPTS += --disable-pulseaudio
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-MEDIASTREAMER_CONF_OPT += --enable-speex
+MEDIASTREAMER_CONF_OPTS += --enable-speex
 MEDIASTREAMER_DEPENDENCIES += speex
 else
-MEDIASTREAMER_CONF_OPT += --disable-speex
+MEDIASTREAMER_CONF_OPTS += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
-MEDIASTREAMER_CONF_OPT += --enable-ffmpeg
+MEDIASTREAMER_CONF_OPTS += --enable-ffmpeg
 MEDIASTREAMER_DEPENDENCIES += ffmpeg
 else
-MEDIASTREAMER_CONF_OPT += --disable-ffmpeg
+MEDIASTREAMER_CONF_OPTS += --disable-ffmpeg
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
-MEDIASTREAMER_CONF_OPT += --enable-sdl
+MEDIASTREAMER_CONF_OPTS += --enable-sdl
 MEDIASTREAMER_DEPENDENCIES += sdl
 else
-MEDIASTREAMER_CONF_OPT += --disable-sdl
+MEDIASTREAMER_CONF_OPTS += --disable-sdl
 endif
 
 # mediastreamer assumes SDL has X11 support if --enable-x11 (and X11 support
 # is only used for SDL output)
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
-MEDIASTREAMER_CONF_OPT += --enable-x11
+MEDIASTREAMER_CONF_OPTS += --enable-x11
 else
-MEDIASTREAMER_CONF_OPT += --disable-x11
+MEDIASTREAMER_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
-MEDIASTREAMER_CONF_OPT += --enable-xv
+MEDIASTREAMER_CONF_OPTS += --enable-xv
 MEDIASTREAMER_DEPENDENCIES += xlib_libXv
 else
-MEDIASTREAMER_CONF_OPT += --disable-xv
+MEDIASTREAMER_CONF_OPTS += --disable-xv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-MEDIASTREAMER_CONF_OPT += --enable-theora
+MEDIASTREAMER_CONF_OPTS += --enable-theora
 MEDIASTREAMER_DEPENDENCIES += libtheora
 else
-MEDIASTREAMER_CONF_OPT += --disable-theora
+MEDIASTREAMER_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-MEDIASTREAMER_CONF_OPT += --enable-libv4l1 --enable-libv4l2
+MEDIASTREAMER_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
 MEDIASTREAMER_DEPENDENCIES += libv4l
 else
-MEDIASTREAMER_CONF_OPT += --disable-libv4l1 --disable-libv4l2
+MEDIASTREAMER_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -8,7 +8,7 @@
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-MEMCACHED_CONF_OPT = --disable-coverage --disable-docs
+MEMCACHED_CONF_OPTS = --disable-coverage --disable-docs
 MEMCACHED_LICENSE = BSD-3c
 MEMCACHED_LICENSE_FILES = COPYING
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -34,22 +34,22 @@
 	xlib_libXdamage \
 	xlib_libXfixes \
 	libxcb
-MESA3D_CONF_OPT += --enable-glx
+MESA3D_CONF_OPTS += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
 ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA),)
-MESA3D_CONF_OPT += --enable-xa
+MESA3D_CONF_OPTS += --enable-xa
 else
-MESA3D_CONF_OPT += --disable-xa
+MESA3D_CONF_OPTS += --disable-xa
 endif
 else
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--disable-glx \
 	--disable-xa
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 # fix for "configure: error: Cannot use static libraries for DRI drivers"
-MESA3D_CONF_OPT += --disable-static
+MESA3D_CONF_OPTS += --disable-static
 endif
 
 # Drivers
@@ -65,29 +65,29 @@
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
 ifeq ($(MESA3D_GALLIUM_DRIVERS-y),)
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--without-gallium-drivers
 else
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--enable-shared-glapi \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--without-dri-drivers
 else
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto xproto_presentproto
-MESA3D_CONF_OPT += --enable-dri3
+MESA3D_CONF_OPTS += --enable-dri3
 else
-MESA3D_CONF_OPT += --disable-dri3
+MESA3D_CONF_OPTS += --disable-dri3
 endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 MESA3D_DEPENDENCIES += xlib_libXxf86vm
 endif
 MESA3D_PROVIDES += libgl
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--enable-dri \
 	--enable-shared-glapi \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
@@ -98,7 +98,7 @@
 # Always enable OpenGL:
 #   - it is needed for GLES (mesa3d's ./configure is a bit weird)
 #   - but if no DRI driver is enabled, then libgl is not built
-MESA3D_CONF_OPT += --enable-opengl
+MESA3D_CONF_OPTS += --enable-opengl
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
@@ -112,20 +112,20 @@
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_EGL_PLATFORMS += x11
 endif
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--enable-gbm \
 	--enable-egl \
 	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
 else
-MESA3D_CONF_OPT += \
+MESA3D_CONF_OPTS += \
 	--disable-egl
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
 MESA3D_PROVIDES += libgles
-MESA3D_CONF_OPT += --enable-gles1 --enable-gles2
+MESA3D_CONF_OPTS += --enable-gles1 --enable-gles2
 else
-MESA3D_CONF_OPT += --disable-gles1 --disable-gles2
+MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -12,7 +12,7 @@
 METACITY_LICENSE = GPLv2+
 METACITY_LICENSE_FILES = COPYING
 
-METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+METACITY_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest --disable-gconf \
 		--disable-sm --disable-startup-notification
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -20,7 +20,7 @@
 MINIDLNA_CONF_ENV = \
 	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
 else
-MINIDLNA_CONF_OPT = \
+MINIDLNA_CONF_OPTS = \
 	--disable-static
 endif
 
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -14,16 +14,16 @@
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 	MODEM_MANAGER_DEPENDENCIES += libqmi
-	MODEM_MANAGER_CONF_OPT += --with-qmi
+	MODEM_MANAGER_CONF_OPTS += --with-qmi
 else
-	MODEM_MANAGER_CONF_OPT += --without-qmi
+	MODEM_MANAGER_CONF_OPTS += --without-qmi
 endif
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
 	MODEM_MANAGER_DEPENDENCIES += libmbim
-	MODEM_MANAGER_CONF_OPT += --with-mbim
+	MODEM_MANAGER_CONF_OPTS += --with-mbim
 else
-	MODEM_MANAGER_CONF_OPT += --without-mbim
+	MODEM_MANAGER_CONF_OPTS += --without-mbim
 endif
 
 $(eval $(autotools-package))
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -22,20 +22,20 @@
 	libmonit_cv_setjmp_available=yes \
 	libmonit_cv_vsnprintf_c99_conformant=yes
 
-MONIT_CONF_OPT += \
+MONIT_CONF_OPTS += \
 	--without-pam
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MONIT_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr
+MONIT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 MONIT_DEPENDENCIES += openssl
 else
-MONIT_CONF_OPT += --without-ssl
+MONIT_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_LARGEFILE),y)
-MONIT_CONF_OPT += --with-largefiles
+MONIT_CONF_OPTS += --with-largefiles
 else
-MONIT_CONF_OPT += --without-largefiles
+MONIT_CONF_OPTS += --without-largefiles
 endif
 
 $(eval $(autotools-package))
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -16,163 +16,163 @@
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 MPD_DEPENDENCIES += avahi
 else
-MPD_CONF_OPT += --with-zeroconf=no
+MPD_CONF_OPTS += --with-zeroconf=no
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
 MPD_DEPENDENCIES += alsa-lib
-MPD_CONF_OPT += --enable-alsa
+MPD_CONF_OPTS += --enable-alsa
 else
-MPD_CONF_OPT += --disable-alsa
+MPD_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_AO),y)
 MPD_DEPENDENCIES += libao
-MPD_CONF_OPT += --enable-ao
+MPD_CONF_OPTS += --enable-ao
 else
-MPD_CONF_OPT += --disable-ao
+MPD_CONF_OPTS += --disable-ao
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_AUDIOFILE),y)
 MPD_DEPENDENCIES += audiofile
-MPD_CONF_OPT += --enable-audiofile
+MPD_CONF_OPTS += --enable-audiofile
 else
-MPD_CONF_OPT += --disable-audiofile
+MPD_CONF_OPTS += --disable-audiofile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_PULSEAUDIO),y)
 MPD_DEPENDENCIES += pulseaudio
-MPD_CONF_OPT += --enable-pulse
+MPD_CONF_OPTS += --enable-pulse
 else
-MPD_CONF_OPT += --disable-pulse
+MPD_CONF_OPTS += --disable-pulse
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
 MPD_DEPENDENCIES += bzip2
-MPD_CONF_OPT += --enable-bzip2
+MPD_CONF_OPTS += --enable-bzip2
 else
-MPD_CONF_OPT += --disable-bzip2
+MPD_CONF_OPTS += --disable-bzip2
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FAAD2),y)
 MPD_DEPENDENCIES += faad2
-MPD_CONF_OPT += --enable-aac
+MPD_CONF_OPTS += --enable-aac
 else
-MPD_CONF_OPT += --disable-aac
+MPD_CONF_OPTS += --disable-aac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FLAC),y)
 MPD_DEPENDENCIES += flac
-MPD_CONF_OPT += --enable-flac
+MPD_CONF_OPTS += --enable-flac
 else
-MPD_CONF_OPT += --disable-flac
+MPD_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
 MPD_DEPENDENCIES += libcurl
-MPD_CONF_OPT += --enable-curl
+MPD_CONF_OPTS += --enable-curl
 else
-MPD_CONF_OPT += --disable-curl
+MPD_CONF_OPTS += --disable-curl
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LAME),y)
 MPD_DEPENDENCIES += lame
-MPD_CONF_OPT += --enable-lame-encoder
+MPD_CONF_OPTS += --enable-lame-encoder
 else
-MPD_CONF_OPT += --disable-lame-encoder
+MPD_CONF_OPTS += --disable-lame-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSAMPLERATE),y)
 MPD_DEPENDENCIES += libsamplerate
-MPD_CONF_OPT += --enable-lsr
+MPD_CONF_OPTS += --enable-lsr
 else
-MPD_CONF_OPT += --disable-lsr
+MPD_CONF_OPTS += --disable-lsr
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_LIBSNDFILE),y)
 MPD_DEPENDENCIES += libsndfile
-MPD_CONF_OPT += --enable-sndfile
+MPD_CONF_OPTS += --enable-sndfile
 else
-MPD_CONF_OPT += --disable-sndfile
+MPD_CONF_OPTS += --disable-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
 MPD_DEPENDENCIES += opus libogg
-MPD_CONF_OPT += --enable-opus
+MPD_CONF_OPTS += --enable-opus
 else
-MPD_CONF_OPT += --disable-opus
+MPD_CONF_OPTS += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
-MPD_CONF_OPT += --enable-vorbis --enable-vorbis-encoder
+MPD_CONF_OPTS += --enable-vorbis --enable-vorbis-encoder
 else
-MPD_CONF_OPT += --disable-vorbis --disable-vorbis-encoder
+MPD_CONF_OPTS += --disable-vorbis --disable-vorbis-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MAD),y)
 MPD_DEPENDENCIES += libid3tag libmad
-MPD_CONF_OPT += --enable-mad
+MPD_CONF_OPTS += --enable-mad
 else
-MPD_CONF_OPT += --disable-mad
+MPD_CONF_OPTS += --disable-mad
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MPG123),y)
 MPD_DEPENDENCIES += libid3tag mpg123
-MPD_CONF_OPT += --enable-mpg123
+MPD_CONF_OPTS += --enable-mpg123
 else
-MPD_CONF_OPT += --disable-mpg123
+MPD_CONF_OPTS += --disable-mpg123
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_MUSEPACK),y)
 MPD_DEPENDENCIES += musepack
-MPD_CONF_OPT += --enable-mpc
+MPD_CONF_OPTS += --enable-mpc
 else
-MPD_CONF_OPT += --disable-mpc
+MPD_CONF_OPTS += --disable-mpc
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
 MPD_DEPENDENCIES += yajl
-MPD_CONF_OPT += --enable-soundcloud
+MPD_CONF_OPTS += --enable-soundcloud
 else
-MPD_CONF_OPT += --disable-soundcloud
+MPD_CONF_OPTS += --disable-soundcloud
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
-MPD_CONF_OPT += --enable-sqlite
+MPD_CONF_OPTS += --enable-sqlite
 else
-MPD_CONF_OPT += --disable-sqlite
+MPD_CONF_OPTS += --disable-sqlite
 endif
 
 ifneq ($(BR2_PACKAGE_MPD_TCP),y)
-MPD_CONF_OPT += --disable-tcp
+MPD_CONF_OPTS += --disable-tcp
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
 MPD_DEPENDENCIES += tremor
-MPD_CONF_OPT += --with-tremor
+MPD_CONF_OPTS += --with-tremor
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
 MPD_DEPENDENCIES += twolame
-MPD_CONF_OPT += --enable-twolame-encoder
+MPD_CONF_OPTS += --enable-twolame-encoder
 else
-MPD_CONF_OPT += --disable-twolame-encoder
+MPD_CONF_OPTS += --disable-twolame-encoder
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
 MPD_DEPENDENCIES += wavpack
-MPD_CONF_OPT += --enable-wavpack
+MPD_CONF_OPTS += --enable-wavpack
 else
-MPD_CONF_OPT += --disable-wavpack
+MPD_CONF_OPTS += --disable-wavpack
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_FFMPEG),y)
 MPD_DEPENDENCIES += ffmpeg
-MPD_CONF_OPT += --enable-ffmpeg
+MPD_CONF_OPTS += --enable-ffmpeg
 else
-MPD_CONF_OPT += --disable-ffmpeg
+MPD_CONF_OPTS += --disable-ffmpeg
 endif
 
 define MPD_INSTALL_EXTRA_FILES
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -9,7 +9,7 @@
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2c
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
-MPDECIMAL_CONF_OPT = LD="$(TARGET_CC)"
+MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
 
 # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
 # available in musl/glibc. So in this case, we tell mpdecimal to use
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -7,7 +7,7 @@
 MPG123_VERSION = 1.20.1
 MPG123_SOURCE = mpg123-$(MPG123_VERSION).tar.bz2
 MPG123_SITE = http://downloads.sourceforge.net/project/mpg123/mpg123/$(MPG123_VERSION)
-MPG123_CONF_OPT = --disable-lfs-alias
+MPG123_CONF_OPTS = --disable-lfs-alias
 MPG123_INSTALL_STAGING = YES
 MPG123_LICENSE = LGPLv2.1
 MPG123_LICENSE_FILES = COPYING
@@ -43,34 +43,34 @@
 MPG123_CPU = x86-64
 endif
 
-MPG123_CONF_OPT += --with-cpu=$(MPG123_CPU)
+MPG123_CONF_OPTS += --with-cpu=$(MPG123_CPU)
 
 MPG123_AUDIO = dummy oss
 
 ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
 MPG123_AUDIO += portaudio
-MPG123_CONF_OPT += --with-default-audio=portaudio
+MPG123_CONF_OPTS += --with-default-audio=portaudio
 MPG123_DEPENDENCIES += portaudio
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
 MPG123_AUDIO += sdl
-MPG123_CONF_OPT += --with-default-audio=sdl
+MPG123_CONF_OPTS += --with-default-audio=sdl
 MPG123_DEPENDENCIES += sdl
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 MPG123_AUDIO += alsa
-MPG123_CONF_OPT += --with-default-audio=alsa
+MPG123_CONF_OPTS += --with-default-audio=alsa
 MPG123_DEPENDENCIES += alsa-lib
 endif
 
-MPG123_CONF_OPT += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
+MPG123_CONF_OPTS += --with-audio=$(shell echo $(MPG123_AUDIO) | tr ' ' ,)
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 MPG123_DEPENDENCIES += libtool
 # .la files gets stripped , so directly load .so files rather than .la
-MPG123_CONF_OPT += --with-modules --with-module-suffix=.so
+MPG123_CONF_OPTS += --with-modules --with-module-suffix=.so
 endif
 
 $(eval $(autotools-package))
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -13,20 +13,20 @@
 MSMTP_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MSMTP_CONF_OPT += --with-ssl=openssl
+MSMTP_CONF_OPTS += --with-ssl=openssl
 MSMTP_DEPENDENCIES += openssl
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 # openssl uses zlib, so we need to explicitly link with it when static
 MSMTP_CONF_ENV += LIBS=-lz
 endif
 else ifeq ($(BR2_PACKAGE_GNUTLS),y)
-MSMTP_CONF_OPT += --with-ssl=gnutls
+MSMTP_CONF_OPTS += --with-ssl=gnutls
 MSMTP_DEPENDENCIES += gnutls
 else
-MSMTP_CONF_OPT += --with-ssl=no
+MSMTP_CONF_OPTS += --with-ssl=no
 endif
 
-MSMTP_CONF_OPT += \
+MSMTP_CONF_OPTS += \
 	--without-libidn \
 	--without-libgsasl \
 	--without-gnome-keyring
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -10,7 +10,7 @@
 MTOOLS_LICENSE = GPLv3+
 MTOOLS_LICENSE_FILES = COPYING
 MTOOLS_CONF_ENV = ac_cv_func_setpgrp_void=yes
-MTOOLS_CONF_OPT = --without-x
+MTOOLS_CONF_OPTS = --without-x
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -6,7 +6,7 @@
 
 MTR_VERSION = 0.85
 MTR_SITE = ftp://ftp.bitwizard.nl/mtr
-MTR_CONF_OPT = --without-gtk --without-glib
+MTR_CONF_OPTS = --without-gtk --without-glib
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPLv2
 MTR_LICENSE_FILES = COPYING
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -9,36 +9,36 @@
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
-MUTT_CONF_OPT = --disable-smtp
+MUTT_CONF_OPTS = --disable-smtp
 MUTT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
-MUTT_CONF_OPT += --enable-iconv
+MUTT_CONF_OPTS += --enable-iconv
 endif
 
 ifeq ($(BR2_PACKAGE_MUTT_IMAP),y)
-MUTT_CONF_OPT += --enable-imap
+MUTT_CONF_OPTS += --enable-imap
 else
-MUTT_CONF_OPT += --disable-imap
+MUTT_CONF_OPTS += --disable-imap
 endif
 
 ifeq ($(BR2_PACKAGE_MUTT_POP3),y)
-MUTT_CONF_OPT += --enable-pop
+MUTT_CONF_OPTS += --enable-pop
 else
-MUTT_CONF_OPT += --disable-pop
+MUTT_CONF_OPTS += --disable-pop
 endif
 
 # SSL support is only used by imap or pop3 module
 ifneq ($(BR2_PACKAGET_MUTT_IMAP)$(BR2_PACKAGE_MUTT_POP3),)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 MUTT_DEPENDENCIES += openssl
-MUTT_CONF_OPT += --with-ssl=$(STAGING_DIR)/usr
+MUTT_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr
 else
-MUTT_CONF_OPT += --without-ssl
+MUTT_CONF_OPTS += --without-ssl
 endif
 else
-MUTT_CONF_OPT += --without-ssl
+MUTT_CONF_OPTS += --without-ssl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -23,7 +23,7 @@
 	ac_cv_have_decl_HAVE_IB_GCC_ATOMIC_BUILTINS=yes \
 	mysql_cv_new_rl_interface=yes
 
-MYSQL_CONF_OPT = \
+MYSQL_CONF_OPTS = \
 	--without-ndb-binlog \
 	--without-docs \
 	--without-man \
@@ -45,11 +45,11 @@
 MYSQL_DEPENDENCIES += host-mysql host-bison
 HOST_MYSQL_DEPENDENCIES = host-zlib
 
-HOST_MYSQL_CONF_OPT = \
+HOST_MYSQL_CONF_OPTS = \
 	--with-embedded-server \
 	--disable-mysql-maintainer-mode
 
-MYSQL_CONF_OPT += \
+MYSQL_CONF_OPTS += \
 	--localstatedir=/var/mysql \
 	--with-atomic-ops=up \
 	--with-embedded-server \
@@ -69,9 +69,9 @@
 # Debugging is only available for the server, so no need for
 # this if-block outside of the server if-block
 ifeq ($(BR2_ENABLE_DEBUG),y)
-MYSQL_CONF_OPT += --with-debug=full
+MYSQL_CONF_OPTS += --with-debug=full
 else
-MYSQL_CONF_OPT += --without-debug
+MYSQL_CONF_OPTS += --without-debug
 endif
 
 define HOST_MYSQL_BUILD_CMDS
@@ -104,7 +104,7 @@
 endef
 
 else
-MYSQL_CONF_OPT += \
+MYSQL_CONF_OPTS += \
 	--without-server
 endif
 
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -9,7 +9,7 @@
 NANO_SITE = http://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-NANO_CONF_OPT = --without-slang
+NANO_CONF_OPTS = --without-slang
 NANO_DEPENDENCIES = ncurses
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
@@ -26,7 +26,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_NANO_TINY),y)
-	NANO_CONF_OPT += --enable-tiny
+	NANO_CONF_OPTS += --enable-tiny
 define NANO_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/src/nano $(TARGET_DIR)/usr/bin/nano
 endef
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -7,7 +7,7 @@
 NBD_VERSION = 3.8
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
-NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
+NBD_CONF_OPTS = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 NBD_LICENSE = GPLv2
 NBD_LICENSE_FILES = COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -14,7 +14,7 @@
 NCURSES_LICENSE_FILES = README
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)5-config
 
-NCURSES_CONF_OPT = \
+NCURSES_CONF_OPTS = \
 	$(if $(BR2_PREFER_STATIC_LIB),--without-shared,--with-shared) \
 	--without-cxx \
 	--without-cxx-binding \
@@ -37,7 +37,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-NCURSES_CONF_OPT += --enable-widec
+NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
@@ -77,7 +77,7 @@
 NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
 
 ifneq ($(BR2_ENABLE_DEBUG),y)
-NCURSES_CONF_OPT += --without-debug
+NCURSES_CONF_OPTS += --without-debug
 endif
 
 # ncurses breaks with parallel build, but takes quite a while to
@@ -140,7 +140,7 @@
 	$(MAKE) -C $(@D)/progs tic
 endef
 
-HOST_NCURSES_CONF_OPT = \
+HOST_NCURSES_CONF_OPTS = \
 	--with-shared --without-gpm \
 	--without-manpages \
 	--without-cxx \
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -8,7 +8,7 @@
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99"
-NDISC6_CONF_OPT = --localstatedir=/var --disable-rpath --disable-suid-install
+NDISC6_CONF_OPTS = --localstatedir=/var --disable-rpath --disable-suid-install
 NDISC6_LICENSE = GPLv2 or GPLv3
 NDISC6_LICENSE_FILES = COPYING
 
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -9,10 +9,10 @@
 NE10_LICENSE = BSD-3c or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 
-NE10_CONF_OPT = -DGNULINUX_PLATFORM=ON
+NE10_CONF_OPTS = -DGNULINUX_PLATFORM=ON
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-NE10_CONF_OPT += \
+NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
 endif
 
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -12,10 +12,10 @@
 
 NEARD_AUTORECONF = YES
 NEARD_DEPENDENCIES = host-pkgconf dbus libglib2 libnl
-NEARD_CONF_OPT = --disable-traces
+NEARD_CONF_OPTS = --disable-traces
 
 ifeq ($(BR2_PACKAGE_NEARD_TOOLS),y)
-	NEARD_CONF_OPT += --enable-tools
+	NEARD_CONF_OPTS += --enable-tools
 endif
 
 define NEARD_INSTALL_INIT_SYSV
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -9,42 +9,42 @@
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
-NEON_CONF_OPT = --without-gssapi --disable-rpath
+NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
 NEON_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-NEON_CONF_OPT += --with-zlib=$(STAGING_DIR)
+NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
 NEON_DEPENDENCIES += zlib
 else
-NEON_CONF_OPT += --without-zlib
+NEON_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_SSL),y)
-NEON_CONF_OPT += --with-ssl
+NEON_CONF_OPTS += --with-ssl
 NEON_DEPENDENCIES += openssl
 else
-NEON_CONF_OPT += --without-ssl
+NEON_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
-NEON_CONF_OPT += --with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
+NEON_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
 NEON_DEPENDENCIES += expat
 else
-NEON_CONF_OPT += --with-expat=no
+NEON_CONF_OPTS += --with-expat=no
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
-NEON_CONF_OPT += --with-libxml2=yes
+NEON_CONF_OPTS += --with-libxml2=yes
 NEON_CONF_ENV += ac_cv_prog_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
 NEON_DEPENDENCIES += libxml2
 else
-NEON_CONF_OPT += --with-libxml2=no
+NEON_CONF_OPTS += --with-libxml2=no
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT)$(BR2_PACKAGE_NEON_LIBXML2),)
 # webdav needs xml support
-NEON_CONF_OPT += --disable-webdav
+NEON_CONF_OPTS += --disable-webdav
 endif
 
 $(eval $(autotools-package))
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -17,7 +17,7 @@
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
 	ac_cv_path_NETA_LDCONFIG=""
-NETATALK_CONF_OPT += --with-cnid-cdb-backend \
+NETATALK_CONF_OPTS += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--with-ssl-dir=$(STAGING_DIR)/usr \
 	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
@@ -32,22 +32,22 @@
 ifeq ($(BR2_PACKAGE_ACL),y)
 	NETATALK_DEPENDENCIES += acl
 else
-	NETATALK_CONF_OPT += --with-acls=no
+	NETATALK_CONF_OPTS += --with-acls=no
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 	NETATALK_DEPENDENCIES += avahi
-	NETATALK_CONF_OPT += --enable-zeroconf=$(STAGING_DIR)/usr
+	NETATALK_CONF_OPTS += --enable-zeroconf=$(STAGING_DIR)/usr
 else
-	NETATALK_CONF_OPT += --disable-zeroconf
+	NETATALK_CONF_OPTS += --disable-zeroconf
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	NETATALK_DEPENDENCIES += cups
 	NETATALK_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
-	NETATALK_CONF_OPT += --enable-cups
+	NETATALK_CONF_OPTS += --enable-cups
 else
-	NETATALK_CONF_OPT += --disable-cups
+	NETATALK_CONF_OPTS += --disable-cups
 endif
 
 define NETATALK_INSTALL_EXTRA_FILES
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -7,7 +7,7 @@
 NETPERF_VERSION = 2.6.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
-NETPERF_CONF_OPT = --enable-demo=yes
+NETPERF_CONF_OPTS = --enable-demo=yes
 NETPERF_LICENSE = netperf license
 NETPERF_LICENSE_FILES = COPYING
 
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -11,7 +11,7 @@
 NETSNMP_LICENSE_FILES = COPYING
 NETSNMP_INSTALL_STAGING = YES
 NETSNMP_CONF_ENV = ac_cv_NETSNMP_CAN_USE_SYSCTL=yes
-NETSNMP_CONF_OPT = --with-persistent-directory=/var/lib/snmp \
+NETSNMP_CONF_OPTS = --with-persistent-directory=/var/lib/snmp \
 		--with-defaults --enable-mini-agent --without-rpm \
 		--with-logfile=none --without-kmem-usage $(DISABLE_IPV6) \
 		--enable-as-needed --without-perl-modules \
@@ -32,31 +32,31 @@
 NETSNMP_BLOAT_MIBS = BRIDGE DISMAN-EVENT DISMAN-SCHEDULE DISMAN-SCRIPT EtherLike RFC-1215 RFC1155-SMI RFC1213 SCTP SMUX
 
 ifeq ($(BR2_ENDIAN),"BIG")
-	NETSNMP_CONF_OPT += --with-endianness=big
+	NETSNMP_CONF_OPTS += --with-endianness=big
 else
-	NETSNMP_CONF_OPT += --with-endianness=little
+	NETSNMP_CONF_OPTS += --with-endianness=little
 endif
 
 # OpenSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	NETSNMP_DEPENDENCIES += openssl
-	NETSNMP_CONF_OPT += \
+	NETSNMP_CONF_OPTS += \
 		--with-openssl=$(STAGING_DIR)/usr/include/openssl
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 	# openssl uses zlib, so we need to explicitly link with it when static
 	NETSNMP_CONF_ENV += LIBS=-lz
 endif
 else
-	NETSNMP_CONF_OPT += --without-openssl
+	NETSNMP_CONF_OPTS += --without-openssl
 endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_MIBS),y)
-	NETSNMP_CONF_OPT += --disable-mib-loading
-	NETSNMP_CONF_OPT += --disable-mibs
+	NETSNMP_CONF_OPTS += --disable-mib-loading
+	NETSNMP_CONF_OPTS += --disable-mibs
 endif
 
 ifneq ($(BR2_PACKAGE_NETSNMP_ENABLE_DEBUGGING),y)
-	NETSNMP_CONF_OPT += --disable-debugging
+	NETSNMP_CONF_OPTS += --disable-debugging
 endif
 
 # Remove IPv6 MIBs if there's no IPv6
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -12,18 +12,18 @@
 NETTLE_LICENSE_FILES = COPYING.LIB
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
-NETTLE_CONF_OPT = --disable-openssl
+NETTLE_CONF_OPTS = --disable-openssl
 
 # ARM assembly requires v6+ ISA
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
-NETTLE_CONF_OPT += --disable-assembler
+NETTLE_CONF_OPTS += --disable-assembler
 endif
 
 # ARM NEON, requires binutils 2.21+
 ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_BINUTILS_VERSION_2_20_1),yy)
-NETTLE_CONF_OPT += --enable-arm-neon
+NETTLE_CONF_OPTS += --enable-arm-neon
 else
-NETTLE_CONF_OPT += --disable-arm-neon
+NETTLE_CONF_OPTS += --disable-arm-neon
 endif
 
 define NETTLE_DITCH_DEBUGGING_CFLAGS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -23,7 +23,7 @@
 	ac_cv_file__etc_SuSE_release=no
 
 
-NETWORK_MANAGER_CONF_OPT = \
+NETWORK_MANAGER_CONF_OPTS = \
 		--mandir=$(STAGING_DIR)/usr/man/ \
 		--disable-tests \
 		--disable-qt \
@@ -38,36 +38,36 @@
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 	NETWORK_MANAGER_DEPENDENCIES += newt
-	NETWORK_MANAGER_CONF_OPT += --with-nmtui=yes
+	NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
 else
-	NETWORK_MANAGER_CONF_OPT += --with-nmtui=no
+	NETWORK_MANAGER_CONF_OPTS += --with-nmtui=no
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
 	NETWORK_MANAGER_DEPENDENCIES += pppd
-	NETWORK_MANAGER_CONF_OPT += --enable-ppp
+	NETWORK_MANAGER_CONF_OPTS += --enable-ppp
 else
-	NETWORK_MANAGER_CONF_OPT += --disable-ppp
+	NETWORK_MANAGER_CONF_OPTS += --disable-ppp
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER),y)
 	NETWORK_MANAGER_DEPENDENCIES += modem-manager
-	NETWORK_MANAGER_CONF_OPT += --with-modem-manager-1
+	NETWORK_MANAGER_CONF_OPTS += --with-modem-manager-1
 else
-	NETWORK_MANAGER_CONF_OPT += --without-modem-manager-1
+	NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
 endif
 
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
-NETWORK_MANAGER_CONF_OPT += --with-dhclient=/usr/sbin/dhclient
+NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/usr/sbin/dhclient
 endif
 
 ifeq ($(BR2_PACKAGE_DHCPCD),y)
-NETWORK_MANAGER_CONF_OPT += --with-dhcpcd=/usr/sbin/dhcpcd
+NETWORK_MANAGER_CONF_OPTS += --with-dhcpcd=/usr/sbin/dhcpcd
 endif
 
 # uClibc by default doesn't have backtrace support, so don't use it
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-NETWORK_MANAGER_CONF_OPT += --disable-crashtrace
+NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
 endif
 
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -9,7 +9,7 @@
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-NEWT_CONF_OPT = --without-python --without-tcl
+NEWT_CONF_OPTS = --without-python --without-tcl
 NEWT_MAKE = $(MAKE1)
 NEWT_LICENSE = GPLv2
 NEWT_LICENSE_FILES = COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -14,7 +14,7 @@
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 
-NFS_UTILS_CONF_OPT = \
+NFS_UTILS_CONF_OPTS = \
 		--disable-nfsv4 \
 		--disable-nfsv41 \
 		--disable-gss \
@@ -28,10 +28,10 @@
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
-NFS_UTILS_CONF_OPT += --enable-tirpc --with-tirpcinclude=$(STAGING_DIR)/usr/include/tirpc/
+NFS_UTILS_CONF_OPTS += --enable-tirpc --with-tirpcinclude=$(STAGING_DIR)/usr/include/tirpc/
 NFS_UTILS_DEPENDENCIES += libtirpc
 else
-NFS_UTILS_CONF_OPT += --disable-tirpc
+NFS_UTILS_CONF_OPTS += --disable-tirpc
 endif
 
 define NFS_UTILS_INSTALL_FIXUP
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -17,7 +17,7 @@
 endif
 NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
 
-NGREP_CONF_OPT =  \
+NGREP_CONF_OPTS =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
 	--enable-pcre \
 	--with-pcre=$(STAGING_DIR)/usr \
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -8,24 +8,24 @@
 NMAP_SITE = http://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
-NMAP_CONF_OPT = --without-liblua --without-zenmap \
+NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
 	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
 NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NMAP_CONF_OPT += --with-openssl="$(STAGING_DIR)/usr"
+NMAP_CONF_OPTS += --with-openssl="$(STAGING_DIR)/usr"
 NMAP_DEPENDENCIES += openssl
 else
-NMAP_CONF_OPT += --without-openssl
+NMAP_CONF_OPTS += --without-openssl
 endif
 
 # ndiff only works with python2.x
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 NMAP_DEPENDENCIES += python
 else
-NMAP_CONF_OPT += --without-ndiff
+NMAP_CONF_OPTS += --without-ndiff
 endif
 
 $(eval $(autotools-package))
diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -6,7 +6,7 @@
 
 NSS_MDNS_VERSION = 0.10
 NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
-NSS_MDNS_CONF_OPT = --localstatedir=/var
+NSS_MDNS_CONF_OPTS = --localstatedir=/var
 NSS_MDNS_LICENSE = LGPLv2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -7,14 +7,14 @@
 NTFS_3G_VERSION = 2014.2.15
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
-NTFS_3G_CONF_OPT = --disable-ldconfig
+NTFS_3G_CONF_OPTS = --disable-ldconfig
 NTFS_3G_INSTALL_STAGING = YES
 NTFS_3G_DEPENDENCIES = host-pkgconf
 NTFS_3G_LICENSE = GPLv2+ LGPLv2+
 NTFS_3G_LICENSE_FILES = COPYING COPYING.LIB
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-	NTFS_3G_CONF_OPT += --with-fuse=external
+	NTFS_3G_CONF_OPTS += --with-fuse=external
 	NTFS_3G_DEPENDENCIES += libfuse
 endif
 
@@ -24,12 +24,12 @@
 
 ifeq ($(BR2_PACKAGE_NTFS_3G_ENCRYPTED),y)
 	NTFS_3G_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-	NTFS_3G_CONF_OPT += --enable-crypto
+	NTFS_3G_CONF_OPTS += --enable-crypto
 	NTFS_3G_DEPENDENCIES += gnutls libgcrypt
 endif
 
 ifneq ($(BR2_PACKAGE_NTFS_3G_NTFSPROGS),y)
-	NTFS_3G_CONF_OPT += --disable-ntfsprogs
+	NTFS_3G_CONF_OPTS += --disable-ntfsprogs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -15,23 +15,23 @@
 	NTP_CONF_ENV += isc_cv_have_in6addr_any=no
 endif
 
-NTP_CONF_OPT = --with-shared \
+NTP_CONF_OPTS = --with-shared \
 		--program-transform-name=s,,, \
 		--disable-tickadj
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	NTP_CONF_OPT += --with-crypto
+	NTP_CONF_OPTS += --with-crypto
 	NTP_DEPENDENCIES += openssl
 else
-	NTP_CONF_OPT += --without-crypto
+	NTP_CONF_OPTS += --without-crypto
 endif
 
 ifeq ($(BR2_PACKAGE_NTP_NTPSNMPD),y)
-	NTP_CONF_OPT += \
+	NTP_CONF_OPTS += \
 		--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
 	NTP_DEPENDENCIES += netsnmp
 else
-	NTP_CONF_OPT += --without-ntpsnmpd
+	NTP_CONF_OPTS += --without-ntpsnmpd
 endif
 
 define NTP_PATCH_FIXUPS
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -16,7 +16,7 @@
 
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
-NUT_CONF_OPT = \
+NUT_CONF_OPTS = \
 	--with-altpidpath=/var/run/upsd \
 	--without-hal
 
@@ -30,60 +30,60 @@
 endif
 
 ifeq ($(call qstrip,$(BR2_PACKAGE_NUT_DRIVERS)),)
-NUT_CONF_OPT += --with-drivers=all
+NUT_CONF_OPTS += --with-drivers=all
 else
-NUT_CONF_OPT += --with-drivers=$(BR2_PACKAGE_NUT_DRIVERS)
+NUT_CONF_OPTS += --with-drivers=$(BR2_PACKAGE_NUT_DRIVERS)
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS),yy)
 NUT_DEPENDENCIES += avahi dbus
-NUT_CONF_OPT += --with-avahi
+NUT_CONF_OPTS += --with-avahi
 else
-NUT_CONF_OPT += --without-avahi
+NUT_CONF_OPTS += --without-avahi
 endif
 
 # gd with support for png is required for the CGI
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
 NUT_DEPENDENCIES += gd libpng
-NUT_CONF_OPT += --with-cgi
+NUT_CONF_OPTS += --with-cgi
 else
-NUT_CONF_OPT += --without-cgi
+NUT_CONF_OPTS += --without-cgi
 endif
 
 # libltdl (libtool) is needed for nut-scanner
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 NUT_DEPENDENCIES += libtool
-NUT_CONF_OPT += --with-libltdl
+NUT_CONF_OPTS += --with-libltdl
 else
-NUT_CONF_OPT += --without-libltdl
+NUT_CONF_OPTS += --without-libltdl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
 NUT_DEPENDENCIES += libusb-compat
-NUT_CONF_OPT += --with-usb
+NUT_CONF_OPTS += --with-usb
 else
-NUT_CONF_OPT += --without-usb
+NUT_CONF_OPTS += --without-usb
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT)$(BR2_PACKAGE_NEON_LIBXML2),y)
 NUT_DEPENDENCIES += neon
-NUT_CONF_OPT += --with-neon
+NUT_CONF_OPTS += --with-neon
 else
-NUT_CONF_OPT += --without-neon
+NUT_CONF_OPTS += --without-neon
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 NUT_DEPENDENCIES += netsnmp
-NUT_CONF_OPT += --with-snmp
+NUT_CONF_OPTS += --with-snmp
 else
-NUT_CONF_OPT += --without-snmp
+NUT_CONF_OPTS += --without-snmp
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NUT_DEPENDENCIES += openssl
-NUT_CONF_OPT += --with-ssl
+NUT_CONF_OPTS += --with-ssl
 else
-NUT_CONF_OPT += --without-ssl
+NUT_CONF_OPTS += --without-ssl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -16,7 +16,7 @@
 	libcap-ng \
 	mobile-broadband-provider-info
 
-OFONO_CONF_OPT = --disable-test
+OFONO_CONF_OPTS = --disable-test
 
 # N.B. Qualcomm QMI modem support requires O_CLOEXEC; so
 # make sure that it is defined.
@@ -27,17 +27,17 @@
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-	OFONO_CONF_OPT += --enable-udev
+	OFONO_CONF_OPTS += --enable-udev
 	OFONO_DEPENDENCIES += udev
 else
-	OFONO_CONF_OPT += --disable-udev
+	OFONO_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
-	OFONO_CONF_OPT += --enable-bluetooth
+	OFONO_CONF_OPTS += --enable-bluetooth
 	OFONO_DEPENDENCIES += bluez_utils
 else
-	OFONO_CONF_OPT += --disable-bluetooth
+	OFONO_CONF_OPTS += --disable-bluetooth
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ola/ola.mk b/package/ola/ola.mk
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -17,7 +17,7 @@
 # util-linux provides uuid lib
 OLA_DEPENDENCIES = protobuf util-linux host-bison host-flex
 
-OLA_CONF_OPT = \
+OLA_CONF_OPTS = \
 	ac_cv_have_pymod_google_protobuf=yes \
 	--disable-gcov \
 	--disable-tcmalloc \
@@ -33,119 +33,119 @@
 ## OLA Bindings and Interface selections
 
 ifeq ($(BR2_PACKAGE_OLA_WEB),y)
-OLA_CONF_OPT += --enable-http
+OLA_CONF_OPTS += --enable-http
 OLA_DEPENDENCIES += libmicrohttpd
 else
-OLA_CONF_OPT += --disable-http
+OLA_CONF_OPTS += --disable-http
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_SLP),y)
-OLA_CONF_OPT += --enable-slp
+OLA_CONF_OPTS += --enable-slp
 else
-OLA_CONF_OPT += --disable-slp
+OLA_CONF_OPTS += --disable-slp
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PYTHON_BINDINGS),y)
-OLA_CONF_OPT += --enable-python-libs
+OLA_CONF_OPTS += --enable-python-libs
 OLA_DEPENDENCIES += python python-protobuf
 else
-OLA_CONF_OPT += --disable-python-libs
+OLA_CONF_OPTS += --disable-python-libs
 endif
 
 ## OLA Examples and Tests
 
 ifeq ($(BR2_PACKAGE_OLA_EXAMPLES),y)
-OLA_CONF_OPT += --enable-examples
+OLA_CONF_OPTS += --enable-examples
 OLA_DEPENDENCIES += ncurses
 else
-OLA_CONF_OPT += --disable-examples
+OLA_CONF_OPTS += --disable-examples
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_RDM_TESTS),y)
-OLA_CONF_OPT += --enable-rdm-tests
+OLA_CONF_OPTS += --enable-rdm-tests
 else
-OLA_CONF_OPT += --disable-rdm-tests
+OLA_CONF_OPTS += --disable-rdm-tests
 endif
 
 ## OLA Plugin selections
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_E131),y)
-OLA_CONF_OPT += --enable-e131
+OLA_CONF_OPTS += --enable-e131
 else
-OLA_CONF_OPT += --disable-e131
+OLA_CONF_OPTS += --disable-e131
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ARTNET),y)
-OLA_CONF_OPT += --enable-artnet
+OLA_CONF_OPTS += --enable-artnet
 else
-OLA_CONF_OPT += --disable-artnet
+OLA_CONF_OPTS += --disable-artnet
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OPENDMX),y)
-OLA_CONF_OPT += --enable-opendmx
+OLA_CONF_OPTS += --enable-opendmx
 else
-OLA_CONF_OPT += --disable-opendmx
+OLA_CONF_OPTS += --disable-opendmx
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_DUMMY),y)
-OLA_CONF_OPT += --enable-dummy
+OLA_CONF_OPTS += --enable-dummy
 else
-OLA_CONF_OPT += --disable-dummy
+OLA_CONF_OPTS += --disable-dummy
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_ESPNET),y)
-OLA_CONF_OPT += --enable-espnet
+OLA_CONF_OPTS += --enable-espnet
 else
-OLA_CONF_OPT += --disable-espnet
+OLA_CONF_OPTS += --disable-espnet
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_KINET),y)
-OLA_CONF_OPT += --enable-kinet
+OLA_CONF_OPTS += --enable-kinet
 else
-OLA_CONF_OPT += --disable-kinet
+OLA_CONF_OPTS += --disable-kinet
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_OSC),y)
-OLA_CONF_OPT += --enable-osc
+OLA_CONF_OPTS += --enable-osc
 OLA_DEPENDENCIES += liblo
 else
-OLA_CONF_OPT += --disable-osc
+OLA_CONF_OPTS += --disable-osc
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_MILINT),y)
-OLA_CONF_OPT += --enable-milinst
+OLA_CONF_OPTS += --enable-milinst
 else
-OLA_CONF_OPT += --disable-milinst
+OLA_CONF_OPTS += --disable-milinst
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_PATHPORT),y)
-OLA_CONF_OPT += --enable-pathport
+OLA_CONF_OPTS += --enable-pathport
 else
-OLA_CONF_OPT += --disable-pathport
+OLA_CONF_OPTS += --disable-pathport
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SANDNET),y)
-OLA_CONF_OPT += --enable-sandnet
+OLA_CONF_OPTS += --enable-sandnet
 else
-OLA_CONF_OPT += --disable-sandnet
+OLA_CONF_OPTS += --disable-sandnet
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_SHOWNET),y)
-OLA_CONF_OPT += --enable-shownet
+OLA_CONF_OPTS += --enable-shownet
 else
-OLA_CONF_OPT += --disable-shownet
+OLA_CONF_OPTS += --disable-shownet
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_STAGEPROFI),y)
-OLA_CONF_OPT += --enable-stageprofi --enable-libusb
+OLA_CONF_OPTS += --enable-stageprofi --enable-libusb
 else
-OLA_CONF_OPT += --disable-stageprofi
+OLA_CONF_OPTS += --disable-stageprofi
 endif
 
 ifeq ($(BR2_PACKAGE_OLA_PLUGIN_USBPRO),y)
-OLA_CONF_OPT += --enable-usbpro --enable-libusb
+OLA_CONF_OPTS += --enable-usbpro --enable-libusb
 else
-OLA_CONF_OPT += --disable-usbpro
+OLA_CONF_OPTS += --disable-usbpro
 endif
 
 $(eval $(autotools-package))
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -15,8 +15,8 @@
 OMNIORB_INSTALL_TARGET = YES
 
 # omniorb is not python3 friendly, so force the python interpreter
-OMNIORB_CONF_OPT = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
-HOST_OMNIORB_CONF_OPT = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
+HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/usr/bin/python2
 
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
@@ -25,8 +25,8 @@
 # need to match because of the code generation done by the
 # host tools during the target compile (ie headers generated
 # on host are used in target build).
-OMNIORB_CONF_OPT += --disable-longdouble
-HOST_OMNIORB_CONF_OPT += --disable-longdouble
+OMNIORB_CONF_OPTS += --disable-longdouble
+HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 
 # The EmbeddedSystem define (set below in OMNIORB_ADJUST_TOOLDIR)
 # enables building of just the lib and disables building of
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -11,7 +11,7 @@
 OPENCV_LICENSE_FILES = doc/license.txt
 
 # OpenCV component options
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_DEBUG_INFO=OFF \
 	-DBUILD_DOCS=OFF            \
 	-DBUILD_EXAMPLES=OFF        \
@@ -19,7 +19,7 @@
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
 
 # OpenCV build options
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF      \
 	-DENABLE_FAST_MATH=ON            \
 	-DENABLE_NOISY_WARNINGS=OFF      \
@@ -29,19 +29,19 @@
 	-DOPENCV_CAN_BREAK_BINARY_COMPATIBILITY=ON
 
 # OpenCV link options
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF \
 	-DCMAKE_SKIP_RPATH=OFF                  \
 	-DCMAKE_USE_RELATIVE_PATHS=OFF
 
 # OpenCV packaging options:
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DBUILD_PACKAGE=OFF           \
 	-DENABLE_SOLUTION_FOLDERS=OFF \
 	-DINSTALL_CREATE_DISTRIB=OFF
 
 # OpenCV module selection
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_androidcamera=OFF                                        \
 	-DBUILD_opencv_apps=OFF                                                 \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
@@ -72,7 +72,7 @@
 #
 # * PowerPC support is turned off since its only effect is altering CFLAGS,
 #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DENABLE_POWERPC=OFF \
 	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
 	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
@@ -82,36 +82,36 @@
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Cuda stuff
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_CUBLAS=OFF \
 	-DWITH_CUDA=OFF   \
 	-DWITH_CUFFT=OFF
 
 # NVidia stuff
-OPENCV_CONF_OPT += -DWITH_NVCUVID=OFF
+OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF
 
 # AMD stuff
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_OPENCLAMDFFT=OFF \
 	-DWITH_OPENCLAMDBLAS=OFF
 
 # Intel stuff
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_INTELPERC=OFF \
 	-DWITH_IPP=OFF       \
 	-DWITH_TBB=OFF
 
 # Smartek stuff
-OPENCV_CONF_OPT += -DWITH_GIGEAPI=OFF
+OPENCV_CONF_OPTS += -DWITH_GIGEAPI=OFF
 
 # Prosilica stuff
-OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
+OPENCV_CONF_OPTS += -DWITH_PVAPI=OFF
 
 # Ximea stuff
-OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
+OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
 
 # Non-Linux support (Android options) must remain OFF:
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_ANDROID_CAMERA=OFF          \
 	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
 	-DBUILD_ANDROID_EXAMPLES=OFF	   \
@@ -120,13 +120,13 @@
 	-DBUILD_JAVA_SUPPORT=OFF
 
 # Non-Linux support (Mac OSX options) must remain OFF:
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_AVFOUNDATION=OFF	\
 	-DWITH_CARBON=OFF       \
 	-DWITH_QUICKTIME=OFF
 
 # Non-Linux support (Windows options) must remain OFF:
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_VFW=OFF      \
 	-DWITH_WIN32UI=OFF  \
 	-DWITH_CSTRIPES=OFF \
@@ -135,7 +135,7 @@
 	-DWITH_VIDEOINPUT=OFF
 
 # Software/3rd-party support options.
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DBUILD_JASPER=OFF  \
 	-DBUILD_JPEG=OFF    \
 	-DBUILD_OPENEXR=OFF \
@@ -149,7 +149,7 @@
 
 # Disabled features (mostly because they are not available in Buildroot), but
 # - eigen: OpenCV does not use it, not take any benefit from it.
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_1394=OFF    \
 	-DWITH_EIGEN=OFF   \
 	-DWITH_IMAGEIO=OFF \
@@ -164,68 +164,68 @@
 OPENCV_DEPENDENCIES += zlib
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
-OPENCV_CONF_OPT += -DWITH_FFMPEG=ON
+OPENCV_CONF_OPTS += -DWITH_FFMPEG=ON
 OPENCV_DEPENDENCIES += ffmpeg bzip2
 else
-OPENCV_CONF_OPT += -DWITH_FFMPEG=OFF
+OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPT += -DWITH_GSTREAMER=ON
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
 else
-OPENCV_CONF_OPT += -DWITH_GSTREAMER=OFF
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-OPENCV_CONF_OPT += -DWITH_GTK=ON
+OPENCV_CONF_OPTS += -DWITH_GTK=ON
 OPENCV_DEPENDENCIES += libgtk2
 else
-OPENCV_CONF_OPT += -DWITH_GTK=OFF
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-OPENCV_CONF_OPT += -DWITH_JASPER=ON
+OPENCV_CONF_OPTS += -DWITH_JASPER=ON
 OPENCV_DEPENDENCIES += jasper
 else
-OPENCV_CONF_OPT += -DWITH_JASPER=OFF
+OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JPEG),y)
-OPENCV_CONF_OPT += -DWITH_JPEG=ON
+OPENCV_CONF_OPTS += -DWITH_JPEG=ON
 OPENCV_DEPENDENCIES += jpeg
 else
-OPENCV_CONF_OPT += -DWITH_JPEG=OFF
+OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
-OPENCV_CONF_OPT += -DWITH_PNG=ON
+OPENCV_CONF_OPTS += -DWITH_PNG=ON
 OPENCV_DEPENDENCIES += libpng
 else
-OPENCV_CONF_OPT += -DWITH_PNG=OFF
+OPENCV_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPT += -DWITH_QT=4
+OPENCV_CONF_OPTS += -DWITH_QT=4
 OPENCV_DEPENDENCIES += qt
 else
-OPENCV_CONF_OPT += -DWITH_QT=OFF
+OPENCV_CONF_OPTS += -DWITH_QT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_TIFF),y)
-OPENCV_CONF_OPT += -DWITH_TIFF=ON
+OPENCV_CONF_OPTS += -DWITH_TIFF=ON
 OPENCV_DEPENDENCIES += tiff
 else
-OPENCV_CONF_OPT += -DWITH_TIFF=OFF
+OPENCV_CONF_OPTS += -DWITH_TIFF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
-OPENCV_CONF_OPT += \
+OPENCV_CONF_OPTS += \
 	-DWITH_V4L=ON \
 	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF)
 OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
 else
-OPENCV_CONF_OPT += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
+OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
 endif
 
 # Installation hooks:
diff --git a/package/openntpd/openntpd.mk b/package/openntpd/openntpd.mk
--- a/package/openntpd/openntpd.mk
+++ b/package/openntpd/openntpd.mk
@@ -6,7 +6,7 @@
 
 OPENNTPD_VERSION = 3.9p1
 OPENNTPD_SITE = ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
-OPENNTPD_CONF_OPT = --with-builtin-arc4random --disable-strip
+OPENNTPD_CONF_OPTS = --with-builtin-arc4random --disable-strip
 OPENNTPD_LICENSE = MIT-like, BSD-2c, BSD-3c
 OPENNTPD_LICENSE_FILES = LICENCE
 
diff --git a/package/openobex/openobex.mk b/package/openobex/openobex.mk
--- a/package/openobex/openobex.mk
+++ b/package/openobex/openobex.mk
@@ -15,7 +15,7 @@
 OPENOBEX_AUTORECONF = YES
 OPENOBEX_INSTALL_STAGING = YES
 
-OPENOBEX_CONF_OPT += \
+OPENOBEX_CONF_OPTS += \
 	$(if $(BR2_ENABLE_DEBUG),--enable-debug) \
 	$(if $(BR2_PACKAGE_OPENOBEX_APPS),--enable-apps) \
 	$(if $(BR2_PACKAGE_OPENOBEX_SYSLOG),--enable-syslog) \
@@ -23,16 +23,16 @@
 
 ifeq ($(BR2_PACKAGE_OPENOBEX_BLUEZ),y)
 OPENOBEX_DEPENDENCIES += bluez_utils
-OPENOBEX_CONF_OPT += --with-bluez=$(STAGING_DIR)
+OPENOBEX_CONF_OPTS += --with-bluez=$(STAGING_DIR)
 else
-OPENOBEX_CONF_OPT += --disable-bluetooth
+OPENOBEX_CONF_OPTS += --disable-bluetooth
 endif
 
 ifeq ($(BR2_PACKAGE_OPENOBEX_LIBUSB),y)
 OPENOBEX_DEPENDENCIES += libusb
-OPENOBEX_CONF_OPT += --with-usb=$(STAGING_DIR)
+OPENOBEX_CONF_OPTS += --with-usb=$(STAGING_DIR)
 else
-OPENOBEX_CONF_OPT += --disable-usb
+OPENOBEX_CONF_OPTS += --disable-usb
 endif
 
 $(eval $(autotools-package))
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -11,7 +11,7 @@
 OPENOCD_LICENSE_FILES = COPYING
 
 OPENOCD_AUTORECONF = YES
-OPENOCD_CONF_OPT = \
+OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
@@ -21,21 +21,21 @@
 
 # Adapters
 ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
-OPENOCD_CONF_OPT += --enable-ft2232_libftdi
+OPENOCD_CONF_OPTS += --enable-ft2232_libftdi
 OPENOCD_DEPENDENCIES += libftdi
 endif
 
 ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
-OPENOCD_CONF_OPT += --enable-jlink
+OPENOCD_CONF_OPTS += --enable-jlink
 endif
 
 ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
-OPENOCD_CONF_OPT += --enable-vsllink
+OPENOCD_CONF_OPTS += --enable-vsllink
 endif
 
 HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
 
-HOST_OPENOCD_CONF_OPT = 	\
+HOST_OPENOCD_CONF_OPTS = 	\
 	--disable-doxygen-html 	\
 	--enable-dummy 		\
 	--enable-ft2232_libftdi \
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -19,17 +19,17 @@
 OPENPOWERLINK_ARCH = x86_64
 endif
 
-OPENPOWERLINK_CONF_OPT = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
+OPENPOWERLINK_CONF_OPTS = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
 
 # There is no shared lib in openpowerlink,
 # so force static lib to build libpowerlink.a
-OPENPOWERLINK_CONF_OPT += -DBUILD_SHARED_LIBS=OFF
+OPENPOWERLINK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 
-OPENPOWERLINK_CONF_OPT += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
+OPENPOWERLINK_CONF_OPTS += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
 #  use the user space stack (libpcap)
-OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
 OPENPOWERLINK_DEPENDENCIES = libpcap
 define OPENPOWERLINK_REMOVE_LIB
 	rm $(TARGET_DIR)/usr/lib/libpowerlink.a
@@ -37,51 +37,51 @@
 OPENPOWERLINK_POST_INSTALL_TARGET_HOOKS += OPENPOWERLINK_REMOVE_LIB
 else
 # use the kernel stack
-OPENPOWERLINK_CONF_OPT += -DCFG_KERNEL_STACK=ON \
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=ON \
 		-DCFG_KERNEL_DIR=$(LINUX_DIR) \
 		-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
 OPENPOWERLINK_DEPENDENCIES = linux
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=82573
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8255x
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_I210),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=I210
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=I210
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_EDRV=8139
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=ON
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=ON
 else
-OPENPOWERLINK_CONF_OPT += -DCFG_POWERLINK_MN=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=ON
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=ON
 else
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_CONSOLE=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=ON
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=ON
 OPENPOWERLINK_DEPENDENCIES += qt
 else
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_MN_QT=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=ON
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_CN_CONSOLE=ON
 else
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_CN_CONSOLE=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_CN_CONSOLE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL),y)
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=ON
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_LINUX_KERNEL=ON
 else
-OPENPOWERLINK_CONF_OPT += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
+OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
 endif
 
 $(eval $(cmake-package))
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -9,19 +9,19 @@
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
-OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
+OPENSSH_CONF_OPTS = --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
 # uClibc toolchain for ARC doesn't support PIE at the moment
 ifeq ($(BR2_arc),y)
-OPENSSH_CONF_OPT += --without-pie
+OPENSSH_CONF_OPTS += --without-pie
 endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 OPENSSH_DEPENDENCIES += linux-pam
-OPENSSH_CONF_OPT += --with-pam
+OPENSSH_CONF_OPTS += --with-pam
 endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -12,7 +12,7 @@
 # Autoreconf needed because package is distributed without a configure script
 # See http://sourceforge.net/p/open-vm-tools/mailman/message/32550385/
 OPENVMTOOLS_AUTORECONF = YES
-OPENVMTOOLS_CONF_OPT = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
+OPENVMTOOLS_CONF_OPTS = --without-icu --without-x --without-gtk2 --without-gtkmm --without-kernel-modules
 OPENVMTOOLS_DEPENDENCIES = libglib2
 
 # When libfuse is available, openvmtools can build vmblock-fuse, so
@@ -23,28 +23,28 @@
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PROCPS),y)
 OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps
-OPENVMTOOLS_CONF_OPT += --with-procps
+OPENVMTOOLS_CONF_OPTS += --with-procps
 OPENVMTOOLS_DEPENDENCIES += procps-ng
 else
-OPENVMTOOLS_CONF_OPT += --without-procps
+OPENVMTOOLS_CONF_OPTS += --without-procps
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_DNET),y)
 # Needed because if it is defined configure will
 # use a different method to check for dnet
 OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
-OPENVMTOOLS_CONF_OPT += --with-dnet
+OPENVMTOOLS_CONF_OPTS += --with-dnet
 OPENVMTOOLS_DEPENDENCIES += libdnet
 else
-OPENVMTOOLS_CONF_OPT += --without-dnet
+OPENVMTOOLS_CONF_OPTS += --without-dnet
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVMTOOLS_PAM),y)
-OPENVMTOOLS_CONF_OPT += --with-pam
+OPENVMTOOLS_CONF_OPTS += --with-pam
 OPENVMTOOLS_MAKE_OPTS += CFLAGS+="-Wno-unused-local-typedefs"
 OPENVMTOOLS_DEPENDENCIES += linux-pam
 else
-OPENVMTOOLS_CONF_OPT += --without-pam
+OPENVMTOOLS_CONF_OPTS += --without-pam
 endif
 
 # symlink needed by lib/system/systemLinux.c (or will cry in /var/log/messages)
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -10,14 +10,14 @@
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPLv2
 OPENVPN_LICENSE_FILES = COPYRIGHT.GPL
-OPENVPN_CONF_OPT = --disable-plugin-auth-pam --enable-iproute2 \
+OPENVPN_CONF_OPTS = --disable-plugin-auth-pam --enable-iproute2 \
 	$(if $(BR2_PREFER_STATIC_LIB),--disable-plugins)
 OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 	NETSTAT=/bin/netstat \
 	ROUTE=/sbin/route
 
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
-OPENVPN_CONF_OPT += --enable-small --disable-plugins \
+OPENVPN_CONF_OPTS += --enable-small --disable-plugins \
 	--disable-debug --disable-eurephia
 endif
 
@@ -34,16 +34,16 @@
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
 	OPENVPN_DEPENDENCIES += lzo
 else
-	OPENVPN_CONF_OPT += --disable-lzo
+	OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
-	OPENVPN_CONF_OPT += --with-crypto-library=openssl
+	OPENVPN_CONF_OPTS += --with-crypto-library=openssl
 	OPENVPN_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_POLARSSL),y)
-	OPENVPN_CONF_OPT += --with-crypto-library=polarssl
+	OPENVPN_CONF_OPTS += --with-crypto-library=polarssl
 	OPENVPN_DEPENDENCIES += polarssl
 endif
 
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -12,7 +12,7 @@
 OPKG_LICENSE = GPLv2+
 OPKG_LICENSE_FILES = COPYING
 OPKG_INSTALL_STAGING = YES
-OPKG_CONF_OPT = --disable-curl
+OPKG_CONF_OPTS = --disable-curl
 OPKG_AUTORECONF = YES
 
 # Ensure directory for lockfile exists
@@ -21,11 +21,11 @@
 endef
 
 ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
-OPKG_CONF_OPT += --enable-gpg
+OPKG_CONF_OPTS += --enable-gpg
 OPKG_CONF_ENV = ac_cv_path_GPGME_CONFIG=$(STAGING_DIR)/usr/bin/gpgme-config
 OPKG_DEPENDENCIES += libgpgme
 else
-OPKG_CONF_OPT += --disable-gpg
+OPKG_CONF_OPTS += --disable-gpg
 endif
 
 OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -8,7 +8,7 @@
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPLv2+
 OPROFILE_LICENSE_FILES = COPYING
-OPROFILE_CONF_OPT = \
+OPROFILE_CONF_OPTS = \
 	--localstatedir=/var \
 	--disable-account-check \
 	--enable-gui=no \
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -8,7 +8,7 @@
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_LICENSE = BSD-2c
 OPUS_TOOLS_LICENSE_FILES = COPYING
-OPUS_TOOLS_CONF_OPT = --disable-oggtest --disable-opustest
+OPUS_TOOLS_CONF_OPTS = --disable-oggtest --disable-opustest
 OPUS_TOOLS_DEPENDENCIES = opus libogg host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
@@ -16,15 +16,15 @@
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-OPUS_TOOLS_CONF_OPT += --enable-sse
+OPUS_TOOLS_CONF_OPTS += --enable-sse
 else
-OPUS_TOOLS_CONF_OPT += --disable-sse
+OPUS_TOOLS_CONF_OPTS += --disable-sse
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 OPUS_TOOLS_DEPENDENCIES += flac
 else
-OPUS_TOOLS_CONF_OPT += --without-flac
+OPUS_TOOLS_CONF_OPTS += --without-flac
 endif
 
 $(eval $(autotools-package))
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -9,11 +9,11 @@
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
 OPUS_INSTALL_STAGING = YES
-OPUS_CONF_OPT = --disable-doc
+OPUS_CONF_OPTS = --disable-doc
 OPUS_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
-OPUS_CONF_OPT += --enable-fixed-point
+OPUS_CONF_OPTS += --enable-fixed-point
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -6,7 +6,7 @@
 
 ORTP_VERSION = 0.22.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
-ORTP_CONF_OPT = --disable-strict
+ORTP_CONF_OPTS = --disable-strict
 ORTP_INSTALL_STAGING = YES
 ORTP_LICENSE = LGPLv2.1+
 ORTP_LICENSE_FILES = COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -8,7 +8,7 @@
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
-P11_KIT_CONF_OPT = --disable-static
+P11_KIT_CONF_OPTS = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3c
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -40,7 +40,7 @@
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
-PANGO_CONF_OPT = --enable-explicit-deps=no \
+PANGO_CONF_OPTS = --enable-explicit-deps=no \
 	--disable-debug \
 	--disable-gtk-doc-html
 
@@ -53,14 +53,14 @@
 	freetype
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	PANGO_CONF_OPT += --x-includes=$(STAGING_DIR)/usr/include/X11 \
+	PANGO_CONF_OPTS += --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
 	PANGO_DEPENDENCIES += xlib_libX11
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT)$(BR2_PACKAGE_XLIB_LIBXRENDER),yy)
 	PANGO_DEPENDENCIES += xlib_libXft xlib_libXrender
-	PANGO_CONF_OPT += --with-xft
+	PANGO_CONF_OPTS += --with-xft
 endif
 
 define PANGO_INSTALL_INITSCRIPT
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -17,24 +17,24 @@
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 PARTED_DEPENDENCIES += readline
-PARTED_CONF_OPT += --with-readline
+PARTED_CONF_OPTS += --with-readline
 else
-PARTED_CONF_OPT += --without-readline
+PARTED_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2),y)
 PARTED_DEPENDENCIES += lvm2
-PARTED_CONF_OPT += --enable-device-mapper
+PARTED_CONF_OPTS += --enable-device-mapper
 else
-PARTED_CONF_OPT += --disable-device-mapper
+PARTED_CONF_OPTS += --disable-device-mapper
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-PARTED_CONF_OPT += --disable-dynamic-loading
+PARTED_CONF_OPTS += --disable-dynamic-loading
 endif
 
 HOST_PARTED_DEPENDENCIES = host-util-linux
-HOST_PARTED_CONF_OPT += \
+HOST_PARTED_CONF_OPTS += \
 	--without-readline \
 	--disable-device-mapper \
 
diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -6,7 +6,7 @@
 
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
-PCMANFM_CONF_OPT = --disable-hal
+PCMANFM_CONF_OPTS = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
 PCMANFM_AUTORECONF = YES
 PCMANFM_LICENSE = GPLv2+
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -13,13 +13,13 @@
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 # pcre will use the host g++ if a cross version isn't available
-PCRE_CONF_OPT = --disable-cpp
+PCRE_CONF_OPTS = --disable-cpp
 endif
 
-PCRE_CONF_OPT += --enable-pcre8
-PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
-PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
-PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
-PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
+PCRE_CONF_OPTS += --enable-pcre8
+PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
+PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
+PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
+PCRE_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -18,23 +18,23 @@
 # - libudev has a priority over libusb
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-PCSC_LITE_CONF_OPT += --enable-libudev --disable-libusb
+PCSC_LITE_CONF_OPTS += --enable-libudev --disable-libusb
 PCSC_LITE_DEPENDENCIES += udev
 else
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
-PCSC_LITE_CONF_OPT += --enable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += --enable-libusb --disable-libudev
 PCSC_LITE_DEPENDENCIES += libusb
 else
-PCSC_LITE_CONF_OPT += --disable-libusb --disable-libudev
+PCSC_LITE_CONF_OPTS += --disable-libusb --disable-libudev
 endif
 endif
 
 ifeq ($(PACKAGE_PCSC_LITE_DEBUGATR),y)
-PCSC_LITE_CONF_OPT += --enable-debugatr
+PCSC_LITE_CONF_OPTS += --enable-debugatr
 endif
 
 ifeq ($(PACKAGE_PCSC_LITE_EMBEDDED),y)
-PCSC_LITE_CONF_OPT += --enable-embedded
+PCSC_LITE_CONF_OPTS += --enable-embedded
 endif
 
 $(eval $(autotools-package))
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -11,7 +11,7 @@
 PERL_GD_LICENSE = Artistic-2.0 or GPLv1+
 PERL_GD_LICENSE_FILES = LICENSE
 
-PERL_GD_CONF_OPT = \
+PERL_GD_CONF_OPTS = \
 	-options=FT,PNG \
 	-lib_gd_path=$(STAGING_DIR)/usr \
 	-lib_ft_path=$(STAGING_DIR)/usr \
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -11,7 +11,7 @@
 PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
-PERL_XML_LIBXML_CONF_OPT = \
+PERL_XML_LIBXML_CONF_OPTS = \
 	LIBS="-L $(STAGING_DIR)/usr/lib" \
 	INC="-I $(STAGING_DIR)/usr/include/libxml2" \
 	NO_THREADS
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -10,7 +10,7 @@
 PERL_XML_PARSER_DEPENDENCIES = expat
 PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
 
-HOST_PERL_XML_PARSER_CONF_OPT = \
+HOST_PERL_XML_PARSER_CONF_OPTS = \
 	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
 	EXPATINCPATH=$(HOST_DIR)/usr/include
 
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -51,7 +51,7 @@
 # We have to override LD, because an external multilib toolchain ld is not
 # wrapped to provide the required sysroot options.  We also can't use ccache
 # because the configure script doesn't support it.
-PERL_CONF_OPT = \
+PERL_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--target-tools-prefix=$(TARGET_CROSS) \
 	--prefix=/usr \
@@ -66,24 +66,24 @@
 	-Dperladmin=root
 
 ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
-    PERL_CONF_OPT += -Dusedevel
+    PERL_CONF_OPTS += -Dusedevel
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-    PERL_CONF_OPT += --all-static --no-dynaloader
+    PERL_CONF_OPTS += --all-static --no-dynaloader
 endif
 
 ifneq ($(BR2_LARGEFILE),y)
-    PERL_CONF_OPT += -Uuselargefiles
+    PERL_CONF_OPTS += -Uuselargefiles
 endif
 
 PERL_MODULES = $(call qstrip,$(BR2_PACKAGE_PERL_MODULES))
 ifneq ($(PERL_MODULES),)
-PERL_CONF_OPT += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
+PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
 endif
 
 define PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPT))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
diff --git a/package/php-geoip/php-geoip.mk b/package/php-geoip/php-geoip.mk
--- a/package/php-geoip/php-geoip.mk
+++ b/package/php-geoip/php-geoip.mk
@@ -8,7 +8,7 @@
 PHP_GEOIP_SOURCE = geoip-$(PHP_GEOIP_VERSION).tgz
 # pecl.php.net returns html with db connect failed
 PHP_GEOIP_SITE = http://sources.buildroot.net
-PHP_GEOIP_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_GEOIP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-geoip=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_GEOIP_DEPENDENCIES = geoip php host-autoconf
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
--- a/package/php-gnupg/php-gnupg.mk
+++ b/package/php-gnupg/php-gnupg.mk
@@ -10,7 +10,7 @@
 PHP_GNUPG_SITE = http://sources.buildroot.net
 # phpize does the autoconf magic
 PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
-PHP_GNUPG_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
 PHP_GNUPG_LICENSE = BSD-2c
 PHP_GNUPG_LICENSE_FILES = LICENSE
diff --git a/package/php-imagick/php-imagick.mk b/package/php-imagick/php-imagick.mk
--- a/package/php-imagick/php-imagick.mk
+++ b/package/php-imagick/php-imagick.mk
@@ -8,7 +8,7 @@
 PHP_IMAGICK_SOURCE = imagick-$(PHP_IMAGICK_VERSION).tgz
 # pecl.php.net returns html with db connect failed
 PHP_IMAGICK_SITE = http://sources.buildroot.net
-PHP_IMAGICK_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_IMAGICK_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-imagick=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_IMAGICK_DEPENDENCIES = imagemagick php host-autoconf
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -8,7 +8,7 @@
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 # pecl.php.net returns html with db connect failed
 PHP_MEMCACHED_SITE = http://sources.buildroot.net
-PHP_MEMCACHED_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--disable-memcached-sasl \
 	--with-libmemcached-dir=$(STAGING_DIR)/usr \
 	--with-zlib-dir=$(STAGING_DIR)/usr
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
--- a/package/php-ssh2/php-ssh2.mk
+++ b/package/php-ssh2/php-ssh2.mk
@@ -8,7 +8,7 @@
 PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
 # pecl.php.net returns html with db connect failed
 PHP_SSH2_SITE = http://sources.buildroot.net
-PHP_SSH2_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-ssh2=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -8,7 +8,7 @@
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 # pecl.php.net returns html with db connect failed
 PHP_YAML_SITE = http://sources.buildroot.net
-PHP_YAML_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
 	--with-yaml=$(STAGING_DIR)/usr
 # phpize does the autoconf magic
 PHP_YAML_DEPENDENCIES = libyaml php host-autoconf
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
--- a/package/php-zmq/php-zmq.mk
+++ b/package/php-zmq/php-zmq.mk
@@ -10,7 +10,7 @@
 PHP_ZMQ_SITE = http://sources.buildroot.net
 # phpize does the autoconf magic
 PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
-PHP_ZMQ_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
+PHP_ZMQ_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
 PHP_ZMQ_LICENSE = BSD-3c
 PHP_ZMQ_LICENSE_FILES = LICENSE
 
diff --git a/package/php/php.mk b/package/php/php.mk
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -13,7 +13,7 @@
 PHP_DEPENDENCIES = host-pkgconf
 PHP_LICENSE = PHP
 PHP_LICENSE_FILES = LICENSE
-PHP_CONF_OPT =  --mandir=/usr/share/man \
+PHP_CONF_OPTS =  --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
 		--without-pear \
@@ -46,12 +46,12 @@
 endif
 endif
 
-PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
-PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
-PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_FPM),--enable-fpm,--disable-fpm)
 
 ### Extensions
-PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
+PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
 		$(if $(BR2_PACKAGE_PHP_EXT_SESSION),--enable-session) \
 		$(if $(BR2_PACKAGE_PHP_EXT_HASH),--enable-hash) \
@@ -79,48 +79,48 @@
 		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
-	PHP_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += openssl
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 	PHP_CONF_ENV += php_cv_libxml_build_works=yes
-	PHP_CONF_OPT += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
+	PHP_CONF_OPTS += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
 	PHP_DEPENDENCIES += libxml2
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_WDDX),y)
-	PHP_CONF_OPT += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += expat
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_XMLRPC),y)
-	PHP_CONF_OPT += --with-xmlrpc \
+	PHP_CONF_OPTS += --with-xmlrpc \
 		$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
 	PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
-	PHP_CONF_OPT += --with-zlib=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
-	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-	PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-iconv=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += libiconv
 else
-	PHP_CONF_OPT += --with-iconv
+	PHP_CONF_OPTS += --with-iconv
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
-	PHP_CONF_OPT += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += icu
 	# The intl module is implemented in C++, but PHP fails to use
 	# g++ as the compiler for the final link. As a workaround,
@@ -129,30 +129,30 @@
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
-	PHP_CONF_OPT += --with-gmp=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-gmp=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += gmp
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
-	PHP_CONF_OPT += --with-readline=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += readline
 endif
 
 ### Native MySQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
-	PHP_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
-	PHP_CONF_OPT += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
+	PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
 	PHP_DEPENDENCIES += mysql
 endif
 
 ### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
-	PHP_CONF_OPT += --enable-pdo
+	PHP_CONF_OPTS += --enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
-	PHP_CONF_OPT += --with-pdo-sqlite=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-pdo-sqlite=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += sqlite
 	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
 ifneq ($(BR2_LARGEFILE),y)
@@ -160,56 +160,56 @@
 endif
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
-	PHP_CONF_OPT += --with-pdo-mysql=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-pdo-mysql=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += mysql
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_POSTGRESQL),y)
-	PHP_CONF_OPT += --with-pdo-pgsql=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-pdo-pgsql=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += postgresql
 endif
 endif
 
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	PHP_CONF_OPT += --with-pcre-regex=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
-	PHP_CONF_OPT += --with-curl=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_XSL),y)
-	PHP_CONF_OPT += --with-xsl=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-xsl=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += libxslt
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_BZIP2),y)
-	PHP_CONF_OPT += --with-bz2=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-bz2=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += bzip2
 endif
 
 ### DBA
 ifeq ($(BR2_PACKAGE_PHP_EXT_DBA),y)
-	PHP_CONF_OPT += --enable-dba
+	PHP_CONF_OPTS += --enable-dba
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_CDB),y)
-	PHP_CONF_OPT += --without-cdb
+	PHP_CONF_OPTS += --without-cdb
 endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_FLAT),y)
-	PHP_CONF_OPT += --without-flatfile
+	PHP_CONF_OPTS += --without-flatfile
 endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_INI),y)
-	PHP_CONF_OPT += --without-inifile
+	PHP_CONF_OPTS += --without-inifile
 endif
 ifeq ($(BR2_PACKAGE_PHP_EXT_DBA_DB4),y)
-	PHP_CONF_OPT += --with-db4=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-db4=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += berkeleydb
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
-	PHP_CONF_OPT += --with-snmp=$(STAGING_DIR)/usr
+	PHP_CONF_OPTS += --with-snmp=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += netsnmp
 endif
 
diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
--- a/package/pinentry/pinentry.mk
+++ b/package/pinentry/pinentry.mk
@@ -10,42 +10,42 @@
 PINENTRY_LICENSE = GPLv2+
 PINENTRY_LICENSE_FILES = COPYING
 PINENTRY_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-PINENTRY_CONF_OPT =  --disable-pinentry-gtk # gtk1
-PINENTRY_CONF_OPT += --disable-pinentry-qt  # qt3
-PINENTRY_CONF_OPT += --without-libcap       # requires PAM
+PINENTRY_CONF_OPTS =  --disable-pinentry-gtk # gtk1
+PINENTRY_CONF_OPTS += --disable-pinentry-qt  # qt3
+PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
 
 # build with X if available
 ifeq ($(BR2_PACKAGE_XORG7),y)
-PINENTRY_CONF_OPT += --with-x
+PINENTRY_CONF_OPTS += --with-x
 else
-PINENTRY_CONF_OPT += --without-x
+PINENTRY_CONF_OPTS += --without-x
 endif
 
 # pinentry-ncurses backend
 ifeq ($(BR2_PACKAGE_PINENTRY_NCURSES),y)
-PINENTRY_CONF_OPT += --enable-ncurses
+PINENTRY_CONF_OPTS += --enable-ncurses
 PINENTRY_DEPENDENCIES += ncurses
 else
-PINENTRY_CONF_OPT += --disable-ncurses
+PINENTRY_CONF_OPTS += --disable-ncurses
 endif
 
 # pinentry-gtk2 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_GTK2),y)
-PINENTRY_CONF_OPT += --enable-pinentry-gtk2
+PINENTRY_CONF_OPTS += --enable-pinentry-gtk2
 PINENTRY_DEPENDENCIES += libgtk2
 else
-PINENTRY_CONF_OPT += --disable-pinentry-gtk2
+PINENTRY_CONF_OPTS += --disable-pinentry-gtk2
 endif
 
 # pinentry-qt4 backend
 ifeq ($(BR2_PACKAGE_PINENTRY_QT4),y)
 # -pthread needs to be passed for certain toolchains
 # http://autobuild.buildroot.net/results/6be/6be109ccedec603a67cebdb31b55865dcce0e128/
-PINENTRY_CONF_OPT += LIBS=-pthread
-PINENTRY_CONF_OPT += --enable-pinentry-qt4
+PINENTRY_CONF_OPTS += LIBS=-pthread
+PINENTRY_CONF_OPTS += --enable-pinentry-qt4
 PINENTRY_DEPENDENCIES += qt
 else
-PINENTRY_CONF_OPT += --disable-pinentry-qt4
+PINENTRY_CONF_OPTS += --disable-pinentry-qt4
 endif
 
 $(eval $(autotools-package))
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -14,12 +14,12 @@
 PIXMAN_AUTORECONF = YES
 
 # don't build gtk based demos
-PIXMAN_CONF_OPT = --disable-gtk
+PIXMAN_CONF_OPTS = --disable-gtk
 
 # disable iwmmxt support for CPU's that don't have
 # this feature
 ifneq ($(BR2_iwmmxt),y)
-PIXMAN_CONF_OPT += --disable-arm-iwmmxt
+PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
 endif
 
 $(eval $(autotools-package))
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -104,7 +104,7 @@
 endif
 
 $(2)_CONF_ENV			?=
-$(2)_CONF_OPT			?=
+$(2)_CONF_OPTS			?=
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
 $(2)_INSTALL_OPTS                ?= install
@@ -146,7 +146,7 @@
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
-		$$(QUIET) $$($$(PKG)_CONF_OPT) \
+		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
 else
@@ -173,7 +173,7 @@
 		--with-xmlto=no \
 		--with-fop=no \
 		--disable-dependency-tracking \
-		$$(QUIET) $$($$(PKG)_CONF_OPT) \
+		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
 	)
 endef
 endif
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -37,7 +37,7 @@
 define inner-cmake-package
 
 $(2)_CONF_ENV			?=
-$(2)_CONF_OPT			?=
+$(2)_CONF_OPTS			?=
 $(2)_MAKE			?= $$(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPTS			?=
@@ -69,7 +69,7 @@
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_PREFER_STATIC_LIB),OFF,ON) \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
-		$$($$(PKG)_CONF_OPT) \
+		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
 else
@@ -88,7 +88,7 @@
 		-DCMAKE_INSTALL_PREFIX="$$(HOST_DIR)/usr" \
 		-DUSE_CCACHE=$$(if $$(BR2_CCACHE),ON,OFF) \
 		-DBUILD_TESTING=OFF \
-		$$($$(PKG)_CONF_OPT) \
+		$$($$(PKG)_CONF_OPTS) \
 	)
 endef
 endif
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -69,7 +69,7 @@
 			--install_path script=/usr/bin \
 			--install_path bindoc=/usr/share/man/man1 \
 			--install_path libdoc=/usr/share/man/man3 \
-			$$($(2)_CONF_OPT); \
+			$$($(2)_CONF_OPTS); \
 	else \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
@@ -91,7 +91,7 @@
 			INSTALLVENDORSCRIPT=/usr/bin \
 			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
 			INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
-			$$($(2)_CONF_OPT); \
+			$$($(2)_CONF_OPTS); \
 	fi
 endef
 else
@@ -104,7 +104,7 @@
 		perl Build.PL \
 			--install_base $$(HOST_DIR)/usr \
 			--installdirs vendor \
-			$$($(2)_CONF_OPT); \
+			$$($(2)_CONF_OPTS); \
 	else \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
@@ -112,7 +112,7 @@
 		perl Makefile.PL \
 			INSTALL_BASE=$$(HOST_DIR)/usr \
 			INSTALLDIRS=vendor \
-			$$($(2)_CONF_OPT); \
+			$$($(2)_CONF_OPTS); \
 	fi
 endef
 endif
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -31,12 +31,12 @@
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
 
 ifeq ($(LIBC),uclibc)
-POCO_CONF_OPT += --no-fpenvironment --no-wstring
+POCO_CONF_OPTS += --no-fpenvironment --no-wstring
 endif
 
 # architectures missing some FE_* in their fenv.h
 ifeq ($(BR2_sh4a)$(BR2_nios2),y)
-POCO_CONF_OPT += --no-fpenvironment
+POCO_CONF_OPTS += --no-fpenvironment
 endif
 
 define POCO_CONFIGURE_CMDS
@@ -44,7 +44,7 @@
 		--config=Linux-CrossEnv	\
 		--prefix=/usr		\
 		--omit="$(POCO_OMIT)"	\
-		$(POCO_CONF_OPT)	\
+		$(POCO_CONF_OPTS)	\
 		--unbundled		\
 		--no-tests		\
 		--no-samples)
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -7,7 +7,7 @@
 POLARSSL_SITE = https://polarssl.org/code/releases
 POLARSSL_VERSION = 1.2.11
 POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
-POLARSSL_CONF_OPT = \
+POLARSSL_CONF_OPTS = \
 	-DBUILD_TESTS=OFF \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_POLARSSL_PROGRAMS),ON,OFF)
 
diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -14,7 +14,7 @@
 POLKIT_DEPENDENCIES = libglib2 host-intltool expat
 
 # We could also support --with-authfw=pam
-POLKIT_CONF_OPT = \
+POLKIT_CONF_OPTS = \
 	--with-authfw=shadow \
 	--with-os-type=unknown \
 	--disable-man-pages \
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -10,55 +10,55 @@
 POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
 POPPLER_LICENSE_FILES = COPYING
-POPPLER_CONF_OPT = --with-font-configuration=fontconfig
+POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-	POPPLER_CONF_OPT += --enable-cms=lcms2
+	POPPLER_CONF_OPTS += --enable-cms=lcms2
 	POPPLER_DEPENDENCIES += lcms2
 else
-	POPPLER_CONF_OPT += --enable-cms=none
+	POPPLER_CONF_OPTS += --enable-cms=none
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
-	POPPLER_CONF_OPT += --enable-libtiff
+	POPPLER_CONF_OPTS += --enable-libtiff
 	POPPLER_DEPENDENCIES += tiff
 else
-	POPPLER_CONF_OPT += --disable-libtiff
+	POPPLER_CONF_OPTS += --disable-libtiff
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-	POPPLER_CONF_OPT += --enable-libjpeg
+	POPPLER_CONF_OPTS += --enable-libjpeg
 	POPPLER_DEPENDENCIES += jpeg
 else
-	POPPLER_CONF_OPT += --disable-libjpeg
+	POPPLER_CONF_OPTS += --disable-libjpeg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	POPPLER_CONF_OPT += --enable-libpng
+	POPPLER_CONF_OPTS += --enable-libpng
 	POPPLER_DEPENDENCIES += libpng
 else
-	POPPLER_CONF_OPT += --disable-libpng
+	POPPLER_CONF_OPTS += --disable-libpng
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	POPPLER_CONF_OPT += --enable-zlib
+	POPPLER_CONF_OPTS += --enable-zlib
 	POPPLER_DEPENDENCIES += zlib
 else
-	POPPLER_CONF_OPT += --disable-zlib
+	POPPLER_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
-	POPPLER_CONF_OPT += --enable-libcurl
+	POPPLER_CONF_OPTS += --enable-libcurl
 	POPPLER_DEPENDENCIES += libcurl
 else
-	POPPLER_CONF_OPT += --disable-libcurl
+	POPPLER_CONF_OPTS += --disable-libcurl
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
-	POPPLER_CONF_OPT += --with-x
+	POPPLER_CONF_OPTS += --with-x
 	POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
 else
-	POPPLER_CONF_OPT += --without-x
+	POPPLER_CONF_OPTS += --without-x
 endif
 
 $(eval $(autotools-package))
diff --git a/package/popt/popt.mk b/package/popt/popt.mk
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -17,7 +17,7 @@
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 POPT_CONF_ENV += am_cv_lib_iconv=yes
-POPT_CONF_OPT += --with-libiconv-prefix=$(STAGING_DIR)/usr
+POPT_CONF_OPTS += --with-libiconv-prefix=$(STAGING_DIR)/usr
 endif
 
 $(eval $(autotools-package))
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -15,7 +15,7 @@
 PORTAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
 
-PORTAUDIO_CONF_OPT = \
+PORTAUDIO_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_PORTAUDIO_ALSA),--with-alsa,--without-alsa) \
 	$(if $(BR2_PACKAGE_PORTAUDIO_OSS),--with-oss,--without-oss) \
 	$(if $(BR2_PACKAGE_PORTAUDIO_CXX),--enable-cxx,--disable-cxx)
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,28 +14,28 @@
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-	POSTGRESQL_CONF_OPT += --disable-thread-safety
+	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
 ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
-	POSTGRESQL_CONF_OPT += --disable-spinlocks
+	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 	POSTGRESQL_DEPENDENCIES += readline
 else
-	POSTGRESQL_CONF_OPT += --without-readline
+	POSTGRESQL_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	POSTGRESQL_DEPENDENCIES += zlib
 else
-	POSTGRESQL_CONF_OPT += --without-zlib
+	POSTGRESQL_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_TZDATA),y)
 	POSTGRESQL_DEPENDENCIES += tzdata
-	POSTGRESQL_CONF_OPT += --with-system-tzdata=/usr/share/zoneinfo
+	POSTGRESQL_CONF_OPTS += --with-system-tzdata=/usr/share/zoneinfo
 else
 	POSTGRESQL_DEPENDENCIES += host-zic
 	POSTGRESQL_CONF_ENV += ZIC=$$(ZIC)
@@ -43,7 +43,7 @@
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	POSTGRESQL_DEPENDENCIES += openssl
-	POSTGRESQL_CONF_OPT += --with-openssl
+	POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
 define POSTGRESQL_USERS
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -11,6 +11,6 @@
 POWERPC_UTILS_LICENSE = Common Public License Version 1.0
 POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
 
-POWERPC_UTILS_CONF_OPT = --without-librtas
+POWERPC_UTILS_CONF_OPTS = --without-librtas
 
 $(eval $(autotools-package))
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -15,7 +15,7 @@
 PRBOOM_DEPENDENCIES += libpng
 endif
 
-PRBOOM_CONF_OPT = \
+PRBOOM_CONF_OPTS = \
 		--oldincludedir=$(STAGING_DIR)/usr/include \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -21,11 +21,11 @@
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 PROCPS_NG_DEPENDENCIES += gettext
-PROCPS_NG_CONF_OPT += LIBS=-lintl
+PROCPS_NG_CONF_OPTS += LIBS=-lintl
 endif
 
 # We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
 # instead of $(TARGET_DIR)/usr/usr
-PROCPS_NG_CONF_OPT += --exec-prefix=
+PROCPS_NG_CONF_OPTS += --exec-prefix=
 
 $(eval $(autotools-package))
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -13,7 +13,7 @@
 PROFTPD_CONF_ENV = ac_cv_func_setpgrp_void=yes \
 		ac_cv_func_setgrent_void=yes
 
-PROFTPD_CONF_OPT = --localstatedir=/var/run \
+PROFTPD_CONF_OPTS = --localstatedir=/var/run \
 		--disable-static \
 		--disable-curses \
 		--disable-ncurses \
@@ -23,7 +23,7 @@
 		--with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_REWRITE),y)
-PROFTPD_CONF_OPT += --with-modules=mod_rewrite
+PROFTPD_CONF_OPTS += --with-modules=mod_rewrite
 endif
 
 ifeq ($(BR2_LARGEFILE),y)
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -9,7 +9,7 @@
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
-PROTOBUF_C_CONF_OPT = --disable-protoc
+PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2c
 PROTOBUF_C_LICENSE_FILES = LICENSE
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -11,7 +11,7 @@
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/usr/bin/protoc
 
 PROTOBUF_INSTALL_STAGING = YES
 
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -12,7 +12,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
 # Don't force -fstack-protector when SSP is not available in toolchain
-PSMISC_CONF_OPT = --disable-harden-flags
+PSMISC_CONF_OPTS = --disable-harden-flags
 endif
 
 # build after busybox, we prefer fat versions while we're at it
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -14,14 +14,14 @@
 PTPD2_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-	PTPD2_CONF_OPT += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+	PTPD2_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 	PTPD2_CONF_ENV += ac_cv_path_PATH_NET_SNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
 	PTPD2_DEPENDENCIES += netsnmp
 else
-	PTPD2_CONF_OPT += --disable-snmp
+	PTPD2_CONF_OPTS += --disable-snmp
 endif
 
 define PTPD2_INSTALL_INIT_SYSV
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -10,7 +10,7 @@
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
-PULSEAUDIO_CONF_OPT = \
+PULSEAUDIO_CONF_OPTS = \
 	--localstatedir=/var \
 	--disable-default-build-tests \
 	--disable-legacy-runtime-dir \
@@ -36,16 +36,16 @@
 ifeq ($(BR2_PACKAGE_ORC),y)
 PULSEAUDIO_DEPENDENCIES += orc
 PULSEAUDIO_CONF_ENV += ORCC=$(HOST_DIR)/usr/bin/orcc
-PULSEAUDIO_CONF_OPT += --enable-orc
+PULSEAUDIO_CONF_OPTS += --enable-orc
 else
-PULSEAUDIO_CONF_OPT += --disable-orc
+PULSEAUDIO_CONF_OPTS += --disable-orc
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 PULSEAUDIO_DEPENDENCIES += libcap
-PULSEAUDIO_CONF_OPT += --with-caps
+PULSEAUDIO_CONF_OPTS += --with-caps
 else
-PULSEAUDIO_CONF_OPT += --without-caps
+PULSEAUDIO_CONF_OPTS += --without-caps
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
@@ -71,14 +71,14 @@
 endif
 
 ifeq ($(PULSEAUDIO_USE_NEON),y)
-PULSEAUDIO_CONF_OPT += --enable-neon-opt=yes
+PULSEAUDIO_CONF_OPTS += --enable-neon-opt=yes
 else
-PULSEAUDIO_CONF_OPT += --enable-neon-opt=no
+PULSEAUDIO_CONF_OPTS += --enable-neon-opt=no
 endif
 
 # pulseaudio alsa backend needs pcm/mixer apis
 ifneq ($(BR2_PACKAGE_ALSA_LIB_PCM)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
-PULSEAUDIO_CONF_OPT += --disable-alsa
+PULSEAUDIO_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_XLIB_LIBSM)$(BR2_PACKAGE_XLIB_LIBXTST),yyy)
@@ -97,7 +97,7 @@
 endif
 
 else
-PULSEAUDIO_CONF_OPT += --disable-x11
+PULSEAUDIO_CONF_OPTS += --disable-x11
 endif
 
 define PULSEAUDIO_REMOVE_VALA
diff --git a/package/python/python.mk b/package/python/python.mk
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -16,7 +16,7 @@
 # also installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON_CONF_OPT += 	\
+HOST_PYTHON_CONF_OPTS += 	\
 	--enable-static		\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
@@ -61,57 +61,57 @@
 ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
 PYTHON_DEPENDENCIES += ncurses
 else
-PYTHON_CONF_OPT += --disable-curses
+PYTHON_CONF_OPTS += --disable-curses
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYEXPAT),y)
 PYTHON_DEPENDENCIES += expat
-PYTHON_CONF_OPT += --with-expat=system
+PYTHON_CONF_OPTS += --with-expat=system
 else
-PYTHON_CONF_OPT += --with-expat=none
+PYTHON_CONF_OPTS += --with-expat=none
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
 PYTHON_DEPENDENCIES += berkeleydb
 else
-PYTHON_CONF_OPT += --disable-bsddb
+PYTHON_CONF_OPTS += --disable-bsddb
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_SQLITE),y)
 PYTHON_DEPENDENCIES += sqlite
 else
-PYTHON_CONF_OPT += --disable-sqlite3
+PYTHON_CONF_OPTS += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
 PYTHON_DEPENDENCIES += openssl
 else
-PYTHON_CONF_OPT += --disable-ssl
+PYTHON_CONF_OPTS += --disable-ssl
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_CODECSCJK),y)
-PYTHON_CONF_OPT += --disable-codecs-cjk
+PYTHON_CONF_OPTS += --disable-codecs-cjk
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
-PYTHON_CONF_OPT += --disable-unicodedata
+PYTHON_CONF_OPTS += --disable-unicodedata
 endif
 
 # Default is UCS2 w/o a conf opt
 ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
-PYTHON_CONF_OPT += --enable-unicode=ucs4
+PYTHON_CONF_OPTS += --enable-unicode=ucs4
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
 else
-PYTHON_CONF_OPT += --disable-bz2
+PYTHON_CONF_OPTS += --disable-bz2
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_ZLIB),y)
 PYTHON_DEPENDENCIES += zlib
 else
-PYTHON_CONF_OPT += --disable-zlib
+PYTHON_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
@@ -124,7 +124,7 @@
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes
 
-PYTHON_CONF_OPT += \
+PYTHON_CONF_OPTS += \
 	--without-cxx-main 	\
 	--without-doc-strings	\
 	--with-system-ffi	\
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -17,7 +17,7 @@
 # installed in $(HOST_DIR), as it is needed when cross-compiling
 # third-party Python modules.
 
-HOST_PYTHON3_CONF_OPT += 	\
+HOST_PYTHON3_CONF_OPTS += 	\
 	--without-ensurepip	\
 	--without-cxx-main 	\
 	--disable-sqlite3	\
@@ -50,35 +50,35 @@
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
 PYTHON3_DEPENDENCIES += ncurses
 else
-PYTHON3_CONF_OPT += --disable-curses
+PYTHON3_CONF_OPTS += --disable-curses
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
 PYTHON3_DEPENDENCIES += mpdecimal
-PYTHON3_CONF_OPT += --with-libmpdec=system
+PYTHON3_CONF_OPTS += --with-libmpdec=system
 else
-PYTHON3_CONF_OPT += --with-libmpdec=none
+PYTHON3_CONF_OPTS += --with-libmpdec=none
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYEXPAT),y)
 PYTHON3_DEPENDENCIES += expat
-PYTHON3_CONF_OPT += --with-expat=system
+PYTHON3_CONF_OPTS += --with-expat=system
 else
-PYTHON3_CONF_OPT += --with-expat=none
+PYTHON3_CONF_OPTS += --with-expat=none
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
-PYTHON3_CONF_OPT += --enable-old-stdlib-cache
+PYTHON3_CONF_OPTS += --enable-old-stdlib-cache
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_PY_ONLY),y)
-PYTHON3_CONF_OPT += --disable-pyc-build
+PYTHON3_CONF_OPTS += --disable-pyc-build
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SQLITE),y)
 PYTHON3_DEPENDENCIES += sqlite
 else
-PYTHON3_CONF_OPT += --disable-sqlite3
+PYTHON3_CONF_OPTS += --disable-sqlite3
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_SSL),y)
@@ -86,11 +86,11 @@
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_CODECSCJK),y)
-PYTHON3_CONF_OPT += --disable-codecs-cjk
+PYTHON3_CONF_OPTS += --disable-codecs-cjk
 endif
 
 ifneq ($(BR2_PACKAGE_PYTHON3_UNICODEDATA),y)
-PYTHON3_CONF_OPT += --disable-unicodedata
+PYTHON3_CONF_OPTS += --disable-unicodedata
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BZIP2),y)
@@ -107,7 +107,7 @@
 	ac_cv_file__dev_ptc=yes \
 	ac_cv_working_tzset=yes
 
-PYTHON3_CONF_OPT += \
+PYTHON3_CONF_OPTS += \
 	--without-ensurepip	\
 	--without-cxx-main 	\
 	--with-system-ffi	\
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -10,24 +10,24 @@
 QUAGGA_DEPENDENCIES = host-gawk
 QUAGGA_LICENSE = GPLv2+
 QUAGGA_LICENSE_FILES = COPYING
-QUAGGA_CONF_OPT = --program-transform-name='' --enable-netlink
+QUAGGA_CONF_OPTS = --program-transform-name='' --enable-netlink
 
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
-QUAGGA_CONF_OPT += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ZEBRA),--enable-zebra,--disable-zebra)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BABELD),--enable-babeld,--disable-babeld)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGPD),--enable-bgpd,--disable-bgpd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPD),--enable-ripd,--disable-ripd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_RIPNGD),--enable-ripngd,--disable-ripngd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPFD),--enable-ospfd,--disable-ospfd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OSPF6D),--enable-ospf6d,--disable-ospf6d)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),--enable-watchquagga,--disable-watchquagga)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_ISISD),--enable-isisd,--disable-isisd)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),--enable-bgp-announce,--disable-bgp-announce)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_TCP_ZERBRA),--enable-tcp-zebra,--disable-tcp-zebra)
+QUAGGA_CONF_OPTS += $(if $(BR2_PACKAGE_QUAGGA_OPAQUE_LSA),--enable-opaque-lsa,--disable-opaque-lsa)
 
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
-QUAGGA_CONF_OPT += --enable-snmp=agentx
+QUAGGA_CONF_OPTS += --enable-snmp=agentx
 QUAGGA_DEPENDENCIES += netsnmp
 endif
 
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -10,14 +10,14 @@
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate)
-RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
+RDESKTOP_CONF_OPTS = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
 RDESKTOP_LICENSE = GPLv3+
 RDESKTOP_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 RDESKTOP_DEPENDENCIES += pcsc-lite
 else
-RDESKTOP_CONF_OPT += --disable-smartcard
+RDESKTOP_CONF_OPTS += --disable-smartcard
 endif
 
 $(eval $(autotools-package))
diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -12,7 +12,7 @@
 RP_PPPOE_SUBDIR = src
 RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
 RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
-RP_PPPOE_CONF_OPT = --disable-debugging
+RP_PPPOE_CONF_OPTS = --disable-debugging
 RP_PPPOE_CONF_ENV = \
 	rpppoe_cv_pack_bitfields=normal \
 	PPPD_H=$(PPPD_DIR)/pppd/pppd.h
diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -14,7 +14,7 @@
 RPCBIND_CONF_ENV += \
 	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
 RPCBIND_DEPENDENCIES += libtirpc
-RPCBIND_CONF_OPT += --with-rpcuser=root
+RPCBIND_CONF_OPTS += --with-rpcuser=root
 
 define RPCBIND_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -9,7 +9,7 @@
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
+RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -14,7 +14,7 @@
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
 		ac_cv_va_copy=yes
 
-RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
+RPM_CONF_OPTS = --disable-build-versionscript --disable-rpath \
 	--without-selinux \
 	--without-python --without-perl \
 	--with-openssl=external \
@@ -24,24 +24,24 @@
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 RPM_DEPENDENCIES += pcre
-RPM_CONF_OPT += --with-pcre=external
+RPM_CONF_OPTS += --with-pcre=external
 else
-RPM_CONF_OPT += --with-pcre=no
+RPM_CONF_OPTS += --with-pcre=no
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 RPM_DEPENDENCIES += file
-RPM_CONF_OPT += --with-file=external
+RPM_CONF_OPTS += --with-file=external
 else
-RPM_CONF_OPT += --with-file=no
+RPM_CONF_OPTS += --with-file=no
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
-RPM_CONF_OPT += --with-xz
+RPM_CONF_OPTS += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
-RPM_CONF_OPT += --with-bzip2
+RPM_CONF_OPTS += --with-bzip2
 RPM_DEPENDENCIES += bzip2
 endif
 
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -14,7 +14,7 @@
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 			ac_cv_func_mmap_fixed_mapped=yes
-RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
+RRDTOOL_CONF_OPTS = --disable-perl --disable-python --disable-ruby \
 			--disable-tcl --program-transform-name='' \
 			$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
 RRDTOOL_MAKE = $(MAKE1)
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -9,7 +9,7 @@
 RSYNC_LICENSE = GPLv3+
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_DEPENDENCIES = zlib popt
-RSYNC_CONF_OPT = \
+RSYNC_CONF_OPTS = \
 	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
 	--with-included-zlib=no \
 	--with-included-popt=no
@@ -17,7 +17,7 @@
 ifeq ($(BR2_PACKAGE_ACL),y)
 	RSYNC_DEPENDENCIES += acl
 else
-	RSYNC_CONF_OPT += --disable-acl-support
+	RSYNC_CONF_OPTS += --disable-acl-support
 endif
 
 $(eval $(autotools-package))
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -11,7 +11,7 @@
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c util-linux host-pkgconf
 RSYSLOG_AUTORECONF = YES
 
-RSYSLOG_CONF_OPT = --disable-testbench \
+RSYSLOG_CONF_OPTS = --disable-testbench \
 		   --enable-cached-man-pages
 
 # Build after BusyBox
@@ -26,9 +26,9 @@
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 	RSYSLOG_DEPENDENCIES += libgcrypt
 	RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-	RSYSLOG_CONF_OPT += --enable-libgcrypt=yes
+	RSYSLOG_CONF_OPTS += --enable-libgcrypt=yes
 else
-	RSYSLOG_CONF_OPT += --enable-libgcrypt=no
+	RSYSLOG_CONF_OPTS += --enable-libgcrypt=no
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -18,7 +18,7 @@
 
 RTAI_DEPENDENCIES = linux
 
-RTAI_CONF_OPT = \
+RTAI_CONF_OPTS = \
 	--includedir=/usr/include/rtai \
 	--with-linux-dir=$(LINUX_DIR) 	\
 	--disable-leds		      	\
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -12,8 +12,8 @@
 HOST_RUBY_DEPENDENCIES = host-pkgconf
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
-RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-HOST_RUBY_CONF_OPT = --disable-install-doc \
+RUBY_CONF_OPTS = --disable-install-doc --disable-rpath
+HOST_RUBY_CONF_OPTS = --disable-install-doc \
 	--with-out-ext=curses,openssl,readline \
 	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
@@ -56,9 +56,9 @@
 endif
 ifeq ($(BR2_PACKAGE_GMP),y)
 	RUBY_DEPENDENCIES += gmp
-	RUBY_CONF_OPT += --with-gmp
+	RUBY_CONF_OPTS += --with-gmp
 else
-	RUBY_CONF_OPT += --without-gmp
+	RUBY_CONF_OPTS += --without-gmp
 endif
 
 # Remove rubygems and friends, as they need extensions that aren't
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -31,7 +31,7 @@
 	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
 	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread)
 
-SAMBA_CONF_OPT = \
+SAMBA_CONF_OPTS = \
 	--localstatedir=/var \
 	--with-piddir=/var/run \
 	--with-lockdir=/var/lock \
@@ -148,13 +148,13 @@
 # --with-libiconv="" is to avoid detecting host libiconv and build failure
 ifeq ($(BR2_PACKAGE_SAMBA_LIBICONV),y)
 SAMBA_DEPENDENCIES += libiconv
-SAMBA_CONF_OPT += --with-libiconv=$(STAGING_DIR)
+SAMBA_CONF_OPTS += --with-libiconv=$(STAGING_DIR)
 else
-SAMBA_CONF_OPT += --with-libiconv=""
+SAMBA_CONF_OPTS += --with-libiconv=""
 endif
 
 # Compiled debug messages by level
-SAMBA_CONF_OPT += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
+SAMBA_CONF_OPTS += CFLAGS="$(TARGET_CFLAGS) -DMAX_DEBUG_LEVEL=$(BR2_PACKAGE_SAMBA_MAX_DEBUGLEVEL)"
 
 ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_SWAT_DOCUMENTATION
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -14,59 +14,59 @@
 	$(if $(BR2_PACKAGE_READLINE),readline)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-	SAMBA4_CONF_OPT += --with-acl-support
+	SAMBA4_CONF_OPTS += --with-acl-support
 	SAMBA4_DEPENDENCIES += acl
 else
-	SAMBA4_CONF_OPT += --without-acl-support
+	SAMBA4_CONF_OPTS += --without-acl-support
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 	SAMBA4_CONF_ENV += CUPS_CONFIG="$(STAGING_DIR)/usr/bin/cups-config"
-	SAMBA4_CONF_OPT += --enable-cups
+	SAMBA4_CONF_OPTS += --enable-cups
 	SAMBA4_DEPENDENCIES += cups
 else
-	SAMBA4_CONF_OPT += --disable-cups
+	SAMBA4_CONF_OPTS += --disable-cups
 endif
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
-	SAMBA4_CONF_OPT += --with-aio-support
+	SAMBA4_CONF_OPTS += --with-aio-support
 	SAMBA4_DEPENDENCIES += libaio
 else
-	SAMBA4_CONF_OPT += --without-aio-support
+	SAMBA4_CONF_OPTS += --without-aio-support
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
-	SAMBA4_CONF_OPT += --enable-avahi
+	SAMBA4_CONF_OPTS += --enable-avahi
 	SAMBA4_DEPENDENCIES += avahi
 else
-	SAMBA4_CONF_OPT += --disable-avahi
+	SAMBA4_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_GAMIN),y)
-	SAMBA4_CONF_OPT += --with-fam
+	SAMBA4_CONF_OPTS += --with-fam
 	SAMBA4_DEPENDENCIES += gamin
 else
-	SAMBA4_CONF_OPT += --without-fam
+	SAMBA4_CONF_OPTS += --without-fam
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
-	SAMBA4_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
+	SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
 	SAMBA4_DEPENDENCIES += gettext
 else
-	SAMBA4_CONF_OPT += --without-gettext
+	SAMBA4_CONF_OPTS += --without-gettext
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	SAMBA4_CONF_OPT += --enable-gnutls
+	SAMBA4_CONF_OPTS += --enable-gnutls
 	SAMBA4_DEPENDENCIES += gnutls
 else
-	SAMBA4_CONF_OPT += --disable-gnutls
+	SAMBA4_CONF_OPTS += --disable-gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_TARGET_FORM)$(BR2_PACKAGE_NCURSES_TARGET_MENU)$(BR2_PACKAGE_NCURSES_TARGET_PANEL),yyy)
 	SAMBA4_DEPENDENCIES += ncurses
 else
-	SAMBA4_CONF_OPT += --without-regedit
+	SAMBA4_CONF_OPTS += --without-regedit
 endif
 
 define SAMBA4_CONFIGURE_CMDS
@@ -97,7 +97,7 @@
 			--without-cluster-support \
 			--without-ads \
 			--bundled-libraries='!asn1_compile,!compile_et' \
-			$(SAMBA4_CONF_OPT) \
+			$(SAMBA4_CONF_OPTS) \
 	)
 endef
 
diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -12,9 +12,9 @@
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
-SANE_BACKENDS_CONF_OPT += --enable-libusb_1_0
+SANE_BACKENDS_CONF_OPTS += --enable-libusb_1_0
 else
-SANE_BACKENDS_CONF_OPT += --disable-libusb
+SANE_BACKENDS_CONF_OPTS += --disable-libusb
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
@@ -31,13 +31,13 @@
 
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBGLIB2),yyy)
 SANE_BACKENDS_DEPENDENCIES += avahi
-SANE_BACKENDS_CONF_OPT += --enable-avahi
+SANE_BACKENDS_CONF_OPTS += --enable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_NETSNMP),y)
 SANE_BACKENDS_DEPENDENCIES += netsnmp
 else
-SANE_BACKENDS_CONF_OPT += --without-snmp
+SANE_BACKENDS_CONF_OPTS += --without-snmp
 endif
 
 define SANE_BACKENDS_DISABLE_DOCS
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -13,103 +13,103 @@
 
 SCONESERVER_AUTORECONF = YES
 SCONESERVER_DEPENDENCIES += pcre
-SCONESERVER_CONF_OPT += --with-ip --with-local
+SCONESERVER_CONF_OPTS += --with-ip --with-local
 
 # Sconeserver configure script fails to find the libxml2 headers.
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-	SCONESERVER_CONF_OPT += \
+	SCONESERVER_CONF_OPTS += \
 		--with-xml2-config="$(STAGING_DIR)/usr/bin/xml2-config"
 endif
 
 ifeq ($(BR2_INET_IPV6),y)
-	SCONESERVER_CONF_OPT += --with-ip6
+	SCONESERVER_CONF_OPTS += --with-ip6
 else
-	SCONESERVER_CONF_OPT += --without-ip6
+	SCONESERVER_CONF_OPTS += --without-ip6
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	SCONESERVER_DEPENDENCIES += openssl
-	SCONESERVER_CONF_OPT += --with-ssl
+	SCONESERVER_CONF_OPTS += --with-ssl
 else
-	SCONESERVER_CONF_OPT += --without-ssl
+	SCONESERVER_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
-	SCONESERVER_CONF_OPT += --with-examples
+	SCONESERVER_CONF_OPTS += --with-examples
 else
-	SCONESERVER_CONF_OPT += --without-examples
+	SCONESERVER_CONF_OPTS += --without-examples
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
 	SCONESERVER_DEPENDENCIES += libxml2
-	SCONESERVER_CONF_OPT += --with-sconesite
+	SCONESERVER_CONF_OPTS += --with-sconesite
 else
-	SCONESERVER_CONF_OPT += --without-sconesite
+	SCONESERVER_CONF_OPTS += --without-sconesite
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
 	SCONESERVER_DEPENDENCIES += imagemagick host-pkgconf
-	SCONESERVER_CONF_OPT += \
+	SCONESERVER_CONF_OPTS += \
 		--with-sconesite-image \
 		--with-Magick++-config="$(STAGING_DIR)/usr/bin/Magick++-config"
 else
-	SCONESERVER_CONF_OPT += --without-sconesite-image
+	SCONESERVER_CONF_OPTS += --without-sconesite-image
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 	SCONESERVER_DEPENDENCIES += mysql
-	SCONESERVER_CONF_OPT += --with-mysql \
+	SCONESERVER_CONF_OPTS += --with-mysql \
 		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
 		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
 else
-	SCONESERVER_CONF_OPT += --without-mysql
+	SCONESERVER_CONF_OPTS += --without-mysql
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
 	SCONESERVER_DEPENDENCIES += bluez_utils
-	SCONESERVER_CONF_OPT += --with-bluetooth
+	SCONESERVER_CONF_OPTS += --with-bluetooth
 else
-	SCONESERVER_CONF_OPT += --without-bluetooth
+	SCONESERVER_CONF_OPTS += --without-bluetooth
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
 	SCONESERVER_DEPENDENCIES += libxml2
-	SCONESERVER_CONF_OPT += --with-rss
+	SCONESERVER_CONF_OPTS += --with-rss
 else
-	SCONESERVER_CONF_OPT += --without-rss
+	SCONESERVER_CONF_OPTS += --without-rss
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
 	SCONESERVER_DEPENDENCIES += gpsd
-	SCONESERVER_CONF_OPT += --with-location
+	SCONESERVER_CONF_OPTS += --with-location
 else
-	SCONESERVER_CONF_OPT += --without-location
+	SCONESERVER_CONF_OPTS += --without-location
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_LETTUCE),y)
-	SCONESERVER_CONF_OPT += --with-lettuce
+	SCONESERVER_CONF_OPTS += --with-lettuce
 else
-	SCONESERVER_CONF_OPT += --without-lettuce
+	SCONESERVER_CONF_OPTS += --without-lettuce
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
 	SCONESERVER_DEPENDENCIES += mpfr
-	SCONESERVER_CONF_OPT += --with-maths
+	SCONESERVER_CONF_OPTS += --with-maths
 else
-	SCONESERVER_CONF_OPT += --without-maths
+	SCONESERVER_CONF_OPTS += --without-maths
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
-	SCONESERVER_CONF_OPT += --with-testbuilder
+	SCONESERVER_CONF_OPTS += --with-testbuilder
 else
-	SCONESERVER_CONF_OPT += --without-testbuilder
+	SCONESERVER_CONF_OPTS += --without-testbuilder
 endif
 
 ifeq ($(BR2_PACKAGE_SCONESERVER_UI),y)
 	SCONESERVER_DEPENDENCIES += xlib_libX11
-	SCONESERVER_CONF_OPT += --with-ui
+	SCONESERVER_CONF_OPTS += --with-ui
 else
-	SCONESERVER_CONF_OPT += --without-ui
+	SCONESERVER_CONF_OPTS += --without-ui
 endif
 
 $(eval $(autotools-package))
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -24,37 +24,37 @@
 HOST_SDL_DEPENDENCIES += host-automake host-autoconf host-libtool
 
 ifeq ($(BR2_PACKAGE_SDL_FBCON),y)
-SDL_CONF_OPT += --enable-video-fbcon=yes
+SDL_CONF_OPTS += --enable-video-fbcon=yes
 else
-SDL_CONF_OPT += --enable-video-fbcon=no
+SDL_CONF_OPTS += --enable-video-fbcon=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_DIRECTFB),y)
 SDL_DEPENDENCIES += directfb
-SDL_CONF_OPT += --enable-video-directfb=yes
+SDL_CONF_OPTS += --enable-video-directfb=yes
 SDL_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
-SDL_CONF_OPT = --enable-video-directfb=no
+SDL_CONF_OPTS = --enable-video-directfb=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_QTOPIA),y)
-SDL_CONF_OPT += --enable-video-qtopia=yes
+SDL_CONF_OPTS += --enable-video-qtopia=yes
 SDL_DEPENDENCIES += qt
 else
-SDL_CONF_OPT += --enable-video-qtopia=no
+SDL_CONF_OPTS += --enable-video-qtopia=no
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
-SDL_CONF_OPT += --enable-video-x11=yes
+SDL_CONF_OPTS += --enable-video-x11=yes
 SDL_DEPENDENCIES += xlib_libX11 xlib_libXext \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER), xlib_libXrender) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR), xlib_libXrandr)
 else
-SDL_CONF_OPT += --enable-video-x11=no
+SDL_CONF_OPTS += --enable-video-x11=no
 endif
 
 ifneq ($(BR2_USE_MMU),y)
-SDL_CONF_OPT += --enable-dga=no
+SDL_CONF_OPTS += --enable-dga=no
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
@@ -69,13 +69,13 @@
 SDL_DEPENDENCIES += mesa3d
 endif
 
-SDL_CONF_OPT += --enable-pulseaudio=no \
+SDL_CONF_OPTS += --enable-pulseaudio=no \
 		--disable-arts \
 		--disable-esd \
 		--disable-nasm \
 		--disable-video-ps3
 
-HOST_SDL_CONF_OPT += --enable-pulseaudio=no \
+HOST_SDL_CONF_OPTS += --enable-pulseaudio=no \
 		--enable-video-x11=no \
 		--disable-arts \
 		--disable-esd \
diff --git a/package/sdl_gfx/sdl_gfx.mk b/package/sdl_gfx/sdl_gfx.mk
--- a/package/sdl_gfx/sdl_gfx.mk
+++ b/package/sdl_gfx/sdl_gfx.mk
@@ -12,7 +12,7 @@
 SDL_GFX_LICENSE_FILES = COPYING LICENSE
 SDL_GFX_INSTALL_STAGING = YES
 SDL_GFX_DEPENDENCIES = sdl
-SDL_GFX_CONF_OPT = \
+SDL_GFX_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
 	--enable-static
@@ -20,9 +20,9 @@
 # Even though x86_64 processors support MMX, the MMX-specific assembly
 # code in sdl_gfx is IA32 specific, and does not build for x86_64.
 ifeq ($(BR2_i386)$(BR2_X86_CPU_HAS_MMX),yy)
-SDL_GFX_CONF_OPT += --enable-mmx
+SDL_GFX_CONF_OPTS += --enable-mmx
 else
-SDL_GFX_CONF_OPT += --disable-mmx
+SDL_GFX_CONF_OPTS += --disable-mmx
 endif
 
 $(eval $(autotools-package))
diff --git a/package/sdl_image/sdl_image.mk b/package/sdl_image/sdl_image.mk
--- a/package/sdl_image/sdl_image.mk
+++ b/package/sdl_image/sdl_image.mk
@@ -11,7 +11,7 @@
 SDL_IMAGE_LICENSE = zlib
 SDL_IMAGE_LICENSE_FILES = COPYING
 
-SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(STAGING_DIR)/usr \
+SDL_IMAGE_CONF_OPTS = --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 		--disable-sdltest \
 		--disable-static \
@@ -35,7 +35,7 @@
 	$(if $(BR2_PACKAGE_SDL_IMAGE_TIFF),tiff) \
 	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)
 
-HOST_SDL_IMAGE_CONF_OPT = --with-sdl-prefix=$(HOST_DIR)/usr \
+HOST_SDL_IMAGE_CONF_OPTS = --with-sdl-prefix=$(HOST_DIR)/usr \
                 --with-sdl-exec-prefix=$(HOST_DIR)/usr \
                 --disable-sdltest \
                 --disable-static \
diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -12,7 +12,7 @@
 
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
-SDL_MIXER_CONF_OPT = \
+SDL_MIXER_CONF_OPTS = \
 	--without-x \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--disable-music-midi \
@@ -21,17 +21,17 @@
 	--disable-music-flac # configure script fails when cross compiling
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
-SDL_MIXER_CONF_OPT += --enable-music-mp3-mad-gpl
+SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
 SDL_MIXER_DEPENDENCIES += libmad
 else
-SDL_MIXER_CONF_OPT += --disable-music-mp3-mad-gpl
+SDL_MIXER_CONF_OPTS += --disable-music-mp3-mad-gpl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-SDL_MIXER_CONF_OPT += --enable-music-ogg
+SDL_MIXER_CONF_OPTS += --enable-music-ogg
 SDL_MIXER_DEPENDENCIES += libvorbis
 else
-SDL_MIXER_CONF_OPT += --disable-music-ogg
+SDL_MIXER_CONF_OPTS += --disable-music-ogg
 endif
 
 $(eval $(autotools-package))
diff --git a/package/sdl_net/sdl_net.mk b/package/sdl_net/sdl_net.mk
--- a/package/sdl_net/sdl_net.mk
+++ b/package/sdl_net/sdl_net.mk
@@ -10,7 +10,7 @@
 SDL_NET_LICENSE = zlib
 SDL_NET_LICENSE_FILES = COPYING
 
-SDL_NET_CONF_OPT = --localstatedir=/var \
+SDL_NET_CONF_OPTS = --localstatedir=/var \
 		--with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 
diff --git a/package/sdl_sound/sdl_sound.mk b/package/sdl_sound/sdl_sound.mk
--- a/package/sdl_sound/sdl_sound.mk
+++ b/package/sdl_sound/sdl_sound.mk
@@ -29,16 +29,16 @@
 SDL_SOUND_DEPENDENCIES += speex
 endif
 
-SDL_SOUND_CONF_OPT = \
+SDL_SOUND_CONF_OPTS = \
 	--with-sdl-prefix=$(STAGING_DIR)/usr \
 	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
 	--disable-sdltest \
 	--enable-static
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-SDL_SOUND_CONF_OPT += --enable-mmx
+SDL_SOUND_CONF_OPTS += --enable-mmx
 else
-SDL_SOUND_CONF_OPT += --disable-mmx
+SDL_SOUND_CONF_OPTS += --disable-mmx
 endif
 
 define SDL_SOUND_REMOVE_PLAYSOUND
diff --git a/package/sdl_ttf/sdl_ttf.mk b/package/sdl_ttf/sdl_ttf.mk
--- a/package/sdl_ttf/sdl_ttf.mk
+++ b/package/sdl_ttf/sdl_ttf.mk
@@ -12,7 +12,7 @@
 
 SDL_TTF_INSTALL_STAGING = YES
 SDL_TTF_DEPENDENCIES = sdl freetype
-SDL_TTF_CONF_OPT = --without-x \
+SDL_TTF_CONF_OPTS = --without-x \
 		--with-freetype-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-prefix=$(STAGING_DIR)/usr
 
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -9,7 +9,7 @@
 SED_LICENSE = GPLv3
 SED_LICENSE_FILES = COPYING
 
-SED_CONF_OPT = --bindir=/usr/bin \
+SED_CONF_OPTS = --bindir=/usr/bin \
 		--libdir=/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -10,14 +10,14 @@
 SHARED_MIME_INFO_INSTALL_STAGING = YES
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
-SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
+SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
 SHARED_MIME_INFO_MAKE = $(MAKE1)
 SHARED_MIME_INFO_LICENSE = GPLv2
 SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
 HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-intltool
 
-HOST_SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
+HOST_SHARED_MIME_INFO_CONF_OPTS = --disable-update-mimedb
 HOST_SHARED_MIME_INFO_MAKE = $(MAKE1)
 
 define SHARED_MIME_INFO_INSTALL_TARGET_CMDS
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -11,6 +11,6 @@
 SISPMCTL_DEPENDENCIES = libusb-compat
 
 SISPMCTL_CONF_ENV = HAVELIBUSB=$(STAGING_DIR)/usr/bin/libusb-config
-SISPMCTL_CONF_OPT = --enable-webless
+SISPMCTL_CONF_OPTS = --enable-webless
 
 $(eval $(autotools-package))
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -13,32 +13,32 @@
 
 # Absolute path hell, sigh...
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-	SLANG_CONF_OPT += --with-png=$(STAGING_DIR)/usr
+	SLANG_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
 	SLANG_DEPENDENCIES += libpng
 else
-	SLANG_CONF_OPT += --with-png=no
+	SLANG_CONF_OPTS += --with-png=no
 endif
 ifeq ($(BR2_PACKAGE_PCRE),y)
-	SLANG_CONF_OPT += --with-pcre=$(STAGING_DIR)/usr
+	SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
 	SLANG_DEPENDENCIES += pcre
 else
-	SLANG_CONF_OPT += --with-pcre=no
+	SLANG_CONF_OPTS += --with-pcre=no
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-	SLANG_CONF_OPT += --with-z=$(STAGING_DIR)/usr
+	SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
 	SLANG_DEPENDENCIES += zlib
 else
-	SLANG_CONF_OPT += --with-z=no
+	SLANG_CONF_OPTS += --with-z=no
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 	SLANG_DEPENDENCIES += ncurses
 else
-	SLANG_CONF_OPT += ac_cv_path_nc5config=no
+	SLANG_CONF_OPTS += ac_cv_path_nc5config=no
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-	SLANG_CONF_OPT += --with-readline=gnu
+	SLANG_CONF_OPTS += --with-readline=gnu
 	SLANG_DEPENDENCIES += readline
 endif
 
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -9,7 +9,7 @@
 SMCROUTE_LICENSE = GPLv2+
 SMCROUTE_LICENSE_FILES = COPYING
 
-SMCROUTE_CONF_OPT = ac_cv_func_setpgrp_void=yes
+SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
 #BUG:The package Makefile uses CC?= even though the package is autotools based
 SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
 
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -11,15 +11,15 @@
 SNMPPP_INSTALL_STAGING = YES
 # no configure script in tarball
 SNMPPP_AUTORECONF = YES
-SNMPPP_CONF_OPT = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-logging)
+SNMPPP_CONF_OPTS = $(if $(BR2_PACKAGE_SNMPPP_LOGGING),--enable-logging,--disable-logging)
 SNMPPP_LICENSE = SNMP++
 SNMPPP_LICENSE_FILES = src/v3.cpp
 
 ifeq ($(BR2_PACKAGE_SNMPPP_SNMPV3),y)
-	SNMPPP_CONF_OPT += --enable-snmpv3
+	SNMPPP_CONF_OPTS += --enable-snmpv3
 	SNMPPP_DEPENDENCIES += openssl
 else
-	SNMPPP_CONF_OPT += --disable-snmpv3
+	SNMPPP_CONF_OPTS += --disable-snmpv3
 endif
 
 $(eval $(autotools-package))
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -24,13 +24,13 @@
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	SOCAT_DEPENDENCIES += openssl
 else
-	SOCAT_CONF_OPT += --disable-openssl
+	SOCAT_CONF_OPTS += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 	SOCAT_DEPENDENCIES += readline
 else
-	SOCAT_CONF_OPT += --disable-readline
+	SOCAT_CONF_OPTS += --disable-readline
 endif
 
 define SOCAT_RUN_AUTOCONF
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -13,7 +13,7 @@
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES = libconfig
 else
-SOCKETCAND_CONF_OPT = --without-config
+SOCKETCAND_CONF_OPTS = --without-config
 endif
 
 $(eval $(autotools-package))
diff --git a/package/sox/sox.mk b/package/sox/sox.mk
--- a/package/sox/sox.mk
+++ b/package/sox/sox.mk
@@ -7,92 +7,92 @@
 SOX_VERSION = 14.4.1
 SOX_SITE = http://downloads.sourceforge.net/project/sox/sox/$(SOX_VERSION)
 SOX_DEPENDENCIES = host-pkgconf
-SOX_CONF_OPT = --with-distro="Buildroot" --without-ffmpeg --disable-gomp
+SOX_CONF_OPTS = --with-distro="Buildroot" --without-ffmpeg --disable-gomp
 SOX_LICENSE = GPLv2+ (sox binary), LGPLv2.1+ (libraries)
 SOX_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
 SOX_DEPENDENCIES += alsa-lib
 else
-SOX_CONF_OPT += --without-alsa
+SOX_CONF_OPTS += --without-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_FILE),y)
 SOX_DEPENDENCIES += file
 else
-SOX_CONF_OPT += --without-magic
+SOX_CONF_OPTS += --without-magic
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
 SOX_DEPENDENCIES += flac
 else
-SOX_CONF_OPT += --without-flac
+SOX_CONF_OPTS += --without-flac
 endif
 
 ifeq ($(BR2_PACKAGE_LAME),y)
 SOX_DEPENDENCIES += lame
 else
-SOX_CONF_OPT += --without-lame
+SOX_CONF_OPTS += --without-lame
 endif
 
 ifeq ($(BR2_PACKAGE_LIBAO),y)
 SOX_DEPENDENCIES += libao
 else
-SOX_CONF_OPT += --without-ao
+SOX_CONF_OPTS += --without-ao
 endif
 
 ifeq ($(BR2_PACKAGE_LIBID3TAG),y)
 SOX_DEPENDENCIES += libid3tag
 else
-SOX_CONF_OPT += --without-id3tag
+SOX_CONF_OPTS += --without-id3tag
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
 SOX_DEPENDENCIES += libmad
 else
-SOX_CONF_OPT += --without-mad
+SOX_CONF_OPTS += --without-mad
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SOX_DEPENDENCIES += libpng
 else
-SOX_CONF_OPT += --without-png
+SOX_CONF_OPTS += --without-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 SOX_DEPENDENCIES += libsndfile
 else
-SOX_CONF_OPT += --without-sndfile
+SOX_CONF_OPTS += --without-sndfile
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 SOX_DEPENDENCIES += libvorbis
 else
-SOX_CONF_OPT += --without-oggvorbis
+SOX_CONF_OPTS += --without-oggvorbis
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCORE_AMR),y)
 SOX_DEPENDENCIES += opencore-amr
 else
-SOX_CONF_OPT += --without-amrwb --without-amrnb
+SOX_CONF_OPTS += --without-amrwb --without-amrnb
 endif
 
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 SOX_DEPENDENCIES += pulseaudio
 else
-SOX_CONF_OPT += --without-pulseaudio
+SOX_CONF_OPTS += --without-pulseaudio
 endif
 
 ifeq ($(BR2_PACKAGE_TWOLAME),y)
 SOX_DEPENDENCIES += twolame
 else
-SOX_CONF_OPT += --without-twolame
+SOX_CONF_OPTS += --without-twolame
 endif
 
 ifeq ($(BR2_PACKAGE_WAVPACK),y)
 SOX_DEPENDENCIES += wavpack
 else
-SOX_CONF_OPT += --without-wavpack
+SOX_CONF_OPTS += --without-wavpack
 endif
 
 $(eval $(autotools-package))
diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -11,7 +11,7 @@
 SPAWN_FCGI_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_INET_IPV6),y)
-SPAWN_FCGI_CONF_OPT = --disable-ipv6
+SPAWN_FCGI_CONF_OPTS = --disable-ipv6
 endif
 
 $(eval $(autotools-package))
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -11,16 +11,16 @@
 
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
-SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
+SPEEX_CONF_OPTS = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
 		 --with-ogg-includes=$(STAGING_DIR)/usr/include \
 		 --enable-fixed-point
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
-	SPEEX_CONF_OPT += --enable-arm4-asm
+	SPEEX_CONF_OPTS += --enable-arm4-asm
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
-	SPEEX_CONF_OPT += --enable-arm5e-asm
+	SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
 define SPEEX_LIBTOOL_FIXUP
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -21,7 +21,7 @@
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
-SPICE_CONF_OPT =            \
+SPICE_CONF_OPTS =            \
   --disable-opengl          \
   --disable-smartcard       \
   --disable-automated-tests \
@@ -30,24 +30,24 @@
 SPICE_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_SPICE_CLIENT),y)
-SPICE_CONF_OPT += --enable-client
+SPICE_CONF_OPTS += --enable-client
 SPICE_DEPENDENCIES += xlib_libXfixes xlib_libXrandr
 else
-SPICE_CONF_OPT += --disable-client
+SPICE_CONF_OPTS += --disable-client
 endif
 
 ifeq ($(BR2_PACKAGE_SPICE_GUI),y)
-SPICE_CONF_OPT += --enable-gui
+SPICE_CONF_OPTS += --enable-gui
 SPICE_DEPENDENCIES += cegui06
 else
-SPICE_CONF_OPT += --disable-gui
+SPICE_CONF_OPTS += --disable-gui
 endif
 
 ifeq ($(BR2_PACKAGE_SPICE_TUNNEL),y)
-SPICE_CONF_OPT += --enable-tunnel
+SPICE_CONF_OPTS += --enable-tunnel
 SPICE_DEPENDENCIES += slirp
 else
-SPICE_CONF_OPT += --disable-tunnel
+SPICE_CONF_OPTS += --disable-tunnel
 endif
 
 SPICE_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
@@ -75,6 +75,6 @@
 #     Note that NOEXECSTACK on a kernel with address space randomization
 #     is generally sufficient to prevent most buffer overflow exploits
 #     without increasing code size.
-SPICE_CONF_OPT += gl_cv_warn__fstack_protector_all=no
+SPICE_CONF_OPTS += gl_cv_warn__fstack_protector_all=no
 
 $(eval $(autotools-package))
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -14,7 +14,7 @@
 	LDFLAGS="$(TARGET_LDFLAGS) $(SQLCIPHER_LDFLAGS)" \
 	TCLSH_CMD=$(HOST_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
 
-SQLCIPHER_CONF_OPT = \
+SQLCIPHER_CONF_OPTS = \
 	--enable-threadsafe \
 	--localstatedir=/var
 
@@ -34,9 +34,9 @@
 
 ifeq ($(BR2_PACKAGE_SQLCIPHER_READLINE),y)
 SQLCIPHER_DEPENDENCIES += ncurses readline
-SQLCIPHER_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+SQLCIPHER_CONF_OPTS += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
 else
-SQLCIPHER_CONF_OPT += --disable-readline
+SQLCIPHER_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -39,24 +39,24 @@
 
 SQLITE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) $(SQLITE_CFLAGS)"
 
-SQLITE_CONF_OPT = \
+SQLITE_CONF_OPTS = \
 	--localstatedir=/var
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-SQLITE_CONF_OPT += --enable-dynamic-extensions=no
+SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-SQLITE_CONF_OPT += --enable-threadsafe
+SQLITE_CONF_OPTS += --enable-threadsafe
 else
-SQLITE_CONF_OPT += --disable-threadsafe
+SQLITE_CONF_OPTS += --disable-threadsafe
 endif
 
 ifeq ($(BR2_PACKAGE_SQLITE_READLINE),y)
 SQLITE_DEPENDENCIES += ncurses readline
-SQLITE_CONF_OPT += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
+SQLITE_CONF_OPTS += --with-readline-inc="-I$(STAGING_DIR)/usr/include"
 else
-SQLITE_CONF_OPT += --disable-readline
+SQLITE_CONF_OPTS += --disable-readline
 endif
 
 $(eval $(autotools-package))
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -17,7 +17,7 @@
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
 			ac_cv_func_va_copy=yes ac_cv_func___va_copy=yes \
 			ac_cv_func_strnstr=no ac_cv_have_squid=yes
-SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
+SQUID_CONF_OPTS =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-removal-policies="lru,heap" \
 			--with-filedescriptors=1024 --disable-ident-lookups \
 			--with-krb5-config=no \
@@ -34,7 +34,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	SQUID_CONF_OPT += --enable-ssl
+	SQUID_CONF_OPTS += --enable-ssl
 	SQUID_DEPENDENCIES += openssl
 endif
 
diff --git a/package/startup-notification/startup-notification.mk b/package/startup-notification/startup-notification.mk
--- a/package/startup-notification/startup-notification.mk
+++ b/package/startup-notification/startup-notification.mk
@@ -9,7 +9,7 @@
 STARTUP_NOTIFICATION_INSTALL_STAGING = YES
 STARTUP_NOTIFICATION_DEPENDENCIES = xlib_libX11
 STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
-STARTUP_NOTIFICATION_CONF_OPT = --with-x \
+STARTUP_NOTIFICATION_CONF_OPTS = --with-x \
 	--x-includes="$(STAGING_DIR)/usr/include/X11" \
 	--x-libraries="$(STAGING_DIR)/usr/lib"
 STARTUP_NOTIFICATION_LICENSE = LGPLv2
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -19,7 +19,7 @@
 # --disable-static explicitly to get stress linked dynamically.
 #
 # Also, disable documentation by undefining makeinfo
-STRESS_CONF_OPT = \
+STRESS_CONF_OPTS = \
 	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static) \
 	MAKEINFO=:
 
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,7 +10,7 @@
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_DEPENDENCIES = host-pkgconf
-STRONGSWAN_CONF_OPT +=                                                             \
+STRONGSWAN_CONF_OPTS +=                                                             \
       --without-lib-prefix                                                         \
       --enable-pkcs11=yes                                                          \
       --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
@@ -32,7 +32,7 @@
       --enable-scripts=$(if $(BR2_PACKAGE_STRONGSWAN_SCRIPTS),yes,no)
 
 ifeq ($(BR2_PACKAGE_STRONGSWAN_EAP),y)
-STRONGSWAN_CONF_OPT +=              \
+STRONGSWAN_CONF_OPTS +=              \
       --enable-eap-sim              \
       --enable-eap-sim-file         \
       --enable-eap-aka              \
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -7,7 +7,7 @@
 STUNNEL_VERSION = 5.03
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/5.x
 STUNNEL_DEPENDENCIES = openssl
-STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
+STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
 STUNNEL_LICENSE = GPLv2+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -10,7 +10,7 @@
 SUBVERSION_LICENSE_FILES = LICENSE
 
 SUBVERSION_DEPENDENCIES = apr apr-util expat neon zlib
-SUBVERSION_CONF_OPT = \
+SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -10,7 +10,7 @@
 SUDO_LICENSE_FILES = doc/LICENSE
 # Ships a non-release libtool that isn't patch-friendly
 SUDO_AUTORECONF = YES
-SUDO_CONF_OPT = \
+SUDO_CONF_OPTS = \
 		--without-lecture \
 		--without-sendmail \
 		--without-umask \
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -8,7 +8,7 @@
 SWIG_VERSION = $(SWIG_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
-HOST_SWIG_CONF_OPT = \
+HOST_SWIG_CONF_OPTS = \
 	--without-pcre \
 	--disable-ccache \
 	--without-octave
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -10,7 +10,7 @@
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPLv2+ (executables), LGPLv2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
-SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme
+SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
 # Remove the -I$(includedir) from the Makefiles
@@ -25,9 +25,9 @@
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SYLPHEED_DEPENDENCIES += openssl
-SYLPHEED_CONF_OPT += --enable-ssl
+SYLPHEED_CONF_OPTS += --enable-ssl
 else
-SYLPHEED_CONF_OPT += --disable-ssl
+SYLPHEED_CONF_OPTS += --disable-ssl
 endif
 
 $(eval $(autotools-package))
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -7,7 +7,7 @@
 SYNERGY_VERSION = 1.3.1
 SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
 SYNERGY_AUTORECONF = YES
-SYNERGY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+SYNERGY_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
                    --x-libraries=$(STAGING_DIR)/usr/lib
 SYNERGY_DEPENDENCIES = xlib_libXtst \
 		$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -7,7 +7,7 @@
 SYSSTAT_VERSION = 11.0.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
-SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
+SYSSTAT_CONF_OPTS = --disable-man-group --disable-sensors
 SYSSTAT_DEPENDENCIES = host-gettext
 SYSSTAT_LICENSE = GPLv2+
 SYSSTAT_LICENSE_FILES = COPYING
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -26,7 +26,7 @@
 SYSTEMD_DEPENDENCIES += busybox
 endif
 
-SYSTEMD_CONF_OPT += \
+SYSTEMD_CONF_OPTS += \
 	--with-rootprefix= \
 	--with-rootlibdir=/lib \
 	--localstatedir=/var \
@@ -57,42 +57,42 @@
 	ac_cv_path_KMOD=/usr/bin/kmod
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
-SYSTEMD_CONF_OPT += --enable-compat-libs
+SYSTEMD_CONF_OPTS += --enable-compat-libs
 else
-SYSTEMD_CONF_OPT += --disable-compat-libs
+SYSTEMD_CONF_OPTS += --disable-compat-libs
 endif
 
 ifeq ($(BR2_PACKAGE_ACL),y)
-SYSTEMD_CONF_OPT += --enable-acl
+SYSTEMD_CONF_OPTS += --enable-acl
 SYSTEMD_DEPENDENCIES += acl
 else
-SYSTEMD_CONF_OPT += --disable-acl
+SYSTEMD_CONF_OPTS += --disable-acl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-SYSTEMD_CONF_OPT += --enable-gudev
+SYSTEMD_CONF_OPTS += --enable-gudev
 SYSTEMD_DEPENDENCIES += libglib2
 else
-SYSTEMD_CONF_OPT += --disable-gudev
+SYSTEMD_CONF_OPTS += --disable-gudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-SYSTEMD_CONF_OPT += --enable-seccomp
+SYSTEMD_CONF_OPTS += --enable-seccomp
 SYSTEMD_DEPENDENCIES += libseccomp
 else
-SYSTEMD_CONF_OPT += --disable-seccomp
+SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
 SYSTEMD_DEPENDENCIES += \
 	xz 		\
 	libgcrypt
-SYSTEMD_CONF_OPT += 	\
+SYSTEMD_CONF_OPTS += 	\
 	--enable-xz 	\
 	--enable-gcrypt	\
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-SYSTEMD_CONF_OPT += 	\
+SYSTEMD_CONF_OPTS += 	\
 	--disable-xz 	\
 	--disable-gcrypt
 endif
@@ -100,17 +100,17 @@
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY),y)
 SYSTEMD_DEPENDENCIES += libmicrohttpd
 else
-SYSTEMD_CONF_OPT += --disable-microhttpd
+SYSTEMD_CONF_OPTS += --disable-microhttpd
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
-SYSTEMD_CONF_OPT += --enable-networkd
+SYSTEMD_CONF_OPTS += --enable-networkd
 define SYSTEMD_INSTALL_RESOLVCONF_HOOK
 	ln -sf ../run/systemd/resolve/resolv.conf \
 		$(TARGET_DIR)/etc/resolv.conf
 endef
 else
-SYSTEMD_CONF_OPT += --disable-networkd
+SYSTEMD_CONF_OPTS += --disable-networkd
 define SYSTEMD_INSTALL_SERVICE_NETWORK
 	$(INSTALL) -D -m 644 package/systemd/network.service \
 		$(TARGET_DIR)/etc/systemd/system/network.service
@@ -121,20 +121,20 @@
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
-SYSTEMD_CONF_OPT += --enable-timesyncd
+SYSTEMD_CONF_OPTS += --enable-timesyncd
 define SYSTEMD_INSTALL_SERVICE_TIMESYNC
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
 	ln -sf ../../../../lib/systemd/system/systemd-timesyncd.service \
 		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service
 endef
 else
-SYSTEMD_CONF_OPT += --disable-timesyncd
+SYSTEMD_CONF_OPTS += --disable-timesyncd
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_SMACK_SUPPORT),y)
-SYSTEMD_CONF_OPT += --enable-smack
+SYSTEMD_CONF_OPTS += --enable-smack
 else
-SYSTEMD_CONF_OPT += --disable-smack
+SYSTEMD_CONF_OPTS += --disable-smack
 endif
 
 # mq_getattr needs -lrt
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -15,11 +15,11 @@
 endif
 
 ifeq ($(BR2_PACKAGE_TAGLIB_ASF),y)
-TAGLIB_CONF_OPT += -DWITH_ASF=ON
+TAGLIB_CONF_OPTS += -DWITH_ASF=ON
 endif
 
 ifeq ($(BR2_PACKAGE_TAGLIB_MP4),y)
-TAGLIB_CONF_OPT += -DWITH_MP4=ON
+TAGLIB_CONF_OPTS += -DWITH_MP4=ON
 endif
 
 define TAGLIB_REMOVE_DEVFILE
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -18,13 +18,13 @@
 # in the sqlite package (which gets removed if sqlite not
 # configured).  Don't need to worry about conditionally including
 # it in the configure options
-TCL_CONF_OPT = \
+TCL_CONF_OPTS = \
 		--disable-symbols \
 		--disable-langinfo \
 		--disable-framework \
 		--with-system-sqlite
 
-HOST_TCL_CONF_OPT = \
+HOST_TCL_CONF_OPTS = \
 		--disable-symbols \
 		--disable-langinfo \
 		--disable-framework
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -9,7 +9,7 @@
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
 TCPDUMP_CONF_ENV = ac_cv_linux_vers=2 td_cv_buggygetaddrinfo=no
-TCPDUMP_CONF_OPT = --without-crypto \
+TCPDUMP_CONF_OPTS = --without-crypto \
 		$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = zlib libpcap
 
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -12,7 +12,7 @@
 	tr_cv_libpcap_version=">= 0.7.0" \
 	ac_cv_have_bpf=no \
 	$(call AUTOCONF_AC_CHECK_FILE_VAL,$(STAGING_DIR)/usr/include/pcap-netmap.c)=no
-TCPREPLAY_CONF_OPT = --with-libpcap=$(STAGING_DIR)/usr
+TCPREPLAY_CONF_OPTS = --with-libpcap=$(STAGING_DIR)/usr
 TCPREPLAY_DEPENDENCIES = libpcap
 
 # libpcap may depend on symbols in other libs
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -7,10 +7,10 @@
 TFTPD_VERSION  = 5.2
 TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.xz
 TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
-TFTPD_CONF_OPT = --without-tcpwrappers
+TFTPD_CONF_OPTS = --without-tcpwrappers
 
 ifneq ($(BR2_INET_IPV6),y)
-TFTPD_CONF_OPT += --without-ipv6
+TFTPD_CONF_OPTS += --without-ipv6
 endif
 
 define TFTPD_INSTALL_TARGET_CMDS
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -10,9 +10,9 @@
 THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
 	host-zlib host-bison host-flex
-THRIFT_CONF_OPT = --with-sysroot=$(STAGING_DIR) --with-tests=no \
+THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) --with-tests=no \
 	--with-boost=$(STAGING_DIR)
-HOST_THRIFT_CONF_OPT = --with-sysroot=$(HOST_DIR) --with-tests=no
+HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) --with-tests=no
 THRIFT_AUTORECONF = YES
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
@@ -25,17 +25,17 @@
 # Language selection
 # The generator (host tool) works with all of them regardless
 # This is just for the libraries / bindings
-THRIFT_LANG_CONF_OPT += --without-csharp --without-java --without-erlang \
+THRIFT_LANG_CONF_OPTS += --without-csharp --without-java --without-erlang \
 	--without-python --without-perl --without-php --without-php_extension \
 	--without-ruby --without-haskell --without-go --without-d --without-qt4
-HOST_THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT) --without-c_glib
-THRIFT_CONF_OPT += $(THRIFT_LANG_CONF_OPT)
+HOST_THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS) --without-c_glib
+THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS)
 
 # C bindings
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 THRIFT_DEPENDENCIES += libglib2
 else
-THRIFT_CONF_OPT += --without-c_glib
+THRIFT_CONF_OPTS += --without-c_glib
 endif
 
 # De-hardcode THRIFT for cross compiling
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -9,7 +9,7 @@
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_INSTALL_STAGING = YES
-TIFF_CONF_OPT = \
+TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x \
 
@@ -24,55 +24,55 @@
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
-	TIFF_CONF_OPT += --disable-ccitt
+	TIFF_CONF_OPTS += --disable-ccitt
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
-	TIFF_CONF_OPT += --disable-packbits
+	TIFF_CONF_OPTS += --disable-packbits
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_LZW),y)
-	TIFF_CONF_OPT += --disable-lzw
+	TIFF_CONF_OPTS += --disable-lzw
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_THUNDER),y)
-	TIFF_CONF_OPT += --disable-thunder
+	TIFF_CONF_OPTS += --disable-thunder
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_NEXT),y)
-	TIFF_CONF_OPT += --disable-next
+	TIFF_CONF_OPTS += --disable-next
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_LOGLUV),y)
-	TIFF_CONF_OPT += --disable-logluv
+	TIFF_CONF_OPTS += --disable-logluv
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_MDI),y)
-	TIFF_CONF_OPT += --disable-mdi
+	TIFF_CONF_OPTS += --disable-mdi
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_ZLIB),y)
-	TIFF_CONF_OPT += --disable-zlib
+	TIFF_CONF_OPTS += --disable-zlib
 else
 	TIFF_DEPENDENCIES += zlib
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_PIXARLOG),y)
-	TIFF_CONF_OPT += --disable-pixarlog
+	TIFF_CONF_OPTS += --disable-pixarlog
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_JPEG),y)
-	TIFF_CONF_OPT += --disable-jpeg
+	TIFF_CONF_OPTS += --disable-jpeg
 else
 	TIFF_DEPENDENCIES += jpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_OLD_JPEG),y)
-	TIFF_CONF_OPT += --disable-old-jpeg
+	TIFF_CONF_OPTS += --disable-old-jpeg
 endif
 
 ifneq ($(BR2_PACKAGE_TIFF_JBIG),y)
-	TIFF_CONF_OPT += --disable-jbig
+	TIFF_CONF_OPTS += --disable-jbig
 endif
 
 define TIFF_INSTALL_TARGET_CMDS
diff --git a/package/tn5250/tn5250.mk b/package/tn5250/tn5250.mk
--- a/package/tn5250/tn5250.mk
+++ b/package/tn5250/tn5250.mk
@@ -12,10 +12,10 @@
 TN5250_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	TN5250_CONF_OPT += --with-ssl-dir=$(STAGING_DIR)/usr
+	TN5250_CONF_OPTS += --with-ssl-dir=$(STAGING_DIR)/usr
 	TN5250_DEPENDENCIES += openssl
 else
-	TN5250_CONF_OPT += --without-ssl
+	TN5250_CONF_OPTS += --without-ssl
 endif
 
 define TN5250_INSTALL_FIXES
diff --git a/package/torsmo/torsmo.mk b/package/torsmo/torsmo.mk
--- a/package/torsmo/torsmo.mk
+++ b/package/torsmo/torsmo.mk
@@ -11,7 +11,7 @@
 
 # help2man doesn't work when cross compiling
 TORSMO_CONF_ENV = ac_cv_path_HELP2MAN=''
-TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
+TORSMO_CONF_OPTS = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
 
 TORSMO_DEPENDENCIES = xlib_libX11 xlib_libXext
 
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -15,26 +15,26 @@
 	openssl \
 	zlib
 TRANSMISSION_AUTORECONF = YES
-TRANSMISSION_CONF_OPT = \
+TRANSMISSION_CONF_OPTS = \
 	--disable-libnotify \
 	--enable-lightweight
 TRANSMISSION_LICENSE = GPLv2 or GPLv3 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
-	TRANSMISSION_CONF_OPT += --enable-utp
+	TRANSMISSION_CONF_OPTS += --enable-utp
 else
-	TRANSMISSION_CONF_OPT += --disable-utp
+	TRANSMISSION_CONF_OPTS += --disable-utp
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_CLI),y)
-	TRANSMISSION_CONF_OPT += --enable-cli
+	TRANSMISSION_CONF_OPTS += --enable-cli
 else
-	TRANSMISSION_CONF_OPT += --disable-cli
+	TRANSMISSION_CONF_OPTS += --disable-cli
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
-	TRANSMISSION_CONF_OPT += --enable-daemon
+	TRANSMISSION_CONF_OPTS += --enable-daemon
 
 define TRANSMISSION_INSTALL_INIT_SYSV
 	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
@@ -43,20 +43,20 @@
 endef
 
 else
-	TRANSMISSION_CONF_OPT += --disable-daemon
+	TRANSMISSION_CONF_OPTS += --disable-daemon
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_REMOTE),y)
-	TRANSMISSION_CONF_OPT += --enable-remote
+	TRANSMISSION_CONF_OPTS += --enable-remote
 else
-	TRANSMISSION_CONF_OPT += --disable-remote
+	TRANSMISSION_CONF_OPTS += --disable-remote
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
-	TRANSMISSION_CONF_OPT += --enable-gtk
+	TRANSMISSION_CONF_OPTS += --enable-gtk
 	TRANSMISSION_DEPENDENCIES += libgtk2
 else
-	TRANSMISSION_CONF_OPT += --disable-gtk
+	TRANSMISSION_CONF_OPTS += --disable-gtk
 endif
 
 $(eval $(autotools-package))
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -20,10 +20,10 @@
 	lvm2		\
 	libatasmart
 
-UDISKS_CONF_OPT = --disable-remote-access --disable-man-pages
+UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
 
 ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
-UDISKS_CONF_OPT += --enable-lvm2
+UDISKS_CONF_OPTS += --enable-lvm2
 endif
 
 $(eval $(autotools-package))
diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,7 @@
 ULOGD_VERSION = 2.0.4
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
+ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
 ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
@@ -18,16 +18,16 @@
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-	ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
+	ULOGD_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
 	ULOGD_DEPENDENCIES += mysql
 else
-	ULOGD_CONF_OPT += --with-mysql=no
+	ULOGD_CONF_OPTS += --with-mysql=no
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	ULOGD_DEPENDENCIES += sqlite
 endif
 else
-	ULOGD_CONF_OPT += --with-mysql=no --without-sqlite
+	ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
 endif
 
 $(eval $(autotools-package))
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -14,10 +14,10 @@
 
 ifeq ($(BR2_PACKAGE_SDL)$(BR2_PACKAGE_SDL_NET),yy)
 URG_DEPENDENCIES += sdl sdl_net
-URG_CONF_OPT += --with-sdl-prefix=$(STAGING_DIR)/usr \
+URG_CONF_OPTS += --with-sdl-prefix=$(STAGING_DIR)/usr \
 		--with-sdl-exec-prefix=$(STAGING_DIR)/usr
 else
-URG_CONF_OPT = --without-sdl
+URG_CONF_OPTS = --without-sdl
 URG_CONF_ENV += ac_cv_path_SDL_CONFIG=""
 endif
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -15,7 +15,7 @@
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
 else
-	USBUTILS_CONF_OPT = --disable-zlib
+	USBUTILS_CONF_OPTS = --disable-zlib
 endif
 
 # Build after busybox since it's got a lightweight lsusb
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -18,7 +18,7 @@
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
 UTIL_LINUX_CONF_ENV = scanf_cv_type_modifier=no
-UTIL_LINUX_CONF_OPT += \
+UTIL_LINUX_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown \
 	--disable-bash-completion \
@@ -28,7 +28,7 @@
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
-HOST_UTIL_LINUX_CONF_OPT = --without-python
+HOST_UTIL_LINUX_CONF_OPTS = --without-python
 
 # If both util-linux and busybox are selected, make certain util-linux
 # wins the fight over who gets to have their utils actually installed
@@ -39,7 +39,7 @@
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
 else
-UTIL_LINUX_CONF_OPT += --without-ncurses
+UTIL_LINUX_CONF_OPTS += --without-ncurses
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
@@ -58,7 +58,7 @@
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
 # Disable/Enable utilities
-UTIL_LINUX_CONF_OPT += \
+UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
@@ -92,7 +92,7 @@
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them.
-HOST_UTIL_LINUX_CONF_OPT += \
+HOST_UTIL_LINUX_CONF_OPTS += \
 	--enable-libuuid \
 	--disable-libblkid --disable-libmount \
 	--disable-all-programs --without-ncurses
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -9,7 +9,7 @@
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
-VALGRIND_CONF_OPT = --disable-tls
+VALGRIND_CONF_OPTS = --disable-tls
 VALGRIND_AUTORECONF = YES
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
@@ -18,7 +18,7 @@
 # ARMv7. The valgrind package is guaranteed, through Config.in, to
 # only be selected on Cortex A8 and Cortex A9 platforms.
 ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
-VALGRIND_CONF_OPT += \
+VALGRIND_CONF_OPTS += \
 	--host=$(patsubst arm-%,armv7-%,$(GNU_TARGET_NAME))
 endif
 
diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -25,7 +25,7 @@
 #
 # Note: disabled features can be added with corresponding dependencies
 #       in future commits.
-VDE2_CONF_OPT = --disable-experimental  \
+VDE2_CONF_OPTS = --disable-experimental  \
                 --disable-cryptcab      \
                 --disable-pcap          \
                 --disable-python        \
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -20,7 +20,7 @@
 		ac_cv_sizeof_int=4 \
 		ac_cv_small_wchar_t=no
 # GUI/X11 headers leak from the host so forcibly disable them
-VIM_CONF_OPT = --with-tlib=ncurses --enable-gui=no --without-x
+VIM_CONF_OPTS = --with-tlib=ncurses --enable-gui=no --without-x
 VIM_LICENSE = Charityware
 VIM_LICENSE_FILES = README.txt
 
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -23,7 +23,7 @@
 endef
 VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
 
-VLC_CONF_OPT += \
+VLC_CONF_OPTS += \
 	--disable-a52 \
 	--disable-shout \
 	--disable-twolame \
@@ -46,188 +46,188 @@
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-VLC_CONF_OPT += --disable-static
+VLC_CONF_OPTS += --disable-static
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-VCL_CONF_OPT += --enable-altivec
+VCL_CONF_OPTS += --enable-altivec
 else
-VLC_CONF_OPT += --disable-altivec
+VLC_CONF_OPTS += --disable-altivec
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-VLC_CONF_OPT += --enable-alsa
+VLC_CONF_OPTS += --enable-alsa
 VLC_DEPENDENCIES += alsa-lib
 else
-VLC_CONF_OPT += --disable-alsa
+VLC_CONF_OPTS += --disable-alsa
 endif
 
 # bonjour support needs avahi-client, which needs avahi-daemon and dbus
 ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
-VLC_CONF_OPT += --enable-bonjour
+VLC_CONF_OPTS += --enable-bonjour
 VLC_DEPENDENCIES += avahi dbus
 else
-VLC_CONF_OPT += --disable-bonjour
+VLC_CONF_OPTS += --disable-bonjour
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-VLC_CONF_OPT += --enable-dbus
+VLC_CONF_OPTS += --enable-dbus
 VLC_DEPENDENCIES += dbus
 else
-VLC_CONF_OPT += --disable-dbus
+VLC_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-VLC_CONF_OPT += --enable-directfb
+VLC_CONF_OPTS += --enable-directfb
 VLC_DEPENDENCIES += directfb
 else
-VLC_CONF_OPT += --disable-directfb
+VLC_CONF_OPTS += --disable-directfb
 endif
 
 ifeq ($(BR2_PACKAGE_FAAD2),y)
-VLC_CONF_OPT += --enable-faad
+VLC_CONF_OPTS += --enable-faad
 VLC_DEPENDENCIES += faad2
 else
-VLC_CONF_OPT += --disable-faad
+VLC_CONF_OPTS += --disable-faad
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-VLC_CONF_OPT += --enable-avcodec
+VLC_CONF_OPTS += --enable-avcodec
 VLC_DEPENDENCIES += ffmpeg
 else
-VLC_CONF_OPT += --disable-avcodec
+VLC_CONF_OPTS += --disable-avcodec
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
-VLC_CONF_OPT += --enable-postproc
+VLC_CONF_OPTS += --enable-postproc
 else
-VLC_CONF_OPT += --disable-postproc
+VLC_CONF_OPTS += --disable-postproc
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
-VLC_CONF_OPT += --enable-swscale
+VLC_CONF_OPTS += --enable-swscale
 else
-VLC_CONF_OPT += --disable-swscale
+VLC_CONF_OPTS += --disable-swscale
 endif
 
 ifeq ($(BR2_PACKAGE_FLAC),y)
-VLC_CONF_OPT += --enable-flac
+VLC_CONF_OPTS += --enable-flac
 VLC_DEPENDENCIES += flac
 else
-VLC_CONF_OPT += --disable-flac
+VLC_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-VLC_CONF_OPT += --enable-glx
+VLC_CONF_OPTS += --enable-glx
 VLC_DEPENDENCIES += libgl
 else
-VLC_CONF_OPT += --disable-glx
+VLC_CONF_OPTS += --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_OPUS),y)
-VLC_CONF_OPT += --enable-opus
+VLC_CONF_OPTS += --enable-opus
 VLC_DEPENDENCIES += libvorbis opus
 else
-VLC_CONF_OPT += --disable-opus
+VLC_CONF_OPTS += --disable-opus
 endif
 
 ifeq ($(BR2_PACKAGE_LIBASS),y)
-VLC_CONF_OPT += --enable-libass
+VLC_CONF_OPTS += --enable-libass
 VLC_DEPENDENCIES += libass
 else
-VLC_CONF_OPT += --disable-libass
+VLC_CONF_OPTS += --disable-libass
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-VLC_CONF_OPT += --enable-libgcrypt
+VLC_CONF_OPTS += --enable-libgcrypt
 VLC_DEPENDENCIES += libgcrypt
 VLC_CONF_ENV += \
 	GCRYPT_CONFIG="$(STAGING_DIR)/usr/bin/libgcrypt-config"
 else
-VLC_CONF_OPT += --disable-libgcrypt
+VLC_CONF_OPTS += --disable-libgcrypt
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMAD),y)
-VLC_CONF_OPT += --enable-mad
+VLC_CONF_OPTS += --enable-mad
 VLC_DEPENDENCIES += libmad
 else
-VLC_CONF_OPT += --disable-mad
+VLC_CONF_OPTS += --disable-mad
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
-VLC_CONF_OPT += --enable-mod
+VLC_CONF_OPTS += --enable-mod
 VLC_DEPENDENCIES += libmodplug
 else
-VLC_CONF_OPT += --disable-mod
+VLC_CONF_OPTS += --disable-mod
 endif
 
 ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
-VLC_CONF_OPT += --enable-libmpeg2
+VLC_CONF_OPTS += --enable-libmpeg2
 VLC_DEPENDENCIES += libmpeg2
 else
-VLC_CONF_OPT += --disable-libmpeg2
+VLC_CONF_OPTS += --disable-libmpeg2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-VLC_CONF_OPT += --enable-png
+VLC_CONF_OPTS += --enable-png
 VLC_DEPENDENCIES += libpng
 else
-VLC_CONF_OPT += --disable-png
+VLC_CONF_OPTS += --disable-png
 endif
 
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
-VLC_CONF_OPT += --enable-svg
+VLC_CONF_OPTS += --enable-svg
 VLC_DEPENDENCIES += librsvg
 else
-VLC_CONF_OPT += --disable-svg
+VLC_CONF_OPTS += --disable-svg
 endif
 
 ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
-VLC_CONF_OPT += --enable-theora
+VLC_CONF_OPTS += --enable-theora
 VLC_DEPENDENCIES += libtheora
 else
-VLC_CONF_OPT += --disable-theora
+VLC_CONF_OPTS += --disable-theora
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUPNP),y)
-VLC_CONF_OPT += --enable-upnp
+VLC_CONF_OPTS += --enable-upnp
 VLC_DEPENDENCIES += libupnp
 else
-VLC_CONF_OPT += --disable-upnp
+VLC_CONF_OPTS += --disable-upnp
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-VLC_CONF_OPT += --enable-vorbis
+VLC_CONF_OPTS += --enable-vorbis
 VLC_DEPENDENCIES += libvorbis
 else
-VLC_CONF_OPT += --disable-vorbis
+VLC_CONF_OPTS += --disable-vorbis
 endif
 
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
-VLC_CONF_OPT += --enable-v4l2
+VLC_CONF_OPTS += --enable-v4l2
 VLC_DEPENDENCIES += libv4l
 else
-VLC_CONF_OPT += --disable-v4l2
+VLC_CONF_OPTS += --disable-v4l2
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXCB),y)
-VLC_CONF_OPT += --enable-xcb
+VLC_CONF_OPTS += --enable-xcb
 VLC_DEPENDENCIES += libxcb
 else
-VLC_CONF_OPT += --disable-xcb
+VLC_CONF_OPTS += --disable-xcb
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
-VLC_CONF_OPT += --enable-libxml2
+VLC_CONF_OPTS += --enable-libxml2
 VLC_DEPENDENCIES += libxml2
 else
-VLC_CONF_OPT += --disable-libxml2
+VLC_CONF_OPTS += --disable-libxml2
 endif
 
 # live555 installs a static library only, and vlc tries to link it into a
 # shared library - which doesn't work. So only enable live555 if static.
 ifeq ($(BR2_PACKAGE_LIVE555)$(BR2_PREFER_STATIC_LIB),yy)
-VLC_CONF_OPT += --enable-live555
+VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
 VLC_CONF_ENV += \
 	LIVE555_CFLAGS="\
@@ -239,63 +239,63 @@
 		" \
 	LIVE555_LIBS="-L$(STAGING_DIR)/usr/lib -lliveMedia"
 else
-VLC_CONF_OPT += --disable-live555
+VLC_CONF_OPTS += --disable-live555
 endif
 
 ifeq ($(BR2_PACKAGE_LUA),y)
-VLC_CONF_OPT += --enable-lua
+VLC_CONF_OPTS += --enable-lua
 VLC_DEPENDENCIES += lua host-lua
 else
-VLC_CONF_OPT += --disable-lua
+VLC_CONF_OPTS += --disable-lua
 endif
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-VLC_CONF_OPT += --enable-qt
+VLC_CONF_OPTS += --enable-qt
 VLC_DEPENDENCIES += qt
 else
-VLC_CONF_OPT += --disable-qt
+VLC_CONF_OPTS += --disable-qt
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_X11),y)
-VLC_CONF_OPT += --enable-sdl
+VLC_CONF_OPTS += --enable-sdl
 VLC_DEPENDENCIES += sdl
 else
-VLC_CONF_OPT += --disable-sdl
+VLC_CONF_OPTS += --disable-sdl
 endif
 
 ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
-VLC_CONF_OPT += --enable-sdl-image
+VLC_CONF_OPTS += --enable-sdl-image
 VLC_DEPENDENCIES += sdl_image
 else
-VLC_CONF_OPT += --disable-sdl-image
+VLC_CONF_OPTS += --disable-sdl-image
 endif
 
 ifeq ($(BR2_PACKAGE_SPEEX),y)
-VLC_CONF_OPT += --enable-speex
+VLC_CONF_OPTS += --enable-speex
 VLC_DEPENDENCIES += speex
 else
-VLC_CONF_OPT += --disable-speex
+VLC_CONF_OPTS += --disable-speex
 endif
 
 ifeq ($(BR2_PACKAGE_TREMOR),y)
-VLC_CONF_OPT += --enable-tremor
+VLC_CONF_OPTS += --enable-tremor
 VLC_DEPENDENCIES += tremor
 else
-VLC_CONF_OPT += --disable-tremor
+VLC_CONF_OPTS += --disable-tremor
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-VLC_CONF_OPT += --enable-udev
+VLC_CONF_OPTS += --enable-udev
 VLC_DEPENDENCIES += udev
 else
-VLC_CONF_OPT += --disable-udev
+VLC_CONF_OPTS += --disable-udev
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-VLC_CONF_OPT += --with-x
+VLC_CONF_OPTS += --with-x
 VLC_DEPENDENCIES += xlib_libX11
 else
-VLC_CONF_OPT += --without-x
+VLC_CONF_OPTS += --without-x
 endif
 
 $(eval $(autotools-package))
diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -20,16 +20,16 @@
 VO_AACENC_CFLAGS += -marm
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-VO_AACENC_CONF_OPT += --enable-armv7neon
+VO_AACENC_CONF_OPTS += --enable-armv7neon
 # mfpu=neon needed to assemble neon code
 VO_AACENC_CFLAGS += -mfpu=neon
 else
-VO_AACENC_CONF_OPT += --disable-armv7neon
+VO_AACENC_CONF_OPTS += --disable-armv7neon
 
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
-VO_AACENC_CONF_OPT += --enable-armv5e
+VO_AACENC_CONF_OPTS += --enable-armv5e
 else
-VO_AACENC_CONF_OPT += --disable-armv5e
+VO_AACENC_CONF_OPTS += --disable-armv5e
 endif
 
 endif # !neon
diff --git a/package/vorbis-tools/vorbis-tools.mk b/package/vorbis-tools/vorbis-tools.mk
--- a/package/vorbis-tools/vorbis-tools.mk
+++ b/package/vorbis-tools/vorbis-tools.mk
@@ -9,7 +9,7 @@
 VORBIS_TOOLS_LICENSE = GPLv2
 VORBIS_TOOLS_LICENSE_FILES = COPYING
 VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
-VORBIS_TOOLS_CONF_OPT = --program-transform-name=''
+VORBIS_TOOLS_CONF_OPTS = --program-transform-name=''
 # ogg123 calls math functions but forgets to link with libm
 VORBIS_TOOLS_CONF_ENV = LIBS=-lm
 
diff --git a/package/vtun/vtun.mk b/package/vtun/vtun.mk
--- a/package/vtun/vtun.mk
+++ b/package/vtun/vtun.mk
@@ -9,7 +9,7 @@
 VTUN_DEPENDENCIES = host-bison host-flex zlib lzo openssl
 VTUN_AUTORECONF = YES
 
-VTUN_CONF_OPT = \
+VTUN_CONF_OPTS = \
 		--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
 		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 		--with-lzo-lib=$(STAGING_DIR)/usr/lib
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -14,7 +14,7 @@
 WAYLAND_DEPENDENCIES = libffi host-pkgconf host-wayland expat
 
 # wayland-scanner is only needed for building, not on the target
-WAYLAND_CONF_OPT = --disable-scanner
+WAYLAND_CONF_OPTS = --disable-scanner
 
 # We must provide a specialy-crafted wayland-scanner .pc file
 # which we vampirise and adapt from the host-wayland copy
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -39,7 +39,7 @@
 	CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-cast-align -Wno-sign-compare" \
 	AR_FLAGS="cru"
 
-WEBKIT_CONF_OPT += \
+WEBKIT_CONF_OPTS += \
 	--with-gtk=2.0 \
 	--disable-geolocation \
 	--disable-webkit2 \
@@ -49,24 +49,24 @@
 	--disable-tests
 
 # Xorg Dependencies
-WEBKIT_CONF_OPT += --with-target=x11
+WEBKIT_CONF_OPTS += --with-target=x11
 WEBKIT_DEPENDENCIES += xlib_libXt
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGLES),yy)
-WEBKIT_CONF_OPT += --enable-gles2
+WEBKIT_CONF_OPTS += --enable-gles2
 WEBKIT_DEPENDENCIES += libegl libgles
 else
-WEBKIT_CONF_OPT += --disable-gles2
+WEBKIT_CONF_OPTS += --disable-gles2
 endif
 
 # gles/egl support is prefered over opengl by webkit configure
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-WEBKIT_CONF_OPT += --with-acceleration-backend=opengl
+WEBKIT_CONF_OPTS += --with-acceleration-backend=opengl
 WEBKIT_DEPENDENCIES += libgl
 else
 # OpenGL/glx is auto-detected due to the presence of gl.h/glx.h, which is not
 # enough, so disable glx and the use of the OpenGL acceleration backend here
-WEBKIT_CONF_OPT += --disable-glx --with-acceleration-backend=none
+WEBKIT_CONF_OPTS += --disable-glx --with-acceleration-backend=none
 endif
 
 $(eval $(autotools-package))
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -11,7 +11,7 @@
 WEBP_LICENSE_FILES = COPYING
 WEBP_INSTALL_STAGING = YES
 
-WEBP_CONF_OPT += \
+WEBP_CONF_OPTS += \
 	--with-jpegincludedir=$(STAGING_DIR)/usr/include \
 	--with-jpeglibdir=$(STAGING_DIR)/usr/lib \
 	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -12,7 +12,7 @@
 WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-WEBRTC_AUDIO_PROCESSING_CONF_OPT += --with-ns-mode=fixed
+WEBRTC_AUDIO_PROCESSING_CONF_OPTS += --with-ns-mode=fixed
 endif
 
 $(eval $(autotools-package))
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -13,7 +13,7 @@
 WESTON_DEPENDENCIES = host-pkgconf wayland libxkbcommon pixman libpng \
 	jpeg mtdev udev cairo
 
-WESTON_CONF_OPT = \
+WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
 	--disable-egl \
 	--disable-simple-egl-clients \
@@ -27,33 +27,33 @@
 
 ifeq ($(BR2_PACKAGE_LIBINPUT),y)
 WESTON_DEPENDENCIES += libinput
-WESTON_CONF_OPT += --enable-libinput-backend
+WESTON_CONF_OPTS += --enable-libinput-backend
 else
-WESTON_CONF_OPT += --disable-libinput-backend
+WESTON_CONF_OPTS += --disable-libinput-backend
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 WESTON_DEPENDENCIES += libunwind
 else
-WESTON_CONF_OPT += --disable-libunwind
+WESTON_CONF_OPTS += --disable-libunwind
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_FBDEV),y)
-WESTON_CONF_OPT += --enable-fbdev-compositor
+WESTON_CONF_OPTS += --enable-fbdev-compositor
 else
-WESTON_CONF_OPT += --disable-fbdev-compositor
+WESTON_CONF_OPTS += --disable-fbdev-compositor
 endif
 
 ifeq ($(BR2_PACKAGE_WESTON_RPI),y)
 WESTON_DEPENDENCIES += rpi-userland
-WESTON_CONF_OPT += --enable-rpi-compositor \
+WESTON_CONF_OPTS += --enable-rpi-compositor \
 	--disable-resize-optimization \
 	--disable-setuid-install \
 	--disable-xwayland-test \
 	--disable-simple-egl-clients \
 	WESTON_NATIVE_BACKEND=rpi-backend.so
 else
-WESTON_CONF_OPT += --disable-rpi-compositor
+WESTON_CONF_OPTS += --disable-rpi-compositor
 endif # BR2_PACKAGE_WESTON_RPI
 
 $(eval $(autotools-package))
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -20,13 +20,13 @@
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-	WGET_CONF_OPT += --with-ssl=gnutls \
+	WGET_CONF_OPTS += --with-ssl=gnutls \
 		--with-libgnutls-prefix=$(STAGING_DIR)
 	WGET_DEPENDENCIES += gnutls
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-	WGET_CONF_OPT += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
+	WGET_CONF_OPTS += --with-ssl=openssl --with-libssl-prefix=$(STAGING_DIR)
 	WGET_DEPENDENCIES += openssl
 endif
 
@@ -37,7 +37,7 @@
 # --with-ssl is default
 ifneq ($(BR2_PACKAGE_GNUTLS),y)
 ifneq ($(BR2_PACKAGE_OPENSSL),y)
-	WGET_CONF_OPT += --without-ssl
+	WGET_CONF_OPTS += --without-ssl
 endif
 endif
 
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -17,7 +17,7 @@
 
 # wireshark adds -I$includedir to CFLAGS, causing host/target headers mixup.
 # Work around it by pointing includedir at staging
-WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
+WIRESHARK_CONF_OPTS = --disable-wireshark --without-krb5 --disable-usr-local \
 		     --enable-static=no --with-gnutls=no --with-libsmi=no \
 		     --includedir=$(STAGING_DIR)/usr/include
 
diff --git a/package/wvstreams/wvstreams.mk b/package/wvstreams/wvstreams.mk
--- a/package/wvstreams/wvstreams.mk
+++ b/package/wvstreams/wvstreams.mk
@@ -16,9 +16,9 @@
 WVSTREAMS_MAKE = $(MAKE1)
 
 # Needed to work around problem with wvassert.h
-WVSTREAMS_CONF_OPT += CPPFLAGS=-DNDEBUG
+WVSTREAMS_CONF_OPTS += CPPFLAGS=-DNDEBUG
 
-WVSTREAMS_CONF_OPT += \
+WVSTREAMS_CONF_OPTS += \
 	--with-openssl \
 	--with-zlib \
 	--without-pam \
@@ -34,23 +34,23 @@
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 	WVSTREAMS_DEPENDENCIES += dbus
-	WVSTREAMS_CONF_OPT += --with-dbus
+	WVSTREAMS_CONF_OPTS += --with-dbus
 else
-	WVSTREAMS_CONF_OPT += --without-dbus
+	WVSTREAMS_CONF_OPTS += --without-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_QT),y)
 	WVSTREAMS_DEPENDENCIES += qt
-	WVSTREAMS_CONF_OPT += --with-qt
+	WVSTREAMS_CONF_OPTS += --with-qt
 else
-	WVSTREAMS_CONF_OPT += --without-qt
+	WVSTREAMS_CONF_OPTS += --without-qt
 endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
 	WVSTREAMS_DEPENDENCIES += valgrind
-	WVSTREAMS_CONF_OPT += --with-valgrind
+	WVSTREAMS_CONF_OPTS += --with-valgrind
 else
-	WVSTREAMS_CONF_OPT += --without-valgrind
+	WVSTREAMS_CONF_OPTS += --without-valgrind
 endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -16,8 +16,8 @@
 	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
 
-LIBXCB_CONF_OPT = --disable-build-docs
-HOST_LIBXCB_CONF_OPT = --disable-build-docs
+LIBXCB_CONF_OPTS = --disable-build-docs
+HOST_LIBXCB_CONF_OPTS = --disable-build-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -11,7 +11,7 @@
 XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
 XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libXdmcp xlib_libXinerama xlib_libXt xproto_xineramaproto xproto_xproto
-XAPP_XDM_CONF_OPT = --with-utmp-file=/var/adm/utmpx \
+XAPP_XDM_CONF_OPTS = --with-utmp-file=/var/adm/utmpx \
 		    --with-wtmp-file=/var/adm/wtmpx
 
 define XAPP_XDM_INSTALL_STARTUP_SCRIPT
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -9,7 +9,7 @@
 XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
 XAPP_XDPYINFO_LICENSE_FILES = COPYING
-XAPP_XDPYINFO_CONF_OPT = --without-xf86misc # not in BR
+XAPP_XDPYINFO_CONF_OPTS = --without-xf86misc # not in BR
 XAPP_XDPYINFO_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXtst \
 	$(if $(BR2_PACKAGE_XLIB_LIBXI),xlib_libXi) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRENDER),xlib_libXrender) \
@@ -19,19 +19,19 @@
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86DGA),y)
 XAPP_XDPYINFO_DEPENDENCIES += xlib_libXxf86dga
 else
-XAPP_XDPYINFO_CONF_OPT += --without-dga
+XAPP_XDPYINFO_CONF_OPTS += --without-dga
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XAPP_XDPYINFO_DEPENDENCIES += xlib_libdmx
 else
-XAPP_XDPYINFO_CONF_OPT += --without-dmx
+XAPP_XDPYINFO_CONF_OPTS += --without-dmx
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 XAPP_XDPYINFO_DEPENDENCIES += xlib_libXinerama
 else
-XAPP_XDPYINFO_CONF_OPT += --without-xinerama
+XAPP_XDPYINFO_CONF_OPTS += --without-xinerama
 endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -10,6 +10,6 @@
 XAPP_XRANDR_LICENSE = MIT
 XAPP_XRANDR_LICENSE_FILES = COPYING
 XAPP_XRANDR_DEPENDENCIES = xlib_libXrandr xlib_libX11
-XAPP_XRANDR_CONF_OPT = --disable-malloc0returnsnull
+XAPP_XRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -10,7 +10,7 @@
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
 
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--disable-xvmc \
 	--enable-sna \
 	--disable-glamor \
@@ -28,20 +28,20 @@
 
 # X.org server support for DRI depends on a Mesa3D DRI driver
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri --enable-dri1
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --enable-dri --enable-dri1
 # quote from configure.ac: "UXA doesn't build without DRI2 headers"
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri2 --enable-uxa
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --enable-dri2 --enable-uxa
 else
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri2 --disable-uxa
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --disable-dri2 --disable-uxa
 endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --enable-dri3
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --enable-dri3
 else
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri3
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --disable-dri3
 endif
 else
-XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += --disable-dri
+XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS += --disable-dri
 endif
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -10,7 +10,7 @@
 XKEYBOARD_CONFIG_LICENSE = MIT
 XKEYBOARD_CONFIG_LICENSE_FILES = COPYING
 
-XKEYBOARD_CONFIG_CONF_OPT = --disable-runtime-deps
+XKEYBOARD_CONFIG_CONF_OPTS = --disable-runtime-deps
 XKEYBOARD_CONFIG_DEPENDENCIES = host-gettext host-intltool host-xapp_xkbcomp
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -11,6 +11,6 @@
 XLIB_LIBFS_LICENSE_FILES = COPYING
 XLIB_LIBFS_INSTALL_STAGING = YES
 XLIB_LIBFS_DEPENDENCIES = xlib_xtrans xproto_xproto xproto_fontsproto host-pkgconf
-XLIB_LIBFS_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBFS_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -11,6 +11,6 @@
 XLIB_LIBSM_LICENSE_FILES = COPYING
 XLIB_LIBSM_INSTALL_STAGING = YES
 XLIB_LIBSM_DEPENDENCIES = xlib_libICE xlib_xtrans xproto_xproto
-XLIB_LIBSM_CONF_OPT = --without-libuuid
+XLIB_LIBSM_CONF_OPTS = --without-libuuid
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -23,13 +23,13 @@
 	xproto_xf86bigfontproto \
 	host-xproto_xproto
 
-XLIB_LIBX11_CONF_OPT = \
+XLIB_LIBX11_CONF_OPTS = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
 	--disable-specs \
 	--without-perl
 
-HOST_XLIB_LIBX11_CONF_OPT = \
+HOST_XLIB_LIBX11_CONF_OPTS = \
 	--disable-specs \
 	--without-perl
 
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXSCRNSAVER_LICENSE_FILES = COPYING
 XLIB_LIBXSCRNSAVER_INSTALL_STAGING = YES
 XLIB_LIBXSCRNSAVER_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_scrnsaverproto
-XLIB_LIBXSCRNSAVER_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXSCRNSAVER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXAW_LICENSE_FILES = COPYING
 XLIB_LIBXAW_INSTALL_STAGING = YES
 XLIB_LIBXAW_DEPENDENCIES = xlib_libX11 xlib_libXt xlib_libXmu xlib_libXpm xproto_xproto
-XLIB_LIBXAW_CONF_OPT = --disable-docs
+XLIB_LIBXAW_CONF_OPTS = --disable-docs
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXEXT_LICENSE_FILES = COPYING
 XLIB_LIBXEXT_INSTALL_STAGING = YES
 XLIB_LIBXEXT_DEPENDENCIES = xlib_libX11 xproto_xextproto xproto_xproto
-XLIB_LIBXEXT_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXEXT_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -12,9 +12,9 @@
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
-XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
+XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
-HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
+HOST_XLIB_LIBXFONT_CONF_OPTS = --disable-devel-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -18,6 +18,6 @@
 	xlib_libXext \
 	xlib_libXfixes
 
-XLIB_LIBXI_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXI_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
--- a/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
+++ b/package/x11r7/xlib_libXinerama/xlib_libXinerama.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXINERAMA_LICENSE_FILES = COPYING
 XLIB_LIBXINERAMA_INSTALL_STAGING = YES
 XLIB_LIBXINERAMA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xineramaproto
-XLIB_LIBXINERAMA_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXINERAMA_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXRANDR_LICENSE_FILES = COPYING
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xproto_randrproto xlib_libX11 xlib_libXext xlib_libXrender xproto_renderproto xproto_xproto
-XLIB_LIBXRANDR_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -11,7 +11,7 @@
 XLIB_LIBXRENDER_LICENSE_FILES = COPYING
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
 XLIB_LIBXRENDER_DEPENDENCIES = xlib_libX11 xproto_renderproto xproto_xproto
-XLIB_LIBXRENDER_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXRENDER_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXRES_LICENSE_FILES = COPYING
 XLIB_LIBXRES_INSTALL_STAGING = YES
 XLIB_LIBXRES_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_resourceproto xproto_xproto
-XLIB_LIBXRES_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXRES_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXt/xlib_libXt.mk b/package/x11r7/xlib_libXt/xlib_libXt.mk
--- a/package/x11r7/xlib_libXt/xlib_libXt.mk
+++ b/package/x11r7/xlib_libXt/xlib_libXt.mk
@@ -11,7 +11,7 @@
 XLIB_LIBXT_LICENSE_FILES = COPYING
 XLIB_LIBXT_INSTALL_STAGING = YES
 XLIB_LIBXT_DEPENDENCIES = xlib_libSM xlib_libX11 xproto_kbproto xproto_xproto xcb-proto libxcb host-xproto_xproto
-XLIB_LIBXT_CONF_OPT = --disable-malloc0returnsnull --disable-install-makestrs
+XLIB_LIBXT_CONF_OPTS = --disable-malloc0returnsnull --disable-install-makestrs
 XLIB_LIBXT_AUTORECONF = YES
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
-XLIB_LIBXV_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXV_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_INSTALL_STAGING = YES
 XLIB_LIBXVMC_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXv xproto_videoproto xproto_xproto
-XLIB_LIBXVMC_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXVMC_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
--- a/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
+++ b/package/x11r7/xlib_libXxf86dga/xlib_libXxf86dga.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXXF86DGA_LICENSE_FILES = COPYING
 XLIB_LIBXXF86DGA_INSTALL_STAGING = YES
 XLIB_LIBXXF86DGA_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86dgaproto xproto_xproto
-XLIB_LIBXXF86DGA_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXXF86DGA_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -11,6 +11,6 @@
 XLIB_LIBXXF86VM_LICENSE_FILES = COPYING
 XLIB_LIBXXF86VM_INSTALL_STAGING = YES
 XLIB_LIBXXF86VM_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_xf86vidmodeproto xproto_xproto
-XLIB_LIBXXF86VM_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBXXF86VM_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -11,6 +11,6 @@
 XLIB_LIBDMX_LICENSE_FILES = COPYING
 XLIB_LIBDMX_INSTALL_STAGING = YES
 XLIB_LIBDMX_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_dmxproto
-XLIB_LIBDMX_CONF_OPT = --disable-malloc0returnsnull
+XLIB_LIBDMX_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -10,8 +10,8 @@
 XPROTO_XCMISCPROTO_LICENSE = MIT
 XPROTO_XCMISCPROTO_LICENSE_FILES = COPYING
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES
-XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
-HOST_XPROTO_XCMISCPROTO_CONF_OPT = --disable-specs
+XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
+HOST_XPROTO_XCMISCPROTO_CONF_OPTS = --disable-specs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -10,8 +10,8 @@
 XPROTO_XEXTPROTO_LICENSE = MIT
 XPROTO_XEXTPROTO_LICENSE_FILES = COPYING
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES
-XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
-HOST_XPROTO_XEXTPROTO_CONF_OPT = --disable-specs
+XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
+HOST_XPROTO_XEXTPROTO_CONF_OPTS = --disable-specs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -54,7 +54,7 @@
 	mcookie 			\
 	host-pkgconf
 
-XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
+XSERVER_XORG_SERVER_CONF_OPTS = --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-dmx \
 		--with-builder-addr=buildroot at buildroot.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
@@ -62,14 +62,14 @@
 		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess libdrm
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev \
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive --enable-xfbdev \
 		--disable-glx --disable-dri --disable-xsdl
 define XSERVER_CREATE_X_SYMLINK
  ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
@@ -77,66 +77,66 @@
 XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-evdev
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-evdev
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-evdev
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-evdev
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_KBD),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-kbd
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-kbd
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-kbd
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-kbd
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_MOUSE),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive-mouse
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-kdrive-mouse
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive-mouse
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive-mouse
 endif
 
 else # modular
-XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-dri --enable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dri --disable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-null-root-cursor
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-null-root-cursor
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-null-root-cursor
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-null-root-cursor
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-aiglx
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-aiglx
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-aiglx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-aiglx
 endif
 
 # Optional packages
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += tslib
-XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-tslib LDFLAGS="-lts"
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
-XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev-kms
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev-kms
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
 else
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
-XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-dbus
 endif
 endif
 
@@ -147,56 +147,56 @@
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-libunwind
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
 endif
 
 ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
-XSERVER_XORG_SERVER_CONF_OPT += --enable-record
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-record
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-record
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-record
 endif
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
-XSERVER_XORG_SERVER_CONF_OPT += --disable-xvmc
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-xvmc
 endif
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
-XSERVER_XORG_SERVER_CONF_OPT += --disable-composite
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-composite
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
-XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri2
 endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
-XSERVER_XORG_SERVER_CONF_OPT += --enable-dri3
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 endif
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2 --disable-dri3
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2 --disable-dri3
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXScrnSaver
-XSERVER_XORG_SERVER_CONF_OPT += --enable-screensaver
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-screensaver
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-screensaver
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-screensaver
 endif
 
 ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dmx
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libcrypto
+XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libcrypto
 XSERVER_XORG_SERVER_DEPENDENCIES += openssl
 else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libgcrypt
+XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libgcrypt
 XSERVER_XORG_SERVER_DEPENDENCIES += libgcrypt
 else
-XSERVER_XORG_SERVER_CONF_OPT += --with-sha1=libsha1
+XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -8,63 +8,63 @@
 X11VNC_SITE = http://downloads.sourceforge.net/project/libvncserver/x11vnc/$(X11VNC_VERSION)
 # sdl support is not used in x11vnc, but host include / library search paths
 # leak in if host has sdl-config
-X11VNC_CONF_OPT = --without-sdl
+X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst
 X11VNC_LICENSE = GPLv2+
 X11VNC_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_INET_IPV6),y)
 # configure option only used for libvncserver
-X11VNC_CONF_OPT += --without-ipv6
+X11VNC_CONF_OPTS += --without-ipv6
 X11VNC_CONF_ENV += CFLAGS='$(TARGET_CFLAGS) -DX11VNC_IPV6=0'
 endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 X11VNC_DEPENDENCIES += avahi dbus
 else
-X11VNC_CONF_OPT += --without-avahi
+X11VNC_CONF_OPTS += --without-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
 X11VNC_DEPENDENCIES += jpeg
 else
-X11VNC_CONF_OPT += --without-jpeg
+X11VNC_CONF_OPTS += --without-jpeg
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 X11VNC_DEPENDENCIES += openssl
 else
-X11VNC_CONF_OPT += --without-ssl --without-crypto
+X11VNC_CONF_OPTS += --without-ssl --without-crypto
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 X11VNC_DEPENDENCIES += xlib_libXinerama
 else
-X11VNC_CONF_OPT += --without-xinerama
+X11VNC_CONF_OPTS += --without-xinerama
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
 X11VNC_DEPENDENCIES += xlib_libXrandr
 else
-X11VNC_CONF_OPT += --without-xrandr
+X11VNC_CONF_OPTS += --without-xrandr
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
 X11VNC_DEPENDENCIES += xlib_libXfixes
 else
-X11VNC_CONF_OPT += --without-xfixes
+X11VNC_CONF_OPTS += --without-xfixes
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
 X11VNC_DEPENDENCIES += xlib_libXdamage
 else
-X11VNC_CONF_OPT += --without-xdamage
+X11VNC_CONF_OPTS += --without-xdamage
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 X11VNC_DEPENDENCIES += zlib
 else
-X11VNC_CONF_OPT += --without-zlib
+X11VNC_CONF_OPTS += --without-zlib
 endif
 
 
diff --git a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
--- a/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
+++ b/package/xbmc-pvr-addons/xbmc-pvr-addons.mk
@@ -20,15 +20,15 @@
 # installed its own files
 XBMC_PVR_ADDONS_DEPENDENCIES += xbmc
 
-XBMC_PVR_ADDONS_CONF_OPT = \
+XBMC_PVR_ADDONS_CONF_OPTS = \
 	--enable-release \
 	--enable-addons-with-dependencies
 
 ifeq ($(BR2_PACKAGE_MYSQL),y)
-XBMC_PVR_ADDONS_CONF_OPT += --enable-mysql
+XBMC_PVR_ADDONS_CONF_OPTS += --enable-mysql
 XBMC_PVR_ADDONS_DEPENDENCIES += mysql
 else
-XBMC_PVR_ADDONS_CONF_OPT += --disable-mysql
+XBMC_PVR_ADDONS_CONF_OPTS += --disable-mysql
 endif
 
 $(eval $(autotools-package))
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -39,7 +39,7 @@
 	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
 	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
 
-XBMC_CONF_OPT +=  \
+XBMC_CONF_OPTS +=  \
 	--with-arch=$(BR2_ARCH) \
 	--disable-crystalhd \
 	--disable-debug \
@@ -58,7 +58,7 @@
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 XBMC_DEPENDENCIES += rpi-userland
-XBMC_CONF_OPT += --with-platform=raspberry-pi --enable-player=omxplayer
+XBMC_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
 XBMC_CONF_ENV += INCLUDES="-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux" \
 	LIBS="-lvcos -lvchostif"
@@ -66,23 +66,23 @@
 
 ifeq ($(BR2_PACKAGE_XBMC_DBUS),y)
 XBMC_DEPENDENCIES += dbus
-XBMC_CONF_OPT += --enable-dbus
+XBMC_CONF_OPTS += --enable-dbus
 else
-XBMC_CONF_OPT += --disable-dbus
+XBMC_CONF_OPTS += --disable-dbus
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 XBMC_DEPENDENCIES += alsa-lib
-XBMC_CONF_OPT += --enable-alsa
+XBMC_CONF_OPTS += --enable-alsa
 else
-XBMC_CONF_OPT += --disable-alsa
+XBMC_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_LAME),y)
 XBMC_DEPENDENCIES += lame
-XBMC_CONF_OPT += --enable-libmp3lame
+XBMC_CONF_OPTS += --enable-libmp3lame
 else
-XBMC_CONF_OPT += --disable-libmp3lame
+XBMC_CONF_OPTS += --disable-libmp3lame
 endif
 
 # quote from xbmc/configure.in: "GLES overwrites GL if both set to yes."
@@ -90,7 +90,7 @@
 ifeq ($(BR2_PACKAGE_XBMC_GL),y)
 XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 xlib_libXext \
 	xlib_libXmu xlib_libXrandr xlib_libXt
-XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
+XBMC_CONF_OPTS += --enable-gl --enable-sdl --enable-x11 --enable-xrandr --disable-gles
 ifeq ($(BR2_PACKAGE_XBMC_RSXS),y)
 # fix rsxs compile
 # make sure target libpng-config is used, options taken from rsxs-0.9/acinclude.m4
@@ -101,87 +101,87 @@
 	mac_cv_pkg_cxxflags="`$(STAGING_DIR)/usr/bin/libpng-config --ccopts`" \
 	mac_cv_pkg_ldflags="`$(STAGING_DIR)/usr/bin/libpng-config --L_opts --R_opts`" \
 	mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
-XBMC_CONF_OPT += --enable-rsxs
+XBMC_CONF_OPTS += --enable-rsxs
 else
-XBMC_CONF_OPT += --disable-rsxs
+XBMC_CONF_OPTS += --disable-rsxs
 endif
 else
-XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
+XBMC_CONF_OPTS += --disable-gl --disable-rsxs --disable-sdl --disable-x11 --disable-xrandr
 ifeq ($(BR2_PACKAGE_XBMC_EGL_GLES),y)
 XBMC_DEPENDENCIES += libegl libgles
-XBMC_CONF_OPT += --enable-gles
+XBMC_CONF_OPTS += --enable-gles
 else
-XBMC_CONF_OPT += --disable-gles
+XBMC_CONF_OPTS += --disable-gles
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
-XBMC_CONF_OPT += --enable-goom
+XBMC_CONF_OPTS += --enable-goom
 else
-XBMC_CONF_OPT += --disable-goom
+XBMC_CONF_OPTS += --disable-goom
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
-XBMC_CONF_OPT += --enable-libusb
+XBMC_CONF_OPTS += --enable-libusb
 else
-XBMC_CONF_OPT += --disable-libusb
+XBMC_CONF_OPTS += --disable-libusb
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBMICROHTTPD),y)
 XBMC_DEPENDENCIES += libmicrohttpd
-XBMC_CONF_OPT += --enable-webserver
+XBMC_CONF_OPTS += --enable-webserver
 else
-XBMC_CONF_OPT += --disable-webserver
+XBMC_CONF_OPTS += --disable-webserver
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBSMBCLIENT),y)
 XBMC_DEPENDENCIES += samba
-XBMC_CONF_OPT += --enable-samba
+XBMC_CONF_OPTS += --enable-samba
 else
-XBMC_CONF_OPT += --disable-samba
+XBMC_CONF_OPTS += --disable-samba
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBNFS),y)
 XBMC_DEPENDENCIES += libnfs
-XBMC_CONF_OPT += --enable-nfs
+XBMC_CONF_OPTS += --enable-nfs
 else
-XBMC_CONF_OPT += --disable-nfs
+XBMC_CONF_OPTS += --disable-nfs
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_RTMPDUMP),y)
 XBMC_DEPENDENCIES += rtmpdump
-XBMC_CONF_OPT += --enable-rtmp
+XBMC_CONF_OPTS += --enable-rtmp
 else
-XBMC_CONF_OPT += --disable-rtmp
+XBMC_CONF_OPTS += --disable-rtmp
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBBLURAY),y)
 XBMC_DEPENDENCIES += libbluray
-XBMC_CONF_OPT += --enable-libbluray
+XBMC_CONF_OPTS += --enable-libbluray
 else
-XBMC_CONF_OPT += --disable-libbluray
+XBMC_CONF_OPTS += --disable-libbluray
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBSHAIRPLAY),y)
 XBMC_DEPENDENCIES += libshairplay
-XBMC_CONF_OPT += --enable-airplay
+XBMC_CONF_OPTS += --enable-airplay
 else
-XBMC_CONF_OPT += --disable-airplay
+XBMC_CONF_OPTS += --disable-airplay
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_AVAHI),y)
 XBMC_DEPENDENCIES += avahi
-XBMC_CONF_OPT += --enable-avahi
+XBMC_CONF_OPTS += --enable-avahi
 else
-XBMC_CONF_OPT += --disable-avahi
+XBMC_CONF_OPTS += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
 XBMC_DEPENDENCIES += libcec
-XBMC_CONF_OPT += --enable-libcec
+XBMC_CONF_OPTS += --enable-libcec
 else
-XBMC_CONF_OPT += --disable-libcec
+XBMC_CONF_OPTS += --disable-libcec
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_WAVPACK),y)
@@ -195,9 +195,9 @@
 # xbmc needs libva & libva-glx
 ifeq ($(BR2_PACKAGE_XBMC_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
 XBMC_DEPENDENCIES += mesa3d libva
-XBMC_CONF_OPT += --enable-vaapi
+XBMC_CONF_OPTS += --enable-vaapi
 else
-XBMC_CONF_OPT += --disable-vaapi
+XBMC_CONF_OPTS += --disable-vaapi
 endif
 
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -19,7 +19,7 @@
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
 
-XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/ --disable-doc-install
+XENOMAI_CONF_OPTS += --includedir=/usr/include/xenomai/ --disable-doc-install
 
 define XENOMAI_REMOVE_DEVFILES
 	for i in xeno-config xeno-info wrap-link.sh ; do \
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -11,7 +11,7 @@
 XERCES_LICENSE_FILES = LICENSE
 XERCES_MAKE = $(MAKE1)
 XERCES_INSTALL_STAGING = YES
-XERCES_CONF_OPT = --disable-threads \
+XERCES_CONF_OPTS = --disable-threads \
 		  --with-gnu-ld
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
@@ -20,10 +20,10 @@
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
-XERCES_CONF_OPT += --enable-netaccessor-curl
+XERCES_CONF_OPTS += --enable-netaccessor-curl
 XERCES_DEPENDENCIES += libcurl
 else
-XERCES_CONF_OPT += --disable-network
+XERCES_CONF_OPTS += --disable-network
 endif
 
 $(eval $(autotools-package))
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -10,7 +10,7 @@
 XFSPROGS_DEPENDENCIES = util-linux
 
 XFSPROGS_CONF_ENV = ac_cv_header_aio_h=yes ac_cv_lib_rt_lio_listio=yes
-XFSPROGS_CONF_OPT = \
+XFSPROGS_CONF_OPTS = \
 	--enable-lib64=no \
 	--enable-gettext=no \
 	INSTALL_USER=root \
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -12,15 +12,15 @@
 XMLSTARLET_DEPENDENCIES += libxml2 libxslt \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
-XMLSTARLET_CONF_OPT += \
+XMLSTARLET_CONF_OPTS += \
 	--with-libxml-prefix=${STAGING_DIR}/usr \
 	--with-libxslt-prefix=${STAGING_DIR}/usr \
 	--with-libiconv-prefix=${STAGING_DIR}/usr
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-XMLSTARLET_CONF_OPT += --enable-static-libs
+XMLSTARLET_CONF_OPTS += --enable-static-libs
 else
-XMLSTARLET_CONF_OPT += --disable-static-libs
+XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
 $(eval $(autotools-package))
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -16,7 +16,7 @@
 
 # otherwise we end up with host include/library dirs passed to the
 # compiler/linker
-XSCREENSAVER_CONF_OPT = \
+XSCREENSAVER_CONF_OPTS = \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--libdir=$(STAGING_DIR)/usr/lib
 
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -15,12 +15,12 @@
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
 # for the rest of the build as well (which automatically includes stdc++).
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-	ZEROMQ_CONF_OPT += LIBS=-lstdc++
+	ZEROMQ_CONF_OPTS += LIBS=-lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
-	ZEROMQ_CONF_OPT += --with-system-pgm
+	ZEROMQ_CONF_OPTS += --with-system-pgm
 endif
 
 $(eval $(autotools-package))
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -9,7 +9,7 @@
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_DEPENDENCIES = host-pkgconf host-autoconf host-automake
-ZNC_CONF_OPT = --disable-perl
+ZNC_CONF_OPTS = --disable-perl
 
 # The standard <pkg>_AUTORECONF = YES invocation doesn't work for this
 # package, because it does not use automake in a normal way.
@@ -20,30 +20,30 @@
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 ZNC_DEPENDENCIES += icu
-ZNC_CONF_OPT += --enable-icu
+ZNC_CONF_OPTS += --enable-icu
 else
-ZNC_CONF_OPT += --disable-icu
+ZNC_CONF_OPTS += --disable-icu
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ZNC_DEPENDENCIES += openssl
-ZNC_CONF_OPT += --enable-openssl
+ZNC_CONF_OPTS += --enable-openssl
 else
-ZNC_CONF_OPT += --disable-openssl
+ZNC_CONF_OPTS += --disable-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZNC_DEPENDENCIES += zlib
-ZNC_CONF_OPT += --enable-zlib
+ZNC_CONF_OPTS += --enable-zlib
 else
-ZNC_CONF_OPT += --disable-zlib
+ZNC_CONF_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZNC_DEPENDENCIES += python3 host-swig
-ZNC_CONF_OPT += --enable-python=python3
+ZNC_CONF_OPTS += --enable-python=python3
 else
-ZNC_CONF_OPT += --disable-python
+ZNC_CONF_OPTS += --disable-python
 endif
 
 $(eval $(autotools-package))
