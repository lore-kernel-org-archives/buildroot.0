From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 13:21:15 +0200
Subject: [Buildroot] [PATCH v4 0/5] fs/ext2: cleanup and improvement
Message-ID: <20170704112120.27977-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a respin of the remaining patchs of (so even shorter) series
based on 2 series initially sent early last May by S?bastien Szymanski
and Yann E. Morin, refactoring and improving the ext* image support.

Regards,

Samuel Martin (1):
  fs/ext2: deprecate BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option

S?bastien Szymanski (3):
  fs/ext2: use mkfs to generate rootfs image
  fs/ext2: Add BR2_TARGET_ROOTFS_EXT2_FEATURES option
  package/mke2img: remove package

Yann E. MORIN (1):
  fs/ext2: add option to specify block size

 Config.in.legacy               |  33 +++++++
 DEVELOPERS                     |   1 -
 fs/ext2/Config.in              |  51 +++++++---
 fs/ext2/ext2.mk                |  27 ++++--
 package/Config.in.host         |   1 -
 package/mke2img/Config.in.host |  11 ---
 package/mke2img/mke2img        | 205 -----------------------------------------
 package/mke2img/mke2img.mk     |  13 ---
 8 files changed, 89 insertions(+), 253 deletions(-)
 delete mode 100644 package/mke2img/Config.in.host
 delete mode 100755 package/mke2img/mke2img
 delete mode 100644 package/mke2img/mke2img.mk

--
2.13.2
