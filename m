From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 22:39:16 +0200
Subject: [Buildroot] [git commit] dmalloc: Stop libdmalloc*.so files from
	being deleted from staging directory
Message-ID: <20130504204137.AA23999AB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93e5c7d9f2964dcee6acca94e17075f042ba1751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix libdmalloc*.so files being deleted from the staging directory as the
package is installed into the target.

Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
---
 package/dmalloc/dmalloc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 8623829..fd4e976 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -47,7 +47,7 @@ define DMALLOC_INSTALL_STAGING_CMDS
 endef
 
 define DMALLOC_INSTALL_TARGET_CMDS
-	mv $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
+	cp -dpf $(STAGING_DIR)/usr/lib/libdmalloc*.so $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/bin/dmalloc $(TARGET_DIR)/usr/bin/dmalloc
 endef
 
