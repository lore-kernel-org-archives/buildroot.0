From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 08:21:40 +0200
Subject: [Buildroot] [PATCH] package/prosody: fix dependency
Message-ID: <20200728062141.2969363-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LuaBitOp is not available with Lua 5.3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 4b7ea9425..bb3a5025f 100644
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
-- 
2.25.1
