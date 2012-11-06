From: Gregory Hermant <gregory.hermant@calao-systems.com>
Date: Tue,  6 Nov 2012 10:05:28 +0100
Subject: [Buildroot] [PATCH v2] package: add linknx
In-Reply-To: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <1352192728-4816-3-git-send-email-gregory.hermant@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
---
 package/Config.in        |    1 +
 package/linknx/Config.in |    8 ++++++++
 package/linknx/linknx.mk |   18 ++++++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/linknx/Config.in
 create mode 100644 package/linknx/linknx.mk

diff --git a/package/Config.in b/package/Config.in
index 1a545ef..36803bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -590,6 +590,7 @@ source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
 source "package/lighttpd/Config.in"
+source "package/linknx/Config.in"
 source "package/links/Config.in"
 source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
diff --git a/package/linknx/Config.in b/package/linknx/Config.in
new file mode 100644
index 0000000..db54171
--- /dev/null
+++ b/package/linknx/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LINKNX
+	bool "linknx"
+	select BR2_PACKAGE_LIBPTHSEM
+	help
+	  Linknx is an automation platform providing high level functionalities
+	  to EIB/KNX installation.
+	  
+	  http://linknx.sourceforge.net/
diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
new file mode 100644
index 0000000..8e38c21
--- /dev/null
+++ b/package/linknx/linknx.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# linknx
+#
+#############################################################
+
+LINKNX_VERSION = 0.0.1.30
+LINKNX_SOURCE = linknx-${LINKNX_VERSION}.tar.gz
+LINKNX_SITE = http://downloads.sourceforge.net/project/linknx/linknx/linknx-${LINKNX_VERSION}
+LINKNX_LICENSE = GPLv2+
+LINKNX_LICENSE_FILES = COPYING
+LINKNX_INSTALL_STAGING = YES
+LINKNX_CONF_OPT = --without-lua --without-log4cpp --without-pth-test \
+		  --with-pth=$(STAGING_DIR)/usr
+
+LINKNX_DEPENDENCIES = libpthsem
+
+$(eval $(autotools-package))
-- 
1.7.9.5
