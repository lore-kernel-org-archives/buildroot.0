From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 16:55:26 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/mediastreamer:
 fix comment
Message-ID: <20200716150352.67B317FD90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86105b23c7c530fd62b8c8099a1b6f49f9f858b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fix inversed logic, comment should be shown for static-only toolchains.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0ca6b41f8a9c19c414e25147d99482aec8dd6dcd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
