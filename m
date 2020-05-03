From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sun,  3 May 2020 14:41:15 +0530
Subject: [Buildroot] [PATCH v2 0/2] Add support for rockpro64 and
 oragepi-rk3399 targets
In-Reply-To: <20200502233409.4a90d4b2@windsurf.home>
References: <20200502233409.4a90d4b2@windsurf.home>
Message-ID: <1588497077-27220-1-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

This patch series adds two new defconfigs based on RK3399 SOC.

Merged http://patchwork.ozlabs.org/project/buildroot/list/?series=174156 and
http://patchwork.ozlabs.org/project/buildroot/list/?series=174242 individual
patches into this two patch series.

Suniel Mahesh (2):
  configs/rockpro64: new defconfig
  configs/orangepi_rk3399: new defconfig
---
Changes for v2:
- new patch series
- change contact for the respective target.
- As suggested by Thomas Pettazzoni, rk3399 targets does not need
  pylibfdt or pyelftools, but only a host Python interpreter. Remove
  them and add python, python3 in defconfig.
---
 .gitlab-ci.yml                               |  2 +
 DEVELOPERS                                   |  4 ++
 board/orangepi/orangepi-rk3399/extlinux.conf |  4 ++
 board/orangepi/orangepi-rk3399/genimage.cfg  | 39 ++++++++++++++++++
 board/orangepi/orangepi-rk3399/post-build.sh |  5 +++
 board/orangepi/orangepi-rk3399/readme.txt    | 56 ++++++++++++++++++++++++++
 board/pine64/rockpro64/extlinux.conf         |  4 ++
 board/pine64/rockpro64/genimage.cfg          | 39 ++++++++++++++++++
 board/pine64/rockpro64/post-build.sh         |  5 +++
 board/pine64/rockpro64/readme.txt            | 60 ++++++++++++++++++++++++++++
 configs/orangepi_rk3399_defconfig            | 56 ++++++++++++++++++++++++++
 configs/rockpro64_defconfig                  | 56 ++++++++++++++++++++++++++
 12 files changed, 330 insertions(+)
 create mode 100644 board/orangepi/orangepi-rk3399/extlinux.conf
 create mode 100644 board/orangepi/orangepi-rk3399/genimage.cfg
 create mode 100755 board/orangepi/orangepi-rk3399/post-build.sh
 create mode 100644 board/orangepi/orangepi-rk3399/readme.txt
 create mode 100644 board/pine64/rockpro64/extlinux.conf
 create mode 100644 board/pine64/rockpro64/genimage.cfg
 create mode 100755 board/pine64/rockpro64/post-build.sh
 create mode 100644 board/pine64/rockpro64/readme.txt
 create mode 100644 configs/orangepi_rk3399_defconfig
 create mode 100644 configs/rockpro64_defconfig

-- 
2.7.4
