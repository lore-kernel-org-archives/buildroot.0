From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu,  8 Oct 2020 11:08:36 +0200
Subject: [Buildroot] [PATCH v3 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201008090836.2670553-1-antoine.tenart@bootlin.com>
References: <20201008090836.2670553-1-antoine.tenart@bootlin.com>
Message-ID: <20201008090836.2670553-2-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch sets the --with-xattr option when generating an image with
mkfs.jffs2, so that SELinux security contexts and other extended
attributes will be kept and available in jffs2 images.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---

Since v2:
  - Removed condition on BR2_PACKAGE_LIBSELINUX.

Since v1:
  - s/BR2_PACKAGE_REFPOLICY/BR2_PACKAGE_LIBSELINUX/

 fs/jffs2/jffs2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/jffs2.mk b/fs/jffs2/jffs2.mk
index 2adbc2320e38..0096af2ea966 100644
--- a/fs/jffs2/jffs2.mk
+++ b/fs/jffs2/jffs2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JFFS2_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
+JFFS2_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE) --with-xattr
 SUMTOOL_OPTS = -e $(BR2_TARGET_ROOTFS_JFFS2_EBSIZE)
 
 ifeq ($(BR2_TARGET_ROOTFS_JFFS2_PAD),y)
-- 
2.26.2
