From: Gary Bisson <bisson.gary@gmail.com>
Date: Sat, 31 May 2014 15:32:16 -0700
Subject: [Buildroot] [PATCH] sshpass: new package
Message-ID: <1401575536-18595-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/Config.in          |  1 +
 package/sshpass/Config.in  |  8 ++++++++
 package/sshpass/sshpass.mk | 12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/sshpass/Config.in
 create mode 100644 package/sshpass/sshpass.mk

diff --git a/package/Config.in b/package/Config.in
index a5a328e..67c094f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ source "package/spawn-fcgi/Config.in"
 source "package/spice/Config.in"
 source "package/spice-protocol/Config.in"
 source "package/squid/Config.in"
+source "package/sshpass/Config.in"
 source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
diff --git a/package/sshpass/Config.in b/package/sshpass/Config.in
new file mode 100644
index 0000000..aa5a16b
--- /dev/null
+++ b/package/sshpass/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SSHPASS
+	bool "sshpass"
+	help
+	  Sshpass is a tool for non-interactivly performing
+	  password authentication with SSH's so called
+	  "interactive keyboard password authentication".
+
+	  http://sshpass.sourceforge.net
diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
new file mode 100644
index 0000000..e851f41
--- /dev/null
+++ b/package/sshpass/sshpass.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# sshpass
+#
+################################################################################
+
+SSHPASS_VERSION = 1.05
+SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
+SSHPASS_LICENSE = GPLv2
+SSHPASS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.0.0.rc2
