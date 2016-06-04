From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 15:13:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: remove
	BR2_PACKAGE_BOOST_ARCH_SUPPORTS option, 2nd try
Message-ID: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For whatever reason this commit
https://git.busybox.net/buildroot/commit/package/kodi?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
did not make it into the master branch preventing to select the Kodi
package in menuconfig.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index d9760ca..a44ef5a 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
-		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
 comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
-- 
2.8.1
