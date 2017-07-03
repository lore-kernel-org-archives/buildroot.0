From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 00:50:55 +0200
Subject: [Buildroot] [PATCH v3 00/11] fs/ext2: cleanup and improvement
Message-ID: <20170703225106.1492-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a respin of the short series based on 2 series initially sent
early last May by S?bastien Szymanski and Yann E. Morin, refactoring
and improving the ext* image support.

This series is mostly about merging (pruning less features from Yann
than the previous round ;-]) and updating these 2 series into
a single one.

The 8 first patchs clean up and add few mke2img options.

The 9th patch makes the change using mkfs instead mke2img.

The 10th patch adds support for FS options.

And the last commit removes the no longer used mke2img package.


Regards,


Samuel Martin (1):
  fs/ext2: deprecate BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES option

S?bastien Szymanski (3):
  fs/ext2: use mkfs to generate rootfs image
  fs/ext2: Add BR2_TARGET_ROOTFS_EXT2_FEATURES option
  package/mke2img: remove package

Yann E. MORIN (7):
  package/mke2img: specifying zero inodes means auto
  fs/ext2: always pass the number of inodes
  fs/ext2: always pass the label option
  fs/ext2: allow reserving zero block for root
  fs/ext2: simplify code
  package/mke2img: add option to specify block size
  fs/ext2: add option to specify block size

 Config.in.legacy               |  25 ++++++
 DEVELOPERS                     |   1 -
 fs/ext2/Config.in              |  58 +++++++++---
 fs/ext2/ext2.mk                |  32 +++----
 package/Config.in.host         |   1 -
 package/mke2img/Config.in.host |  11 ---
 package/mke2img/mke2img        | 199 -----------------------------------------
 package/mke2img/mke2img.mk     |  13 ---
 8 files changed, 87 insertions(+), 253 deletions(-)
 delete mode 100644 package/mke2img/Config.in.host
 delete mode 100755 package/mke2img/mke2img
 delete mode 100644 package/mke2img/mke2img.mk

--
2.13.2
