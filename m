From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Thu, 25 Jun 2020 09:37:23 +0530
Subject: [Buildroot] [PATCH v2 0/2] Add support for radxa rk3399 and
 rk3399pro based targets
Message-ID: <1593058045-7013-1-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds support for targets based on rk3399 SOC from radxa.

Here is the previous version of this series[1].

patch #1, adds support for rockpi_n10 base board hosting a RK3399pro SOM.
patch #2, adds support for rockpi_4 targets(Model A, B, C) based on rk3399 SOC.

Changes for v2:
- renamed and updated defconfig from rockpi_4c to rock_pi_4 and board folder
  from rockpi-4c to rockpi-4, so that this will be valid to board Models A, B, C.
- renamed defconfig from rockpi_n10 to rock_pi_n10
- Changed commit description.
- updated gitlab-ci.yml.
- updated DEVELOPERS.
- updated readme.
- updated extlinux.conf.

[1] http://patchwork.ozlabs.org/project/buildroot/cover/1592369606-14872-1-git-send-email-sunil at amarulasolutions.com/ 

Suniel Mahesh (2):
  configs/rock_pi_n10: new defconfig
  configs/rock_pi_4: new defconfig

 .gitlab-ci.yml                       |  2 ++
 DEVELOPERS                           |  4 +++
 board/radxa/rockpi-4/extlinux.conf   |  4 +++
 board/radxa/rockpi-4/genimage.cfg    | 39 +++++++++++++++++++++++
 board/radxa/rockpi-4/post-build.sh   |  5 +++
 board/radxa/rockpi-4/readme.txt      | 61 ++++++++++++++++++++++++++++++++++++
 board/radxa/rockpi-n10/extlinux.conf |  4 +++
 board/radxa/rockpi-n10/genimage.cfg  | 39 +++++++++++++++++++++++
 board/radxa/rockpi-n10/post-build.sh |  5 +++
 board/radxa/rockpi-n10/readme.txt    | 56 +++++++++++++++++++++++++++++++++
 configs/rock_pi_4_defconfig          | 57 +++++++++++++++++++++++++++++++++
 configs/rock_pi_n10_defconfig        | 57 +++++++++++++++++++++++++++++++++
 12 files changed, 333 insertions(+)
 create mode 100644 board/radxa/rockpi-4/extlinux.conf
 create mode 100644 board/radxa/rockpi-4/genimage.cfg
 create mode 100755 board/radxa/rockpi-4/post-build.sh
 create mode 100644 board/radxa/rockpi-4/readme.txt
 create mode 100644 board/radxa/rockpi-n10/extlinux.conf
 create mode 100644 board/radxa/rockpi-n10/genimage.cfg
 create mode 100755 board/radxa/rockpi-n10/post-build.sh
 create mode 100644 board/radxa/rockpi-n10/readme.txt
 create mode 100644 configs/rock_pi_4_defconfig
 create mode 100644 configs/rock_pi_n10_defconfig

-- 
2.7.4
