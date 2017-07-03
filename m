From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  4 Jul 2017 00:50:57 +0200
Subject: [Buildroot] [PATCH v3 02/11] fs/ext2: always pass the number of
	inodes
In-Reply-To: <20170703225106.1492-1-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
Message-ID: <20170703225106.1492-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... since zero also means auto for the mke2img script, now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- reintroduce this change from Yann' series
---
 fs/ext2/ext2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
index 9d3e8fd666..3fc12d7499 100644
--- a/fs/ext2/ext2.mk
+++ b/fs/ext2/ext2.mk
@@ -8,9 +8,8 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
 
 EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
 
-ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
 EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
-endif
+
 EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
 
 ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
-- 
2.13.2
