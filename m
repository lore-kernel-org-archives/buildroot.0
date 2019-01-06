From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jan 2019 21:22:04 +0100
Subject: [Buildroot] [git commit] exempi: add dependency on threads
Message-ID: <20190106202348.623858296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cd4dd48002553b7c1befe8ff1d16f54548b3006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/96b/96bf4f0ddd88233b9604056d83bb3d7ea97d2046/
http://autobuild.buildroot.net/results/d92/d92c8eb3004165033c22cc98b153cf547a352fd7/

Signed-off-by: Ilya Averyanov <averyanovin@gmail.com>
[Peter: add autobuilder references]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
