From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 21:37:03 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi: remove
 dependency to libsamplerate
Message-ID: <20210306213554.19ACB8183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c476e1bb7d592af542c62e268b2f9927b9649ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is not needed anymore since 2014:
https://github.com/xbmc/xbmc/commit/e36e4f0e2a46764d0c4341a5caf50cae6f772504

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 1 -
 package/kodi/kodi.mk   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e805aa9d31..745df41e20 100644
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
