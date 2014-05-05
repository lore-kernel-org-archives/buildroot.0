From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 May 2014 23:17:00 +0200
Subject: [Buildroot] [PATCHv2 00/10] musl support,
	internal and external backends
Message-ID: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series does two things:

 * Adds the musl support in the internal toolchain backend.

 * Adds a set of pre-built musl toolchains to the external toolchain
   backend.

Compared to v1:

 * The issue of the symbolic link for the dynamic linker noticed by
   Peter is fixed. In fact, the musl Makefile can create this symbolic
   link perfectly fine if we are in the good conditions.

 * A patch for musl support in gcc 4.9.0 has been added.

 * The patch for musl external toolchains has been added, and after
   the suggestion from Arnout, a single Kconfig option is now used
   instead of one per architecture.

I've built and boot tested under Qemu ARM/musl/gcc4.8 and
i386/musl/gcc4.9.

Thanks,

Thomas

Thomas Petazzoni (10):
  musl: new package
  gcc: add musl support patch for gcc 4.7.3
  gcc: add musl support patch to gcc 4.8.2
  gcc: add musl support patch to gcc 4.9.0
  gcc: musl patches only available for gcc 4.7+
  package: add support for musl in tuple
  busybox: allow build with musl
  toolchain-buildroot: add support for building musl toolchains
  gcc: disable libsanitizer for musl
  toolchain-external: add publicly available musl toolchains

 package/Makefile.in                                |   2 +
 package/busybox/busybox.mk                         |   9 +
 package/gcc/4.7.3/900-musl-support.patch           | 638 +++++++++++++++++
 package/gcc/4.8.2/900-musl-support.patch           | 755 +++++++++++++++++++++
 package/gcc/4.9.0/900-musl-support.patch           | 710 +++++++++++++++++++
 package/gcc/Config.in.host                         |   8 +
 package/gcc/gcc.mk                                 |   5 +-
 package/musl/musl.mk                               |  73 ++
 toolchain/toolchain-buildroot/Config.in            |  10 +
 toolchain/toolchain-external/Config.in             |  30 +
 toolchain/toolchain-external/toolchain-external.mk |  27 +
 11 files changed, 2265 insertions(+), 2 deletions(-)
 create mode 100644 package/gcc/4.7.3/900-musl-support.patch
 create mode 100644 package/gcc/4.8.2/900-musl-support.patch
 create mode 100644 package/gcc/4.9.0/900-musl-support.patch
 create mode 100644 package/musl/musl.mk

-- 
1.9.2
