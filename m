From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 19:19:23 +0100
Subject: [Buildroot] [PATCH 2/9] dtach: new package
In-Reply-To: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364149170-5521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364149170-5521-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Justin Maggard <jmaggard@netgear.com>

Signed-off-by: Justin Maggard <jmaggard@netgear.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes from v1 to v2:
 * Remove scrollback feature patch. We don't take feature patches in
   Buildroot.
 * Fixup commit title.
 * Fixed the site URL to use downloads.sourceforge.net
 * Use $(eval autotools-package)
---
 package/Config.in       |    1 +
 package/dtach/Config.in |    8 ++++++++
 package/dtach/dtach.mk  |   17 +++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/dtach/Config.in
 create mode 100644 package/dtach/dtach.mk

diff --git a/package/Config.in b/package/Config.in
index 94e279b..c66e139 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -774,6 +774,7 @@ source "package/bash/Config.in"
 source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
+source "package/dtach/Config.in"
 source "package/file/Config.in"
 source "package/gnupg/Config.in"
 source "package/inotify-tools/Config.in"
diff --git a/package/dtach/Config.in b/package/dtach/Config.in
new file mode 100644
index 0000000..033536b
--- /dev/null
+++ b/package/dtach/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DTACH
+	bool "dtach"
+	help
+	  dtach is a tiny program that emulates the detach feature of screen,
+	  allowing you to run a program in an environment that is protected
+	  from the controlling terminal and attach to it later.
+
+	  http://dtach.sourceforge.net/
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
new file mode 100644
index 0000000..77ad7c0
--- /dev/null
+++ b/package/dtach/dtach.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# dtach
+#
+#############################################################
+
+DTACH_VERSION = 0.8
+DTACH_SITE = http://downloads.sourceforge.net/project/dtach/dtach/$(DTACH_VERSION)
+DTACH_LICENSE = GPLv2+
+DTACH_LICENSE_FILES = COPYING
+
+# The Makefile does not have an install target.
+define DTACH_INSTALL_TARGET_CMDS
+        $(INSTALL) -D -m 0755 $(@D)/dtach $(TARGET_DIR)/usr/bin/dtach
+endef
+
+$(eval $(autotools-package))
-- 
1.7.9.5
