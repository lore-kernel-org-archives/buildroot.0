From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 13 Apr 2014 11:46:57 +0200
Subject: [Buildroot] [PATCH 0/6] Microblaze fixes
Message-ID: <1397382423-4939-1-git-send-email-wbx@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The microblaze buildoot support is in a bad state. 
Startup of the resulting image in Qemu is killed by OOM-killer.
These patches resolves the issues and the resulting images for
little endian and big endian are working fine. 
Network support is working now, too.

Waldemar Brodkorb (6):
  use default binutils for microblaze
  use default gcc 4.8.2 for microblaze
  upstream glibc 2.18/2.19 works fine with microblaze
  disable eglibc, no time to test
  temporary hack to fix linking error
  update to 3.14

 .../{linux-3.13.config => linux-3.14.config}       |    1 +
 board/qemu/microblazebe-mmu/system.dts             |  367 --------------------
 .../{linux-3.13.config => linux-3.14.config}       |    1 +
 board/qemu/microblazeel-mmu/system.dts             |  367 --------------------
 board/qemu/microblazeel-mmu/xilinx-xemaclite.patch |   11 +
 configs/qemu_microblazebe_mmu_defconfig            |    8 +-
 configs/qemu_microblazeel_mmu_defconfig            |    8 +-
 linux/Config.in                                    |    2 -
 package/binutils/Config.in.host                    |    3 +-
 package/binutils/binutils.mk                       |    5 -
 package/gcc/Config.in.host                         |   12 +-
 package/gcc/gcc.mk                                 |    4 -
 package/glibc/2.18/microblaze-libgcc_eh.patch      |   18 +
 package/glibc/2.19/microblaze-libgcc_eh.patch      |   18 +
 package/glibc/Config.in                            |    2 +-
 package/glibc/glibc.mk                             |   12 -
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 17 files changed, 63 insertions(+), 778 deletions(-)
 rename board/qemu/microblazebe-mmu/{linux-3.13.config => linux-3.14.config} (98%)
 delete mode 100644 board/qemu/microblazebe-mmu/system.dts
 rename board/qemu/microblazeel-mmu/{linux-3.13.config => linux-3.14.config} (98%)
 delete mode 100644 board/qemu/microblazeel-mmu/system.dts
 create mode 100644 board/qemu/microblazeel-mmu/xilinx-xemaclite.patch
 create mode 100644 package/glibc/2.18/microblaze-libgcc_eh.patch
 create mode 100644 package/glibc/2.19/microblaze-libgcc_eh.patch

-- 
1.7.10.4
