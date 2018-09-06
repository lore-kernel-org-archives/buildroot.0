From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Sep 2018 22:03:33 +0200
Subject: [Buildroot] [git commit] cutelyst: fix kconfig syntax
Message-ID: <20180906200426.02E9F82BA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07613c8890f6a7fea2b1ebbad0ee03a9c91ebb6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit cb3c56e35 (cutelyst: Add dependency on Kernel headers >= 3.3) used
invalid kconfig syntax, breaking menuconfig:

make menuconfig
package/cutelyst/Config.in:19: syntax error
package/cutelyst/Config.in:18: invalid option
Makefile:900: recipe for target 'menuconfig' failed

Fix it by using 'depends ON' instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cutelyst/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
index b2b48baa69..3e28cff95d 100644
--- a/package/cutelyst/Config.in
+++ b/package/cutelyst/Config.in
@@ -15,4 +15,4 @@ config BR2_PACKAGE_CUTELYST
 comment "cutelyst needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.3"
 	depends on BR2_PACKAGE_QT5
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
