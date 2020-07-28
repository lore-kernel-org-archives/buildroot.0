From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 14:56:07 +0200
Subject: [Buildroot] [PATCH v2 05/10] package/easybus: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200728125613.3153975-1-francois.perrad@gadz.org>
References: <20200728125613.3153975-1-francois.perrad@gadz.org>
Message-ID: <20200728125613.3153975-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/easydbus/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 1fe8689cc..5f2f3a22b 100644
--- a/package/easydbus/Config.in
+++ b/package/easydbus/Config.in
@@ -3,12 +3,13 @@ config BR2_PACKAGE_EASYDBUS
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !BR2_PACKAGE_LUA_5_4
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Easy to use DBus library for Lua.
 
 	  https://github.com/mniestroj/easydbus
 
-comment "easydbus needs a toolchain w/ wchar, threads"
+comment "easydbus needs a toolchain w/ wchar, threads, Lua <= 5.3"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PACKAGE_LUA_5_4
-- 
2.25.1
