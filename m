From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:31:27 +0100
Subject: [Buildroot] [git commit] package/libgeos: disable package if
 binutils is affected from bug 21464
Message-ID: <20210314220810.567B986228@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a26e019611157c897dae9742621fa24bac4876a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is affected from binutils bug 21464, since there is no
workaround, let's disable it.

Fixes:
http://autobuild.buildroot.net/results/3eb/3eb9f9d0f6d8274b2d19753c006bd83f7d536e3c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
