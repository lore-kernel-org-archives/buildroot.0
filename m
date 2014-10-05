From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 20:31:21 +0200
Subject: [Buildroot] [PATCH v2] libbsd: Add missing arch
Message-ID: <1412533881-14025-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Match the list of architecture to the comments above.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
    - Remove m68k as it is currently marked broken in BR
---
 package/libbsd/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e22226a..b1ca6d1 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	# libbsd requires a.out.h, which is only available for those
-	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
-	depends on ( BR2_i386 || BR2_x86_64 )
+	# architectures: arm, x86 (and alpha, but we don't care.)
+	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm)
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBBSD
 	  http://libbsd.freedesktop.org/
 
 comment "libbsd needs an (e)glibc toolchain w/ threads"
-	depends on ( BR2_i386 || BR2_x86_64 )
+	depends on ( BR2_i386 || BR2_x86_64 || BR2_arm)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.1.1
