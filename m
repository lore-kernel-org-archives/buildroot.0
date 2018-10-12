From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Oct 2018 23:09:36 +0200
Subject: [Buildroot] [PATCH v1 0/5] Raspberry Pi update
Message-ID: <20181012210941.21515-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update configs/raspberrypi*, rpi-firmware, rpi-userland, rpi-bt-firmware
and rpi-wifi-firmware to latest versions.

Tested on Raspberry Pi 3 Model B v1.2 hardware:
- raspberrypi3_defconfig updated to glibc, systemd, gcc-8.x and
  qt5 (linuxfb, eglfs)


Peter Seiderer (5):
  configs/raspberrypi*: bump kernel version to 6d27aa156c
  rpi-firmware: bump version to fbad6408c4
  rpi-userland: bump version to 8f0abfb07b
  rpi-bt-firmware: bump version to 8c1e2bff1d
  rpi-wifi-firmware: bump version to 8c1e2bff1d

 configs/raspberrypi0_defconfig                |  2 +-
 configs/raspberrypi0w_defconfig               |  2 +-
 configs/raspberrypi2_defconfig                |  2 +-
 configs/raspberrypi3_64_defconfig             |  2 +-
 configs/raspberrypi3_defconfig                |  2 +-
 configs/raspberrypi3_qt5we_defconfig          |  2 +-
 configs/raspberrypi_defconfig                 |  2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.hash  |  2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk    |  2 +-
 package/rpi-firmware/rpi-firmware.hash        |  2 +-
 package/rpi-firmware/rpi-firmware.mk          |  2 +-
 .../0003-Disable-Werror-everywhere.patch      | 29 ++++++------
 ...lay-don-t-install-script-in-random-l.patch | 45 -------------------
 package/rpi-userland/rpi-userland.hash        |  2 +-
 package/rpi-userland/rpi-userland.mk          |  2 +-
 .../rpi-wifi-firmware/rpi-wifi-firmware.hash  |  2 +-
 .../rpi-wifi-firmware/rpi-wifi-firmware.mk    |  2 +-
 17 files changed, 31 insertions(+), 73 deletions(-)
 delete mode 100644 package/rpi-userland/0006-host-apps-dtoverlay-don-t-install-script-in-random-l.patch

-- 
2.19.0
