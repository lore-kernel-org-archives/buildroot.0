From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Aug 2018 10:44:21 +0300
Subject: [Buildroot] [PATCH] package: drop remaining
 BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
Message-ID: <c9c1695b497981e2bb8195ebea87ed1c9ca550ec.1534923861.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5a3f78c91915 (libaio: bump to 0.3.111) removed the definition of
BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS, and most references. Remove a few
remaining references.

Fixes:
http://autobuild.buildroot.net/results/724/7244c23a0fbcf27547b5ea639d88033b5a7d9f39/
http://autobuild.buildroot.net/results/be4/be43983767e94ab5c64c3cb3de467840fd6635d2/
http://autobuild.buildroot.net/results/798/798a15a9a064d476927bb49bf534c427e9119c4e/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libiio/Config.in | 5 ++---
 package/lvm2/Config.in   | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 06f48fae0a27..dcc7c79d1a34 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -65,10 +65,9 @@ config BR2_PACKAGE_LIBIIO_IIOD_USBD
 	help
 	  Add support for USB through FunctionFS with IIOD.
 
-comment "USB support in the IIO Daemon requires libaio, headers >= 3.18"
+comment "USB support in the IIO Daemon requires headers >= 3.18"
 	depends on BR2_PACKAGE_LIBIIO_IIOD
-	depends on !BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS || \
-		   !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
 
 comment "IIO Daemon needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 5f706982cd5c..de5b972e999f 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
 	depends on !BR2_STATIC_LIBS # It fails to build statically
@@ -52,5 +51,4 @@ endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.18.0
