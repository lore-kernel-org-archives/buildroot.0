From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  1 Dec 2015 20:20:14 +0100
Subject: [Buildroot] [V2] lua: bump to version 5.3.2
Message-ID: <1448997614-13707-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch           | 0
 package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch              | 2 +-
 package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch           | 6 ++----
 package/lua/lua.hash                                        | 4 ++--
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 7 insertions(+), 9 deletions(-)
 rename package/lua/{5.3.1 => 5.3.2}/0001-root-path.patch (100%)
 rename package/lua/{5.3.1 => 5.3.2}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.3.1 => 5.3.2}/0004-lua-pc.patch (97%)
 rename package/lua/{5.3.1 => 5.3.2}/0011-linenoise.patch (78%)

diff --git a/package/lua/5.3.1/0001-root-path.patch b/package/lua/5.3.2/0001-root-path.patch
similarity index 100%
rename from package/lua/5.3.1/0001-root-path.patch
rename to package/lua/5.3.2/0001-root-path.patch
diff --git a/package/lua/5.3.1/0002-shared-libs-for-lua.patch b/package/lua/5.3.2/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.1/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.2/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.1/0004-lua-pc.patch b/package/lua/5.3.2/0004-lua-pc.patch
similarity index 97%
rename from package/lua/5.3.1/0004-lua-pc.patch
rename to package/lua/5.3.2/0004-lua-pc.patch
index d3129d7..8d6cf0e 100644
--- a/package/lua/5.3.1/0004-lua-pc.patch
+++ b/package/lua/5.3.2/0004-lua-pc.patch
@@ -14,7 +14,7 @@ Index: b/etc/lua.pc
 +# grep '^V=' ../Makefile
 +V= 5.3
 +# grep '^R=' ../Makefile
-+R= 5.3.0
++R= 5.3.2
 +
 +# grep '^INSTALL_.*=' ../Makefile | sed 's/INSTALL_TOP/prefix/'
 +prefix= /usr
diff --git a/package/lua/5.3.1/0011-linenoise.patch b/package/lua/5.3.2/0011-linenoise.patch
similarity index 78%
rename from package/lua/5.3.1/0011-linenoise.patch
rename to package/lua/5.3.2/0011-linenoise.patch
index ccdd3fd..f3ced2b 100644
--- a/package/lua/5.3.1/0011-linenoise.patch
+++ b/package/lua/5.3.2/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -83,6 +83,15 @@
+@@ -83,6 +83,13 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
@@ -16,9 +16,7 @@ Index: b/src/lua.c
 +
 +#include <linenoise.h>
 +#define lua_readline(L,b,p)	((void)L, ((b)=linenoise(p)) != NULL)
-+#define lua_saveline(L,idx) \
-+	if (lua_rawlen(L,idx) > 0)  /* non-empty line? */ \
-+	  linenoiseHistoryAdd(lua_tostring(L, idx));  /* add it to history */
++#define lua_saveline(L,line)	((void)L, linenoiseHistoryAdd(line))
 +#define lua_freeline(L,b)	((void)L, free(b))
 +
  #else				/* }{ */
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index f0fa87d..8f0242e 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -1,6 +1,6 @@
 # Hashes from: http://www.lua.org/ftp/
-md5 797adacada8d85761c079390ff1d9961           lua-5.3.1.tar.gz
-sha1 1676c6a041d90b6982db8cef1e5fb26000ab6dee  lua-5.3.1.tar.gz
+md5 33278c2ab5ee3c1a875be8d55c1ca2a1           lua-5.3.2.tar.gz
+sha1 7a47adef554fdca7d0c5536148de34579134a973  lua-5.3.2.tar.gz
 
 md5 913fdb32207046b273fdb17aad70be13           lua-5.2.4.tar.gz
 sha1 ef15259421197e3d85b7d6e4871b8c26fd82c1cf  lua-5.2.4.tar.gz
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 1279b76..37992f2 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.1
+LUA_VERSION = 5.3.2
 else
 ifeq ($(BR2_PACKAGE_LUA_5_2),y)
 LUA_VERSION = 5.2.4
-- 
2.5.0
