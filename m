From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Apr 2013 09:15:20 -0300
Subject: [Buildroot] [PATCH 1/4] flot: bump to version 0.8
Message-ID: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also change upstream website and download URL and add new Canvas option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flot/Config.in | 7 ++++++-
 package/flot/flot.mk   | 7 +++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/flot/Config.in b/package/flot/Config.in
index 0bd6b14..90a4278 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -14,12 +14,17 @@ config BR2_PACKAGE_FLOT
 	  Safari 3.0+, Opera 9.5+ and Konqueror 4.x+ with the HTML
 	  canvas tag.
 
-	  https://code.google.com/p/flot/
+	  http://www.flotcharts.org/
 
 if BR2_PACKAGE_FLOT
 
 comment "flot plugins"
 
+config BR2_PACKAGE_FLOT_CANVAS
+	bool "canvas"
+	help
+	  Flot plugin to render axis tick labels directly to the canvas
+
 config BR2_PACKAGE_FLOT_FILLBETWEEN
 	bool "fillbetween"
 	help
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 41f5a42..97110bc 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -1,6 +1,9 @@
-FLOT_VERSION = 0.7
-FLOT_SITE = http://flot.googlecode.com/files
+FLOT_VERSION = 0.8.0
+FLOT_SITE = http://www.flotcharts.org/downloads
+FLOT_LICENSE = MIT
+FLOT_LICENSE_FILES = LICENSE.txt
 FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
+	$(if $(BR2_PACKAGE_FLOT_CANVAS),canvas) \
 	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
 	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
 	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
-- 
1.8.1.5
