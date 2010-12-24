From: heiko at zuerker.org <heiko@zuerker.org>
Date: Thu, 23 Dec 2010 19:26:21 -0600
Subject: [Buildroot] [PATCH] add libnet 1.1.5
Message-ID: <7c61f61e277949a18b471ee5297d03062ced6083.1293153003.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in        |    1 +
 package/libnet/Config.in |    4 ++++
 package/libnet/libnet.mk |   12 ++++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/libnet/Config.in
 create mode 100644 package/libnet/libnet.mk

diff --git a/package/Config.in b/package/Config.in
index d3ae75e..6e7970b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -308,6 +308,7 @@ source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
 source "package/libnl/Config.in"
+source "package/libnet/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
 source "package/librsync/Config.in"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
new file mode 100644
index 0000000..3e5bc27
--- /dev/null
+++ b/package/libnet/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_LIBNET
+    bool "libnet"
+    help
+      libnet provides a portable framework for low-level network packet construction.
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
new file mode 100644
index 0000000..57c7c30
--- /dev/null
+++ b/package/libnet/libnet.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# LIBNET
+#
+#############################################################
+
+LIBNET_VERSION = 1.1.5
+LIBNET_SOURCE = libnet-$(LIBNET_VERSION).tar.gz
+LIBNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libnet-dev
+LIBNET_INSTALL_STAGING=YES
+
+$(eval $(call AUTOTARGETS,package,libnet))
-- 
1.7.3.2
