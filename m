From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 12 Feb 2011 00:25:33 +0100
Subject: [Buildroot] [PATCH] Makefile: remove dead code
	(TARGET_SKELETON_PATCH)
Message-ID: <1297466733-32105-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TARGET_SKELETON_PATCH is no longer in use, so remove it.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index be4c078..111fbd6 100644
--- a/Makefile
+++ b/Makefile
@@ -422,9 +422,6 @@ $(BUILD_DIR)/.root:
 		if [ -d "$(TARGET_SKELETON)" ]; then \
 			cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 		fi; \
-		if [ -d "$(TARGET_SKELETON_PATCH)" ]; then \
-			toolchain/patch-kernel.sh $(TARGET_DIR) $(TARGET_SKELETON_PATCH)/ \*patch\*; \
-		fi; \
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
-- 
1.7.1
