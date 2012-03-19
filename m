From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Mon, 19 Mar 2012 10:48:05 +0100
Subject: [Buildroot] [PATCH] vnstat: new package
Message-ID: <1332150485-22293-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>

Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
I think this could replace somehow ttcp in the near future. I've used
it sometimes with the help of netcat to stablish a TCP connection.
I am not sure I made this right, because vnstat doesn't use autotools,
so there is no ./configure to do. Please, check it out.
---
 package/Config.in        |    1 +
 package/vnstat/Config.in |    8 ++++++++
 package/vnstat/vnstat.mk |   15 +++++++++++++++
 3 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 package/vnstat/Config.in
 create mode 100644 package/vnstat/vnstat.mk

diff --git a/package/Config.in b/package/Config.in
index f0ce963..dcedcba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -517,6 +517,7 @@ source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
+source "package/vnstat/Config.in"
 source "package/vpnc/Config.in"
 source "package/vsftpd/Config.in"
 source "package/vtun/Config.in"
diff --git a/package/vnstat/Config.in b/package/vnstat/Config.in
new file mode 100644
index 0000000..79427ce
--- /dev/null
+++ b/package/vnstat/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_VNSTAT
+	bool "vnstat"
+	help
+	  vnStat is a console-based network traffic monitor that keeps a log
+	  of network traffic for the selected interface(s).  It uses the
+	  network interface statistics provided by the kernel as information
+	  source.  This means that vnStat won't actually be sniffing any
+	  traffic and also ensures light use of system resources.
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
new file mode 100644
index 0000000..5ac070a
--- /dev/null
+++ b/package/vnstat/vnstat.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# vnstat
+#
+#############################################################
+http://humdi.net/vnstat/vnstat-1.11.tar.gz
+VNSTAT_VERSION = 1.11
+VNSTAT_SOURCE = vnstat-$(VNSTAT_VERSION).tar.gz
+VNSTAT_SITE = http://humdi.net/vnstat/
+
+define VNSTAT_CONFIGURE_CMDS
+	touch $@
+endef
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.1
