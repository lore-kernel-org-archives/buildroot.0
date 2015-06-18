From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Jun 2015 23:36:00 +0200
Subject: [Buildroot] [git commit] lua: bump to version 5.3.1
Message-ID: <20150618213631.DBB7781E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0778c99e478f23e88761c381a73aa85e385622c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/{5.3.0 => 5.3.1}/0001-root-path.patch  |    2 +-
 .../0002-shared-libs-for-lua.patch                 |    0
 package/lua/{5.3.0 => 5.3.1}/0004-lua-pc.patch     |    0
 package/lua/{5.3.0 => 5.3.1}/0011-linenoise.patch  |    8 ++++----
 package/lua/lua.hash                               |    4 ++--
 package/lua/lua.mk                                 |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/lua/5.3.0/0001-root-path.patch b/package/lua/5.3.1/0001-root-path.patch
similarity index 95%
rename from package/lua/5.3.0/0001-root-path.patch
rename to package/lua/5.3.1/0001-root-path.patch
index 660bc15..d8ef8d0 100644
--- a/package/lua/5.3.0/0001-root-path.patch
+++ b/package/lua/5.3.1/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -175,7 +175,7 @@
+@@ -188,7 +188,7 @@
 
  #else			/* }{ */
 
diff --git a/package/lua/5.3.0/0002-shared-libs-for-lua.patch b/package/lua/5.3.1/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.0/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.1/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.0/0004-lua-pc.patch b/package/lua/5.3.1/0004-lua-pc.patch
similarity index 100%
rename from package/lua/5.3.0/0004-lua-pc.patch
rename to package/lua/5.3.1/0004-lua-pc.patch
diff --git a/package/lua/5.3.0/0011-linenoise.patch b/package/lua/5.3.1/0011-linenoise.patch
similarity index 88%
rename from package/lua/5.3.0/0011-linenoise.patch
rename to package/lua/5.3.1/0011-linenoise.patch
index b2e5695..ccdd3fd 100644
--- a/package/lua/5.3.0/0011-linenoise.patch
+++ b/package/lua/5.3.1/0011-linenoise.patch
@@ -8,10 +8,10 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -85,6 +85,15 @@
-           add_history(lua_tostring(L, idx));  /* add it to history */
+@@ -83,6 +83,15 @@
+ #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
-
+ 
 +#elif defined(LUA_USE_LINENOISE)
 +
 +#include <linenoise.h>
@@ -22,5 +22,5 @@ Index: b/src/lua.c
 +#define lua_freeline(L,b)	((void)L, free(b))
 +
  #else				/* }{ */
-
+ 
  #define lua_readline(L,b,p) \
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index fe36dcd..f0fa87d 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,6 +1,6 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 a1b0a7e92d0c85bbff7a8d27bf29f8af           lua-5.3.0.tar.gz
-sha1 1c46d1c78c44039939e820126b86a6ae12dadfba  lua-5.3.0.tar.gz
+md5 797adacada8d85761c079390ff1d9961           lua-5.3.1.tar.gz
+sha1 1676c6a041d90b6982db8cef1e5fb26000ab6dee  lua-5.3.1.tar.gz
 
 md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
 sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index cdcf47b..1279b76 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.0
+LUA_VERSION = 5.3.1
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.4
