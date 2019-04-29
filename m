From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:19 +0200
Subject: [Buildroot] [PATCH 0/7] gitlab Qemu runtime testing
Message-ID: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tests that have been performed resulted in:
- 23 architectures passing the test.
- 12 architectures that failed the test.
More investigations need to be made for
architectures that did not pass the test.

special notes for :
- m64k_q800 has been blacklisted (as there is
no qemu support for it).
- sparc64 does not find a qemu shell.
- x86 and x86_64 do not boot properly (timeout).
- qemu ork1 and xtensa do not even compile.

Jugurtha BELKALEM (7):
  support/docker/Dockerfile: new package expect
  package/qemu: enable nios2 support for host-qemu
  package/qemu: enable sparc64 support for host-qemu
  package/qemu: remove comment about sh64
  configs/qemu-*: add host-qemu-system
  support/scripts/qemu-boot: gitlab tests for Qemu
  gitlab.yml.in: enable Qemu gitlab testing

 .gitlab-ci.yml                                |  3 +++
 .gitlab-ci.yml.in                             |  3 +++
 configs/qemu_aarch64_virt_defconfig           |  4 +++
 configs/qemu_arm_versatile_defconfig          |  4 +++
 configs/qemu_arm_versatile_nommu_defconfig    |  4 +++
 configs/qemu_arm_vexpress_defconfig           |  4 +++
 configs/qemu_m68k_mcf5208_defconfig           |  4 +++
 configs/qemu_m68k_q800_defconfig              |  4 +++
 configs/qemu_microblazebe_mmu_defconfig       |  4 +++
 configs/qemu_microblazeel_mmu_defconfig       |  4 +++
 configs/qemu_mips32r2_malta_defconfig         |  4 +++
 configs/qemu_mips32r2el_malta_defconfig       |  4 +++
 configs/qemu_mips32r6_malta_defconfig         |  4 +++
 configs/qemu_mips32r6el_malta_defconfig       |  4 +++
 configs/qemu_mips64_malta_defconfig           |  4 +++
 configs/qemu_mips64el_malta_defconfig         |  4 +++
 configs/qemu_mips64r6_malta_defconfig         |  4 +++
 configs/qemu_mips64r6el_malta_defconfig       |  4 +++
 configs/qemu_nios2_10m50_defconfig            |  4 +++
 configs/qemu_or1k_defconfig                   |  4 +++
 configs/qemu_ppc64_e5500_defconfig            |  4 +++
 configs/qemu_ppc64_pseries_defconfig          |  4 +++
 configs/qemu_ppc64le_pseries_defconfig        |  4 +++
 configs/qemu_ppc_g3beige_defconfig            |  4 +++
 configs/qemu_ppc_mpc8544ds_defconfig          |  4 +++
 configs/qemu_ppc_virtex_ml507_defconfig       |  4 +++
 configs/qemu_riscv32_virt_defconfig           |  4 +++
 configs/qemu_riscv64_virt_defconfig           |  4 +++
 configs/qemu_sh4_r2d_defconfig                |  4 +++
 configs/qemu_sh4eb_r2d_defconfig              |  4 +++
 configs/qemu_sparc64_sun4u_defconfig          |  4 +++
 configs/qemu_sparc_ss10_defconfig             |  4 +++
 configs/qemu_x86_64_defconfig                 |  4 +++
 configs/qemu_x86_defconfig                    |  4 +++
 configs/qemu_xtensa_lx60_defconfig            |  4 +++
 configs/qemu_xtensa_lx60_nommu_defconfig      |  4 +++
 package/qemu/Config.in.host                   |  2 ++
 package/qemu/qemu.mk                          |  3 ++-
 support/docker/Dockerfile                     |  1 +
 support/scripts/expect.sh                     | 22 +++++++++++++++++
 support/scripts/qemu-boot-checker.sh          | 35 +++++++++++++++++++++++++++
 support/scripts/qemu-boot-defconfig_config.sh | 11 +++++++++
 42 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100755 support/scripts/expect.sh
 create mode 100755 support/scripts/qemu-boot-checker.sh
 create mode 100755 support/scripts/qemu-boot-defconfig_config.sh

-- 
2.7.4
