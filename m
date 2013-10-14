From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Oct 2013 22:00:38 +0200
Subject: [Buildroot] [git commit] autossh: new package
Message-ID: <20131014203036.AA9F69A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=05d59aa2689acb86e72052418fe85b186b0a39e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in          |    1 +
 package/autossh/Config.in  |    8 ++++++++
 package/autossh/autossh.mk |   17 +++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 41d828a..7af6d42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -760,6 +760,7 @@ source "package/aiccu/Config.in"
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
