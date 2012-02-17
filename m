From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 17 Feb 2012 17:12:48 +0100
Subject: [Buildroot] [PATCH] Print a message before executing the post-build
	script
Message-ID: <1329495168-4879-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 7d8dd2e..7785d01 100644
--- a/Makefile
+++ b/Makefile
@@ -480,6 +480,7 @@ endif
 	echo $(BR2_VERSION_FULL) > $(TARGET_DIR)/etc/br-version
 
 ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
+	@$(call MESSAGE,"Executing post-build script")
 	$(BR2_ROOTFS_POST_BUILD_SCRIPT) $(TARGET_DIR)
 endif
 
-- 
1.7.5.4
