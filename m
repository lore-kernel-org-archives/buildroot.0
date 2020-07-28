From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 15:21:38 +0200
Subject: [Buildroot] [PATCH v3 01/10] package/luabitop: depends on lua 5.1
In-Reply-To: <20200728132147.3155274-1-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
Message-ID: <20200728132147.3155274-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luabitop/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
index a819fe8ae..656b1c739 100644
--- a/package/luabitop/Config.in
+++ b/package/luabitop/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_LUABITOP
 	bool "luabitop"
-	depends on !BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_1
 	help
 	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds
 	  bitwise operations on numbers.
 
 	  http://bitop.luajit.org
 
-comment "luabitop needs a Lua 5.1/5.2 interpreter"
-	depends on BR2_PACKAGE_LUA_5_3
+comment "luabitop needs Lua 5.1"
+	depends on !BR2_PACKAGE_LUA_5_1
-- 
2.25.1
