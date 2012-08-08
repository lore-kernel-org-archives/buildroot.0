From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 8 Aug 2012 14:57:19 +0800
Subject: [Buildroot] [PATCH] buildroot: Makefile: Allow target board
	makefile fill in default target_skeleton path.
Message-ID: <1344409039-32071-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

If the target skeleton path is empty in config, don't change variable
TARGET_SKELETON in buildroot Makefile. Allow the target board makefile
fill in a default path.


Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 079af65..ce81045 100644
--- a/Makefile
+++ b/Makefile
@@ -399,8 +399,10 @@ $(STAGING_DIR):
 	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
 
 ifeq ($(BR2_ROOTFS_SKELETON_CUSTOM),y)
+ifneq ($(BR2_ROOTFS_SKELETON_CUSTOM_PATH),"")
 TARGET_SKELETON=$(BR2_ROOTFS_SKELETON_CUSTOM_PATH)
 endif
+endif
 
 $(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
-- 
1.7.0.4
