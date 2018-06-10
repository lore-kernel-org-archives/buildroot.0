From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sun, 10 Jun 2018 13:54:08 -0700
Subject: [Buildroot] [RFC PATCH v2 0/9] chromium: new package
In-Reply-To: <20180610204449.13646-1-joseph.kogut@gmail.com>
References: <20180610204449.13646-1-joseph.kogut@gmail.com>
Message-ID: <20180610205417.13963-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since v2:
- patch chromium toolchain config for buildroot

Changes since v1:
- fix some cross compilation issues
- chromium: bump version to 67.0.3396.79
- atk: bump version to 2.28.1
- lld: new package
- chromium: use lld for linking
- minor tweaks to variable naming and quotes


Joseph Kogut (9):
  atk: bump to version 2.25.2
  at-spi2-core: new package
  at-spi2-atk: new package
  libgtk3: remove patch to disable atk-bridge support
  llvm: add config to build backend for host arch
  llvm: bump to version 6.0.0
  clang: bump to version 6.0.0
  lld: new package
  chromium: new package

 DEVELOPERS                                    |   4 +
 package/Config.in                             |   4 +
 package/at-spi2-atk/Config.in                 |   5 +
 package/at-spi2-atk/at-spi2-atk.hash          |   4 +
 package/at-spi2-atk/at-spi2-atk.mk            |  17 +++
 package/at-spi2-core/Config.in                |   9 ++
 package/at-spi2-core/at-spi2-core.hash        |   4 +
 package/at-spi2-core/at-spi2-core.mk          |  46 ++++++
 package/atk/atk.hash                          |   4 +-
 package/atk/atk.mk                            |   4 +-
 package/chromium/Config.in                    |  44 ++++++
 package/chromium/chromium.hash                |   4 +
 package/chromium/chromium.mk                  | 139 ++++++++++++++++++
 package/chromium/toolchain/BUILD.gn           |  71 +++++++++
 package/clang/clang.hash                      |   2 +-
 package/clang/clang.mk                        |   2 +-
 package/libgtk3/0003-disable-atk-bridge.patch |  45 ------
 package/libgtk3/Config.in                     |   1 +
 package/libgtk3/libgtk3.mk                    |   3 +-
 package/lld/Config.in                         |   3 +
 package/lld/lld.hash                          |   3 +
 package/lld/lld.mk                            |  19 +++
 ...type-in-ORC-readMem-client-interface.patch |  37 -----
 package/llvm/Config.in                        |   9 ++
 package/llvm/llvm.hash                        |   2 +-
 package/llvm/llvm.mk                          |   7 +-
 26 files changed, 401 insertions(+), 91 deletions(-)
 create mode 100644 package/at-spi2-atk/Config.in
 create mode 100644 package/at-spi2-atk/at-spi2-atk.hash
 create mode 100644 package/at-spi2-atk/at-spi2-atk.mk
 create mode 100644 package/at-spi2-core/Config.in
 create mode 100644 package/at-spi2-core/at-spi2-core.hash
 create mode 100644 package/at-spi2-core/at-spi2-core.mk
 create mode 100644 package/chromium/Config.in
 create mode 100644 package/chromium/chromium.hash
 create mode 100644 package/chromium/chromium.mk
 create mode 100644 package/chromium/toolchain/BUILD.gn
 delete mode 100644 package/libgtk3/0003-disable-atk-bridge.patch
 create mode 100644 package/lld/Config.in
 create mode 100644 package/lld/lld.hash
 create mode 100644 package/lld/lld.mk
 delete mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch

-- 
2.17.1
