From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 10 Oct 2020 09:30:17 +0300
Subject: [Buildroot] [PATCH 0/5] board/udoo: bsp updates and cleanup
Message-ID: <20201010063022.448414-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio and all,

Here is a patch series for Udoo boards with BSP updates and several minor
cleanups required to make updated BSP work out of the box.
Major changes include:

- bump Linux kernel to 5.8.13
- bump U-Boot to 2020.10
- udoo/mx6qdl: disable usbh1 in dts rather than in kernel configuration
- use common image generation files for udoo boards

Regards,
Sergey


Sergey Matyukevich (5):
  configs/mx6sx_udoo_neo: bump kernel and U-Boot versions
  configs/mx6udoo: bump bsp versions and modify image
  board/udoo: use common image generation files
  board/udoo/mx6qdl: disable usb device in device tree
  board/udoo: drop custom post-image script

 board/udoo/{neo => common}/boot.scr.txt       |  2 +-
 board/udoo/{neo => common}/genimage.cfg       |  9 -------
 board/udoo/{neo => common}/post-build.sh      |  0
 board/udoo/mx6qdl/linux.fragment              |  1 -
 .../linux/0000-udoo-disable-usbh1.patch       | 26 +++++++++++++++++++
 board/udoo/mx6qdl/readme.txt                  |  2 +-
 board/udoo/neo/post-image.sh                  | 15 -----------
 board/udoo/neo/readme.txt                     |  2 +-
 configs/mx6sx_udoo_neo_defconfig              | 13 +++++-----
 configs/mx6udoo_defconfig                     | 16 +++++++-----
 10 files changed, 46 insertions(+), 40 deletions(-)
 rename board/udoo/{neo => common}/boot.scr.txt (66%)
 rename board/udoo/{neo => common}/genimage.cfg (50%)
 rename board/udoo/{neo => common}/post-build.sh (100%)
 delete mode 100644 board/udoo/mx6qdl/linux.fragment
 create mode 100644 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
 delete mode 100755 board/udoo/neo/post-image.sh

-- 
2.28.0
