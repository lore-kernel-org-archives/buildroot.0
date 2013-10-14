From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Oct 2013 10:46:11 -0300
Subject: [Buildroot] [PATCH] autossh: new package
Message-ID: <1381758371-13587-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          |  1 +
 package/autossh/Config.in  |  8 ++++++++
 package/autossh/autossh.mk | 17 +++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/autossh/Config.in
 create mode 100644 package/autossh/autossh.mk

diff --git a/package/Config.in b/package/Config.in
index 7f6931a..df53587 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -762,6 +762,7 @@ source "package/aiccu/Config.in"
 source "package/aircrack-ng/Config.in"
 source "package/argus/Config.in"
 source "package/arptables/Config.in"
+source "package/autossh/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
 source "package/bcusdk/Config.in"
diff --git a/package/autossh/Config.in b/package/autossh/Config.in
new file mode 100644
index 0000000..e3acd8a
--- /dev/null
+++ b/package/autossh/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_AUTOSSH
+	bool "autossh"
+	depends on BR2_USE_MMU # fork()
+	help
+	  autossh is a program to start a copy of ssh and monitor it,
+	  restarting it as necessary should it die or stop passing traffic.
+
+	  http://www.harding.motd.ca/autossh/
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
new file mode 100644
index 0000000..75d7892
--- /dev/null
+++ b/package/autossh/autossh.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# autossh
+#
+################################################################################
+
+AUTOSSH_VERSION = 1.4c
+AUTOSSH_SITE = http://www.harding.motd.ca/autossh
+AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
+AUTOSSH_LICENSE = Modified BSD
+AUTOSSH_LICENSE_FILES = autossh.c
+
+define AUTOSSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/autossh $(TARGET_DIR)/usr/bin/autossh
+endef
+
+$(eval $(autotools-package))
-- 
1.8.1.5
