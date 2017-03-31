From: Paul Cercueil <paul.cercueil@analog.com>
Date: Fri, 31 Mar 2017 17:23:53 +0200
Subject: [Buildroot] [PATCH] libiio: Don't force specific backends when
	enabling tests
Message-ID: <20170331152353.30717-1-paul.cercueil@analog.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test programs will compile just fine even when none of the backends
are enabled.

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
---
 package/libiio/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 6f6af16852..8cde0e90e1 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -81,9 +81,6 @@ comment "IIO Daemon is not yet available on Blackfin"
 
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
-	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
-	select BR2_PACKAGE_LIBIIO_XML_BACKEND
-	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Install the test programs (iio_info, iio_genxml, iio_readdev).
-- 
2.11.0
