From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:24 +0200
Subject: [Buildroot] [PATCH 0/7] RFC: ARC port
Message-ID: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi BuildRoot developers,

In the following patch series I've added ARC support to the "master" tree
of BuildRoot. As ARC support is not yet in all upstream open source packages,
I've taken the freedom to add an option for an additional download site, from
which ARC-specific versions of gcc, binutils, etc. can be downloaded.

ARC will be in Linux 3.9, so that would be the first package that can be
removed from this ARC-specific download site.

The below patchset builds the toolchain, and a working root file system. Most
simple packages build OK, but mplayer for instance does not have ARC support,
and there are probably others as well.

Could you please have a look at the patches and let me know what to do to
make them BuildRoot-worthy?

Thanks,

Mischa

Mischa Jonker (7):
  arc: Add ARC and ARC BE architecture
  arc: Add option for ARC-specific download site
  arc: Add support for ARC-specific binutils
  arc: Add ARC specific kernel headers
  arc: Add support for ARC-specific GCC
  arc: Add support for ARC-specific uClibc
  arc: Make sure that libgcc doesn't get included when it doesn't exist
    yet

 Config.in                                          |    9 +
 Makefile                                           |    1 +
 arch/Config.in                                     |   18 ++
 arch/Config.in.arc                                 |   10 +
 package/binutils/Config.in.host                    |   17 +-
 .../300-001_ld_makefile_patch.patch                |   24 ++
 .../300-012_check_ldrunpath_length.patch           |   21 ++
 .../binutils/binutils-2.19-arc/500-sysroot.patch   |   36 +++
 package/binutils/binutils.mk                       |    3 +
 support/gnuconfig/config.sub                       |    4 +-
 toolchain/Config.in                                |    3 +-
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   22 ++
 toolchain/gcc/Config.in                            |   22 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    4 +
 toolchain/kernel-headers/Config.in                 |   19 +-
 toolchain/kernel-headers/kernel-headers.mk         |    4 +-
 toolchain/uClibc/Config.in                         |   12 +-
 toolchain/uClibc/uClibc-0.9.33-arc.config          |  251 ++++++++++++++++++++
 toolchain/uClibc/uclibc.mk                         |   14 +-
 19 files changed, 466 insertions(+), 28 deletions(-)
 create mode 100644 arch/Config.in.arc
 create mode 100644 package/binutils/binutils-2.19-arc/300-001_ld_makefile_patch.patch
 create mode 100644 package/binutils/binutils-2.19-arc/300-012_check_ldrunpath_length.patch
 create mode 100644 package/binutils/binutils-2.19-arc/500-sysroot.patch
 create mode 100644 toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.33-arc.config
