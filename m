From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 20 Feb 2012 17:11:36 +0100
Subject: [Buildroot] [PATCH] Makefile: remove toolchainfile.cmake on 'make
	clean'
Message-ID: <1329754296-3895-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 428084b..25bb8f2 100644
--- a/Makefile
+++ b/Makefile
@@ -626,7 +626,8 @@ endif
 
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
-		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) $(BASE_DIR)/staging
+		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR) \
+		$(BASE_DIR)/staging $(BASE_DIR)/toolchainfile.cmake
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
-- 
1.7.5.4
