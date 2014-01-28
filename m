From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:16:11 +0100
Subject: [Buildroot] [git commit] package/tmux: new package
Message-ID: <20140128212010.71AFD9C6AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=063ab4de0fb332c8183d8942505c1ec714cf2e9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix license info]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      |    3 +++
 package/tmux/Config.in |    9 +++++++++
 package/tmux/tmux.mk   |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 677f01e..47d1d32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -995,6 +995,9 @@ source "package/screen/Config.in"
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
index 0000000..3f5f893
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
+TMUX_LICENSE = ISC
+TMUX_LICENSE_FILES = README
+TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
+
+$(eval $(autotools-package))
