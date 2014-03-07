From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:37:43 +0100
Subject: [Buildroot] [git commit] configs/qemu: fix and bump relevant
	kernel/header versions
Message-ID: <20140307213820.81AEC9BE0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7124e36770f46ad370b131b264d9527d92b6329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tweak the configs to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
fallout.
And bump to the latest kernel versions.

As of this commit the microblaze qemu targets seem broken, probably
because of commit 14e527eb66d251c878f212236729d715e350c135 or some qemu
limitation.

SPARC seems to have issues as well, the kernel seems to go down with an
unhandled exception with qemu 1.7.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/arm-nuri/readme.txt                     |    2 +-
 .../{linux-3.11.config => linux-3.13.config}       |   22 ++----
 board/qemu/arm-versatile/readme.txt                |    2 +-
 board/qemu/arm-vexpress/readme.txt                 |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |   15 +---
 board/qemu/microblazebe-mmu/readme.txt             |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |   15 +---
 board/qemu/microblazeel-mmu/readme.txt             |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |   24 +-----
 board/qemu/mips-malta/readme.txt                   |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |    0
 board/qemu/mips64-malta/readme.txt                 |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |    0
 board/qemu/mips64el-malta/readme.txt               |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |   24 +-----
 board/qemu/mipsel-malta/readme.txt                 |    2 +-
 board/qemu/powerpc-g3beige/linux-3.12.config       |   86 --------------------
 board/qemu/powerpc-g3beige/linux-3.13.config       |   47 +++++++++++
 board/qemu/powerpc-g3beige/readme.txt              |    2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt            |    2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt         |    2 +-
 board/qemu/sh4-r2d/linux-3.2.config                |    9 --
 board/qemu/sh4-r2d/readme.txt                      |    2 +-
 board/qemu/sparc-ss10/readme.txt                   |    2 +-
 .../x86/{linux-3.12.config => linux-3.13.config}   |    7 --
 board/qemu/x86/readme.txt                          |    2 +-
 .../{linux-3.12.config => linux-3.13.config}       |    7 --
 board/qemu/x86_64/readme.txt                       |    2 +-
 configs/qemu_arm_nuri_defconfig                    |    6 +-
 configs/qemu_arm_versatile_defconfig               |    9 +-
 configs/qemu_arm_vexpress_defconfig                |    7 +-
 configs/qemu_microblazebe_mmu_defconfig            |    4 +-
 configs/qemu_microblazeel_mmu_defconfig            |    4 +-
 configs/qemu_mips64_malta_defconfig                |    9 +-
 configs/qemu_mips64el_malta_defconfig              |    9 +-
 configs/qemu_mips_malta_defconfig                  |    9 +-
 configs/qemu_mipsel_malta_defconfig                |    9 +-
 configs/qemu_ppc_g3beige_defconfig                 |    9 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |    7 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |    7 +-
 configs/qemu_sh4_r2d_defconfig                     |    5 +-
 configs/qemu_sparc_ss10_defconfig                  |    1 +
 configs/qemu_x86_64_defconfig                      |    9 +-
 configs/qemu_x86_defconfig                         |    9 +-
 44 files changed, 147 insertions(+), 254 deletions(-)

Patch is too large, so refusing to show it
