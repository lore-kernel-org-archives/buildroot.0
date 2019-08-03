From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:41 +0200
Subject: [Buildroot] [PATCH 03/23] package/rrdtool: rrd_graph support needs
 gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 gcc >= 4.8 is needed for
rrd_graph support.

Added BR2_TOOLCHAIN_HAS_SYNC_4 dependency to comment.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
 
-- 
2.20.1
