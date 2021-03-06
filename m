From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 11:20:03 +0100
Subject: [Buildroot] [git commit] package/libgeos: disable package while
 building for Nios II
Message-ID: <20210306095745.6A18C813BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=123ad9c72231622e9ce57db2667c3d19646ddfad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package fails to build with Nios II up to gcc version 10.x and no
work around has been found. So let's disable it whil building for Nios
II.

Fixes:
http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgeos/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index 9f02c8b13f..2caf6d1d5e 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on !BR2_nios2
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
 	  JTS Topology Suite (JTS). It aims to contain the complete
@@ -13,3 +14,4 @@ config BR2_PACKAGE_LIBGEOS
 
 comment "libgeos needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_nios2
