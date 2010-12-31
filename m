From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 31 Dec 2010 08:39:05 -0300
Subject: [Buildroot] [PATCH 5/6] toolchain: do staging symlink
In-Reply-To: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293795546-19674-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make an output/staging -> sysroot symlink just for compatibility
purposes.
This may be gone in the future so don't count on it, use $(STAGING_DIR)
instead.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index f2f0dd0..5c6ed14 100644
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
