From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:47:56 +0200
Subject: [Buildroot] [git commit branch/next] package/prosody: luabitop is
 only needed with Lua 5.1
Message-ID: <20200812144329.4961185F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bd7239ca32f20102aad19dbb3ca647182edbf92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The luabitop package is only available with Lua 5.1. LuaJIT, Lua 5.3
or more recent versions of Lua have this functionality built-in.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 4b7ea94256..bb3a5025fa 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PROSODY
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
-	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1 # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
