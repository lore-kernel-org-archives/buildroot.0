From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 09:22:23 -0600
Subject: [Buildroot] [PATCH v3 1/3] add libnet 1.1.5 (required by syslog-ng)
Message-ID: <2b69360e32ed380ece014772502a6e5d3f1b6575.1293376253.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in        |    1 +
 package/libnet/Config.in |    6 ++++++
 package/libnet/libnet.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/libnet/Config.in
 create mode 100644 package/libnet/libnet.mk

diff --git a/package/Config.in b/package/Config.in
index 225d873..e8c2f70 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -306,6 +306,7 @@ source "package/libeXosip2/Config.in"
 source "package/libidn/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
+source "package/libnet/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
diff --git a/package/libnet/Config.in b/package/libnet/Config.in
new file mode 100644
index 0000000..5fc8c62
--- /dev/null
+++ b/package/libnet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBNET
+    bool "libnet"
+    help
+      libnet provides a portable framework for low-level network packet construction.
+
+      http://sourceforge.net/projects/libnet-dev
diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
new file mode 100644
index 0000000..aa623aa
--- /dev/null
+++ b/package/libnet/libnet.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# LIBNET
+#
+#############################################################
+
+LIBNET_VERSION = 1.1.5
+LIBNET_SOURCE = libnet-$(LIBNET_VERSION).tar.gz
+LIBNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libnet-dev
+LIBNET_INSTALL_STAGING = YES
+LIBNET_CONF_OPT = --program-prefix=
+
+$(eval $(call AUTOTARGETS,package,libnet))
-- 
1.7.3.2
