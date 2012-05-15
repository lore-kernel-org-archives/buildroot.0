From: =?UTF-8?q?Dominik=20F=C3=A4ssler?= <faessler@was.ch>
Date: Tue, 15 May 2012 07:27:41 +0200
Subject: [Buildroot] [PATCH] autossh: new package
Message-ID: <1337059661-4008-1-git-send-email-faessler@was.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in          |    1 +
 package/autossh/Config.in  |    8 ++++++++
 package/autossh/autossh.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/autossh/Config.in
 create mode 100644 package/autossh/autossh.mk

diff --git a/package/Config.in b/package/Config.in
index fb1b08f..4e3c414 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,6 +476,7 @@ endmenu
 
 menu "Networking applications"
 source "package/argus/Config.in"
+source "package/autossh/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
 source "package/bluez_utils/Config.in"
diff --git a/package/autossh/Config.in b/package/autossh/Config.in
new file mode 100644
index 0000000..c867eba
--- /dev/null
+++ b/package/autossh/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_AUTOSSH
+	bool "autossh"
+	select BR2_PACKAGE_OPENSSH
+	help
+	  A program to start a copy of ssh and monitor it, restarting
+	  it as necessary should it die or stop passing traffic.
+
+	  http://www.harding.motd.ca/autossh/
diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
new file mode 100644
index 0000000..d81731a
--- /dev/null
+++ b/package/autossh/autossh.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# autossh
+#
+#############################################################
+
+AUTOSSH_VERSION = 1.4c
+AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
+AUTOSSH_SITE = http://www.harding.motd.ca/autossh
+AUTOSSH_DEPENDENCIES = openssh
+
+define AUTOSSH_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/autossh $(TARGET_DIR)/bin
+endef
+
+$(eval $(call AUTOTARGETS,package,autossh))
-- 
1.7.2.5
