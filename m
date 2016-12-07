From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed,  7 Dec 2016 12:34:44 -0600
Subject: [Buildroot] [PATCH] angular-websocket: new package
Message-ID: <1481135684-62954-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>

Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in                              |  1 +
 package/angular-websocket/Config.in            |  8 ++++++++
 package/angular-websocket/angular-websocket.mk | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/angular-websocket/Config.in
 create mode 100644 package/angular-websocket/angular-websocket.mk

diff --git a/package/Config.in b/package/Config.in
index 664d0d9..27bc6be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1172,6 +1172,7 @@ menu "Networking"
 	source "package/alljoyn-base/Config.in"
 	source "package/alljoyn-tcl/Config.in"
 	source "package/alljoyn-tcl-base/Config.in"
+	source "package/angular-websocket/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/angular-websocket/Config.in b/package/angular-websocket/Config.in
new file mode 100644
index 0000000..5878e84
--- /dev/null
+++ b/package/angular-websocket/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ANGULAR_WEBSOCKET
+	bool "angular-websocket"
+	select BR2_PACKAGE_ANGULARJS
+	help
+	  An AngularJS WebSocket service for connecting client
+	  applications to servers.
+
+	  https://github.com/AngularClass/angular-websocket
diff --git a/package/angular-websocket/angular-websocket.mk b/package/angular-websocket/angular-websocket.mk
new file mode 100644
index 0000000..b422847
--- /dev/null
+++ b/package/angular-websocket/angular-websocket.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# angular-websocket
+#
+################################################################################
+
+ANGULAR_WEBSOCKET_VERSION = v2.0.0
+ANGULAR_WEBSOCKET_SITE = $(call github,AngularClass,angular-websocket,$(ANGULAR_WEBSOCKET_VERSION))
+ANGULAR_WEBSOCKET_LICENSE = MIT
+ANGULAR_WEBSOCKET_LICENSE_FILES = LICENSE
+
+# install .min.js as .js
+define ANGULAR_WEBSOCKET_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/angular-websocket.min.js \
+		$(TARGET_DIR)/var/www/angular-websocket.js
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
