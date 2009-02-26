From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 26 Feb 2009 02:25:11 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: remove dependencies for
	matroska plugin
Message-ID: <200902260225.11224.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This was forgotten when adding config options for zlib and bzip2. The
matroska plugin doesn't need these dependencies, they are optional.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 99fea7b..27bf6ad 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -171,7 +171,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MATROSKA),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-matroska
-GST_PLUGINS_GOOD_DEPENDENCIES += zlib bzip2
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-matroska
 endif
-- 
1.6.2.rc1.34.g8925
