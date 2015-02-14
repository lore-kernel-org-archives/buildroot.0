From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:11 +0100
Subject: [Buildroot] [PATCH 0/12 v2] arch/avr32: say bye-bye! (branch
	yem/avr32)
Message-ID: <cover.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As stated in c2444e9 (arch: avr32 should only get removed for the 2015.02
release), get rid of avr32.

There still remain a few (34!) occurences of avr32, though:

  - fbv: the patch was seemingly made when testing for avr32, but is
    suposedly valid for other BE archs;

  - rubix: ditto;

  - x11r7: innocuous hunk for avr32, that we do not get rid of, since
    it is a patch from upstream;

  - other packages get their sources from an avr32-related site,
    presumably a mirror of the (now replaced?) avr32linux.org site;

  - a few references here-and-there: CHANGES, GNU's config.{guess,sub},
    uClibc's .config files.

Happy mourning! ;-]


Changes v1 -> v2:
  - change the way we hide BR2_avr32 (using BR2_BROKEN)  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit c485d8a3d11616709e23ae959341a3e6c16e9dcd:

  boards/raspberrypi: update dt kernel sha1 (2015-02-14 10:11:33 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/avr32

for you to fetch changes up to c49bccefb0cd1e0a365f4eb85587e3c78825b823:

  arch/avr32: decommission for real (2015-02-14 10:21:34 +0100)

----------------------------------------------------------------
Yann E. MORIN (12):
      arch: kill avr32
      configs: get rid of avr32 defconfigs
      packages: all salute the passing of avr32
      linux: get rid of avr32 specifics
      toolchain/buildroot: forget about avr32
      toolchain/extrnal: avr32 is no more
      package/binutils: avr32 is gone
      package/gcc: do not mourn avr32 for too long...
      package/gdb: farewell avr32
      package/uClibc: RIP, avr32
      package/eudev: we won't miss you, avr32
      arch/avr32: decommission for real

 .defconfig                                         |    1 -
 arch/Config.in                                     |   19 -
 arch/Config.in.avr32                               |   11 -
 configs/atngw100_defconfig                         |   35 -
 configs/atstk100x_defconfig                        |   26 -
 linux/Config.in                                    |    2 +-
 linux/linux.mk                                     |    4 -
 package/aiccu/Config.in                            |    7 -
 package/alsa-lib/0001-avr32-bad-inline.patch       |   91 -
 package/alsa-lib/alsa-lib.mk                       |    4 -
 package/avrdude/Config.in                          |    2 -
 package/bdwgc/Config.in                            |    2 +-
 package/binutils/Config.in.host                    |   13 +-
 package/binutils/binutils.mk                       |    8 -
 package/blktrace/Config.in                         |    2 +-
 package/bluez5_utils/Config.in                     |    1 -
 package/bluez_utils/Config.in                      |    3 +-
 package/btrfs-progs/Config.in                      |    2 -
 package/collectd/Config.in                         |    1 -
 package/connman/Config.in                          |    3 +-
 package/cwiid/Config.in                            |    2 -
 package/dovecot/Config.in                          |    2 -
 package/dropwatch/dropwatch.mk                     |    4 +-
 .../dvb-apps/0002-Fix-compiler-warning-flags.patch |   25 -
 package/e2fsprogs/Config.in                        |    2 +-
 package/ecryptfs-utils/Config.in                   |    4 +-
 package/efl/expedite/Config.in                     |    2 -
 package/efl/libecore/Config.in                     |    2 -
 package/efl/libedbus/Config.in                     |    2 -
 package/efl/libedje/Config.in                      |    2 -
 package/efl/libelementary/Config.in                |    2 -
 package/efl/libethumb/Config.in                    |    2 -
 package/efl/libevas/Config.in                      |    2 -
 package/elfutils/Config.in                         |    4 -
 package/enlightenment/Config.in                    |    2 -
 package/eudev/Config.in                            |    3 -
 package/fbv/0001-arch.patch.avr32                  |   48 -
 package/fio/Config.in                              |    6 +-
 package/gadgetfs-test/Config.in                    |    2 +-
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   49 -
 ...-fix-removal-of-redundant-cast-operations.patch |   16 -
 ...conditional-insn-which-clobbers-cc_status.patch |  150 -
 ...use-movh-to-move-immediates-into-register.patch |   31 -
 .../990-fix-300-libstdc++-pic.patch                |   20 -
 package/gcc/Config.in.host                         |   26 +-
 package/gcc/gcc.mk                                 |    4 +-
 package/gdb/Config.in                              |    4 +-
 package/gdb/Config.in.host                         |    7 -
 package/gdb/gdb.mk                                 |    9 +-
 package/gpsd/Config.in                             |    3 -
 package/gstreamer/gstreamer/gstreamer.mk           |    2 +-
 package/gstreamer1/gst1-libav/Config.in            |    1 -
 package/gstreamer1/gst1-plugins-bad/Config.in      |    1 -
 package/gstreamer1/gstreamer1/gstreamer1.mk        |    2 +-
 package/iputils/Config.in                          |    3 -
 package/keyutils/Config.in                         |    2 +-
 package/libaio/0002-avr32-support.patch            |  122 -
 package/libaio/Config.in                           |    2 +-
 package/libcap-ng/Config.in                        |    1 -
 package/libcec/0001-no-psabi-warning.patch         |   22 -
 package/libev/Config.in                            |    2 +-
 package/libglib2/libglib2.mk                       |    2 +-
 package/libmad/0002-optimization.patch.avr32       | 2922 --------------------
 package/libmad/Config.in                           |    1 -
 package/libmicrohttpd/libmicrohttpd.mk             |    5 -
 package/libsecret/Config.in                        |    3 -
 ...tack-direction-for-the-AVR32-architecture.patch |   33 -
 package/libusb/libusb.mk                           |    4 -
 package/lua-ev/Config.in                           |    2 +-
 package/lxc/Config.in                              |    2 -
 package/mpd/Config.in                              |    6 +-
 package/mtr/Config.in                              |    3 -
 package/mysql/Config.in                            |    1 -
 package/network-manager/Config.in                  |    2 -
 package/ofono/Config.in                            |    2 -
 package/opencv/Config.in                           |    1 -
 package/openobex/Config.in                         |    3 +-
 package/openpgm/Config.in                          |    2 -
 package/oprofile/oprofile.mk                       |    5 -
 package/php/Config.ext                             |    4 -
 package/pinentry/Config.in                         |    2 -
 package/poco/Config.in                             |    5 +-
 .../012-support-library-path-old-compilers.patch   |   54 -
 .../011-support-library-path-old-compilers.patch   |   54 -
 package/qemu/qemu.mk                               |    1 -
 package/qt/Config.in                               |    2 -
 package/qt/qt.mk                                   |    2 -
 package/qt5/Config.in                              |    2 -
 package/qt5/qt5base/Config.in                      |    1 -
 package/qt5/qt5connectivity/Config.in              |    3 +-
 package/radvd/Config.in                            |    2 -
 package/samba/Config.in                            |    2 -
 package/samba4/Config.in                           |    1 -
 package/sconeserver/Config.in                      |    4 +-
 package/snowball-init/Config.in                    |    3 +-
 package/squid/Config.in                            |    1 -
 package/trace-cmd/Config.in                        |    1 -
 package/tvheadend/Config.in                        |    6 -
 package/uboot-tools/uboot-tools.mk                 |    4 +-
 .../0.9.31.1/0001-add-bsd-endian-conversions.patch |   64 -
 .../uclibc/0.9.31.1/0002-add-inotify-init1.patch   |   64 -
 .../uclibc/0.9.31.1/0003-add-sock-cloexec.patch    |   43 -
 .../uclibc/0.9.31.1/0004-export-strverscmp.patch   |   30 -
 .../0005-fix-daylight-saving-time-handling.patch   |   36 -
 .../0.9.31.1/0006-fix-error-locale-utf-8.patch     |   17 -
 .../0.9.31.1/0007-linuxthreads-errno-fix.patch     |   98 -
 .../0008-more-workarounds-GCC-PR32219.patch        |   40 -
 package/uclibc/0.9.31.1/0009-unshare.patch         |   74 -
 .../0.9.31.1/0010-workaround-GCC-PR32219.patch     |   57 -
 .../0.9.31.1/0011-startfiles-Make-targets.patch    |   60 -
 .../0.9.31.1/0012-netlinkaccess-header-types.patch |   35 -
 ...deps-add-__kernel_long-and-__kernel_ulong.patch |   21 -
 ...clude-__iconv_codesets-into-iconv-utility.patch |   79 -
 ...deps-add-__kernel_long-and-__kernel_ulong.patch |   20 +-
 .../0005-Patch-from-OpenWRT-for-avr32.patch        |   28 -
 package/uclibc/Config.in                           |   12 +-
 package/uclibc/uClibc-0.9.31.config                |  258 --
 package/uclibc/uclibc.mk                           |   27 +-
 package/udisks/Config.in                           |    3 -
 package/ussp-push/Config.in                        |    3 +-
 package/util-linux/Config.in                       |    2 -
 package/wayland/Config.in                          |    2 -
 package/weston/Config.in                           |    2 -
 package/wpa_supplicant/Config.in                   |    1 -
 package/x11r7/xserver_xorg-server/Config.in        |    4 -
 package/zeromq/Config.in                           |    1 -
 package/zmqpp/Config.in                            |    2 -
 system/Config.in                                   |    2 -
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 toolchain/toolchain-external/toolchain-external.mk |    4 +-
 130 files changed, 57 insertions(+), 5021 deletions(-)
 delete mode 100644 arch/Config.in.avr32
 delete mode 100644 configs/atngw100_defconfig
 delete mode 100644 configs/atstk100x_defconfig
 delete mode 100644 package/alsa-lib/0001-avr32-bad-inline.patch
 delete mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
 delete mode 100644 package/fbv/0001-arch.patch.avr32
 delete mode 100644 package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
 delete mode 100644 package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
 delete mode 100644 package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
 delete mode 100644 package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
 delete mode 100644 package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch
 delete mode 100644 package/libaio/0002-avr32-support.patch
 delete mode 100644 package/libcec/0001-no-psabi-warning.patch
 delete mode 100644 package/libmad/0002-optimization.patch.avr32
 delete mode 100644 package/libsigsegv/0001-Add-stack-direction-for-the-AVR32-architecture.patch
 delete mode 100644 package/python/012-support-library-path-old-compilers.patch
 delete mode 100644 package/python3/011-support-library-path-old-compilers.patch
 delete mode 100644 package/uclibc/0.9.31.1/0001-add-bsd-endian-conversions.patch
 delete mode 100644 package/uclibc/0.9.31.1/0002-add-inotify-init1.patch
 delete mode 100644 package/uclibc/0.9.31.1/0003-add-sock-cloexec.patch
 delete mode 100644 package/uclibc/0.9.31.1/0004-export-strverscmp.patch
 delete mode 100644 package/uclibc/0.9.31.1/0005-fix-daylight-saving-time-handling.patch
 delete mode 100644 package/uclibc/0.9.31.1/0006-fix-error-locale-utf-8.patch
 delete mode 100644 package/uclibc/0.9.31.1/0007-linuxthreads-errno-fix.patch
 delete mode 100644 package/uclibc/0.9.31.1/0008-more-workarounds-GCC-PR32219.patch
 delete mode 100644 package/uclibc/0.9.31.1/0009-unshare.patch
 delete mode 100644 package/uclibc/0.9.31.1/0010-workaround-GCC-PR32219.patch
 delete mode 100644 package/uclibc/0.9.31.1/0011-startfiles-Make-targets.patch
 delete mode 100644 package/uclibc/0.9.31.1/0012-netlinkaccess-header-types.patch
 delete mode 100644 package/uclibc/0.9.31.1/0013-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
 delete mode 100644 package/uclibc/0.9.31.1/0014-Do-not-include-__iconv_codesets-into-iconv-utility.patch
 delete mode 100644 package/uclibc/0.9.33.2/0005-Patch-from-OpenWRT-for-avr32.patch
 delete mode 100644 package/uclibc/uClibc-0.9.31.config

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
