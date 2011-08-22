From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Aug 2011 13:38:42 +0200
Subject: [Buildroot] [git commit] mtd: bump to 1.4.6
Message-ID: <20110822143425.BA45E8CA5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31fc47771778426dddf9a20465fedaf73ce32440
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 78ab765..58b5ce1 100644
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
@@ -22,8 +22,8 @@ define HOST_MTD_INSTALL_CMDS
 	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
 endef
 
-MKFS_JFFS2=$(HOST_DIR)/usr/sbin/mkfs.jffs2
-SUMTOOL=$(HOST_DIR)/usr/sbin/sumtool
+MKFS_JFFS2 = $(HOST_DIR)/usr/sbin/mkfs.jffs2
+SUMTOOL = $(HOST_DIR)/usr/sbin/sumtool
 
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOCFDISK)		+= docfdisk
 MTD_TARGETS_$(BR2_PACKAGE_MTD_DOC_LOADBIOS)	+= doc_loadbios
-- 
1.7.3.4
