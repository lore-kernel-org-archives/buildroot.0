From: guoren at kernel.org <guoren@kernel.org>
Date: Wed, 29 May 2019 15:18:38 +0800
Subject: [Buildroot] [PATCH V3 00/10] Update arch/csky for buildroot
Message-ID: <1559114328-23357-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

This is the 3th patchset for arch/csky update for buildroot, it includes:

 - Support VDSP
 - Support new CPU ck860
 - Support toolchain build in buildroot
 - Add qemu defconfigs

Changes in V3:
 - Fixup the sequence logic of patches
 - Fixup binutils version select
 - Fixup gdb.mk
 - Fixup glibc.hash to seperate dir 

Changes in V2:
 - Seperate gcc gdb glibc gdb from one patch

Guo Ren (10):
  arch/csky: Use VDSP instead of DSP
  arch/csky: Add ck860 supported
  arch/csky: Add FLOAT_ABI compiler options
  arch/csky: Add ABI variable for toolchain build
  package/binutils: Add C-SKY support
  package/gcc: Add C-SKY support
  package/gdb: Add C-SKY support
  package/glibc: Add C-SKY support
  configs/qemu_cskyXXX_virt: new defconfig
  arch/csky: Enable csky toolchain build

 .gitlab-ci.yml                                     |   4 +
 arch/Config.in                                     |   1 -
 arch/Config.in.csky                                |  26 +-
 arch/arch.mk.csky                                  |  26 +
 board/qemu/csky/610_defconfig                      | 526 ++++++++++++++++++++
 board/qemu/csky/807_defconfig                      | 531 ++++++++++++++++++++
 board/qemu/csky/810_defconfig                      | 531 ++++++++++++++++++++
 board/qemu/csky/860_defconfig                      | 533 +++++++++++++++++++++
 configs/qemu_csky610_virt_defconfig                |  29 ++
 configs/qemu_csky807_virt_defconfig                |  30 ++
 configs/qemu_csky810_virt_defconfig                |  30 ++
 configs/qemu_csky860_virt_defconfig                |  30 ++
 package/Makefile.in                                |   9 +
 package/binutils/Config.in.host                    |  11 +-
 package/binutils/binutils.hash                     |   2 +
 package/binutils/binutils.mk                       |   7 +
 package/gcc/Config.in.host                         |  13 +
 package/gcc/gcc.hash                               |   2 +
 package/gcc/gcc.mk                                 |   3 +
 package/gdb/Config.in.host                         |   2 +
 package/gdb/gdb.hash                               |   2 +
 package/gdb/gdb.mk                                 |   6 +
 .../glibc.hash                                     |   2 +
 package/glibc/glibc.mk                             |   3 +
 toolchain/toolchain-buildroot/Config.in            |   2 +-
 25 files changed, 2343 insertions(+), 18 deletions(-)
 create mode 100644 arch/arch.mk.csky
 create mode 100644 board/qemu/csky/610_defconfig
 create mode 100644 board/qemu/csky/807_defconfig
 create mode 100644 board/qemu/csky/810_defconfig
 create mode 100644 board/qemu/csky/860_defconfig
 create mode 100644 configs/qemu_csky610_virt_defconfig
 create mode 100644 configs/qemu_csky807_virt_defconfig
 create mode 100644 configs/qemu_csky810_virt_defconfig
 create mode 100644 configs/qemu_csky860_virt_defconfig
 create mode 100644 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash

-- 
2.7.4
