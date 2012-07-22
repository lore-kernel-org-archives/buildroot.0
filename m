From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:28 +0200
Subject: [Buildroot] [PATCH 00/11] Misc. fixes for 2012.08 release
Message-ID: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series fixes miscellaneous bugs or minor enhancements.

Almost half of this series fixes host packages build issue, mostly due to
glibc update to version 2.16.

Regards,

---
Samuel Martin (11):
  libgpg-error: add optional nls support
  e2fsprogs: add staging install
  cleanup trailing white space
  elftosb: fix build forcing g++ compiler
  pkg-utils.mk: fix/clean indentation
  pkg-*targets.mk: factorize and fix $(PKG)_SRCDIR and $(PKG)_BUILDDIR
    declaration
  ext-tool.mk: add fancy messages
  libpng: fix host-libpng build on system on which zlib.h is missing.
  m4: fix build with glibc >=2.16
  tar: fix build with glibc >=2.16
  libecore: fix build with glibc >=2.16

 package/e2fsprogs/e2fsprogs.mk                     |   3 +
 ...re-ecore_exec-c-fix-build-with-glibc-2-16.patch |  62 +++++++++++++
 .../elftosb10.12.01-force_cxx_compiler.patch       | 100 +++++++++++++++++++++
 package/libgpg-error/Config.in                     |   2 +
 package/libgpg-error/libgpg-error.mk               |   7 ++
 ...ix-build-if-zlib-h-is-missing-on-the-host.patch |  47 ++++++++++
 package/libpng/libpng.mk                           |   2 +
 package/m4/m4-1.4.16-no-gets.patch                 |  38 ++++++++
 package/pkg-autotools.mk                           |  10 ---
 package/pkg-cmake.mk                               |   9 --
 package/pkg-generic.mk                             |  11 +++
 package/pkg-utils.mk                               |  41 ++++-----
 package/tar/tar-1.26-no-gets.patch                 |  47 ++++++++++
 target/Config.in.arch                              |   2 +-
 toolchain/toolchain-external/ext-tool.mk           |  11 ++-
 15 files changed, 345 insertions(+), 47 deletions(-)
 create mode 100644 package/efl/libecore/libecore-ecore_exec-c-fix-build-with-glibc-2-16.patch
 create mode 100644 package/elftosb/elftosb10.12.01-force_cxx_compiler.patch
 create mode 100644 package/libpng/libpng-fix-build-if-zlib-h-is-missing-on-the-host.patch
 create mode 100644 package/m4/m4-1.4.16-no-gets.patch
 create mode 100644 package/tar/tar-1.26-no-gets.patch

--
1.7.11.2
