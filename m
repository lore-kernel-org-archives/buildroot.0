From: Paul Cercueil <paul.cercueil@analog.com>
Date: Thu, 8 Jan 2015 10:57:51 +0100
Subject: [Buildroot] [PATCH] libiio: Drop requirement of threading support
	in the toolchain
Message-ID: <1420711071-12455-1-git-send-email-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libiio library will compile fine with a toolchain that doesn't
support threads (tested with br-arm-full-nothread.config).
Only the IIOD program requires support for threading.

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/libiio/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 292ca5a..680d5dc 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBIIO
 	bool "libiio"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND if !BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	help
 	  Libiio is a library to ease the development of software
@@ -42,6 +41,3 @@ config BR2_PACKAGE_LIBIIO_TESTS
 	  Install the test programs (iio_info, iio_genxml, iio_readdev).
 
 endif
-
-comment "libiio needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
