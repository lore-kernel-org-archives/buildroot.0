From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 29 Jun 2016 12:04:27 +0100
Subject: [Buildroot] [PATCH 0/8] Re-organize Qemu MIPS defconfigs
Message-ID: <1467198275-46657-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch renames the existing Qemu MIPS defconfigs in order to have a
name format that allows a better organization if more defconfigs are
added for different MIPS variants.

After that it adds Qemu MIPS defconfigs for mips-32r6 and mips-64r6,
both big and little endian.

Vicente Olivert Riera (8):
  qemu_mips_malta_defconfig: move to qemu_mips_32r2_malta_defconfig
  qemu_mipsel_malta_defconfig: move to qemu_mipsel_32r2_malta_defconfig
  qemu_mips64_malta_defconfig: move to qemu_mips_64_malta_defconfig
  qemu_mips64el_malta_defconfig: move to qemu_mipsel_64_malta_defconfig
  Add qemu_mips_32r6_malta_defconfig
  Add qemu_mipsel_32r6_malta_defconfig
  Add qemu_mips_64r6_malta_defconfig
  Add qemu_mipsel_64r6_malta_defconfig

 .../linux-4.6.config                               |  0
 .../{mips-malta => mips-32r2-malta}/readme.txt     |  0
 board/qemu/mips-32r6-malta/linux-4.6.config        | 30 +++++++++++++++++++
 board/qemu/mips-32r6-malta/readme.txt              |  7 +++++
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 25 ++++++++++++++++
 .../linux-4.6.config                               |  0
 .../{mips64-malta => mips-64-malta}/readme.txt     |  0
 board/qemu/mips-64r6-malta/linux-4.6.config        | 34 ++++++++++++++++++++++
 board/qemu/mips-64r6-malta/readme.txt              |  7 +++++
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 25 ++++++++++++++++
 .../linux-4.6.config                               |  0
 .../{mipsel-malta => mipsel-32r2-malta}/readme.txt |  0
 board/qemu/mipsel-32r6-malta/linux-4.6.config      | 30 +++++++++++++++++++
 board/qemu/mipsel-32r6-malta/readme.txt            |  7 +++++
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 25 ++++++++++++++++
 .../linux-4.6.config                               |  0
 .../{mips64el-malta => mipsel-64-malta}/readme.txt |  0
 board/qemu/mipsel-64r6-malta/linux-4.6.config      | 34 ++++++++++++++++++++++
 board/qemu/mipsel-64r6-malta/readme.txt            |  7 +++++
 ...oration-of-MSA-context-in-non-MSA-kernels.patch | 25 ++++++++++++++++
 ...ta_defconfig => qemu_mips_32r2_malta_defconfig} |  2 +-
 configs/qemu_mips_32r6_malta_defconfig             | 31 ++++++++++++++++++++
 ...alta_defconfig => qemu_mips_64_malta_defconfig} |  2 +-
 configs/qemu_mips_64r6_malta_defconfig             | 32 ++++++++++++++++++++
 ..._defconfig => qemu_mipsel_32r2_malta_defconfig} |  2 +-
 configs/qemu_mipsel_32r6_malta_defconfig           | 31 ++++++++++++++++++++
 ...ta_defconfig => qemu_mipsel_64_malta_defconfig} |  2 +-
 configs/qemu_mipsel_64r6_malta_defconfig           | 32 ++++++++++++++++++++
 28 files changed, 386 insertions(+), 4 deletions(-)
 rename board/qemu/{mips-malta => mips-32r2-malta}/linux-4.6.config (100%)
 rename board/qemu/{mips-malta => mips-32r2-malta}/readme.txt (100%)
 create mode 100644 board/qemu/mips-32r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mips-32r6-malta/readme.txt
 create mode 100644 board/qemu/mips-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
 rename board/qemu/{mips64-malta => mips-64-malta}/linux-4.6.config (100%)
 rename board/qemu/{mips64-malta => mips-64-malta}/readme.txt (100%)
 create mode 100644 board/qemu/mips-64r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mips-64r6-malta/readme.txt
 create mode 100644 board/qemu/mips-64r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
 rename board/qemu/{mipsel-malta => mipsel-32r2-malta}/linux-4.6.config (100%)
 rename board/qemu/{mipsel-malta => mipsel-32r2-malta}/readme.txt (100%)
 create mode 100644 board/qemu/mipsel-32r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mipsel-32r6-malta/readme.txt
 create mode 100644 board/qemu/mipsel-32r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
 rename board/qemu/{mips64el-malta => mipsel-64-malta}/linux-4.6.config (100%)
 rename board/qemu/{mips64el-malta => mipsel-64-malta}/readme.txt (100%)
 create mode 100644 board/qemu/mipsel-64r6-malta/linux-4.6.config
 create mode 100644 board/qemu/mipsel-64r6-malta/readme.txt
 create mode 100644 board/qemu/mipsel-64r6-malta/v2-MIPS-Prevent-restoration-of-MSA-context-in-non-MSA-kernels.patch
 rename configs/{qemu_mips_malta_defconfig => qemu_mips_32r2_malta_defconfig} (85%)
 create mode 100644 configs/qemu_mips_32r6_malta_defconfig
 rename configs/{qemu_mips64_malta_defconfig => qemu_mips_64_malta_defconfig} (86%)
 create mode 100644 configs/qemu_mips_64r6_malta_defconfig
 rename configs/{qemu_mipsel_malta_defconfig => qemu_mipsel_32r2_malta_defconfig} (85%)
 create mode 100644 configs/qemu_mipsel_32r6_malta_defconfig
 rename configs/{qemu_mips64el_malta_defconfig => qemu_mipsel_64_malta_defconfig} (86%)
 create mode 100644 configs/qemu_mipsel_64r6_malta_defconfig

-- 
2.7.3
