From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 10 Sep 2020 19:41:40 +0200
Subject: [Buildroot] [PATCH 0/3] IBM s390x and Z architecture support
Message-ID: <20200910174143.311039-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patches adds support for IBM s390x and Z architectures
to buildroot.

Alexander Egorenkov (3):
  support/gnuconfig/config.sub: bump to version 2020-06-28
  arch: new architecture IBM s390x
  package/s390-tools: new package

 DEVELOPERS                              |   4 +
 Makefile                                |   1 +
 arch/Config.in                          |  13 +
 arch/Config.in.s390x                    |  35 ++
 board/qemu/s390x/linux.config           |  35 ++
 board/qemu/s390x/post-build.sh          |  11 +
 board/qemu/s390x/readme.txt             |   6 +
 configs/qemu_s390x_defconfig            |  11 +
 linux/Config.in                         |   2 +-
 package/Config.in                       |   1 +
 package/cmake/Config.in                 |   3 +-
 package/gcc/gcc.mk                      |   5 +
 package/go/Config.in.host               |   2 +-
 package/kexec/Config.in                 |   2 +-
 package/liburcu/Config.in               |   2 +-
 package/makedumpfile/Config.in          |   2 +-
 package/s390-tools/Config.in            |  20 +
 package/s390-tools/s390-tools.hash      |   3 +
 package/s390-tools/s390-tools.mk        |  80 ++++
 package/systemd/Config.in               |   1 +
 support/gnuconfig/config.sub            | 579 +++++++++++++-----------
 toolchain/toolchain-buildroot/Config.in |   6 +-
 22 files changed, 553 insertions(+), 271 deletions(-)
 create mode 100644 arch/Config.in.s390x
 create mode 100644 board/qemu/s390x/linux.config
 create mode 100755 board/qemu/s390x/post-build.sh
 create mode 100644 board/qemu/s390x/readme.txt
 create mode 100644 configs/qemu_s390x_defconfig
 create mode 100644 package/s390-tools/Config.in
 create mode 100644 package/s390-tools/s390-tools.hash
 create mode 100644 package/s390-tools/s390-tools.mk

-- 
2.26.2
