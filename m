From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 17:15:00 +0200
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.3
Message-ID: <20210330145155.F14DF86283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=013652170f7e39ae3d406764992b4b664c01e47f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.4.2/lua.hash                                  | 6 ------
 package/lua/{5.4.2 => 5.4.3}/0001-root-path.patch           | 2 +-
 package/lua/{5.4.2 => 5.4.3}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.2 => 5.4.3}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.3/lua.hash                                  | 6 ++++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/lua/5.4.2/lua.hash b/package/lua/5.4.2/lua.hash
deleted file mode 100644
index f916c8e4ef..0000000000
--- a/package/lua/5.4.2/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-md5  49c92d6a49faba342c35c52e1ac3f81e  lua-5.4.2.tar.gz
-sha1  96d4a21393c94bed286b8dc0568f4bdde8730b22  lua-5.4.2.tar.gz
-
-# Locally computed
-sha256  17bd5781d5dfa8c946fea639984fcbcb499d8bb3056a3c2cb5c15c3da5d1c207  doc/readme.html
diff --git a/package/lua/5.4.2/0001-root-path.patch b/package/lua/5.4.3/0001-root-path.patch
similarity index 95%
rename from package/lua/5.4.2/0001-root-path.patch
rename to package/lua/5.4.3/0001-root-path.patch
index 8e82c1ce59..c4f6e312eb 100644
--- a/package/lua/5.4.2/0001-root-path.patch
+++ b/package/lua/5.4.3/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -212,7 +212,7 @@
+@@ -217,7 +217,7 @@
  
  #else			/* }{ */
  
diff --git a/package/lua/5.4.2/0002-shared-libs-for-lua.patch b/package/lua/5.4.3/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.2/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.3/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.2/0011-linenoise.patch b/package/lua/5.4.3/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.2/0011-linenoise.patch
rename to package/lua/5.4.3/0011-linenoise.patch
index e842e5b1ef..7b9d6d76f3 100644
--- a/package/lua/5.4.2/0011-linenoise.patch
+++ b/package/lua/5.4.3/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -401,6 +401,14 @@
+@@ -421,6 +421,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.3/lua.hash b/package/lua/5.4.3/lua.hash
new file mode 100644
index 0000000000..be3604837f
--- /dev/null
+++ b/package/lua/5.4.3/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: https://www.lua.org/ftp/
+md5  ef63ed2ecfb713646a7fcc583cf5f352  lua-5.4.3.tar.gz
+sha1  1dda2ef23a9828492b4595c0197766de6e784bc7  lua-5.4.3.tar.gz
+
+# Locally computed
+sha256  d205bfea131113bcdd64d4ebe4a50ce34063b42bad24b93e44b4b0d853ae4d49  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index e3a415a06a..b385b78b30 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.2
+LUA_VERSION = 5.4.3
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
