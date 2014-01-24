From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jan 2014 00:15:14 +0100
Subject: [Buildroot] [PATCH] package/tmux: new package
Message-ID: <1390605314-14452-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in      |  3 +++
 package/tmux/Config.in |  9 +++++++++
 package/tmux/tmux.mk   | 13 +++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/tmux/Config.in
 create mode 100644 package/tmux/tmux.mk

diff --git a/package/Config.in b/package/Config.in
index 397cc11..fd95673 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -994,6 +994,9 @@ source "package/screen/Config.in"
 source "package/sudo/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/time/Config.in"
+endif
+source "package/tmux/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/which/Config.in"
 endif
 source "package/xmlstarlet/Config.in"
diff --git a/package/tmux/Config.in b/package/tmux/Config.in
new file mode 100644
index 0000000..831d119
--- /dev/null
+++ b/package/tmux/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TMUX
+	bool "tmux"
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NCURSES
+	help
+	  tmux is a terminal multiplexer, it enables a number of terminals
+	  (or windows) to be accessed and controlled from a single terminal.
+
+	  http://tmux.sourceforge.net/
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
new file mode 100644
index 0000000..0a10452
--- /dev/null
+++ b/package/tmux/tmux.mk
@@ -0,0 +1,13 @@
+###############################################################################
+#
+# tmux
+#
+###############################################################################
+
+TMUX_VERSION = 1.8
+TMUX_SITE = http://downloads.sourceforge.net/tmux
+TMUX_LICENSE = BSD
+TMUX_LICENSE_FILES = COPYING
+TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
+
+$(eval $(autotools-package))
-- 
1.8.1.2
