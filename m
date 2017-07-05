From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 15:19:29 +0200
Subject: [Buildroot] [git commit] Globally replace $(HOST_DIR)/usr/bin with
	$(HOST_DIR)/bin
Message-ID: <20170705141334.7D6387FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f9c0bf3d5cdd2f99b66da7ab7e23c7b2bfb8c69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since things are no longer installed in $(HOST_DIR)/usr, the callers
should also not refer to it.

This is a mechanical change with
git grep -l '$(HOST_DIR)/usr/bin' | xargs sed -i 's%$(HOST_DIR)/usr/bin%$(HOST_DIR)/bin%g'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |  4 ++--
 boot/grub2/grub2.mk                                |  2 +-
 boot/mxs-bootlets/mxs-bootlets.mk                  |  2 +-
 boot/syslinux/syslinux.mk                          |  4 ++--
 boot/uboot/uboot.mk                                | 12 +++++-----
 fs/axfs/axfs.mk                                    |  2 +-
 fs/cloop/cloop.mk                                  |  4 ++--
 fs/common.mk                                       |  4 ++--
 fs/cramfs/cramfs.mk                                |  2 +-
 fs/iso9660/iso9660.mk                              |  4 ++--
 fs/romfs/romfs.mk                                  |  2 +-
 fs/squashfs/squashfs.mk                            |  2 +-
 fs/yaffs2/yaffs.mk                                 |  2 +-
 linux/linux.mk                                     |  6 ++---
 package/4th/4th.mk                                 |  6 ++---
 package/Makefile.in                                |  8 +++----
 package/am335x-pru-package/am335x-pru-package.mk   |  2 +-
 package/android-tools/android-tools.mk             |  2 +-
 package/autoconf/autoconf.mk                       |  8 +++----
 package/automake/automake.mk                       |  4 ++--
 package/axfsutils/axfsutils.mk                     |  2 +-
 package/b43-firmware/b43-firmware.mk               |  2 +-
 package/b43-fwcutter/b43-fwcutter.mk               |  2 +-
 package/boost/boost.mk                             |  4 ++--
 package/ca-certificates/ca-certificates.mk         |  2 +-
 package/canfestival/canfestival.mk                 |  6 ++---
 package/checkpolicy/checkpolicy.mk                 |  8 +++----
 package/cloop/cloop.mk                             |  6 ++---
 package/cppcms/cppcms.mk                           |  2 +-
 package/cramfs/cramfs.mk                           |  4 ++--
 package/cups/cups.mk                               |  2 +-
 package/dbus-glib/dbus-glib.mk                     |  2 +-
 package/dbus-python/dbus-python.mk                 |  4 ++--
 package/dbus/dbus.mk                               |  2 +-
 package/directfb/directfb.mk                       |  4 ++--
 package/docker-containerd/docker-containerd.mk     |  2 +-
 package/docker-engine/docker-engine.mk             |  2 +-
 package/efl/efl.mk                                 | 16 ++++++-------
 package/elftosb/elftosb.mk                         |  6 ++---
 package/enlightenment/enlightenment.mk             |  6 ++---
 package/erlang-rebar/erlang-rebar.mk               |  2 +-
 package/fakedate/fakedate.mk                       |  2 +-
 package/flannel/flannel.mk                         |  2 +-
 package/gcc/gcc.mk                                 |  2 +-
 package/gdb/gdb.mk                                 |  4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk                   |  2 +-
 package/gettext/gettext.mk                         |  4 ++--
 package/go/go.mk                                   |  4 ++--
 package/gob2/gob2.mk                               |  2 +-
 package/gtest/gtest.mk                             |  2 +-
 package/guile/guile.mk                             |  2 +-
 package/gvfs/gvfs.mk                               |  2 +-
 package/heimdal/heimdal.mk                         |  4 ++--
 package/i2c-tools/i2c-tools.mk                     |  4 ++--
 package/iw/iw.mk                                   |  2 +-
 package/jsmin/jsmin.mk                             |  2 +-
 .../kodi-jsonschemabuilder.mk                      |  2 +-
 .../kodi-skin-confluence/kodi-skin-confluence.mk   |  2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk   |  2 +-
 package/kodi/kodi.mk                               |  4 ++--
 package/libglib2/libglib2.mk                       |  6 ++---
 package/libgtk2/libgtk2.mk                         |  6 ++---
 package/libgtk3/libgtk3.mk                         | 18 +++++++--------
 package/libiio/libiio.mk                           |  4 ++--
 package/libtool/libtool.mk                         |  4 ++--
 package/libv4l/libv4l.mk                           |  6 ++---
 package/libxml2/libxml2.mk                         |  2 +-
 package/libxmlrpc/libxmlrpc.mk                     |  2 +-
 package/localedef/localedef.mk                     |  2 +-
 package/lpc3250loader/lpc3250loader.mk             |  2 +-
 package/luainterpreter/luainterpreter.mk           |  2 +-
 package/luarocks/luarocks.mk                       |  2 +-
 package/lzma/lzma.mk                               |  2 +-
 package/lzop/lzop.mk                               |  2 +-
 package/makedevs/makedevs.mk                       |  2 +-
 package/mfgtools/mfgtools.mk                       |  2 +-
 package/mkpasswd/mkpasswd.mk                       |  4 ++--
 package/mkpimage/mkpimage.mk                       |  2 +-
 package/moarvm/moarvm.mk                           |  2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk           |  2 +-
 package/mplayer/mplayer.mk                         |  2 +-
 package/mxsldr/mxsldr.mk                           |  2 +-
 package/ncftp/ncftp.mk                             |  2 +-
 package/ninja/ninja.mk                             |  2 +-
 package/nodejs/nodejs.mk                           | 26 +++++++++++-----------
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  2 +-
 package/omniorb/omniorb.mk                         |  6 ++---
 package/opencv3/opencv3.mk                         |  4 ++--
 package/oracle-mysql/oracle-mysql.mk               |  2 +-
 package/php-amqp/php-amqp.mk                       |  4 ++--
 package/php-geoip/php-geoip.mk                     |  4 ++--
 package/php-gnupg/php-gnupg.mk                     |  4 ++--
 package/php-imagick/php-imagick.mk                 |  4 ++--
 package/php-memcached/php-memcached.mk             |  4 ++--
 package/php-ssh2/php-ssh2.mk                       |  4 ++--
 package/php-yaml/php-yaml.mk                       |  4 ++--
 package/php-zmq/php-zmq.mk                         |  4 ++--
 package/pinentry/pinentry.mk                       |  2 +-
 package/pkg-cmake.mk                               |  4 ++--
 package/pkg-perl.mk                                |  2 +-
 package/pkg-python.mk                              |  6 ++---
 package/pkg-waf.mk                                 | 10 ++++-----
 package/pkgconf/pkgconf.mk                         | 10 ++++-----
 package/policycoreutils/policycoreutils.mk         |  8 +++----
 package/protobuf/protobuf.mk                       |  2 +-
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 package/python-gobject/python-gobject.mk           |  4 ++--
 package/python-lxml/python-lxml.mk                 |  4 ++--
 package/python-pypcap/python-pypcap.mk             |  4 ++--
 package/python-pyqt/python-pyqt.mk                 |  4 ++--
 package/python-pyqt5/python-pyqt5.mk               |  4 ++--
 package/python-setuptools/python-setuptools.mk     |  2 +-
 package/python-sip/python-sip.mk                   |  6 ++---
 package/python-web2py/python-web2py.mk             |  2 +-
 package/python/python.mk                           |  6 ++---
 package/python3/python3.mk                         | 16 ++++++-------
 package/qemu/qemu.mk                               |  8 +++----
 package/qpid-proton/qpid-proton.mk                 |  2 +-
 package/qt/qt.mk                                   | 14 ++++++------
 package/qt5/qt5.mk                                 |  2 +-
 package/qt5/qt53d/qt53d.mk                         |  2 +-
 package/qt5/qt5canvas3d/qt5canvas3d.mk             |  2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk     |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk       |  2 +-
 package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk     |  2 +-
 package/qt5/qt5location/qt5location.mk             |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  2 +-
 package/qt5/qt5script/qt5script.mk                 |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk               |  2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk           |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk         |  2 +-
 package/qt5/qt5svg/qt5svg.mk                       |  2 +-
 package/qt5/qt5tools/qt5tools.mk                   |  2 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   |  2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk         |  2 +-
 package/qt5/qt5webkit/qt5webkit.mk                 |  4 ++--
 package/qt5/qt5websockets/qt5websockets.mk         |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk           |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       |  2 +-
 package/qt5cinex/qt5cinex.mk                       |  2 +-
 package/refpolicy/refpolicy.mk                     |  2 +-
 package/runc/runc.mk                               |  2 +-
 package/s6-rc/s6-rc.mk                             |  2 +-
 package/sam-ba/sam-ba.mk                           |  4 ++--
 package/scons/scons.mk                             |  2 +-
 package/setools/setools.mk                         |  2 +-
 package/shared-mime-info/shared-mime-info.mk       |  4 ++--
 package/socat/socat.mk                             |  2 +-
 package/softether/softether.mk                     |  2 +-
 package/sqlcipher/sqlcipher.mk                     |  2 +-
 package/squashfs/squashfs.mk                       |  2 +-
 package/sunxi-tools/sunxi-tools.mk                 |  2 +-
 package/swig/swig.mk                               |  8 +++----
 package/systemd/systemd.mk                         |  2 +-
 package/tcllib/tcllib.mk                           |  2 +-
 package/terminology/terminology.mk                 |  2 +-
 package/thrift/thrift.mk                           |  4 ++--
 package/tvheadend/tvheadend.mk                     |  4 ++--
 package/uboot-tools/uboot-tools.mk                 |  8 +++----
 package/uclibc/uclibc.mk                           |  8 +++----
 package/upx/upx.mk                                 |  2 +-
 package/vala/vala.mk                               |  8 +++----
 package/vlc/vlc.mk                                 |  6 ++---
 package/waf/waf.mk                                 |  2 +-
 package/wireshark/wireshark.mk                     |  6 ++---
 package/x11r7/libxcb/libxcb.mk                     |  4 ++--
 .../xfont_font-adobe-100dpi.mk                     |  4 ++--
 .../xfont_font-adobe-75dpi.mk                      |  4 ++--
 .../xfont_font-adobe-utopia-100dpi.mk              |  4 ++--
 .../xfont_font-adobe-utopia-75dpi.mk               |  4 ++--
 .../xfont_font-adobe-utopia-type1.mk               |  4 ++--
 package/x11r7/xfont_font-alias/xfont_font-alias.mk |  4 ++--
 .../xfont_font-arabic-misc.mk                      |  4 ++--
 .../xfont_font-bh-100dpi/xfont_font-bh-100dpi.mk   |  4 ++--
 .../xfont_font-bh-75dpi/xfont_font-bh-75dpi.mk     |  4 ++--
 .../xfont_font-bh-lucidatypewriter-100dpi.mk       |  4 ++--
 .../xfont_font-bh-lucidatypewriter-75dpi.mk        |  4 ++--
 .../x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.mk   |  4 ++--
 .../xfont_font-bh-type1/xfont_font-bh-type1.mk     |  4 ++--
 .../xfont_font-bitstream-100dpi.mk                 |  4 ++--
 .../xfont_font-bitstream-75dpi.mk                  |  4 ++--
 .../xfont_font-bitstream-type1.mk                  |  4 ++--
 .../xfont_font-cronyx-cyrillic.mk                  |  4 ++--
 .../xfont_font-cursor-misc.mk                      |  4 ++--
 .../xfont_font-daewoo-misc.mk                      |  4 ++--
 .../xfont_font-dec-misc/xfont_font-dec-misc.mk     |  4 ++--
 .../xfont_font-ibm-type1/xfont_font-ibm-type1.mk   |  4 ++--
 .../xfont_font-isas-misc/xfont_font-isas-misc.mk   |  4 ++--
 .../xfont_font-jis-misc/xfont_font-jis-misc.mk     |  4 ++--
 .../xfont_font-micro-misc/xfont_font-micro-misc.mk |  4 ++--
 .../xfont_font-misc-cyrillic.mk                    |  4 ++--
 .../xfont_font-misc-ethiopic.mk                    |  4 ++--
 .../xfont_font-misc-meltho.mk                      |  4 ++--
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |  4 ++--
 .../xfont_font-mutt-misc/xfont_font-mutt-misc.mk   |  4 ++--
 .../xfont_font-schumacher-misc.mk                  |  4 ++--
 .../xfont_font-screen-cyrillic.mk                  |  4 ++--
 .../xfont_font-sony-misc/xfont_font-sony-misc.mk   |  4 ++--
 .../xfont_font-sun-misc/xfont_font-sun-misc.mk     |  4 ++--
 .../xfont_font-winitzki-cyrillic.mk                |  4 ++--
 .../xfont_font-xfree86-type1.mk                    |  4 ++--
 package/x264/x264.mk                               |  2 +-
 package/xen/xen.mk                                 |  2 +-
 package/yaffs2utils/yaffs2utils.mk                 |  2 +-
 package/zynq-boot-bin/zynq-boot-bin.mk             |  2 +-
 support/dependencies/check-host-cmake.mk           |  2 +-
 support/dependencies/check-host-lzip.mk            |  2 +-
 support/dependencies/check-host-tar.mk             |  2 +-
 support/dependencies/check-host-xzcat.mk           |  2 +-
 .../toolchain-external/pkg-toolchain-external.mk   |  8 +++----
 toolchain/toolchain-wrapper.mk                     |  2 +-
 215 files changed, 403 insertions(+), 403 deletions(-)

Patch is too large, so refusing to show it
