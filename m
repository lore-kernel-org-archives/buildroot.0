From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:25 -0300
Subject: [Buildroot] [PATCH 00/15] Introduce a genimage infra
Message-ID: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout here's a series introducing
a genimage infra to remove all the duplicated genimage
incantation (they are all identical!).

BTW, it seems this topic was brought on the 2014 Developer
day at FOSDEM:

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014#Genimages

In addition to the infra stuff, I took the liberty of fixing all
the boards currently using genimage, but I've tested just a couple:
Minnowboard Max and Olimex A20 Olinuxino Micro.

Comments? Feedback?

Ezequiel Garcia (15):
  fs: add genimage infra
  board/minnowboard-max: Leverage the new genimage infra
  board/olimex_a20_olinuxino: Leverage the new genimage infra
  board/wandboard: Leverage the new genimage infra
  board/firefly: Leverage the new genimage infra
  board/cubieboard2: Leverage the new genimage infra
  board/arietta-g25: Leverage the new genimage infra
  board/imx6ulevk: Leverage the new genimage infra
  board/galileo: Leverage the new genimage infra
  board/pandaboard: Leverage the new genimage infra
  board/boundarydevices: Leverage the new genimage infra
  board/imx233_olinuxino: Leverage the new genimage infra
  board/orangepipc: Leverage the new genimage infra
  board/raspberry*: Leverage the new genimage infra
  board/via_imx6_vab820: Leverage the new genimage infra

 board/acmesystems/arietta-g25/post-image.sh      | 16 ----------
 board/boundarydevices/common/post-image.sh       | 16 ----------
 board/cubietech/cubieboard2/post-image.sh        | 16 ----------
 board/firefly/firefly-rk3288/post-build.sh       |  4 +++
 board/firefly/firefly-rk3288/post-image.sh       | 20 ------------
 board/freescale/imx6ulevk/post-image.sh          | 15 ---------
 board/intel/galileo/post-image.sh                | 13 --------
 board/minnowboard-max/genimage.cfg               | 34 +++++++++++++++++++++
 board/minnowboard-max/readme.txt                 | 39 ++++++++----------------
 board/olimex/a20_olinuxino/post-image.sh         | 16 ----------
 board/olimex/imx233_olinuxino/post-image.sh      | 14 ---------
 board/orangepi/orangepipc/post-build.sh          |  5 +++
 board/orangepi/orangepipc/post-image.sh          | 22 -------------
 board/pandaboard/post-image.sh                   | 16 ----------
 board/raspberrypi/post-build.sh                  |  8 +++++
 board/raspberrypi/post-image.sh                  | 22 -------------
 board/wandboard/post-image.sh                    | 16 ----------
 configs/acmesystems_arietta_g25_128mb_defconfig  |  4 +--
 configs/acmesystems_arietta_g25_256mb_defconfig  |  4 +--
 configs/cubieboard2_defconfig                    |  5 +--
 configs/firefly_rk3288_defconfig                 |  4 +--
 configs/firefly_rk3288_demo_defconfig            |  4 +--
 configs/freescale_imx6ulevk_defconfig            |  4 +--
 configs/galileo_defconfig                        |  4 +--
 configs/minnowboard_max_defconfig                |  8 +++++
 configs/nitrogen6sx_defconfig                    |  4 +--
 configs/nitrogen6x_defconfig                     |  4 +--
 configs/nitrogen7_defconfig                      |  4 +--
 configs/olimex_a20_olinuxino_lime2_defconfig     |  2 --
 configs/olimex_a20_olinuxino_lime_defconfig      |  4 +--
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  4 +--
 configs/olimex_a20_olinuxino_micro_defconfig     |  4 +--
 configs/olimex_imx233_olinuxino_defconfig        |  3 +-
 configs/orangepipc_defconfig                     |  4 +--
 configs/pandaboard_defconfig                     |  4 +--
 configs/raspberrypi2_defconfig                   |  5 +--
 configs/raspberrypi_defconfig                    |  5 +--
 configs/via_imx6_vab820_defconfig                |  4 +--
 configs/wandboard_defconfig                      |  5 +--
 fs/Config.in                                     |  1 +
 fs/genimage/Config.in                            | 20 ++++++++++++
 fs/genimage/genimage.mk                          | 21 +++++++++++++
 42 files changed, 157 insertions(+), 270 deletions(-)
 delete mode 100755 board/acmesystems/arietta-g25/post-image.sh
 delete mode 100755 board/boundarydevices/common/post-image.sh
 delete mode 100755 board/cubietech/cubieboard2/post-image.sh
 delete mode 100755 board/firefly/firefly-rk3288/post-image.sh
 delete mode 100755 board/freescale/imx6ulevk/post-image.sh
 delete mode 100755 board/intel/galileo/post-image.sh
 create mode 100644 board/minnowboard-max/genimage.cfg
 delete mode 100755 board/olimex/a20_olinuxino/post-image.sh
 delete mode 100755 board/orangepi/orangepipc/post-image.sh
 delete mode 100755 board/pandaboard/post-image.sh
 create mode 100755 board/raspberrypi/post-build.sh
 delete mode 100755 board/raspberrypi/post-image.sh
 delete mode 100755 board/wandboard/post-image.sh
 create mode 100644 fs/genimage/Config.in
 create mode 100644 fs/genimage/genimage.mk

-- 
2.7.0
