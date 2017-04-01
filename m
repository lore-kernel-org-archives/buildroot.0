From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:44:34 +0200
Subject: [Buildroot] [git commit] libiio: don't force specific backends when
	enabling tests
Message-ID: <20170401124445.1780F825CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=305a384d3e4c3736e1bab3dae305ef3586dc6332
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test programs will compile just fine even when none of the
backends are enabled.

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 6f6af16..8cde0e9 100644
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
