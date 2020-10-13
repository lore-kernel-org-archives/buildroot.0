From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Oct 2020 23:16:18 +0300
Subject: [Buildroot] [PATCH v2 0/3] board/udoo: bsp updates and cleanup
Message-ID: <20201013201621.910051-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Fabio and all,

Here is a v2 patch series for Udoo boards with BSP updates and several
cleanups required to make updated BSP work out of the box.
Major changes include:

- bump Udoo Quad/Dual Linux kernel to 5.8.13
- bump Udoo Quad/Dual U-Boot to 2020.10
- udoo/mx6qdl: disable usbh1 in dts rather than in kernel configuration
- use common freescale image infrastructure for all the Udoo boards

Regards,
Sergey

Changes v1 -> v2:
- Udoo Neo BSP update patch has been already applied
- rework: switch all Udoo boards to freescale common infrastructure


Sergey Matyukevich (3):
  configs/mx6udoo_defconfig: bump kernel and U-Boot versions
  board/udoo/mx6qdl: disable usb host in device tree
  board/udoo: use common freescale infrastructure

 board/udoo/{neo => common}/boot.scr.txt       |  2 +-
 board/udoo/common/post-build.sh               |  3 ++
 board/udoo/mx6qdl/linux.fragment              |  1 -
 .../linux/0000-udoo-disable-usbh1.patch       | 26 +++++++++++++++
 board/udoo/mx6qdl/readme.txt                  |  2 +-
 board/udoo/neo/genimage.cfg                   | 32 -------------------
 board/udoo/neo/post-build.sh                  |  7 ----
 board/udoo/neo/post-image.sh                  | 15 ---------
 board/udoo/neo/readme.txt                     |  2 +-
 configs/mx6sx_udoo_neo_defconfig              |  6 ++--
 configs/mx6udoo_defconfig                     | 15 ++++++---
 11 files changed, 46 insertions(+), 65 deletions(-)
 rename board/udoo/{neo => common}/boot.scr.txt (66%)
 create mode 100755 board/udoo/common/post-build.sh
 delete mode 100644 board/udoo/mx6qdl/linux.fragment
 create mode 100644 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
 delete mode 100644 board/udoo/neo/genimage.cfg
 delete mode 100755 board/udoo/neo/post-build.sh
 delete mode 100755 board/udoo/neo/post-image.sh

-- 
2.28.0
