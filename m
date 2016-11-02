From: David Lechner <david@lechnology.com>
Date: Tue,  1 Nov 2016 22:15:52 -0500
Subject: [Buildroot] [PATCH v2 0/4] LEGO MINDSTORMS EV3 Updates
Message-ID: <1478056556-30242-1-git-send-email-david@lechnology.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v2 changes:
* Specified specific U-Boot version
* Using config fragment for linux kernel config changes
* Added dependency host-dosfstool and host-mtools
* Renamed ev3dev package and kernel extension to ev3dev-linux-drivers
* Removed dest variable to simplify kernel extension makefile
* Fixed "from from" typo

David Lechner (4):
  configs/lego_ev3: add U-Boot support
  board/lego/ev3: Create images using genimage
  linux: add ev3dev extension
  board/lego/ev3: Use ev3dev linux ext for ev3dev drivers

 board/lego/ev3/genimage.cfg                        | 57 +++++++++++++++
 board/lego/ev3/linux.fragment                      |  7 ++
 .../0001-Create-empty-drivers-lego-Kconfig.patch   | 24 -------
 board/lego/ev3/post-image.sh                       | 14 ++++
 board/lego/ev3/readme.txt                          | 84 ++++++----------------
 configs/lego_ev3_defconfig                         | 21 ++++--
 linux/Config.ext.in                                | 10 +++
 linux/linux-ext-ev3dev-linux-drivers.mk            | 12 ++++
 package/Config.in                                  |  1 +
 package/ev3dev-linux-drivers/Config.in             | 12 ++++
 .../ev3dev-linux-drivers/ev3dev-linux-drivers.mk   | 11 +++
 .../ev3dev-linux-drivers/lego-linux-drivers.hash   |  2 +
 support/scripts/pkg-stats                          |  1 +
 13 files changed, 164 insertions(+), 92 deletions(-)
 create mode 100644 board/lego/ev3/genimage.cfg
 create mode 100644 board/lego/ev3/linux.fragment
 delete mode 100644 board/lego/ev3/patches/linux/0001-Create-empty-drivers-lego-Kconfig.patch
 create mode 100755 board/lego/ev3/post-image.sh
 create mode 100644 linux/linux-ext-ev3dev-linux-drivers.mk
 create mode 100644 package/ev3dev-linux-drivers/Config.in
 create mode 100644 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
 create mode 100644 package/ev3dev-linux-drivers/lego-linux-drivers.hash

-- 
2.7.4
