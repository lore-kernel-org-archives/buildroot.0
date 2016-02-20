From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:12 +0100
Subject: [Buildroot] [PATCH/next 07/31] package/kodi: enable samba support
	with uClibc toolchain
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 09bd0cd..23468cc 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -191,12 +191,13 @@ config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 comment "shairport support needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-comment "samba support needs an (e)glibc toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "samba support needs a (e)glibc or uClibc toolchain w/ RPC"
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC && \
+		!BR2_TOOLCHAIN_USES_UCLIBC) || !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_SAMBA4
-- 
2.7.0
