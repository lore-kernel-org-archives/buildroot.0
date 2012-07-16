From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 16 Jul 2012 15:45:49 +0200
Subject: [Buildroot] [PATCH 2/5] lua : don't install static library in target
In-Reply-To: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1342446352-31231-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lua/lua.mk |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2fc838b..ab9a1a2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -79,11 +79,6 @@ define LUA_INSTALL_LIBRARY
 	$(INSTALL) $(@D)/src/liblua.so.$(LUA_VERSION) \
 		$(TARGET_DIR)/usr/lib/liblua.so.$(LUA_VERSION)
 	ln -sf liblua.so.$(LUA_VERSION) $(TARGET_DIR)/usr/lib/liblua.so
-	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
-endef
-else
-define LUA_INSTALL_LIBRARY
-	$(INSTALL) $(@D)/src/liblua.a $(TARGET_DIR)/usr/lib/liblua.a
 endef
 endif
 
-- 
1.7.9.5
