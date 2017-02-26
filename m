From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 21:44:27 +0100
Subject: [Buildroot] [PATCH next] memtool: new package
Message-ID: <20170226204427.31044-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

memtool allows one to read and write memory mapped registers via /dev/mem.
The commands are inspired by the respective commands of the barebox
bootloader.  This is handy during driver development to inspect and modify
register settings.  It can also be used to modify regular files and
character devices (e.g. to paint to /dev/fb0).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |  1 +
 package/memtool/Config.in    | 13 +++++++++++++
 package/memtool/memtool.hash |  2 ++
 package/memtool/memtool.mk   | 13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/memtool/Config.in
 create mode 100644 package/memtool/memtool.hash
 create mode 100644 package/memtool/memtool.mk

diff --git a/package/Config.in b/package/Config.in
index 3fa820b05..fa7e5cb78 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -418,6 +418,7 @@ endmenu
 	source "package/mdadm/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
+	source "package/memtool/Config.in"
 	source "package/minicom/Config.in"
 	source "package/msr-tools/Config.in"
 	source "package/nanocom/Config.in"
diff --git a/package/memtool/Config.in b/package/memtool/Config.in
new file mode 100644
index 000000000..63099d0d5
--- /dev/null
+++ b/package/memtool/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MEMTOOL
+	bool "memtool"
+	help
+	  Development tool to modify memory mapped registers.
+
+	  memtool allows one to read and write memory mapped registers
+	  via /dev/mem. The commands are inspired by the respective
+	  commands of the barebox bootloader.  This is handy during
+	  driver development to inspect and modify register
+	  settings. It can also be used to modify regular files and
+	  character devices (e.g. to paint to /dev/fb0).
+
+	  http://www.pengutronix.de/software/memtool/index_en.html
diff --git a/package/memtool/memtool.hash b/package/memtool/memtool.hash
new file mode 100644
index 000000000..95df1aaf8
--- /dev/null
+++ b/package/memtool/memtool.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  58309d356cb9b45a241cb602ca3850891a70ddaa93ced51d1cced78e14767680  memtool-2016.10.0.tar.xz
diff --git a/package/memtool/memtool.mk b/package/memtool/memtool.mk
new file mode 100644
index 000000000..59b864cd5
--- /dev/null
+++ b/package/memtool/memtool.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# memtool
+#
+################################################################################
+
+MEMTOOL_VERSION = 2016.10.0
+MEMTOOL_SITE = http://public.pengutronix.de/software/memtool/
+MEMTOOL_SOURCE = memtool-$(MEMTOOL_VERSION).tar.xz
+MEMTOOL_LICENSE = GPLv2
+MEMTOOL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.11.0
