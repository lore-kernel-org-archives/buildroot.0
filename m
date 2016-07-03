From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jul 2016 15:47:36 +0200
Subject: [Buildroot] [PATCH v3 00/14] Fortran support for all toolchains
Message-ID: <20160703134750.7516-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This third round of the series includes:
* refactoring of the libquadmath handling (which is a dependency of fortran on
  some architecture);
* fixes from last review.

Note that all patches fixing the infrastructures but the last patch (adding
lapack package) of this are ready.
I'm still investigating a CMake on mis-behavior on the lapack package (causing
build failure unrelated to this rest of this sereis).

Regards,

Benjamin Kamath (1):
  package/lapack: new package

Samuel Martin (13):
  toolchain/toolchain-common.in: add BR2_TOOLCHAIN_HAS_LIBQUADMATH
    hidden symbol
  package/gcc: complete the logic on libquadmath
  package/gcc: fix fortran support
  toolchain: add hidden symbol for fortran support in the toolchain
  docs/manual: document dependency on fortran
  package/gcc: select BR2_TOOLCHAIN_HAS_FORTRAN when appropriate
  pkg-cmake.mk: export the fortran compiler path in the CMake toolchain
    file
  toolchain/helpers: add fortran check
  toolchain/toolchain-external: enable fortran check when it is selected
  toolchain/toolchain-external: add libgfortran and libquadmath to the
    TOOLCHAIN_EXTERNAL_LIBS list
  toolchain/toolchain-external: add knob for fortran support
  toolchain/toolchain-external: update external toolchain configuration
    with BR2_TOOLCHAIN_HAS_FORTRAN
  package/fftw: add fortran support

 docs/manual/adding-packages-directory.txt          |  4 ++++
 package/Config.in                                  |  1 +
 package/fftw/fftw.mk                               |  3 ++-
 package/gcc/Config.in.host                         |  8 +++++++
 package/gcc/gcc-final/gcc-final.mk                 |  4 ++++
 package/gcc/gcc.mk                                 |  4 +++-
 package/lapack/0001-case-sensitive-paths.patch     | 22 +++++++++++++++++++
 package/lapack/Config.in                           | 20 +++++++++++++++++
 package/lapack/lapack.hash                         |  2 ++
 package/lapack/lapack.mk                           | 25 ++++++++++++++++++++++
 package/pkg-cmake.mk                               |  3 +++
 support/misc/toolchainfile.cmake.in                |  4 ++++
 toolchain/helpers.mk                               | 18 ++++++++++++++++
 toolchain/toolchain-common.in                      | 13 +++++++++++
 toolchain/toolchain-external/Config.in             | 14 ++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 13 ++++++++++-
 16 files changed, 155 insertions(+), 3 deletions(-)
 create mode 100644 package/lapack/0001-case-sensitive-paths.patch
 create mode 100644 package/lapack/Config.in
 create mode 100644 package/lapack/lapack.hash
 create mode 100644 package/lapack/lapack.mk

--
2.9.0
