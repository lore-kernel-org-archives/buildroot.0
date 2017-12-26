From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Dec 2017 00:20:45 +0100
Subject: [Buildroot] [PATCH 1/3] fs/ubifs: split long line,
 use simple asignment
In-Reply-To: <cover.1514330428.git.yann.morin.1998@free.fr>
References: <cover.1514330428.git.yann.morin.1998@free.fr>
Message-ID: <030e68fba51d84fb5adfc41aff5ec9e356ed2766.1514330428.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This line has been sitting there unchanged for years now, but it does
not follow current best pratices, that is:
  - do not use imediate assignment,
  - split lines longer than ~80 chars.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/ubifs/ubifs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 7b2b0fb2cc..4f45acdc4a 100644
--- a/fs/ubifs/ubifs.mk
+++ b/fs/ubifs/ubifs.mk
@@ -4,7 +4,10 @@
 #
 ################################################################################
 
-UBIFS_OPTS := -e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) -c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
+UBIFS_OPTS = \
+	-e $(BR2_TARGET_ROOTFS_UBIFS_LEBSIZE) \
+	-c $(BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT) \
+	-m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
 
 ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_ZLIB),y)
 UBIFS_OPTS += -x zlib
-- 
2.11.0
