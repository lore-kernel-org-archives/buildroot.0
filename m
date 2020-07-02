From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  2 Jul 2020 22:22:30 +0200
Subject: [Buildroot] [PATCH 11/11] package/luv: temporarily disabled with
 Lua 5.4
In-Reply-To: <20200702202230.1531929-1-francois.perrad@gadz.org>
References: <20200702202230.1531929-1-francois.perrad@gadz.org>
Message-ID: <20200702202230.1531929-12-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/luv/Config.in b/package/luv/Config.in
index 434cb3b45..1be189977 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LUV
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
-- 
2.25.1
