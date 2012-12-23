From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 02:20:29 +0200
Subject: [Buildroot] [PATCH] new package: proxychains
Message-ID: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                  |    1 +
 package/proxychains/Config.in      |    7 +++++++
 package/proxychains/proxychains.mk |   10 ++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/proxychains/Config.in
 create mode 100644 package/proxychains/proxychains.mk

diff --git a/package/Config.in b/package/Config.in
index 562bfda..47a281e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,6 +656,7 @@ source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
+source "package/proxychains/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
diff --git a/package/proxychains/Config.in b/package/proxychains/Config.in
new file mode 100644
index 0000000..332aa3b
--- /dev/null
+++ b/package/proxychains/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROXYCHAINS
+	bool "proxychains"
+	help
+	  force any tcp connections to flow through a proxy (or proxy chain)
+
+	  http://proxychains.sourceforge.net
+
diff --git a/package/proxychains/proxychains.mk b/package/proxychains/proxychains.mk
new file mode 100644
index 0000000..7c4500d
--- /dev/null
+++ b/package/proxychains/proxychains.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# ProxyChains
+#
+#############################################################
+PROXYCHAINS_VERSION = 3.1
+PROXYCHAINS_SOURCE = proxychains-$(PROXYCHAINS_VERSION).tar.gz
+PROXYCHAINS_SITE = http://downloads.sourceforge.net/project/proxychains/proxychains/version%20$(PROXYCHAINS_VERSION)
+
+$(eval $(autotools-package))
-- 
1.7.7.6
