From: Nathan Ford <nford@westpond.com>
Date: Wed, 30 Dec 2015 17:46:04 -0500
Subject: [Buildroot] [PATCH 1/1] Fix VCS folders not being excluded from
	rootfs
Message-ID: <1451515564-10008-1-git-send-email-nford@westpond.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a typo in skeleton.mk preventing rsync from excluding VCS
folders such as .svn

Signed-off-by: Nathan Ford <nford@westpond.com>
---
 package/skeleton/skeleton.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 790afaf..d640e24 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -78,7 +78,7 @@ endef
 endif
 
 define SKELETON_INSTALL_TARGET_CMDS
-	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
+	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
 	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
-- 
1.7.9.5
