From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Dec 2014 10:10:40 +0100
Subject: [Buildroot] [PATCH 7/7] luaposix: bump to version 33.0.0
In-Reply-To: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
References: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1419412240-16068-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses becomes a mandatory dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/Config.in   | 1 +
 package/luaposix/luaposix.mk | 8 ++------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 04269fb..a40c3f9 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index a723a50..5d41472 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 32
+LUAPOSIX_VERSION = 33.0.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
-LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
+LUAPOSIX_DEPENDENCIES = luainterpreter host-lua ncurses
 LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-LUAPOSIX_DEPENDENCIES += ncurses
-endif
-
 $(eval $(autotools-package))
-- 
2.1.0
