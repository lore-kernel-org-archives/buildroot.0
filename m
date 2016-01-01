From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Jan 2016 21:02:22 +0100
Subject: [Buildroot] [PATCH 2/2] package:sysdig: propagate dependencies from
	jsoncpp
In-Reply-To: <1451678542-1376-1-git-send-email-romain.naour@gmail.com>
References: <1451678542-1376-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1451678542-1376-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysdig select jsoncpp which needs a gcc compiler >= 4.7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/sysdig/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 151e75d..dfb9db5 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # libjson
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp
 	depends on !BR2_STATIC_LIBS # luajit
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
@@ -16,6 +17,7 @@ config BR2_PACKAGE_SYSDIG
 
 	  http://sysdig.org
 
-comment "sysdig needs a toolchain w/ C++, dynamic library and a Linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "sysdig needs a toolchain w/ C++, gcc >= 4.7, dynamic library and a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
-- 
2.4.3
