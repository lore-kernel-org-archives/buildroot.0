From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Fri, 22 Jan 2016 12:53:37 -0300
Subject: [Buildroot] [PATCH 0/3] Add support for Firefly RK3288
Message-ID: <1453478020-311-1-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patchset adds support for the Firefly RK3288 board [0].
Support includes running Qt5 + EGLFS backend, so the board is
configured in that way, as follows:

A new mali-t76x package is added, which installs the required libraries
for Mali Midgard GPU from ARM [1].

Although most of the kernel support for the board has been mainlined,
the kernel is taken from Heiko St?bner's [2] devel/somewhat-stable
branch as it includes the latest support and the Mali GPU drivers.
The GPU drivers should be added as an extension separated from the
kernel in the future.

Uboot bootloader is taken from mainline tag v2016.01.

The building process will output a 'sdcard.img' that is ready to be
flash into a SD card and boot the board.

Regards,

Links:
[0] http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/
[1] http://malideveloper.arm.com/resources/drivers/arm-mali-midgard-gpu-user-space-drivers/
[2] https://github.com/mmind/linux-rockchip

Ariel D'Alessandro (3):
  mali-t76x: add new package
  board/firefly_rk3288: add new board
  configs/firefly_rk3288: new board

 board/firefly/firefly-rk3288/build_sd_image.sh     | 18 ++++++
 board/firefly/firefly-rk3288/extlinux.conf         |  6 ++
 board/firefly/firefly-rk3288/post-image.sh         |  6 ++
 board/firefly/firefly-rk3288/pre-image.sh          |  3 +
 board/firefly/firefly-rk3288/readme.txt            | 40 ++++++++++++++
 board/firefly/firefly-rk3288/sd-image.cfg          | 22 ++++++++
 configs/firefly_rk3288_defconfig                   | 40 ++++++++++++++
 package/Config.in                                  |  1 +
 ...latform.h-with-framebuffer-instead-of-X11.patch | 39 +++++++++++++
 package/mali-t76x/Config.in                        | 27 +++++++++
 package/mali-t76x/egl.pc                           | 12 ++++
 package/mali-t76x/glesv2.pc                        | 12 ++++
 package/mali-t76x/rockchip-mali.mk                 | 64 ++++++++++++++++++++++
 13 files changed, 290 insertions(+)
 create mode 100755 board/firefly/firefly-rk3288/build_sd_image.sh
 create mode 100644 board/firefly/firefly-rk3288/extlinux.conf
 create mode 100755 board/firefly/firefly-rk3288/post-image.sh
 create mode 100755 board/firefly/firefly-rk3288/pre-image.sh
 create mode 100644 board/firefly/firefly-rk3288/readme.txt
 create mode 100644 board/firefly/firefly-rk3288/sd-image.cfg
 create mode 100644 configs/firefly_rk3288_defconfig
 create mode 100644 package/mali-t76x/0001-use-eglplatform.h-with-framebuffer-instead-of-X11.patch
 create mode 100644 package/mali-t76x/Config.in
 create mode 100644 package/mali-t76x/egl.pc
 create mode 100644 package/mali-t76x/glesv2.pc
 create mode 100644 package/mali-t76x/rockchip-mali.mk

-- 
2.7.0
