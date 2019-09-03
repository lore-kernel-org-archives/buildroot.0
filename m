From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Tue,  3 Sep 2019 23:13:36 +0200
Subject: [Buildroot] [PATCH 13/18] package/Config.in: fix packages ordering
In-Reply-To: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
References: <20190903211341.10341-1-jerzy.m.grzegorek@gmail.com>
Message-ID: <20190903211341.10341-13-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
package/Config.in:594: Packages in: menu "Interpreter languages and scripting",
                       are not alphabetically ordered;
                       first incorrect package: luajit ;
                       this package, placed just before if statement,
                       should match the one used in
                       if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 710ed12be0..7bc97fff72 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -590,7 +590,6 @@ endif
 	source "package/jimtcl/Config.in"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
-	source "package/luajit/Config.in"
 if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
@@ -670,6 +669,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/luajit/Config.in"
 	source "package/micropython/Config.in"
 	source "package/micropython-lib/Config.in"
 	source "package/moarvm/Config.in"
-- 
2.17.1
