From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Mon,  9 Nov 2015 10:03:31 +0100
Subject: [Buildroot] [PATCH 1/2] libnet:new package
Message-ID: <1447059812-26424-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in        |  1 +
 package/libnet/Config.in |  7 +++++++
 package/libnet/libnet.mk | 13 +++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/libnet/Config.in
 create mode 100644 package/libnet/libnet.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..e0b42c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1019,6 +1019,7 @@ menu "Networking"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
 	source "package/libndp/Config.in"
+	source "package/libnet/Config.in"
 	source "package/libnetfilter_acct/Config.in"
 	source "package/libnetfilter_conntrack/Config.in"
 	source "package/libnetfilter_cthelper/Config.in"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
new file mode 100644
index 0000000..76ed9dd
--- /dev/null
+++ b/package/libnet/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNET
+	bool "libnet"
+	help
+	  libnet provides a portable framework for low-level network packet
+	  construction.
+
+	  http://sourceforge.net/projects/libnet-dev
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
new file mode 100644
index 0000000..d021f76
--- /dev/null
+++ b/package/libnet/libnet.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libnet
+#
+################################################################################
+
+LIBNET_VERSION = 1.1.6
+LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
+LIBNET_INSTALL_STAGING = YES
+LIBNET_LICENSE = BSD-2c
+LIBNET_LICENSE_FILES = doc/COPYING
+
+$(eval $(autotools-package))
-- 
1.8.3.1
