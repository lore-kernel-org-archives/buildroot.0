From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 22 Jan 2013 11:09:32 +0100
Subject: [Buildroot] [PATCH v4 1/2] Yavta: new package
Message-ID: <1358849373-20243-1-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/multimedia/Config.in       |    1 +
 package/multimedia/yavta/Config.in |    6 ++++++
 package/multimedia/yavta/yavta.mk  |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/multimedia/yavta/Config.in
 create mode 100644 package/multimedia/yavta/yavta.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index e50eda9..5b2d1ad 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -25,4 +25,5 @@ source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
+source "package/multimedia/yavta/Config.in"
 endmenu
diff --git a/package/multimedia/yavta/Config.in b/package/multimedia/yavta/Config.in
new file mode 100644
index 0000000..6a42a94
--- /dev/null
+++ b/package/multimedia/yavta/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_YAVTA
+	bool "yavta"
+	help
+	  Yet Another V4L2 Test Application
+
+	  http://git.ideasonboard.org/yavta.git
diff --git a/package/multimedia/yavta/yavta.mk b/package/multimedia/yavta/yavta.mk
new file mode 100644
index 0000000..0778217
--- /dev/null
+++ b/package/multimedia/yavta/yavta.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# yavta
+#
+#############################################################
+
+YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
+YAVTA_SITE = git://git.ideasonboard.org/yavta.git
+YAVTA_LICENSE = GPLv2
+YAVTA_LICENSE_FILES = COPYING.GPL
+
+define YAVTA_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define YAVTA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/yavta $(TARGET_DIR)/usr/bin/yavta
+endef
+
+$(eval $(generic-package)) 
-- 
1.7.9.5
