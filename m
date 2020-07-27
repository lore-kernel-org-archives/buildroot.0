From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 22:32:54 +0200
Subject: [Buildroot] [PATCH 3/9 v2] package/prosody: don't depend on !lua 5.3
In-Reply-To: <cover.1595881971.git.yann.morin.1998@free.fr>
References: <cover.1595881971.git.yann.morin.1998@free.fr>
Message-ID: <afbb8b6a04d8013086088bef74741c81bddf78e9.1595881971.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

The current version of prosody is compatible with Lua 5.3.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
2.20.1
