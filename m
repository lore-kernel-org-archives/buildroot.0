From: Marcin Bis <marcin@bis.org.pl>
Date: Mon, 27 Apr 2015 15:42:09 +0200
Subject: [Buildroot] [PATCH] cc-tool: new package
Message-ID: <1430142129-32750-1-git-send-email-marcin@bis.org.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cc-tool provides support for Texas Instruments CC Debugger

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
---
 package/Config.in            |  1 +
 package/cc-tool/Config.in    | 21 +++++++++++++++++++++
 package/cc-tool/cc-tool.hash |  3 +++
 package/cc-tool/cc-tool.mk   | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 package/cc-tool/Config.in
 create mode 100644 package/cc-tool/cc-tool.hash
 create mode 100644 package/cc-tool/cc-tool.mk

diff --git a/package/Config.in b/package/Config.in
index 4e20e4d..12767d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
 	source "package/cwiid/Config.in"
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
new file mode 100644
index 0000000..f62200d
--- /dev/null
+++ b/package/cc-tool/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CC_TOOL
+	bool "cc-tool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_SIGNALS
+	help
+	  cc-tool provides support for Texas Instruments CC Debugger
+	  for Linux OS in order to program 8051-based System-On-Chip
+	  devices: CC254x CC253x CC243x CC251x CC111x
+
+	  http://sourceforge.net/projects/cctool/
+
+comment "cc-tool needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cc-tool/cc-tool.hash b/package/cc-tool/cc-tool.hash
new file mode 100644
index 0000000..81844ee
--- /dev/null
+++ b/package/cc-tool/cc-tool.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/cctool/files/
+sha1 f313e55f019ea5338438633f5b5e689b699343e1  cc-tool-0.26-src.tgz
+md5 26960676f3e6264e612c299fbf8ec5ea  cc-tool-0.26-src.tgz
diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
new file mode 100644
index 0000000..9a6ee6e
--- /dev/null
+++ b/package/cc-tool/cc-tool.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cc-tool
+#
+################################################################################
+
+CC_TOOL_VERSION = 0.26
+CC_TOOL_SITE = http://downloads.sourceforge.net/project/cctool
+CC_TOOL_SOURCE = cc-tool-$(CC_TOOL_VERSION)-src.tgz
+CC_TOOL_LICENSE = GPLv2
+CC_TOOL_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
