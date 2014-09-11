From: David Bachelart <david.bachelart@bbright.com>
Date: Thu, 11 Sep 2014 09:44:25 +0200
Subject: [Buildroot] [PATCH 1/1] ipmitool: new package
Message-ID: <1410421465-9788-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in            |    1 +
 package/ipmitool/Config.in   |    8 ++++++++
 package/ipmitool/ipmiutil.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/ipmitool/Config.in
 create mode 100644 package/ipmitool/ipmiutil.mk

diff --git a/package/Config.in b/package/Config.in
index 883dd66..302a638 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -321,6 +321,7 @@ endif
 	source "package/input-tools/Config.in"
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
+	source "package/ipmitool/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
new file mode 100644
index 0000000..c456a61
--- /dev/null
+++ b/package/ipmitool/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IPMITOOL
+  bool "ipmitool"
+  help
+    IPMItool provides a simple command-line interface to IPMI-enabled devices
+    through an IPMIv1.5 or IPMIv2.0 LAN interface or Linux/Solaris kernel 
+    driver.
+
+    http://ipmitool.sourceforge.net/
diff --git a/package/ipmitool/ipmiutil.mk b/package/ipmitool/ipmiutil.mk
new file mode 100644
index 0000000..2b179b0
--- /dev/null
+++ b/package/ipmitool/ipmiutil.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ipmitool
+#
+################################################################################
+
+IPMITOOL_VERSION = 1.8.14
+IPMITOOL_SITE = http://sourceforge.net/projects/ipmitool/files/ipmitool/$(IPMITOOL_VERSION)
+IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
+
+IPMITOOL_LICENSE = GPL2+
+IPMITOOL_LICENSE_FILES = COPYING
+
+IPMITOOL_CONF_OPTS = --enable-ipmishell
+
+$(eval $(autotools-package))
-- 
1.7.10.4
