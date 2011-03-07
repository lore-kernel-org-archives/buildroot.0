From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Mar 2011 23:28:33 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.05/rename-toolchain-config-opts
Message-ID: <cover.1299536722.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

During the post-FOSDEM Buildroot Developer Day, we decided to clean up
and clarify the name of the toolchain options concerning large file,
IPv6, RPC, locale, program invocation, C++, etc. The goal is to have
something more coherent and more meaningful, so all options are now
named BR2_TOOLCHAIN_HAS_xxx.

The last commit is just a cleanup patch that fixes tab or space issues
in various Config.in files.

Thomas

The following changes since commit 0a064b48c9d1044b05aee65272f5af7f28879473:
  Gustavo Zacarias (1):
        gst-ffmpeg: bump to version 0.10.11

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot for-2011.05/rename-toolchain-config-opts

Thomas Petazzoni (9):
      Rename BR2_LARGEFILE to BR2_TOOLCHAIN_HAS_LARGEFILE
      Rename BR2_INET_IPV6 to BR2_TOOLCHAIN_HAS_IPV6
      Rename BR2_INET_RPC to BR2_TOOLCHAIN_HAS_RPC
      Rename BR2_USE_WCHAR to BR2_TOOLCHAIN_HAS_WCHAR
      Rename BR2_ENABLE_LOCALE_{PURGE,WHITELIST} to BR2_LOCALE_{PURGE,WHITELIST}
      Rename BR2_ENABLE_LOCALE to BR2_TOOLCHAIN_HAS_LOCALE
      Rename BR2_PROGRAM_INVOCATION to BR2_TOOLCHAIN_HAS_PROGRAM_INVOCATION
      Rename BR2_INSTALL_LIBSTDCPP to BR2_TOOLCHAIN_HAS_CPP
      Fix minor spacing/tabs issues in package/*/Config.in

 Makefile                                           |    6 ++--
 boot/grub/grub.mk                                  |    2 +-
 boot/grub2/grub2.mk                                |    2 +-
 configs/arm_nptl_toolchain_defconfig               |   12 +++---
 configs/arm_toolchain_defconfig                    |   12 +++---
 package/Makefile.in                                |   10 +++---
 package/alsamixergui/Config.in                     |    4 +-
 package/atk/Config.in                              |    4 +-
 package/axel/axel.mk                               |    2 +-
 package/bind/Config.in                             |    4 +-
 package/bison/Config.in                            |    4 +-
 package/blackbox/Config.in                         |    6 ++--
 package/blackbox/blackbox.mk                       |    2 +-
 package/bmon/Config.in                             |    4 +-
 package/bootutils/Config.in                        |    4 +-
 package/busybox/busybox.mk                         |    6 ++--
 package/bzip2/bzip2.mk                             |    2 +-
 package/cdrkit/Config.in                           |    4 +-
 package/coreutils/Config.in                        |    4 +-
 package/cramfs/Config.in                           |   10 +++---
 package/ctorrent/Config.in                         |    4 +-
 package/cups/Config.in                             |    4 +-
 package/cvs/Config.in                              |    2 +-
 package/dbus-glib/Config.in                        |    4 +-
 package/dbus-python/Config.in                      |    4 +-
 package/dialog/Config.in                           |    2 +-
 package/dialog/dialog.mk                           |    2 +-
 package/diffutils/Config.in                        |    2 +-
 package/dmalloc/dmalloc.mk                         |    2 +-
 package/dmraid/Config.in                           |    4 +-
 package/dnsmasq/Config.in                          |    2 +-
 package/dnsmasq/dnsmasq.mk                         |    4 +-
 package/docker/Config.in                           |    4 +-
 package/dosfstools/Config.in                       |    4 +-
 package/e2fsprogs/Config.in                        |    4 +-
 package/enchant/Config.in                          |    6 ++--
 package/expat/Config.in                            |    2 +-
 package/findutils/Config.in                        |    4 +-
 package/fltk/Config.in                             |    4 +-
 package/fuse/Config.in                             |    4 +-
 package/gamin/Config.in                            |    4 +-
 package/gamin/gamin.mk                             |    2 +-
 package/gawk/Config.in                             |    2 +-
 package/gdk-pixbuf/Config.in                       |    4 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                   |    4 +-
 package/genext2fs/Config.in                        |   14 ++++----
 package/genromfs/Config.in                         |    8 ++--
 package/gettext/Config.in                          |    6 ++--
 package/gmpc/Config.in                             |    6 ++--
 package/gob2/Config.in                             |    4 +-
 package/gperf/Config.in                            |    4 +-
 package/gpsd/gpsd.mk                               |    2 +-
 package/grep/Config.in                             |    4 +-
 package/gvfs/Config.in                             |    6 ++--
 package/hal/Config.in                              |    6 ++--
 package/hdparm/Config.in                           |    4 +-
 package/hostapd/hostapd.mk                         |    2 +-
 package/i2c-tools/Config.in                        |   14 ++++----
 package/icu/Config.in                              |    6 ++--
 package/imagemagick/imagemagick.mk                 |    2 +-
 package/iperf/Config.in                            |    4 +-
 package/ipsec-tools/ipsec-tools.mk                 |    2 +-
 package/iptables/Config.in                         |    4 +-
 package/iptables/iptables.mk                       |    2 +-
 package/kismet/Config.in                           |    4 +-
 package/libarchive/Config.in                       |    4 +-
 package/libcgicc/Config.in                         |    4 +-
 package/libconfig/libconfig.mk                     |    2 +-
 package/libdrm/Config.in                           |    4 +-
 package/libelf/libelf.mk                           |    2 +-
 package/libglade/Config.in                         |    4 +-
 package/libglib2/Config.in                         |    6 ++--
 package/libglib2/libglib2.mk                       |    4 +-
 package/libgtk2/Config.in                          |    6 ++--
 package/libiconv/Config.in                         |    2 +-
 package/libiconv/libiconv.mk                       |    2 +-
 package/librsvg/Config.in                          |    2 +-
 package/libsigc/Config.in                          |    4 +-
 package/libsoup/Config.in                          |    4 +-
 package/libsoup/libsoup.mk                         |    2 +-
 package/libupnp/Config.in                          |    4 +-
 package/libxml2/libxml2.mk                         |    2 +-
 package/lighttpd/lighttpd.mk                       |    2 +-
 package/lmbench/Config.in                          |    4 +-
 package/logrotate/Config.in                        |    4 +-
 package/lsof/Config.in                             |    4 +-
 package/lsof/lsof.mk                               |    8 ++--
 package/luafilesystem/luafilesystem.mk             |    2 +-
 package/lvm2/Config.in                             |    4 +-
 package/lzma/Config.in                             |    4 +-
 package/m4/Config.in                               |    4 +-
 package/m4/m4.mk                                   |    2 +-
 package/makedevs/Config.in                         |    8 ++--
 package/memtester/Config.in                        |    4 +-
 package/midori/Config.in                           |    6 ++--
 package/mtd/Config.in                              |    4 +-
 package/multimedia/alsa-utils/Config.in            |    8 ++--
 package/multimedia/festival/Config.in              |    4 +-
 package/multimedia/festival/speech-tools/Config.in |    4 +-
 package/multimedia/ffmpeg/Config.in                |    7 ++--
 package/multimedia/gst-ffmpeg/Config.in            |    7 ++--
 package/multimedia/gst-plugins-bad/Config.in       |    4 +-
 package/multimedia/gst-plugins-base/Config.in      |    4 +-
 package/multimedia/gst-plugins-good/Config.in      |    4 +-
 package/multimedia/gstreamer/Config.in             |    4 +-
 package/multimedia/libdvdnav/Config.in             |    4 +-
 package/multimedia/libdvdread/Config.in            |    4 +-
 package/multimedia/libmms/Config.in                |    4 +-
 package/multimedia/libmpd/Config.in                |    6 ++--
 package/multimedia/mpd/Config.in                   |   12 +++---
 package/multimedia/mplayer/mplayer.mk              |    4 +-
 package/multimedia/swfdec/Config.in                |    6 ++--
 package/multimedia/taglib/Config.in                |    4 +-
 package/multimedia/wavpack/Config.in               |    2 +-
 package/multimedia/wavpack/wavpack.mk              |    2 +-
 package/mutt/Config.in                             |    4 +-
 package/mysql_client/Config.in                     |    4 +-
 package/nbd/Config.in                              |    4 +-
 package/nbd/nbd.mk                                 |    2 +-
 package/ncftp/Config.in                            |    4 +-
 package/netkitbase/Config.in                       |    4 +-
 package/netkittelnet/Config.in                     |    4 +-
 package/netsnmp/netsnmp.mk                         |    2 +-
 package/nfs-utils/Config.in                        |    6 ++--
 package/ntfs-3g/Config.in                          |    6 ++--
 package/ntfsprogs/Config.in                        |    6 ++--
 package/ntp/ntp.mk                                 |    2 +-
 package/olsr/Config.in                             |    4 +-
 package/oprofile/Config.in                         |    4 +-
 package/pango/Config.in                            |    6 ++--
 package/patch/Config.in                            |    4 +-
 package/pcmanfm/Config.in                          |    4 +-
 package/pcre/pcre.mk                               |    2 +-
 package/php/Config.ext                             |    8 ++--
 package/php/php.mk                                 |    4 +-
 package/pkg-config/Config.in                       |    4 +-
 package/portmap/Config.in                          |    4 +-
 package/pppd/pppd.mk                               |    2 +-
 package/python/Config.in                           |    4 +-
 package/qt/Config.in                               |    4 +-
 package/qt/qt.mk                                   |    4 +-
 package/quagga/Config.in                           |    4 +-
 package/radvd/Config.in                            |    2 +-
 package/rpm/Config.in                              |    4 +-
 package/rrdtool/Config.in                          |    4 +-
 package/ruby/Config.in                             |    4 +-
 package/samba/Config.in                            |    2 +-
 package/samba/samba.mk                             |    4 +-
 package/sdl_sound/Config.in                        |    2 +-
 package/sdl_sound/sdl_sound.mk                     |    2 +-
 package/sed/Config.in                              |    2 +-
 package/sfdisk/sfdisk.mk                           |    2 +-
 package/shared-mime-info/Config.in                 |    4 +-
 package/smartmontools/Config.in                    |    4 +-
 package/spawn-fcgi/spawn-fcgi.mk                   |    2 +-
 package/sqlite/sqlite.mk                           |    2 +-
 package/squashfs/Config.in                         |    4 +-
 package/squashfs3/Config.in                        |    4 +-
 package/squid/Config.in                            |    6 ++--
 package/sshfs/Config.in                            |    8 ++--
 package/sshfs/sshfs.mk                             |    2 +-
 package/strace/strace.mk                           |    2 +-
 package/synergy/Config.in                          |    6 ++--
 package/sysklogd/Config.in                         |    4 +-
 package/tar/Config.in                              |    4 +-
 package/udev/udev.mk                               |    2 +-
 package/udpcast/Config.in                          |    4 +-
 package/usbutils/Config.in                         |    4 +-
 package/util-linux/Config.in                       |    4 +-
 package/webkit/Config.in                           |    6 ++--
 package/wget/Config.in                             |    4 +-
 package/wipe/wipe.mk                               |    2 +-
 package/x11r7/Config.in                            |    8 ++--
 package/x11r7/mesa3d/Config.in                     |    2 +-
 package/x11r7/xlib_libpciaccess/Config.in          |    4 +-
 package/xerces/Config.in                           |    5 ++-
 package/xfsprogs/Config.in                         |    4 +-
 package/xmlstarlet/Config.in                       |    2 +-
 target/xtensa/defconfig                            |    6 ++--
 toolchain/dependencies/dependencies.sh             |    2 +-
 toolchain/gcc/Config.in                            |    4 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    6 ++--
 toolchain/gdb/Config.in                            |    4 +-
 toolchain/gdb/gdb.mk                               |    2 +-
 toolchain/helpers.mk                               |   24 ++++++------
 toolchain/toolchain-buildroot/Config.in.2          |   14 ++++----
 toolchain/toolchain-common.in                      |   22 ++++++------
 toolchain/toolchain-crosstool-ng/Config.in         |   38 ++++++++++----------
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   14 ++++----
 toolchain/toolchain-external/Config.in             |   38 ++++++++++----------
 toolchain/toolchain-external/ext-tool.mk           |    6 ++--
 toolchain/uClibc/uclibc.mk                         |   12 +++---
 192 files changed, 470 insertions(+), 467 deletions(-)

Thanks,
--
Thomas Petazzoni
