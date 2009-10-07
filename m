From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed,  7 Oct 2009 22:08:23 +0200
Subject: [Buildroot] [PATCH 00/14] misc cleanups
Message-ID: <cover.1254945750.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

A bunch of individual (separate) touch-ups.
They are only numbered so i can easily keep track.

I've split the arch selection improvements into 2 parts as requested by
Peter and at the end of the series, the _nofpu/_nommu suffix is dropped.

Peter, please apply or pull from my config-cleanup branch
TIA,
Bernhard

Bernhard Reutner-Fischer (14):
  allow menuconfig without a LINUX26_KCONFIG file
  Allow for specifying kernel version manually
  handle MMU configuration
  expand arch selection
  remove superfluous OPTIMIZE and DEBUG config knobs
  allow for testing gcc-4.5
  *-menuconfig needs dirs to exist
  remove BR2_FPU_SUFFIX
  tidy up ROOTFS_{PRE,SUF}FIX handling
  honour DISABLE_IPV6
  disable-locale implies turning off locale and iconv
  rsync: bump version
  enable config.cache per default
  libpcap, tcpdump: bump version and autotoolify

 Config.in                                          |  109 +---
 package/Makefile.autotools.in                      |    1 +
 package/Makefile.in                                |   52 +--
 package/busybox/busybox.mk                         |    2 +-
 package/libpcap/libpcap.mk                         |   92 +---
 package/libpcap/libpcap.patch                      |   13 -
 package/rsync/rsync.mk                             |    8 +-
 .../tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch   |   21 +
 package/tcpdump/tcpdump.mk                         |   77 +--
 target/Config.in.arch                              |  674 ++++++++++++++++++--
 target/linux/Makefile.in                           |   10 +-
 toolchain/Config.in.2                              |   12 +
 toolchain/gcc/Config.in                            |   12 +-
 toolchain/gcc/Makefile.in                          |    5 +
 toolchain/kernel-headers/Config.in                 |   13 +-
 toolchain/uClibc/uclibc.mk                         |    2 +-
 16 files changed, 719 insertions(+), 384 deletions(-)
 delete mode 100644 package/libpcap/libpcap.patch
 create mode 100644 package/tcpdump/tcpdump-4.0.0-100-disable-ipv6.patch
