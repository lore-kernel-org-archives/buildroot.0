From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:31 +0200
Subject: [Buildroot] [PATCH 15/30] package/setools: now available on !glibc
 configs
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-16-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that libselinux can be built on !glibc configs, we can re-enable
setools as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setools/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/setools/Config.in b/package/setools/Config.in
index 0a7899b5eb..f22e1cec08 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_SETOOLS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
@@ -22,8 +21,7 @@ config BR2_PACKAGE_SETOOLS
 
 	  https://github.com/TresysTechnology/setools
 
-comment "setools needs a glibc toolchain w/ threads, C++, wchar, dynamic library"
+comment "setools needs a toolchain w/ threads, C++, wchar, dynamic library"
 	depends on BR2_USE_MMU && !BR2_arc
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
-- 
2.21.0
