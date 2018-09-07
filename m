From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:40 -0000
Subject: [Buildroot] [git commit] package: drop remaining
 BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
Message-ID: <20180907111548.357447FCA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d243e4974265d9a3ccebcb645be45e068aeb4fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5a3f78c91915 (libaio: bump to 0.3.111) removed the definition of
BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS, and most references. Remove a few
remaining references.

Fixes:
http://autobuild.buildroot.net/results/724/7244c23a0fbcf27547b5ea639d88033b5a7d9f39/
http://autobuild.buildroot.net/results/be4/be43983767e94ab5c64c3cb3de467840fd6635d2/
http://autobuild.buildroot.net/results/798/798a15a9a064d476927bb49bf534c427e9119c4e/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiio/Config.in | 5 ++---
 package/lvm2/Config.in   | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index 06f48fae0a..dcc7c79d1a 100644
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
index 5f706982cd..de5b972e99 100644
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
