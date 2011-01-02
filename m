From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jan 2011 22:55:37 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: do staging symlink
Message-ID: <20110102220443.BCCD58F346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ad139ebc9916413d25cfe1603da9aef89752231
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make an output/staging -> sysroot symlink just for compatibility
purposes.
This may be gone in the future so don't count on it, use $(STAGING_DIR)
instead.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e634848..7e08cf3 100644
--- a/Makefile
+++ b/Makefile
@@ -394,6 +394,7 @@ $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/usr/lib
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
+	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
@@ -605,7 +606,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(TOOLCHAIN_EXTERNAL_DIR)
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging \
+		$(TOOLCHAIN_EXTERNAL_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
-- 
1.7.2.2
