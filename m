From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:29:43 +0200
Subject: [Buildroot] [git commit branch/next] package/prosody: disable
 temporarily with Lua 5.4
Message-ID: <20200808162412.7260B8157B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1704786b423cb89562c15b2ec373f1fa8df28bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/prosody/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/prosody/Config.in b/package/prosody/Config.in
index 4b7ea94256..d57da00a94 100644
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
