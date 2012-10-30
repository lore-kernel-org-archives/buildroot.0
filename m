From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue, 30 Oct 2012 13:24:03 +0100
Subject: [Buildroot] [PATCH] package: add knxweb
In-Reply-To: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1351599843-24291-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1351599843-24291-4-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in        |    1 +
 package/knxweb/Config.in |    6 ++++++
 package/knxweb/knxweb.mk |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/knxweb/Config.in
 create mode 100644 package/knxweb/knxweb.mk

diff --git a/package/Config.in b/package/Config.in
index 3dd169f..2a99882 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
+source "package/knxweb/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
diff --git a/package/knxweb/Config.in b/package/knxweb/Config.in
new file mode 100644
index 0000000..088e6e1
--- /dev/null
+++ b/package/knxweb/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KNXWEB
+	bool "knxweb"
+	help
+	  KnxWeb is a graphical visualization interface for Linknx.
+
+	  http://belnet.dl.sourceforge.net/sourceforge/linknx/
diff --git a/package/knxweb/knxweb.mk b/package/knxweb/knxweb.mk
new file mode 100644
index 0000000..5ca1760
--- /dev/null
+++ b/package/knxweb/knxweb.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# knxweb
+#
+#############################################################
+
+KNXWEB_VERSION = 0.6.1
+KNXWEB_SOURCE = knxweb-$(KNXWEB_VERSION).tar.gz
+KNXWEB_SITE = http://sourceforge.net/projects/linknx/files/knxweb/knxweb-0.6.1/
+
+define KNXWEB_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/var/www
+	cp -rdpf $(@D)/* $(TARGET_DIR)/var/www
+endef
+
+define KNXWEB__UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/var/www/
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
