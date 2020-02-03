From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 17:36:55 +0100
Subject: [Buildroot] [git commit] package/kodi: needs extra encodings in
 libiconv
Message-ID: <20200203162630.6648188961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8243b84733349347986acfa077212ba62daf8756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Kodi build system also enables extra encodings:
https://github.com/xbmc/xbmc/blob/Leia/tools/depends/target/libiconv/Makefile#L13

Without them addons fail to install:
https://github.com/garbear/kodi-steamlink/issues/34#issuecomment-579392269

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index cd3bc99bf9..8ca9d0970e 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -84,6 +84,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPLIST
 	select BR2_PACKAGE_LIBSAMPLERATE
 	select BR2_PACKAGE_LZO
