From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:35:46 +0200
Subject: [Buildroot] [git commit] package/lunit: remove package
Message-ID: <20190403193440.BA75A8D385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f33ec411627c20004dd39c40f17aa6b9d8ab488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

it was replaced by its fork lunitx which supports all versions of Lua.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy         |  8 ++++++++
 package/Config.in        |  1 -
 package/lunit/Config.in  | 11 -----------
 package/lunit/lunit.hash |  3 ---
 package/lunit/lunit.mk   | 11 -----------
 5 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cafa1c0674..ec5079da65 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.05"
 
+config BR2_PACKAGE_LUNIT
+	bool "lunit package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LUA_LUNITX
+	help
+	  The lunit package was removed in favor of its fork lunitx,
+	  which supports all versions of Lua.
+
 config BR2_PACKAGE_FFMPEG_FFSERVER
 	bool "ffmpeg ffserver removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 287f3493be..6fd047ec8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -649,7 +649,6 @@ menu "Lua libraries/modules"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
 	source "package/lua-valua/Config.in"
-	source "package/lunit/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
 	source "package/luvi/Config.in"
diff --git a/package/lunit/Config.in b/package/lunit/Config.in
deleted file mode 100644
index d6c2c6b157..0000000000
--- a/package/lunit/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LUNIT
-	bool "lunit"
-	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
-	help
-	  A unit testing framework for Lua.
-
-	  http://www.mroth.net/lunit/
-
-comment "lunit needs a Lua 5.1 interpreter"
-	depends on !BR2_PACKAGE_LUA_5_1
-	depends on !BR2_PACKAGE_LUAJIT
diff --git a/package/lunit/lunit.hash b/package/lunit/lunit.hash
deleted file mode 100644
index bd168ba8f5..0000000000
--- a/package/lunit/lunit.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# computed by luarocks/buildroot
-sha256 b19854c685337ddcec2fe9c22113d2cd14715d52ccd2676abe2fa49b61a2ec4d  lunit-0.5-2.src.rock
-sha256 316317e9e9b7eac811e1be56738e2434fb4a0c39ecd660f3b34dad739bfb3707  lunit-0.5/LICENSE
diff --git a/package/lunit/lunit.mk b/package/lunit/lunit.mk
deleted file mode 100644
index 34e22db757..0000000000
--- a/package/lunit/lunit.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# lunit
-#
-################################################################################
-
-LUNIT_VERSION = 0.5-2
-LUNIT_LICENSE = MIT
-LUNIT_LICENSE_FILES = $(LUNIT_SUBDIR)/LICENSE
-
-$(eval $(luarocks-package))
