From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 15 Aug 2016 23:42:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
Message-ID: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the simh multi-system emulator.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/Config.in      |  1 +
 package/simh/Config.in |  6 ++++++
 package/simh/simh.hash |  2 ++
 package/simh/simh.mk   | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/simh/Config.in
 create mode 100644 package/simh/simh.hash
 create mode 100644 package/simh/simh.mk

diff --git a/package/Config.in b/package/Config.in
index 645fa29..993b446 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -219,6 +219,7 @@ menu "Games"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
+	source "package/simh/Config.in"
 	source "package/sl/Config.in"
 	source "package/stella/Config.in"
 	source "package/supertuxkart/Config.in"
diff --git a/package/simh/Config.in b/package/simh/Config.in
new file mode 100644
index 0000000..bcf6a3d
--- /dev/null
+++ b/package/simh/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SIMH
+	bool "simh"
+	help
+	  SIMH is a highly portable, multi-system simulator.
+
+	  http://simh.trailing-edge.com
diff --git a/package/simh/simh.hash b/package/simh/simh.hash
new file mode 100644
index 0000000..b9fd211
--- /dev/null
+++ b/package/simh/simh.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 fd960602a3996b387066e9458e22d3bea940e88378afddc6ee81f33bf854efb9 simh-e93b55b4887dfcf1d0dd6ff86f94470e42a10702.tar.gz
diff --git a/package/simh/simh.mk b/package/simh/simh.mk
new file mode 100644
index 0000000..f650c69
--- /dev/null
+++ b/package/simh/simh.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# simh
+#
+################################################################################
+
+SIMH_VERSION = e93b55b4887dfcf1d0dd6ff86f94470e42a10702
+SIMH_SITE = https://github.com/simh/simh
+SIMH_SITE_METHOD = git
+SIMH_LICENSE = simh license
+SIMH_LICENSE_FILES = README
+
+define SIMH_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define SIMH_INSTALL_TARGET_CMDS
+	cp -dpf $(@D)/BIN/* $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
