From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 23:32:47 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5: enable for
 nios2
Message-ID: <20200321222023.1AA1183BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63c6895b4c2fe7fa41f9dba71ee3b93e4f9ab5e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The double-conversion support for nios2 is already enabled
by commit [1], so drop dependency on !BR2_nios2.

[1] https://git.buildroot.net/buildroot/commit/?id=e2fdb41f711db8894f9c5c83f32250728d4c3aa9

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 572e371f3c7fb37bd25f5eccab7d062d385cdf3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 7051bf517a..c3e210640b 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 
 comment "Qt5 needs a toolchain w/ gcc >= 4.8, wchar, NPTL, C++, dynamic library"
 	depends on !BR2_ARM_CPU_ARMV4
-	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_arc && !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
@@ -26,7 +26,7 @@ menuconfig BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on !BR2_ARM_CPU_ARMV4 # needs ARMv5+
 	# no built-in double-conversion support
-	depends on !BR2_arc && !BR2_nios2 && !BR2_xtensa
+	depends on !BR2_arc && !BR2_xtensa
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_QT5BASE
 	help
