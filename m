From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed,  1 Nov 2017 19:05:42 +0100
Subject: [Buildroot] [PATCH v5 00/11] board: Add Allwinner A64/H5 boards
Message-ID: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset fix wiki link and update dtb file for sopine board.
[1] was previous set.

All boards now use Mainline U-Boot, Linux and Nanaopi A64, A64-olinuxino
used linux-next patches since 4.13.7 have not been merged.

Tested on rea hardware.

Changes for v5:
- Fixed wiki links
- Update dtb file for sopine
Changes for v4:
- Added "arm-trusted-firmware: Build FIP for BL33" patch
- Added "uboot: Add U-Boot-bundles-ATF support" patch
- Droped sunxi64-post-build.sh config and script file
Changes for v3:
- Fixed Bananapi M1 comment on config file
- Add sunxi64-post-build.sh
- Add all sunxi64 boards
Changes for v2:
- Rebase on master

[1] http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v4-00-11-board-Add-Allwinner-A64-H5-boards-td178509.html

Jagan Teki (11):
  arm-trusted-firmware: Build FIP for BL33
  uboot: Add U-Boot-bundles-ATF support
  board: Add Bananapi M64 support
  board: Add Pine64 support
  board: Add SoPine support
  board: Add FriendlyARM Nanopi A64 support
  board: Add FriendlyARM Nanopi NEO2 support
  board: Add Olimex A64-OLinuXino support
  board: Add Orangepi Win/Win Plus support
  board: Add Orangepi Prime support
  board: Add Orangepi Zero Plus2 support

 .gitlab-ci.yml                                     |   9 +
 DEVELOPERS                                         |  16 ++
 board/bananapi/bananapi-m64/boot.cmd               |   6 +
 board/bananapi/bananapi-m64/genimage.cfg           |  38 +++
 board/bananapi/bananapi-m64/readme.txt             |  37 +++
 board/friendlyarm/nanopi-a64/boot.cmd              |   6 +
 board/friendlyarm/nanopi-a64/genimage.cfg          |  38 +++
 board/friendlyarm/nanopi-a64/linux_axp.fragment    |   3 +
 ...nner-a64-add-NMI-R_INTC-controller-on-A64.patch |  41 ++++
 ...lwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch | 176 ++++++++++++++
 ...winner-a64-Add-initial-NanoPi-A64-support.patch | 254 +++++++++++++++++++++
 board/friendlyarm/nanopi-a64/readme.txt            |  37 +++
 board/friendlyarm/nanopi-neo2/boot.cmd             |   6 +
 board/friendlyarm/nanopi-neo2/genimage.cfg         |  38 +++
 board/friendlyarm/nanopi-neo2/readme.txt           |  37 +++
 board/olimex/a64-olinuxino/boot.cmd                |   6 +
 board/olimex/a64-olinuxino/genimage.cfg            |  38 +++
 board/olimex/a64-olinuxino/linux_axp.fragment      |   3 +
 ...nner-a64-add-NMI-R_INTC-controller-on-A64.patch |  41 ++++
 ...lwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch | 176 ++++++++++++++
 ...nner-a64-Add-A64-OLinuXino-initial-suppor.patch | 244 ++++++++++++++++++++
 board/olimex/a64-olinuxino/readme.txt              |  37 +++
 board/orangepi/orangepi-prime/boot.cmd             |   6 +
 board/orangepi/orangepi-prime/genimage.cfg         |  38 +++
 board/orangepi/orangepi-prime/readme.txt           |  37 +++
 board/orangepi/orangepi-win/boot.cmd               |   6 +
 board/orangepi/orangepi-win/genimage.cfg           |  38 +++
 board/orangepi/orangepi-win/readme.txt             |  37 +++
 board/orangepi/orangepi-zero-plus2/boot.cmd        |   6 +
 board/orangepi/orangepi-zero-plus2/genimage.cfg    |  38 +++
 board/orangepi/orangepi-zero-plus2/readme.txt      |  37 +++
 board/pine64/pine64/boot.cmd                       |   6 +
 board/pine64/pine64/genimage.cfg                   |  38 +++
 board/pine64/pine64/readme.txt                     |  38 +++
 board/pine64/sopine/boot.cmd                       |   6 +
 board/pine64/sopine/genimage.cfg                   |  38 +++
 board/pine64/sopine/readme.txt                     |  38 +++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  |  12 +-
 boot/uboot/Config.in                               |  10 +
 boot/uboot/uboot.mk                                |   5 +
 configs/bananapi_m64_defconfig                     |  47 ++++
 configs/friendlyarm_nanopi_a64_defconfig           |  51 +++++
 configs/friendlyarm_nanopi_neo2_defconfig          |  47 ++++
 configs/olimex_a64_olinuxino_defconfig             |  51 +++++
 configs/orangepi_prime_defconfig                   |  47 ++++
 configs/orangepi_win_defconfig                     |  47 ++++
 configs/orangepi_zero_plus2_defconfig              |  47 ++++
 configs/pine64_defconfig                           |  47 ++++
 configs/pine64_sopine_defconfig                    |  47 ++++
 49 files changed, 2149 insertions(+), 3 deletions(-)
 create mode 100644 board/bananapi/bananapi-m64/boot.cmd
 create mode 100644 board/bananapi/bananapi-m64/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m64/readme.txt
 create mode 100644 board/friendlyarm/nanopi-a64/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-a64/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-a64/linux_axp.fragment
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0003-arm64-allwinner-a64-Add-initial-NanoPi-A64-support.patch
 create mode 100644 board/friendlyarm/nanopi-a64/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo2/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 board/olimex/a64-olinuxino/boot.cmd
 create mode 100644 board/olimex/a64-olinuxino/genimage.cfg
 create mode 100644 board/olimex/a64-olinuxino/linux_axp.fragment
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch
 create mode 100644 board/olimex/a64-olinuxino/patches/linux/linux-0003-arm64-allwinner-a64-Add-A64-OLinuXino-initial-suppor.patch
 create mode 100644 board/olimex/a64-olinuxino/readme.txt
 create mode 100644 board/orangepi/orangepi-prime/boot.cmd
 create mode 100644 board/orangepi/orangepi-prime/genimage.cfg
 create mode 100644 board/orangepi/orangepi-prime/readme.txt
 create mode 100644 board/orangepi/orangepi-win/boot.cmd
 create mode 100644 board/orangepi/orangepi-win/genimage.cfg
 create mode 100644 board/orangepi/orangepi-win/readme.txt
 create mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 create mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg
 create mode 100644 board/orangepi/orangepi-zero-plus2/readme.txt
 create mode 100644 board/pine64/pine64/boot.cmd
 create mode 100644 board/pine64/pine64/genimage.cfg
 create mode 100644 board/pine64/pine64/readme.txt
 create mode 100644 board/pine64/sopine/boot.cmd
 create mode 100644 board/pine64/sopine/genimage.cfg
 create mode 100644 board/pine64/sopine/readme.txt
 create mode 100644 configs/bananapi_m64_defconfig
 create mode 100644 configs/friendlyarm_nanopi_a64_defconfig
 create mode 100644 configs/friendlyarm_nanopi_neo2_defconfig
 create mode 100644 configs/olimex_a64_olinuxino_defconfig
 create mode 100644 configs/orangepi_prime_defconfig
 create mode 100644 configs/orangepi_win_defconfig
 create mode 100644 configs/orangepi_zero_plus2_defconfig
 create mode 100644 configs/pine64_defconfig
 create mode 100644 configs/pine64_sopine_defconfig

-- 
1.9.1
