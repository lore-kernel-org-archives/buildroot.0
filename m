From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Sep 2015 08:33:39 +0300
Subject: [Buildroot] [PATCH] apitrace: needs gcc 4.6 or later
Message-ID: <084ad68ad5b3f1b650d49638adffc0cb441986f4.1443591219.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4a1/4a183b05b44833ee2f253749c39257b31db963ac/
http://autobuild.buildroot.net/results/a9c/a9c4ed838fae31cb680ff5e19bf03dd7e2f85094/
http://autobuild.buildroot.net/results/026/026eecffd262b0be6675001ee2f5a635207e55c7/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/apitrace/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/apitrace/Config.in b/package/apitrace/Config.in
index 6491463263e2..4fe82aa1b61c 100644
--- a/package/apitrace/Config.in
+++ b/package/apitrace/Config.in
@@ -1,11 +1,13 @@
-comment "apitrace needs a (e)glibc toolchain w/ C++"
+comment "apitrace needs a (e)glibc toolchain w/ C++, gcc >= 4.6"
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 config BR2_PACKAGE_APITRACE
 	bool "apitrace"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC # uses glibc specific __libc_dlsym
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-- 
2.5.3
