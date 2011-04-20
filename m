From: fabien.marteau at armadeus.com <fabien.marteau@armadeus.com>
Date: Wed, 20 Apr 2011 11:18:59 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
	ngircd
Message-ID: <1303291139-3117-1-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabien Marteau <fabien.marteau@armadeus.com>


Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
---
 package/Config.in        |    1 +
 package/ngircd/Config.in |    7 +++++++
 package/ngircd/ngircd.mk |   18 ++++++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
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
index 0000000..e8fc3d0
--- /dev/null
+++ b/package/ngircd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NGIRCD
+	bool "ngircd"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Next Generation IRC server deamon.
+
+	  http://ngircd.barton.de
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
new file mode 100644
index 0000000..5e4c30b
--- /dev/null
+++ b/package/ngircd/ngircd.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# ngIRCd: Next Generation IRC Daemon
+#
+#############################################################
+NGIRCD_VERSION = 17.1
+NGIRCD_SITE = ftp://ftp.berlios.de/pub/ngircd/
+NGIRCD_DEPENDENCIES = zlib
+
+define NGIRCD_SUPPRESS_DOCUMENTATION
+	rm -rf $(TARGET_DIR)/usr/share/doc/ngircd
+	rm -rf $(TARGET_DIR)/usr/share/man/man5/arm-linux-ngircd.conf.5
+	rm -rf $(TARGET_DIR)/usr/share/man/man8/arm-linux-ngircd.8
+endef
+
+NGIRCD_POST_INSTALL_TARGET_HOOKS+=NGIRCD_SUPPRESS_DOCUMENTATION
+
+$(eval $(call AUTOTARGETS,package,ngircd))
-- 
1.7.0.4
