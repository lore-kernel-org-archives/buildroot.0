From: Drew Fustini <drew@beagleboard.org>
Date: Mon, 14 Jun 2021 17:17:46 -0700
Subject: [Buildroot] [PATCH 0/4] beaglev: enable opensbi generic platform
Message-ID: <20210615001750.421889-1-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce BR2_TARGET_UBOOT_FORMAT_DTB to copy u-boot.dtb [1] to
BINARIES_DIR. This file can be used for FW_FDT_PATH [2] in OpenSBI build
when BR2_TARGET_OPENSBI_FW_FDT_PATH is enabled.
  
Update u-boot in beaglev_defconfig to new commit in starfive-tech repo
which enables CONFIG_OF_SEPARATE to build u-boot.dtb [3]. Finally switch
to upstream OpenSBI repo and use generic platform now that it supports
the console UART [4] on the BeagleV Starlight JH7100 board.
 
[1] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control
[2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
[3] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control
[4] https://github.com/riscv/opensbi/commit/e822b7504df0583a6a227d51cb7da8ea9fc79c0a

Drew Fustini (4):
  boot/uboot: introduce BR2_TARGET_UBOOT_FORMAT_DTB
  boot/opensbi: introduce BR2_TARGET_OPENSBI_FW_FDT_PATH
  configs/beaglev: update u-boot to enable OF_SEPARATE
  configs/beaglev: switch to upstream opensbi generic platform

 boot/opensbi/Config.in    | 10 ++++++++++
 boot/opensbi/opensbi.mk   |  3 +++
 boot/uboot/Config.in      |  3 +++
 boot/uboot/uboot.mk       |  4 ++++
 configs/beaglev_defconfig | 10 ++++++----
 5 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.27.0
