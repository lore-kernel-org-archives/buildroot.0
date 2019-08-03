From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:49 +0200
Subject: [Buildroot] [PATCH 11/23] package/gstreamer/gst-plugins-base: pango
 plugin needs gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 the pango plugin needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer/gst-plugins-base/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index e9c8239f79..d784bcdd39 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -83,10 +83,12 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 
-comment "pango plugin needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin needs a toolchain w/ C++, gcc => 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_SUBPARSE
-- 
2.20.1
