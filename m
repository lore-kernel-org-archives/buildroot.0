From: Chris Zankel <chris@zankel.net>
Date: Wed, 07 Nov 2012 19:38:14 -0800
Subject: [Buildroot] [PATCH 0/2] add support for xtensa back to buildroot
Message-ID: <509b2928.67dc440a.70c6.6325@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It would be great if you could add support for Xtensa back to buildroot.
I understand that it was removed because it required a lot of additional
files and special handling, which became obsolete and hard to maintain
over time.
These two patches are much more aligned with other architectures with only
very minimal overhead. I also just recently updated uClibc and can build
buildroot out of the box, so we can now better support and maintain it.

Thanks,
-Chris

----------------------------------------------------------------
Chris Zankel (2):
      xtensa: add support for the Xtensa architecture
      xtensa: support configurable processor configurations

 arch/Config.in                  |    8 ++++++++
 arch/Config.in.common           |    1 +
 arch/Config.in.xtensa           |   30 ++++++++++++++++++++++++++++++
 linux/Config.in                 |    3 ++-
 package/autoconf/Config.in      |    6 ++++--
 package/automake/Config.in      |    6 ++++--
 package/binutils/binutils.mk    |    9 +++++++++
 package/ltrace/Config.in        |    1 +
 package/perl/Config.in          |    4 +++-
 toolchain/gcc/gcc-uclibc-4.x.mk |    4 ++++
 toolchain/gdb/gdb.mk            |    4 ++++
 toolchain/toolchain-common.in   |    2 +-
 toolchain/uClibc/uclibc.mk      |    1 +
 13 files changed, 72 insertions(+), 7 deletions(-)
 create mode 100644 arch/Config.in.xtensa
