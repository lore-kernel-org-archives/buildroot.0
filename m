From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:46:15 +0200
Subject: [Buildroot] [git commit] package/rrdtool: rrd_graph support needs
 gcc >= 4.8
Message-ID: <20190811210019.71BC78B474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e9cd876d05f5c4d63d659979012f2749dc1557e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 gcc >= 4.8 is needed for
rrd_graph support.

Added BR2_TOOLCHAIN_HAS_SYNC_4 dependency to comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rrdtool/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 631ed32847..5451353140 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	bool "rrd_graph"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PDF
@@ -27,8 +28,10 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 endif
 
