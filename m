From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:05 +0200
Subject: [Buildroot] [PATCH v2 00/15] Fortran support for all toolchain
Message-ID: <20160701162920.19632-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This second round of the series integrate the work (and fixes ;-])
from Benjamin, plus few others fixes.

Regards,

Benjamin Kamath (2):
  package/Makefile.in: set TARGET_FCFLAGS variables
  package/lapack: new package

Samuel Martin (13):
  package/gcc: fix fortran support
  package/gcc: wrap gfortran
  package/Makefile.in: set variables for legacy f77 checks
  pkg-cmake.mk: export the fortran compiler path in the CMake toolchain
    file
  toolchain: add hidden symbol for fortran support in the toolchain
  package/gcc: select BR2_TOOLCHAIN_HAS_FORTRAN when appropriated
  package/gcc: used BR2_TOOLCHAIN_HAS_FORTRAN instead of
    BR2_TOOLCHAIN_BUILDROOT_FORTRAN
  toolchain/helpers: add fortran check
  toolchain/toolchain-external: enable fortran check when it is selected
  toolchain/toolchain-external: add libgfortran and libquadmath to the
    TOOLCHAIN_EXTERNAL_LIBS list
  toolchain/toolchain-external: add knob for fortran support
  toolchain/toolchain-external: update external toolchain configuration
    with BR2_TOOLCHAIN_HAS_FORTRAN
  package/fftw: add fortran support

 package/Config.in                                  |  1 +
 package/Makefile.in                                | 11 ++++++++++
 package/fftw/fftw.mk                               |  3 ++-
 package/gcc/Config.in.host                         |  5 +++++
 package/gcc/gcc-final/gcc-final.mk                 |  8 +++++--
 package/gcc/gcc.mk                                 |  9 +++++++-
 package/lapack/0001-case-sensitive-paths.patch     | 22 +++++++++++++++++++
 package/lapack/Config.in                           | 17 +++++++++++++++
 package/lapack/lapack.hash                         |  2 ++
 package/lapack/lapack.mk                           | 25 ++++++++++++++++++++++
 package/pkg-cmake.mk                               |  3 +++
 support/misc/toolchainfile.cmake.in                |  4 ++++
 toolchain/helpers.mk                               | 15 +++++++++++++
 toolchain/toolchain-common.in                      |  3 +++
 toolchain/toolchain-external/Config.in             | 17 +++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 13 +++++++++++
 16 files changed, 154 insertions(+), 4 deletions(-)
 create mode 100644 package/lapack/0001-case-sensitive-paths.patch
 create mode 100644 package/lapack/Config.in
 create mode 100644 package/lapack/lapack.hash
 create mode 100644 package/lapack/lapack.mk

--
2.9.0
