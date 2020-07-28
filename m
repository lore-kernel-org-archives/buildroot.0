From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 14:56:04 +0200
Subject: [Buildroot] [PATCH v2 02/10] package/luabitop: unsupport of Lua 5.4, as 5.3
In-Reply-To: <20200728125613.3153975-1-francois.perrad@gadz.org>
References: <20200728125613.3153975-1-francois.perrad@gadz.org>
Message-ID: <20200728125613.3153975-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luabitop/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index a819fe8ae..51b12486d 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
-	depends on !BR2_PACKAGE_LUA_5_3
+	depends on !BR2_PACKAGE_LUA_5_3 && !BR2_PACKAGE_LUA_5_4
 	help
 	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds
 	  bitwise operations on numbers.
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LUABITOP
 	  http://bitop.luajit.org
 
 comment "luabitop needs a Lua 5.1/5.2 interpreter"
-	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
-- 
2.25.1
