From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:30:33 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "libiio: Disable IIOD on Blackfin"
Message-ID: <20171103103034.24937-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 53996bee433f09a91b12aa53b2be0f7d22c0acbe.

Commit 93a86b4dec9e73fbe0e186cdde8fb04a36a44762 fixes accept4 support
in uclibc on Blackfin, so re-enable iiod on this target.

Cc: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libiio/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index baa163126a..b58ac7fdb3 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -53,7 +53,6 @@ config BR2_PACKAGE_LIBIIO_IIOD
 	bool "IIO Daemon"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_bfin
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	help
 	  Install the IIO Daemon.
@@ -74,10 +73,6 @@ comment "USB support in the IIO Daemon requires libaio, headers >= 3.18"
 
 comment "IIO Daemon needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_bfin
-
-comment "IIO Daemon is not yet available on Blackfin"
-	depends on BR2_bfin
 
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
-- 
2.15.0
