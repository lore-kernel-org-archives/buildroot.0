From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:29:36 +0200
Subject: [Buildroot] [git commit] lua-expat: bump to version 1.3.0
Message-ID: <20140404213202.D56149C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7dcbaa1a08723059d9bd045fc500f19a3e0ad3d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

which is now compatible with Lua 5.2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luaexpat/Config.in      |    4 ----
 package/luaexpat/luaexpat.mk    |    2 +-
 package/luaexpatutils/Config.in |    4 ----
 3 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 3394780..f8db318 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -2,11 +2,7 @@ config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
 	  http://matthewwild.co.uk/projects/luaexpat/
-
-comment "luaexpat needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index d507c2a..c6768dc 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.2.0-1
+LUAEXPAT_VERSION = 1.3.0-1
 LUAEXPAT_DEPENDENCIES = expat
 LUAEXPAT_LICENSE = MIT
 
diff --git a/package/luaexpatutils/Config.in b/package/luaexpatutils/Config.in
index 333f98d..cb2887a 100644
--- a/package/luaexpatutils/Config.in
+++ b/package/luaexpatutils/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LUAEXPATUTILS
 	bool "luaexpatutils"
 	select BR2_PACKAGE_LUAEXPAT
-	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  lxp.doc is a module that provides useful features for working with
 	  XML formats in LOM format as used by the LuaExpat project from Kepler.
 
 	  https://github.com/stevedonovan/LuaExpatUtils
-
-comment "luaexpatutils needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
