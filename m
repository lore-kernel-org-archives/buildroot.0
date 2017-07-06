From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  6 Jul 2017 22:58:47 +0200
Subject: [Buildroot] [PATCH 1/3] mtd: fix build issues on older hosts
Message-ID: <20170706205849.22298-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the MTD test programs requires the MS_DIRSYNC, which is not
necessarily available on old build machines. But obviously, MTD test
programs are not needed, so we can simply disable them, as they were
prior to the migration to mtd 2.0.

Fixes:

  http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtd/mtd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 7c3a2b6..043f1c7 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -45,6 +45,7 @@ MTD_CONF_OPTS += --without-xattr
 endif
 
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
+HOST_MTD_CONF_OPTS = --disable-tests
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
 SUMTOOL = $(HOST_DIR)/sbin/sumtool
-- 
2.9.4
