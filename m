From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 25 Jun 2021 22:33:13 +0300
Subject: [Buildroot] [PATCH v3 0/5] allwinner: arm64: use mainline TF-A
Message-ID: <20210625193318.635449-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This is the 3rd revision of the patch set that replaces custom fork with
mainline TF-A in Allwinner H5/A64 BSPs. The changes include:

- introduce TF-A selection menu to explicitly chose GCC stack protection
- switch from custom port to mainline TF-A in orangepi-zero-pluse2 BSP
- bump Linux kernel version
- bump U-Boot version
  -- switch to combined u-boot-sunxi-with-spl.bin image
  -- for now disable support for Allwinner SCP firmware

So far I have got no feedback from the boards custodians. So this time
I only keep the board that I can test myself: orangepi-zero-plus2.

Regards,
Sergey

v3:
- rework TF-A stack protection approach: add selection menu
- only keep the board that I can test: orangepi-zero-plus2
- cleanup commit messages: TF-A instead of ATF

v2:
- as per Heiko Thiery suggestion, bump mainline ATF version to v2.5
- cleanup commit messages: use 'mainline' instead of 'upstream'

Sergey Matyukevich (5):
  boot/arm-trusted-firmware: enable stack protection level selection
  support/testing: switch TestATFAllwinner to mainline TF-A
  support/testing/tests/boot/test_atf: update U-Boot in TestATFAllwinner
  configs/orangepi_zero_plus2_defconfig: switch to mainline TF-A
  configs/orangepi-zero-plus2: bump BSP versions

 .../orangepi/orangepi-zero-plus2/genimage.cfg | 10 ++-----
 boot/arm-trusted-firmware/Config.in           | 26 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   |  8 +++---
 configs/orangepi_zero_plus2_defconfig         | 19 +++++++-------
 support/testing/tests/boot/test_atf.py        | 16 ++++++------
 5 files changed, 50 insertions(+), 29 deletions(-)

-- 
2.32.0
