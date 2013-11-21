From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Nov 2013 12:47:39 -0300
Subject: [Buildroot] [PATCH] fping: new package
Message-ID: <1385048859-32594-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in       |  1 +
 package/fping/Config.in |  8 ++++++++
 package/fping/fping.mk  | 12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/fping/Config.in
 create mode 100644 package/fping/fping.mk

diff --git a/package/Config.in b/package/Config.in
index de4e966..e2ca8ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -793,6 +793,7 @@ source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/foomatic-filters/Config.in"
+source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
 source "package/gutenprint/Config.in"
 source "package/heirloom-mailx/Config.in"
diff --git a/package/fping/Config.in b/package/fping/Config.in
new file mode 100644
index 0000000..686102a
--- /dev/null
+++ b/package/fping/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FPING
+	bool "fping"
+	help
+	  fping is a program to send ICMP echo probes to network hosts,
+	  similar to ping, but much better performing when pinging
+	  multiple hosts.
+
+	  http://fping.org/
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
new file mode 100644
index 0000000..580920e
--- /dev/null
+++ b/package/fping/fping.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# fping
+#
+################################################################################
+
+FPING_VERSION = 3.8
+FPING_SITE = http://fping.org/dist
+FPING_LICENSE = BSD-like
+FPING_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.8.3.2
