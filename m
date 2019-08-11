From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:47:43 +0200
Subject: [Buildroot] [git commit] package/gstreamer/gst-plugins-bad: rsvg
 plugin needs gcc >= 4.8
Message-ID: <20190811210019.B30A581336@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42f785dfb4ba60ab6baae9399008c316ce7c2b52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 the rsvg plugin needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 982edc2e4c..c96ceb69c4 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -295,10 +295,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 
-comment "rsvg plugin needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
