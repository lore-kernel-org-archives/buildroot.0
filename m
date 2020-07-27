From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:33:00 +0200
Subject: [Buildroot] [PATCH 9/9 v2] package/luaposix: select bit32 based on
 lua ABI version 5.1
In-Reply-To: <cover.1595881971.git.yann.morin.1998@free.fr>
References: <cover.1595881971.git.yann.morin.1998@free.fr>
Message-ID: <38bcaecb671e2bb943336715c1fd92c8cb3cff23.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Since the bit32 module is needed by all lua ABI 5.1 providers we can
select based on the lua ABI version instead of both lua 5.1 and luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luaposix/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index cedb3a6654..85943f9915 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
-	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
 	  like most libraries it simply binds to C APIs on the
-- 
2.20.1
