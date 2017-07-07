From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 09:58:21 +0200
Subject: [Buildroot] [git commit] mtd: fix build issues on older hosts
Message-ID: <20170707075657.09ED27FC2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf253d388f1a55414996da4c1ea6a38250a100c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the MTD test programs requires the MS_DIRSYNC, which is not
necessarily available on old build machines. But obviously, MTD test
programs are not needed, so we can simply disable them, as they were
prior to the migration to mtd 2.0.

Fixes:

  http://autobuild.buildroot.net/results/21e1ad2a4560b6d3ba6490d20ae064246e66d5c1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
