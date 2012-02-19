From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 23:06:31 +0100
Subject: [Buildroot] [git commit] Avoid the warnings about the redefinition
	of LUA_USE_DLOPEN, when BR2_PACKAGE_LUA_INTERPRETER_READLINE is set
Message-ID: <20120301130635.F21EF90BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3175e72e054a9b088903cf625a66ccfe9fd4404e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See src/luaconf.h lines 36-40

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lua/lua.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 1dabedf..30e95b4 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -9,7 +9,7 @@ LUA_SITE = http://www.lua.org/ftp
 LUA_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LUA_SHARED_LIBRARY),y)
-	LUA_MYCFLAGS += -fPIC -DLUA_USE_DLOPEN
+	LUA_MYCFLAGS += -fPIC
 	LUA_MYLIBS += -ldl
 endif
 
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_LUA_INTERPRETER_READLINE),y)
 	LUA_MYLIBS += -lreadline -lhistory -lncurses
 	LUA_MYCFLAGS += -DLUA_USE_LINUX
 else
-	LUA_MYCFLAGS += -DLUA_USE_POSIX
+	LUA_MYCFLAGS += -DLUA_USE_POSIX -DLUA_USE_DLOPEN
 endif
 
 HOST_LUA_DEPENDENCIES =
