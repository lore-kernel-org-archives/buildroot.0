From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Dec 2017 22:53:26 +0100
Subject: [Buildroot] [git commit] fs/ubifs: split long line,
 use simple asignment
Message-ID: <20171227215332.2A39A82B84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62a198c0dbe2ccbb69d5872198b6a2f5deed5b2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This line has been sitting there unchanged for years now, but it does
not follow current best pratices, that is:
  - do not use imediate assignment,
  - split lines longer than ~80 chars.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/ubifs/ubifs.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.mk b/fs/ubifs/ubifs.mk
index 7b2b0fb..4f45acd 100644
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
