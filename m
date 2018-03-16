From: Martin Bark <martin@barkynet.com>
Date: Fri, 16 Mar 2018 18:02:25 +0000
Subject: [Buildroot] [PATCH v3 0/7] Add rpi3 b+ support
Message-ID: <20180316180232.18829-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This is a patch set to add rpi3 b+ support.  It includes:

- bump all the rpi configs to the latest 4.14.26 kernel
- update the rpi-firmware to latest version
- add the rpi3 b+ dtb files.
- add the new wifi and bt firmware for the rpi3 b+

I can confirm the basics of wired & wireless networks and serial all work on the rpi3 and rpi3 b+.  The bluetooth device comes up on the rpi3 b+ but i have not tried anything more that scanning.

Note there is no definitive place to download the all the necessary wifi and bt firmware files.  The closest reliable source i have found is the LibreELEC github repo where they have copied the wifi and bt firmware from raspbian into one place.  I have updated to using this repo.  The only issue is it lacks the license files.  I have sent a pull request to add the missing license, once it has been accepted I will update the wifi and bt firmware packages.

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
 package/rpi-bt-firmware/rpi-bt-firmware.hash     |  2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk       | 13 +++++++------
 package/rpi-firmware/rpi-firmware.hash           |  2 +-
 package/rpi-firmware/rpi-firmware.mk             |  9 ++++-----
 package/rpi-wifi-firmware/Config.in              |  5 +++--
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash |  2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 17 +++++++----------
 17 files changed, 55 insertions(+), 49 deletions(-)

--
2.16.2
