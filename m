From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 00:07:41 +0200
Subject: [Buildroot] [PATCH 0/6 v2] raspberrypi: update packages and
	defconfigs (branch yem/rpi)
Message-ID: <cover.1435615426.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series updates our support for the RaspberryPi line of boards:
RaspberryPi models A and B, A+ and B+, and model 2 B.

Patch 1 adds the option to install a utility to diagnmose issues when
talking to the GPU (useful to debug DT-related issues... when booted!)

Patches 2-5 update our defconfig files and drops the defconfig without
DT support.

Patch 6 updates the board instructions according to the previous
patches.

Thanks to Floris and Pascal for their initial works! :-)


Changes v1 -> v2:
  - vcdbg selects rpi-userland  (Baruch, Thomas)
  - merge defconfig files for A/B and A+/B+  (Thomas)
  - further bump the kernel version
  - update board readme after defconfig merge


Regards,
Yann E. MORIN.


The following changes since commit 41282cbdd62dd1299be50428e436e96c45f916eb:

  package/rpi-userland: bump version (2015-06-29 22:16:45 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi

for you to fetch changes up to ce3d41536398919a5aa02211e7a85c82771a4e52:

  boards/raspberrypi: update instructions (2015-06-30 00:01:09 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/rpi-firmware: add option to install vcdbg
      configs/raspberrypi: update the DT-enabled config
      configs/raspberrypi2: update our defconfig
      config/raspberrypi: remove non-DT defconfig
      config/raspberrypi: rename our non-DT defconfig file
      boards/raspberrypi: update instructions

 board/raspberrypi/linux-3.18-rpi-dt.defconfig | 204 --------------------------
 board/raspberrypi/readme.txt                  |  48 +++---
 configs/raspberrypi2_defconfig                |  16 +-
 configs/raspberrypi_defconfig                 |  26 ++--
 configs/raspberrypi_dt_defconfig              |  20 ---
 package/rpi-firmware/Config.in                |  13 ++
 package/rpi-firmware/rpi-firmware.mk          |   7 +
 7 files changed, 69 insertions(+), 265 deletions(-)
 delete mode 100644 board/raspberrypi/linux-3.18-rpi-dt.defconfig
 delete mode 100644 configs/raspberrypi_dt_defconfig

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
