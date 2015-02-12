From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 12 Feb 2015 17:33:45 -0500
Subject: [Buildroot] [RFC 0/2] add a minimal genimage support
Message-ID: <1423780427-7493-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds a minimal support for genimage config files, to ease the
generation of custom complete target images.

The first patch explains the convenience of this host tool, and adds the
mechanism to wrap and call genimage against optional config file(s).

The second patch uses the Raspberry Pi as an example for genimage. This shows
how Buildroot can be used to create a fully functional SD card image with a
persistent rootfs, without the need to mount any partition.

Vivien Didelot (2):
  Makefile: add target-genimage
  boards/raspberrypi: add a sample genimage config

 Makefile                                  | 17 +++++++++++++++--
 board/raspberrypi/genimage/persistent.cfg | 29 +++++++++++++++++++++++++++++
 board/raspberrypi/readme.txt              |  9 +++++++--
 configs/raspberrypi_defconfig             |  4 ++++
 system/Config.in                          | 22 ++++++++++++++++++++++
 5 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 board/raspberrypi/genimage/persistent.cfg

-- 
2.3.0
