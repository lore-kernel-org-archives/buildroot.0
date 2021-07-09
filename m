From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Fri,  9 Jul 2021 15:36:32 +0900
Subject: [Buildroot] [PATCH 0/9] Add RISC-V NOMMU and Canaan K210 SoC support
Message-ID: <20210709063641.277005-1-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds support for building RISC-V NOMMU kernel bootable
images for boards using the Cannan Kendryte K210 SoC.

The first patch makes MMU builds optional for RISC-V. The second patch
enables RV64 support in elf2flt (patch sent to uclinux-dev). The third
patch changes the base name of the toolchain to avoid build errors.

The following 5 patches add default build configuration files for
various boards: MAIX-bit, MAIX-go, MAIX-dock (Dan Dock) and MAIXDUINO
from Sipeed and the Canaan KD233 development board.

Finally, patch 9 documents how to build and install images for these
boards.

Christoph Hellwig (2):
  package/elf2flt: add RISC-V support
  package make: build RISC-V nommu builds as linux

Damien Le Moal (7):
  arch/config: Make RISC-V MMU optional
  board: Add Sipeed MAIX-bit support
  board: Add Sipeed MAIX-Go support
  board: Add Sipeed MAIXDUINO support
  board: Add Sipeed MAIX-Dock support
  board: Add Canaan KD233 support
  board: Document Canaan K210 based boards support

 arch/Config.in                                |    2 +-
 board/canaan/k210-common/README.md            |  318 +++++
 .../k210-common/busybox-tiny-initramfs.config | 1183 +++++++++++++++++
 .../k210-common/rootfs_overlay/usr/sbin/init  |   26 +
 board/canaan/kd233/README.md                  |    4 +
 board/canaan/kd233/linux-dtb.config           |    2 +
 board/sipeed/maix-bit/README.md               |    4 +
 board/sipeed/maix-bit/linux-dtb.config        |    2 +
 board/sipeed/maix-dock/README.md              |    4 +
 board/sipeed/maix-dock/linux-dtb.config       |    2 +
 board/sipeed/maix-go/README.md                |    4 +
 board/sipeed/maix-go/linux-dtb.config         |    2 +
 board/sipeed/maixduino/README.md              |    4 +
 board/sipeed/maixduino/linux-dtb.config       |    2 +
 configs/canaan_kd233_defconfig                |   23 +
 configs/canaan_kd233_sdcard_defconfig         |   23 +
 configs/sipeed_maix_bit_defconfig             |   23 +
 configs/sipeed_maix_bit_sdcard_defconfig      |   23 +
 configs/sipeed_maix_dock_defconfig            |   23 +
 configs/sipeed_maix_dock_sdcard_defconfig     |   23 +
 configs/sipeed_maix_go_defconfig              |   23 +
 configs/sipeed_maix_go_sdcard_defconfig       |   23 +
 configs/sipeed_maixduino_defconfig            |   23 +
 configs/sipeed_maixduino_sdcard_defconfig     |   23 +
 package/Makefile.in                           |    7 +-
 .../0004-elf2flt-add-riscv-support.patch      |  293 ++++
 package/elf2flt/Config.in.host                |    2 +-
 27 files changed, 2088 insertions(+), 3 deletions(-)
 create mode 100644 board/canaan/k210-common/README.md
 create mode 100644 board/canaan/k210-common/busybox-tiny-initramfs.config
 create mode 100755 board/canaan/k210-common/rootfs_overlay/usr/sbin/init
 create mode 100644 board/canaan/kd233/README.md
 create mode 100644 board/canaan/kd233/linux-dtb.config
 create mode 100644 board/sipeed/maix-bit/README.md
 create mode 100644 board/sipeed/maix-bit/linux-dtb.config
 create mode 100644 board/sipeed/maix-dock/README.md
 create mode 100644 board/sipeed/maix-dock/linux-dtb.config
 create mode 100644 board/sipeed/maix-go/README.md
 create mode 100644 board/sipeed/maix-go/linux-dtb.config
 create mode 100644 board/sipeed/maixduino/README.md
 create mode 100644 board/sipeed/maixduino/linux-dtb.config
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/canaan_kd233_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_bit_defconfig
 create mode 100644 configs/sipeed_maix_bit_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_dock_defconfig
 create mode 100644 configs/sipeed_maix_dock_sdcard_defconfig
 create mode 100644 configs/sipeed_maix_go_defconfig
 create mode 100644 configs/sipeed_maix_go_sdcard_defconfig
 create mode 100644 configs/sipeed_maixduino_defconfig
 create mode 100644 configs/sipeed_maixduino_sdcard_defconfig
 create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-support.patch

-- 
2.31.1
