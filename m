From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:36:39 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump to the latest linux
	version
Message-ID: <20151111223644.274D48177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb16580a460e971279b29d90065e20d08dbfb615
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ppc-mpc8544ds: switch to custom kernel config since the new 4.3-shipped
mpc85xx_basic_defconfig doesn't work with Qemu.
Incidentally while cleaning it up it now seems to work fine with newer
qemu versions.

sparc64_sun4u: ditch ne2k driver since it's useless, and add the e1000
driver which works fine.

x86: stick to 4.2.x kernels since 4.3 doesn't work right with uclibc
(any variant) based toolchains.

Results table:

Defconfig               Kernel          Qemu    Network Status
--------------------------------------------------------------
aarch64_virt            4.3             2.3.0   YES     OK
arm_nuri                3.10.93         2.3.0   NO(1)   OK(2)
arm_versatile           4.3             2.3.0   YES     OK
arm_vexpress            4.3             2.3.0   YES     OK
microblazebe            4.3             2.3.0   YES     OK
microblazeel            4.3             2.3.0   YES     OK
mips64el_malta          4.3             2.3.0   YES     OK
mips64_malta            4.3             2.3.0   YES     OK
mipsel_malta            4.3             2.3.0   YES     OK
mips_malta              4.3             2.3.0   YES     OK
ppc_g3beige             4.3             2.3.0   YES     OK
ppc_mpc8544ds           4.3             2.3.0   YES     OK
ppc_virtex_ml507        4.3             2.3.0   NO      OK
ppc64_pseries           4.3             2.3.0   YES     OK
sh4                     4.3             2.3.0   YES     OK
sh4eb                   4.3             2.3.0   NO(1)   OK
sparc_ss10              4.3             2.3.0   YES     OK
sparc64_sun4u           4.3             2.3.0   YES     OK
sparc_sun4u             4.3             2.3.0   YES     OK
x86                     4.2.6           2.3.0   YES     OK(3)
x86_64                  4.3             2.3.0   YES     OK
xtensa_lx60             4.3             2.3.0   YES     OK

(1) - Supposed to work but broken, probably Qemu emulation issue
(2) - In like 1/3 runs it fails to start properly
(3) - linux 4.3.0 doesn't like uclibc-based toolchains (net issues)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/aarch64-virt/readme.txt                 |    2 +-
 board/qemu/arm-nuri/readme.txt                     |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/arm-versatile/readme.txt                |    2 +-
 board/qemu/arm-vexpress/readme.txt                 |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/microblazebe-mmu/readme.txt             |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/microblazeel-mmu/readme.txt             |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/mips-malta/readme.txt                   |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/mips64-malta/readme.txt                 |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/mips64el-malta/readme.txt               |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/ppc-g3beige/readme.txt                  |    2 +-
 board/qemu/ppc-mpc8544ds/linux-4.3.config          |   38 ++++++++++++++++++++
 board/qemu/ppc-mpc8544ds/readme.txt                |    3 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/ppc-virtex-ml507/readme.txt             |    2 +-
 board/qemu/ppc64-pseries/readme.txt                |    2 +-
 .../sh4-r2d/{linux-4.2.config => linux-4.3.config} |    0
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/sh4eb-r2d/readme.txt                    |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/sparc-ss10/readme.txt                   |    2 +-
 .../{linux-4.1.config => linux-4.3.config}         |    4 +--
 board/qemu/sparc64-sun4u/readme.txt                |    2 +-
 board/qemu/x86/readme.txt                          |    2 +-
 .../x86_64/{linux-4.2.config => linux-4.3.config}  |    0
 board/qemu/x86_64/readme.txt                       |    2 +-
 .../{linux-4.2.config => linux-4.3.config}         |    0
 board/qemu/xtensa-lx60/readme.txt                  |    2 +-
 configs/qemu_aarch64_virt_defconfig                |   10 +++---
 configs/qemu_arm_nuri_defconfig                    |    4 +-
 configs/qemu_arm_versatile_defconfig               |   10 +++---
 configs/qemu_arm_vexpress_defconfig                |    8 ++--
 configs/qemu_microblazebe_mmu_defconfig            |   10 +++---
 configs/qemu_microblazeel_mmu_defconfig            |   10 +++---
 configs/qemu_mips64_malta_defconfig                |   10 +++---
 configs/qemu_mips64el_malta_defconfig              |   10 +++---
 configs/qemu_mips_malta_defconfig                  |   10 +++---
 configs/qemu_mipsel_malta_defconfig                |   10 +++---
 configs/qemu_ppc64_pseries_defconfig               |    8 ++--
 configs/qemu_ppc_g3beige_defconfig                 |   10 +++---
 configs/qemu_ppc_mpc8544ds_defconfig               |   11 +++---
 configs/qemu_ppc_virtex_ml507_defconfig            |   10 +++---
 configs/qemu_sh4_r2d_defconfig                     |   10 +++---
 configs/qemu_sh4eb_r2d_defconfig                   |   10 +++---
 configs/qemu_sparc64_sun4u_defconfig               |   10 +++---
 configs/qemu_sparc_ss10_defconfig                  |   10 +++---
 configs/qemu_x86_64_defconfig                      |   10 +++---
 configs/qemu_x86_defconfig                         |    4 +-
 configs/qemu_xtensa_lx60_defconfig                 |   10 +++---
 59 files changed, 158 insertions(+), 122 deletions(-)

Patch is too large, so refusing to show it
