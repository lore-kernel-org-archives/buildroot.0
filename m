From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 00:38:27 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: select missing
 multimedia deps
Message-ID: <20210519213827.1291299-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select a few missing multimedia related dependencies:

- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT is needed for
  "autoaudiosink"; not having this element can cause a crash as
  it is used unconditionally.
- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA and
  BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX are needed for
  WebM video playback.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 4ea931fde1..2ba8d47660 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -98,8 +98,11 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	select BR2_PACKAGE_GST1_LIBAV
 	help
 	  This option pulls in all of the required dependencies
-- 
2.31.1
