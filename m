From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Sun,  5 May 2019 18:53:52 +0200
Subject: [Buildroot] [PATCH v2 0/7] gitlab Qemu runtime testing
Message-ID: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Testing Qemu build states helps
to identify any issue encountered
during the build.
When compilation is done, a qemu
machine is started, fed with root login
and then powered down. Even if this test
is simple, it can point to various errors.


Jugurtha BELKALEM (7):
  package/qemu: enable nios2 support for host-qemu
  package/qemu: enable sparc64 support for host-qemu
  package/qemu: remove comment about sh64
  configs/qemu-*: add host-qemu-system
  board/qemu/*/launch.sh: add qemu launch script
  support/scripts/qemu-boot-*: gitlab tests for Qemu
  gitlab.yml.in*: enable Qemu gitlab testing

 .gitlab-ci.yml                             |  3 ++
 .gitlab-ci.yml.in                          |  3 ++
 board/qemu/aarch64-virt/launch.sh          | 21 ++++++++++++
 board/qemu/arm-versatile/launch.sh         | 26 ++++++++++++++
 board/qemu/arm-vexpress/launch.sh          | 25 ++++++++++++++
 board/qemu/m68k-mcf5208/launch.sh          | 21 ++++++++++++
 board/qemu/m68k-q800/launch.sh             | 22 ++++++++++++
 board/qemu/microblazebe-mmu/launch.sh      | 21 ++++++++++++
 board/qemu/microblazeel-mmu/launch.sh      | 21 ++++++++++++
 board/qemu/mips32r2-malta/launch.sh        | 23 +++++++++++++
 board/qemu/mips32r2el-malta/launch.sh      | 23 +++++++++++++
 board/qemu/mips32r6-malta/launch.sh        | 21 ++++++++++++
 board/qemu/mips32r6el-malta/launch.sh      | 21 ++++++++++++
 board/qemu/mips64-malta/launch.sh          | 22 ++++++++++++
 board/qemu/mips64el-malta/launch.sh        | 22 ++++++++++++
 board/qemu/mips64r6-malta/launch.sh        | 21 ++++++++++++
 board/qemu/mips64r6el-malta/launch.sh      | 21 ++++++++++++
 board/qemu/nios2-10m50/launch.sh           | 21 ++++++++++++
 board/qemu/or1k/launch.sh                  | 23 +++++++++++++
 board/qemu/ppc-g3beige/launch.sh           | 22 ++++++++++++
 board/qemu/ppc-mpc8544ds/launch.sh         | 21 ++++++++++++
 board/qemu/ppc-virtex-ml507/launch.sh      | 21 ++++++++++++
 board/qemu/ppc64-e5500/launch.sh           | 21 ++++++++++++
 board/qemu/ppc64-pseries/launch.sh         | 21 ++++++++++++
 board/qemu/ppc64le-pseries/launch.sh       | 21 ++++++++++++
 board/qemu/riscv32-virt/launch.sh          | 21 ++++++++++++
 board/qemu/riscv64-virt/launch.sh          | 21 ++++++++++++
 board/qemu/sh4-r2d/launch.sh               | 22 ++++++++++++
 board/qemu/sh4eb-r2d/launch.sh             | 22 ++++++++++++
 board/qemu/sparc-ss10/launch.sh            | 21 ++++++++++++
 board/qemu/sparc64-sun4u/launch.sh         | 21 ++++++++++++
 board/qemu/x86/launch.sh                   | 23 +++++++++++++
 board/qemu/x86_64/launch.sh                | 23 +++++++++++++
 board/qemu/xtensa-lx60/launch.sh           | 21 ++++++++++++
 configs/qemu_aarch64_virt_defconfig        |  4 +++
 configs/qemu_arm_versatile_defconfig       |  4 +++
 configs/qemu_arm_versatile_nommu_defconfig |  4 +++
 configs/qemu_arm_vexpress_defconfig        |  4 +++
 configs/qemu_m68k_mcf5208_defconfig        |  4 +++
 configs/qemu_m68k_q800_defconfig           |  4 +++
 configs/qemu_microblazebe_mmu_defconfig    |  4 +++
 configs/qemu_microblazeel_mmu_defconfig    |  4 +++
 configs/qemu_mips32r2_malta_defconfig      |  4 +++
 configs/qemu_mips32r2el_malta_defconfig    |  4 +++
 configs/qemu_mips32r6_malta_defconfig      |  4 +++
 configs/qemu_mips32r6el_malta_defconfig    |  4 +++
 configs/qemu_mips64_malta_defconfig        |  4 +++
 configs/qemu_mips64el_malta_defconfig      |  4 +++
 configs/qemu_mips64r6_malta_defconfig      |  4 +++
 configs/qemu_mips64r6el_malta_defconfig    |  4 +++
 configs/qemu_nios2_10m50_defconfig         |  4 +++
 configs/qemu_or1k_defconfig                |  4 +++
 configs/qemu_ppc64_e5500_defconfig         |  4 +++
 configs/qemu_ppc64_pseries_defconfig       |  4 +++
 configs/qemu_ppc64le_pseries_defconfig     |  4 +++
 configs/qemu_ppc_g3beige_defconfig         |  4 +++
 configs/qemu_ppc_mpc8544ds_defconfig       |  4 +++
 configs/qemu_ppc_virtex_ml507_defconfig    |  4 +++
 configs/qemu_riscv32_virt_defconfig        |  4 +++
 configs/qemu_riscv64_virt_defconfig        |  4 +++
 configs/qemu_sh4_r2d_defconfig             |  4 +++
 configs/qemu_sh4eb_r2d_defconfig           |  4 +++
 configs/qemu_sparc64_sun4u_defconfig       |  4 +++
 configs/qemu_sparc_ss10_defconfig          |  4 +++
 configs/qemu_x86_64_defconfig              |  4 +++
 configs/qemu_x86_defconfig                 |  4 +++
 configs/qemu_xtensa_lx60_defconfig         |  4 +++
 configs/qemu_xtensa_lx60_nommu_defconfig   |  4 +++
 package/qemu/Config.in.host                |  2 ++
 package/qemu/qemu.mk                       |  3 +-
 support/scripts/qemu-boot-checker.sh       | 25 ++++++++++++++
 support/scripts/qemu-boot-chg-defconfig.sh | 11 ++++++
 support/scripts/qemu-boot-expect.py        | 55 ++++++++++++++++++++++++++++++
 73 files changed, 934 insertions(+), 1 deletion(-)
 create mode 100755 board/qemu/aarch64-virt/launch.sh
 create mode 100755 board/qemu/arm-versatile/launch.sh
 create mode 100755 board/qemu/arm-vexpress/launch.sh
 create mode 100755 board/qemu/m68k-mcf5208/launch.sh
 create mode 100755 board/qemu/m68k-q800/launch.sh
 create mode 100755 board/qemu/microblazebe-mmu/launch.sh
 create mode 100755 board/qemu/microblazeel-mmu/launch.sh
 create mode 100755 board/qemu/mips32r2-malta/launch.sh
 create mode 100755 board/qemu/mips32r2el-malta/launch.sh
 create mode 100755 board/qemu/mips32r6-malta/launch.sh
 create mode 100755 board/qemu/mips32r6el-malta/launch.sh
 create mode 100755 board/qemu/mips64-malta/launch.sh
 create mode 100755 board/qemu/mips64el-malta/launch.sh
 create mode 100755 board/qemu/mips64r6-malta/launch.sh
 create mode 100755 board/qemu/mips64r6el-malta/launch.sh
 create mode 100755 board/qemu/nios2-10m50/launch.sh
 create mode 100755 board/qemu/or1k/launch.sh
 create mode 100755 board/qemu/ppc-g3beige/launch.sh
 create mode 100755 board/qemu/ppc-mpc8544ds/launch.sh
 create mode 100755 board/qemu/ppc-virtex-ml507/launch.sh
 create mode 100755 board/qemu/ppc64-e5500/launch.sh
 create mode 100755 board/qemu/ppc64-pseries/launch.sh
 create mode 100755 board/qemu/ppc64le-pseries/launch.sh
 create mode 100755 board/qemu/riscv32-virt/launch.sh
 create mode 100755 board/qemu/riscv64-virt/launch.sh
 create mode 100755 board/qemu/sh4-r2d/launch.sh
 create mode 100755 board/qemu/sh4eb-r2d/launch.sh
 create mode 100755 board/qemu/sparc-ss10/launch.sh
 create mode 100755 board/qemu/sparc64-sun4u/launch.sh
 create mode 100755 board/qemu/x86/launch.sh
 create mode 100755 board/qemu/x86_64/launch.sh
 create mode 100755 board/qemu/xtensa-lx60/launch.sh
 create mode 100755 support/scripts/qemu-boot-checker.sh
 create mode 100755 support/scripts/qemu-boot-chg-defconfig.sh
 create mode 100755 support/scripts/qemu-boot-expect.py

-- 
2.7.4
