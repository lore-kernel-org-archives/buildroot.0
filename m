From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Dec 2013 21:40:47 -0300
Subject: [Buildroot] [RFC PATCH 0/2] host-qemu-system
Message-ID: <1386117649-7119-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset provides a new host-qemu-system package intended to
solve the problematic "which qemu version works with this config?" dilemma.

Quick test would be a simple "make qemu_xxx_defconfig" with a "make
qemu-system-run" - everything should be silk smooth for the user.

TODO:
* Update documentation/readme.txt files to reflect varying alternatives.
  host-qemu-system is built with the basics provided by buildroot, hence only
  the basic text & curses interfaces are guaranteed to work.
  But if the host provides headers for SDL or other graphic toolkits these
  can be detected and picked up by the build thus giving alternative rendering
  methods for the user to use (to emulate a framebuffer for example).
* Cleanup my hacky qemu autotesting script and submit it if there's interest.

Gustavo Zacarias (2):
  qemu-system: new host package
  configs/qemu: update for host-qemu-system goodness

 board/qemu/arm-nuri/readme.txt             |  2 +-
 board/qemu/arm-versatile/readme.txt        |  2 +-
 board/qemu/arm-vexpress/readme.txt         |  2 +-
 board/qemu/microblazebe-mmu/readme.txt     |  2 +-
 board/qemu/microblazeel-mmu/readme.txt     |  2 +-
 board/qemu/mips-malta/readme.txt           |  2 +-
 board/qemu/mips64-malta/readme.txt         |  2 +-
 board/qemu/mips64el-malta/readme.txt       |  2 +-
 board/qemu/mipsel-malta/readme.txt         |  2 +-
 board/qemu/powerpc-g3beige/readme.txt      |  2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt    |  2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt |  2 +-
 board/qemu/sh4-r2d/readme.txt              |  2 +-
 board/qemu/sparc-ss10/readme.txt           |  2 +-
 board/qemu/x86/readme.txt                  |  2 +-
 board/qemu/x86_64/readme.txt               |  2 +-
 configs/qemu_arm_nuri_defconfig            |  4 ++
 configs/qemu_arm_versatile_defconfig       |  4 ++
 configs/qemu_arm_vexpress_defconfig        |  4 ++
 configs/qemu_microblazebe_mmu_defconfig    |  4 ++
 configs/qemu_microblazeel_mmu_defconfig    |  4 ++
 configs/qemu_mips64_malta_defconfig        |  4 ++
 configs/qemu_mips64el_malta_defconfig      |  4 ++
 configs/qemu_mips_malta_defconfig          |  4 ++
 configs/qemu_mipsel_malta_defconfig        |  4 ++
 configs/qemu_ppc_g3beige_defconfig         |  4 ++
 configs/qemu_ppc_mpc8544ds_defconfig       |  4 ++
 configs/qemu_ppc_virtex_ml507_defconfig    |  4 ++
 configs/qemu_sh4_r2d_defconfig             |  4 ++
 configs/qemu_sparc_ss10_defconfig          |  5 +++
 configs/qemu_x86_64_defconfig              |  4 ++
 configs/qemu_x86_defconfig                 |  4 ++
 package/Config.in.host                     |  1 +
 package/qemu-system/Config.in.host         | 30 ++++++++++++++
 package/qemu-system/qemu-system.mk         | 64 ++++++++++++++++++++++++++++++
 35 files changed, 176 insertions(+), 16 deletions(-)
 create mode 100644 package/qemu-system/Config.in.host
 create mode 100644 package/qemu-system/qemu-system.mk

-- 
1.8.3.2
