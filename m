From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 26 Feb 2014 11:03:14 +0100
Subject: [Buildroot] [lua v2 1/4] lua: remove LUA_INSTALLED_FILES
In-Reply-To: <1393408997-32259-1-git-send-email-francois.perrad@gadz.org>
References: <1393408997-32259-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393408997-32259-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useless since the uninstall commands were removed in eb7bd9ef

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua/lua.mk |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 2c867f6..a20531c 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -104,16 +104,5 @@ define HOST_LUA_INSTALL_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include/lauxlib.h
 endef
 
-LUA_INSTALLED_FILES = \
-	/usr/include/lua.h \
-	/usr/include/luaconf.h \
-	/usr/include/lualib.h \
-	/usr/include/lauxlib.h \
-	/usr/lib/pkgconfig/lua.pc \
-	/usr/bin/lua \
-	/usr/bin/luac \
-	/usr/lib/liblua.a \
-	/usr/lib/liblua.so*
-
 $(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
1.7.9.5
