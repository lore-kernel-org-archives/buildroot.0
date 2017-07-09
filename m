From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun,  9 Jul 2017 05:21:54 -0700
Subject: [Buildroot] [PATCH v2 0/7] xtensa overlay application rework
Message-ID: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series cleans up xtensa overlay application code, making
it uniform across its users in the toolchain, reducing the number of
configuration variables and making it possible to use compressed
overlays and download overlays from network.

Changes v1->v2:
- drop arch-xtensa-overlay and host-arch-xtensa-overlay macros, use
  arch-xtensa-overlay-extract directly in package makefiles.

Max Filippov (2):
  linux: apply xtensa overlay
  uboot: apply xtensa overlay

Yann E. MORIN (5):
  arch/xtensa: get rid of an intermediate blind kconfig option
  arch/xtensa: allow specifying path to tarball file
  arch/xtensa: accept the overlay to be compressed
  arch/xtensa: accept the overlay to be an URL
  configs/qemu-xtensa: use overlay from the github repository

 Config.in.legacy                         |  23 +++++++++++++++++++++++
 arch/Config.in.xtensa                    |  27 ++++++++++-----------------
 arch/arch.mk.xtensa                      |  30 +++++++++++++++++++-----------
 board/qemu/xtensa-lx60/xtensa_dc233c.tar | Bin 808960 -> 0 bytes
 boot/uboot/uboot.mk                      |   8 ++++++++
 configs/qemu_xtensa_lx60_defconfig       |   4 +---
 configs/qemu_xtensa_lx60_nommu_defconfig |   4 +---
 linux/linux.mk                           |   8 ++++++++
 package/binutils/binutils.mk             |   4 +++-
 package/gcc/gcc-final/gcc-final.mk       |   3 ++-
 package/gcc/gcc-initial/gcc-initial.mk   |   3 ++-
 package/gdb/gdb.mk                       |   4 +++-
 12 files changed, 80 insertions(+), 38 deletions(-)
 delete mode 100644 board/qemu/xtensa-lx60/xtensa_dc233c.tar

-- 
2.1.4
