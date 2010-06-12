From: Paul Jones <paul@pauljones.id.au>
Date: Sat, 12 Jun 2010 10:45:13 +1000
Subject: [Buildroot] [PATCH 1/1] Add package xterm
Message-ID: <1276303513-31445-1-git-send-email-paul@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paul Jones <paul@pauljones.id.au>
---
 package/Config.in       |    1 +
 package/xterm/Config.in |    6 ++++++
 package/xterm/xterm.mk  |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/xterm/Config.in
 create mode 100644 package/xterm/xterm.mk

diff --git a/package/Config.in b/package/Config.in
index 427b35a..2378f08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -139,6 +139,7 @@ source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xstroke/Config.in"
+source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 endmenu
 
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
new file mode 100644
index 0000000..da3e9fe
--- /dev/null
+++ b/package/xterm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XTERM
+	bool "xterm"
+	depends on BR2_PACKAGE_XORG7
+	help
+	  xterm terminal emulator
+
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
new file mode 100644
index 0000000..b07eda4
--- /dev/null
+++ b/package/xterm/xterm.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# xterm
+#
+#############################################################
+
+XTERM_VERSION:=259
+XTERM_SOURCE:=xterm-$(XTERM_VERSION).tgz
+XTERM_SITE:=ftp://invisible-island.net/xterm
+XTERM_DEPENDENCIES = xserver_xorg-server
+XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package,xterm))
-- 
1.7.0.4
