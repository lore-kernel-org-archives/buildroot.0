From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:11:33 +0200
Subject: [Buildroot] [git commit] package/luaposix: bump to version 34.1.1
Message-ID: <20190801160851.16DE98A529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b32cd888e1bf151ea4e68ea69d44d7a910988e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the module std.normalize is no longer a dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luaposix/Config.in                     | 1 -
 package/luaposix/luaposix.hash                 | 2 +-
 package/luaposix/luaposix.mk                   | 2 +-
 support/testing/tests/package/test_luaposix.py | 2 ++
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index bdc9926b1e..1e2291b3f5 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	select BR2_PACKAGE_LUA_STD_NORMALIZE # runtime
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index a6b5cd42d4..fb06bc40a1 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b0f8bdfe4b43b6d79b8f3e8ef5b158de889e5dde046618a33335a38d2b5b90f9  luaposix-34.1.tar.gz
+sha256 7948f4ac8b953172e928753632e37ad97cc3014df74b524fe7839f71216a7e90  luaposix-34.1.1.tar.gz
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index c7a9542969..ab6b030fca 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 34.1
+LUAPOSIX_VERSION = 34.1.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
diff --git a/support/testing/tests/package/test_luaposix.py b/support/testing/tests/package/test_luaposix.py
index 0182faf2f8..2918ee61b5 100644
--- a/support/testing/tests/package/test_luaposix.py
+++ b/support/testing/tests/package/test_luaposix.py
@@ -39,6 +39,7 @@ class TestLuaLuaPosix(TestLuaBase):
         self.module_test("posix.time")
         self.module_test("posix.unistd")
         self.module_test("posix.utime")
+        self.module_test("posix")
 
 
 class TestLuajitLuaPosix(TestLuaBase):
@@ -79,3 +80,4 @@ class TestLuajitLuaPosix(TestLuaBase):
         self.module_test("posix.time")
         self.module_test("posix.unistd")
         self.module_test("posix.utime")
+        self.module_test("posix")
