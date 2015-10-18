From: Ben Boeckel <mathstuf@gmail.com>
Date: Sun, 18 Oct 2015 17:36:27 -0400
Subject: [Buildroot] [PATCH 1/1] taskd: new package
Message-ID: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Taskwarrior is a task management suite of tools. Taskd is the
synchronization server for it.

Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 package/Config.in       |  1 +
 package/taskd/Config.in |  9 +++++++++
 package/taskd/taskd.mk  | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/taskd/Config.in
 create mode 100644 package/taskd/taskd.mk

diff --git a/package/Config.in b/package/Config.in
index 7746742..0620465 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1370,6 +1370,7 @@ endif
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
+	source "package/taskd/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
new file mode 100644
index 0000000..534881f
--- /dev/null
+++ b/package/taskd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TASKD
+	bool "taskd"
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Task management synchronization daemon.
+
+	  http://taskwarrior.org/
diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
new file mode 100644
index 0000000..0bdf81d
--- /dev/null
+++ b/package/taskd/taskd.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# taskd
+#
+################################################################################
+
+TASKD_VERSION = 1.1.0
+TASKD_SOURCE = taskd-$(TASKD_VERSION).tar.gz
+TASKD_SITE = http://taskwarrior.org/download
+TASKD_LICENSE = MIT
+TASKD_LICENSE_FILES = COPYING LICENSE
+TASKD_DEPENDENCIES = gnutls util-linux
+
+$(eval $(cmake-package))
-- 
2.6.1
