From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 21 Sep 2019 18:00:04 +0300
Subject: [Buildroot] [PATCH 0/5] Bump BSP versions for Marvell A8K boards
Message-ID: <20190921150009.3267612-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Baruch, and all,

These patches update mainline BSP components for Marvell A8K boards.
Vendor packages such as binaries-marvell and mv-ddr-marvell are updated
as well. Note that updated binaries-marvell package provides common
firmware supporting both A7K and A8K. So no need to specify platform
for binaries-marvell anymore.

Images for MacchiatoBin defconfigs have been tested on hardware. 
As for clearfog_gt_8k board, I don't have access to hardware,
so only build test has been completed.

Regards,
Sergey

Sergey Matyukevich (5):
  binaries-marvell: bump version and use common firmware
  boot/mv-ddr-marvell: bump version to armada-18.12
  configs/solidrun_clearfog_gt_8k: bump versions of BSP components
  configs/solidrun_macchiatobin_mainline: bump versions of BSP components
  configs/solidrun_macchiatobin_marvell: drop platform for Marvell binaries

 boot/binaries-marvell/Config.in               | 22 +------------------
 boot/binaries-marvell/binaries-marvell.hash   |  4 ++--
 boot/binaries-marvell/binaries-marvell.mk     |  6 ++---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash       |  2 +-
 boot/mv-ddr-marvell/mv-ddr-marvell.mk         |  4 ++--
 configs/solidrun_clearfog_gt_8k_defconfig     | 11 +++++-----
 configs/solidrun_macchiatobin_mainline_defconfig  | 11 +++++-----
 configs/solidrun_macchiatobin_marvell_defconfig   |  1 -
 8 files changed, 19 insertions(+), 42 deletions(-)

-- 
2.23.0
