From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2021 18:40:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: remove dependency to
 libsamplerate
Message-ID: <20210210174023.962225-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is not needed anymore since 2014:
https://github.com/xbmc/xbmc/commit/e36e4f0e2a46764d0c4341a5caf50cae6f772504

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 -
 package/kodi/kodi.mk   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 8453ba0e07..ecc5a05324 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -88,7 +88,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
-	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 80a8d4e6bf..3f22db48a3 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -37,7 +37,6 @@ KODI_DEPENDENCIES = \
 	libcurl \
 	libfribidi \
 	libplist \
-	libsamplerate \
 	lzo \
 	ncurses \
 	openssl \
-- 
2.29.2
