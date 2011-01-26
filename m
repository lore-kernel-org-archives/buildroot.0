From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 26 Jan 2011 22:18:41 +0100
Subject: [Buildroot] [PATCH v3 0/4] Introducing CMAKETARGETS infrastructure
Message-ID: <1296076725-25194-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a new infrastructure for CMake packages called
CMAKETARGETS. It is based on the AUTOTARGETS infrastructure.

Changes in v3:

* Fix host-cdrkit build failure (thanks Thomas)
* Set PKG_CONFIG_SYSROOT_DIR in toolchain file
* CMAKE_INSTALL_PREFIX + DESTDIR modification for host packages
* Properly escape CMAKE_C/CXX_FLAGS when writing the toolchain file (so that
  the variables are not expanded immediately). Without this, flags set in
  package.mk would be ignored.
* Disable ccache as it seems to break CMake compiler detection.

Bj?rn Forsman (4):
  Makefile: generate CMake toolchain-file in $(O)
  Add CMAKETARGETS infrastructure for CMake packages
  doc: add CMAKETARGETS documentation
  cdrkit: convert to CMAKETARGETS infrastructure

 Makefile                  |   17 ++++-
 docs/buildroot.html       |  151 +++++++++++++++++++++++++++++++++-
 package/Makefile.cmake.in |  197 +++++++++++++++++++++++++++++++++++++++++++++
 package/Makefile.in       |    9 ++
 package/cdrkit/cdrkit.mk  |   66 ++-------------
 5 files changed, 378 insertions(+), 62 deletions(-)
 create mode 100644 package/Makefile.cmake.in
