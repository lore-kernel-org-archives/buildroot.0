From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Nov 2013 20:14:58 +0100
Subject: [Buildroot] [pull request] Branch for-peter-2013.11
Message-ID: <20131104201458.5856222e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

While you have been away, I've accumulated a bunch of patches into a
for-peter-2013.11 branch, to ease their integration into the master
branch now that you're back from holidays.

I've been very conservative on the changes I've taken: no version bump,
no new packages, only fixes or minor improvements. Typically patches
that would generally have been taken after -rc1 is released.

Note that I've marked those patches as "Accepted" in patchwork, so if
you don't merge them, please let me know so that I can mark them again
as "New".

Thanks!

Thomas

The following changes since commit ca5639f8d00aae6427054dee1f0433583ad3041d:

  alsamixergui: needs mmu (2013-10-28 17:28:28 +0100)

are available in the git repository at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-peter-2013.11

for you to fetch changes up to 3484dc068a5895650385243a553979443017f4bd:

  libvpx: needs thread support (2013-11-02 19:36:12 +0100)

----------------------------------------------------------------
Arnaud R?billout (1):
      uemacs: fix package source

Axel Lin (1):
      cppzmq/czmq: Update comment for needs threads support

Clayton Shotwell (1):
      cryptsetup: Add libintl for UCLIBC toolchain

Denis Mingulov (1):
      rsync: use system zlib and popt, also do not lose debug options

Gustavo Zacarias (6):
      cjson: link with libm, unavailable for static
      libcgroup: also needs host-flex
      arch/Config.in: introduce BR2_KERNEL_64_USERLAND_32 symbol
      ebtables: build fix for 64-bit kernel with 32-bit userland
      strongswan: add security patches
      uboot-tools: fix license issues

Jerzy Grzegorek (1):
      package: cleanup github <pkg>{_VERSION, _SOURCE, _SITE} variable

Markos Chandras (2):
      arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
      ext-toolchain: MIPS: Select correct endianness for the target

Olivier Schonken (1):
      util-linux: Add --without-ncurses to host-util-linux

Peter Seiderer (1):
      support/kconfig: fix compile warning because of missing include.

Phil Eichinger (1):
      valgrind: add support for glibc 2.17 and 2.18

Romain Naour (3):
      trace-cmd: fix ptrace detection
      ngrep: rename existing patch
      ngrep: fix static linking issue with libpcre

Ryan Barnett (1):
      sysvinit: install new cmds and fix inittab

Samuel Martin (3):
      support: trivial fixes (typos and minor rewording) in gen-manual-lists.py
      manual: developer-guide.txt: cleanup non-existing source
      manual: customize-toolchain.txt: update internal backend section

Thomas De Schampheleire (5):
      Config.in files: add/update comments on (e)glibc dependencies
      manual generation: check dependencies first
      manual generation: rename manual-txt into manual-text
      manual: github commits should be specified in full
      git packages: use full revision hash

Thomas Petazzoni (11):
      toolchain-external: add missing symlink for Linaro toolchains
      toolchain-external: fix visibility and length of Linaro toolchain comment
      glibc, toolchain-external: copy libthread_db when gdb is enabled
      pkgconf: fix upstream URL
      xenomai: use install-user to remove patch
      libcap: rename existing patch
      libcap: fix static link
      libnl: simplify makefile by using --{enable, disable}-cli
      libnl: do not allow to build tools on static lib configs
      dhcpcd: needs MMU
      libvpx: needs thread support

 Makefile                                           |  4 +-
 arch/Config.in                                     |  3 ++
 arch/Config.in.mips                                |  3 +-
 docs/manual/adding-packages-tips.txt               |  7 ++-
 docs/manual/customize-toolchain.txt                | 13 ++++--
 docs/manual/developer-guide.txt                    |  2 -
 docs/manual/make-tips.txt                          |  3 +-
 docs/manual/manual.mk                              | 34 ++++++++++++++-
 docs/manual/prerequisite.txt                       |  5 ++-
 package/a10disp/a10disp.mk                         |  2 +-
 package/civetweb/civetweb.mk                       |  4 +-
 package/cjson/Config.in                            |  2 +
 package/cjson/cjson.mk                             |  3 +-
 package/cppcms/Config.in                           |  2 +-
 package/cppzmq/Config.in                           |  2 +-
 package/cppzmq/cppzmq.mk                           |  2 +-
 package/cryptsetup/Config.in                       |  1 +
 package/cryptsetup/cryptsetup.mk                   |  7 ++-
 package/czmq/Config.in                             |  2 +-
 package/czmq/czmq.mk                               |  2 +-
 package/dhcpcd/Config.in                           |  1 +
 package/dhcpcd/dhcpcd.mk                           |  4 --
 package/ebtables/ebtables.mk                       |  3 +-
 package/filemq/filemq.mk                           |  2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in   |  2 +-
 package/glibc/glibc.mk                             |  2 +-
 package/gstreamer/gst-plugin-x170/Config.in        |  5 ++-
 package/gstreamer1/gst1-plugins-good/Config.in     |  4 ++
 package/jquery-keyboard/jquery-keyboard.mk         |  4 +-
 package/jsmin/jsmin.mk                             |  2 +-
 package/knock/knock.mk                             |  2 +-
 ...d-system.patch => libcap-01-build-system.patch} |  0
 .../libcap-02-split-static-shared-install.patch    | 30 +++++++++++++
 package/libcap/libcap.mk                           | 27 ++++++------
 package/libcgroup/libcgroup.mk                     |  2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk   |  4 +-
 package/libnfc/libnfc.mk                           |  2 +-
 package/libnl/Config.in                            | 13 ++++--
 package/libnl/libnl.mk                             | 19 ++------
 package/libv4l/Config.in                           |  4 +-
 package/libvpx/Config.in                           |  4 ++
 package/linenoise/linenoise.mk                     |  2 +-
 package/lua-ev/lua-ev.mk                           |  2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk   |  2 +-
 package/luaexpatutils/luaexpatutils.mk             |  2 +-
 package/mongrel2/mongrel2.mk                       |  5 +--
 package/mtdev2tuio/mtdev2tuio.mk                   |  2 +-
 package/ne10/ne10.mk                               |  2 +-
 ...-make-objs.patch => ngrep-0001-make-objs.patch} |  0
 ...e-header.patch => ngrep-0002-pcre-header.patch} |  0
 package/ngrep/ngrep-0003-fix-static-link.patch     | 25 +++++++++++
 package/ngrep/ngrep.mk                             |  2 +-
 package/nss-mdns/Config.in                         |  4 ++
 package/omap-u-boot-utils/omap-u-boot-utils.mk     |  2 +-
 package/on2-8170-libs/Config.in                    |  5 ++-
 package/on2-8170-modules/on2-8170-modules.mk       |  2 +-
 package/pkgconf/pkgconf.mk                         |  2 +-
 package/python-ipy/python-ipy.mk                   |  5 +--
 package/qextserialport/qextserialport.mk           |  2 +-
 package/qtuio/qtuio.mk                             |  2 +-
 package/rpi-firmware/rpi-firmware.mk               |  2 +-
 package/rpi-userland/rpi-userland.mk               |  2 +-
 package/rsync/Config.in                            |  2 +
 package/rsync/rsync.mk                             |  7 ++-
 package/socketcand/socketcand.mk                   |  2 +-
 package/sqlcipher/sqlcipher.mk                     |  4 +-
 .../strongswan-0003-CVE-2013-5018-fix.patch        | 29 +++++++++++++
 .../strongswan-0004-CVE-2013-6075-fix.patch        | 27 ++++++++++++
 .../strongswan-0005-CVE-2013-6076-fix.patch        | 27 ++++++++++++
 package/sunxi-cedarx/Config.in                     |  8 ++--
 package/sunxi-cedarx/sunxi-cedarx.mk               |  2 +-
 package/sunxi-mali-prop/sunxi-mali-prop.mk         |  2 +-
 package/sunxi-mali/Config.in                       |  5 ++-
 package/sunxi-mali/sunxi-mali.mk                   |  2 +-
 package/sysvinit/inittab                           |  1 +
 package/sysvinit/sysvinit.mk                       | 11 ++---
 package/ti-gfx/Config.in                           |  5 ++-
 package/ti-utils/ti-utils.mk                       |  2 +-
 .../trace-cmd-0002-Fix-ptrace-detection.patch      | 36 ++++++++++++++++
 package/tvheadend/tvheadend.mk                     |  2 +-
 package/uboot-tools/uboot-tools.mk                 |  2 +-
 package/uemacs/uemacs.mk                           |  2 +-
 package/util-linux/util-linux.mk                   |  2 +-
 ...grind-add-support-for-glibc-2.17-and-2.18.patch | 50 ++++++++++++++++++++++
 package/valgrind/valgrind.mk                       |  2 +-
 .../xenomai/xenomai-do-not-install-devices.patch   | 11 -----
 package/xenomai/xenomai.mk                         |  2 +
 package/zmqpp/zmqpp.mk                             |  2 +-
 package/zyre/zyre.mk                               |  2 +-
 support/dependencies/check-host-asciidoc.sh        | 36 ++++++++++++++++
 support/kconfig/confdata.c                         |  1 +
 .../patches/14-support-out-of-tree-config.patch    | 22 +++++++---
 support/scripts/gen-manual-lists.py                | 15 +++----
 toolchain/toolchain-external/Config.in             | 29 ++++---------
 .../toolchain-external/ext-toolchain-wrapper.c     |  6 +++
 toolchain/toolchain-external/toolchain-external.mk | 16 +++++--
 96 files changed, 503 insertions(+), 182 deletions(-)
 rename package/libcap/{libcap-2.22-build-system.patch => libcap-01-build-system.patch} (100%)
 create mode 100644 package/libcap/libcap-02-split-static-shared-install.patch
 rename package/ngrep/{ngrep-1.45-make-objs.patch => ngrep-0001-make-objs.patch} (100%)
 rename package/ngrep/{ngrep-1.45-pcre-header.patch => ngrep-0002-pcre-header.patch} (100%)
 create mode 100644 package/ngrep/ngrep-0003-fix-static-link.patch
 create mode 100644 package/strongswan/strongswan-0003-CVE-2013-5018-fix.patch
 create mode 100644 package/strongswan/strongswan-0004-CVE-2013-6075-fix.patch
 create mode 100644 package/strongswan/strongswan-0005-CVE-2013-6076-fix.patch
 create mode 100644 package/trace-cmd/trace-cmd-0002-Fix-ptrace-detection.patch
 create mode 100644 package/valgrind/valgrind-add-support-for-glibc-2.17-and-2.18.patch
 delete mode 100644 package/xenomai/xenomai-do-not-install-devices.patch
 create mode 100755 support/dependencies/check-host-asciidoc.sh


-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
