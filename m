From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:14 +0200
Subject: [Buildroot] [pull request] raspberrypi: update packages and
	defconfigs
Message-ID: <cover.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series updates our support for the RaspberryPi line of boards:
RaspberryPi models A and B, A+ and B+, and model 2 B.

Patch 1 reinstates the Kconfig knob to install the DTBs, as the ones
from rpi-firmware are kernel-version specific, and can't be used with
kernels >= 3.19 (boot hangs because no root device found).

Patch 2 adds an option to intall the DTB overlays. They are bundled in
source form in thre kernel tree, but Buildroot lacks the infra to build
DT overlays in the kernel, so we install them from rpi-firmware.

Patch 3 adds the option to install a utility to diagnmose issues when
talking to the GPU (useful to debug DT-related issues... when booted!)

Patches 4-5 update our rpi-firmware and rpi-userland packages. Nothing
tremenduously interesting, though, except the usual fixes and small
improvement for new hardware support.

Patches 6-10 update our defconfig files and drops the defconfig without
DT support.

Patch 11 update the board instructions.

Thanks to Floris and Pascal for their initial works! :-)

Regards,
Yann E. MORIN.


The following changes since commit 70ad172e6e50d739f723c6000b0714799eff21fe:

  libpng: rebase ignore-symbol-prefix patch to apply cleanly (2015-06-28 23:05:36 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/rpi

for you to fetch changes up to e2dbaf3e7a9135b57d2e90c3e70380bd0ec56187:

  boards/raspberrypi: update instructions (2015-06-28 23:48:12 +0200)

----------------------------------------------------------------
Floris Bos (1):
      rpi-firmware: allow disabling installation of binary DTBs

Yann E. MORIN (10):
      package/rpi-firmware: add option to install DTB overlays
      package/rpi-firmware: add option to install vcdbg
      package/rpi-firmware: bump version
      package/rpi-userland: bump version
      configs/raspberrypi: update the DT-enabled config
      configs/raspberrypi_plus: new defconfig
      configs/raspberrypi2: update our defconfig
      config/raspberrypi: remove non-DT defconfig
      config/raspberrypi: rename our defconfig files
      boards/raspberrypi: update instructions

 board/raspberrypi/linux-3.18-rpi-dt.defconfig | 204 --------------------------
 board/raspberrypi/readme.txt                  |  48 +++---
 configs/raspberrypi2_defconfig                |  16 +-
 configs/raspberrypi_defconfig                 |  26 ++--
 configs/raspberrypi_dt_defconfig              |  20 ---
 configs/raspberrypi_plus_defconfig            |  27 ++++
 package/rpi-firmware/Config.in                |  29 ++++
 package/rpi-firmware/rpi-firmware.mk          |  17 ++-
 package/rpi-userland/rpi-userland.mk          |   2 +-
 9 files changed, 124 insertions(+), 265 deletions(-)
 delete mode 100644 board/raspberrypi/linux-3.18-rpi-dt.defconfig
 delete mode 100644 configs/raspberrypi_dt_defconfig
 create mode 100644 configs/raspberrypi_plus_defconfig

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
