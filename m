From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat,  2 Jul 2016 15:24:02 +0300
Subject: [Buildroot] [PATCH v1 1/1] package: Add hid-replay package
Message-ID: <1467462242-35261-1-git-send-email-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package provides a tool to record HID events and replay them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/Config.in                |  1 +
 package/hid-replay/Config.in     |  6 ++++++
 package/hid-replay/hid-replay.mk | 12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/hid-replay/Config.in
 create mode 100644 package/hid-replay/hid-replay.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..5d0114d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -80,6 +80,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/hid-replay/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
diff --git a/package/hid-replay/Config.in b/package/hid-replay/Config.in
new file mode 100644
index 0000000..512a626
--- /dev/null
+++ b/package/hid-replay/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HID_REPLAY
+	bool "hid-replay"
+	help
+	  HID recorder for Linux
+
+	  http://bentiss.github.io/hid-replay-docs/
diff --git a/package/hid-replay/hid-replay.mk b/package/hid-replay/hid-replay.mk
new file mode 100644
index 0000000..0e021de
--- /dev/null
+++ b/package/hid-replay/hid-replay.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# hid-replay
+#
+################################################################################
+
+HID_REPLAY_VERSION = master
+HID_REPLAY_SITE = https://github.com/bentiss/hid-replay.git
+HID_REPLAY_SITE_METHOD = git
+HID_REPLAY_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.8.1
