From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 20:50:53 -0600
Subject: [Buildroot] [PATCH 1/1] package/prosody: use correct bit32 package
Message-ID: <20200525025053.3354588-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://prosody.im/doc/depends#bitop the correct bitop
package to use with prosody for Lua 5.1 is:
https://luarocks.org/modules/siffiejoe/bit32

As such replace BR2_PACKAGE_LUABITOP with BR2_PACKAGE_LUA_BIT32

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/prosody/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index c32ca20e23..0b01547103 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PROSODY
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_3
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
-	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
 	select BR2_PACKAGE_LUASEC # runtime
 	select BR2_PACKAGE_LUASOCKET # runtime
-- 
2.25.1
