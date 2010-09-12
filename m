From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:05 +0200
Subject: [Buildroot] [PATCH 19/74] liboil: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f80d06457279c27689fddcb7ef110f30547f4d7b.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
