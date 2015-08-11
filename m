From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Aug 2015 07:54:39 +0300
Subject: [Buildroot] [PATCH] libiio: test programs require threads
Message-ID: <254c2505374c4d6b33e13c4d4bf276ec1e4fbff5.1439268879.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/228/228a32167d05337acf17b0e3689aa91e8a67d8fb/
http://autobuild.buildroot.net/results/86a/86adb968659fec56684ba80e1c4230230fd7a1c8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libiio/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 21496ed7c501..99da4c1c1000 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -37,9 +37,13 @@ config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
 	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Install the test programs (iio_info, iio_genxml, iio_readdev).
 
+comment "IIO test programs need a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIBIIO_BINDINGS_CSHARP
 	bool "Install C# bindings"
 	depends on BR2_PACKAGE_MONO
-- 
2.5.0
