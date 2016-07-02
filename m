From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 20:24:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: fix comment
Message-ID: <1467483844-31013-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment was missing in menuconfig with a non-threaded toolchain
supporting dynamic linking.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index 4b883e1..a004c4c 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -9,5 +9,4 @@ config BR2_PACKAGE_LIBBLURAY
 	  http://www.videolan.org/developers/libbluray.html
 
 comment "libbluray needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.8.1
