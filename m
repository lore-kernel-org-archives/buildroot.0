From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  4 Jul 2016 23:42:32 +0200
Subject: [Buildroot] [PATCH] package/libbdplus: Add missing libgpg arch
	support
Message-ID: <1467668552-15811-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Romain Naour for finding the culprit package.

Fix:
http://autobuild.buildroot.org/results/d06/d06e3eb9ef48540b71fbec267c534523632b224f/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libbdplus/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbdplus/Config.in b/package/libbdplus/Config.in
index df5ea27..7cb5893 100644
--- a/package/libbdplus/Config.in
+++ b/package/libbdplus/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBBDPLUS
 	bool "libbdplus"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGCRYPT
-- 
2.8.1
