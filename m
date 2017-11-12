From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 12 Nov 2017 23:16:41 +0300
Subject: [Buildroot] [PATCH/next 0/5] Add support for MacchiatoBin board
Message-ID: <20171112201646.15558-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patchset adds support for SolidRun MacchiatoBin board based on
Marvell Armada 8040 SoC. For convenience the following two different
build configurations are added:

- mainline BSP
  mainline Linux v4.13.11 and U-Boot v2017.09

- vendor BSP (enables more hardware)
  BSP from Marvell based on Linux 4.4.52 and U-Boot v2017.03

Patches are rebased on top of next branch.

Regards,
Sergey

Sergey Matyukevich (5):
  armada-firmware: new package
  armada-ddr: new package
  atf: add support for Marvell Armada SoCs
  solidrun/macchiatobin: add new board
  DEVELOPERS: add myself to MacchiatoBin releated packages

 DEVELOPERS                                        |    6 +
 board/solidrun/macchiatobin/genimage.cfg          |   16 +++++
 board/solidrun/macchiatobin/readme.txt            |   70 ++++++++++++++++++++++
 boot/Config.in                                    |    2 
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |   13 ++++
 boot/armada-ddr/Config.in                         |   16 +++++
 boot/armada-ddr/armada-ddr.hash                   |    2 
 boot/armada-ddr/armada-ddr.mk                     |   20 ++++++
 boot/armada-firmware/Config.in                    |   19 +++++
 boot/armada-firmware/armada-firmware.hash         |    2 
 boot/armada-firmware/armada-firmware.mk           |   18 +++++
 configs/solidrun_macchiatobin_mainline_defconfig  |   46 ++++++++++++++
 configs/solidrun_macchiatobin_marvell_defconfig   |   48 +++++++++++++++
 13 files changed, 278 insertions(+)
