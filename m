From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:33 +0200
Subject: [Buildroot] [PATCH 47/74] sqlite: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <bcffe7a77e59fd5c89e33c1128b0aa241c00558c.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.mk |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1d336f6..c7d0731 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -35,15 +35,16 @@ else
 SQLITE_CONF_OPT += --disable-readline
 endif
 
-$(eval $(call AUTOTARGETS,package,sqlite))
-
-$(SQLITE_TARGET_UNINSTALL):
-	$(call MESSAGE,"Uninstalling")
+define SQLITE_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/sqlite3
 	rm -f $(TARGET_DIR)/usr/lib/libsqlite3*
+endef
+
+define SQLITE_UNINSTALL_STAGING_CMDS
 	rm -f $(STAGING_DIR)/usr/bin/sqlite3
 	rm -f $(STAGING_DIR)/usr/lib/libsqlite3*
 	rm -f $(STAGING_DIR)/usr/lib/pkgconfig/sqlite3.pc
 	rm -f $(STAGING_DIR)/usr/include/sqlite3*.h
-	rm -f $(SQLITE_TARGET_INSTALL_TARGET) $(SQLITE_HOOK_POST_INSTALL)
+endef
 
+$(eval $(call AUTOTARGETS,package,sqlite))
-- 
1.7.0.4
