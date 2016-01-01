From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 22:01:00 +0100
Subject: [Buildroot] [git commit] package:sysdig: propagate dependencies
	from jsoncpp
Message-ID: <20160101210136.B8C6B7FB36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b6665092f9bd12eba8d5ba520d81e7369ea3a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysdig select jsoncpp which needs a gcc compiler >= 4.7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
