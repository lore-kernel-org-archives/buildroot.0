From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:12 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	for-2012.05/misc-cleanups
Message-ID: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 2f41adabc5a12fcca1de5b6c296c2206b518abff:

  New package: libdmtx (2012-04-17 00:21:39 +0200)

are available in the git repository at:
  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git for-2012.05/misc-cleanups

Thomas Petazzoni (22):
      Remove the DATE variable
      Remove cc-option: not used anywhere
      Remove filename extension crap for OS compatibility
      kconfig: do not use HOST_LOADLIBES anymore
      Rename Makefile.autotools.in to pkg-autotargets.mk
      Rename Makefile.cmake.in to pkg-cmaketargets.mk
      Split Makefile.package.in in pkg-download.mk, pkg-utils.mk and pkg-gentargets.mk
      pkg-*.mk: add some comments, update some existing comments
      Remove unused .fakeroot.* mechanism
      Move the manual build infrastructure to docs/manual/manual.mk
      cmake: move creation of toolchain file to package/pkg-cmaketargets.mk
      package: remove unused STRIP_DISCARD_ALL variable
      Remove unused GNU_TARGET_SUFFIX
      toolchain: remove useless indirect variables
      gcc: remove unused EXTRA_GCC2_CONFIG_OPTIONS
      gcc: remove unused EXTRA_GCC4_CONFIG_OPTIONS
      gcc: remove unused ARCH_FPU_SUFFIX
      gcc: move version/snap variables to gcc-uclibc-4.x.mk
      toolchain: remove toolchain/Makefile.in and toolchain/gcc/Makefile.in
      gcc: remove unused EXTRA_GCC1_CONFIG_OPTIONS
      mklibs: remove support
      xtensa: remove support for this architecture

 Makefile                                           |  117 +---
 boot/uboot/uboot.mk                                |    1 -
 docs/manual/manual.mk                              |   48 ++
 fs/common.mk                                       |    2 -
 fs/iso9660/iso9660.mk                              |    2 -
 linux/Config.in                                    |    2 +-
 package/Makefile.in                                |   12 +-
 package/Makefile.package.in                        |  750 --------------------
 package/binutils/binutils.mk                       |    2 +-
 package/ltrace/Config.in                           |    2 +-
 .../{Makefile.autotools.in => pkg-autotargets.mk}  |    4 +-
 package/{Makefile.cmake.in => pkg-cmaketargets.mk} |   22 +
 package/pkg-download.mk                            |  228 ++++++
 package/pkg-gentargets.mk                          |  456 ++++++++++++
 package/pkg-utils.mk                               |   85 +++
 support/kconfig/Makefile.br                        |    4 +-
 support/kconfig/patches/10-br-build-system.patch   |   12 +-
 target/Config.in.arch                              |   40 -
 target/device/xtensa/device_table.txt              |  189 -----
 target/xtensa/.gitignore                           |    1 -
 target/xtensa/Makefile.in                          |    1 -
 target/xtensa/defconfig                            |  129 ----
 target/xtensa/patch.in                             |   33 -
 target/xtensa/setup-config                         |   57 --
 target/xtensa/uClibc-0.9.30.config                 |  245 -------
 target/xtensa/uClibc.config                        |  190 -----
 target/xtensa/xt-buildroot-overlay-install         |  488 -------------
 toolchain/Makefile.in                              |    6 -
 toolchain/gcc/Makefile.in                          |   70 --
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   87 ++-
 toolchain/gdb/gdb.mk                               |    5 -
 toolchain/mklibs/Config.in                         |    6 -
 toolchain/mklibs/mklibs.mk                         |   49 --
 toolchain/mklibs/mklibs.py                         |  597 ----------------
 toolchain/toolchain-buildroot.mk                   |    1 -
 toolchain/toolchain-buildroot/Config.in.2          |    1 -
 toolchain/toolchain-common.in                      |    2 +-
 toolchain/toolchain-crosstool-ng.mk                |    1 -
 toolchain/toolchain-external.mk                    |    1 -
 39 files changed, 935 insertions(+), 3013 deletions(-)
 create mode 100644 docs/manual/manual.mk
 delete mode 100644 package/Makefile.package.in
 rename package/{Makefile.autotools.in => pkg-autotargets.mk} (98%)
 rename package/{Makefile.cmake.in => pkg-cmaketargets.mk} (86%)
 create mode 100644 package/pkg-download.mk
 create mode 100644 package/pkg-gentargets.mk
 create mode 100644 package/pkg-utils.mk
 delete mode 100644 target/device/xtensa/device_table.txt
 delete mode 100644 target/xtensa/.gitignore
 delete mode 100644 target/xtensa/Makefile.in
 delete mode 100644 target/xtensa/defconfig
 delete mode 100644 target/xtensa/patch.in
 delete mode 100644 target/xtensa/setup-config
 delete mode 100644 target/xtensa/uClibc-0.9.30.config
 delete mode 100644 target/xtensa/uClibc.config
 delete mode 100644 target/xtensa/xt-buildroot-overlay-install
 delete mode 100644 toolchain/Makefile.in
 delete mode 100644 toolchain/gcc/Makefile.in
 delete mode 100644 toolchain/mklibs/Config.in
 delete mode 100644 toolchain/mklibs/mklibs.mk
 delete mode 100644 toolchain/mklibs/mklibs.py

Thanks,
-- 
Thomas Petazzoni
