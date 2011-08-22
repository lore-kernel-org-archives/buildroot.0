From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 22 Aug 2011 12:38:27 +0200
Subject: [Buildroot] [PATCH] mtd: bump to 1.4.6
Message-ID: <4E5231A3.1090701@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mtd/mtd.mk |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: b/package/mtd/mtd.mk
===================================================================
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,9 +3,9 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.4.5
-MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
-MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
+MTD_VERSION = 1.4.6
+MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
+MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
@@ -22,8 +22,8 @@
 	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
 endef
 
-MKFS_JFFS2=$(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL=$(HOST_DIR)/usr/sbin/sumtool
+MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
+SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
