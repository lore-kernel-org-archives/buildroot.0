From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 00:14:24 +0200
Subject: [Buildroot] [RFCv1 0/8] musl C library support in internal backend
Message-ID: <1398291272-17591-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The following patches, at the RFC stage, add support for the musl C
library in the internal toolchain backend.

At this point, I'm mainly interested in having people:

 * Test the musl stuff, for various architectures, both build time and
   run time tests.

 * But also tests of your usual configuration (uClibc or glibc). The
   reason is that the musl supports requires gcc patches, and they can
   in some ways cause issues when building with other C libraries
   (I've already fixed a bunch of them, but more testing is welcome).

Thanks,

Thomas

Gustavo Zacarias (1):
  package/gcc: disable libsanitizer for uClibc and musl

Thomas Petazzoni (7):
  musl: new package
  gcc: add musl support patch for gcc 4.7.3
  gcc: add musl support patch to gcc 4.8.2
  gcc: musl patches only available for gcc 4.7+
  package: add support for musl in tuple
  busybox: allow build with musl
  toolchain-buildroot: add support for building musl toolchains

 package/Makefile.in                      |   2 +
 package/busybox/busybox.mk               |   9 +
 package/gcc/4.7.3/900-musl-support.patch | 638 ++++++++++++++++++++++++++
 package/gcc/4.8.2/900-musl-support.patch | 755 +++++++++++++++++++++++++++++++
 package/gcc/Config.in.host               |   8 +
 package/gcc/gcc.mk                       |   6 +
 package/musl/musl.mk                     |  72 +++
 toolchain/toolchain-buildroot/Config.in  |  10 +
 8 files changed, 1500 insertions(+)
 create mode 100644 package/gcc/4.7.3/900-musl-support.patch
 create mode 100644 package/gcc/4.8.2/900-musl-support.patch
 create mode 100644 package/musl/musl.mk

-- 
1.9.2
