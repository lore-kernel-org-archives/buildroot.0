From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 24 Aug 2013 01:14:13 +0200
Subject: [Buildroot] [PATCH 1/1] Phonon needs libglib2 or else it's
	functionality tests will fail.
Message-ID: <1377299653-9977-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/qt/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 35e8208..2541875 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -264,7 +264,8 @@ source "package/qt/Config.keyboard.in"
 
 config BR2_PACKAGE_QT_PHONON
 	bool "Phonon Module"
-	depends on BR2_PACKAGE_GSTREAMER
+	depends on BR2_PACKAGE_GSTREAMER 
+	depends on BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	default y
 	help
@@ -272,8 +273,8 @@ config BR2_PACKAGE_QT_PHONON
 	  formats can be configured at the GStreamer package.
 	  If unsure, say n.
 
-comment "Phonon module needs gstreamer"
-	depends on !BR2_PACKAGE_GSTREAMER
+comment "Phonon module needs gstreamer and libglib2"
+	depends on !BR2_PACKAGE_GSTREAMER || !BR2_PACKAGE_LIBGLIB2
 
 config BR2_PACKAGE_QT_PHONON_BACKEND
 	bool "Phonon Module Backend"
-- 
1.8.3.2
