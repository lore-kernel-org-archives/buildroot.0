From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] liboil: convert old-style hook
	to new-style hook
Message-ID: <20100916113825.06E8B8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f80d06457279c27689fddcb7ef110f30547f4d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liboil/liboil.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/liboil/liboil.mk b/package/liboil/liboil.mk
index 1bb412f..4681282 100644
--- a/package/liboil/liboil.mk
+++ b/package/liboil/liboil.mk
@@ -35,9 +35,10 @@ endif
 
 LIBOIL_DEPENDENCIES = $(LIBOIL_GLIB_DEP)
 
-$(eval $(call AUTOTARGETS,package,liboil))
-
-$(LIBOIL_HOOK_POST_INSTALL):
-	# Remove useless bugreport program from the target
+define LIBOIL_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
-	touch $@
+endef
+
+LIBOIL_POST_INSTALL_TARGET_HOOKS += LIBOIL_TARGET_CLEANUP
+
+$(eval $(call AUTOTARGETS,package,liboil))
-- 
1.7.1
