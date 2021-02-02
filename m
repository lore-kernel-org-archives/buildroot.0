From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  2 Feb 2021 23:53:13 +0100
Subject: [Buildroot] [PATCH 00/25] Autobuilder toolchain updates
Message-ID: <20210202225339.2157480-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This long (and boring) series of patches does two things:

 (1) Switch our autobuilder toolchain configurations to use Bootlin
     toolchains instead of the older pre-built external toolchains
     built specifically for autobuilder testing. The Bootlin
     toolchains are more regularly maintained, and it makes sense to
     test them some more.

     We do this change for all configurations where a corresponding
     Bootlin toolchain exists.

     There are a few toolchain configurations that continue to use
     those pre-built external toolchains, mainly for "special"
     configurations (no thread, no C++, etc.).

 (2) Update the remaining pre-built Buildroot toolchains to 2020.11.2,
     as I've recently done a rebuild of those toolchains.

Best regards,

Thomas Petazzoni

Thomas Petazzoni (25):
  support/config-fragments/autobuild: use Bootlin toolchain for AArch64
    glibc
  support/config-fragments/autobuild: use Bootlin toolchain for ARCle
    HS38 uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for ARMv5
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for ARMv7
    glibc
  support/config-fragments/autobuild: use Bootlin toolchain for ARMv7
    musl
  support/config-fragments/autobuild: use Bootlin toolchain for ARMv7-M
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for m68k
    68040 uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for m68k
    5208 uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for
    Microblaze EL uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for
    mipsel32r6 glibc
  support/config-fragments/autobuild: use Bootlin toolchain for mipsel
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for NIOS2
    glibc
  support/config-fragments/autobuild: use Bootlin toolchain for OpenRISC
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for
    PowerPC64le Power8 glibc
  support/config-fragments/autobuild: use Bootlin toolchain for PowerPC
    e500mc uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for RISC-V
    32 glibc
  support/config-fragments/autobuild: use Bootlin toolchain for RISC-V
    64 glibc
  support/config-fragments/autobuild: use Bootlin toolchain for RISC-V
    64 musl
  support/config-fragments/autobuild: use Bootlin toolchain for SH4
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for SPARC
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for SPARC64
    glibc
  support/config-fragments/autobuild: use Bootlin toolchain for x86-64
    uclibc
  support/config-fragments/autobuild: use Bootlin toolchain for x86-64
    musl
  support/config-fragments/autobuild: use Bootlin toolchain for Xtensa
    uclibc
  support/config-fragments/autobuild: update Buildroot toolchains to
    2020.11.2

 .../autobuild/bootlin-aarch64-glibc.config    |  4 ++
 .../bootlin-arcle-hs38-uclibc.config          |  5 ++
 .../autobuild/bootlin-armv5-uclibc.config     |  4 ++
 .../autobuild/bootlin-armv7-glibc.config      |  6 +++
 .../autobuild/bootlin-armv7-musl.config       |  6 +++
 .../autobuild/bootlin-armv7m-uclibc.config    |  4 ++
 .../autobuild/bootlin-m68k-5208-uclibc.config |  4 ++
 .../bootlin-m68k-68040-uclibc.config          |  4 ++
 .../bootlin-microblazeel-uclibc.config        |  3 ++
 .../autobuild/bootlin-mipsel-uclibc.config    |  4 ++
 .../autobuild/bootlin-mipsel32r6-glibc.config |  6 +++
 .../autobuild/bootlin-nios2-glibc.config      |  4 ++
 .../autobuild/bootlin-openrisc-uclibc.config  |  3 ++
 .../bootlin-powerpc-e500mc-uclibc.config      |  4 ++
 .../bootlin-powerpc64le-power8-glibc.config   |  4 ++
 .../autobuild/bootlin-riscv32-glibc.config    |  5 ++
 .../autobuild/bootlin-riscv64-glibc.config    |  5 ++
 .../autobuild/bootlin-riscv64-musl.config     |  4 ++
 .../autobuild/bootlin-sh4-uclibc.config       |  4 ++
 .../autobuild/bootlin-sparc-uclibc.config     |  3 ++
 .../autobuild/bootlin-sparc64-glibc.config    |  3 ++
 .../autobuild/bootlin-x86-64-musl.config      |  4 ++
 .../autobuild/bootlin-x86-64-uclibc.config    |  4 ++
 .../autobuild/bootlin-xtensa-uclibc.config    |  3 ++
 .../autobuild/br-aarch64-glibc.config         |  9 ----
 .../autobuild/br-arcle-hs38.config            | 11 -----
 .../autobuild/br-arm-basic.config             |  6 +--
 .../autobuild/br-arm-cortex-a9-glibc.config   | 11 -----
 .../autobuild/br-arm-cortex-a9-musl.config    | 11 -----
 .../autobuild/br-arm-cortex-m4-full.config    | 12 -----
 .../autobuild/br-arm-full-nothread.config     |  6 +--
 .../autobuild/br-arm-full-static.config       |  4 +-
 .../autobuild/br-arm-full.config              | 10 ----
 .../autobuild/br-i386-pentium-mmx-musl.config |  4 +-
 .../autobuild/br-i386-pentium4-full.config    |  4 +-
 .../autobuild/br-m68k-5208-full.config        | 11 -----
 .../autobuild/br-m68k-68040-full.config       | 10 ----
 .../autobuild/br-microblazeel-full.config     |  9 ----
 .../autobuild/br-mips32r6-el-hf-glibc.config  | 11 -----
 .../autobuild/br-mips64-n64-full.config       |  6 +--
 .../autobuild/br-mips64r6-el-hf-glibc.config  |  6 +--
 .../autobuild/br-mipsel-o32-full.config       | 10 ----
 .../autobuild/br-nios2-glibc.config           |  9 ----
 .../autobuild/br-openrisc-uclibc.config       |  9 ----
 .../br-powerpc-603e-basic-cpp.config          |  6 +--
 .../autobuild/br-powerpc-e500mc-full.config   | 11 -----
 .../br-powerpc64-power7-glibc.config          |  6 +--
 .../br-powerpc64le-power8-glibc.config        |  9 ----
 .../autobuild/br-riscv32.config               |  9 ----
 .../autobuild/br-riscv64-musl.config          |  9 ----
 .../autobuild/br-riscv64.config               |  8 ----
 .../autobuild/br-sh4-full.config              | 10 ----
 .../autobuild/br-sparc-uclibc.config          |  9 ----
 .../autobuild/br-sparc64-glibc.config         |  8 ----
 .../autobuild/br-x86-64-core2-full.config     | 11 -----
 .../autobuild/br-x86-64-musl.config           | 10 ----
 .../autobuild/br-xtensa-full.config           |  9 ----
 .../autobuild/toolchain-configs.csv           | 48 +++++++++----------
 58 files changed, 148 insertions(+), 284 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-aarch64-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-armv5-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7-musl.config
 create mode 100644 support/config-fragments/autobuild/bootlin-armv7m-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-m68k-68040-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-nios2-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-riscv32-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-riscv64-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-riscv64-musl.config
 create mode 100644 support/config-fragments/autobuild/bootlin-sh4-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-sparc-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-sparc64-glibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-x86-64-musl.config
 create mode 100644 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config
 create mode 100644 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config
 delete mode 100644 support/config-fragments/autobuild/br-aarch64-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arcle-hs38.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-a9-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-cortex-m4-full.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-full.config
 delete mode 100644 support/config-fragments/autobuild/br-m68k-5208-full.config
 delete mode 100644 support/config-fragments/autobuild/br-m68k-68040-full.config
 delete mode 100644 support/config-fragments/autobuild/br-microblazeel-full.config
 delete mode 100644 support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-mipsel-o32-full.config
 delete mode 100644 support/config-fragments/autobuild/br-nios2-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-openrisc-uclibc.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc-e500mc-full.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc64le-power8-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv32.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64.config
 delete mode 100644 support/config-fragments/autobuild/br-sh4-full.config
 delete mode 100644 support/config-fragments/autobuild/br-sparc-uclibc.config
 delete mode 100644 support/config-fragments/autobuild/br-sparc64-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-x86-64-core2-full.config
 delete mode 100644 support/config-fragments/autobuild/br-x86-64-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-xtensa-full.config

-- 
2.29.2
