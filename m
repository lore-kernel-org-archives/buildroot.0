From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 26 Jul 2011 15:28:19 +0200
Subject: [Buildroot] [git commit] inotify-tools: Add new package
Message-ID: <20110726133051.348098B4B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc38f2c8b5acd8ec32f024fe7fa806d7dc6dc1b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for inotify-tools, which are useful for scripting the
Linux inotify API.

[Peter: needs largefile support]
Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/inotify-tools/Config.in        |   14 ++++++++++++++
 package/inotify-tools/inotify-tools.mk |    8 ++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/inotify-tools/Config.in
 create mode 100644 package/inotify-tools/inotify-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 812a730..61f8256 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -491,6 +491,7 @@ source "package/dash/Config.in"
 endif
 source "package/dialog/Config.in"
 source "package/file/Config.in"
+source "package/inotify-tools/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/screen/Config.in"
diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
new file mode 100644
index 0000000..ed94b3f
--- /dev/null
+++ b/package/inotify-tools/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_INOTIFY_TOOLS
+	bool "inotify-tools"
+	depends on BR2_LARGEFILE
+	help
+	  inotify-tools is a C library and a set of command-line
+	  programs for Linux providing a simple interface to inotify.
+	  These programs can be used to monitor and act upon
+	  filesystem events. Provides the 'inotifywait' and 'inotifywatch'
+	  binaries.
+
+	  https://github.com/rvoicilas/inotify-tools
+
+comment "inotify-tools requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
new file mode 100644
index 0000000..d6378bb
--- /dev/null
+++ b/package/inotify-tools/inotify-tools.mk
@@ -0,0 +1,8 @@
+#############################################################
+#
+# inotify-utils
+#
+#############################################################
+INOTIFY_TOOLS_VERSION = 3.14
+INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
+$(eval $(call AUTOTARGETS,package,inotify-tools))
-- 
1.7.3.4
