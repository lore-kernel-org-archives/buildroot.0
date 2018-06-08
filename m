From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  8 Jun 2018 15:59:24 -0700
Subject: [Buildroot] [RFC PATCH 0/8] chromium: new package
Message-ID: <20180608225932.13127-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series creates a new package for the Chromium browser, as well as
its dependencies.

Included are additional packages for dependencies at-spi2-core and
at-spi2-atk, as well as version bumps for atk and llvm.

At the moment, supported target architectures include arm, aarch64, x86, and
x86_64. MIPS is possible with minor modifications.

Builds were generated for x86_64 and aarch64. The application was tested
on x86_64 with gtk3. Additional testing, especially on other
architectures, would be appreciated.

Best regards,
Joseph

Joseph Kogut (8):
  atk: bump to version 2.25.2
  at-spi2-core: new package
  at-spi2-atk: new package
  libgtk3: remove patch to disable atk-bridge support
  llvm: add config to build backend for host arch
  llvm: bump to version 6.0.0
  clang: bump to version 6.0.0
  chromium: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   3 +
 package/at-spi2-atk/Config.in                 |   5 +
 package/at-spi2-atk/at-spi2-atk.hash          |   4 +
 package/at-spi2-atk/at-spi2-atk.mk            |  17 +++
 package/at-spi2-core/Config.in                |   9 ++
 package/at-spi2-core/at-spi2-core.hash        |   4 +
 package/at-spi2-core/at-spi2-core.mk          |  46 +++++++
 package/atk/atk.hash                          |   4 +-
 package/atk/atk.mk                            |   4 +-
 package/chromium/Config.in                    |  43 ++++++
 package/chromium/chromium.hash                |   4 +
 package/chromium/chromium.mk                  | 125 ++++++++++++++++++
 package/chromium/toolchain/BUILD.gn           |  72 ++++++++++
 package/clang/clang.hash                      |   2 +-
 package/clang/clang.mk                        |   2 +-
 package/libgtk3/0003-disable-atk-bridge.patch |  45 -------
 package/libgtk3/Config.in                     |   1 +
 package/libgtk3/libgtk3.mk                    |   3 +-
 ...type-in-ORC-readMem-client-interface.patch |  37 ------
 package/llvm/Config.in                        |   9 ++
 package/llvm/llvm.hash                        |   2 +-
 package/llvm/llvm.mk                          |   7 +-
 23 files changed, 360 insertions(+), 91 deletions(-)
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
 delete mode 100644 package/llvm/0001-Fix-return-type-in-ORC-readMem-client-interface.patch

-- 
2.17.1
