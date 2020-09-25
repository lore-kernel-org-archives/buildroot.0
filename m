From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 25 Sep 2020 20:17:17 +0200
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.3.6
Message-ID: <20200925181717.905681-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../lua/5.3.5/0003-fix-revision-number.patch  | 31 -------------------
 .../lua/{5.3.5 => 5.3.6}/0001-root-path.patch |  0
 .../0002-shared-libs-for-lua.patch            |  0
 .../lua/{5.3.5 => 5.3.6}/0011-linenoise.patch |  0
 package/lua/lua.hash                          |  5 +--
 package/lua/lua.mk                            |  2 +-
 6 files changed, 4 insertions(+), 34 deletions(-)
 delete mode 100644 package/lua/5.3.5/0003-fix-revision-number.patch
 rename package/lua/{5.3.5 => 5.3.6}/0001-root-path.patch (100%)
 rename package/lua/{5.3.5 => 5.3.6}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.3.5 => 5.3.6}/0011-linenoise.patch (100%)

diff --git a/package/lua/5.3.5/0003-fix-revision-number.patch b/package/lua/5.3.5/0003-fix-revision-number.patch
deleted file mode 100644
index ed2e0460e..000000000
--- a/package/lua/5.3.5/0003-fix-revision-number.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Fix revision number
-
-In 0002-shared-libs-for-lua.patch, revision number is used to set 
-library name:
-TO_SOLIB = liblua.so.$(R)
-
-However, library is built using PKG_VERSION which is passed only during
-build step:
-$(CC) -o $@.$(PKG_VERSION) -shared -Wl,-soname="$@.$(PKG_VERSION)" $?
-
-As a result, dynamic library is not installed in staging or target paths
-since bump to lua 5.3.5
-
-So, instead of replacing R by PKG_VERSION and passing this variable in
-all steps, simply update R to 5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -47,6 +47,6 @@
-
- # Lua version and release.
- V= 5.3
--R= $V.4
-+R= $V.5
-
- # Targets start here.
- all:    $(PLAT)
diff --git a/package/lua/5.3.5/0001-root-path.patch b/package/lua/5.3.6/0001-root-path.patch
similarity index 100%
rename from package/lua/5.3.5/0001-root-path.patch
rename to package/lua/5.3.6/0001-root-path.patch
diff --git a/package/lua/5.3.5/0002-shared-libs-for-lua.patch b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.3.5/0002-shared-libs-for-lua.patch
rename to package/lua/5.3.6/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.3.5/0011-linenoise.patch b/package/lua/5.3.6/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.3.5/0011-linenoise.patch
rename to package/lua/5.3.6/0011-linenoise.patch
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index ab72480e5..5ace44458 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -2,10 +2,11 @@
 md5 dbf155764e5d433fc55ae80ea7060b60           lua-5.4.0.tar.gz
 sha1 8cdbffa8a214a23d190d7c45f38c19518ae62e89  lua-5.4.0.tar.gz
 
-md5 4f4b4f323fd3514a68e0ab3da8ce3455           lua-5.3.5.tar.gz
-sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
+md5 83f23dbd5230140a3770d5f54076948d           lua-5.3.6.tar.gz
+sha1 f27d20d6c81292149bc4308525a9d6733c224fa5  lua-5.3.6.tar.gz
 
 md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
+
 # Locally computed
 sha256  ee5e3e82af1e1b543c4f216e399d7c8cfee797711913f349e385101c4ae60a79  COPYRIGHT
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ee604b612..9ff738656 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -7,7 +7,7 @@
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
 LUA_VERSION = 5.4.0
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
-LUA_VERSION = 5.3.5
+LUA_VERSION = 5.3.6
 else
 LUA_VERSION = 5.1.5
 endif
-- 
2.25.1
