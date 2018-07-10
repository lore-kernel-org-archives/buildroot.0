From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 10 Jul 2018 16:42:08 -0700
Subject: [Buildroot] [PATCH v6 0/4] chromium: new package
Message-ID: <20180710234212.4297-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v5:
- chromium: config cleanups
- chromium: fix build issues caused by disabled sysroot
- chromium: make cups dependency optional
- chromium: make proprietary codecs optional
- chromium: make pciutils dependency optional
- chromium: make dbus dependency optional

Changes since v4:
- at-spi2-{core,atk}: rework dependencies
- libgtk3: make atk-bridge an optional dependency
- at-spi2-core: convert to meson-package infrastructure
- chromium: define BR2_PACKAGE_CHROMIUM_ARCH_SUPPORTS
- chromium: add host gcc >= 4.9.0 to depends
- lld: convert to host-only package
- fix check-package issues

Changes since v3:
- llvm: add separate TARGETS_TO_BUILD for host only
- chromium: add upstream patch to fix ARM build w/ glibc 2.27
- chromium: disabled v8 snapshotting until the toolchain can be figured out
- chromium: add missing dependencies when use_gtk3=false
- chromium: check-package fixes

Changes since v2:
- patch chromium toolchain config for buildroot

Changes since v1:
- fix some cross compilation issues
- chromium: bump version to 67.0.3396.79
- atk: bump version to 2.28.1
- lld: new package
- chromium: use lld for linking
- minor tweaks to variable naming and quotes

Joseph Kogut (4):
  libgtk3: convert atk-bridge to optional dependency
  llvm: add config to build backend for host arch
  lld: new package
  chromium: new package

 DEVELOPERS                                    |   2 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   2 +
 ...iler_cpu_abi-for-buildroot-toolchain.patch | 102 ++++++++++++
 .../0002-Fix-arm-build-with-glibc-2.27.patch  |  28 ++++
 package/chromium/Config.in                    |  64 ++++++++
 package/chromium/chromium.hash                |   3 +
 package/chromium/chromium.mk                  | 146 ++++++++++++++++++
 package/chromium/toolchain/BUILD.gn           |  71 +++++++++
 ...3-convert-atk-bridge-to-optional-dep.patch |  76 +++++++++
 package/libgtk3/0003-disable-atk-bridge.patch |  45 ------
 package/libgtk3/libgtk3.mk                    |   4 +
 package/lld/Config.in.host                    |  16 ++
 package/lld/lld.hash                          |   3 +
 package/lld/lld.mk                            |  15 ++
 package/llvm/Config.in.host                   |  18 +++
 package/llvm/llvm.mk                          |   9 +-
 17 files changed, 559 insertions(+), 46 deletions(-)
 create mode 100644 package/chromium/0001-modify-compiler_cpu_abi-for-buildroot-toolchain.patch
 create mode 100644 package/chromium/0002-Fix-arm-build-with-glibc-2.27.patch
 create mode 100644 package/chromium/Config.in
 create mode 100644 package/chromium/chromium.hash
 create mode 100644 package/chromium/chromium.mk
 create mode 100644 package/chromium/toolchain/BUILD.gn
 create mode 100644 package/libgtk3/0003-convert-atk-bridge-to-optional-dep.patch
 delete mode 100644 package/libgtk3/0003-disable-atk-bridge.patch
 create mode 100644 package/lld/Config.in.host
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk
 create mode 100644 package/llvm/Config.in.host

-- 
2.18.0
