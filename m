From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed,  9 Mar 2016 23:18:18 +0100
Subject: [Buildroot] [PATCH] lzlib: fix Lua dependency
Message-ID: <1457561898-2054-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lzlib cannot be build with LuaJIT and requires Lua 5.x.

Fixes:
http://autobuild.buildroot.net/results/d71/d71209c3e5235f507afee38b618d5740ef91fdcb/
http://autobuild.buildroot.net/results/ef8/ef80136ec17ad9b0a5e3121c4b6091b15c3da0d4/
http://autobuild.buildroot.net/results/5e9/5e9d77e415e8cafb842b84d3d6d91280ae5491e3/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/lzlib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index f7fae15..32328c5 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on BR2_PACKAGE_LUA
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
-- 
2.7.2
