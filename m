From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:23:33 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump to latest version
Message-ID: <20160608202338.3E41181F91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7eb5c56bb3ee7a62eae6b66b4c84c2a61be0480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.5.6   2.5.0           YES     OK (4)
arm_versatile           4.6.1   2.5.0           YES     OK
arm_vexpress            4.6.1   2.5.0           YES     OK
m68k_mcf5208            4.6.1   2.5.0           YES     OK
m68k_q800               4.6.1   q800-v2.4.0     NO (3)  OK
microblazebe            4.6.1   2.5.0           YES     OK
microblazeel            4.6.1   2.5.0           YES     OK
mips64el_malta          4.6.1   2.5.0           YES     OK
mips64_malta            4.6.1   2.5.0           YES     OK
mipsel_malta            4.6.1   2.5.0           YES     OK
mips_malta              4.6.1   2.5.0           YES     OK
ppc_g3beige             4.6.1   2.5.0           YES     OK
ppc_mpc8544ds           4.6.1   2.5.0           YES     OK
ppc_virtex_ml507        4.6.1   2.5.0           NO      OK
ppc64_pseries           4.6.1   2.5.0           YES     OK
sh4                     4.6.1   2.5.0           YES     OK
sh4eb                   4.6.1   2.5.0           NO (1)  OK
sparc_ss10              4.6.1   2.5.0           YES     OK
sparc64_sun4u           4.6.1   2.5.0           YES     OK
sparc_sun4u             4.6.1   2.5.0           YES     OK
x86                     4.6.1   2.5.0           YES     OK
x86_64                  4.6.1   2.5.0           YES     OK
xtensa_lx60             4.6.1   2.6.0           YES     OK (2)
xtensa_lx60_nommu       4.6.1   2.6.0           YES     OK (2)

(1) - Probably an endian issue with 8139 emulation/driver
(2) - Linux 4.5/4.6 doesn't work with older Qemu versions
(3) - There's a network interface, but enabling it in qemu fails
(4) - Console looks dead in 4.6

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../patches/linux/0001-fix-do_sigreturn.patch      | 100 ---------------------
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../sh4-r2d/{linux-4.5.config => linux-4.6.config} |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 board/qemu/x86/linux-4.5.config                    |   1 -
 board/qemu/x86/linux-4.6.config                    |   1 +
 .../x86_64/{linux-4.5.config => linux-4.6.config}  |   0
 ...nux-4.4-nommu.config => linux-4.6-nommu.config} |   0
 .../{linux-4.4.config => linux-4.6.config}         |   0
 board/qemu/xtensa-lx60/readme.txt                  |   3 +-
 configs/pc_x86_64_bios_defconfig                   |   8 +-
 configs/pc_x86_64_efi_defconfig                    |   8 +-
 configs/qemu_aarch64_virt_defconfig                |   2 +-
 configs/qemu_arm_versatile_defconfig               |   8 +-
 configs/qemu_arm_vexpress_defconfig                |   6 +-
 configs/qemu_m68k_mcf5208_defconfig                |  10 +--
 configs/qemu_m68k_q800_defconfig                   |   8 +-
 configs/qemu_microblazebe_mmu_defconfig            |   8 +-
 configs/qemu_microblazeel_mmu_defconfig            |   8 +-
 configs/qemu_mips64_malta_defconfig                |   8 +-
 configs/qemu_mips64el_malta_defconfig              |   8 +-
 configs/qemu_mips_malta_defconfig                  |   8 +-
 configs/qemu_mipsel_malta_defconfig                |   8 +-
 configs/qemu_ppc64_pseries_defconfig               |   6 +-
 configs/qemu_ppc_g3beige_defconfig                 |   8 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |   8 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |   8 +-
 configs/qemu_sh4_r2d_defconfig                     |   8 +-
 configs/qemu_sh4eb_r2d_defconfig                   |   8 +-
 configs/qemu_sparc64_sun4u_defconfig               |   8 +-
 configs/qemu_sparc_ss10_defconfig                  |   8 +-
 configs/qemu_x86_64_defconfig                      |   8 +-
 configs/qemu_x86_defconfig                         |   8 +-
 configs/qemu_xtensa_lx60_defconfig                 |   8 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |   8 +-
 48 files changed, 98 insertions(+), 199 deletions(-)

Patch is too large, so refusing to show it
