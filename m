From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 14 Feb 2011 22:27:30 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: remove dead code
	(TARGET_SKELETON_PATCH)
Message-ID: <20110214213222.9706A8F4DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f16f2a5feed3a4e8de604c1d2cac82ca9b6de6dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_SKELETON_PATCH is no longer in use, so remove it.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
