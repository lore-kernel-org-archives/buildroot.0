From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Sep 2016 23:47:06 +0200
Subject: [Buildroot] [PATCH v1] Raspberry PI update
Message-ID: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update rpi-firmware/rpi-userland and all raspberrypiX_defconfigs to
kernel version 4.4.21.

Tested raspberrypi3_defconfig on Raspberry Pi 3 Model B v1.2 hardware.

Peter Seiderer (6):
  raspberrypi0_defconfig: bump to kernel version 4.4.21
  raspberrypi_defconfig: bump to kernel version 4.4.21
  raspberrypi2_defconfig: bump to kernel version 4.4.21
  raspberrypi3_defconfig: bump to kernel version 4.4.21
  rpi-firmware: bump version
  rpi-userland: bump version

 configs/raspberrypi0_defconfig                     |   2 +-
 configs/raspberrypi2_defconfig                     |   2 +-
 configs/raspberrypi3_defconfig                     |   2 +-
 configs/raspberrypi_defconfig                      |   2 +-
 package/rpi-firmware/rpi-firmware.hash             |   2 +-
 package/rpi-firmware/rpi-firmware.mk               |   2 +-
 ...es-for-the-OpenGLESv2-EGL-and-bcm_host-li.patch |  17 +-
 ...emove-faulty-assert-to-make-weston-happy-.patch |  35 +++++
 .../0003-Disable-Werror-everywhere.patch           | 171 +++++++++++++++++++++
 ...emove-faulty-assert-to-make-weston-happy-.patch |  33 ----
 ...pplications-disable-missing-applications.patch} |  18 ++-
 package/rpi-userland/0004-no-Werror.patch          | 138 -----------------
 ...-dtmerge-add-missing-include-for-va_list.patch} |   0
 package/rpi-userland/rpi-userland.hash             |   2 +-
 package/rpi-userland/rpi-userland.mk               |   2 +-
 15 files changed, 236 insertions(+), 192 deletions(-)
 create mode 100644 package/rpi-userland/0002-interface-remove-faulty-assert-to-make-weston-happy-.patch
 create mode 100644 package/rpi-userland/0003-Disable-Werror-everywhere.patch
 delete mode 100644 package/rpi-userland/0003-interface-remove-faulty-assert-to-make-weston-happy-.patch
 rename package/rpi-userland/{0005-disable-missing-all-apps.patch => 0004-host-applications-disable-missing-applications.patch} (61%)
 delete mode 100644 package/rpi-userland/0004-no-Werror.patch
 rename package/rpi-userland/{0006-dtmerge-add-missing-include-for-va_list.patch => 0005-dtmerge-add-missing-include-for-va_list.patch} (100%)

-- 
2.8.1
