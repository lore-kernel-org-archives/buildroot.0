From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 19:17:25 +0200
Subject: [Buildroot] [PATCH] libbsd: Add missing arch
Message-ID: <1412529445-5931-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Match the list of architecture to the comments above.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libbsd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e22226a..470d6e5 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	# libbsd requires a.out.h, which is only available for those
 	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
-	depends on ( BR2_i386 || BR2_x86_64 )
+	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm || BR2_m68k)
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBBSD
 	  http://libbsd.freedesktop.org/
 
 comment "libbsd needs an (e)glibc toolchain w/ threads"
-	depends on ( BR2_i386 || BR2_x86_64 )
+	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm || BR2_m68k)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.1.1
