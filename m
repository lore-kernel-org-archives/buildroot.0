From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  3 Dec 2017 21:18:14 +0300
Subject: [Buildroot] [PATCH v3 0/4] Add support for MacchiatoBin board
Message-ID: <20171203181818.10087-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
This is the second revision of the patchset adding support for MacchiatoBin
board. The most part of changes address review comments provided by
Baruch Siach and Arnout Vandecappelle. Besides, dts kernel patches by
Antoine T?nart has been added in order to enable networking on mainline
kernel and make the board more usable from the start.

Changes v1->v2
- update mv-ddr-marvell package: rename/cleanup
- update binary-marvell package: rename/cleanup
- update changes for atf package: cleanup
- update board readme.txt
- add example U-Boot environment
- bump Linux kernel version to 4.14
- add dts patches to enable networking on mainline U-Boot/kernel

Changes v2->v3
Resend due to patchwork issues
- rebase on top of master

Sergey Matyukevich (4):
  mv-ddr-marvell: new package
  binaries-marvell: new package
  atf: add support for Marvell Armada
  solidrun/macchiatobin: add new board


DEVELOPERS                                                                                       |   14 -
 board/solidrun/macchiatobin/genimage.cfg                                                         |   16 +
 board/solidrun/macchiatobin/linux-extras.config                                                  |    3 
 board/solidrun/macchiatobin/patches/linux/0001-arm64-dts-marvell-extend-cp110-syscon-regs.patch  |   38 +++
 board/solidrun/macchiatobin/patches/linux/0002-arm64-dts-marvell-add-comphy-nodes-on-cp110.patch |  111 ++++++++++
 board/solidrun/macchiatobin/patches/linux/0003-arm64-dts-marvell-mcbin-add-comphy.patch          |   52 ++++
 board/solidrun/macchiatobin/post-build.sh                                                        |    5 
 board/solidrun/macchiatobin/readme.txt                                                           |   82 +++++++
 board/solidrun/macchiatobin/uEnv-example.txt                                                     |    7 
 boot/Config.in                                                                                   |    2 
 boot/arm-trusted-firmware/arm-trusted-firmware.mk                                                |   11 
 boot/binaries-marvell/Config.in                                                                  |   29 ++
 boot/binaries-marvell/binaries-marvell.hash                                                      |    2 
 boot/binaries-marvell/binaries-marvell.mk                                                        |   19 +
 boot/mv-ddr-marvell/Config.in                                                                    |    7 
 boot/mv-ddr-marvell/mv-ddr-marvell.hash                                                          |    2 
 boot/mv-ddr-marvell/mv-ddr-marvell.mk                                                            |   18 +
 configs/solidrun_macchiatobin_mainline_defconfig                                                 |   45 ++++
 configs/solidrun_macchiatobin_marvell_defconfig                                                  |   45 ++++
 19 files changed, 504 insertions(+), 4 deletions(-)
