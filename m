From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:07:44 +0100
Subject: [Buildroot] [git commit] luabitop: disabled for Lua 5.3
Message-ID: <20160116130808.9F3468184D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be5d265220f36df7e0b633fcc55e3a33b2e74035
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see failure in http://autobuild.buildroot.net/results/6306c929e9ee05cbb33e4eb6b590166c6554ec21/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
