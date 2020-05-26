From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:28:36 +0200
Subject: [Buildroot] [git commit] package/prosody: use correct bit32 package
Message-ID: <20200526201133.AF2C6852D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa84c176c2148a60103e850204180f86aa5baa73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to https://prosody.im/doc/depends#bitop the correct bitop
package to use with prosody for Lua 5.1 is:
https://luarocks.org/modules/siffiejoe/bit32

As such replace BR2_PACKAGE_LUABITOP with BR2_PACKAGE_LUA_BIT32

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
