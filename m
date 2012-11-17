From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 17 Nov 2012 11:05:43 +0100
Subject: [Buildroot] [PATCH] host-lua: fix bug #5354
Message-ID: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see https://bugs.busybox.net/show_bug.cgi?id=5354

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/lua.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 9e0d387..3ce9867 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -24,7 +24,7 @@ endif
 # We never want to have host-readline and host-ncurses as dependencies
 # of host-lua.
 HOST_LUA_DEPENDENCIES =
-HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
+HOST_LUA_CFLAGS = -Wall -fPIC -fno-stack-protector -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 HOST_LUA_MYLIBS = -ldl
 
 define LUA_BUILD_CMDS
-- 
1.7.9.5
