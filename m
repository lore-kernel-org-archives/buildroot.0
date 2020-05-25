From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:41 -0600
Subject: [Buildroot] [PATCH v3 5/9] package/luaposix: select bit32 based on
 lua ABI version 5.1
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-5-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the bit32 module is needed by all lua ABI 5.1 providers we can
select based on the lua ABI version instead of both lua 5.1 and luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/luaposix/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 1e2291b3f5..34de7093c9 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LUAPOSIX
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
-	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT # runtime
+	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	help
 	  This is a POSIX binding for LuaJIT, Lua 5.1, 5.2 and 5.3;
 	  like most libraries it simply binds to C APIs on the
-- 
2.25.1
