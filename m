From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:14:54 +0200
Subject: [Buildroot] [PATCH 16/23] package/imagemagick: host svg support
 needs host gcc >= 4.8
In-Reply-To: <20190803191501.5412-1-bernd.kuhls@t-online.de>
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
Message-ID: <20190803191501.5412-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the harfbuzz bump to version 2.5.2 host SVG support needs host
gcc >= 4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
index bbe23baa6f..5a87a130ee 100644
--- a/package/imagemagick/Config.in.host
+++ b/package/imagemagick/Config.in.host
@@ -16,6 +16,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
 
 config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	bool "SVG support"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-librsvg -> host-pango -> host-harfbuzz
 	help
 	  Say 'y' here is you need ImageMagick tools (like convert)
 	  to support SVG.
@@ -23,4 +24,7 @@ config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
 	  This is not enabled by default, as it brings quite a few
 	  extra dependencies, and thus extra build time.
 
+comment "SVG support needs host gcc >= 4.8"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_8
+
 endif
-- 
2.20.1
