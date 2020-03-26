From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:17:25 +0100
Subject: [Buildroot] [git commit] package/kodi: remove dependency on
 BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
Message-ID: <20200326220408.274DE88487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dde1bcf0e269ea6fe5a28e07b8752a37e16bd231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not require libgcrypt & libgpg-error anymore:
https://github.com/xbmc/xbmc/commit/0c6e8e0d975d4045004dc2fe90218d61395cdcb5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
