From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 20 Dec 2017 10:53:29 +0100
Subject: [Buildroot] [PATCH v6 00/10] board: Add Allwinner A64/H5 boards
Message-ID: <1513763619-15725-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset rebased all ATF changes which are present in mainline
and also added u-boot size field in genimage.cfg

All boards now use Mainline U-Boot v2017.11 and Linux 4.14

Changes for v6:
- Bump u-boot to v2017.11
- Bump Linux to 4.14
- Droped Linux patches for few boards which are available in 4.14
- Add size field in genimage.cfg
- Add ATF BL31 config options
- Add orangepi pc2 which is H5 family
- Add Linux sdcard fix patch from mainline
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

[1] http://patchwork.ozlabs.org/cover/833068/

Jagan Teki (10):
  board: Add Bananapi M64 support
  board: Add Pine64 support
  board: Add SoPine support
  board: Add FriendlyARM Nanopi A64 support
  board: Add FriendlyARM Nanopi NEO2 support
  board: Add Olimex A64-OLinuXino support
  board: Add Orangepi Win/Win Plus support
  board: Add Orangepi Prime support
  board: Add Orangepi Zero Plus2 support
  board: Add Orangepi PC2 support

 .gitlab-ci.yml                                     | 10 +++++
 DEVELOPERS                                         | 18 ++++++++
 board/bananapi/bananapi-m64/boot.cmd               |  6 +++
 board/bananapi/bananapi-m64/genimage.cfg           | 39 +++++++++++++++++
 board/bananapi/bananapi-m64/readme.txt             | 37 ++++++++++++++++
 board/friendlyarm/nanopi-a64/boot.cmd              |  6 +++
 board/friendlyarm/nanopi-a64/genimage.cfg          | 39 +++++++++++++++++
 board/friendlyarm/nanopi-a64/readme.txt            | 37 ++++++++++++++++
 board/friendlyarm/nanopi-neo2/boot.cmd             |  6 +++
 board/friendlyarm/nanopi-neo2/genimage.cfg         | 39 +++++++++++++++++
 board/friendlyarm/nanopi-neo2/readme.txt           | 37 ++++++++++++++++
 board/olimex/a64-olinuxino/boot.cmd                |  6 +++
 board/olimex/a64-olinuxino/genimage.cfg            | 39 +++++++++++++++++
 board/olimex/a64-olinuxino/readme.txt              | 37 ++++++++++++++++
 board/orangepi/orangepi-pc2/boot.cmd               |  6 +++
 board/orangepi/orangepi-pc2/genimage.cfg           | 39 +++++++++++++++++
 board/orangepi/orangepi-pc2/readme.txt             | 37 ++++++++++++++++
 board/orangepi/orangepi-prime/boot.cmd             |  6 +++
 board/orangepi/orangepi-prime/genimage.cfg         | 39 +++++++++++++++++
 board/orangepi/orangepi-prime/readme.txt           | 37 ++++++++++++++++
 board/orangepi/orangepi-win/boot.cmd               |  6 +++
 board/orangepi/orangepi-win/genimage.cfg           | 39 +++++++++++++++++
 board/orangepi/orangepi-win/readme.txt             | 37 ++++++++++++++++
 board/orangepi/orangepi-zero-plus2/boot.cmd        |  6 +++
 board/orangepi/orangepi-zero-plus2/genimage.cfg    | 39 +++++++++++++++++
 ...ts-orange-pi-zero-plus2-fix-sdcard-detect.patch | 30 +++++++++++++
 board/orangepi/orangepi-zero-plus2/readme.txt      | 37 ++++++++++++++++
 board/pine64/pine64/boot.cmd                       |  6 +++
 board/pine64/pine64/genimage.cfg                   | 39 +++++++++++++++++
 board/pine64/pine64/readme.txt                     | 38 ++++++++++++++++
 board/pine64/sopine/boot.cmd                       |  6 +++
 board/pine64/sopine/genimage.cfg                   | 39 +++++++++++++++++
 board/pine64/sopine/readme.txt                     | 38 ++++++++++++++++
 configs/bananapi_m64_defconfig                     | 47 ++++++++++++++++++++
 configs/friendlyarm_nanopi_a64_defconfig           | 47 ++++++++++++++++++++
 configs/friendlyarm_nanopi_neo2_defconfig          | 47 ++++++++++++++++++++
 configs/olimex_a64_olinuxino_defconfig             | 47 ++++++++++++++++++++
 configs/orangepi_pc2_defconfig                     | 47 ++++++++++++++++++++
 configs/orangepi_prime_defconfig                   | 47 ++++++++++++++++++++
 configs/orangepi_win_defconfig                     | 47 ++++++++++++++++++++
 configs/orangepi_zero_plus2_defconfig              | 50 ++++++++++++++++++++++
 configs/pine64_defconfig                           | 47 ++++++++++++++++++++
 configs/pine64_sopine_defconfig                    | 47 ++++++++++++++++++++
 43 files changed, 1353 insertions(+)
 create mode 100644 board/bananapi/bananapi-m64/boot.cmd
 create mode 100644 board/bananapi/bananapi-m64/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m64/readme.txt
 create mode 100644 board/friendlyarm/nanopi-a64/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-a64/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-a64/readme.txt
 create mode 100644 board/friendlyarm/nanopi-neo2/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-neo2/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-neo2/readme.txt
 create mode 100644 board/olimex/a64-olinuxino/boot.cmd
 create mode 100644 board/olimex/a64-olinuxino/genimage.cfg
 create mode 100644 board/olimex/a64-olinuxino/readme.txt
 create mode 100644 board/orangepi/orangepi-pc2/boot.cmd
 create mode 100644 board/orangepi/orangepi-pc2/genimage.cfg
 create mode 100644 board/orangepi/orangepi-pc2/readme.txt
 create mode 100644 board/orangepi/orangepi-prime/boot.cmd
 create mode 100644 board/orangepi/orangepi-prime/genimage.cfg
 create mode 100644 board/orangepi/orangepi-prime/readme.txt
 create mode 100644 board/orangepi/orangepi-win/boot.cmd
 create mode 100644 board/orangepi/orangepi-win/genimage.cfg
 create mode 100644 board/orangepi/orangepi-win/readme.txt
 create mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 create mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg
 create mode 100644 board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch
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
 create mode 100644 configs/orangepi_pc2_defconfig
 create mode 100644 configs/orangepi_prime_defconfig
 create mode 100644 configs/orangepi_win_defconfig
 create mode 100644 configs/orangepi_zero_plus2_defconfig
 create mode 100644 configs/pine64_defconfig
 create mode 100644 configs/pine64_sopine_defconfig

-- 
1.9.1
