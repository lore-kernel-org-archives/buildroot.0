From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  3 Jul 2017 17:51:48 +0200
Subject: [Buildroot] [PATCH v2 0/6] fs/ext2: cleanup and improvement
Message-ID: <20170703155154.24104-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a short series based on 2 series initially sent early last May
by S?bastien Szymanski and Yann E. Morin, refactoring and improvement
the ext* image support.

This series is mostly about merging and updating these 2 series into
a single one.

Regards,


Samuel Martin (1):
  fs/ext2: simplify code

S?bastien Szymanski (3):
  fs/ext2: use mkfs to generate rootfs image
  fs/ext2: Add BR2_TARGET_ROOTFS_EXT2_FEATURES option
  package/mke2img: remove package

Yann E. MORIN (2):
  fs/ext2: always pass the label option
  fs/ext2: allow reserving zero block for root

 Config.in.legacy               |  40 +++++++++
 DEVELOPERS                     |   1 -
 fs/ext2/Config.in              |  44 +++++----
 fs/ext2/ext2.mk                |  30 +++----
 package/Config.in.host         |   1 -
 package/mke2img/Config.in.host |  11 ---
 package/mke2img/mke2img        | 199 -----------------------------------------
 package/mke2img/mke2img.mk     |  13 ---
 8 files changed, 80 insertions(+), 259 deletions(-)
 delete mode 100644 package/mke2img/Config.in.host
 delete mode 100755 package/mke2img/mke2img
 delete mode 100644 package/mke2img/mke2img.mk

--
2.13.2
