From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:52:33 +0100
Subject: [Buildroot] [git commit] configs: remove calao*_defconfig
Message-ID: <20161109215314.9395D81938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e3b374208fe1c74cb977553f492c5c6280e82f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The calao defconfigs no longer build with gcc 5.x, due to Linux kernel
versions used being too old. However, it is unlikely that anyone will
ever update them, since Calao Systems has gone bankrupt in April 2016.

Therefore, let's remove them. If anyone is interested again at some
point, it will be easy to revive them from the Git history.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/calao/qil-a9260/linux-3.4.7.config           | 111 ---
 .../patches/at91bootstrap/0001-qil-a9260.patch     | 603 ---------------
 .../qil-a9260/patches/barebox/0001-qil-a9260.patch |  36 -
 .../qil-a9260/patches/linux/0001-qil-a9260.patch   |  27 -
 .../at91bootstrap-1.16-tny-a9g20-lpw.patch         | 551 -------------
 board/calao/tny-a9g20-lpw/linux-3.9.config         | 187 -----
 .../usb-a9260/at91bootstrap-1.16-usb-a9260.patch   | 603 ---------------
 board/calao/usb-a9260/linux-3.7.4.config           |  97 ---
 .../usb-a9263/at91bootstrap-1.16-usb-a9263.patch   | 851 ---------------------
 board/calao/usb-a9263/linux-3.4.4.config           | 102 ---
 board/calao/usb-a9g20-lpw/linux-3.4.4.config       | 105 ---
 .../patches/at91bootstrap/0001-usb-a9g20-lpw.patch | 610 ---------------
 .../patches/barebox/0001-usb-a9g20-lpw.patch       |  12 -
 configs/calao_qil_a9260_defconfig                  |  20 -
 configs/calao_tny_a9g20_lpw_defconfig              |  29 -
 configs/calao_usb_a9260_defconfig                  |  18 -
 configs/calao_usb_a9263_defconfig                  |  17 -
 configs/calao_usb_a9g20_lpw_defconfig              |  17 -
 18 files changed, 3996 deletions(-)

Patch is too large, so refusing to show it
