From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 May 2013 11:35:29 +0200
Subject: [Buildroot] [git commit] flot: add plugins missed from 0.8.0 bump
Message-ID: <20130517100435.DDED09A2BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0156825d116283109a44315430557cd11f028cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of plugins were not added when the flot version was bumped.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/flot/Config.in |   26 ++++++++++++++++++++++++++
 package/flot/flot.mk   |    5 +++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/flot/Config.in b/package/flot/Config.in
index 90a4278..4c0d3ec 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -25,11 +25,32 @@ config BR2_PACKAGE_FLOT_CANVAS
 	help
 	  Flot plugin to render axis tick labels directly to the canvas
 
+config BR2_PACKAGE_FLOT_CATEGORIES
+	bool "categories"
+	help
+	  Flot plugin for plotting textual data or categories
+
+config BR2_PACKAGE_FLOT_CROSSHAIR
+	bool "crosshair"
+	help
+	  Flot plugin for showing crosshairs when the mouse hovers
+	  over the plot
+
+config BR2_PACKAGE_FLOT_ERRORBARS
+	bool "errorbars"
+	help
+	  Flot plugin for plotting error bars
+
 config BR2_PACKAGE_FLOT_FILLBETWEEN
 	bool "fillbetween"
 	help
 	  Flot plugin for computing bottoms for filled line and bar charts
 
+config BR2_PACKAGE_FLOT_IMAGE
+	bool "image"
+	help
+	  Flot plugin for plotting images
+
 config BR2_PACKAGE_FLOT_NAVIGATE
 	bool "navigate"
 	help
@@ -66,4 +87,9 @@ config BR2_PACKAGE_FLOT_THRESHOLD
 	help
 	  Flot plugin for thresholding data
 
+config BR2_PACKAGE_FLOT_TIME
+	bool "time"
+	help
+	  Flot plugin for handling time axes
+
 endif
diff --git a/package/flot/flot.mk b/package/flot/flot.mk
index 97110bc..56cb22e 100644
--- a/package/flot/flot.mk
+++ b/package/flot/flot.mk
@@ -4,7 +4,11 @@ FLOT_LICENSE = MIT
 FLOT_LICENSE_FILES = LICENSE.txt
 FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
 	$(if $(BR2_PACKAGE_FLOT_CANVAS),canvas) \
+	$(if $(BR2_PACKAGE_FLOT_CATEGORIES),categories) \
+	$(if $(BR2_PACKAGE_FLOT_CROSSHAIR),crosshair) \
+	$(if $(BR2_PACKAGE_FLOT_ERRORBARS),errorbars) \
 	$(if $(BR2_PACKAGE_FLOT_FILLBETWEEN),fillbetween) \
+	$(if $(BR2_PACKAGE_FLOT_IMAGE),image) \
 	$(if $(BR2_PACKAGE_FLOT_NAVIGATE),navigate) \
 	$(if $(BR2_PACKAGE_FLOT_PIE),pie) \
 	$(if $(BR2_PACKAGE_FLOT_RESIZE),resize) \
@@ -12,6 +16,7 @@ FLOT_FILES = jquery.flot $(addprefix jquery.flot.,\
 	$(if $(BR2_PACKAGE_FLOT_STACK),stack) \
 	$(if $(BR2_PACKAGE_FLOT_SYMBOL),symbol) \
 	$(if $(BR2_PACKAGE_FLOT_THRESHOLD),threshold) \
+	$(if $(BR2_PACKAGE_FLOT_TIME),time) \
 	)
 
 define FLOT_INSTALL_TARGET_CMDS
