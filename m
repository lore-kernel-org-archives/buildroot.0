From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Dec 2015 10:35:13 +0100
Subject: [Buildroot] [git commit] skeleton: fix VCS folders not being
	excluded from rootfs
Message-ID: <20151231093532.80A407FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f61257b40ff93a6a4ddd2e2ec4a62eedab52c855
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a typo in skeleton.mk preventing rsync from excluding VCS
folders such as .svn.

Signed-off-by: Nathan Ford <nford@westpond.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton/skeleton.mk | 2 +-
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
