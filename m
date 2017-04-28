From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Apr 2017 17:07:58 +0300
Subject: [Buildroot] [PATCH] ola: mark as broken
Message-ID: <78a929f7208b78d17f45d4ddb8bc8df7f26ba74b.1493388478.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build with current protobuf is broken. Mark as broken until upstream resolves
this issue.

https://github.com/OpenLightingProject/ola/issues/1192

Fixes:
http://autobuild.buildroot.net/results/d9a/d9a24f7b715100be1580a568a5e3ff72b0389165/
http://autobuild.buildroot.net/results/b31/b314811dedce04ebdc779df67de6cb59a1880cac/
http://autobuild.buildroot.net/results/587/5877b2301b7da43c50127a4c5f648acd3b0264cc/

Cc: Dave Skok <blanco.ether@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 90a92fd2f2f4..656e82529a99 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,6 +1,7 @@
 comment "ola needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
+	depends on BROKEN
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_OLA
@@ -8,6 +9,9 @@ menuconfig BR2_PACKAGE_OLA
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX
+	# Build fails with current protobuf
+	# https://github.com/OpenLightingProject/ola/issues/1192
+	depends on BROKEN
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
