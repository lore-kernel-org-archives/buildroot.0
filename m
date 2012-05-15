From: =?UTF-8?q?Dominik=20F=C3=A4ssler?= <faessler@was.ch>
Date: Tue, 15 May 2012 09:36:22 +0200
Subject: [Buildroot] [PATCH] logsurfer: new package
Message-ID: <1337067382-19212-1-git-send-email-faessler@was.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in              |    1 +
 package/logsurfer/Config.in    |    7 +++++++
 package/logsurfer/logsurfer.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/logsurfer/Config.in
 create mode 100644 package/logsurfer/logsurfer.mk

diff --git a/package/Config.in b/package/Config.in
index 4e3c414..091f8d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -613,6 +613,7 @@ source "package/file/Config.in"
 source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
+source "package/logsurfer/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
new file mode 100644
index 0000000..27d1881
--- /dev/null
+++ b/package/logsurfer/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LOGSURFER
+	bool "logsurfer"
+	help
+	  Logsurfer is a program for monitoring system logs in real-time,
+	  and reporting on the occurrence of events.
+
+	  http://www.crypt.gen.nz/logsurfer/
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
new file mode 100644
index 0000000..31405ff
--- /dev/null
+++ b/package/logsurfer/logsurfer.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# logsurfer
+#
+#############################################################
+
+LOGSURFER_VERSION = 1.8
+LOGSURFER_SOURCE = logsurfer-$(LOGSURFER_VERSION).tar.gz
+LOGSURFER_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/logsurfer/logsurfer/logsurfer-${LOGSURFER_VERSION}
+
+define LOGSURFER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer $(TARGET_DIR)/bin
+endef
+
+$(eval $(call AUTOTARGETS,package,logsurfer))
-- 
1.7.2.5
