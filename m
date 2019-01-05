From: Ilya Averyanov <averyanovin@gmail.com>
Date: Sun,  6 Jan 2019 01:47:27 +0300
Subject: [Buildroot] [PATCH 1/1] exempi: add dependency on threads
Message-ID: <20190105224727.5357-1-averyanovin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
---
 package/exempi/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exempi/Config.in b/package/exempi/Config.in
index b3ec2c513d..0fa4b473bc 100644
--- a/package/exempi/Config.in
+++ b/package/exempi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_EXEMPI
 	bool "exempi"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_ZLIB
 	help
@@ -10,5 +11,5 @@ config BR2_PACKAGE_EXEMPI
 
 	  http://libopenraw.freedesktop.org/wiki/Exempi
 
-comment "exempi needs a toolchain w/ C++, dynamic library"
-	depends on BR2_STATIC_LIBS || BR2_INSTALL_LIBSTDCPP
+comment "exempi needs a toolchain w/ C++, dynamic library, threads
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.19.1
