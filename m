From: Ilias Apalodimas <apalos@gmail.com>
Date: Tue,  7 Feb 2017 18:20:58 +0200
Subject: [Buildroot] [PATCH 1/1] Added keepalived package
In-Reply-To: <1486484458-8233-1-git-send-email-apalos@gmail.com>
References: <1486484458-8233-1-git-send-email-apalos@gmail.com>
Message-ID: <1486484458-8233-2-git-send-email-apalos@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
---
 package/Config.in                |  1 +
 package/keepalived/Config.in     | 13 +++++++++++++
 package/keepalived/keepalived.mk | 13 +++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/keepalived/Config.in
 create mode 100644 package/keepalived/keepalived.mk

diff --git a/package/Config.in b/package/Config.in
index 114a5ad..f0f1dec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1546,6 +1546,7 @@ menu "Networking applications"
 	source "package/irssi/Config.in"
 	source "package/iw/Config.in"
 	source "package/janus-gateway/Config.in"
+	source "package/keepalived/Config.in"
 	source "package/kismet/Config.in"
 	source "package/knock/Config.in"
 	source "package/leafnode2/Config.in"
diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
new file mode 100644
index 0000000..ee4ab7a
--- /dev/null
+++ b/package/keepalived/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_KEEPALIVED
+	bool "keepalived"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_POPT
+	help
+	  The main goal of the keepalived project is to add a strong & robust
+	  keepalive facility to the Linux Virtual Server project.
+	  It implements a multilayer TCP/IP stack checks. Keepalived implements
+	  a framework based on three family checks : Layer3, Layer4 & Layer5.
+	  This framework gives the daemon the ability of checking a LVS server
+	  pool states. Keepalived can be sumarize as a LVS driving daemon.
+
+	  http://www.keepalived.org/
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
new file mode 100644
index 0000000..4f8a6b2
--- /dev/null
+++ b/package/keepalived/keepalived.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# keepalived
+#
+################################################################################
+
+KEEPALIVED_VERSION = 1.3.2
+KEEPALIVED_SITE = http://www.keepalived.org/software
+KEEPALIVED_DEPENDENCIES = popt openssl
+KEEPALIVED_LICENSE = GPLv2+
+KEEPALIVED_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
