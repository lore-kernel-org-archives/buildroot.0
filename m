From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Wed, 13 Feb 2013 16:25:45 +0100
Subject: [Buildroot] [PATCH] flot: add fillbetween plugin.
Message-ID: <1360769145-1610-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Flot plugin for computing bottoms for filled line and bar charts.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/flot/Config.in |    5 +++++
 package/flot/flot.mk   |    1 +
 2 files changed, 6 insertions(+)

diff --git a/package/flot/Config.in b/package/flot/Config.in
index 60534c1..0124b2d 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -20,6 +20,11 @@ if BR2_PACKAGE_FLOT
 
 comment "flot plugins"
 
+config BR2_PACKAGE_FLOT_FILLBETWEEN
+	bool "fillbetween"
+	help
+	  Flot plugin for computing bottoms for filled line and bar charts. 
+
 config BR2_PACKAGE_FLOT_NAVIGATE
 	bool "navigate"
 	help
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index f4ba604..41f5a42 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -1,6 +1,7 @@
 FLOT_VERSION = 0.7
 FLOT_SITE = http://flot.googlecode.com/files
 FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
+	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
 	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
 	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
 	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
-- 
1.7.10.4
