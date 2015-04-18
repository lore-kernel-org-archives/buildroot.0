From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 18 Apr 2015 10:57:57 +0200
Subject: [Buildroot] [PATCH 1/3] luaposix: bump to version 33.3.1
Message-ID: <1429347479-7171-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/Config.in   | 14 +++++---------
 package/luaposix/luaposix.mk |  2 +-
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 439dc42..8b24574 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,19 +1,15 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_3
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
-	  luaposix is a POSIX binding, including curses, for Lua 5.1
-	  and 5.2; Like most libraries it simply binds to C APIs on
-	  the underlying system, so it won't work on a non-POSIX
-	  system. However, it does try to detect the level of POSIX
+	  luaposix is a POSIX binding, including curses, for Lua 5.1,
+	  5.2 and 5.3; like most libraries it simply binds to C APIs on
+	  the underlying system, so it won't work on non-POSIX
+	  systems. However, it does try to detect the level of POSIX
 	  conformance of the underlying system and bind only available
-	  APIs
+	  APIs.
 
 	  https://github.com/luaposix/luaposix
-
-comment "luaposix needs a Lua 5.1/5.2 interpreter"
-	depends on BR2_PACKAGE_LUA_5_3
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 5d41472..ea4ab02 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 33.0.0
+LUAPOSIX_VERSION = 33.3.1
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
-- 
2.1.0
