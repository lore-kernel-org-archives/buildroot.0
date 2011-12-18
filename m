From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Dec 2011 23:40:11 +0100
Subject: [Buildroot] [git commit] package: add jQuery sparkline plugin
Message-ID: <20111218230945.D18A68F960@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=645ff758fea4c640d1afc8d1a00da1a5f0b076ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                            |    1 +
 package/jquery-sparkline/Config.in           |   13 +++++++++++++
 package/jquery-sparkline/jquery-sparkline.mk |   18 ++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2c15f23..5520279 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -324,6 +324,7 @@ endif
 
 menu "Javascript"
 source "package/jquery/Config.in"
+source "package/jquery-sparkline/Config.in"
 source "package/jquery-validation/Config.in"
 endmenu
 
diff --git a/package/jquery-sparkline/Config.in b/package/jquery-sparkline/Config.in
new file mode 100644
index 0000000..ae66364
--- /dev/null
+++ b/package/jquery-sparkline/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_JQUERY_SPARKLINE
+	bool "jQuery-Sparkline"
+	select BR2_PACKAGE_JQUERY
+	help
+	  This jQuery plugin generates sparklines (small inline
+	  charts) directly in the browser using data supplied either
+	  inline in the HTML, or via javascript.
+
+	  The plugin is compatible with most modern browsers and has
+	  been tested with Firefox 2+, Safari 3+, Opera 9, Google
+	  Chrome and Internet Explorer 6, 7 & 8.
+
+	  http://www.omnipotent.net/jquery.sparkline/
diff --git a/package/jquery-sparkline/jquery-sparkline.mk b/package/jquery-sparkline/jquery-sparkline.mk
new file mode 100644
index 0000000..93dddf0
--- /dev/null
+++ b/package/jquery-sparkline/jquery-sparkline.mk
@@ -0,0 +1,18 @@
+JQUERY_SPARKLINE_VERSION = 1.6
+JQUERY_SPARKLINE_SITE = http://www.omnipotent.net/jquery.sparkline/$(JQUERY_SPARKLINE_VERSION)
+JQUERY_SPARKLINE_SOURCE = jquery.sparkline.min.js
+
+define JQUERY_SPARKLINE_EXTRACT_CMDS
+	cp $(DL_DIR)/$(JQUERY_SPARKLINE_SOURCE) $(@D)
+endef
+
+define JQUERY_SPARKLINE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/$(JQUERY_SPARKLINE_SOURCE) \
+		$(TARGET_DIR)/var/www/jquery.sparkline.js
+endef
+
+define JQUERY_SPARKLINE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/var/www/jquery.sparkline.js
+endef
+
+$(eval $(call GENTARGETS))
