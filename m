From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Date: Tue, 23 Feb 2016 18:54:55 +0530
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
Message-ID: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


---
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
 package/Config.in      |  1 +
 package/jsen/Config.in |  6 ++++++
 package/jsen/jsen.hash |  2 ++
 package/jsen/jsen.mk   | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/jsen/Config.in
 create mode 100644 package/jsen/jsen.hash
 create mode 100644 package/jsen/jsen.mk

diff --git a/package/Config.in b/package/Config.in
index a5b31aa..6f8b8bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "External jQuery plugins"
 	source "package/jquery-validation/Config.in"
 endmenu
 endif
+	source "package/jsen/Config.in"
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
 endmenu
diff --git a/package/jsen/Config.in b/package/jsen/Config.in
new file mode 100644
index 0000000..8c41a19
--- /dev/null
+++ b/package/jsen/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_JSEN
+	bool "jsen"
+	help
+	  JSEN (JSON Sentinel) validates your JSON objects using JSON-Schema.
+
+	  https://github.com/bugventure/jsen
diff --git a/package/jsen/jsen.hash b/package/jsen/jsen.hash
new file mode 100644
index 0000000..fdfcd93
--- /dev/null
+++ b/package/jsen/jsen.hash
@@ -0,0 +1,2 @@
+# Locally Computed
+sha256  651b3ae5c92865705c144175a8297305788a0e9a1f46ee9b8caa127c6bce6709  jsen-v0.6.0.tar.gz
diff --git a/package/jsen/jsen.mk b/package/jsen/jsen.mk
new file mode 100644
index 0000000..535389d
--- /dev/null
+++ b/package/jsen/jsen.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jsen
+#
+################################################################################
+
+JSEN_VERSION = v0.6.0
+JSEN_SITE = $(call github,bugventure,jsen,$(JSEN_VERSION))
+JSEN_LICENSE = MIT
+JSEN_LICENSE_FILES = LICENSE
+
+define JSEN_INSTALL_TARGET_CMDS
+        mkdir -p $(TARGET_DIR)/usr/share/jsen
+        $(foreach d,dist lib index.js,\
+                cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/jsen/$(sep))
+endef
+
+$(eval $(generic-package))
-- 
2.5.0
