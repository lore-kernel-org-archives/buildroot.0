From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 14:43:49 +0100
Subject: [Buildroot] [git commit] lua: remove LUA_INSTALLED_FILES
Message-ID: <20140226140759.2E9B19BAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0127a1cc5a688d2acb8969bd692e5de1765999e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Useless since the uninstall commands were removed in eb7bd9ef

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/lua.mk |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

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
