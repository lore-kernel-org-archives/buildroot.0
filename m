From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 25 Jul 2011 16:38:39 -0400
Subject: [Buildroot] [PATCH] inotify-tools: Add new package
Message-ID: <1311626319-19243-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support for inotify-tools, which are useful for scripting the
Linux inotify API.

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/Config.in                      |    1 +
 package/inotify-tools/Config.in        |   10 ++++++++++
 package/inotify-tools/inotify-tools.mk |   10 ++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/inotify-tools/Config.in
 create mode 100644 package/inotify-tools/inotify-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 40f523d..b3b93b0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -474,6 +474,7 @@ source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
 source "package/file/Config.in"
+source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/screen/Config.in"
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
new file mode 100644
index 0000000..1e6589d
--- /dev/null
+++ b/package/inotify-tools/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_INOTIFY_TOOLS
+	bool "inotify-tools"
+	help
+	 inotify-tools is a C library and a set of command-line 
+	 programs for Linux providing a simple interface to inotify. 
+	 These programs can be used to monitor and act upon filesystem 
+	 events.
+
+		inotifywait  - wait for changes to files using inotify
+		inotifywatch - gather filesystem access statistics using inotify
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
new file mode 100644
index 0000000..4ff652c
--- /dev/null
+++ b/package/inotify-tools/inotify-tools.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# inotify-utils
+# https://github.com/rvoicilas/inotify-tools
+#############################################################
+INOTIFY_TOOLS_VERSION = 3.14
+INOTIFY_TOOLS_SOURCE = inotify-tools-$(INOTIFY_TOOLS_VERSION).tar.gz
+INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
+INOTIFY_TOOLS_INSTALL_TARGET = YES
+$(eval $(call AUTOTARGETS,package,inotify-tools))
-- 
1.7.3.4
