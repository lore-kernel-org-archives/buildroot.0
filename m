From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun,  6 May 2012 07:59:00 +0100
Subject: [Buildroot] [PATCH] Added the empty package
Message-ID: <1336287540-4056-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in       |    1 +
 package/empty/Config.in |    6 ++++++
 package/empty/empty.mk  |   18 ++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/empty/Config.in
 create mode 100644 package/empty/empty.mk

diff --git a/package/Config.in b/package/Config.in
index 6caca9d..3e60660 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -467,6 +467,7 @@ endmenu
 endmenu
 
 menu "Miscellaneous"
+source "package/empty/Config.in"
 source "package/shared-mime-info/Config.in"
 endmenu
 
diff --git a/package/empty/Config.in b/package/empty/Config.in
new file mode 100644
index 0000000..67b09fc
--- /dev/null
+++ b/package/empty/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EMPTY
+	bool "empty"
+	help
+	  Run processes and applications under pseudo-terminal (PTY) sessions.
+
+	  http://empty.sourceforge.net/
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
new file mode 100644
index 0000000..137e196
--- /dev/null
+++ b/package/empty/empty.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# empty
+#
+#############################################################
+EMPTY_VERSION = 0.6.18b
+EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
+EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
+
+define EMPTY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define EMPTY_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.9.5
