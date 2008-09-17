From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 17 Sep 2008 14:59:59 +0200
Subject: [Buildroot] [RFC 1/1] libupnp: add package libupnp
Message-ID: <1221656399-25047-1-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds libupnp package to Buildroot. libupnp provides developers
with an API that are compliant with version 1.0 of the Universal Plug and
Play Device Architecture Specification.

http://pupnp.sourceforge.net/

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
If no objections I will commit this patch.


 package/Config.in          |    1 +
 package/libupnp/Config.in  |    9 +++++++++
 package/libupnp/libupnp.mk |   15 +++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libupnp/Config.in
 create mode 100644 package/libupnp/libupnp.mk

diff --git a/package/Config.in b/package/Config.in
index 40d61a5..dd50b26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,6 +169,7 @@ source "package/libcgicc/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
+source "package/libupnp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/lighttpd/Config.in"
 endif
diff --git a/package/libupnp/Config.in b/package/libupnp/Config.in
new file mode 100644
index 0000000..6b1a6cf
--- /dev/null
+++ b/package/libupnp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBUPNP
+	bool "libupnp"
+	help
+	  The portable SDK for UPnP(tm) Devices (libupnp) provides developers
+	  with an API and open source code for building control points,
+	  devices, and bridges that are compliant with Version 1.0 of the
+	  Universal Plug and Play Device Architecture Specification
+
+	  http://pupnp.sourceforge.net/
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
new file mode 100644
index 0000000..da91254
--- /dev/null
+++ b/package/libupnp/libupnp.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# libupnp
+#
+#############################################################
+LIBUPNP_VERSION:=1.6.6
+LIBUPNP_SOURCE:=libupnp-$(LIBUPNP_VERSION).tar.bz2
+LIBUPNP_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pupnp
+
+LIBUPNP_INSTALL_STAGING:=YES
+LIBUPNP_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+
+LIBUPNP_DEPENDENCIES:=uclibc
+
+$(eval $(call AUTOTARGETS,package,libupnp))
-- 
1.5.4.3
