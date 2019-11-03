From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Nov 2019 17:55:53 +0300
Subject: [Buildroot] [PATCH 0/9] bump BSP for several allwinner boards
Message-ID: <20191103145602.1332350-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Thomas, and all,

This patch series bumps kernel and U-Boot versions for several
boards based on allwinner chips. Kernel upgrade for those boards
also requires bumping xr819 and rtl8189fs wireless drivers versions.

The following configs have been updated:
- orangepi-one
- orangepi-lite
- orangepi-zero
- orangepi-zero-plus2
- orangepi-pc
- orangepi-pc-plus
- linksprite-pcduino

Boot tests have been completed for all the boards except orangepi-pc
and orangepi-lite. But orangepi-pc and orangepi-lite are similar to
to orangepi-pc-plus and orangepi-one respectively, so there should
not be any surprises here.

BTW, strictly speaking, for bisectability, the wireless drivers patches
have to be combined with patches for the boards that make use of them:
- rtl8189fs + orangepi-pc-plus + orangepi-lite
- xr819 + orangepi-zero
However I opted to split patches on a per package basis. Let me know
if it makes sense to change and resubmit. 

This patch series fixes the following CI issues:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/339180879
- https://gitlab.com/buildroot.org/buildroot/-/jobs/339180848
- https://gitlab.com/buildroot.org/buildroot/-/jobs/339180884
- https://gitlab.com/buildroot.org/buildroot/-/jobs/339180878

Sergey Matyukevich (9):
  xr819-xradio: bump version to aa01ba77
  rtl8189fs: bump revision to 54bd6808
  orangepi-one: bump kernel and u-boot versions
  linksprite_pcduino: bump kernel and u-boot versions
  orangepi_zero: bump kernel and u-boot versions
  orangepi_zero_plus2: bump kernel and u-boot versions
  orangepi_pc: bump kernel and u-boot versions
  orangepi_pc_plus: bump kernel and u-boot versions
  orangepi_lite: bump kernel and u-boot versions

 configs/linksprite_pcduino_defconfig   | 8 ++++----
 configs/orangepi_lite_defconfig        | 6 +++---
 configs/orangepi_one_defconfig         | 6 +++---
 configs/orangepi_pc_defconfig          | 6 +++---
 configs/orangepi_pc_plus_defconfig     | 6 +++---
 configs/orangepi_zero_defconfig        | 6 +++---
 configs/orangepi_zero_plus2_defconfig  | 6 +++---
 package/rtl8189fs/rtl8189fs.hash       | 2 +-
 package/rtl8189fs/rtl8189fs.mk         | 2 +-
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 11 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.23.0
