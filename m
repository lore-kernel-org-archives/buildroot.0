From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 01:40:51 +0200
Subject: [Buildroot] [PATCH 6/7] packages: check proper use of 'select'
	against packages
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347234052-10527-7-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch checks that all 'select' on a package have a 'depends on'
on the corresponding _AVAILABLE symbol.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/acl/Config.in                              |    1 +
 package/alsa-lib/Config.in                         |    1 +
 package/alsamixergui/Config.in                     |    3 +
 package/apr-util/Config.in                         |    5 ++
 package/argus/Config.in                            |    1 +
 package/atk/Config.in                              |    1 +
 package/autoconf/Config.in                         |    1 +
 package/automake/Config.in                         |    2 +
 package/bash/Config.in                             |    1 +
 package/bison/Config.in                            |    1 +
 package/blackbox/Config.in                         |    1 +
 package/bluez_utils/Config.in                      |    2 +
 package/boost/Config.in                            |    2 +
 package/bsdiff/Config.in                           |    1 +
 package/cairo/Config.in                            |    2 +
 package/cdrkit/Config.in                           |    2 +
 package/cgilua/Config.in                           |    1 +
 package/connman/Config.in                          |    4 ++
 package/conntrack-tools/Config.in                  |    2 +
 package/copas/Config.in                            |    2 +
 package/cvs/Config.in                              |    1 +
 package/dbus-glib/Config.in                        |    1 +
 package/dbus-python/Config.in                      |    1 +
 package/dhcpdump/Config.in                         |    1 +
 package/dialog/Config.in                           |    1 +
 package/directfb/Config.in                         |    2 +
 package/dmraid/Config.in                           |    1 +
 package/docker/Config.in                           |    1 +
 package/dsp-tools/Config.in                        |    1 +
 package/dstat/Config.in                            |    1 +
 package/e2fsprogs/Config.in                        |    3 +
 package/efl/expedite/Config.in                     |    3 +
 package/efl/libecore/Config.in                     |    1 +
 package/efl/libedbus/Config.in                     |    3 +
 package/efl/libedje/Config.in                      |    7 +++
 package/efl/libeet/Config.in                       |    3 +
 package/efl/libefreet/Config.in                    |    3 +
 package/efl/libelementary/Config.in                |    4 ++
 package/efl/libembryo/Config.in                    |    1 +
 package/efl/libethumb/Config.in                    |    5 ++
 package/efl/libevas/Config.in                      |    3 +
 package/enchant/Config.in                          |    1 +
 package/fbgrab/Config.in                           |    1 +
 package/fbterm/Config.in                           |    2 +
 package/feh/Config.in                              |    7 +++
 package/file/Config.in                             |    1 +
 package/flashrom/Config.in                         |    2 +
 package/flot/Config.in                             |    1 +
 package/fltk/Config.in                             |    1 +
 package/fluxbox/Config.in                          |    1 +
 package/fontconfig/Config.in                       |    2 +
 package/freerdp/Config.in                          |    6 +++
 package/games/prboom/Config.in                     |    3 +
 package/gamin/Config.in                            |    1 +
 package/gdk-pixbuf/Config.in                       |    1 +
 package/giblib/Config.in                           |    2 +
 package/glib-networking/Config.in                  |    1 +
 package/gmpc/Config.in                             |    8 ++++
 package/gnutls/Config.in                           |    1 +
 package/gob2/Config.in                             |    4 ++
 package/gvfs/Config.in                             |    3 +
 package/hostapd/Config.in                          |    1 +
 package/htop/Config.in                             |    1 +
 package/ifplugd/Config.in                          |    1 +
 package/imlib2/Config.in                           |    1 +
 package/ipsec-tools/Config.in                      |    3 +
 package/ipset/Config.in                            |    1 +
 package/iw/Config.in                               |    1 +
 package/jquery-sparkline/Config.in                 |    1 +
 package/jquery-validation/Config.in                |    1 +
 package/kismet/Config.in                           |    3 +
 package/latencytop/Config.in                       |    2 +
 package/lcdproc/Config.in                          |    1 +
 package/less/Config.in                             |    1 +
 package/libcue/Config.in                           |    2 +
 package/libdrm/Config.in                           |    6 +++
 package/libdvdnav/Config.in                        |    1 +
 package/libeXosip2/Config.in                       |    1 +
 package/libfreefare/Config.in                      |    2 +
 package/libftdi/Config.in                          |    2 +
 package/libgail/Config.in                          |    1 +
 package/libgcrypt/Config.in                        |    1 +
 package/libgeotiff/Config.in                       |    1 +
 package/libglade/Config.in                         |    3 +
 package/libglib2/Config.in                         |    2 +
 package/libgtk2/Config.in                          |    8 ++++
 package/libhid/Config.in                           |    2 +
 package/libid3tag/Config.in                        |    1 +
 package/libiqrf/Config.in                          |    1 +
 package/libmms/Config.in                           |    1 +
 package/libmpd/Config.in                           |    1 +
 package/libnetfilter_conntrack/Config.in           |    1 +
 package/libnetfilter_cttimeout/Config.in           |    1 +
 package/libnfc-llcp/Config.in                      |    1 +
 package/libnfc/Config.in                           |    2 +
 package/libnss/Config.in                           |    3 +
 package/liboauth/Config.in                         |    1 +
 package/libpcap/Config.in                          |    1 +
 package/libpng/Config.in                           |    1 +
 package/librsvg/Config.in                          |    5 ++
 package/librsync/Config.in                         |    3 +
 package/libsexy/Config.in                          |    1 +
 package/libsoup/Config.in                          |    2 +
 package/libsvgtiny/Config.in                       |    1 +
 package/libtheora/Config.in                        |    2 +
 package/libtorrent/Config.in                       |    1 +
 package/libvorbis/Config.in                        |    1 +
 package/libxml-parser-perl/Config.in               |    1 +
 package/libxslt/Config.in                          |    1 +
 package/linphone/Config.in                         |    4 ++
 package/linux-pam/Config.in                        |    2 +
 package/lockfile-progs/Config.in                   |    1 +
 package/logrotate/Config.in                        |    1 +
 package/ltrace/Config.in                           |    1 +
 package/lttng-babeltrace/Config.in                 |    3 +
 package/lttng-libust/Config.in                     |    3 +
 package/lttng-tools/Config.in                      |    2 +
 package/luaexpat/Config.in                         |    1 +
 package/lzop/Config.in                             |    1 +
 package/matchbox/Config.in                         |    5 ++
 package/mediastreamer/Config.in                    |    1 +
 package/midori/Config.in                           |    2 +
 package/minicom/Config.in                          |    1 +
 package/mpc/Config.in                              |    2 +
 package/mpfr/Config.in                             |    1 +
 package/mtdev2tuio/Config.in                       |    2 +
 package/multimedia/alsa-utils/Config.in            |    1 +
 package/multimedia/aumix/Config.in                 |    1 +
 package/multimedia/gst-dsp/Config.in               |    1 +
 package/multimedia/gst-ffmpeg/Config.in            |    5 ++
 package/multimedia/gst-plugins-bad/Config.in       |    1 +
 package/multimedia/gst-plugins-good/Config.in      |    1 +
 package/multimedia/gst-plugins-ugly/Config.in      |    1 +
 package/multimedia/gstreamer/Config.in             |    1 +
 package/multimedia/madplay/Config.in               |    2 +
 package/multimedia/mpd/Config.in                   |    1 +
 package/multimedia/musepack/Config.in              |    2 +
 package/multimedia/pulseaudio/Config.in            |    4 ++
 package/multimedia/vorbis-tools/Config.in          |    4 ++
 package/mutt/Config.in                             |    1 +
 package/mysql_client/Config.in                     |    2 +
 package/nano/Config.in                             |    1 +
 package/nbd/Config.in                              |    1 +
 package/netatalk/Config.in                         |    4 ++
 package/netkittelnet/Config.in                     |    1 +
 package/network-manager/Config.in                  |   10 +++++
 package/newt/Config.in                             |    1 +
 package/nfs-utils/Config.in                        |    1 +
 package/ngircd/Config.in                           |    1 +
 package/ngrep/Config.in                            |    2 +
 package/ofono/Config.in                            |    4 ++
 package/opencv/Config.in                           |    1 +
 package/openocd/Config.in                          |    2 +
 package/openssh/Config.in                          |    2 +
 package/openssl/Config.in                          |    1 +
 package/openswan/Config.in                         |    2 +
 package/oprofile/Config.in                         |    2 +
 package/pango/Config.in                            |    3 +
 package/parted/Config.in                           |    4 ++
 package/pcmanfm/Config.in                          |    2 +
 package/pkg-config/Config.in                       |    1 +
 package/poco/Config.in                             |    2 +
 package/procps/Config.in                           |    1 +
 package/psmisc/Config.in                           |    1 +
 package/python-dpkt/Config.in                      |    1 +
 package/python-mad/Config.in                       |    1 +
 package/python-meld3/Config.in                     |    1 +
 package/python-netifaces/Config.in                 |    1 +
 package/python-nfc/Config.in                       |    2 +
 package/python-pygame/Config.in                    |    1 +
 package/python-setuptools/Config.in                |    1 +
 package/python/Config.in                           |    1 +
 package/quota/Config.in                            |    2 +
 package/radvd/Config.in                            |    3 +
 package/rdesktop/Config.in                         |    3 +
 package/readline/Config.in                         |    1 +
 package/rng-tools/Config.in                        |    1 +
 package/rpm/Config.in                              |    5 ++
 package/rrdtool/Config.in                          |    4 ++
 package/rtorrent/Config.in                         |    5 ++
 package/samba/Config.in                            |    1 +
 package/screen/Config.in                           |    1 +
 package/sdl_ttf/Config.in                          |    1 +
 package/shared-mime-info/Config.in                 |    2 +
 package/socketcand/Config.in                       |    1 +
 package/speex/Config.in                            |    1 +
 package/sqlcipher/Config.in                        |    1 +
 package/squid/Config.in                            |    1 +
 package/sshfs/Config.in                            |    3 +
 package/startup-notification/Config.in             |    1 +
 package/statserial/Config.in                       |    1 +
 package/stunnel/Config.in                          |    1 +
 package/supervisor/Config.in                       |    2 +
 package/synergy/Config.in                          |    1 +
 package/sysprof/Config.in                          |    1 +
 package/systemd/Config.in                          |    2 +
 package/tcpdump/Config.in                          |    1 +
 package/tcpreplay/Config.in                        |    1 +
 package/ti-utils/Config.in                         |    1 +
 package/tn5250/Config.in                           |    1 +
 package/transmission/Config.in                     |    4 ++
 package/udev/Config.in                             |    3 +
 package/uemacs/Config.in                           |    1 +
 package/unionfs/Config.in                          |    1 +
 package/usb_modeswitch/Config.in                   |    2 +
 package/usb_modeswitch_data/Config.in              |    3 +
 package/usbmount/Config.in                         |    3 +
 package/usbutils/Config.in                         |    1 +
 package/ushare/Config.in                           |    1 +
 package/vala/Config.in                             |    1 +
 package/vim/Config.in                              |    1 +
 package/vpnc/Config.in                             |    2 +
 package/vtun/Config.in                             |    2 +
 package/webkit/Config.in                           |    9 ++++
 package/wsapi/Config.in                            |    3 +
 package/x11r7/libxcb/Config.in                     |    4 ++
 package/x11r7/mesa3d/Config.in                     |    7 +++
 package/x11r7/xapp_appres/Config.in                |    2 +
 package/x11r7/xapp_bdftopcf/Config.in              |    1 +
 package/x11r7/xapp_beforelight/Config.in           |    4 ++
 package/x11r7/xapp_bitmap/Config.in                |    4 ++
 package/x11r7/xapp_editres/Config.in               |    4 ++
 package/x11r7/xapp_fonttosfnt/Config.in            |    3 +
 package/x11r7/xapp_fslsfonts/Config.in             |    2 +
 package/x11r7/xapp_fstobdf/Config.in               |    2 +
 package/x11r7/xapp_iceauth/Config.in               |    2 +
 package/x11r7/xapp_ico/Config.in                   |    1 +
 package/x11r7/xapp_listres/Config.in               |    4 ++
 package/x11r7/xapp_luit/Config.in                  |    2 +
 package/x11r7/xapp_mkfontdir/Config.in             |    1 +
 package/x11r7/xapp_mkfontscale/Config.in           |    3 +
 package/x11r7/xapp_oclock/Config.in                |    3 +
 package/x11r7/xapp_rgb/Config.in                   |    1 +
 package/x11r7/xapp_rstart/Config.in                |    1 +
 package/x11r7/xapp_scripts/Config.in               |    1 +
 package/x11r7/xapp_sessreg/Config.in               |    2 +
 package/x11r7/xapp_setxkbmap/Config.in             |    2 +
 package/x11r7/xapp_showfont/Config.in              |    1 +
 package/x11r7/xapp_smproxy/Config.in               |    2 +
 package/x11r7/xapp_twm/Config.in                   |    4 ++
 package/x11r7/xapp_viewres/Config.in               |    1 +
 package/x11r7/xapp_x11perf/Config.in               |    3 +
 package/x11r7/xapp_xauth/Config.in                 |    4 ++
 package/x11r7/xapp_xbacklight/Config.in            |    3 +
 package/x11r7/xapp_xbiff/Config.in                 |    2 +
 package/x11r7/xapp_xcalc/Config.in                 |    1 +
 package/x11r7/xapp_xclipboard/Config.in            |    1 +
 package/x11r7/xapp_xclock/Config.in                |    5 ++
 package/x11r7/xapp_xcmsdb/Config.in                |    1 +
 package/x11r7/xapp_xcursorgen/Config.in            |    3 +
 package/x11r7/xapp_xdbedizzy/Config.in             |    3 +
 package/x11r7/xapp_xditview/Config.in              |    1 +
 package/x11r7/xapp_xdm/Config.in                   |   10 +++++
 package/x11r7/xapp_xdpyinfo/Config.in              |   14 +++++++
 package/x11r7/xapp_xdriinfo/Config.in              |    2 +
 package/x11r7/xapp_xedit/Config.in                 |    2 +
 package/x11r7/xapp_xev/Config.in                   |    1 +
 package/x11r7/xapp_xeyes/Config.in                 |    4 ++
 package/x11r7/xapp_xf86dga/Config.in               |    2 +
 package/x11r7/xapp_xfd/Config.in                   |    4 ++
 package/x11r7/xapp_xfontsel/Config.in              |    1 +
 package/x11r7/xapp_xfs/Config.in                   |    3 +
 package/x11r7/xapp_xfsinfo/Config.in               |    2 +
 package/x11r7/xapp_xgamma/Config.in                |    1 +
 package/x11r7/xapp_xgc/Config.in                   |    1 +
 package/x11r7/xapp_xhost/Config.in                 |    2 +
 package/x11r7/xapp_xinit/Config.in                 |    2 +
 package/x11r7/xapp_xinput/Config.in                |    2 +
 package/x11r7/xapp_xinput_calibrator/Config.in     |    2 +
 package/x11r7/xapp_xkbcomp/Config.in               |    2 +
 package/x11r7/xapp_xkbevd/Config.in                |    1 +
 package/x11r7/xapp_xkbprint/Config.in              |    1 +
 package/x11r7/xapp_xkbutils/Config.in              |    2 +
 package/x11r7/xapp_xkill/Config.in                 |    2 +
 package/x11r7/xapp_xload/Config.in                 |    1 +
 package/x11r7/xapp_xlogo/Config.in                 |    4 ++
 package/x11r7/xapp_xlsatoms/Config.in              |    2 +
 package/x11r7/xapp_xlsclients/Config.in            |    2 +
 package/x11r7/xapp_xlsfonts/Config.in              |    1 +
 package/x11r7/xapp_xmag/Config.in                  |    1 +
 package/x11r7/xapp_xman/Config.in                  |    1 +
 package/x11r7/xapp_xmessage/Config.in              |    1 +
 package/x11r7/xapp_xmh/Config.in                   |    1 +
 package/x11r7/xapp_xmodmap/Config.in               |    1 +
 package/x11r7/xapp_xmore/Config.in                 |    2 +
 package/x11r7/xapp_xplsprinters/Config.in          |    3 +
 package/x11r7/xapp_xpr/Config.in                   |    2 +
 package/x11r7/xapp_xprehashprinterlist/Config.in   |    2 +
 package/x11r7/xapp_xprop/Config.in                 |    2 +
 package/x11r7/xapp_xrandr/Config.in                |    2 +
 package/x11r7/xapp_xrdb/Config.in                  |    2 +
 package/x11r7/xapp_xrefresh/Config.in              |    1 +
 package/x11r7/xapp_xset/Config.in                  |    2 +
 package/x11r7/xapp_xsetmode/Config.in              |    2 +
 package/x11r7/xapp_xsetpointer/Config.in           |    3 +
 package/x11r7/xapp_xsetroot/Config.in              |    3 +
 package/x11r7/xapp_xsm/Config.in                   |    1 +
 package/x11r7/xapp_xstdcmap/Config.in              |    2 +
 package/x11r7/xapp_xvidtune/Config.in              |    2 +
 package/x11r7/xapp_xvinfo/Config.in                |    2 +
 package/x11r7/xapp_xwd/Config.in                   |    2 +
 package/x11r7/xapp_xwininfo/Config.in              |    2 +
 package/x11r7/xapp_xwud/Config.in                  |    1 +
 package/x11r7/xdata_xcursor-themes/Config.in       |    1 +
 package/x11r7/xdriver_xf86-input-acecad/Config.in  |    4 ++
 package/x11r7/xdriver_xf86-input-aiptek/Config.in  |    4 ++
 package/x11r7/xdriver_xf86-input-evdev/Config.in   |    4 ++
 .../x11r7/xdriver_xf86-input-joystick/Config.in    |    4 ++
 .../x11r7/xdriver_xf86-input-keyboard/Config.in    |    5 ++
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |    4 ++
 .../x11r7/xdriver_xf86-input-synaptics/Config.in   |    4 ++
 package/x11r7/xdriver_xf86-input-tslib/Config.in   |    5 ++
 package/x11r7/xdriver_xf86-input-vmmouse/Config.in |    4 ++
 package/x11r7/xdriver_xf86-input-void/Config.in    |    4 ++
 package/x11r7/xdriver_xf86-video-apm/Config.in     |    8 ++++
 package/x11r7/xdriver_xf86-video-ark/Config.in     |    6 +++
 package/x11r7/xdriver_xf86-video-ati/Config.in     |   11 +++++
 package/x11r7/xdriver_xf86-video-chips/Config.in   |    6 +++
 package/x11r7/xdriver_xf86-video-cirrus/Config.in  |    7 +++
 package/x11r7/xdriver_xf86-video-dummy/Config.in   |    7 +++
 package/x11r7/xdriver_xf86-video-fbdev/Config.in   |    6 +++
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    6 +++
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    6 +++
 package/x11r7/xdriver_xf86-video-glint/Config.in   |   12 ++++++
 package/x11r7/xdriver_xf86-video-i128/Config.in    |    7 +++
 package/x11r7/xdriver_xf86-video-i740/Config.in    |    7 +++
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    8 ++++
 package/x11r7/xdriver_xf86-video-mach64/Config.in  |    7 +++
 package/x11r7/xdriver_xf86-video-mga/Config.in     |   11 +++++
 .../x11r7/xdriver_xf86-video-neomagic/Config.in    |    8 ++++
 package/x11r7/xdriver_xf86-video-newport/Config.in |    6 +++
 package/x11r7/xdriver_xf86-video-nv/Config.in      |    7 +++
 .../x11r7/xdriver_xf86-video-openchrome/Config.in  |   12 ++++++
 package/x11r7/xdriver_xf86-video-r128/Config.in    |    7 +++
 .../x11r7/xdriver_xf86-video-rendition/Config.in   |    6 +++
 package/x11r7/xdriver_xf86-video-s3/Config.in      |    7 +++
 package/x11r7/xdriver_xf86-video-s3virge/Config.in |    7 +++
 package/x11r7/xdriver_xf86-video-savage/Config.in  |   10 +++++
 .../xdriver_xf86-video-siliconmotion/Config.in     |    7 +++
 package/x11r7/xdriver_xf86-video-sis/Config.in     |   12 ++++++
 package/x11r7/xdriver_xf86-video-sisusb/Config.in  |    8 ++++
 package/x11r7/xdriver_xf86-video-suncg14/Config.in |    5 ++
 package/x11r7/xdriver_xf86-video-suncg3/Config.in  |    5 ++
 package/x11r7/xdriver_xf86-video-suncg6/Config.in  |    5 ++
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |    8 ++++
 package/x11r7/xdriver_xf86-video-sunleo/Config.in  |    5 ++
 package/x11r7/xdriver_xf86-video-suntcx/Config.in  |    5 ++
 package/x11r7/xdriver_xf86-video-tdfx/Config.in    |   10 +++++
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    8 ++++
 package/x11r7/xdriver_xf86-video-trident/Config.in |    8 ++++
 package/x11r7/xdriver_xf86-video-tseng/Config.in   |    7 +++
 package/x11r7/xdriver_xf86-video-v4l/Config.in     |    4 ++
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    6 +++
 package/x11r7/xdriver_xf86-video-vmware/Config.in  |    7 +++
 package/x11r7/xdriver_xf86-video-voodoo/Config.in  |    7 +++
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    6 +++
 package/x11r7/xdriver_xf86-video-xgi/Config.in     |    7 +++
 package/x11r7/xdriver_xf86-video-xgixp/Config.in   |    7 +++
 package/x11r7/xkeyboard-config/Config.in           |    1 +
 package/x11r7/xlib_libFS/Config.in                 |    3 +
 package/x11r7/xlib_libICE/Config.in                |    2 +
 package/x11r7/xlib_libSM/Config.in                 |    3 +
 package/x11r7/xlib_libX11/Config.in                |   12 ++++++
 package/x11r7/xlib_libXScrnSaver/Config.in         |    3 +
 package/x11r7/xlib_libXau/Config.in                |    2 +
 package/x11r7/xlib_libXaw/Config.in                |    6 +++
 package/x11r7/xlib_libXcomposite/Config.in         |    5 ++
 package/x11r7/xlib_libXcursor/Config.in            |    4 ++
 package/x11r7/xlib_libXdamage/Config.in            |    4 ++
 package/x11r7/xlib_libXdmcp/Config.in              |    2 +
 package/x11r7/xlib_libXext/Config.in               |    3 +
 package/x11r7/xlib_libXfixes/Config.in             |    4 ++
 package/x11r7/xlib_libXfont/Config.in              |    7 +++
 package/x11r7/xlib_libXfontcache/Config.in         |    3 +
 package/x11r7/xlib_libXft/Config.in                |    6 +++
 package/x11r7/xlib_libXi/Config.in                 |    4 ++
 package/x11r7/xlib_libXinerama/Config.in           |    3 +
 package/x11r7/xlib_libXmu/Config.in                |    4 ++
 package/x11r7/xlib_libXp/Config.in                 |    4 ++
 package/x11r7/xlib_libXpm/Config.in                |    4 ++
 package/x11r7/xlib_libXprintAppUtil/Config.in      |    3 +
 package/x11r7/xlib_libXprintUtil/Config.in         |    4 ++
 package/x11r7/xlib_libXrandr/Config.in             |    6 +++
 package/x11r7/xlib_libXrender/Config.in            |    3 +
 package/x11r7/xlib_libXres/Config.in               |    4 ++
 package/x11r7/xlib_libXt/Config.in                 |    6 +++
 package/x11r7/xlib_libXtst/Config.in               |    4 ++
 package/x11r7/xlib_libXv/Config.in                 |    4 ++
 package/x11r7/xlib_libXvMC/Config.in               |    5 ++
 package/x11r7/xlib_libXxf86dga/Config.in           |    4 ++
 package/x11r7/xlib_libXxf86vm/Config.in            |    4 ++
 package/x11r7/xlib_libdmx/Config.in                |    3 +
 package/x11r7/xlib_libfontenc/Config.in            |    1 +
 package/x11r7/xlib_liboldX/Config.in               |    1 +
 package/x11r7/xlib_libxkbfile/Config.in            |    2 +
 package/x11r7/xlib_libxkbui/Config.in              |    3 +
 package/x11r7/xserver_xorg-server/Config.in        |   42 ++++++++++++++++++++
 package/x11vnc/Config.in                           |    1 +
 package/xavante/Config.in                          |    6 +++
 package/xfsprogs/Config.in                         |    2 +
 package/xl2tp/Config.in                            |    1 +
 package/xmlstarlet/Config.in                       |    2 +
 package/xstroke/Config.in                          |    3 +
 package/xterm/Config.in                            |    2 +
 package/xvkbd/Config.in                            |    2 +
 package/zeromq/Config.in                           |    2 +
 406 files changed, 1202 insertions(+), 0 deletions(-)

diff --git a/package/acl/Config.in b/package/acl/Config.in
index 6fbca7a..f73d11c 100644
--- a/package/acl/Config.in
+++ b/package/acl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ACL_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_ATTR_AVAILABLE
 
 config BR2_PACKAGE_ACL
 	bool "acl"
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index ec8a558..29b4638 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ALSA_LIB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ALSA_LIB_PCM_AVAILABLE
 
 config BR2_PACKAGE_ALSA_LIB
 	bool "alsa-lib"
diff --git a/package/alsamixergui/Config.in b/package/alsamixergui/Config.in
index 6095653..426a186 100644
--- a/package/alsamixergui/Config.in
+++ b/package/alsamixergui/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_ALSAMIXERGUI_AVAILABLE
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_PACKAGE_ALSA_LIB_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_ALSA_LIB_MIXER_AVAILABLE
+	depends on BR2_PACKAGE_FLTK_AVAILABLE
+	depends on BR2_PACKAGE_ALSA_LIB_PCM_AVAILABLE
 
 config BR2_PACKAGE_ALSAMIXERGUI
 	select BR2_PACKAGE_XORG7
diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 62d267c..ba57a71 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_APR_UTIL_AVAILABLE
 	def_bool y
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on BR2_PACKAGE_NEON_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_NEON_AVAILABLE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_APR_AVAILABLE
+	depends on BR2_PACKAGE_SQLITE_AVAILABLE
 
 config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
diff --git a/package/argus/Config.in b/package/argus/Config.in
index a8853e0..c266e41 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ARGUS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 
 config BR2_PACKAGE_ARGUS
 	bool "argus"
diff --git a/package/atk/Config.in b/package/atk/Config.in
index 4534761..72f97af 100644
--- a/package/atk/Config.in
+++ b/package/atk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ATK_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_ATK
 	bool "atk"
diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 5f0a4b1..a2b5c06 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AUTOCONF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_MICROPERL_AVAILABLE
 
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
diff --git a/package/automake/Config.in b/package/automake/Config.in
index e5f52a2..f485cd8 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_AUTOMAKE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_AUTOCONF_AVAILABLE
+	depends on BR2_PACKAGE_MICROPERL_AVAILABLE
 
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
diff --git a/package/bash/Config.in b/package/bash/Config.in
index 043fb4e..09b8ba7 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BASH_AVAILABLE
 	def_bool y
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_BASH
 	bool "bash"
diff --git a/package/bison/Config.in b/package/bison/Config.in
index a0a4a7f..c89e458 100644
--- a/package/bison/Config.in
+++ b/package/bison/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BISON_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_M4_AVAILABLE
 
 config BR2_PACKAGE_BISON
 	bool "bison"
diff --git a/package/blackbox/Config.in b/package/blackbox/Config.in
index 1e14aa4..a1cad19 100644
--- a/package/blackbox/Config.in
+++ b/package/blackbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BLACKBOX_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_BLACKBOX
 	bool "blackbox"
diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index 4079501..a9f0690 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BLUEZ_UTILS_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 7bfdcbb..1c4dd8f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -4,6 +4,8 @@ comment "boost requires a toolchain with C++ support enabled"
 config BR2_PACKAGE_BOOST_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BZIP2_AVAILABLE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_BOOST
 	bool "boost"
diff --git a/package/bsdiff/Config.in b/package/bsdiff/Config.in
index e5d1424..b279ddb 100644
--- a/package/bsdiff/Config.in
+++ b/package/bsdiff/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BSDIFF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_BZIP2_AVAILABLE
 
 config BR2_PACKAGE_BSDIFF
 	bool "bsdiff"
diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 2c61751..69f9736 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CAIRO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	depends on BR2_PACKAGE_PIXMAN_AVAILABLE
 
 config BR2_PACKAGE_CAIRO
 	bool "cairo"
diff --git a/package/cdrkit/Config.in b/package/cdrkit/Config.in
index bcd85ef..b03e63a 100644
--- a/package/cdrkit/Config.in
+++ b/package/cdrkit/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_CDRKIT_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBCAP_AVAILABLE
+	depends on BR2_PACKAGE_BZIP2_AVAILABLE
 
 config BR2_PACKAGE_CDRKIT
 	# Needed for libbz
diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index 14514ba..fdbc15c 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CGILUA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LUAFILESYSTEM_AVAILABLE
 
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
diff --git a/package/connman/Config.in b/package/connman/Config.in
index 10d16e8..f4f765d 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -4,6 +4,10 @@ config BR2_PACKAGE_CONNMAN_AVAILABLE
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_IPTABLES_AVAILABLE
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_GNUTLS_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_CONNMAN
 	bool "connman"
diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 2c31226..014ffbc 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_CONNTRACK_TOOLS_AVAILABLE
 	def_bool y
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBNETFILTER_CONNTRACK_AVAILABLE
+	depends on BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT_AVAILABLE
 
 config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
diff --git a/package/copas/Config.in b/package/copas/Config.in
index c56d01b..0149993 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_COPAS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LUASOCKET_AVAILABLE
+	depends on BR2_PACKAGE_COXPCALL_AVAILABLE
 
 config BR2_PACKAGE_COPAS
 	bool "copas"
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
index c815b56..359b5c8 100644
--- a/package/cvs/Config.in
+++ b/package/cvs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_CVS_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_CVS
 	bool "cvs"
diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index a77015e..1c7ab7a 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_DBUS_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
diff --git a/package/dbus-python/Config.in b/package/dbus-python/Config.in
index f540f63..71b9e7e 100644
--- a/package/dbus-python/Config.in
+++ b/package/dbus-python/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DBUS_PYTHON_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_DBUS_AVAILABLE
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 
 config BR2_PACKAGE_DBUS_PYTHON
 	bool "dbus-python"
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index 19736ac..05d4285 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCPDUMP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 
 config BR2_PACKAGE_DHCPDUMP
 	bool "dhcpdump"
diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index f26001d..73ebfa4 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIALOG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index a1e3a42..b3cfaf5 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_DIRECTFB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 0ab7367..8d190e7 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DMRAID_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LVM2_AVAILABLE
 
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
diff --git a/package/docker/Config.in b/package/docker/Config.in
index 40846df..df76033 100644
--- a/package/docker/Config.in
+++ b/package/docker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DOCKER_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_DOCKER
 	bool "docker"
diff --git a/package/dsp-tools/Config.in b/package/dsp-tools/Config.in
index 91b0fac..e95240c 100644
--- a/package/dsp-tools/Config.in
+++ b/package/dsp-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DSP_TOOLS_AVAILABLE
 	def_bool y
 	depends on BR2_cortex_a8
+	depends on BR2_PACKAGE_TIDSP_BINARIES_AVAILABLE
 
 config BR2_PACKAGE_DSP_TOOLS
 	bool "dsp-tools"
diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 74ee200..7fc4744 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DSTAT_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # python
+	depends on BR2_PACKAGE_PYTHON_AVAILABLE
 
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index bfe8559..095205a 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_E2FSPROGS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBBLKID_AVAILABLE
 
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
diff --git a/package/efl/expedite/Config.in b/package/efl/expedite/Config.in
index 2f5fdd3..2ed2394 100644
--- a/package/efl/expedite/Config.in
+++ b/package/efl/expedite/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_EXPEDITE_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBEVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
+	depends on BR2_PACKAGE_LIBEET_AVAILABLE
 
 config BR2_PACKAGE_EXPEDITE
 	bool "expedite"
diff --git a/package/efl/libecore/Config.in b/package/efl/libecore/Config.in
index 67ef94a..dfa52fd 100644
--- a/package/efl/libecore/Config.in
+++ b/package/efl/libecore/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBECORE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBECORE
 	bool "libecore"
diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
index 6019dc1..2ac1880 100644
--- a/package/efl/libedbus/Config.in
+++ b/package/efl/libedbus/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_LIBEDBUS_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBEDBUS
 	bool "libedbus"
diff --git a/package/efl/libedje/Config.in b/package/efl/libedje/Config.in
index 7a377fe..9a37f4a 100644
--- a/package/efl/libedje/Config.in
+++ b/package/efl/libedje/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LIBEDJE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBEMBRYO_AVAILABLE
+	depends on BR2_PACKAGE_LIBEVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
+	depends on BR2_PACKAGE_LUA_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_EVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
+	depends on BR2_PACKAGE_LIBEET_AVAILABLE
 
 config BR2_PACKAGE_LIBEDJE
 	bool "libedje"
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
index f9d5a56..1166a68 100644
--- a/package/efl/libeet/Config.in
+++ b/package/efl/libeet/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBEET_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_JPEG_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBEET
 	bool "libeet"
diff --git a/package/efl/libefreet/Config.in b/package/efl/libefreet/Config.in
index ec7a033..53d55d0 100644
--- a/package/efl/libefreet/Config.in
+++ b/package/efl/libefreet/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBEFREET_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
+	depends on BR2_PACKAGE_LIBEET_AVAILABLE
 
 config BR2_PACKAGE_LIBEFREET
 	bool "libefreet"
diff --git a/package/efl/libelementary/Config.in b/package/efl/libelementary/Config.in
index 0b4cb3d..04c2997 100644
--- a/package/efl/libelementary/Config.in
+++ b/package/efl/libelementary/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_LIBELEMENTARY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBEVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEDJE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBELEMENTARY
 	bool "libelementary"
diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
index efd48c0..8287645 100644
--- a/package/efl/libembryo/Config.in
+++ b/package/efl/libembryo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEMBRYO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBEMBRYO
 	bool "libembryo"
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
index 61629b0..e6eab4a 100644
--- a/package/efl/libethumb/Config.in
+++ b/package/efl/libethumb/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_LIBETHUMB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBEVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEDJE_AVAILABLE
+	depends on BR2_PACKAGE_LIBECORE_EVAS_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb"
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
index d25a03e..b95cf6c 100644
--- a/package/efl/libevas/Config.in
+++ b/package/efl/libevas/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBEVAS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH_AVAILABLE
+	depends on BR2_PACKAGE_LIBEINA_AVAILABLE
 
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas"
diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index e7e86c5..528790c 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ENCHANT_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_ENCHANT
 	bool "enchant"
diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index 5a64aa4..342ad2f 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FBGRAB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPNG_AVAILABLE
 
 config BR2_PACKAGE_FBGRAB
 	bool "fbgrab"
diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
index 87926ef..c94fb2d 100644
--- a/package/fbterm/Config.in
+++ b/package/fbterm/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FBTERM_AVAILABLE
 	def_bool y
 	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	depends on BR2_PACKAGE_LIBERATION_AVAILABLE
 
 config BR2_PACKAGE_FBTERM
 	bool "fbterm"
diff --git a/package/feh/Config.in b/package/feh/Config.in
index a54b6e9..e1e5ba7 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -1,6 +1,13 @@
 config BR2_PACKAGE_FEH_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_IMLIB2_X_AVAILABLE
+	depends on BR2_PACKAGE_IMLIB2_JPEG_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
+	depends on BR2_PACKAGE_GIBLIB_AVAILABLE
+	depends on BR2_PACKAGE_IMLIB2_PNG_AVAILABLE
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_FEH
 	bool "feh"
diff --git a/package/file/Config.in b/package/file/Config.in
index ed60857..34c3229 100644
--- a/package/file/Config.in
+++ b/package/file/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FILE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_FILE
 	bool "file"
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 4a64e55..a9b8506 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FLASHROM_AVAILABLE
 	def_bool y
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_DMIDECODE_AVAILABLE
+	depends on BR2_PACKAGE_PCIUTILS_AVAILABLE
 
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
diff --git a/package/flot/Config.in b/package/flot/Config.in
index d63bcb5..00222c0 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLOT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_JQUERY_AVAILABLE
 
 config BR2_PACKAGE_FLOT
 	bool "flot"
diff --git a/package/fltk/Config.in b/package/fltk/Config.in
index 3738446..aa54294 100644
--- a/package/fltk/Config.in
+++ b/package/fltk/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLTK_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_FLTK
 	bool "fltk"
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index c95d3d4..0b46356 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FLUXBOX_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_FLUXBOX
 	bool "fluxbox"
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 670cfd4..15a0e34 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_FONTCONFIG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 
 config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 112c5b0..f3ca91b 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_FREERDP_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
diff --git a/package/games/prboom/Config.in b/package/games/prboom/Config.in
index aa51225..74aa0ab 100644
--- a/package/games/prboom/Config.in
+++ b/package/games/prboom/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_PRBOOM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_SDL_MIXER_AVAILABLE
+	depends on BR2_PACKAGE_SDL_AVAILABLE
+	depends on BR2_PACKAGE_SDL_NET_AVAILABLE
 
 config BR2_PACKAGE_PRBOOM
 	bool "PrBoom"
diff --git a/package/gamin/Config.in b/package/gamin/Config.in
index d835789..800788c 100644
--- a/package/gamin/Config.in
+++ b/package/gamin/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GAMIN_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_GAMIN
 	bool "gamin"
diff --git a/package/gdk-pixbuf/Config.in b/package/gdk-pixbuf/Config.in
index 7bb6e13..12f9b68 100644
--- a/package/gdk-pixbuf/Config.in
+++ b/package/gdk-pixbuf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GDK_PIXBUF_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_GDK_PIXBUF
 	bool "gdk-pixbuf"
diff --git a/package/giblib/Config.in b/package/giblib/Config.in
index cbbd777..c42cf77 100644
--- a/package/giblib/Config.in
+++ b/package/giblib/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_GIBLIB_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_IMLIB2_X_AVAILABLE
+	depends on BR2_PACKAGE_IMLIB2_AVAILABLE
 
 config BR2_PACKAGE_GIBLIB
 	bool "giblib"
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 6dc6da2..ff51947 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GLIB_NETWORKING_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 6449ff9..6459f3c 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -3,6 +3,14 @@ config BR2_PACKAGE_GMPC_AVAILABLE
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_LIBSOUP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_LIBMPD_AVAILABLE
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_SQLITE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBSM_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
 
 config BR2_PACKAGE_GMPC
 	bool "gmpc"
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index a9271c4..638836c 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNUTLS_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBGCRYPT_AVAILABLE
 
 config BR2_PACKAGE_GNUTLS
 	bool "gnutls"
diff --git a/package/gob2/Config.in b/package/gob2/Config.in
index a39e04f..9376dca 100644
--- a/package/gob2/Config.in
+++ b/package/gob2/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_GOB2_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_LIBFL_AVAILABLE
+	depends on BR2_PACKAGE_BISON_AVAILABLE
 
 config BR2_PACKAGE_GOB2
 	bool "gob2"
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index e453df4..f8246c7 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_GVFS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_SHARED_MIME_INFO_AVAILABLE
 
 config BR2_PACKAGE_GVFS
 	bool "gvfs"
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 7434548..ef79cb3 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOSTAPD_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_PACKAGE_LIBNL_AVAILABLE
 
 config BR2_PACKAGE_HOSTAPD
 	bool "hostapd"
diff --git a/package/htop/Config.in b/package/htop/Config.in
index b644d14..a114386 100644
--- a/package/htop/Config.in
+++ b/package/htop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HTOP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_HTOP
 	bool "htop"
diff --git a/package/ifplugd/Config.in b/package/ifplugd/Config.in
index cff64de..a4bbd33 100644
--- a/package/ifplugd/Config.in
+++ b/package/ifplugd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IFPLUGD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBDAEMON_AVAILABLE
 
 config BR2_PACKAGE_IFPLUGD
 	bool "ifplugd"
diff --git a/package/imlib2/Config.in b/package/imlib2/Config.in
index 069b8a6..cdeba8b 100644
--- a/package/imlib2/Config.in
+++ b/package/imlib2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IMLIB2_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 
 config BR2_PACKAGE_IMLIB2
 	bool "imlib2"
diff --git a/package/ipsec-tools/Config.in b/package/ipsec-tools/Config.in
index b90ec23..6fd4db8 100644
--- a/package/ipsec-tools/Config.in
+++ b/package/ipsec-tools/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_IPSEC_TOOLS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_LIBFL_AVAILABLE
 
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools"
diff --git a/package/ipset/Config.in b/package/ipset/Config.in
index e96c8fe..ddb63c8 100644
--- a/package/ipset/Config.in
+++ b/package/ipset/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IPSET_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBMNL_AVAILABLE
 
 config BR2_PACKAGE_IPSET
 	bool "ipset"
diff --git a/package/iw/Config.in b/package/iw/Config.in
index 4abca8d..d9df279 100644
--- a/package/iw/Config.in
+++ b/package/iw/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IW_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_PACKAGE_LIBNL_AVAILABLE
 
 config BR2_PACKAGE_IW
 	bool "iw"
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
index 4c9d8c3..dccd7ce 100644
--- a/package/jquery-sparkline/Config.in
+++ b/package/jquery-sparkline/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JQUERY_SPARKLINE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_JQUERY_AVAILABLE
 
 config BR2_PACKAGE_JQUERY_SPARKLINE
 	bool "jQuery-Sparkline"
diff --git a/package/jquery-validation/Config.in b/package/jquery-validation/Config.in
index a8a1603..36c3b8e 100644
--- a/package/jquery-validation/Config.in
+++ b/package/jquery-validation/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_JQUERY_VALIDATION_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_JQUERY_AVAILABLE
 
 config BR2_PACKAGE_JQUERY_VALIDATION
 	bool "jQuery-Validation"
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index e868fff..c3dad3d 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -4,6 +4,9 @@ comment "Kismet requires a toolchain with C++ support enabled"
 config BR2_PACKAGE_KISMET_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_NCURSES_TARGET_PANEL_AVAILABLE
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
diff --git a/package/latencytop/Config.in b/package/latencytop/Config.in
index d4c0b2a..f742b1b 100644
--- a/package/latencytop/Config.in
+++ b/package/latencytop/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LATENCYTOP_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_LATENCYTOP
 	bool "latencytop"
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 9231203..7ccb007 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LCDPROC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_LCDPROC
        bool "lcdproc"
diff --git a/package/less/Config.in b/package/less/Config.in
index d71f9f1..c0c8389 100644
--- a/package/less/Config.in
+++ b/package/less/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LESS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_LESS
 	bool "less"
diff --git a/package/libcue/Config.in b/package/libcue/Config.in
index 0645578..dcaba57 100644
--- a/package/libcue/Config.in
+++ b/package/libcue/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBCUE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_LIBFL_AVAILABLE
 
 config BR2_PACKAGE_LIBCUE
 	bool "libcue"
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index da7d729..0ed6c03 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -2,6 +2,12 @@ config BR2_PACKAGE_LIBDRM_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_DRI2PROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_PTHREAD_STUBS_AVAILABLE
 
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 0425976..07e71af 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDVDNAV_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE # libdvdread
+	depends on BR2_PACKAGE_LIBDVDREAD_AVAILABLE
 
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 3a71fa7..35b16a5 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEXOSIP2_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBOSIP2_AVAILABLE
 
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 1dfea84..09b0bdb 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBFREEFARE_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBNFC_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
diff --git a/package/libftdi/Config.in b/package/libftdi/Config.in
index f37ccc7..008d827 100644
--- a/package/libftdi/Config.in
+++ b/package/libftdi/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBFTDI_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_LIBFTDI
 	bool "libftdi"
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index ad0664d..9c9537a 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBGAIL_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
+	depends on BR2_PACKAGE_PANGO_AVAILABLE
 
 config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
index ee4749a..d10f921 100644
--- a/package/libgcrypt/Config.in
+++ b/package/libgcrypt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGCRYPT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBGPG_ERROR_AVAILABLE
 
 config BR2_PACKAGE_LIBGCRYPT
 	bool "libgcrypt"
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 4fd59ce..f3a680f 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBGEOTIFF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_TIFF_AVAILABLE
 
 config BR2_PACKAGE_LIBGEOTIFF
        bool "libgeotiff"
diff --git a/package/libglade/Config.in b/package/libglade/Config.in
index 80b242a..497044f 100644
--- a/package/libglade/Config.in
+++ b/package/libglade/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_LIBGLADE_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_ATK_AVAILABLE
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade"
diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3a47038..4230fa5 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBGLIB2_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_PACKAGE_LIBFFI_AVAILABLE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_LIBGLIB2
 	bool "libglib2"
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c0ecf49..c254df4 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -3,6 +3,14 @@ config BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_PACKAGE_CAIRO_PDF_AVAILABLE
+	depends on BR2_PACKAGE_PANGO_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_PS_AVAILABLE
+	depends on BR2_PACKAGE_ATK_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_GDK_PIXBUF_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_SVG_AVAILABLE
 
 config BR2_PACKAGE_LIBGTK2
 	bool "libgtk2"
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index ec3abb8..8252c3f 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBHID_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_LIBHID
 	bool "libhid"
diff --git a/package/libid3tag/Config.in b/package/libid3tag/Config.in
index 8e13b54..a6cfd5a 100644
--- a/package/libid3tag/Config.in
+++ b/package/libid3tag/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBID3TAG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_LIBID3TAG
 	bool "libid3tag"
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
index 9007752..a72c1c0 100644
--- a/package/libiqrf/Config.in
+++ b/package/libiqrf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBIQRF_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf"
diff --git a/package/libmms/Config.in b/package/libmms/Config.in
index 80fe2e4..24b86ad 100644
--- a/package/libmms/Config.in
+++ b/package/libmms/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMMS_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_LIBMMS
 	bool "libmms"
diff --git a/package/libmpd/Config.in b/package/libmpd/Config.in
index 65eb21b..90fd097 100644
--- a/package/libmpd/Config.in
+++ b/package/libmpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBMPD_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_LIBMPD
 	bool "libmpd"
diff --git a/package/libnetfilter_conntrack/Config.in b/package/libnetfilter_conntrack/Config.in
index cb13940..0ddab22 100644
--- a/package/libnetfilter_conntrack/Config.in
+++ b/package/libnetfilter_conntrack/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBNFNETLINK_AVAILABLE
 
 config BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	bool "libnetfilter_conntrack"
diff --git a/package/libnetfilter_cttimeout/Config.in b/package/libnetfilter_cttimeout/Config.in
index 9781203..e37c565 100644
--- a/package/libnetfilter_cttimeout/Config.in
+++ b/package/libnetfilter_cttimeout/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBMNL_AVAILABLE
 
 config BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
 	bool "libnetfilter_cttimeout"
diff --git a/package/libnfc-llcp/Config.in b/package/libnfc-llcp/Config.in
index 67e88ce..2f0d926 100644
--- a/package/libnfc-llcp/Config.in
+++ b/package/libnfc-llcp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBNFC_LLCP_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBNFC_AVAILABLE
 
 config BR2_PACKAGE_LIBNFC_LLCP
 	bool "libnfc-llcp"
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 065dabc..6046517 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBNFC_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_LIBNFC
 	bool "libnfc"
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index f0ece99..8dbd864 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_LIBNSS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_SQLITE_AVAILABLE
+	depends on BR2_PACKAGE_LIBNSPR_AVAILABLE
 
 config BR2_PACKAGE_LIBNSS
 	bool "libnss"
diff --git a/package/liboauth/Config.in b/package/liboauth/Config.in
index 74e0b4d..6025843 100644
--- a/package/liboauth/Config.in
+++ b/package/liboauth/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBOAUTH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_LIBOAUTH
 	bool "liboauth"
diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index 2e8e0ae..4ad903f 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPCAP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
diff --git a/package/libpng/Config.in b/package/libpng/Config.in
index b0796bb..655bcab 100644
--- a/package/libpng/Config.in
+++ b/package/libpng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPNG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_LIBPNG
 	bool "libpng"
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 331b474..5fb222f 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -2,6 +2,11 @@ config BR2_PACKAGE_LIBRSVG_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_PANGO_AVAILABLE
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_PNG_AVAILABLE
 
 config BR2_PACKAGE_LIBRSVG
 	bool "librsvg"
diff --git a/package/librsync/Config.in b/package/librsync/Config.in
index 9ed2b24..2f04521 100644
--- a/package/librsync/Config.in
+++ b/package/librsync/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LIBRSYNC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_BZIP2_AVAILABLE
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_LIBRSYNC
 	bool "librsync"
diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
index a4d202e..de39d68 100644
--- a/package/libsexy/Config.in
+++ b/package/libsexy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSEXY_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
 
 config BR2_PACKAGE_LIBSEXY
 	bool "libsexy"
diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 190f160..3b3600d 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBSOUP_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2 and gnutls
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_LIBSOUP
 	bool "libsoup"
diff --git a/package/libsvgtiny/Config.in b/package/libsvgtiny/Config.in
index aa28766..903c2d3 100644
--- a/package/libsvgtiny/Config.in
+++ b/package/libsvgtiny/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSVGTINY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
 
 config BR2_PACKAGE_LIBSVGTINY
 	bool "libsvgtiny"
diff --git a/package/libtheora/Config.in b/package/libtheora/Config.in
index c17c96c..2139162 100644
--- a/package/libtheora/Config.in
+++ b/package/libtheora/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBTHEORA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBVORBIS_AVAILABLE
+	depends on BR2_PACKAGE_LIBOGG_AVAILABLE
 
 config BR2_PACKAGE_LIBTHEORA
 	bool "libtheora"
diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
index f26d6cf..e4d877f 100644
--- a/package/libtorrent/Config.in
+++ b/package/libtorrent/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBTORRENT_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_LIBSIGC_AVAILABLE
 
 config BR2_PACKAGE_LIBTORRENT
 	bool "libtorrent"
diff --git a/package/libvorbis/Config.in b/package/libvorbis/Config.in
index dca00da..edd4829 100644
--- a/package/libvorbis/Config.in
+++ b/package/libvorbis/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBVORBIS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBOGG_AVAILABLE
 
 config BR2_PACKAGE_LIBVORBIS
 	bool "libvorbis"
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
index a3028b3..3ae04d0 100644
--- a/package/libxml-parser-perl/Config.in
+++ b/package/libxml-parser-perl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBXML_PARSER_PERL_AVAILABLE
 	def_bool y
        depends on BR2_HOST_ONLY
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 
 config BR2_PACKAGE_LIBXML_PARSER_PERL
        bool "libxml-parser-perl"
diff --git a/package/libxslt/Config.in b/package/libxslt/Config.in
index 0e3d4b2..ad39f03 100644
--- a/package/libxslt/Config.in
+++ b/package/libxslt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBXSLT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
 
 config BR2_PACKAGE_LIBXSLT
 	bool "libxslt"
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index f641009..6f34190 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LINPHONE_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
+	depends on BR2_PACKAGE_ORTP_AVAILABLE
+	depends on BR2_PACKAGE_MEDIASTREAMER_AVAILABLE
+	depends on BR2_PACKAGE_SPEEX_AVAILABLE
+	depends on BR2_PACKAGE_LIBEXOSIP2_AVAILABLE
 
 config BR2_PACKAGE_LINPHONE
 	bool "linphone"
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index e75da43..dc034c8 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LINUX_PAM_AVAILABLE
 	def_bool y
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_LIBFL_AVAILABLE
 
 config BR2_PACKAGE_LINUX_PAM
 	bool "linux-pam"
diff --git a/package/lockfile-progs/Config.in b/package/lockfile-progs/Config.in
index ce10a94..17605da 100644
--- a/package/lockfile-progs/Config.in
+++ b/package/lockfile-progs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LOCKFILE_PROGS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBLOCKFILE_AVAILABLE
 
 config BR2_PACKAGE_LOCKFILE_PROGS
 	bool "lockfile programs"
diff --git a/package/logrotate/Config.in b/package/logrotate/Config.in
index 0130b0c..fee0c51 100644
--- a/package/logrotate/Config.in
+++ b/package/logrotate/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LOGROTATE_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_LOGROTATE
 	bool "logrotate"
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index c3f9714..b528437 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LTRACE_AVAILABLE
 	def_bool y
 	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
+	depends on BR2_PACKAGE_LIBELF_AVAILABLE
 
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 23ef11f..0958b7f 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LTTNG_BABELTRACE_AVAILABLE
 	depends on BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_LTTNG_BABELTRACE
 	bool "lttng-babeltrace"
diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index f22c75e..398ae70 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LTTNG_LIBUST_AVAILABLE
 	depends on BR2_USE_WCHAR
 	depends on BR2_LARGEFILE
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_LIBURCU_AVAILABLE
 
 config BR2_PACKAGE_LTTNG_LIBUST
 	bool "lttng-libust"
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 3bd95fc..5362a18 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_LTTNG_TOOLS_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_LTTNG_MODULES_AVAILABLE
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBURCU_AVAILABLE
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_LTTNG_TOOLS
 	bool "lttng-tools"
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 4e893d3..383b1a0 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUAEXPAT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
diff --git a/package/lzop/Config.in b/package/lzop/Config.in
index 43136d5..f903434 100644
--- a/package/lzop/Config.in
+++ b/package/lzop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LZOP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LZO_AVAILABLE
 
 config BR2_PACKAGE_LZOP
 	bool "lzop"
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index d393e52..4a0af87 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -1,6 +1,11 @@
 config BR2_PACKAGE_MATCHBOX_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index c20e056..55eff6d 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MEDIASTREAMER_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+	depends on BR2_PACKAGE_ORTP_AVAILABLE
 
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
diff --git a/package/midori/Config.in b/package/midori/Config.in
index f350314..ae35bd0 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_MIDORI_AVAILABLE
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_PACKAGE_LIBSEXY_AVAILABLE
+	depends on BR2_PACKAGE_WEBKIT_AVAILABLE
 
 config BR2_PACKAGE_MIDORI
 	bool "midori"
diff --git a/package/minicom/Config.in b/package/minicom/Config.in
index 76c1391..63d93bb 100644
--- a/package/minicom/Config.in
+++ b/package/minicom/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MINICOM_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_MINICOM
 	bool "minicom"
diff --git a/package/mpc/Config.in b/package/mpc/Config.in
index 8ec89e6..6514cb3 100644
--- a/package/mpc/Config.in
+++ b/package/mpc/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MPC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_GMP_AVAILABLE
+	depends on BR2_PACKAGE_MPFR_AVAILABLE
 
 config BR2_PACKAGE_MPC
 	bool "mpc"
diff --git a/package/mpfr/Config.in b/package/mpfr/Config.in
index 1df1ffc..11f4101 100644
--- a/package/mpfr/Config.in
+++ b/package/mpfr/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_MPFR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_GMP_AVAILABLE
 
 config BR2_PACKAGE_MPFR
 	bool "mpfr"
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
index b8ccf08..3e1c24d 100644
--- a/package/mtdev2tuio/Config.in
+++ b/package/mtdev2tuio/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MTDEV2TUIO_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
+	depends on BR2_PACKAGE_MTDEV_AVAILABLE
+	depends on BR2_PACKAGE_LIBLO_AVAILABLE
 
 config BR2_PACKAGE_MTDEV2TUIO
 	bool "mtdev2tuio"
diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index fd21957..47b5cd7 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ALSA_UTILS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_ALSA_LIB_AVAILABLE
 
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
diff --git a/package/multimedia/aumix/Config.in b/package/multimedia/aumix/Config.in
index 7987915..796c186 100644
--- a/package/multimedia/aumix/Config.in
+++ b/package/multimedia/aumix/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AUMIX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_AUMIX
 	bool "aumix"
diff --git a/package/multimedia/gst-dsp/Config.in b/package/multimedia/gst-dsp/Config.in
index 66c542d..aeda66f 100644
--- a/package/multimedia/gst-dsp/Config.in
+++ b/package/multimedia/gst-dsp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST_DSP_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_GSTREAMER && BR2_cortex_a8
+	depends on BR2_PACKAGE_TIDSP_BINARIES_AVAILABLE
 
 config BR2_PACKAGE_GST_DSP
 	bool "gst-dsp"
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
index 2ed797e..bc1b247 100644
--- a/package/multimedia/gst-ffmpeg/Config.in
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -3,6 +3,11 @@ config BR2_PACKAGE_GST_FFMPEG_AVAILABLE
 	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_FFMPEG_POSTPROC_AVAILABLE
+	depends on BR2_PACKAGE_FFMPEG_GPL_AVAILABLE
+	depends on BR2_PACKAGE_FFMPEG_AVAILABLE
+	depends on BR2_PACKAGE_FFMPEG_SWSCALE_AVAILABLE
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 
 config BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index d5e9f1a..1fae9a4 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST_PLUGINS_BAD_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
 	bool "gst-plugins-bad"
diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index ba79da5..0b1a09f 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST_PLUGINS_GOOD_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_GOOD
 	bool "gst-plugins-good"
diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index f2784c9..8cb8cfb 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST_PLUGINS_UGLY_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_GSTREAMER_AVAILABLE
+	depends on BR2_PACKAGE_GST_PLUGINS_BASE_AVAILABLE
 
 menuconfig BR2_PACKAGE_GST_PLUGINS_UGLY
 	bool "gst-plugins-ugly"
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index bc5507f..3a2b52a 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GSTREAMER_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
diff --git a/package/multimedia/madplay/Config.in b/package/multimedia/madplay/Config.in
index 92ce1e4..1505219 100644
--- a/package/multimedia/madplay/Config.in
+++ b/package/multimedia/madplay/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MADPLAY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBMAD_AVAILABLE
+	depends on BR2_PACKAGE_LIBID3TAG_AVAILABLE
 
 config BR2_PACKAGE_MADPLAY
 	bool "madplay"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 84de844..66464cd 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MPD_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
diff --git a/package/multimedia/musepack/Config.in b/package/multimedia/musepack/Config.in
index 15ab2da..e8800c2 100644
--- a/package/multimedia/musepack/Config.in
+++ b/package/multimedia/musepack/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MUSEPACK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBCUEFILE_AVAILABLE
+	depends on BR2_PACKAGE_LIBREPLAYGAIN_AVAILABLE
 
 config BR2_PACKAGE_MUSEPACK
 	bool "musepack"
diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 21ee4ea..1114e74 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PULSEAUDIO_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBTOOL_AVAILABLE
+	depends on BR2_PACKAGE_JSON_C_AVAILABLE
+	depends on BR2_PACKAGE_SPEEX_AVAILABLE
+	depends on BR2_PACKAGE_LIBSNDFILE_AVAILABLE
 
 config BR2_PACKAGE_PULSEAUDIO
 	bool "pulseaudio"
diff --git a/package/multimedia/vorbis-tools/Config.in b/package/multimedia/vorbis-tools/Config.in
index 4ad76ab..05fce95 100644
--- a/package/multimedia/vorbis-tools/Config.in
+++ b/package/multimedia/vorbis-tools/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_VORBIS_TOOLS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBVORBIS_AVAILABLE
+	depends on BR2_PACKAGE_LIBAO_AVAILABLE
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
+	depends on BR2_PACKAGE_LIBOGG_AVAILABLE
 
 config BR2_PACKAGE_VORBIS_TOOLS
 	bool "vorbis-tools"
diff --git a/package/mutt/Config.in b/package/mutt/Config.in
index 03062f6..79596e8 100644
--- a/package/mutt/Config.in
+++ b/package/mutt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MUTT_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_MUTT
 	bool "mutt"
diff --git a/package/mysql_client/Config.in b/package/mysql_client/Config.in
index 23b416b..b539b5a 100644
--- a/package/mysql_client/Config.in
+++ b/package/mysql_client/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_MYSQL_CLIENT_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_READLINE_AVAILABLE
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_MYSQL_CLIENT
 	bool "MySQL client"
diff --git a/package/nano/Config.in b/package/nano/Config.in
index 9db120a..d186173 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NANO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_NANO
 	bool "nano"
diff --git a/package/nbd/Config.in b/package/nbd/Config.in
index 3be526c..e2be1e7 100644
--- a/package/nbd/Config.in
+++ b/package/nbd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NBD_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_NBD
 	bool "nbd"
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index b72e0ef..b8af80e 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_NETATALK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBGCRYPT_AVAILABLE
+	depends on BR2_PACKAGE_LIBGPG_ERROR_AVAILABLE
+	depends on BR2_PACKAGE_BERKELEYDB_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_NETATALK
 	bool "netatalk"
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
index e5b98d4..2885c75 100644
--- a/package/netkittelnet/Config.in
+++ b/package/netkittelnet/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITTELNET_AVAILABLE
 	def_bool y
 	depends on BR2_INET_RPC
+	depends on BR2_PACKAGE_NETKITBASE_AVAILABLE
 
 config BR2_PACKAGE_NETKITTELNET
 	bool "netkittelnet"
diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 254458e..cd970cb 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,6 +5,16 @@ config BR2_PACKAGE_NETWORK_MANAGER_AVAILABLE
 	depends on BR2_LARGEFILE # acl
 	depends on BR2_USE_WCHAR # libglib2 and gnutls
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_WIRELESS_TOOLS_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_UDEV_ALL_EXTRAS_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_GNUTLS_AVAILABLE
+	depends on BR2_PACKAGE_UDEV_AVAILABLE
+	depends on BR2_PACKAGE_LIBNL_AVAILABLE
+	depends on BR2_PACKAGE_WIRELESS_TOOLS_LIB_AVAILABLE
+	depends on BR2_PACKAGE_DBUS_GLIB_AVAILABLE
 
 config BR2_PACKAGE_NETWORK_MANAGER
 	bool "NetworkManager"
diff --git a/package/newt/Config.in b/package/newt/Config.in
index 547911a..8a6ebbd 100644
--- a/package/newt/Config.in
+++ b/package/newt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NEWT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_SLANG_AVAILABLE
 
 config BR2_PACKAGE_NEWT
 	bool "newt"
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index ecb7d05..f84fa37 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_NFS_UTILS_AVAILABLE
 	def_bool y
 	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_PORTMAP_AVAILABLE
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index 720d372..892c57a 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGIRCD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
diff --git a/package/ngrep/Config.in b/package/ngrep/Config.in
index 258f7c0..8405679 100644
--- a/package/ngrep/Config.in
+++ b/package/ngrep/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NGREP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
+	depends on BR2_PACKAGE_PCRE_AVAILABLE
 
 config BR2_PACKAGE_NGREP
 	bool "ngrep"
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index 55e0607..36a074f 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_OFONO_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # gettext/libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
+	depends on BR2_PACKAGE_LIBCAP_NG_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO_AVAILABLE
 
 config BR2_PACKAGE_OFONO
 	bool "ofono"
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d0f953f..77f25c3 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENCV_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index b53535d..961422c 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_OPENOCD_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index de3b1e1..d1f70e9 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENSSH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 0382826..c592b67 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENSSL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_OPENSSL
 	bool "openssl"
diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 7d09454..3dd54bc 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENSWAN_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_IPROUTE2_AVAILABLE
+	depends on BR2_PACKAGE_GMP_AVAILABLE
 
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9525eec..56e991e 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_OPROFILE_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_BINUTILS_AVAILABLE
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
diff --git a/package/pango/Config.in b/package/pango/Config.in
index c064f91..e81f3e3 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_PANGO_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_AVAILABLE
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
 
 config BR2_PACKAGE_PANGO
 	bool "pango"
diff --git a/package/parted/Config.in b/package/parted/Config.in
index a5f8422..d26f714 100644
--- a/package/parted/Config.in
+++ b/package/parted/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_PARTED_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_LVM2_AVAILABLE
+	depends on BR2_PACKAGE_READLINE_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
 
 config BR2_PACKAGE_PARTED
 	bool "parted"
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 5ebdeb5..48d411d 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PCMANFM_AVAILABLE
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
+	depends on BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
+	depends on BR2_PACKAGE_GAMIN_AVAILABLE
 
 config BR2_PACKAGE_PCMANFM
 	bool "pcmanfm"
diff --git a/package/pkg-config/Config.in b/package/pkg-config/Config.in
index a7edcfc..9644fe4 100644
--- a/package/pkg-config/Config.in
+++ b/package/pkg-config/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PKG_CONFIG_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_PKG_CONFIG
 	bool "pkg-config"
diff --git a/package/poco/Config.in b/package/poco/Config.in
index 449fa93..a4f163c 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_POCO_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_PCRE_AVAILABLE
 
 config BR2_PACKAGE_POCO
 	bool "poco"
diff --git a/package/procps/Config.in b/package/procps/Config.in
index 0af3bdf..942fef8 100644
--- a/package/procps/Config.in
+++ b/package/procps/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROCPS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_PROCPS
 	bool "procps"
diff --git a/package/psmisc/Config.in b/package/psmisc/Config.in
index 05fe88d..7339f5c 100644
--- a/package/psmisc/Config.in
+++ b/package/psmisc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PSMISC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_PSMISC
 	bool "psmisc"
diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index 61383d9..82a0903 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_DPKT_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
diff --git a/package/python-mad/Config.in b/package/python-mad/Config.in
index ea42057..62d7f34 100644
--- a/package/python-mad/Config.in
+++ b/package/python-mad/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_MAD_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_LIBMAD_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_MAD
 	bool "python-mad"
diff --git a/package/python-meld3/Config.in b/package/python-meld3/Config.in
index 66379e5..6218275 100644
--- a/package/python-meld3/Config.in
+++ b/package/python-meld3/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_PYEXPAT_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3"
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
index 4d092ed..7c6a232 100644
--- a/package/python-netifaces/Config.in
+++ b/package/python-netifaces/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_NETIFACES_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_NETIFACES
 	bool "python-netifaces"
diff --git a/package/python-nfc/Config.in b/package/python-nfc/Config.in
index 4855cf2..7a298c2 100644
--- a/package/python-nfc/Config.in
+++ b/package/python-nfc/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_NFC_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_NFC
 	bool "python-nfc"
diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index 728351f..53f38de 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYGAME_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_SDL_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "pygame"
diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 74b511d..51f9c48 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_ZLIB_AVAILABLE
 
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
diff --git a/package/python/Config.in b/package/python/Config.in
index ebcbef2..f76c8e6 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBFFI_AVAILABLE
 
 config BR2_PACKAGE_PYTHON
 	bool "python"
diff --git a/package/quota/Config.in b/package/quota/Config.in
index 8a41b4d..f16de02 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_QUOTA_AVAILABLE
 	depends on BR2_INET_RPC
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_MOUNT_AVAILABLE
 
 config BR2_PACKAGE_QUOTA
 	bool "quota"
diff --git a/package/radvd/Config.in b/package/radvd/Config.in
index bfcb1f5..e3ef4f1 100644
--- a/package/radvd/Config.in
+++ b/package/radvd/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_RADVD_AVAILABLE
 	def_bool y
 	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_LIBDAEMON_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_AVAILABLE
+	depends on BR2_PACKAGE_FLEX_LIBFL_AVAILABLE
 
 config BR2_PACKAGE_RADVD
 	bool "radvd"
diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 0168a09..7abb5ea 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_RDESKTOP_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
diff --git a/package/readline/Config.in b/package/readline/Config.in
index b46bb2c..c7986a0 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_READLINE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_READLINE
 	bool "readline"
diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index e6a0112..947f672 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_ARGP_STANDALONE_AVAILABLE
 
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index f807cec..b74d435 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -9,6 +9,11 @@ config BR2_PACKAGE_RPM_AVAILABLE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_PACKAGE_NEON
 	depends on !BR2_PACKAGE_NEON_NOXML
+	depends on BR2_PACKAGE_NEON_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_NEON_SSL_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_BEECRYPT_AVAILABLE
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index d52f8e4..f86318c 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_RRDTOOL_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_LIBPNG_AVAILABLE
+	depends on BR2_PACKAGE_LIBART_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 
 config BR2_PACKAGE_RRDTOOL
 	bool "rrdtool"
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 4f1a445..df72d35 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -2,6 +2,11 @@ config BR2_PACKAGE_RTORRENT_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBTORRENT_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_LIBSIGC_AVAILABLE
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
 
 config BR2_PACKAGE_RTORRENT
 	bool "rtorrent"
diff --git a/package/samba/Config.in b/package/samba/Config.in
index 036505b..3a89061 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SAMBA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_POPT_AVAILABLE
 
 config BR2_PACKAGE_SAMBA
 	bool "samba"
diff --git a/package/screen/Config.in b/package/screen/Config.in
index cc0cc46..9fa9c18 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SCREEN_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_SCREEN
 	bool "screen"
diff --git a/package/sdl_ttf/Config.in b/package/sdl_ttf/Config.in
index 06c7301..ec24e1d 100644
--- a/package/sdl_ttf/Config.in
+++ b/package/sdl_ttf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SDL_TTF_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_SDL_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 
 config BR2_PACKAGE_SDL_TTF
 	bool "SDL_TTF"
diff --git a/package/shared-mime-info/Config.in b/package/shared-mime-info/Config.in
index d3ffe6d..0113653 100644
--- a/package/shared-mime-info/Config.in
+++ b/package/shared-mime-info/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SHARED_MIME_INFO_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_SHARED_MIME_INFO
 	bool "shared-mime-info"
diff --git a/package/socketcand/Config.in b/package/socketcand/Config.in
index 059f6f5..989f909 100644
--- a/package/socketcand/Config.in
+++ b/package/socketcand/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SOCKETCAND_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBCONFIG_AVAILABLE
 
 config BR2_PACKAGE_SOCKETCAND
 	bool "socketcand"
diff --git a/package/speex/Config.in b/package/speex/Config.in
index 223eee9..c5e3305 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SPEEX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBOGG_AVAILABLE
 
 config BR2_PACKAGE_SPEEX
 	bool "speex"
diff --git a/package/sqlcipher/Config.in b/package/sqlcipher/Config.in
index 8afbddb..5360102 100644
--- a/package/sqlcipher/Config.in
+++ b/package/sqlcipher/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLCIPHER_AVAILABLE
 	def_bool y
 	depends on !BR2_PACKAGE_SQLITE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_SQLCIPHER
 	bool "sqlcipher"
diff --git a/package/squid/Config.in b/package/squid/Config.in
index d09267e..77845f8 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_SQUID_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_LIBCAP_AVAILABLE
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index d5e544e..4d8a53f 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_SSHFS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_OPENSSH_AVAILABLE
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
+	depends on BR2_PACKAGE_LIBFUSE_AVAILABLE
 
 config BR2_PACKAGE_SSHFS
 	bool "sshfs (FUSE)"
diff --git a/package/startup-notification/Config.in b/package/startup-notification/Config.in
index 305fcd9..a039302 100644
--- a/package/startup-notification/Config.in
+++ b/package/startup-notification/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_STARTUP_NOTIFICATION_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_STARTUP_NOTIFICATION
 	bool "startup-notification"
diff --git a/package/statserial/Config.in b/package/statserial/Config.in
index ef48c02..c2e11f2 100644
--- a/package/statserial/Config.in
+++ b/package/statserial/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STATSERIAL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_STATSERIAL
 	bool "statserial"
diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index e3ee61a..0ba144c 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STUNNEL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
 
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index bed8a61..8ae0b35 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_SUPERVISOR_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_PYTHON_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_SETUPTOOLS_AVAILABLE
+	depends on BR2_PACKAGE_PYTHON_MELD3_AVAILABLE
 
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 3e76269..0dad3ef 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYNERGY_AVAILABLE
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
 
 config BR2_PACKAGE_SYNERGY
 	bool "synergy"
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 79e387a..0f0f712 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SYSPROF_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index b73212f..1ba8e03 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_SYSTEMD_AVAILABLE
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
+	depends on BR2_PACKAGE_LIBCAP_AVAILABLE
+	depends on BR2_PACKAGE_DBUS_AVAILABLE
 
 config BR2_PACKAGE_SYSTEMD
 	bool "systemd"
diff --git a/package/tcpdump/Config.in b/package/tcpdump/Config.in
index 42af213..68a562b 100644
--- a/package/tcpdump/Config.in
+++ b/package/tcpdump/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TCPDUMP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 
 config BR2_PACKAGE_TCPDUMP
 	bool "tcpdump"
diff --git a/package/tcpreplay/Config.in b/package/tcpreplay/Config.in
index c907b2a..7c3736d 100644
--- a/package/tcpreplay/Config.in
+++ b/package/tcpreplay/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TCPREPLAY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 
 config BR2_PACKAGE_TCPREPLAY
 	bool "tcpreplay"
diff --git a/package/ti-utils/Config.in b/package/ti-utils/Config.in
index 2bd1ab5c..2d3b606 100644
--- a/package/ti-utils/Config.in
+++ b/package/ti-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TI_UTILS_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	depends on BR2_PACKAGE_LIBNL_AVAILABLE
 
 config BR2_PACKAGE_TI_UTILS
 	bool "ti-utils"
diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
index 39a9841..ea86d39 100644
--- a/package/tn5250/Config.in
+++ b/package/tn5250/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TN5250_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_TN5250
 	bool "tn5250"
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 3c888bc..4ab1003 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_TRANSMISSION_AVAILABLE
 	def_bool y
 	depends on BR2_INET_IPV6
+	depends on BR2_PACKAGE_ZLIB_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
+	depends on BR2_PACKAGE_LIBEVENT_AVAILABLE
 
 config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
diff --git a/package/udev/Config.in b/package/udev/Config.in
index 651087a..18e197e 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_UDEV_AVAILABLE
 	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_PACKAGE_KMOD_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBBLKID_AVAILABLE
 
 config BR2_PACKAGE_UDEV
 	bool "udev"
diff --git a/package/uemacs/Config.in b/package/uemacs/Config.in
index 412ea9d..d0aec17 100644
--- a/package/uemacs/Config.in
+++ b/package/uemacs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UEMACS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_UEMACS
 	bool "uemacs"
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index ba437e7..24c0610 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UNIONFS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBFUSE_AVAILABLE
 
 config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
index 0292985..b878f6e 100644
--- a/package/usb_modeswitch/Config.in
+++ b/package/usb_modeswitch/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_USB_MODESWITCH_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_COMPAT_AVAILABLE
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_USB_MODESWITCH
 	bool "usb_modeswitch"
diff --git a/package/usb_modeswitch_data/Config.in b/package/usb_modeswitch_data/Config.in
index ae05890..3e7bfc5 100644
--- a/package/usb_modeswitch_data/Config.in
+++ b/package/usb_modeswitch_data/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_USB_MODESWITCH_DATA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_USB_MODESWITCH_AVAILABLE
+	depends on BR2_PACKAGE_TCL_TCLSH_AVAILABLE
+	depends on BR2_PACKAGE_TCL_AVAILABLE
 
 config BR2_PACKAGE_USB_MODESWITCH_DATA
 	bool "usb_modeswitch_data"
diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index 66a9fcb..a672867 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_USBMOUNT_AVAILABLE
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_PACKAGE_UDEV_AVAILABLE
+	depends on BR2_PACKAGE_LOCKFILE_PROGS_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBBLKID_AVAILABLE
 
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 72c5279..d5976bf 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBUTILS_AVAILABLE
 	def_bool y
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_PACKAGE_LIBUSB_AVAILABLE
 
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
diff --git a/package/ushare/Config.in b/package/ushare/Config.in
index dcb2ef7..65dcc5d 100644
--- a/package/ushare/Config.in
+++ b/package/ushare/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USHARE_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_LIBUPNP_AVAILABLE
 
 config BR2_PACKAGE_USHARE
 	bool "ushare"
diff --git a/package/vala/Config.in b/package/vala/Config.in
index a022acc..013b3fa 100644
--- a/package/vala/Config.in
+++ b/package/vala/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VALA_AVAILABLE
 	def_bool y
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_LIBGLIB2_AVAILABLE
 
 config BR2_PACKAGE_VALA
 	bool "vala"
diff --git a/package/vim/Config.in b/package/vim/Config.in
index 99fa37c..020eb94 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VIM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_VIM
 	bool "vim"
diff --git a/package/vpnc/Config.in b/package/vpnc/Config.in
index b1d7588..4a65ae5 100644
--- a/package/vpnc/Config.in
+++ b/package/vpnc/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_VPNC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBGCRYPT_AVAILABLE
+	depends on BR2_PACKAGE_LIBGPG_ERROR_AVAILABLE
 
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index 37b0ffc..639f39b 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_VTUN_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_LZO_AVAILABLE
 
 config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index bd26ebc..549355f 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -3,6 +3,15 @@ config BR2_PACKAGE_WEBKIT_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2_AVAILABLE
+	depends on BR2_PACKAGE_LIBSOUP_AVAILABLE
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_ICU_AVAILABLE
+	depends on BR2_PACKAGE_LIBXSLT_AVAILABLE
+	depends on BR2_PACKAGE_SQLITE_AVAILABLE
+	depends on BR2_PACKAGE_ENCHANT_AVAILABLE
+	depends on BR2_PACKAGE_LIBCURL_AVAILABLE
+	depends on BR2_PACKAGE_LIBGAIL_AVAILABLE
+	depends on BR2_PACKAGE_CAIRO_PNG_AVAILABLE
 
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 43efcf4..779029e 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_WSAPI_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LUAFILESYSTEM_AVAILABLE
+	depends on BR2_PACKAGE_COXPCALL_AVAILABLE
+	depends on BR2_PACKAGE_RINGS_AVAILABLE
 
 config BR2_PACKAGE_WSAPI
 	bool "wsapi"
diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index bdb2c90..9002f68 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_LIBXCB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	depends on BR2_PACKAGE_PTHREAD_STUBS_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
+	depends on BR2_PACKAGE_XCB_PROTO_AVAILABLE
 
 config BR2_PACKAGE_LIBXCB
 	bool "libxcb"
diff --git a/package/x11r7/mesa3d/Config.in b/package/x11r7/mesa3d/Config.in
index 1237eeb..0da1a18 100644
--- a/package/x11r7/mesa3d/Config.in
+++ b/package/x11r7/mesa3d/Config.in
@@ -2,6 +2,13 @@ config BR2_PACKAGE_MESA3D_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XSERVER_xorg_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_DRI2PROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
+	depends on BR2_PACKAGE_EXPAT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
 
 config BR2_PACKAGE_MESA3D
 	bool "Mesa 3D Graphics Library"
diff --git a/package/x11r7/xapp_appres/Config.in b/package/x11r7/xapp_appres/Config.in
index b0c19dd..39e4c26 100644
--- a/package/x11r7/xapp_appres/Config.in
+++ b/package/x11r7/xapp_appres/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_APPRES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_APPRES
 	bool "appres"
diff --git a/package/x11r7/xapp_bdftopcf/Config.in b/package/x11r7/xapp_bdftopcf/Config.in
index f738419..68ae3ce 100644
--- a/package/x11r7/xapp_bdftopcf/Config.in
+++ b/package/x11r7/xapp_bdftopcf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_BDFTOPCF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_BDFTOPCF
 	bool "bdftopcf"
diff --git a/package/x11r7/xapp_beforelight/Config.in b/package/x11r7/xapp_beforelight/Config.in
index f06738d..2179820 100644
--- a/package/x11r7/xapp_beforelight/Config.in
+++ b/package/x11r7/xapp_beforelight/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_BEFORELIGHT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXSCRNSAVER_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_BEFORELIGHT
 	bool "beforelight"
diff --git a/package/x11r7/xapp_bitmap/Config.in b/package/x11r7/xapp_bitmap/Config.in
index efc8007..29f253e 100644
--- a/package/x11r7/xapp_bitmap/Config.in
+++ b/package/x11r7/xapp_bitmap/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_BITMAP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_BITMAP
 	bool "bitmap"
diff --git a/package/x11r7/xapp_editres/Config.in b/package/x11r7/xapp_editres/Config.in
index 1586de7..f5f8145 100644
--- a/package/x11r7/xapp_editres/Config.in
+++ b/package/x11r7/xapp_editres/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_EDITRES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_EDITRES
 	bool "editres"
diff --git a/package/x11r7/xapp_fonttosfnt/Config.in b/package/x11r7/xapp_fonttosfnt/Config.in
index 684123d..07c9585 100644
--- a/package/x11r7/xapp_fonttosfnt/Config.in
+++ b/package/x11r7/xapp_fonttosfnt/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_FONTTOSFNT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
 
 config BR2_PACKAGE_XAPP_FONTTOSFNT
 	bool "fonttosfnt"
diff --git a/package/x11r7/xapp_fslsfonts/Config.in b/package/x11r7/xapp_fslsfonts/Config.in
index b31bce2..d26d64e 100644
--- a/package/x11r7/xapp_fslsfonts/Config.in
+++ b/package/x11r7/xapp_fslsfonts/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_FSLSFONTS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_FSLSFONTS
 	bool "fslsfonts"
diff --git a/package/x11r7/xapp_fstobdf/Config.in b/package/x11r7/xapp_fstobdf/Config.in
index a82fc17..6e7860c 100644
--- a/package/x11r7/xapp_fstobdf/Config.in
+++ b/package/x11r7/xapp_fstobdf/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_FSTOBDF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_FSTOBDF
 	bool "fstobdf"
diff --git a/package/x11r7/xapp_iceauth/Config.in b/package/x11r7/xapp_iceauth/Config.in
index 1802936..8b1b6e1 100644
--- a/package/x11r7/xapp_iceauth/Config.in
+++ b/package/x11r7/xapp_iceauth/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_ICEAUTH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_ICEAUTH
 	bool "iceauth"
diff --git a/package/x11r7/xapp_ico/Config.in b/package/x11r7/xapp_ico/Config.in
index d797212..f5dee1d 100644
--- a/package/x11r7/xapp_ico/Config.in
+++ b/package/x11r7/xapp_ico/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_ICO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_ICO
 	bool "ico"
diff --git a/package/x11r7/xapp_listres/Config.in b/package/x11r7/xapp_listres/Config.in
index e718445..e40e0eb 100644
--- a/package/x11r7/xapp_listres/Config.in
+++ b/package/x11r7/xapp_listres/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_LISTRES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_LISTRES
 	bool "listres"
diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index c29b005..c88be81 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_LUIT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
 
 config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
index ae0643a..255b408 100644
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ b/package/x11r7/xapp_mkfontdir/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_MKFONTDIR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XAPP_MKFONTSCALE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_MKFONTDIR
 	bool "mkfontdir"
diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index 67afb3b..3486d7e 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_MKFONTSCALE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
 
 config BR2_PACKAGE_XAPP_MKFONTSCALE
 	bool "mkfontscale"
diff --git a/package/x11r7/xapp_oclock/Config.in b/package/x11r7/xapp_oclock/Config.in
index caa4530..fe75566 100644
--- a/package/x11r7/xapp_oclock/Config.in
+++ b/package/x11r7/xapp_oclock/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_OCLOCK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_OCLOCK
 	bool "oclock"
diff --git a/package/x11r7/xapp_rgb/Config.in b/package/x11r7/xapp_rgb/Config.in
index 8ada3c2..1cd5614 100644
--- a/package/x11r7/xapp_rgb/Config.in
+++ b/package/x11r7/xapp_rgb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_RGB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_RGB
 	bool "rgb"
diff --git a/package/x11r7/xapp_rstart/Config.in b/package/x11r7/xapp_rstart/Config.in
index a0ed6c1..90b8bf4 100644
--- a/package/x11r7/xapp_rstart/Config.in
+++ b/package/x11r7/xapp_rstart/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_RSTART_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_RSTART
 	bool "rstart"
diff --git a/package/x11r7/xapp_scripts/Config.in b/package/x11r7/xapp_scripts/Config.in
index 32a9080..041bde9 100644
--- a/package/x11r7/xapp_scripts/Config.in
+++ b/package/x11r7/xapp_scripts/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_SCRIPTS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_SCRIPTS
 	bool "scripts"
diff --git a/package/x11r7/xapp_sessreg/Config.in b/package/x11r7/xapp_sessreg/Config.in
index 1d859fc..c462b69 100644
--- a/package/x11r7/xapp_sessreg/Config.in
+++ b/package/x11r7/xapp_sessreg/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_SESSREG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_SESSREG
 	bool "sessreg"
diff --git a/package/x11r7/xapp_setxkbmap/Config.in b/package/x11r7/xapp_setxkbmap/Config.in
index d269756..f645bdf 100644
--- a/package/x11r7/xapp_setxkbmap/Config.in
+++ b/package/x11r7/xapp_setxkbmap/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_SETXKBMAP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_SETXKBMAP
 	bool "setxkbmap"
diff --git a/package/x11r7/xapp_showfont/Config.in b/package/x11r7/xapp_showfont/Config.in
index 627a56c..447364c 100644
--- a/package/x11r7/xapp_showfont/Config.in
+++ b/package/x11r7/xapp_showfont/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_SHOWFONT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_SHOWFONT
 	bool "showfont"
diff --git a/package/x11r7/xapp_smproxy/Config.in b/package/x11r7/xapp_smproxy/Config.in
index 4d33c9c..7d565f2 100644
--- a/package/x11r7/xapp_smproxy/Config.in
+++ b/package/x11r7/xapp_smproxy/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_SMPROXY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_SMPROXY
 	bool "smproxy"
diff --git a/package/x11r7/xapp_twm/Config.in b/package/x11r7/xapp_twm/Config.in
index e4d4d1f..b86f13b 100644
--- a/package/x11r7/xapp_twm/Config.in
+++ b/package/x11r7/xapp_twm/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_TWM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_TWM
 	bool "twm"
diff --git a/package/x11r7/xapp_viewres/Config.in b/package/x11r7/xapp_viewres/Config.in
index f5ffc98..a69f96a 100644
--- a/package/x11r7/xapp_viewres/Config.in
+++ b/package/x11r7/xapp_viewres/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_VIEWRES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_VIEWRES
 	bool "viewres"
diff --git a/package/x11r7/xapp_x11perf/Config.in b/package/x11r7/xapp_x11perf/Config.in
index 21c019b..b795237 100644
--- a/package/x11r7/xapp_x11perf/Config.in
+++ b/package/x11r7/xapp_x11perf/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_X11PERF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_X11PERF
 	bool "x11perf"
diff --git a/package/x11r7/xapp_xauth/Config.in b/package/x11r7/xapp_xauth/Config.in
index a84d908..cebe9ab 100644
--- a/package/x11r7/xapp_xauth/Config.in
+++ b/package/x11r7/xapp_xauth/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_XAUTH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XAUTH
 	bool "xauth"
diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index 4468add..71acf53 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XBACKLIGHT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
diff --git a/package/x11r7/xapp_xbiff/Config.in b/package/x11r7/xapp_xbiff/Config.in
index 6e3701a..0ace85b 100644
--- a/package/x11r7/xapp_xbiff/Config.in
+++ b/package/x11r7/xapp_xbiff/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XBIFF_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XBIFF
 	bool "xbiff"
diff --git a/package/x11r7/xapp_xcalc/Config.in b/package/x11r7/xapp_xcalc/Config.in
index 9c80b7e..08105fc 100644
--- a/package/x11r7/xapp_xcalc/Config.in
+++ b/package/x11r7/xapp_xcalc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XCALC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XCALC
 	bool "xcalc"
diff --git a/package/x11r7/xapp_xclipboard/Config.in b/package/x11r7/xapp_xclipboard/Config.in
index b032770..a83384b 100644
--- a/package/x11r7/xapp_xclipboard/Config.in
+++ b/package/x11r7/xapp_xclipboard/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XCLIPBOARD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XCLIPBOARD
 	bool "xclipboard"
diff --git a/package/x11r7/xapp_xclock/Config.in b/package/x11r7/xapp_xclock/Config.in
index f2234ba..2d22cc1 100644
--- a/package/x11r7/xapp_xclock/Config.in
+++ b/package/x11r7/xapp_xclock/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XAPP_XCLOCK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XCLOCK
 	bool "xclock"
diff --git a/package/x11r7/xapp_xcmsdb/Config.in b/package/x11r7/xapp_xcmsdb/Config.in
index 1795970..9128983 100644
--- a/package/x11r7/xapp_xcmsdb/Config.in
+++ b/package/x11r7/xapp_xcmsdb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XCMSDB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XCMSDB
 	bool "xcmsdb"
diff --git a/package/x11r7/xapp_xcursorgen/Config.in b/package/x11r7/xapp_xcursorgen/Config.in
index 705c113..4830b37 100644
--- a/package/x11r7/xapp_xcursorgen/Config.in
+++ b/package/x11r7/xapp_xcursorgen/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XCURSORGEN_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
+	depends on BR2_PACKAGE_LIBPNG_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XCURSORGEN
 	bool "xcursorgen"
diff --git a/package/x11r7/xapp_xdbedizzy/Config.in b/package/x11r7/xapp_xdbedizzy/Config.in
index c2d3020..554433d 100644
--- a/package/x11r7/xapp_xdbedizzy/Config.in
+++ b/package/x11r7/xapp_xdbedizzy/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XDBEDIZZY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDBEDIZZY
 	bool "xdbedizzy"
diff --git a/package/x11r7/xapp_xditview/Config.in b/package/x11r7/xapp_xditview/Config.in
index 1c18c3f..9a86598 100644
--- a/package/x11r7/xapp_xditview/Config.in
+++ b/package/x11r7/xapp_xditview/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XDITVIEW_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDITVIEW
 	bool "xditview"
diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 4de04ec..4cf7732 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -1,5 +1,15 @@
 config BR2_PACKAGE_XAPP_XDM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XAPP_SESSREG_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XAPP_XINIT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
+	depends on BR2_PACKAGE_XAPP_XRDB_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDM
 	bool "xdm"
diff --git a/package/x11r7/xapp_xdpyinfo/Config.in b/package/x11r7/xapp_xdpyinfo/Config.in
index 803f0e2..2abd188 100644
--- a/package/x11r7/xapp_xdpyinfo/Config.in
+++ b/package/x11r7/xapp_xdpyinfo/Config.in
@@ -1,5 +1,19 @@
 config BR2_PACKAGE_XAPP_XDPYINFO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_PRINTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXXF86DGA_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDPYINFO
 	bool "xdpyinfo"
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index c7882a3..2ecb0fa 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XAPP_XDRIINFO_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index 828600c..d2ea198 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XEDIT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
diff --git a/package/x11r7/xapp_xev/Config.in b/package/x11r7/xapp_xev/Config.in
index e495b6a..233bf85 100644
--- a/package/x11r7/xapp_xev/Config.in
+++ b/package/x11r7/xapp_xev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XEV_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XEV
 	bool "xev"
diff --git a/package/x11r7/xapp_xeyes/Config.in b/package/x11r7/xapp_xeyes/Config.in
index 0c72907..b48ab85 100644
--- a/package/x11r7/xapp_xeyes/Config.in
+++ b/package/x11r7/xapp_xeyes/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_XEYES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XEYES
 	bool "xeyes"
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 9f30122..f9a3e25 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XF86DGA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXXF86DGA_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
diff --git a/package/x11r7/xapp_xfd/Config.in b/package/x11r7/xapp_xfd/Config.in
index 1f2d787..56efd3a 100644
--- a/package/x11r7/xapp_xfd/Config.in
+++ b/package/x11r7/xapp_xfd/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_XFD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XFD
 	bool "xfd"
diff --git a/package/x11r7/xapp_xfontsel/Config.in b/package/x11r7/xapp_xfontsel/Config.in
index 03ca2ef..4064574 100644
--- a/package/x11r7/xapp_xfontsel/Config.in
+++ b/package/x11r7/xapp_xfontsel/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XFONTSEL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XFONTSEL
 	bool "xfontsel"
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index f72ab68..1aa8435 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XFS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XFS
 	bool "xfs"
diff --git a/package/x11r7/xapp_xfsinfo/Config.in b/package/x11r7/xapp_xfsinfo/Config.in
index c67ab1f..005a7d3 100644
--- a/package/x11r7/xapp_xfsinfo/Config.in
+++ b/package/x11r7/xapp_xfsinfo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XFSINFO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XFSINFO
 	bool "xfsinfo"
diff --git a/package/x11r7/xapp_xgamma/Config.in b/package/x11r7/xapp_xgamma/Config.in
index 442506e..b20a93d 100644
--- a/package/x11r7/xapp_xgamma/Config.in
+++ b/package/x11r7/xapp_xgamma/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XGAMMA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XGAMMA
 	bool "xgamma"
diff --git a/package/x11r7/xapp_xgc/Config.in b/package/x11r7/xapp_xgc/Config.in
index 375c838..4e437a4 100644
--- a/package/x11r7/xapp_xgc/Config.in
+++ b/package/x11r7/xapp_xgc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XGC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XGC
 	bool "xgc"
diff --git a/package/x11r7/xapp_xhost/Config.in b/package/x11r7/xapp_xhost/Config.in
index 910e35a..b52a37d 100644
--- a/package/x11r7/xapp_xhost/Config.in
+++ b/package/x11r7/xapp_xhost/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XHOST_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XHOST
 	bool "xhost"
diff --git a/package/x11r7/xapp_xinit/Config.in b/package/x11r7/xapp_xinit/Config.in
index 1ea946c..40b2b57 100644
--- a/package/x11r7/xapp_xinit/Config.in
+++ b/package/x11r7/xapp_xinit/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XINIT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XAPP_XAUTH_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XINIT
 	bool "xinit"
diff --git a/package/x11r7/xapp_xinput/Config.in b/package/x11r7/xapp_xinput/Config.in
index 11a441f..acece9a 100644
--- a/package/x11r7/xapp_xinput/Config.in
+++ b/package/x11r7/xapp_xinput/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XINPUT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XINPUT
 	bool "xinput"
diff --git a/package/x11r7/xapp_xinput_calibrator/Config.in b/package/x11r7/xapp_xinput_calibrator/Config.in
index fbe9c32..8570e7c 100644
--- a/package/x11r7/xapp_xinput_calibrator/Config.in
+++ b/package/x11r7/xapp_xinput_calibrator/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR_AVAILABLE
 	def_bool y
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR
 	bool "xinput-calibrator"
diff --git a/package/x11r7/xapp_xkbcomp/Config.in b/package/x11r7/xapp_xkbcomp/Config.in
index 78f08c9..466b492 100644
--- a/package/x11r7/xapp_xkbcomp/Config.in
+++ b/package/x11r7/xapp_xkbcomp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XKBCOMP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XKBCOMP
 	bool "xkbcomp"
diff --git a/package/x11r7/xapp_xkbevd/Config.in b/package/x11r7/xapp_xkbevd/Config.in
index 40f6d80..6c3de56 100644
--- a/package/x11r7/xapp_xkbevd/Config.in
+++ b/package/x11r7/xapp_xkbevd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XKBEVD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XKBEVD
 	bool "xkbevd"
diff --git a/package/x11r7/xapp_xkbprint/Config.in b/package/x11r7/xapp_xkbprint/Config.in
index 3ea8e20..0bebab9 100644
--- a/package/x11r7/xapp_xkbprint/Config.in
+++ b/package/x11r7/xapp_xkbprint/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XKBPRINT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XKBPRINT
 	bool "xkbprint"
diff --git a/package/x11r7/xapp_xkbutils/Config.in b/package/x11r7/xapp_xkbutils/Config.in
index 92354db..4bb4a8f 100644
--- a/package/x11r7/xapp_xkbutils/Config.in
+++ b/package/x11r7/xapp_xkbutils/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XKBUTILS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XKBUTILS
 	bool "xkbutils"
diff --git a/package/x11r7/xapp_xkill/Config.in b/package/x11r7/xapp_xkill/Config.in
index 0981405..fed870b 100644
--- a/package/x11r7/xapp_xkill/Config.in
+++ b/package/x11r7/xapp_xkill/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XKILL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XKILL
 	bool "xkill"
diff --git a/package/x11r7/xapp_xload/Config.in b/package/x11r7/xapp_xload/Config.in
index 536909d..9c642b8 100644
--- a/package/x11r7/xapp_xload/Config.in
+++ b/package/x11r7/xapp_xload/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XLOAD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XLOAD
 	bool "xload"
diff --git a/package/x11r7/xapp_xlogo/Config.in b/package/x11r7/xapp_xlogo/Config.in
index 6f5f9d7..77cb4a8 100644
--- a/package/x11r7/xapp_xlogo/Config.in
+++ b/package/x11r7/xapp_xlogo/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XAPP_XLOGO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XLOGO
 	bool "xlogo"
diff --git a/package/x11r7/xapp_xlsatoms/Config.in b/package/x11r7/xapp_xlsatoms/Config.in
index 70f3a9e..84dac87 100644
--- a/package/x11r7/xapp_xlsatoms/Config.in
+++ b/package/x11r7/xapp_xlsatoms/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XLSATOMS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XLSATOMS
 	bool "xlsatoms"
diff --git a/package/x11r7/xapp_xlsclients/Config.in b/package/x11r7/xapp_xlsclients/Config.in
index 14f5bb8..00efba9 100644
--- a/package/x11r7/xapp_xlsclients/Config.in
+++ b/package/x11r7/xapp_xlsclients/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XLSCLIENTS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XLSCLIENTS
 	bool "xlsclients"
diff --git a/package/x11r7/xapp_xlsfonts/Config.in b/package/x11r7/xapp_xlsfonts/Config.in
index f0ec061..01ddc54 100644
--- a/package/x11r7/xapp_xlsfonts/Config.in
+++ b/package/x11r7/xapp_xlsfonts/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XLSFONTS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XLSFONTS
 	bool "xlsfonts"
diff --git a/package/x11r7/xapp_xmag/Config.in b/package/x11r7/xapp_xmag/Config.in
index 3dbe45e..454386b 100644
--- a/package/x11r7/xapp_xmag/Config.in
+++ b/package/x11r7/xapp_xmag/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMAG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMAG
 	bool "xmag"
diff --git a/package/x11r7/xapp_xman/Config.in b/package/x11r7/xapp_xman/Config.in
index 59de3e3..8f36e8a 100644
--- a/package/x11r7/xapp_xman/Config.in
+++ b/package/x11r7/xapp_xman/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMAN_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMAN
 	bool "xman"
diff --git a/package/x11r7/xapp_xmessage/Config.in b/package/x11r7/xapp_xmessage/Config.in
index ead9e85..b2daefe 100644
--- a/package/x11r7/xapp_xmessage/Config.in
+++ b/package/x11r7/xapp_xmessage/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMESSAGE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMESSAGE
 	bool "xmessage"
diff --git a/package/x11r7/xapp_xmh/Config.in b/package/x11r7/xapp_xmh/Config.in
index 3c29311..c733432 100644
--- a/package/x11r7/xapp_xmh/Config.in
+++ b/package/x11r7/xapp_xmh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMH
 	bool "xmh"
diff --git a/package/x11r7/xapp_xmodmap/Config.in b/package/x11r7/xapp_xmodmap/Config.in
index 252e45e..7238a2b 100644
--- a/package/x11r7/xapp_xmodmap/Config.in
+++ b/package/x11r7/xapp_xmodmap/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XMODMAP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMODMAP
 	bool "xmodmap"
diff --git a/package/x11r7/xapp_xmore/Config.in b/package/x11r7/xapp_xmore/Config.in
index 9b52ea0..e7a503a 100644
--- a/package/x11r7/xapp_xmore/Config.in
+++ b/package/x11r7/xapp_xmore/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XMORE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XMORE
 	bool "xmore"
diff --git a/package/x11r7/xapp_xplsprinters/Config.in b/package/x11r7/xapp_xplsprinters/Config.in
index 484be69..3bb9c85 100644
--- a/package/x11r7/xapp_xplsprinters/Config.in
+++ b/package/x11r7/xapp_xplsprinters/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XPLSPRINTERS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XPLSPRINTERS
 	bool "xplsprinters"
diff --git a/package/x11r7/xapp_xpr/Config.in b/package/x11r7/xapp_xpr/Config.in
index 0b3971c..181c8cd 100644
--- a/package/x11r7/xapp_xpr/Config.in
+++ b/package/x11r7/xapp_xpr/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XPR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XPR
 	bool "xpr"
diff --git a/package/x11r7/xapp_xprehashprinterlist/Config.in b/package/x11r7/xapp_xprehashprinterlist/Config.in
index 1514a1a..7d520df 100644
--- a/package/x11r7/xapp_xprehashprinterlist/Config.in
+++ b/package/x11r7/xapp_xprehashprinterlist/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XPREHASHPRINTERLIST
 	bool "xprehashprinterlist"
diff --git a/package/x11r7/xapp_xprop/Config.in b/package/x11r7/xapp_xprop/Config.in
index 67877e3..a744009 100644
--- a/package/x11r7/xapp_xprop/Config.in
+++ b/package/x11r7/xapp_xprop/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XPROP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XPROP
 	bool "xprop"
diff --git a/package/x11r7/xapp_xrandr/Config.in b/package/x11r7/xapp_xrandr/Config.in
index d1d507b..9cb8547 100644
--- a/package/x11r7/xapp_xrandr/Config.in
+++ b/package/x11r7/xapp_xrandr/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XRANDR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XRANDR
 	bool "xrandr"
diff --git a/package/x11r7/xapp_xrdb/Config.in b/package/x11r7/xapp_xrdb/Config.in
index 6310e49..cdb3e29 100644
--- a/package/x11r7/xapp_xrdb/Config.in
+++ b/package/x11r7/xapp_xrdb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XRDB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XRDB
 	bool "xrdb"
diff --git a/package/x11r7/xapp_xrefresh/Config.in b/package/x11r7/xapp_xrefresh/Config.in
index b897056..201f966 100644
--- a/package/x11r7/xapp_xrefresh/Config.in
+++ b/package/x11r7/xapp_xrefresh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XREFRESH_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XREFRESH
 	bool "xrefresh"
diff --git a/package/x11r7/xapp_xset/Config.in b/package/x11r7/xapp_xset/Config.in
index c692fa0..1bd396a 100644
--- a/package/x11r7/xapp_xset/Config.in
+++ b/package/x11r7/xapp_xset/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XSET_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFONTCACHE_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSET
 	bool "xset"
diff --git a/package/x11r7/xapp_xsetmode/Config.in b/package/x11r7/xapp_xsetmode/Config.in
index 2d64a25..0778721 100644
--- a/package/x11r7/xapp_xsetmode/Config.in
+++ b/package/x11r7/xapp_xsetmode/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XSETMODE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSETMODE
 	bool "xsetmode"
diff --git a/package/x11r7/xapp_xsetpointer/Config.in b/package/x11r7/xapp_xsetpointer/Config.in
index 768fcf6..d85dca9 100644
--- a/package/x11r7/xapp_xsetpointer/Config.in
+++ b/package/x11r7/xapp_xsetpointer/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XSETPOINTER_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSETPOINTER
 	bool "xsetpointer"
diff --git a/package/x11r7/xapp_xsetroot/Config.in b/package/x11r7/xapp_xsetroot/Config.in
index 2e9e29d..18638ed 100644
--- a/package/x11r7/xapp_xsetroot/Config.in
+++ b/package/x11r7/xapp_xsetroot/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XAPP_XSETROOT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSETROOT
 	bool "xsetroot"
diff --git a/package/x11r7/xapp_xsm/Config.in b/package/x11r7/xapp_xsm/Config.in
index 943ea7a..d1d7e77 100644
--- a/package/x11r7/xapp_xsm/Config.in
+++ b/package/x11r7/xapp_xsm/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XSM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSM
 	bool "xsm"
diff --git a/package/x11r7/xapp_xstdcmap/Config.in b/package/x11r7/xapp_xstdcmap/Config.in
index 117edd9..26ba37f 100644
--- a/package/x11r7/xapp_xstdcmap/Config.in
+++ b/package/x11r7/xapp_xstdcmap/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XSTDCMAP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XSTDCMAP
 	bool "xstdcmap"
diff --git a/package/x11r7/xapp_xvidtune/Config.in b/package/x11r7/xapp_xvidtune/Config.in
index 230090b..b641c3f 100644
--- a/package/x11r7/xapp_xvidtune/Config.in
+++ b/package/x11r7/xapp_xvidtune/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XVIDTUNE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XVIDTUNE
 	bool "xvidtune"
diff --git a/package/x11r7/xapp_xvinfo/Config.in b/package/x11r7/xapp_xvinfo/Config.in
index a0a99af..8397363 100644
--- a/package/x11r7/xapp_xvinfo/Config.in
+++ b/package/x11r7/xapp_xvinfo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XVINFO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXV_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XVINFO
 	bool "xvinfo"
diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
index 542b41c..410c923 100644
--- a/package/x11r7/xapp_xwd/Config.in
+++ b/package/x11r7/xapp_xwd/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XWD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XWD
 	bool "xwd"
diff --git a/package/x11r7/xapp_xwininfo/Config.in b/package/x11r7/xapp_xwininfo/Config.in
index 738f78c..65ed98b 100644
--- a/package/x11r7/xapp_xwininfo/Config.in
+++ b/package/x11r7/xapp_xwininfo/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XAPP_XWININFO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XWININFO
 	bool "xwininfo"
diff --git a/package/x11r7/xapp_xwud/Config.in b/package/x11r7/xapp_xwud/Config.in
index afa1f92..08551bb 100644
--- a/package/x11r7/xapp_xwud/Config.in
+++ b/package/x11r7/xapp_xwud/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XWUD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XAPP_XWUD
 	bool "xwud"
diff --git a/package/x11r7/xdata_xcursor-themes/Config.in b/package/x11r7/xdata_xcursor-themes/Config.in
index c138ab9..249e210 100644
--- a/package/x11r7/xdata_xcursor-themes/Config.in
+++ b/package/x11r7/xdata_xcursor-themes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDATA_XCURSOR_THEMES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
 
 config BR2_PACKAGE_XDATA_XCURSOR_THEMES
 	bool "xdata_xcursor-themes"
diff --git a/package/x11r7/xdriver_xf86-input-acecad/Config.in b/package/x11r7/xdriver_xf86-input-acecad/Config.in
index b720d6c..069f9ce 100644
--- a/package/x11r7/xdriver_xf86-input-acecad/Config.in
+++ b/package/x11r7/xdriver_xf86-input-acecad/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_ACECAD
 	bool "xf86-input-acecad"
diff --git a/package/x11r7/xdriver_xf86-input-aiptek/Config.in b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
index 6fc9539..59df0c1 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/Config.in
+++ b/package/x11r7/xdriver_xf86-input-aiptek/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_AIPTEK
 	bool "xf86-input-aiptek"
diff --git a/package/x11r7/xdriver_xf86-input-evdev/Config.in b/package/x11r7/xdriver_xf86-input-evdev/Config.in
index ee4a124..b4736a3 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/Config.in
+++ b/package/x11r7/xdriver_xf86-input-evdev/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV
 	bool "xf86-input-evdev"
diff --git a/package/x11r7/xdriver_xf86-input-joystick/Config.in b/package/x11r7/xdriver_xf86-input-joystick/Config.in
index b823866..c280e2c 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/Config.in
+++ b/package/x11r7/xdriver_xf86-input-joystick/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK
 	bool "xf86-input-joystick"
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/Config.in b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
index 0b3bcf2..8970b02 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/Config.in
+++ b/package/x11r7/xdriver_xf86-input-keyboard/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD
 	bool "xf86-input-keyboard"
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
index 80a2d9b..5d1b74f 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-mouse/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
 	bool "xf86-input-mouse"
diff --git a/package/x11r7/xdriver_xf86-input-synaptics/Config.in b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
index f10dbe4..b148f00 100644
--- a/package/x11r7/xdriver_xf86-input-synaptics/Config.in
+++ b/package/x11r7/xdriver_xf86-input-synaptics/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_SYNAPTICS
 	bool "xf86-input-synaptics"
diff --git a/package/x11r7/xdriver_xf86-input-tslib/Config.in b/package/x11r7/xdriver_xf86-input-tslib/Config.in
index fc1868f..d675428 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/Config.in
+++ b/package/x11r7/xdriver_xf86-input-tslib/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_TSLIB_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB
 	bool "xf86-input-tslib"
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
index 26aa758..9c1b928 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE_AVAILABLE
 	def_bool y
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VMMOUSE
 	bool "xf86-input-vmmouse"
diff --git a/package/x11r7/xdriver_xf86-input-void/Config.in b/package/x11r7/xdriver_xf86-input-void/Config.in
index 776f805..e2c4126 100644
--- a/package/x11r7/xdriver_xf86-input-void/Config.in
+++ b/package/x11r7/xdriver_xf86-input-void/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void"
diff --git a/package/x11r7/xdriver_xf86-video-apm/Config.in b/package/x11r7/xdriver_xf86-video-apm/Config.in
index 6f369eb..aa4f426 100644
--- a/package/x11r7/xdriver_xf86-video-apm/Config.in
+++ b/package/x11r7/xdriver_xf86-video-apm/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86RUSHPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_APM
 	bool "xf86-video-apm"
diff --git a/package/x11r7/xdriver_xf86-video-ark/Config.in b/package/x11r7/xdriver_xf86-video-ark/Config.in
index 064955b..b94c4b4 100644
--- a/package/x11r7/xdriver_xf86-video-ark/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ark/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARK
 	bool "xf86-video-ark"
diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 793193a..ddaba8a 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,5 +1,16 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
diff --git a/package/x11r7/xdriver_xf86-video-chips/Config.in b/package/x11r7/xdriver_xf86-video-chips/Config.in
index 55dd600..d048e9b 100644
--- a/package/x11r7/xdriver_xf86-video-chips/Config.in
+++ b/package/x11r7/xdriver_xf86-video-chips/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CHIPS
 	bool "xf86-video-chips"
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/Config.in b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
index 8aaa664..0314e91 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/Config.in
+++ b/package/x11r7/xdriver_xf86-video-cirrus/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS
 	bool "xf86-video-cirrus"
diff --git a/package/x11r7/xdriver_xf86-video-dummy/Config.in b/package/x11r7/xdriver_xf86-video-dummy/Config.in
index cc8e988..a427360 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/Config.in
+++ b/package/x11r7/xdriver_xf86-video-dummy/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_DUMMY
 	bool "xf86-video-dummy"
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/Config.in b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
index 46c567d..4daf040 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/Config.in
+++ b/package/x11r7/xdriver_xf86-video-fbdev/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV
 	bool "xf86-video-fbdev"
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index c589823..a9cd33e 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
index cc9559d..7f8da3c 100644
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE_AVAILABLE
 	def_bool y
 	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	bool "xf86-video-glide"
diff --git a/package/x11r7/xdriver_xf86-video-glint/Config.in b/package/x11r7/xdriver_xf86-video-glint/Config.in
index 9f5edca..c0e7dbe 100644
--- a/package/x11r7/xdriver_xf86-video-glint/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glint/Config.in
@@ -1,5 +1,17 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLINT
 	bool "xf86-video-glint"
diff --git a/package/x11r7/xdriver_xf86-video-i128/Config.in b/package/x11r7/xdriver_xf86-video-i128/Config.in
index 6e49475..75012b3 100644
--- a/package/x11r7/xdriver_xf86-video-i128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i128/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I128
 	bool "xf86-video-i128"
diff --git a/package/x11r7/xdriver_xf86-video-i740/Config.in b/package/x11r7/xdriver_xf86-video-i740/Config.in
index 363ceb7..9c0e171 100644
--- a/package/x11r7/xdriver_xf86-video-i740/Config.in
+++ b/package/x11r7/xdriver_xf86-video-i740/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_I740
 	bool "xf86-video-i740"
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index ca938f8..533cced 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBPCIACCESS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	bool "xf86-video-intel"
diff --git a/package/x11r7/xdriver_xf86-video-mach64/Config.in b/package/x11r7/xdriver_xf86-video-mach64/Config.in
index d6d10f7..626e18d 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mach64/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MACH64
 	bool "xf86-video-mach64"
diff --git a/package/x11r7/xdriver_xf86-video-mga/Config.in b/package/x11r7/xdriver_xf86-video-mga/Config.in
index ef06083..b97f306 100644
--- a/package/x11r7/xdriver_xf86-video-mga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-mga/Config.in
@@ -1,5 +1,16 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_MGA
 	bool "xf86-video-mga"
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/Config.in b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
index 7faf833..33f32d3 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/Config.in
+++ b/package/x11r7/xdriver_xf86-video-neomagic/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEOMAGIC
 	bool "xf86-video-neomagic"
diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
index aee66de..e9bd84d 100644
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	bool "xf86-video-newport"
diff --git a/package/x11r7/xdriver_xf86-video-nv/Config.in b/package/x11r7/xdriver_xf86-video-nv/Config.in
index ab3cd8f..c24e5a9 100644
--- a/package/x11r7/xdriver_xf86-video-nv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-nv/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NV
 	bool "xf86-video-nv"
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index 5aa5917..ac93049 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -1,5 +1,17 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXVMC_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXCOMPOSITE_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	bool "xf86-video-openchrome"
diff --git a/package/x11r7/xdriver_xf86-video-r128/Config.in b/package/x11r7/xdriver_xf86-video-r128/Config.in
index 3fbea5c..fff4192 100644
--- a/package/x11r7/xdriver_xf86-video-r128/Config.in
+++ b/package/x11r7/xdriver_xf86-video-r128/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_R128
 	bool "xf86-video-r128"
diff --git a/package/x11r7/xdriver_xf86-video-rendition/Config.in b/package/x11r7/xdriver_xf86-video-rendition/Config.in
index aa4d69e..4dcf5ec 100644
--- a/package/x11r7/xdriver_xf86-video-rendition/Config.in
+++ b/package/x11r7/xdriver_xf86-video-rendition/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_RENDITION
 	bool "xf86-video-rendition"
diff --git a/package/x11r7/xdriver_xf86-video-s3/Config.in b/package/x11r7/xdriver_xf86-video-s3/Config.in
index e82ebfd..bb0c1d3 100644
--- a/package/x11r7/xdriver_xf86-video-s3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3
 	bool "xf86-video-s3"
diff --git a/package/x11r7/xdriver_xf86-video-s3virge/Config.in b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
index ff51138..be3ab1a 100644
--- a/package/x11r7/xdriver_xf86-video-s3virge/Config.in
+++ b/package/x11r7/xdriver_xf86-video-s3virge/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_S3VIRGE
 	bool "xf86-video-s3virge"
diff --git a/package/x11r7/xdriver_xf86-video-savage/Config.in b/package/x11r7/xdriver_xf86-video-savage/Config.in
index 03bfe8b..5267bb0 100644
--- a/package/x11r7/xdriver_xf86-video-savage/Config.in
+++ b/package/x11r7/xdriver_xf86-video-savage/Config.in
@@ -1,5 +1,15 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SAVAGE
 	bool "xf86-video-savage"
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
index 5ad4c6b..fa96861 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SILICONMOTION
 	bool "xf86-video-siliconmotion"
diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index 9d676be..5a87b92 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -1,5 +1,17 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
diff --git a/package/x11r7/xdriver_xf86-video-sisusb/Config.in b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
index 56b8e52..ae9836b 100644
--- a/package/x11r7/xdriver_xf86-video-sisusb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sisusb/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SISUSB
 	bool "xf86-video-sisusb"
diff --git a/package/x11r7/xdriver_xf86-video-suncg14/Config.in b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
index e963973..e84d2c9 100644
--- a/package/x11r7/xdriver_xf86-video-suncg14/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg14/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG14
 	bool "xf86-video-suncg14"
diff --git a/package/x11r7/xdriver_xf86-video-suncg3/Config.in b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
index f689c01..4bbf9ae 100644
--- a/package/x11r7/xdriver_xf86-video-suncg3/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg3/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG3
 	bool "xf86-video-suncg3"
diff --git a/package/x11r7/xdriver_xf86-video-suncg6/Config.in b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
index c5dcbf4..d1556c0 100644
--- a/package/x11r7/xdriver_xf86-video-suncg6/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suncg6/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNCG6
 	bool "xf86-video-suncg6"
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
index 4e91610..15ec01b 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
 	bool "xf86-video-sunffb"
diff --git a/package/x11r7/xdriver_xf86-video-sunleo/Config.in b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
index 712110b..c784e06 100644
--- a/package/x11r7/xdriver_xf86-video-sunleo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunleo/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNLEO
 	bool "xf86-video-sunleo"
diff --git a/package/x11r7/xdriver_xf86-video-suntcx/Config.in b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
index eab688f..4c32e5c 100644
--- a/package/x11r7/xdriver_xf86-video-suntcx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-suntcx/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNTCX
 	bool "xf86-video-suntcx"
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/Config.in b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
index 4c1a3f6..dd47882 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tdfx/Config.in
@@ -1,5 +1,15 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBDRM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DRIPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TDFX
 	bool "xf86-video-tdfx"
diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index 346ee47..5fec82a 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	bool "xf86-video-tga"
diff --git a/package/x11r7/xdriver_xf86-video-trident/Config.in b/package/x11r7/xdriver_xf86-video-trident/Config.in
index e6ee3e4..43b3625 100644
--- a/package/x11r7/xdriver_xf86-video-trident/Config.in
+++ b/package/x11r7/xdriver_xf86-video-trident/Config.in
@@ -1,5 +1,13 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TRIDENT
 	bool "xf86-video-trident"
diff --git a/package/x11r7/xdriver_xf86-video-tseng/Config.in b/package/x11r7/xdriver_xf86-video-tseng/Config.in
index 6b9cf43..81a685c 100644
--- a/package/x11r7/xdriver_xf86-video-tseng/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tseng/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TSENG
 	bool "xf86-video-tseng"
diff --git a/package/x11r7/xdriver_xf86-video-v4l/Config.in b/package/x11r7/xdriver_xf86-video-v4l/Config.in
index a6a154f..fae3ee5 100644
--- a/package/x11r7/xdriver_xf86-video-v4l/Config.in
+++ b/package/x11r7/xdriver_xf86-video-v4l/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_V4L
 	bool "xf86-video-v4l"
diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index 426fd43..e8f1934 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	bool "xf86-video-vesa"
diff --git a/package/x11r7/xdriver_xf86-video-vmware/Config.in b/package/x11r7/xdriver_xf86-video-vmware/Config.in
index ab5de69..e0857fd 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vmware/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE
 	bool "xf86-video-vmware"
diff --git a/package/x11r7/xdriver_xf86-video-voodoo/Config.in b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
index 7b8d9a9..840982f 100644
--- a/package/x11r7/xdriver_xf86-video-voodoo/Config.in
+++ b/package/x11r7/xdriver_xf86-video-voodoo/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VOODOO
 	bool "xf86-video-voodoo"
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
index c8e8b99..9be43e3 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
@@ -1,6 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB_AVAILABLE
 	def_bool y
 	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	bool "xf86-video-wsfb"
diff --git a/package/x11r7/xdriver_xf86-video-xgi/Config.in b/package/x11r7/xdriver_xf86-video-xgi/Config.in
index b758324..7507e50 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgi/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGI
 	bool "xf86-video-xgi"
diff --git a/package/x11r7/xdriver_xf86-video-xgixp/Config.in b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
index 52a80ec..10969c7 100644
--- a/package/x11r7/xdriver_xf86-video-xgixp/Config.in
+++ b/package/x11r7/xdriver_xf86-video-xgixp/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_MESA3D_AVAILABLE
 
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_XGIXP
 	bool "xf86-video-xgixp"
diff --git a/package/x11r7/xkeyboard-config/Config.in b/package/x11r7/xkeyboard-config/Config.in
index a4c49da..762d31f 100644
--- a/package/x11r7/xkeyboard-config/Config.in
+++ b/package/x11r7/xkeyboard-config/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XKEYBOARD_CONFIG_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XAPP_XKBCOMP_AVAILABLE
 
 config BR2_PACKAGE_XKEYBOARD_CONFIG
 	bool "xkeyboard-config"
diff --git a/package/x11r7/xlib_libFS/Config.in b/package/x11r7/xlib_libFS/Config.in
index bfe8ec1..88d1b98 100644
--- a/package/x11r7/xlib_libFS/Config.in
+++ b/package/x11r7/xlib_libFS/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBFS_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBFS
 	bool "libFS"
diff --git a/package/x11r7/xlib_libICE/Config.in b/package/x11r7/xlib_libICE/Config.in
index 7286d81..bd2853b 100644
--- a/package/x11r7/xlib_libICE/Config.in
+++ b/package/x11r7/xlib_libICE/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBICE
 	bool "libICE"
diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
index 0646e58..94657fb 100644
--- a/package/x11r7/xlib_libSM/Config.in
+++ b/package/x11r7/xlib_libSM/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBSM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBICE_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBSM
 	bool "libSM"
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index 9915d36..47d0e27 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -1,5 +1,17 @@
 config BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_BIGREQSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XCMISCPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
+	depends on BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
+	depends on BR2_PACKAGE_LIBXCB_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBX11
 	bool "libX11"
diff --git a/package/x11r7/xlib_libXScrnSaver/Config.in b/package/x11r7/xlib_libXScrnSaver/Config.in
index 098c8dc..174716c 100644
--- a/package/x11r7/xlib_libXScrnSaver/Config.in
+++ b/package/x11r7/xlib_libXScrnSaver/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXSCRNSAVER_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_SCRNSAVERPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXSCRNSAVER
 	bool "libXScrnSaver"
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index e6e2815..c15a79c 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXAU
 	bool "libXau"
diff --git a/package/x11r7/xlib_libXaw/Config.in b/package/x11r7/xlib_libXaw/Config.in
index 5bcbbd0..56ad8a2 100644
--- a/package/x11r7/xlib_libXaw/Config.in
+++ b/package/x11r7/xlib_libXaw/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPM_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXAW
 	bool "libXaw"
diff --git a/package/x11r7/xlib_libXcomposite/Config.in b/package/x11r7/xlib_libXcomposite/Config.in
index 17d2dae..7759c91 100644
--- a/package/x11r7/xlib_libXcomposite/Config.in
+++ b/package/x11r7/xlib_libXcomposite/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XLIB_LIBXCOMPOSITE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_COMPOSITEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	bool "libXcomposite"
diff --git a/package/x11r7/xlib_libXcursor/Config.in b/package/x11r7/xlib_libXcursor/Config.in
index 46ac040..3fc66ca 100644
--- a/package/x11r7/xlib_libXcursor/Config.in
+++ b/package/x11r7/xlib_libXcursor/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXCURSOR
 	bool "libXcursor"
diff --git a/package/x11r7/xlib_libXdamage/Config.in b/package/x11r7/xlib_libXdamage/Config.in
index 6e4facc..a658f45 100644
--- a/package/x11r7/xlib_libXdamage/Config.in
+++ b/package/x11r7/xlib_libXdamage/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_DAMAGEPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXDAMAGE
 	bool "libXdamage"
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index 7e4266c..8081016 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXDMCP
 	bool "libXdmcp"
diff --git a/package/x11r7/xlib_libXext/Config.in b/package/x11r7/xlib_libXext/Config.in
index 8d7b2c3..74ee824 100644
--- a/package/x11r7/xlib_libXext/Config.in
+++ b/package/x11r7/xlib_libXext/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXEXT
 	bool "libXext"
diff --git a/package/x11r7/xlib_libXfixes/Config.in b/package/x11r7/xlib_libXfixes/Config.in
index fdc134f..981eef7 100644
--- a/package/x11r7/xlib_libXfixes/Config.in
+++ b/package/x11r7/xlib_libXfixes/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_FIXESPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXFIXES
 	bool "libXfixes"
diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index ec4d48e..80196dd 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
+	depends on BR2_PACKAGE_XFONT_ENCODINGS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTCACHEPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXFONT
 	bool "libXfont"
diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
index e40c9cd..719701e 100644
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ b/package/x11r7/xlib_libXfontcache/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXFONTCACHE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTCACHEPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	bool "libXfontcache"
diff --git a/package/x11r7/xlib_libXft/Config.in b/package/x11r7/xlib_libXft/Config.in
index 6e1dab0..fba8598 100644
--- a/package/x11r7/xlib_libXft/Config.in
+++ b/package/x11r7/xlib_libXft/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_FONTCONFIG_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_FREETYPE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXFT
 	bool "libXft"
diff --git a/package/x11r7/xlib_libXi/Config.in b/package/x11r7/xlib_libXi/Config.in
index cdb2622..b5c762a 100644
--- a/package/x11r7/xlib_libXi/Config.in
+++ b/package/x11r7/xlib_libXi/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXI
 	bool "libXi"
diff --git a/package/x11r7/xlib_libXinerama/Config.in b/package/x11r7/xlib_libXinerama/Config.in
index 5c07517..71b20b7 100644
--- a/package/x11r7/xlib_libXinerama/Config.in
+++ b/package/x11r7/xlib_libXinerama/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XINERAMAPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXINERAMA
 	bool "libXinerama"
diff --git a/package/x11r7/xlib_libXmu/Config.in b/package/x11r7/xlib_libXmu/Config.in
index 4bc3333..12e62c7 100644
--- a/package/x11r7/xlib_libXmu/Config.in
+++ b/package/x11r7/xlib_libXmu/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXMU_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXMU
 	bool "libXmu"
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
index eb0298c..47a8fa7 100644
--- a/package/x11r7/xlib_libXp/Config.in
+++ b/package/x11r7/xlib_libXp/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_PRINTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXP
 	bool "libXp"
diff --git a/package/x11r7/xlib_libXpm/Config.in b/package/x11r7/xlib_libXpm/Config.in
index f83b881..cfad625 100644
--- a/package/x11r7/xlib_libXpm/Config.in
+++ b/package/x11r7/xlib_libXpm/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXPM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXPM
 	bool "libXpm"
diff --git a/package/x11r7/xlib_libXprintAppUtil/Config.in b/package/x11r7/xlib_libXprintAppUtil/Config.in
index 3ebf84f..c87552e 100644
--- a/package/x11r7/xlib_libXprintAppUtil/Config.in
+++ b/package/x11r7/xlib_libXprintAppUtil/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXPRINTAPPUTIL
 	bool "libXprintAppUtil"
diff --git a/package/x11r7/xlib_libXprintUtil/Config.in b/package/x11r7/xlib_libXprintUtil/Config.in
index c437dca..1e6bd43 100644
--- a/package/x11r7/xlib_libXprintUtil/Config.in
+++ b/package/x11r7/xlib_libXprintUtil/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXPRINTUTIL_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_PRINTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXPRINTUTIL
 	bool "libXprintUtil"
diff --git a/package/x11r7/xlib_libXrandr/Config.in b/package/x11r7/xlib_libXrandr/Config.in
index 2243a7a..62a6f02 100644
--- a/package/x11r7/xlib_libXrandr/Config.in
+++ b/package/x11r7/xlib_libXrandr/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXRANDR
 	bool "libXrandr"
diff --git a/package/x11r7/xlib_libXrender/Config.in b/package/x11r7/xlib_libXrender/Config.in
index b5f8d76..a03e4d4 100644
--- a/package/x11r7/xlib_libXrender/Config.in
+++ b/package/x11r7/xlib_libXrender/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXRENDER
 	bool "libXrender"
diff --git a/package/x11r7/xlib_libXres/Config.in b/package/x11r7/xlib_libXres/Config.in
index a511ff6..072d4d3 100644
--- a/package/x11r7/xlib_libXres/Config.in
+++ b/package/x11r7/xlib_libXres/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXRES_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RESOURCEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXRES
 	bool "libXres"
diff --git a/package/x11r7/xlib_libXt/Config.in b/package/x11r7/xlib_libXt/Config.in
index 8c7c74a..1b93a85 100644
--- a/package/x11r7/xlib_libXt/Config.in
+++ b/package/x11r7/xlib_libXt/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XCB_PROTO_AVAILABLE
+	depends on BR2_PACKAGE_LIBXCB_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBSM_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXT
 	bool "libXt"
diff --git a/package/x11r7/xlib_libXtst/Config.in b/package/x11r7/xlib_libXtst/Config.in
index 0e5067c..ebf61c0 100644
--- a/package/x11r7/xlib_libXtst/Config.in
+++ b/package/x11r7/xlib_libXtst/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RECORDPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXTST
 	bool "libXtst"
diff --git a/package/x11r7/xlib_libXv/Config.in b/package/x11r7/xlib_libXv/Config.in
index d9da0ef..9d5ae32 100644
--- a/package/x11r7/xlib_libXv/Config.in
+++ b/package/x11r7/xlib_libXv/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXV_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXV
 	bool "libXv"
diff --git a/package/x11r7/xlib_libXvMC/Config.in b/package/x11r7/xlib_libXvMC/Config.in
index 50784ed..cccba38 100644
--- a/package/x11r7/xlib_libXvMC/Config.in
+++ b/package/x11r7/xlib_libXvMC/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_XLIB_LIBXVMC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBXV_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXVMC
 	bool "libXvMC"
diff --git a/package/x11r7/xlib_libXxf86dga/Config.in b/package/x11r7/xlib_libXxf86dga/Config.in
index 4bcdd74..2645223 100644
--- a/package/x11r7/xlib_libXxf86dga/Config.in
+++ b/package/x11r7/xlib_libXxf86dga/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXXF86DGA_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXXF86DGA
 	bool "libXxf86dga"
diff --git a/package/x11r7/xlib_libXxf86vm/Config.in b/package/x11r7/xlib_libXxf86vm/Config.in
index 41a36bd..3f12ea8 100644
--- a/package/x11r7/xlib_libXxf86vm/Config.in
+++ b/package/x11r7/xlib_libXxf86vm/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXXF86VM
 	bool "libXxf86vm"
diff --git a/package/x11r7/xlib_libdmx/Config.in b/package/x11r7/xlib_libdmx/Config.in
index d1d3b8b..80fcdf6 100644
--- a/package/x11r7/xlib_libdmx/Config.in
+++ b/package/x11r7/xlib_libdmx/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBDMX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_DMXPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBDMX
 	bool "libdmx"
diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index ccf26b8..2c949fd 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBFONTENC_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
diff --git a/package/x11r7/xlib_liboldX/Config.in b/package/x11r7/xlib_liboldX/Config.in
index 5ad792e..faaf67f 100644
--- a/package/x11r7/xlib_liboldX/Config.in
+++ b/package/x11r7/xlib_liboldX/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBOLDX_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBOLDX
 	bool "liboldX"
diff --git a/package/x11r7/xlib_libxkbfile/Config.in b/package/x11r7/xlib_libxkbfile/Config.in
index cb61e21..3f2fb32 100644
--- a/package/x11r7/xlib_libxkbfile/Config.in
+++ b/package/x11r7/xlib_libxkbfile/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXKBFILE
 	bool "libxkbfile"
diff --git a/package/x11r7/xlib_libxkbui/Config.in b/package/x11r7/xlib_libxkbui/Config.in
index d852ee2..9c888e1 100644
--- a/package/x11r7/xlib_libxkbui/Config.in
+++ b/package/x11r7/xlib_libxkbui/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_XLIB_LIBXKBUI_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_XLIB_LIBXKBUI
 	bool "libxkbui"
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 8de8fd1..e5e36b3 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,48 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AVAILABLE
 	def_bool y
 	depends on !BR2_avr32
+	depends on BR2_PACKAGE_XPROTO_DAMAGEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XKEYBOARD_CONFIG_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXCURSOR_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFIXES_AVAILABLE
+	depends on BR2_PACKAGE_XDATA_XBITMAPS_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRANDR_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXI_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XCMISCPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_GLPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDAMAGE_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RANDRPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFONT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXEXT_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RENDERPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXDMCP_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAU_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FIXESPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86RUSHPROTO_AVAILABLE
+	depends on BR2_PACKAGE_OPENSSL_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXXF86VM_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_RESOURCEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_VIDEOPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_FONTSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86BIGFONTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XEXTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_COMPOSITEPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBX11_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXKBFILE_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_KBPROTO_AVAILABLE
+	depends on BR2_PACKAGE_PIXMAN_AVAILABLE
+	depends on BR2_PACKAGE_XUTIL_UTIL_MACROS_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_INPUTPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRES_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXINERAMA_AVAILABLE
+	depends on BR2_PACKAGE_MCOOKIE_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_BIGREQSPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XF86DGAPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XPROTO_XPROTO_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXRENDER_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_XTRANS_AVAILABLE
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
diff --git a/package/x11vnc/Config.in b/package/x11vnc/Config.in
index 2a2692b..c61befa 100644
--- a/package/x11vnc/Config.in
+++ b/package/x11vnc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_X11VNC_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXT_AVAILABLE
 
 config BR2_PACKAGE_X11VNC
 	bool "x11vnc"
diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index c534520..86ead43 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,5 +1,11 @@
 config BR2_PACKAGE_XAVANTE_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LUAFILESYSTEM_AVAILABLE
+	depends on BR2_PACKAGE_CGILUA_AVAILABLE
+	depends on BR2_PACKAGE_COPAS_AVAILABLE
+	depends on BR2_PACKAGE_LUASOCKET_AVAILABLE
+	depends on BR2_PACKAGE_COXPCALL_AVAILABLE
+	depends on BR2_PACKAGE_WSAPI_AVAILABLE
 
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 2c03807..2dda4e3 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_XFSPROGS_AVAILABLE
 	def_bool y
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index 18f47f1..b9c6329 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XL2TP_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBPCAP_AVAILABLE
 
 config BR2_PACKAGE_XL2TP
 	bool "xl2tp"
diff --git a/package/xmlstarlet/Config.in b/package/xmlstarlet/Config.in
index 0fcfe72..4bef3c4 100644
--- a/package/xmlstarlet/Config.in
+++ b/package/xmlstarlet/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_XMLSTARLET_AVAILABLE
 	def_bool y
+	depends on BR2_PACKAGE_LIBXML2_AVAILABLE
+	depends on BR2_PACKAGE_LIBXSLT_AVAILABLE
 
 config BR2_PACKAGE_XMLSTARLET
 	bool "xmlstarlet"
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
index 797f68f..afdf684 100644
--- a/package/xstroke/Config.in
+++ b/package/xstroke/Config.in
@@ -1,6 +1,9 @@
 config BR2_PACKAGE_XSTROKE_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXFT_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXPM_AVAILABLE
 
 config BR2_PACKAGE_XSTROKE
 	bool "xstroke"
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index 9a12a5e..736281d 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XTERM_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
+	depends on BR2_PACKAGE_NCURSES_AVAILABLE
 
 config BR2_PACKAGE_XTERM
 	bool "xterm"
diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index 9d9da81..9f6ba07 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_XVKBD_AVAILABLE
 	def_bool y
 	depends on BR2_PACKAGE_XORG7_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXTST_AVAILABLE
+	depends on BR2_PACKAGE_XLIB_LIBXAW_AVAILABLE
 
 config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index dd1adb6..ce8f725 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_ZEROMQ_AVAILABLE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_PACKAGE_UTIL_LINUX_LIBUUID_AVAILABLE
+	depends on BR2_PACKAGE_UTIL_LINUX_AVAILABLE
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
-- 
1.7.2.5
