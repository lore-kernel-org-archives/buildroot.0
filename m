From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:33:34 +0200
Subject: [Buildroot] [git commit] luajit: fix dependencies of Lua modules
Message-ID: <20120718173430.B63E590ABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb0af9388713497ac7917174518e8703b7887751
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_LUA_SHARED_LIBRARY is an internal of lua package

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgilua/Config.in        |    1 -
 package/copas/Config.in         |    1 -
 package/luafilesystem/Config.in |    1 -
 package/luasocket/Config.in     |    1 -
 package/rings/Config.in         |    1 -
 package/xavante/Config.in       |    1 -
 6 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/cgilua/Config.in b/package/cgilua/Config.in
index 2f9c452..01928f0 100644
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
