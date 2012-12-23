From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Dec 2012 21:57:45 +0100
Subject: [Buildroot] [git commit] new package: proxychains
Message-ID: <20121223211707.3E49E9A43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f70f5caea8a8e229a5adad948b32fe4e3c88289
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/proxychains/Config.in      |    7 +++++++
 package/proxychains/proxychains.mk |   10 ++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 66445ff..3d556b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -654,6 +654,7 @@ source "package/portmap/Config.in"
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
