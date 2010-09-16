From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] sqlite: use correct step
	override method
Message-ID: <20100916113829.94F5D8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bcffe7a77e59fd5c89e33c1128b0aa241c00558c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
