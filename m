From: Markos Chandras <markos.chandras@imgtec.com>
Date: Fri, 16 Mar 2012 10:37:30 +0000
Subject: [Buildroot] [PATCH] xfsprogs: Add missing timestamp files
Message-ID: <1331894250-26337-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added a compiled and an installed timestamp files for compilation and
installation phases respectively.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/xfsprogs/xfsprogs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 68db2f7..ba06d4a 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -68,6 +68,7 @@ else
 	$(STRIPCMD) $(XFSPROGS_DIR)/lib*/lib*.so.*.*
 endif
 	touch -c $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
+	touch $(XFSPROGS_DIR)/.compiled
 
 $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) \
@@ -76,6 +77,7 @@ $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY): $(XFSPROGS_DIR)/$(XFSPROGS_BINARY)
 	    -C $(XFSPROGS_DIR) install
 	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	touch -c $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
+	touch $(XFSPROGS_DIR)/.installed
 
 xfsprogs: util-linux $(TARGET_DIR)/$(XFSPROGS_TARGET_BINARY)
 
-- 
1.7.1
