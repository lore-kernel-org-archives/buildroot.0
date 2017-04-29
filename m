From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 13:57:50 +0200
Subject: [Buildroot] [git commit] ola: mark as broken
Message-ID: <20170429115756.A4E1C82263@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f80fce90b73ed28fbbc1315c3d9a5577523fddf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with current protobuf is broken. Mark as broken until upstream resolves
this issue.

https://github.com/OpenLightingProject/ola/issues/1192

Fixes:
http://autobuild.buildroot.net/results/d9a/d9a24f7b715100be1580a568a5e3ff72b0389165/
http://autobuild.buildroot.net/results/b31/b314811dedce04ebdc779df67de6cb59a1880cac/
http://autobuild.buildroot.net/results/587/5877b2301b7da43c50127a4c5f648acd3b0264cc/

Cc: Dave Skok <blanco.ether@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ola/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index 90a92fd..656e825 100644
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
