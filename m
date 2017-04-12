From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:21 +0200
Subject: [Buildroot] [PATCH 47/53] mtd: use PREFIX instead of DESTDIR for
	host installation
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-48-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PREFIX defaults to /usr, so setting DESTDIR installs things in
$(HOST_DIR)/usr.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/mtd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 218265af9f..6443ef0d93 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -46,7 +46,7 @@ define HOST_MTD_BUILD_CMDS
 endef
 
 define HOST_MTD_INSTALL_CMDS
-	$(MAKE1) BUILDDIR=$(@D) DESTDIR=$(HOST_DIR) -C $(@D) install
+	$(MAKE1) BUILDDIR=$(@D) PREFIX=$(HOST_DIR) -C $(@D) install
 endef
 
 MKFS_JFFS2 = $(HOST_DIR)/sbin/mkfs.jffs2
-- 
2.11.0
