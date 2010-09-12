From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:55 +0200
Subject: [Buildroot] [PATCH 09/74] pango: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <918978d4ad82f9c4caaad30ec8fbcd8db0171f57.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pango/pango.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 875c0bc..dc04b55 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -54,8 +54,10 @@ else
         PANGO_CONF_OPT += --without-x
 endif
 
-$(eval $(call AUTOTARGETS,package,pango))
-
-$(PANGO_HOOK_POST_INSTALL):
+define PANGO_INSTALL_INITSCRIPT
 	$(INSTALL) -m 755 package/pango/S25pango $(TARGET_DIR)/etc/init.d/
-	touch $@
+endef
+
+PANGO_POST_INSTALL_TARGET_HOOKS += PANGO_INSTALL_INITSCRIPT
+
+$(eval $(call AUTOTARGETS,package,pango))
-- 
1.7.0.4
