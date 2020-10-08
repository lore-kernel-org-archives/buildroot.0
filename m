From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 21:48:03 +0200
Subject: [Buildroot] [git commit] fs/jffs2: copy xattrs
Message-ID: <20201008193720.854367FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1e268670be761e3cae7bf0dd9e284a52401e37d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch sets the --with-xattr option when generating an image with
mkfs.jffs2, so that SELinux security contexts and other extended
attributes will be kept and available in jffs2 images.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/jffs2/jffs2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 2adbc2320e..0096af2ea9 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JFFS2_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
+JFFS2_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE) --with-xattr
 SUMTOOL_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_PAD),y)
