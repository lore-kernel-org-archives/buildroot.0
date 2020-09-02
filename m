From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:32 -0000
Subject: [Buildroot] [git commit] package/easybus: disable temporarily with
 Lua 5.4
Message-ID: <20200902161633.7213187655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f540d120c352f6143e44c95a75bbb76922298b1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/easydbus/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/easydbus/Config.in b/package/easydbus/Config.in
index 1fe8689ccd..5f2f3a22be 100644
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
