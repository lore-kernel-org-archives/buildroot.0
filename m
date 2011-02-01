From: Martin Hicks <mort@bork.org>
Date: Tue,  1 Feb 2011 12:19:00 -0500
Subject: [Buildroot] [PATCH] Add package bonnie++
Message-ID: <1296580740-4790-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A good filesystem performance benchmark program

Signed-off-by: Martin Hicks <mort@bork.org>
---
 package/Config.in        |    1 +
 package/bonnie/Config.in |    6 ++++++
 package/bonnie/bonnie.mk |   18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/bonnie/Config.in
 create mode 100644 package/bonnie/bonnie.mk

diff --git a/package/Config.in b/package/Config.in
index 631bb80..49859b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -17,6 +17,7 @@ source "package/xz/Config.in"
 endmenu
 
 menu "Debugging, profiling and benchmark"
+source "package/bonnie/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dmalloc/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/bonnie/Config.in b/package/bonnie/Config.in
new file mode 100644
index 0000000..6bef13b
--- /dev/null
+++ b/package/bonnie/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BONNIE
+	bool "bonnie++"
+	help
+          Filesystem tester
+
+	  http://www.coker.com.au/bonnie++/
diff --git a/package/bonnie/bonnie.mk b/package/bonnie/bonnie.mk
new file mode 100644
index 0000000..03fce50
--- /dev/null
+++ b/package/bonnie/bonnie.mk
@@ -0,0 +1,18 @@
+#
+# bonnie++
+#
+BONNIE_VERSION = 1.03e
+BONNIE_SOURCE = bonnie++-$(BONNIE_VERSION).tgz
+BONNIE_SITE = http://www.coker.com.au/bonnie++/
+BONNIE_INSTALL_TARGET_OPT = INSTALL="install -m 0755" install-bin
+
+define BONNIE_INSTALL_TARGET_CMDS
+	install -D -m 755 $(@D)/bonnie++ $(TARGET_DIR)/usr/sbin
+	install -D -m 755 $(@D)/zcav $(TARGET_DIR)/usr/sbin
+endef
+
+define BONNIE_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/bonnie++ $(TARGET_DIR)/usr/sbin/zcav
+endef
+
+$(eval $(call AUTOTARGETS,package,bonnie))
-- 
1.5.6.5
