From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  7 Aug 2017 09:03:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: examples depend on
	OpenGL
Message-ID: <20170807070344.29750-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/001/001bc930014fca8c2a8b7a390350b4e1a15fa375/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt5/qt5base/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index f5de27228..f0138a10f 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -44,11 +44,15 @@ config BR2_PACKAGE_QT5BASE_CONFIG_FILE
 
 config BR2_PACKAGE_QT5BASE_EXAMPLES
 	bool "Compile and install examples (with code)"
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	select BR2_PACKAGE_QT5BASE_XML
 	help
 	  If unsure, say N.
 
+comment "Examples need an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+
 config BR2_PACKAGE_QT5BASE_NETWORK
 	def_bool y
 
-- 
2.11.0
