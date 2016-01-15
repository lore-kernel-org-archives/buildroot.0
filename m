From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 15 Jan 2016 09:28:52 +0100
Subject: [Buildroot] [PATCH] luabitop: disabled for Lua 5.3
Message-ID: <1452846532-7780-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see failure in http://autobuild.buildroot.net/results/6306c929e9ee05cbb33e4eb6b590166c6554ec21/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luabitop/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index c5b3f60..26442fc 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
-	depends on !BR2_PACKAGE_LUA_32BITS
+	depends on !BR2_PACKAGE_LUA_5_3
 	help
 	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
 	  operations on numbers.
 
 	  http://bitop.luajit.org
 
-comment "luabitop needs a full Lua interpreter"
-	depends on BR2_PACKAGE_LUA_32BITS
+comment "luabitop needs a Lua 5.1/5.2 interpreter"
+	depends on BR2_PACKAGE_LUA_5_3
-- 
2.5.0
