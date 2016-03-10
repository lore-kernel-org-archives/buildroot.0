From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:51:48 +0100
Subject: [Buildroot] [git commit] lzlib: fix Lua dependency
Message-ID: <20160310225152.DB0BA80771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=822f17768212c5ab3bc5a003bff826fb88bd2455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lzlib cannot be build with LuaJIT and requires Lua 5.x.

Fixes:
http://autobuild.buildroot.net/results/d71/d71209c3e5235f507afee38b618d5740ef91fdcb/
http://autobuild.buildroot.net/results/ef8/ef80136ec17ad9b0a5e3121c4b6091b15c3da0d4/
http://autobuild.buildroot.net/results/5e9/5e9d77e415e8cafb842b84d3d6d91280ae5491e3/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
