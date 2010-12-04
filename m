From: Mike Frysinger <vapier@gentoo.org>
Date: Sat,  4 Dec 2010 17:52:01 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
Message-ID: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 7e9c3a387820154fd1355f23c2669072c0c3a5f7:

  docs/news.html: add 2010.11 announce link (2010-11-30 19:50:04 +0100)

are available in the git repository at:
  git://sources.blackfin.uclinux.org/git/users/vapier/buildroot.git vapier

Mike Frysinger (28):
      m4: version bump to 1.4.15
      xz: version bump to 5.0.0
      u-boot: version bump to 2010.09
      rsh-redone: new package for rsh/rlogin clients
      whetstone: new benchmark package
      dhrystone: new benchmark package
      lsuio: new UIO helper package
      pax-utils: new package
      busybox: unify duplicated build steps
      busybox: let buildroot handle stripping
      linux: support unpacked source trees
      linux: drop LDFLAGS override
      linux: add shorter shortcuts
      linux: set a few more initramfs opts for newer kernels
      toolchain: add a USE_MMU build option
      portmap: add nommu support
      portmap: respect target CFLAGS
      portmap: fix clean target to actually clean
      irda-utils: new package for IrDA devices
      libpcap: update static handling
      tcpdump: add patch for nommu systems
      debugging: do not require no stripping
      initial support for Blackfin processors
      gdb: add support for Blackfin gdbserver
      toolchain-external: allow vendor-controlled defaults
      add support for common ABI options (for FLAT)
      TARGET_CFLAGS: convert to kbuild-y style
      target-finalize: punt config scripts too

 Config.in                                          |    4 +-
 Makefile                                           |    3 +-
 boot/u-boot/Config.in                              |   10 +-
 boot/u-boot/u-boot.mk                              |    2 +
 docs/README                                        |    2 +-
 docs/buildroot.html                                |    2 +-
 linux/Config.in                                    |   13 +-
 linux/linux.mk                                     |   70 ++++--
 package/Config.in                                  |    6 +
 package/Makefile.in                                |   67 ++----
 .../busybox-1.17.3/busybox-1.17.3-skip_strip.patch |   26 +++
 package/busybox/busybox.mk                         |   21 +--
 package/dhrystone/Config.in                        |    6 +
 package/dhrystone/Makefile                         |   13 +
 package/dhrystone/dhrystone-2-HZ.patch             |   13 +
 package/dhrystone/dhrystone-2-cmdline-nruns.patch  |   51 +++++
 package/dhrystone/dhrystone-2-exit.patch           |   12 +
 package/dhrystone/dhrystone-2-prototypes.patch     |   21 ++
 package/dhrystone/dhrystone.mk                     |   37 +++
 package/irda-utils/Config.in                       |   19 ++
 package/irda-utils/irda-utils-0.9.18-daemon.patch  |   26 +++
 package/irda-utils/irda-utils-0.9.18-nommu.patch   |   14 ++
 package/irda-utils/irda-utils-0.9.18-subdir.patch  |   16 ++
 package/irda-utils/irda-utils.mk                   |   47 ++++
 package/libpcap/libpcap.mk                         |    7 +-
 package/lsuio/Config.in                            |    6 +
 package/lsuio/lsuio.mk                             |   11 +
 package/m4/m4-1.4.15-uclibc-sched_param-def.patch  |   19 ++
 package/m4/m4.mk                                   |    2 +-
 package/pax-utils/Config.in                        |    6 +
 package/pax-utils/pax-utils.mk                     |   42 ++++
 ...0-0001-README-fix-typo-in-tcp-wrapper-doc.patch |   26 +++
 ...0002-NO_PIE-make-PIE-support-controllable.patch |   53 +++++
 ...K-control-usage-of-fork-for-nommu-systems.patch |  110 +++++++++
 ...ERROR-control-overriding-of-perror-symbol.patch |   46 ++++
 package/portmap/portmap.mk                         |   12 +-
 package/rsh-redone/Config.in                       |   31 +++
 package/rsh-redone/rsh-redone.mk                   |   36 +++
 package/tcpdump/tcpdump-4.1.1-vfork.patch          |  128 +++++++++++
 package/whetstone/Config.in                        |    6 +
 package/whetstone/whetstone.mk                     |   37 +++
 package/xz/xz.mk                                   |    2 +-
 target/Config.in.arch                              |   32 +++-
 target/generic/Config.in                           |   19 ++-
 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch     |  238 ++++++++++++++++++++
 toolchain/gdb/Config.in                            |    7 +-
 toolchain/helpers.mk                               |   14 +-
 toolchain/toolchain-common.in                      |    7 +
 toolchain/toolchain-external/Config.in.2           |   11 +
 toolchain/toolchain-external/ext-tool.mk           |    6 +
 50 files changed, 1304 insertions(+), 111 deletions(-)
 create mode 100644 package/busybox/busybox-1.17.3/busybox-1.17.3-skip_strip.patch
 create mode 100644 package/dhrystone/Config.in
 create mode 100644 package/dhrystone/Makefile
 create mode 100644 package/dhrystone/dhrystone-2-HZ.patch
 create mode 100644 package/dhrystone/dhrystone-2-cmdline-nruns.patch
 create mode 100644 package/dhrystone/dhrystone-2-exit.patch
 create mode 100644 package/dhrystone/dhrystone-2-prototypes.patch
 create mode 100644 package/dhrystone/dhrystone.mk
 create mode 100644 package/irda-utils/Config.in
 create mode 100644 package/irda-utils/irda-utils-0.9.18-daemon.patch
 create mode 100644 package/irda-utils/irda-utils-0.9.18-nommu.patch
 create mode 100644 package/irda-utils/irda-utils-0.9.18-subdir.patch
 create mode 100644 package/irda-utils/irda-utils.mk
 create mode 100644 package/lsuio/Config.in
 create mode 100644 package/lsuio/lsuio.mk
 create mode 100644 package/m4/m4-1.4.15-uclibc-sched_param-def.patch
 create mode 100644 package/pax-utils/Config.in
 create mode 100644 package/pax-utils/pax-utils.mk
 create mode 100644 package/portmap/portmap-6.0-0001-README-fix-typo-in-tcp-wrapper-doc.patch
 create mode 100644 package/portmap/portmap-6.0-0002-NO_PIE-make-PIE-support-controllable.patch
 create mode 100644 package/portmap/portmap-6.0-0003-NO_FORK-control-usage-of-fork-for-nommu-systems.patch
 create mode 100644 package/portmap/portmap-6.0-0004-NO_PERROR-control-overriding-of-perror-symbol.patch
 create mode 100644 package/rsh-redone/Config.in
 create mode 100644 package/rsh-redone/rsh-redone.mk
 create mode 100644 package/tcpdump/tcpdump-4.1.1-vfork.patch
 create mode 100644 package/whetstone/Config.in
 create mode 100644 package/whetstone/whetstone.mk
 create mode 100644 toolchain/gdb/6.6/gdb-6.6-bfin-gdbserver.patch
