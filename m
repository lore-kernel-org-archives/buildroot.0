From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 08:51:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pptp-linux
Message-ID: <20070822155100.ECE4FA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 08:51:00 -0700 (Wed, 22 Aug 2007)
New Revision: 19648

Log:
- add pptp-linux


Added:
   trunk/buildroot/package/pptp-linux/
   trunk/buildroot/package/pptp-linux/Config.in
   trunk/buildroot/package/pptp-linux/pptp-linux.mk


Changeset:
Added: trunk/buildroot/package/pptp-linux/Config.in
===================================================================
--- trunk/buildroot/package/pptp-linux/Config.in	                        (rev 0)
+++ trunk/buildroot/package/pptp-linux/Config.in	2007-08-22 15:51:00 UTC (rev 19648)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PPTP_LINUX
+	bool "pptp-linux"
+	default n
+	help
+	  An implementation of the Point-to-point protocol client.
+
+	  http://pptpclient.sourceforge.net/

Added: trunk/buildroot/package/pptp-linux/pptp-linux.mk
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux.mk	                        (rev 0)
+++ trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-08-22 15:51:00 UTC (rev 19648)
@@ -0,0 +1,12 @@
+################################################################################
+#
+# a PPTP client
+#
+################################################################################
+
+PPTP_LINUX_VERSION=1.7.0
+PPTP_LINUX_SOURCE=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
+PPTP_LINUX_PATCH=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
+PPTP_LINUX_SITE=http://ftp.debian.org/debian/pool/main/p/pptp-linux/
+
+$(eval $(call AUTOTARGETS,pptp-linux))
