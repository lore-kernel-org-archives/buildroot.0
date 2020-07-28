From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 14:56:11 +0200
Subject: [Buildroot] [PATCH v2 09/10] package/luv: temporarily disabled with
 Lua 5.4
In-Reply-To: <20200728125613.3153975-1-francois.perrad@gadz.org>
References: <20200728125613.3153975-1-francois.perrad@gadz.org>
Message-ID: <20200728125613.3153975-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luv/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/luv/Config.in b/package/luv/Config.in
index 434cb3b45..3be204cab 100644
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
-- 
2.25.1
