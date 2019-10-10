From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 10 Oct 2019 17:58:55 +0100
Subject: [Buildroot] [RFC PATCH v1 00/25] Add Chromium Embedded Framework
 library
Message-ID: <20191010165920.72050-1-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here's a work in progress first attempt at adding libcef to buildroot.

We're still working on:

- Testing integration with dependant packages.
- Cross compiling.
- Tidying up gn build options.

We'd appreciate any feedback!

Many thanks,

Michael


Joseph Kogut (2):
  llvm: add config to build backend for host arch
  lld: new package

Matt Weber (4):
  package/llvm: install target binary/debug tools
  package/llvm/clang: note about version bumping dep
  package/llvm: disable libxml2
  package/compiler-rt: new package

Michael Drake (16):
  package/libkrb5: Add host tools package.
  package/libpangox: new package
  package/libgtkglext: new package
  package/webp: Enable host package build.
  package/libcef: New package
  package/alsa-lib/alsa-lib: Add host package.
  package/ffmpeg: Add host package.
  package/libvpx: Add host package.
  package/x11r7/xcb-util: Add host package.
  package/x11r7/xlib_libXScrnSaver: Add host package.
  package/x11r7/xlib_libXcomposite: Add host package.
  package/x11r7/xlib_libXext: Add host package.
  package/x11r7/xlib_libXi: Add host package.
  package/x11r7/xlib_libXrandr: Add host package.
  package/x11r7/xlib_libXtst: Add host package.
  package/libcef: Add v8 Snapshot option.

Thomas Preston (3):
  pkgconf: Split pkgconf command into multi-line
  pkgconf: Add pkgconf system lib and include path
  jpeg-turbo: Add host install

 DEVELOPERS                                    |    2 +
 package/Config.in                             |    4 +
 package/Config.in.host                        |    2 +
 package/alsa-lib/alsa-lib.mk                  |    1 +
 package/clang/clang.mk                        |    1 +
 package/compiler-rt/Config.in                 |   14 +
 package/compiler-rt/compiler-rt.hash          |    2 +
 package/compiler-rt/compiler-rt.mk            |   36 +
 package/ffmpeg/ffmpeg.mk                      |   61 +
 package/jpeg-turbo/jpeg-turbo.mk              |    1 +
 .../0001-use-buildroot-toolchains.patch       |   88 ++
 .../0002-fix-one-euro-filter-build.patch      |   33 +
 .../0003-link-against-harfbuzz-subset.patch   |   50 +
 package/libcef/Config.in                      |  117 ++
 package/libcef/include/cef_version.h          |   81 ++
 package/libcef/libcef.license-files.inc       | 1130 +++++++++++++++++
 package/libcef/libcef.mk                      |  395 ++++++
 .../libcef/scripts/gather-license-files.sh    |   53 +
 package/libcef/scripts/version.sh             |   48 +
 package/libcef/templates/cef_version.h        |   70 +
 package/libcef/toolchain/BUILD.gn             |   70 +
 package/libgtkglext/Config.in                 |   18 +
 package/libgtkglext/libgtkglext.mk            |   29 +
 package/libkrb5/libkrb5.mk                    |    1 +
 package/libpangox/Config.in                   |   14 +
 package/libpangox/libpangox.mk                |   12 +
 package/libvpx/libvpx.mk                      |   29 +
 package/lld/Config.in.host                    |   16 +
 package/lld/lld.hash                          |    2 +
 package/lld/lld.mk                            |   15 +
 package/llvm/Config.in.host                   |   18 +
 package/llvm/llvm.mk                          |   26 +-
 package/pkgconf/pkg-config.in                 |    9 +-
 package/webp/webp.mk                          |    5 +
 package/x11r7/xcb-util/xcb-util.mk            |    2 +
 .../xlib_libXScrnSaver/xlib_libXScrnSaver.mk  |    2 +
 .../xlib_libXcomposite/xlib_libXcomposite.mk  |    2 +
 package/x11r7/xlib_libXext/xlib_libXext.mk    |    2 +
 package/x11r7/xlib_libXi/xlib_libXi.mk        |    7 +
 .../x11r7/xlib_libXrandr/xlib_libXrandr.mk    |    2 +
 package/x11r7/xlib_libXtst/xlib_libXtst.mk    |    7 +
 41 files changed, 2474 insertions(+), 3 deletions(-)
 create mode 100644 package/compiler-rt/Config.in
 create mode 100644 package/compiler-rt/compiler-rt.hash
 create mode 100644 package/compiler-rt/compiler-rt.mk
 create mode 100644 package/libcef/0001-use-buildroot-toolchains.patch
 create mode 100644 package/libcef/0002-fix-one-euro-filter-build.patch
 create mode 100644 package/libcef/0003-link-against-harfbuzz-subset.patch
 create mode 100644 package/libcef/Config.in
 create mode 100644 package/libcef/include/cef_version.h
 create mode 100644 package/libcef/libcef.license-files.inc
 create mode 100644 package/libcef/libcef.mk
 create mode 100755 package/libcef/scripts/gather-license-files.sh
 create mode 100755 package/libcef/scripts/version.sh
 create mode 100644 package/libcef/templates/cef_version.h
 create mode 100644 package/libcef/toolchain/BUILD.gn
 create mode 100644 package/libgtkglext/Config.in
 create mode 100644 package/libgtkglext/libgtkglext.mk
 create mode 100644 package/libpangox/Config.in
 create mode 100644 package/libpangox/libpangox.mk
 create mode 100644 package/lld/Config.in.host
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk
 create mode 100644 package/llvm/Config.in.host

-- 
2.20.1
