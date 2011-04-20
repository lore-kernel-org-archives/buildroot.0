From: fabien.marteau at armadeus.com <fabien.marteau@armadeus.com>
Date: Wed, 20 Apr 2011 09:21:54 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
	ngircd
Message-ID: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabien Marteau <fabien.marteau@armadeus.com>


Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
---
 package/Config.in        |    1 +
 package/ngircd/Config.in |    6 ++++++
 package/ngircd/ngircd.mk |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/ngircd/Config.in
 create mode 100644 package/ngircd/ngircd.mk

diff --git a/package/Config.in b/package/Config.in
index 014c2c0..cd49bc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -409,6 +409,7 @@ source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/nfs-utils/Config.in"
+source "package/ngircd/Config.in"
 source "package/ntp/Config.in"
 source "package/nuttcp/Config.in"
 source "package/olsr/Config.in"
diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
new file mode 100644
index 0000000..db13c41
--- /dev/null
+++ b/package/ngircd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NGIRCD
+	bool "ngircd"
+	help
+		Next Generation IRC server deamon.
+		http://ngircd.barton.de
+
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
new file mode 100644
index 0000000..0b70455
--- /dev/null
+++ b/package/ngircd/ngircd.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# ngIRCd: Next Generation IRC Daemon
+#
+#############################################################
+NGIRCD_VERSION = 17.1
+NGIRCD_SOURCE = ngircd-17.1.tar.gz
+NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_CONF_OPT =
+
+$(eval $(call AUTOTARGETS,package,ngircd))
-- 
1.7.0.4
