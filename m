From: heiko at zuerker.org <heiko@zuerker.org>
Date: Fri, 24 Dec 2010 08:43:20 -0600
Subject: [Buildroot] [PATCH v2 1/3] add eventlog 0.2.12 (required by
	syslog-ng)
Message-ID: <68d89026bd8ffb144ab70206c02552c0b1084eec.1293201732.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in            |    1 +
 package/eventlog/Config.in   |   10 ++++++++++
 package/eventlog/eventlog.mk |   13 +++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/eventlog/Config.in
 create mode 100644 package/eventlog/eventlog.mk

diff --git a/package/Config.in b/package/Config.in
index d3ae75e..0b1b996 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -317,6 +317,7 @@ endmenu
 
 menu "Other"
 source "package/argp-standalone/Config.in"
+source "package/eventlog/Config.in"
 source "package/libatomic_ops/Config.in"
 source "package/libcap/Config.in"
 source "package/libdaemon/Config.in"
diff --git a/package/eventlog/Config.in b/package/eventlog/Config.in
new file mode 100644
index 0000000..287d8eb
--- /dev/null
+++ b/package/eventlog/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_EVENTLOG
+    bool "eventlog"
+    help
+      A new API to format and send structured log messages. It supports 
+      multiple message representations (plain, XML attributes and XML tags) 
+      and multiple output methods (local syslogd). 
+      Syslog-NG requires this library.
+      
+      http://www.balabit.com/support/community/products
+      
\ No newline at end of file
diff --git a/package/eventlog/eventlog.mk b/package/eventlog/eventlog.mk
new file mode 100644
index 0000000..ef52400
--- /dev/null
+++ b/package/eventlog/eventlog.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# EVENTLOG
+#
+#############################################################
+EVENTLOG_MAIN_VERSION = 0.2
+EVENTLOG_VERSION = $(EVENTLOG_MAIN_VERSION).12
+EVENTLOG_SOURCE = eventlog_$(EVENTLOG_VERSION).tar.gz
+EVENTLOG_SITE = http://www.balabit.com/downloads/files/eventlog/$(EVENTLOG_MAIN_VERSION)
+
+EVENTLOG_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,eventlog))
-- 
1.7.3.2
