From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun,  3 Mar 2013 23:43:04 +0200
Subject: [Buildroot] [PATCHv2] Added lcms2 package
In-Reply-To: <20130303171102.20719854@skate>
References: <20130303171102.20719854@skate>
Message-ID: <1362346984-20701-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Little CMS intends to be an OPEN SOURCE small-footprint color management engine,
with special focus on accuracy and performance.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in       |    1 +
 package/lcms2/Config.in |   12 ++++++++++++
 package/lcms2/lcms2.mk  |   13 +++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/lcms2/Config.in
 create mode 100644 package/lcms2/lcms2.mk

diff --git a/package/Config.in b/package/Config.in
index 646dd68..b88afd0 100644
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
index 0000000..239fcac
--- /dev/null
+++ b/package/lcms2/lcms2.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# lcms2
+#
+#############################################################
+
+LCMS2_VERSION = 2.4
+LCMS2_SITE = http://downloads.sourceforge.net/LCMS2/LCMS2/
+
+LCMS2_DEPENDENCIES = host-lcms2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
