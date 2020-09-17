From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:50 +0200
Subject: [Buildroot] [PATCH v4 00/12] IBM s390x and Z architecture support
Message-ID: <20200917040802.846896-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patches adds support for IBM s390x and Z architectures
to buildroot.

v3 -> v4:
  * Addressed all review findings by Romain Naour
  * package/qemu
    - Added s390x support for host
  * qemu s390x board
    - Cleaned up defconfig
    - Enabled host qemu

v2 -> v3:
  * Addressed all review findings by Romain Naour
  * qemu s390x board
    - Linux kernel needs host OpenSSL
  * makedumpfile
    - Cosmetic improvement of dependencies
  * s390-tools
    - Clean up redundant dependencies which are brought in
      already by glibc

v1 -> v2:
  * Addressed all review findings by Yann E. Morin
  * Split up into smaller patches to ease further review process
  * qemu s390x board
    - Clean up of qemu_s390x_defconfig
    - Use fixed Linux kernel version
    - Use in-tree Linux kernel config
    - Add defconfig comment to readme.txt for CI testing
  * s390-tools package
    - Improve Makefile
    - Add dependency on C++ toolchain (due to libvmdump)
    - uClibc-ng is not supported

Alexander Egorenkov (12):
  arch: add the basic IBM s390x and Z arch support
  toolchain: add support for the internal IBM s390x and Z toolchain
  linux: add bzImage support for IBM s390x and Z arch
  package/qemu: add IBM s390x and Z arch support
  board/qemu: add IBM s390x and Z arch support
  package/systemd: add support for IBM s390x and Z arch
  package/cmake: add support for IBM s390x and Z arch
  package/liburcu: add support for IBM s390x and Z arch
  package/kexec: add support for IBM s390x and Z arch
  package/go: add support for IBM s390x and Z arch
  package/makedumpfile: add support for IBM s390x and Z arch
  package/s390-tools: new package

 DEVELOPERS                              |  6 ++
 Makefile                                |  1 +
 arch/Config.in                          | 13 ++++
 arch/Config.in.s390x                    | 34 +++++++++
 board/qemu/s390x/post-build.sh          | 11 +++
 board/qemu/s390x/readme.txt             |  8 +++
 configs/qemu_s390x_defconfig            | 24 +++++++
 linux/Config.in                         |  2 +-
 package/Config.in                       |  1 +
 package/cmake/Config.in                 |  3 +-
 package/gcc/gcc.mk                      |  5 ++
 package/go/Config.in.host               |  2 +-
 package/kexec/Config.in                 |  2 +-
 package/liburcu/Config.in               |  2 +-
 package/makedumpfile/Config.in          |  1 +
 package/qemu/Config.in.host             |  1 +
 package/s390-tools/Config.in            | 13 ++++
 package/s390-tools/s390-tools.hash      |  3 +
 package/s390-tools/s390-tools.mk        | 91 +++++++++++++++++++++++++
 package/systemd/Config.in               |  1 +
 toolchain/toolchain-buildroot/Config.in |  6 +-
 21 files changed, 222 insertions(+), 8 deletions(-)
 create mode 100644 arch/Config.in.s390x
 create mode 100755 board/qemu/s390x/post-build.sh
 create mode 100644 board/qemu/s390x/readme.txt
 create mode 100644 configs/qemu_s390x_defconfig
 create mode 100644 package/s390-tools/Config.in
 create mode 100644 package/s390-tools/s390-tools.hash
 create mode 100644 package/s390-tools/s390-tools.mk

-- 
2.26.2
