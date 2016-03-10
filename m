From: Ben Boeckel <mathstuf@gmail.com>
Date: Wed,  9 Mar 2016 21:38:40 -0500
Subject: [Buildroot] [PATCH v2 1/1] taskd: new package
In-Reply-To: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
References: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
Message-ID: <1457577520-11211-1-git-send-email-mathstuf@gmail.com>
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
 package/taskd/Config.in | 11 +++++++++++
 package/taskd/taskd.mk  | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/taskd/Config.in
 create mode 100644 package/taskd/taskd.mk

diff --git a/package/Config.in b/package/Config.in
index d916154..35a24ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1489,6 +1489,7 @@ endif
 	source "package/sshpass/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
+	source "package/taskd/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/taskd/Config.in b/package/taskd/Config.in
new file mode 100644
index 0000000..5b357f5
--- /dev/null
+++ b/package/taskd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TASKD
+	bool "taskd"
+	select BR2_PACKAGE_GNUTLS
+	select BR2_USE_MMU
+	select BR2_USE_WCHAR
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
2.7.2
