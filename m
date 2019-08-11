From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:48:11 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base:
 pango plugin needs gcc >= 4.8
Message-ID: <20190811210019.C96BA81336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ba3d7ec33cb216a4cfdcd27e77b7484cad2b072
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 the pango plugin needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-base/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 29f8001f3a..f60d540337 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -282,12 +282,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "pango plugin needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
