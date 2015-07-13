From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 10:18:47 +0200
Subject: [Buildroot] [PATCH v2 4/4] Makefile: staging symlink uses a
	relative path
In-Reply-To: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
References: <1436775527-2484-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436775527-2484-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A step forward toward a relocatable SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index daf692e..30a2d0e 100644
--- a/Makefile
+++ b/Makefile
@@ -447,7 +447,7 @@ $(STAGING_DIR):
 	@ln -snf lib $(STAGING_DIR)/usr/$(LIB_SYMLINK)
 	@mkdir -p $(STAGING_DIR)/usr/include
 	@mkdir -p $(STAGING_DIR)/usr/bin
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+	@ln -snf $(subst $(BASE_DIR)/,,$(STAGING_DIR)) $(BASE_DIR)/staging
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
 TARGET_SKELETON = $(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
-- 
2.4.5
