From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Sep 2020 23:16:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-devtools: select
 BR2_PACKAGE_GSTREAMER1_CHECK
Message-ID: <20200925211655.3400054-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

validate option needs gstreamer-check-1.0

Fixes:
 - http://autobuild.buildroot.org/results/297ebea95b487f4c542e1217620e8c3d921260f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-devtools/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-devtools/Config.in b/package/gstreamer1/gst1-devtools/Config.in
index 1ca8ab8299..55cf25d53e 100644
--- a/package/gstreamer1/gst1-devtools/Config.in
+++ b/package/gstreamer1/gst1-devtools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GST1_DEVTOOLS
 	bool "gst1-devtools"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_GSTREAMER1_CHECK
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-- 
2.28.0
