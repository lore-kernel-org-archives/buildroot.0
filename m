From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 21:28:32 +0200
Subject: [Buildroot] [git commit] lua: embed sub-options into a if...endif
	instead of depends on
Message-ID: <20120717213057.86B5C9692C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b16c6ac4740cc0534a6b6dc1a51338296c1def92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lua/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lua/Config.in b/package/lua/Config.in
index 56eba35..76359c0 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_LUA
 
 	  http://www.lua.org/
 
+if BR2_PACKAGE_LUA
+
 config BR2_PACKAGE_LUA_COMPILER
 	bool "lua compiler"
-	depends on BR2_PACKAGE_LUA
 	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Install luac binary
 
 config BR2_PACKAGE_LUA_INTERPRETER
 	bool "lua interpreter"
-	depends on BR2_PACKAGE_LUA
 	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  Install lua binary
@@ -29,6 +29,7 @@ config BR2_PACKAGE_LUA_INTERPRETER_READLINE
 
 config BR2_PACKAGE_LUA_SHARED_LIBRARY
 	bool "shared library"
-	depends on BR2_PACKAGE_LUA
 	help
 	  Install shared liblua.so
+
+endif
