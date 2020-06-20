From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Jun 2020 22:57:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: fix comment
Message-ID: <20200620205703.413331-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix inversed logic, comment should be shown for static-only toolchains.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mediastreamer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index b3ba5a0cb0..b12535e82c 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 comment "mediastreamer needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.26.2
