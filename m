From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:29:30 +0200
Subject: [Buildroot] [git commit branch/next] package/luv: disable
 temporarily with Lua 5.4
Message-ID: <20200808162412.61F1B8157B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f547f2a7e06a8e37c769b11dc0959acdfded2f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luv/Config.in b/package/luv/Config.in
index 434cb3b459..3be204cab3 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -4,13 +4,14 @@ config BR2_PACKAGE_LUV
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
 
 	  https://github.com/luvit/luv
 
-comment "luv needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "luv needs a toolchain w/ NPTL, dynamic library, Lua <= 5.3"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
