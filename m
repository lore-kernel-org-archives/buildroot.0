From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:24:10 +0200
Subject: [Buildroot] [git commit branch/next] package/luabitop: depends on
 lua 5.1
Message-ID: <20200808162412.0F1EC8157B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=166da1ca332101890e33fd91781d475896fa1a42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the introduction of Lua 5.4, clarify the dependency
of luabitop: it only makes sense when used with Lua 5.1.

Also update the comment to no longer mention Lua 5.2, since we don't
support Lua 5.2 in Buildroot anymore.

Note that as explained in https://luajit.org/extensions.html, LuaJit
already implements luabitop functions, so luabitop is really for Lua
5.1 only, not for all Lua interpreters that implemented the 5.1 ABI.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luabitop/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index a819fe8ae7..656b1c7391 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
-	depends on !BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_1
 	help
 	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds
 	  bitwise operations on numbers.
 
 	  http://bitop.luajit.org
 
-comment "luabitop needs a Lua 5.1/5.2 interpreter"
-	depends on BR2_PACKAGE_LUA_5_3
+comment "luabitop needs Lua 5.1"
+	depends on !BR2_PACKAGE_LUA_5_1
