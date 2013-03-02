From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat,  2 Mar 2013 20:47:27 +0200
Subject: [Buildroot] [PATCH 1/1] Added lcms2 package
Message-ID: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Little CMS intends to be an OPEN SOURCE small-footprint color management engine, with special focus on accuracy and performance.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in       |    1 +
 package/lcms2/Config.in |   12 ++++++++++++
 package/lcms2/lcms2.mk  |   23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/lcms2/Config.in
 create mode 100644 package/lcms2/lcms2.mk

diff --git a/package/Config.in b/package/Config.in
index 8a02506..ce9c6be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -421,6 +421,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/lcms2/Config.in"
 source "package/libart/Config.in"
 source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
diff --git a/package/lcms2/Config.in b/package/lcms2/Config.in
new file mode 100644
index 0000000..d648d24
--- /dev/null
+++ b/package/lcms2/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LCMS2
+	bool "lcms2"
+	help
+	  Little Color Management Software
+	  Little CMS intends to be an OPEN SOURCE small-footprint color 
+	  management engine, with special focus on accuracy and performance. 
+	  It uses the International Color Consortium standard (ICC), which is
+	  the modern standard when regarding to color management.
+
+	  http://www.littlecms.com/
+
+
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
new file mode 100644
index 0000000..be14554
--- /dev/null
+++ b/package/lcms2/lcms2.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# lcms2-2.4.tar.gz
+#
+#############################################################
+LCMS2_VERSION = 2.4
+LCMS2_SITE = http://prdownloads.sourceforge.net/LCMS2/LCMS2/
+LCMS2_SOURCE = lcms2-$(LCMS2_VERSION).tar.gz
+LCMS2_INSTALL_STAGING = YES
+LCMS2_LIBTOOL_PATCH = YES 
+LCMS2_AUTORECONF = NO
+LCMS2_CONF_OPT =           
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+             LCMS2_CONF_OPT += --disable-shared 
+else
+             LCMS2_CONF_OPT += --enable-shared 
+endif
+
+LCMS2_DEPENDENCIES = host-lcms2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
