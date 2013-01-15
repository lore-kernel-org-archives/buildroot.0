From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 15 Jan 2013 23:49:49 +0200
Subject: [Buildroot] [PATCH] proxychains updated to proxychains-ng 4.4
Message-ID: <1358286589-9672-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                        |    2 +-
 package/proxychains-ng/Config.in         |    7 +++++++
 package/proxychains-ng/proxychains-ng.mk |   10 ++++++++++
 package/proxychains/Config.in            |    7 -------
 package/proxychains/proxychains.mk       |   10 ----------
 5 files changed, 18 insertions(+), 18 deletions(-)
 create mode 100644 package/proxychains-ng/Config.in
 create mode 100644 package/proxychains-ng/proxychains-ng.mk
 delete mode 100644 package/proxychains/Config.in
 delete mode 100644 package/proxychains/proxychains.mk

diff --git a/package/Config.in b/package/Config.in
index c59f342..ba03b3c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,7 +682,7 @@ source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
-source "package/proxychains/Config.in"
+source "package/proxychains-ng/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
diff --git a/package/proxychains-ng/Config.in b/package/proxychains-ng/Config.in
new file mode 100644
index 0000000..6fcebde
--- /dev/null
+++ b/package/proxychains-ng/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROXYCHAINS_NG
+	bool "proxychains-ng"
+	help
+	  force any tcp connections to flow through a proxy (or proxy chain)
+
+	  https://github.com/rofl0r/proxychains
+
diff --git a/package/proxychains-ng/proxychains-ng.mk b/package/proxychains-ng/proxychains-ng.mk
new file mode 100644
index 0000000..9cf24bf
--- /dev/null
+++ b/package/proxychains-ng/proxychains-ng.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# proxychains-ng
+#
+#############################################################
+PROXYCHAINS_NG_VERSION = 4.4
+PROXYCHAINS_NG_SOURCE = proxychains-$(PROXYCHAINS_NG_VERSION).tar.bz2
+PROXYCHAINS_NG_SITE = http://downloads.sourceforge.net/project/proxychains-ng
+
+$(eval $(autotools-package))
diff --git a/package/proxychains/Config.in b/package/proxychains/Config.in
deleted file mode 100644
index 332aa3b..0000000
--- a/package/proxychains/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PROXYCHAINS
-	bool "proxychains"
-	help
-	  force any tcp connections to flow through a proxy (or proxy chain)
-
-	  http://proxychains.sourceforge.net
-
diff --git a/package/proxychains/proxychains.mk b/package/proxychains/proxychains.mk
deleted file mode 100644
index 7c4500d..0000000
--- a/package/proxychains/proxychains.mk
+++ /dev/null
@@ -1,10 +0,0 @@
-#############################################################
-#
-# ProxyChains
-#
-#############################################################
-PROXYCHAINS_VERSION = 3.1
-PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.gz
-PROXYCHAINS_SITE = http://downloads.sourceforge.net/project/proxychains/proxychains/version%20$(PROXYCHAINS_VERSION)
-
-$(eval $(autotools-package))
-- 
1.7.7.6
