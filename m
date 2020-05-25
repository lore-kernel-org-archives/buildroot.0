From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 24 May 2020 18:48:44 -0600
Subject: [Buildroot] [PATCH v3 8/9] package/prosody: don't depend on !lua 5.3
In-Reply-To: <20200525004845.3019642-1-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
Message-ID: <20200525004845.3019642-8-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current version of prosody is compatible with Lua 5.3.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/prosody/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index c32ca20e23..4b7ea94256 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_3
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
 	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
@@ -21,6 +20,3 @@ config BR2_PACKAGE_PROSODY
 comment "prosody needs the lua interpreter, dynamic library"
 	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
-
-comment "prosody needs a Lua 5.1/5.2 interpreter"
-	depends on BR2_PACKAGE_LUA_5_3
-- 
2.25.1
