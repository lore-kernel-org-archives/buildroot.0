From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:40:44 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-devtools: select
 BR2_PACKAGE_GSTREAMER1_CHECK
Message-ID: <20200926133109.42D8C89169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c96315268119b66e6bba120533d87861deda4ec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

validate option needs gstreamer-check-1.0

Fixes:
 - http://autobuild.buildroot.org/results/297ebea95b487f4c542e1217620e8c3d921260f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
