From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Mon, 2 Dec 2013 17:09:45 -0600
Subject: [Buildroot] [PATCH] tmux: new package 1.8
Message-ID: <20131202230945.GA6948@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 package/Config.in      |  3 +++
 package/tmux/Config.in | 13 +++++++++++++
 package/tmux/tmux.mk   | 11 +++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/tmux/Config.in
 create mode 100644 package/tmux/tmux.mk

diff --git a/package/Config.in b/package/Config.in
index 40f964b..6fb063d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,6 +948,9 @@ source "package/screen/Config.in"
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
index 0000000..39f83b0
--- /dev/null
+++ b/package/tmux/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TMUX
+	bool "tmux"
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_MMU # fork()
+	help
+	  tmux is a "terminal multiplexer", it enables
+	  a number of terminals (or windows) to be accessed
+	  and controlled from a single terminal.  tmux is
+	  intended to be a simple, modern, BSD-licensed
+	  alternative to programs such as GNU screen.
+
+	  http://tmux.sourceforge.net/
diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
new file mode 100644
index 0000000..2ff5e46
--- /dev/null
+++ b/package/tmux/tmux.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# tmux
+#
+################################################################################
+
+TMUX_VERSION = 1.8
+TMUX_SITE = http://downloads.sourceforge.net/project/tmux/tmux/tmux-$(TMUX_VERSION)
+TMUX_DEPENDENCIES = ncurses libevent
+
+$(eval $(autotools-package))
-- 
1.8.4.rc3
