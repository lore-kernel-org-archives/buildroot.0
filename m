From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sat, 20 Jul 2013 08:31:19 +0800
Subject: [Buildroot] [PATCH v2 1/1] netcat6: new package
Message-ID: <1374280279-32703-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change-Id: I9bc6ef244276f26ff6e4149677cd3a3d8f2de0c2
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/Config.in          |  1 +
 package/netcat6/Config.in  | 12 ++++++++++++
 package/netcat6/netcat6.mk | 13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/netcat6/Config.in
 create mode 100644 package/netcat6/netcat6.mk

diff --git a/package/Config.in b/package/Config.in
index 286a605..b8011c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -760,6 +760,7 @@ source "package/ncftp/Config.in"
 source "package/ndisc6/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
+source "package/netcat6/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
diff --git a/package/netcat6/Config.in b/package/netcat6/Config.in
new file mode 100644
index 0000000..68cf2dc
--- /dev/null
+++ b/package/netcat6/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_NETCAT6
+	bool "netcat6"
+	help
+	  Netcat is a featured networking utility which reads and writes data
+	  across network connections, using the TCP/IP protocol.
+	  It is designed to be a reliable "back-end" tool that can be used
+	  directly or easily driven by other programs and scripts. At the
+	  same time, it is a feature-rich network debugging and exploration
+	  tool, since it can create almost any kind of connection you would
+	  need and has several interesting built-in capabilities.
+
+	  http://netcat.sourceforge.net/download.php
diff --git a/package/netcat6/netcat6.mk b/package/netcat6/netcat6.mk
new file mode 100644
index 0000000..7cf900c
--- /dev/null
+++ b/package/netcat6/netcat6.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# netcat6
+#
+#############################################################
+
+NETCAT6_VERSION = 1.0
+NETCAT6_SOURCE = nc6-$(NETCAT6_VERSION).tar.bz2
+NETCAT6_SITE = http://downloads.sourceforge.net/project/netcat/netcat/$(NETCAT6_VERSION)
+NETCAT6_LICENSE = GPLv2+
+NETCAT6_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.3.2
