From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sat, 29 Aug 2020 15:05:02 +0530
Subject: [Buildroot] [PATCH v2 0/4] Add support for rk3399 based targets
Message-ID: <20200829093506.25260-1-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds support for targets from friendlyarm, pine64 and orangepi,
based on rk3399 SOC.

Merged two patch series at https://patchwork.ozlabs.org/project/buildroot/list/?series=174279,
into this series.

patch #1, #2, are basically a resend. patch #3, #4 are new patches.

Changes for v2:
- Done few changes based on Thomas Pettazonni suggestions and 
  mailing list
- bumped linux version from 5.4.46 to 5.8.2
- bumped u-boot version from 2020.04 to 2020.07
- recent series is at:
  https://patchwork.ozlabs.org/project/buildroot/cover/1592073154-13731-1-git-send-email-sunil at amarulasolutions.com/

Suniel Mahesh (4):
  configs/rockpro64: new defconfig
  configs/orangepi_rk3399: new defconfig
  configs/nanopi_m4: new defconfig
  configs/nanopc_t4: new defconfig

 DEVELOPERS                                   |  8 ++++
 board/friendlyarm/nanopc-t4/extlinux.conf    |  4 ++
 board/friendlyarm/nanopc-t4/genimage.cfg     | 39 ++++++++++++++++++
 board/friendlyarm/nanopc-t4/post-build.sh    |  5 +++
 board/friendlyarm/nanopc-t4/readme.txt       | 45 +++++++++++++++++++++
 board/friendlyarm/nanopi-m4/extlinux.conf    |  4 ++
 board/friendlyarm/nanopi-m4/genimage.cfg     | 39 ++++++++++++++++++
 board/friendlyarm/nanopi-m4/post-build.sh    |  5 +++
 board/friendlyarm/nanopi-m4/readme.txt       | 45 +++++++++++++++++++++
 board/orangepi/orangepi-rk3399/extlinux.conf |  4 ++
 board/orangepi/orangepi-rk3399/genimage.cfg  | 39 ++++++++++++++++++
 board/orangepi/orangepi-rk3399/post-build.sh |  5 +++
 board/orangepi/orangepi-rk3399/readme.txt    | 56 ++++++++++++++++++++++++++
 board/pine64/rockpro64/extlinux.conf         |  4 ++
 board/pine64/rockpro64/genimage.cfg          | 39 ++++++++++++++++++
 board/pine64/rockpro64/post-build.sh         |  5 +++
 board/pine64/rockpro64/readme.txt            | 60 ++++++++++++++++++++++++++++
 configs/nanopc_t4_defconfig                  | 53 ++++++++++++++++++++++++
 configs/nanopi_m4_defconfig                  | 53 ++++++++++++++++++++++++
 configs/orangepi_rk3399_defconfig            | 53 ++++++++++++++++++++++++
 configs/rockpro64_defconfig                  | 53 ++++++++++++++++++++++++
 21 files changed, 618 insertions(+)
 create mode 100644 board/friendlyarm/nanopc-t4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopc-t4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopc-t4/post-build.sh
 create mode 100644 board/friendlyarm/nanopc-t4/readme.txt
 create mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-m4/readme.txt
 create mode 100644 board/orangepi/orangepi-rk3399/extlinux.conf
 create mode 100644 board/orangepi/orangepi-rk3399/genimage.cfg
 create mode 100755 board/orangepi/orangepi-rk3399/post-build.sh
 create mode 100644 board/orangepi/orangepi-rk3399/readme.txt
 create mode 100644 board/pine64/rockpro64/extlinux.conf
 create mode 100644 board/pine64/rockpro64/genimage.cfg
 create mode 100755 board/pine64/rockpro64/post-build.sh
 create mode 100644 board/pine64/rockpro64/readme.txt
 create mode 100644 configs/nanopc_t4_defconfig
 create mode 100644 configs/nanopi_m4_defconfig
 create mode 100644 configs/orangepi_rk3399_defconfig
 create mode 100644 configs/rockpro64_defconfig

-- 
2.7.4
