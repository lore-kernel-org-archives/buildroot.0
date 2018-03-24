From: Martin Bark <martin@barkynet.com>
Date: Sat, 24 Mar 2018 14:10:10 +0000
Subject: [Buildroot] [PATCH v4 0/7] Add rpi3 b+ support
Message-ID: <1521900617-32102-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This is a patch set to add rpi3 b+ support.  It includes:

- bump all the rpi configs to the latest 4.14.29 kernel
- update the rpi-firmware to latest version
- add the rpi3 b+ dtb files.
- add the new wifi and bt firmware for the rpi3 b+

I can confirm the basics of wired & wireless networks and serial all work on the rpi3 and rpi3 b+.  The bluetooth device comes up on the rpi3 b+ but i have not tried anything more that scanning.

There is no definitive place to download the all the necessary wifi and bt firmware files.  The closest reliable source i have found is the LibreELEC github repo where they have copied the wifi and bt firmware from raspbian into one place.  I have updated to using this repo.

I have made the rpi-wifi-firmware use brcmfmac43430-sdio.bin and brcmfmac43455-sdio.bin from the LibreELEC github repo because linux-firmware has outdated firmware.  As a result the rpi-wifi-firmware package now conflicts with BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX.

Changes v3 -> v4:
 - add license files to rpi-bt-firmware and rpi-wifi-firmware
 - dont use linux-firmware bcm43XXX because is old
 - Updated to use 4.14.29 kernel
 - bump rpi-firmware version

Changes v2 -> v3:
 - update rpi-bt-firmware and rpi-wifi-firmware packages

Changes v1 -> v2:
  - Updated to use 4.14.26 kernel

Thanks

Martin

Martin Bark (7):
  package/rpi-firmware: bump version
  configs/raspberrypi*: bump kernel version
  board/raspberrypi: add support for rpi3 b+
  package/rpi-firmware: improve installation of dtb files
  package/rpi-bt-firmware: change to LibreELEC github repo
  package/rpi-wifi-firmware: change to LibreELEC github repo
  DEVELOPERS: add myself for rpi packages

 DEVELOPERS                                       |  5 +++++
 board/raspberrypi/genimage-raspberrypi3.cfg      |  1 +
 board/raspberrypi/readme.txt                     |  3 ++-
 configs/raspberrypi0_defconfig                   |  6 +++---
 configs/raspberrypi2_defconfig                   |  6 +++---
 configs/raspberrypi3_64_defconfig                |  6 +++---
 configs/raspberrypi3_defconfig                   |  8 ++++----
 configs/raspberrypi3_qt5we_defconfig             |  8 ++++----
 configs/raspberrypi_defconfig                    |  6 +++---
 package/rpi-bt-firmware/Config.in                |  5 +++--
 package/rpi-bt-firmware/rpi-bt-firmware.hash     |  3 ++-
 package/rpi-bt-firmware/rpi-bt-firmware.mk       | 12 +++++++-----
 package/rpi-firmware/rpi-firmware.hash           |  2 +-
 package/rpi-firmware/rpi-firmware.mk             |  9 ++++-----
 package/rpi-wifi-firmware/Config.in              | 11 +++++++----
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash |  3 ++-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 16 +++++-----------
 17 files changed, 59 insertions(+), 51 deletions(-)

--
2.7.4
