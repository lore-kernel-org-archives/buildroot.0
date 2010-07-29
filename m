From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jul 2010 23:48:43 +0200
Subject: [Buildroot] [pull request] Pull request for branch fixes-20100729
Message-ID: <cover.1280440124.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 7bfc9e464cf448f83b06953f1b26a150539b3960:
  Gustavo Zacarias (1):
        netsnmp: depend on openssl when the package is on to ensure build order

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot fixes-20100729

Thomas Petazzoni (19):
      dependencies: add svn as a mandatory tool
      oprofile: disable with external toolchain
      Fix computation of REAL_GNU_TARGET_NAME
      gdb: disallow GDB_HOST on external toolchain builds
      xerces: fix dependency on iconv
      libiconv: add an error when both libiconv and locale are enabled
      libeXosip: add dependency on host-pkg-config and remove useless flags
      cdrkit: fix TARGET_CC/TARGET_CFLAGS for CMake
      dmalloc: pass -fPIC when compiling
      speech-tools: fix build failure by using Debian version and patches
      avahi: pkg-config is needed
      samba: remove swat documentation when not needed
      u-boot: fix custom patch handling
      linux: more mistake detection
      cairo: PDF support is needed when SVG support is enabled
      toolchain: mark uClibc 0.9.31 + locale + C++ as broken
      libcurl: bump version to fix build issue
      xerces: fix download location
      xerces: only add -liconv when locale are disabled

 boot/u-boot/u-boot.mk                              |    2 +-
 linux/linux.mk                                     |   13 ++++
 package/Makefile.in                                |   11 +++-
 package/avahi/avahi.mk                             |    2 +-
 package/cairo/Config.in                            |    1 +
 package/cdrkit/cdrkit.mk                           |   14 ++++-
 package/dmalloc/dmalloc-5.4.3-add-fpic.patch       |   60 ++++++++++++++++++++
 .../libcurl-7.19.2-fix-ssl-no-verbose.patch        |   25 --------
 package/libcurl/libcurl.mk                         |    3 +-
 package/libeXosip2/libeXosip2.mk                   |    4 +-
 package/libiconv/libiconv.mk                       |    7 ++
 .../festival/speech-tools/speech-tools.mk          |   17 +++++-
 package/oprofile/Config.in                         |    4 +
 package/samba/samba.mk                             |   11 ++++
 package/xerces/Config.in                           |    2 +-
 package/xerces/xerces.mk                           |   10 ++-
 toolchain/dependencies/dependencies.sh             |    4 +-
 toolchain/gdb/Config.in                            |    3 +
 toolchain/toolchain-common.in                      |    4 +
 19 files changed, 154 insertions(+), 43 deletions(-)
 create mode 100644 package/dmalloc/dmalloc-5.4.3-add-fpic.patch
 delete mode 100644 package/libcurl/libcurl-7.19.2-fix-ssl-no-verbose.patch

Thanks,
-- 
Thomas Petazzoni
