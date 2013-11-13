From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 15:28:43 -0600
Subject: [Buildroot] [PATCH v3 0/7] Add Microblaze internal toolchain
Message-ID: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a Microblaze internal toolchain from the sources at
http://github.com/Xilinx .

This series requires that the arc toolchain patches and github helper
patches are applied.

v2->v3:
  - Incorporated all review suggestions.
  - Rebased on arc v2 patches and github helper.

Spenser Gilliland (7):
  binutils: add microblaze internal toolchain
  gcc: add microblaze internal toolchain
  glibc: add microblaze internal toolchain
  gdb: add microblaze internal toolchain
  toolchain: enable microblaze toolchain
  toolchain: uclibc does not support microblze
  defconfigs: update microblaze defconfigs to use new toolchain

 configs/qemu_microblazebe_mmu_defconfig |    7 -------
 configs/qemu_microblazeel_mmu_defconfig |    7 -------
 package/binutils/Config.in.host         |    2 ++
 package/binutils/binutils.mk            |    4 ++++
 package/gcc/Config.in.host              |   23 +++++++++++++++--------
 package/gcc/gcc.mk                      |    3 +++
 package/gdb/Config.in.host              |    2 ++
 package/gdb/gdb.mk                      |    5 +++++
 package/glibc/glibc.mk                  |   12 ++++++++++++
 toolchain/Config.in                     |    2 +-
 toolchain/toolchain-buildroot/Config.in |    5 +++--
 11 files changed, 47 insertions(+), 25 deletions(-)
