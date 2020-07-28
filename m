From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 28 Jul 2020 15:21:47 +0200
Subject: [Buildroot] [PATCH v3 10/10] package/prosody: temporarily disabled
 with Lua 5.4
In-Reply-To: <20200728132147.3155274-1-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
Message-ID: <20200728132147.3155274-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 4b7ea9425..d57da00a9 100644
--- a/package/prosody/Config.in
+++ b/package/prosody/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PROSODY
 	bool "prosody"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUA_5_4
 	depends on !BR2_STATIC_LIBS # luaexpat, luasec, luasocket, luafilesystem
 	select BR2_PACKAGE_LUABITOP if !BR2_PACKAGE_LUAJIT # runtime
 	select BR2_PACKAGE_LUAEXPAT # runtime
@@ -20,3 +21,6 @@ config BR2_PACKAGE_PROSODY
 comment "prosody needs the lua interpreter, dynamic library"
 	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+comment "prosody needs a Lua <= 5.3"
+	depends on BR2_PACKAGE_LUA_5_4
-- 
2.25.1
