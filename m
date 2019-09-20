From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Fri, 20 Sep 2019 21:08:10 +0200
Subject: [Buildroot] [PATCH 0/3] Add Beelink GS1 board
Message-ID: <20190920190813.21516-1-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Beelink GS1 is a TV box based on Allwinner H6.

It requires one patch for a working reboot in ARM ATF and one patch
in U-boot to avoid random mac.

Patches 2 and 3, are optional and I don't think it should be merge.

Regards,
Cl?ment


Cl?ment P?ron (3):
  board: add Beelink GS1 support
  [DO NOT MERGE] board/beelink_gs1: enable mdev, dropbear and auto-ssh
  [DO NOT MERGE] board/beelink_gs1: add root passwd and eth0 auto

 board/beelink/gs1/extlinux.conf               |   4 +
 board/beelink/gs1/genimage.cfg                |  33 +++
 ...er-common-use-r_wdog-instead-of-wdog.patch |  39 +++
 ...01-arm-dts-sync-dts-for-Allwinner-H6.patch | 279 ++++++++++++++++++
 board/beelink/gs1/post-build.sh               |   4 +
 .../gs1/rootfs_overlay/etc/network/interfaces |   7 +
 configs/beelink_gs1_defconfig                 |  40 +++
 7 files changed, 406 insertions(+)
 create mode 100644 board/beelink/gs1/extlinux.conf
 create mode 100644 board/beelink/gs1/genimage.cfg
 create mode 100644 board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
 create mode 100644 board/beelink/gs1/patches/uboot/0001-arm-dts-sync-dts-for-Allwinner-H6.patch
 create mode 100755 board/beelink/gs1/post-build.sh
 create mode 100644 board/beelink/gs1/rootfs_overlay/etc/network/interfaces
 create mode 100644 configs/beelink_gs1_defconfig

-- 
2.20.1
