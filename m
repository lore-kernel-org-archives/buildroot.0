From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 14:25:24 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump to the latest kernel
	version
Message-ID: <20170131132652.D8DC581F85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62e4e13e185cbc6e7a7542a2b911e7befb7f6946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.9.6   2.6.0           YES     OK (3)
arm_versatile           4.9.6   2.5.0           YES     OK
arm_versatile_nommu     4.4.45  2.5.0           YES     OK
arm_vexpress            4.9.6   2.5.0           YES     OK
m68k_mcf5208            4.8.17  2.5.0           YES     OK (6)
m68k_q800               4.9.6   q800-v2.4.0     NO (2)  OK
microblazebe            4.9.6   2.5.0           YES     OK
microblazeel            4.9.6   2.5.0           YES     OK
mips32r2el_malta        4.9.6   2.5.0           YES     OK
mips32r2_malta          4.9.6   2.5.0           YES     OK
mips32r6el_malta        4.9.6   2.6.0           YES     OK (3)
mips32r6_malta          4.9.6   2.6.0           YES     OK (3)
mips64el_malta          4.9.6   2.5.0           YES     OK
mips64_malta            4.8.17  2.5.0           YES     OK (6)
mips64r6el_malta        4.9.6   2.7.0           YES     OK (3)(4)
mips64r6_malta          4.9.6   2.7.0           YES     OK (3)(4)
nios2-10m50             4.9.6   2.9.0           NO      OK
or1k                    4.9.6   2.5.0           NO      OK
ppc_g3beige             4.9.6   2.5.0           YES     OK
ppc_mpc8544ds           4.9.6   2.5.0           YES     OK
ppc_virtex_ml507        4.9.6   2.5.0           NO      OK
ppc64_pseries           4.9.6   2.5.0           YES     OK
sh4                     4.9.6   2.5.0           YES     OK
sh4eb                   4.9.6   2.5.0           NO (1)  OK
sparc_ss10              4.9.6   2.5.0           YES     OK
sparc64_sun4u           4.9.6   2.5.0           YES     OK
sparc_sun4u             4.9.6   2.5.0           YES     OK
x86                     4.9.6   2.5.0           YES     OK
x86_64                  4.9.6   2.5.0           YES     OK
xtensa_lx60             4.8.17  2.6.0           YES     OK (6)
xtensa_lx60_nommu       4.8.17  2.6.0           YES     OK (5)

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Known to fail with qemu versions lower than 2.6.0
(4) - Might work with 2.6.0, but the cpu definition changed in 2.7.0
(5) - Kept back on 4.8.x series since 4.9.x fails to build
(6) - Kept back on 4.8.x series since 4.9.x fails to boot

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/{linux-4.8.config => linux-4.9.config}    | 0
 board/qemu/arm-versatile/{linux-4.8.config => linux-4.9.config}   | 0
 board/qemu/m68k-q800/{linux-4.8.config => linux-4.9.config}       | 0
 .../qemu/microblazebe-mmu/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/microblazeel-mmu/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/mips32r2-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/mips32r2el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../linux-4.8.config => mips32r6-malta/linux-4.9.config}          | 0
 .../linux-4.8.config => mips32r6el-malta/linux-4.9.config}        | 0
 board/qemu/mips64el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../linux-4.8.config => mips64r6-malta/linux-4.9.config}          | 0
 .../linux-4.8.config => mips64r6el-malta/linux-4.9.config}        | 0
 board/qemu/ppc-g3beige/{linux-4.8.config => linux-4.9.config}     | 0
 board/qemu/ppc-mpc8544ds/{linux-4.8.config => linux-4.9.config}   | 0
 .../qemu/ppc-virtex-ml507/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/sh4-r2d/{linux-4.8.config => linux-4.9.config}         | 0
 board/qemu/sh4eb-r2d/{linux-4.8.config => linux-4.9.config}       | 0
 board/qemu/sparc-ss10/{linux-4.8.config => linux-4.9.config}      | 0
 board/qemu/sparc64-sun4u/{linux-4.8.config => linux-4.9.config}   | 0
 board/qemu/x86/linux-4.8.config                                   | 1 -
 board/qemu/x86/linux-4.9.config                                   | 1 +
 board/qemu/x86_64/{linux-4.8.config => linux-4.9.config}          | 0
 configs/pc_x86_64_bios_defconfig                                  | 8 ++++----
 configs/pc_x86_64_efi_defconfig                                   | 8 ++++----
 configs/qemu_aarch64_virt_defconfig                               | 8 ++++----
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_versatile_nommu_defconfig                        | 2 +-
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_m68k_mcf5208_defconfig                               | 2 +-
 configs/qemu_m68k_q800_defconfig                                  | 8 ++++----
 configs/qemu_microblazebe_mmu_defconfig                           | 8 ++++----
 configs/qemu_microblazeel_mmu_defconfig                           | 8 ++++----
 configs/qemu_mips32r2_malta_defconfig                             | 8 ++++----
 configs/qemu_mips32r2el_malta_defconfig                           | 8 ++++----
 configs/qemu_mips32r6_malta_defconfig                             | 8 ++++----
 configs/qemu_mips32r6el_malta_defconfig                           | 8 ++++----
 configs/qemu_mips64_malta_defconfig                               | 2 +-
 configs/qemu_mips64el_malta_defconfig                             | 8 ++++----
 configs/qemu_mips64r6_malta_defconfig                             | 8 ++++----
 configs/qemu_mips64r6el_malta_defconfig                           | 8 ++++----
 configs/qemu_nios2_10m50_defconfig                                | 2 +-
 configs/qemu_or1k_defconfig                                       | 2 +-
 configs/qemu_ppc64_pseries_defconfig                              | 6 +++---
 configs/qemu_ppc_g3beige_defconfig                                | 8 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig                              | 8 ++++----
 configs/qemu_ppc_virtex_ml507_defconfig                           | 8 ++++----
 configs/qemu_sh4_r2d_defconfig                                    | 8 ++++----
 configs/qemu_sh4eb_r2d_defconfig                                  | 8 ++++----
 configs/qemu_sparc64_sun4u_defconfig                              | 8 ++++----
 configs/qemu_sparc_ss10_defconfig                                 | 8 ++++----
 configs/qemu_x86_64_defconfig                                     | 8 ++++----
 configs/qemu_x86_defconfig                                        | 8 ++++----
 configs/qemu_xtensa_lx60_defconfig                                | 4 ++--
 configs/qemu_xtensa_lx60_nommu_defconfig                          | 2 +-
 54 files changed, 107 insertions(+), 107 deletions(-)

Patch is too large, so refusing to show it
