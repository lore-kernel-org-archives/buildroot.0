From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 21:42:40 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump to the latest kernel
	version
Message-ID: <20161013194736.29ECE81979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=477756b257c4b72e03679b9142104860e1d4dabc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop m68k-mcf5208 kernel patch since it's upstream.

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.8.1   2.6.0           YES     OK (3)
arm_versatile           4.8.1   2.5.0           YES     OK
arm_vexpress            4.8.1   2.5.0           YES     OK
m68k_mcf5208            4.8.1   2.5.0           YES     OK
m68k_q800               4.8.1   q800-v2.4.0     NO (2)  OK
microblazebe            4.8.1   2.5.0           YES     OK
microblazeel            4.8.1   2.5.0           YES     OK
mips32r2el_malta        4.8.1   2.5.0           YES     OK
mips32r2_malta          4.8.1   2.5.0           YES     OK
mips32r6el_malta        4.8.1   2.6.0           YES     OK (3)
mips32r6_malta          4.8.1   2.6.0           YES     OK (3)
mips64el_malta          4.8.1   2.5.0           YES     OK
mips64_malta            4.8.1   2.5.0           YES     OK
mips64r6el_malta        4.8.1   2.7.0           YES     OK (3)(4)
mips64r6_malta          4.8.1   2.7.0           YES     OK (3)(4)
ppc_g3beige             4.8.1   2.5.0           YES     OK
ppc_mpc8544ds           4.8.1   2.5.0           YES     OK
ppc_virtex_ml507        4.8.1   2.5.0           NO      OK
ppc64_pseries           4.8.1   2.5.0           YES     OK
sh4                     4.8.1   2.5.0           YES     OK
sh4eb                   4.8.1   2.5.0           NO (1)  OK
sparc_ss10              4.8.1   2.5.0           YES     OK
sparc64_sun4u           4.8.1   2.5.0           YES     OK
sparc_sun4u             4.8.1   2.5.0           YES     OK
x86                     4.8.1   2.5.0           YES     OK
x86_64                  4.8.1   2.5.0           YES     OK
xtensa_lx60             4.8.1   2.6.0           YES     OK
xtensa_lx60_nommu       4.8.1   2.6.0           YES     OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Known to fail with qemu versions lower than 2.6.0
(4) - Might work with 2.6.0, but the cpu definition changed in 2.7.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../patches/linux/m68knommu-fix-signal.patch       | 45 ----------------------
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../linux-4.8.config}                              |  0
 .../linux-4.8.config}                              |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../linux-4.8.config}                              |  0
 board/qemu/mips64r6-malta/readme.txt               |  7 +++-
 .../linux-4.8.config}                              |  0
 board/qemu/mips64r6el-malta/readme.txt             |  5 ++-
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../sh4-r2d/{linux-4.7.config => linux-4.8.config} |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 board/qemu/x86/linux-4.7.config                    |  1 -
 board/qemu/x86/linux-4.8.config                    |  1 +
 .../x86_64/{linux-4.7.config => linux-4.8.config}  |  0
 ...nux-4.7-nommu.config => linux-4.8-nommu.config} |  0
 .../{linux-4.7.config => linux-4.8.config}         |  0
 configs/pc_x86_64_bios_defconfig                   |  8 ++--
 configs/pc_x86_64_efi_defconfig                    |  8 ++--
 configs/qemu_aarch64_virt_defconfig                |  8 ++--
 configs/qemu_arm_versatile_defconfig               |  8 ++--
 configs/qemu_arm_vexpress_defconfig                |  6 +--
 configs/qemu_m68k_mcf5208_defconfig                | 10 ++---
 configs/qemu_m68k_q800_defconfig                   |  8 ++--
 configs/qemu_microblazebe_mmu_defconfig            |  8 ++--
 configs/qemu_microblazeel_mmu_defconfig            |  8 ++--
 configs/qemu_mips32r2_malta_defconfig              |  8 ++--
 configs/qemu_mips32r2el_malta_defconfig            |  8 ++--
 configs/qemu_mips32r6_malta_defconfig              |  8 ++--
 configs/qemu_mips32r6el_malta_defconfig            |  8 ++--
 configs/qemu_mips64_malta_defconfig                |  8 ++--
 configs/qemu_mips64el_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6el_malta_defconfig            |  8 ++--
 configs/qemu_ppc64_pseries_defconfig               |  6 +--
 configs/qemu_ppc_g3beige_defconfig                 |  8 ++--
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 ++--
 configs/qemu_ppc_virtex_ml507_defconfig            |  8 ++--
 configs/qemu_sh4_r2d_defconfig                     |  8 ++--
 configs/qemu_sh4eb_r2d_defconfig                   |  8 ++--
 configs/qemu_sparc64_sun4u_defconfig               |  8 ++--
 configs/qemu_sparc_ss10_defconfig                  |  8 ++--
 configs/qemu_x86_64_defconfig                      |  8 ++--
 configs/qemu_x86_defconfig                         |  8 ++--
 configs/qemu_xtensa_lx60_defconfig                 |  8 ++--
 configs/qemu_xtensa_lx60_nommu_defconfig           |  8 ++--
 58 files changed, 124 insertions(+), 165 deletions(-)

Patch is too large, so refusing to show it
