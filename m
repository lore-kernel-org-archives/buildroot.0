From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Thu, 13 Feb 2020 16:14:41 +0530
Subject: [Buildroot] [PATCH v2 0/4] Fix ATF v2.2 build for rk3399,
 add roc-rk3399-pc board
Message-ID: <1581590685-31680-1-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

This patch set does the following:
Fix ATF v2.2 build for rk3399 SoC's.
Add arm-gnu-a-toolchain package, which acts as a secondary bare metal toolchain
to build ATF for Rockchip rk3399 platform (has a cortex-m0 core). The required
pre-built toolchain is taken from ARM developers site and installed in host filesystem only.
Add rk3399 support for building ATF.
Add new defconfig file for roc-rk3399-pc.

The patch set is tested on roc-rk3399-pc, a rk3399 based target.
---
Changes for v2:
Changed cover letter description to add more meaning.
patch #1 (Disable bin copy for rk3399)
- Added Cc tag
patch #2 (new package)
- More Description added to justify why a secondary bare metal toolchain is required 
patch #3 (add support for rockchip rk3399)
- no change
patch #4 (new defconfig)
- updated readme.txt to help with the build/boot process 
- modified file permissions of post-build.sh to 'x'

Jagan Teki (1):
  boot/arm-trusted-firmware: Disable bin copy for rk3399

Suniel Mahesh (3):
  package/arm-gnu-a-toolchain: new package
  boot/arm-trusted-firmware: add support for rockchip rk3399
  configs/roc-rk3399-pc: new defconfig

 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  4 ++
 board/firefly/roc-rk3399-pc/extlinux.conf          |  4 ++
 board/firefly/roc-rk3399-pc/genimage.cfg           | 22 +++++++++
 board/firefly/roc-rk3399-pc/post-build.sh          |  5 ++
 board/firefly/roc-rk3399-pc/readme.txt             | 48 ++++++++++++++++++++
 boot/arm-trusted-firmware/Config.in                |  2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk  |  4 ++
 configs/roc_pc_rk3399_defconfig                    | 53 ++++++++++++++++++++++
 .../arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash   |  3 ++
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk | 27 +++++++++++
 11 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 create mode 100644 configs/roc_pc_rk3399_defconfig
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
 create mode 100644 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk

-- 
2.7.4
