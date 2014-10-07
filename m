From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 09:29:35 -0300
Subject: [Buildroot] [PATCH 00/19] Qemu sample configuration bumps
Message-ID: <1412684994-28760-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series updates the kernel and candidate qemu versions to the
latest possible versions.
The relevant kernel configurations are updated to switch from ext2 to ext4
since it covers more use cases.
ext* support was removed for platforms that are very unlikely to boot/use that
kind of filesystem (microblaze).

Status matrix:

Defconfig               Kernel          Qemu    Network Status
--------------------------------------------------------------
aarch64_virt            3.17            2.1.2   YES     OK
arm_nuri                3.10.56         2.1.2   YES(1)  OK most times(2)
arm_versatile           3.17            2.1.2   YES     OK
arm_vexpress            3.17            2.1.2   YES     OK
microblazebe            3.17            2.1.2   YES     OK
microblazeel            3.17            2.1.2   YES     OK
mips64el_malta          3.17            2.1.2   YES     OK
mips64_malta            3.17            2.1.2   YES     OK
mipsel_malta            3.17            2.1.2   YES     OK
mips_malta              3.17            2.1.2   YES     OK
ppc_g3beige             3.17            2.1.2   YES     OK
ppc_mpc8544ds           3.17            2.0.2   YES     OK(3)
ppc_virtex_ml507        3.17            2.1.2   NO      OK
ppc64_pseries           3.17            2.1.2   YES     OK
sh4                     3.17            2.1.2   YES     OK
sparc_ss10              3.17            2.1.2   YES     OK
x86                     3.17            2.1.2   YES     OK
x86_64                  3.17            2.1.2   YES     OK
xtensa_lx60             3.17            2.1.2   YES     OK

(1) - Supposed to work but broken, probably Qemu emulation issue
(2) - In like 1/3 starts it fails to work properly
(3) - Qemu 2.1.x doesn't show up anything (broken)

Gustavo Zacarias (19):
  qemu/aarch64-virt: update to the latest versions
  qemu/arm-nuri: update to the latest versions
  qemu/arm-versatile: update to the latest versions
  qemu/arm-vexpress: update to the latest versions
  qemu/microblazebe-mmu: update to the latest versions
  qemu/microblazeel-mmu: update to the latest versions
  qemu/mips64el-malta: update to the latest versions
  qemu/mips64-malta: update to the latest versions
  qemu/mipsel-malta: update to the latest versions
  qemu/mips-malta: update to the latest versions
  qemu/sh4-r2d: update to the latest versions
  qemu/sparc-ss10: update to the latest versions
  qemu/xtensa-lx60: update to the latest versions
  qemu/x86_64: update to the latest versions
  qemu/x86: update to the latest versions
  qemu/ppc-g3beige: update to the latest versions
  qemu/ppc-mpc8544ds: update to the latest versions
  qemu/ppc-virtex-ml507: update to the latest versions
  qemu/ppc64-pseries: update to the latest versions

 .../{linux-3.16.config => linux-3.17.config}       |  3 +--
 board/qemu/aarch64-virt/readme.txt                 |  2 +-
 board/qemu/arm-nuri/readme.txt                     |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  2 +-
 board/qemu/arm-versatile/readme.txt                |  2 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  4 ----
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  6 ++---
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  0
 board/qemu/mips-malta/readme.txt                   |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  0
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  0
 board/qemu/mips64el-malta/readme.txt               |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  0
 board/qemu/mipsel-malta/readme.txt                 |  2 +-
 .../linux-3.17.config}                             |  4 +---
 .../{powerpc-g3beige => ppc-g3beige}/readme.txt    |  2 +-
 .../readme.txt                                     |  2 +-
 .../readme.txt                                     |  5 ++--
 .../readme.txt                                     |  0
 .../{linux-3.16.config => linux-3.17.config}       | 28 +---------------------
 board/qemu/sh4-r2d/readme.txt                      |  2 +-
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 .../linux-3.16.config => x86/linux-3.17.config}    |  0
 board/qemu/x86/readme.txt                          |  2 +-
 .../linux-3.16.config => x86_64/linux-3.17.config} |  0
 board/qemu/x86_64/readme.txt                       |  2 +-
 .../{linux-3.16.config => linux-3.17.config}       |  0
 board/qemu/xtensa-lx60/readme.txt                  |  2 +-
 configs/qemu_aarch64_virt_defconfig                | 10 ++++----
 configs/qemu_arm_nuri_defconfig                    |  4 ++--
 configs/qemu_arm_versatile_defconfig               | 10 ++++----
 configs/qemu_arm_vexpress_defconfig                |  8 +++----
 configs/qemu_microblazebe_mmu_defconfig            | 10 ++++----
 configs/qemu_microblazeel_mmu_defconfig            | 10 ++++----
 configs/qemu_mips64_malta_defconfig                | 10 ++++----
 configs/qemu_mips64el_malta_defconfig              | 10 ++++----
 configs/qemu_mips_malta_defconfig                  | 10 ++++----
 configs/qemu_mipsel_malta_defconfig                | 10 ++++----
 configs/qemu_ppc64_pseries_defconfig               |  8 +++----
 configs/qemu_ppc_g3beige_defconfig                 | 10 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 +++----
 configs/qemu_ppc_virtex_ml507_defconfig            | 13 ++++++----
 configs/qemu_sh4_r2d_defconfig                     | 10 ++++----
 configs/qemu_sparc_ss10_defconfig                  |  8 +++----
 configs/qemu_x86_64_defconfig                      | 10 ++++----
 configs/qemu_x86_defconfig                         | 10 ++++----
 configs/qemu_xtensa_lx60_defconfig                 | 10 ++++----
 51 files changed, 117 insertions(+), 148 deletions(-)
 rename board/qemu/aarch64-virt/{linux-3.16.config => linux-3.17.config} (96%)
 rename board/qemu/arm-versatile/{linux-3.16.config => linux-3.17.config} (98%)
 rename board/qemu/microblazebe-mmu/{linux-3.16.config => linux-3.17.config} (92%)
 rename board/qemu/microblazeel-mmu/{linux-3.16.config => linux-3.17.config} (92%)
 rename board/qemu/mips-malta/{linux-3.16.config => linux-3.17.config} (100%)
 rename board/qemu/mips64-malta/{linux-3.16.config => linux-3.17.config} (100%)
 rename board/qemu/mips64el-malta/{linux-3.16.config => linux-3.17.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.16.config => linux-3.17.config} (100%)
 rename board/qemu/{powerpc-g3beige/linux-3.16.config => ppc-g3beige/linux-3.17.config} (93%)
 rename board/qemu/{powerpc-g3beige => ppc-g3beige}/readme.txt (93%)
 rename board/qemu/{powerpc-mpc8544ds => ppc-mpc8544ds}/readme.txt (89%)
 rename board/qemu/{powerpc-virtex-ml507 => ppc-virtex-ml507}/readme.txt (58%)
 rename board/qemu/{powerpc64-pseries => ppc64-pseries}/readme.txt (100%)
 rename board/qemu/sh4-r2d/{linux-3.16.config => linux-3.17.config} (68%)
 rename board/qemu/{x86_64/linux-3.16.config => x86/linux-3.17.config} (100%)
 rename board/qemu/{x86/linux-3.16.config => x86_64/linux-3.17.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-3.16.config => linux-3.17.config} (100%)

-- 
2.0.4
