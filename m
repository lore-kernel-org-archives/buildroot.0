From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:13 +0200
Subject: [Buildroot] [PATCH v2 0/9] autobuilder: static link CMake packages
	fixes
Message-ID: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a couple of aautobuild fixes concerning CMake-based packages,
in configuration in which BR2_PREFER_STATIC_LIB is set.

These fixes gives priority to patching the per-project CMake code in
order to keep using the standard CMake flag (BUILD_SHARED_LIBS) instead
of using the custom options.

Note that I'll post the patchs to each project.

Cheers,


Samuel Martin (9):
  package/cmake: add host-pkgconf as dependency
  package/yajl: add sequence number in patch names
  package/yajl: fix static link
  package/libplist: fix static link
  package/librtlsdr: fix static link
  package/musepack: add sequence number in patch names
  package/musepack: fix static link
  package/polarssl: fix static link
  package/taglib: fix static link

 package/cmake/cmake.mk                             |   2 +
 ...1-cmake-let-CMake-drives-the-library-type.patch |  37 ++++++++
 ...sure-the-libxml2-module-correctly-set-all.patch |  48 ++++++++++
 ...sure-the-libusb-module-correctly-set-all-.patch |  45 +++++++++
 ...le-rtlsdr_shared-library-target-in-BUILD_.patch | 104 +++++++++++++++++++++
 ...ack-shared.patch => musepack-0001-shared.patch} |   0
 ...he-standard-CMake-flag-to-drive-the-share.patch |  43 +++++++++
 ...he-standard-CMake-flag-to-drive-the-share.patch |  39 ++++++++
 package/polarssl/polarssl.mk                       |   2 -
 ...he-standard-CMake-flag-to-drive-the-share.patch |  40 ++++++++
 ...4-math-link.patch => yajl-0001-math-link.patch} |   0
 ...le-shared-library-build-when-BUILD_SHARED.patch |  44 +++++++++
 12 files changed, 402 insertions(+), 2 deletions(-)
 create mode 100644 package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
 create mode 100644 package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
 create mode 100644 package/librtlsdr/librtlsdr-0001-cmake-make-sure-the-libusb-module-correctly-set-all-.patch
 create mode 100644 package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch
 rename package/musepack/{musepack-shared.patch => musepack-0001-shared.patch} (100%)
 create mode 100644 package/musepack/musepack-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 create mode 100644 package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 create mode 100644 package/taglib/taglib-0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 rename package/yajl/{yajl-2.0.4-math-link.patch => yajl-0001-math-link.patch} (100%)
 create mode 100644 package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

--
2.1.0
