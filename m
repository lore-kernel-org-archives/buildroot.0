From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:38 +0200
Subject: [Buildroot] [PATCH 22/30] package/setools: re-enable on ARC
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-23-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libselinux is now available on ARC, so we can re-enable setools as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index f22e1cec08..56a85b01c8 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SETOOLS
 	bool "setools"
-	depends on !BR2_arc # arc: libselinux not available
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
@@ -22,6 +21,6 @@ config BR2_PACKAGE_SETOOLS
 	  https://github.com/TresysTechnology/setools
 
 comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
-	depends on BR2_USE_MMU && !BR2_arc
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.21.0
