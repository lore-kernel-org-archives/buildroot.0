From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:30:59 +0200
Subject: [Buildroot] [git commit] package/luaposix: select bit32 based on
 lua ABI version 5.1
Message-ID: <20200727203323.508237FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38bcaecb671e2bb943336715c1fd92c8cb3cff23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
