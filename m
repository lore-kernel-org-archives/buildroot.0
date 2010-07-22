From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Jul 2010 13:08:24 +0200
Subject: [Buildroot] [git commit master 1/1] luafilesystem: tweak Config.in
Message-ID: <20100722110847.4A27682DFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=164d1dc0207372c448f2814f014085187e084cc3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Print a comment if largefile isn't available, and use select rather than
depends for the lua shared library option.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/luafilesystem/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index ba63878..6cb6c24 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
 	depends on BR2_LARGEFILE
-	depends on BR2_PACKAGE_LUA_SHARED_LIBRARY
+	select BR2_PACKAGE_LUA_SHARED_LIBRARY
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
 
 	  http://luaforge.net/projects/luafilesystem/
+
+comment "luafilesystem requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.7.1
