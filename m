From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 21:37:02 +0100
Subject: [Buildroot] [git commit] Yavta: new package
Message-ID: <20130122203922.D907B9A72D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb6404e1e20a718cc47176823f320cf67c0d6cc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: License is GPLv2+, move out of package/multimedia]
Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in |    1 +
 package/yavta/Config.in      |    6 ++++++
 package/yavta/yavta.mk       |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index e50eda9..931e6d3 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -25,4 +25,5 @@ source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
+source "package/yavta/Config.in"
 endmenu
diff --git a/package/yavta/Config.in b/package/yavta/Config.in
new file mode 100644
index 0000000..6a42a94
--- /dev/null
+++ b/package/yavta/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_YAVTA
+	bool "yavta"
+	help
+	  Yet Another V4L2 Test Application
+
+	  http://git.ideasonboard.org/yavta.git
diff --git a/package/yavta/yavta.mk b/package/yavta/yavta.mk
new file mode 100644
index 0000000..b8a72de
--- /dev/null
+++ b/package/yavta/yavta.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# yavta
+#
+#############################################################
+
+YAVTA_VERSION = 82ff2efdb9787737b9f21b6f4759f077c827b238
+YAVTA_SITE = git://git.ideasonboard.org/yavta.git
+YAVTA_LICENSE = GPLv2+
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
