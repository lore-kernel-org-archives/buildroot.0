From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 Mar 2020 22:44:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove dependency on
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
Message-ID: <20200324214415.1175050-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream does not require libgcrypt & libgpg-error anymore:
https://github.com/xbmc/xbmc/commit/0c6e8e0d975d4045004dc2fe90218d61395cdcb5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 81bd3874f0..13b8f9df3e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -177,7 +177,6 @@ config BR2_PACKAGE_KODI_LCMS2
 
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
 	bool "web server"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, libmicrohttpd
 	select BR2_PACKAGE_LIBMICROHTTPD
 	help
 	  Enable webserver feature
-- 
2.25.0
