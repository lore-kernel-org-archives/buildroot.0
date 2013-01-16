From: Bogdan Radulescu <bogdan@nimblex.net>
Date: Wed, 16 Jan 2013 15:49:38 +0000
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
References: <1358351378-10876-1-git-send-email-bogdan@nimblex.net>
Message-ID: <1358351378-10876-2-git-send-email-bogdan@nimblex.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the iftop package which is really usefull to see quickly
what uses the bandwidth on your machine.
---
 package/Config.in       |  1 +
 package/iftop/Config.in | 12 ++++++++++++
 package/iftop/iftop.mk  | 14 ++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/iftop/Config.in
 create mode 100644 package/iftop/iftop.mk

diff --git a/package/Config.in b/package/Config.in
index ba03b3c..9e2dd8b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -772,6 +772,7 @@ endif
 source "package/bwm-ng/Config.in"
 source "package/cpuload/Config.in"
 source "package/htop/Config.in"
+source "package/iftop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/iftop/Config.in b/package/iftop/Config.in
new file mode 100644
index 0000000..ddcc4c9
--- /dev/null
+++ b/package/iftop/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_IFTOP
+	bool "iftop"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
+	help
+	  iftop does for network usage what top(1) does for CPU usage.
+	  It listens to network traffic on a named interface and displays
+	  a table of current bandwidth usage by pairs of hosts. Handy for
+	  answering the question "why is our ADSL link so slow?".
+
+	  http://www.ex-parrot.com/pdw/iftop/
diff --git a/package/iftop/iftop.mk b/package/iftop/iftop.mk
new file mode 100644
index 0000000..3c8df9d
--- /dev/null
+++ b/package/iftop/iftop.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# iftop
+#
+#############################################################
+IFTOP_VERSION = 1.0pre2
+IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
+
+IFTOP_DEPENDENCIES = ncurses libpcap
+
+IFTOP_LICENSE = GPL
+IFTOP_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.12.1
