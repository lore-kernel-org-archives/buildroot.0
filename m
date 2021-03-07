From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  7 Mar 2021 18:52:14 +0100
Subject: [Buildroot] [PATCH] package/libgeos: disable package if binutils is
 affected from bug 21464
Message-ID: <20210307175214.3980194-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/3eb/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
This patch must be applied after this patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=232409
---
 package/libgeos/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 2caf6d1d5e..bbcafe7740 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGEOS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_nios2
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -14,4 +15,4 @@ config BR2_PACKAGE_LIBGEOS
 
 comment "libgeos needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-	depends on !BR2_nios2
+	depends on !BR2_nios2 || !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
-- 
2.25.1
