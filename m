From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:29:00 +0200
Subject: [Buildroot] [git commit branch/next] package/lua-flu: disable
 temporarily with Lua 5.4
Message-ID: <20200808162412.4F676814FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6caa3f465dbd28971efc2ba61b5f58d90bdcabc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-flu/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lua-flu/Config.in b/package/lua-flu/Config.in
index 526dc90087..9b55ce5ab0 100644
--- a/package/lua-flu/Config.in
+++ b/package/lua-flu/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LUA_FLU
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_LIBFUSE
 	help
@@ -13,6 +14,6 @@ config BR2_PACKAGE_LUA_FLU
 
 	  http://piratery.net/flu/
 
-comment "lua-flu needs a toolchain w/ threads, dynamic library"
+comment "lua-flu needs a toolchain w/ threads, dynamic library, Lua <= 5.3"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || BR2_PACKAGE_LUA_5_4
