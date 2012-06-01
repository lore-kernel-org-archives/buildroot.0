From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 1 Jun 2012 11:58:27 +0200
Subject: [Buildroot] [PATCH 2/2] luajit: fix dependencies of Lua modules
Message-ID: <CAB0FRssu7PT0PFZm32zwsiMRi3ZtFH0V5Pt=BQykiqwrhUQWzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cgilua/Config.in        |    1 -
 package/copas/Config.in         |    1 -
 package/lua/Config.in           |    3 +--
 package/luafilesystem/Config.in |    1 -
 package/luasocket/Config.in     |    1 -
 package/rings/Config.in         |    1 -
 package/xavante/Config.in       |    1 -
 7 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index b43ba97..855ff48 100644
--- a/package/cgilua/Config.in
+++ b/package/cgilua/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CGILUA
 	bool "cgilua"
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_LUAFILESYSTEM
 	help
 	  CGILua is a tool for creating dynamic HTML pages
diff --git a/package/copas/Config.in b/package/copas/Config.in
index 36abcc1..9969c8f 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_COPAS
 	bool "copas"
 	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUASOCKET
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY # for luasocket
 	help
 	  Copas is a dispatcher based on coroutines that
 	  can be used by TCP/IP servers.
diff --git a/package/lua/Config.in b/package/lua/Config.in
index 56eba35..b9cde26 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.

@@ -8,14 +9,12 @@ config BR2_PACKAGE_LUA
 config BR2_PACKAGE_LUA_COMPILER
 	bool "lua compiler"
 	depends on BR2_PACKAGE_LUA
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Install luac binary

 config BR2_PACKAGE_LUA_INTERPRETER
 	bool "lua interpreter"
 	depends on BR2_PACKAGE_LUA
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Install lua binary

diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index edcb414..7c130f8 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 298db56..4526303 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/rings/Config.in b/package/rings/Config.in
index 2fe14aa..d1f1efe 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Provides a way to create new Lua states from within Lua.

diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index a7df530..db34d66 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
-	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	select BR2_PACKAGE_CGILUA
 	select BR2_PACKAGE_COPAS
 	select BR2_PACKAGE_COXPCALL
-- 
1.7.9.5
