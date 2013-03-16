From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sat, 16 Mar 2013 14:12:01 +0200
Subject: [Buildroot] [PATCHv3] Added lcms2 package
In-Reply-To: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
References: <1362250047-26425-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1363435922-23115-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Little CMS intends to be an OPEN SOURCE small-footprint color management engine,
with special focus on accuracy and performance.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
Changelog:
	Removed excess empty lines from Config.in
	Added licensing info to lcms2.mk

 package/Config.in       |    1 +
 package/lcms2/Config.in |   11 +++++++++++
 package/lcms2/lcms2.mk  |   14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/lcms2/Config.in
 create mode 100644 package/lcms2/lcms2.mk

diff --git a/package/Config.in b/package/Config.in
index 21c3ec9..4cf71d6 100644
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
index 0000000..33999fa
--- /dev/null
+++ b/package/lcms2/Config.in
@@ -0,0 +1,11 @@
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
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
new file mode 100644
index 0000000..89ba03f
--- /dev/null
+++ b/package/lcms2/lcms2.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# lcms2
+#
+#############################################################
+
+LCMS2_VERSION = 2.4
+LCMS2_SITE = http://downloads.sourceforge.net/LCMS2/LCMS2/
+LCMS2_LICENSE = MIT
+LCMS2_LICENSE_FILES = COPYING
+LCMS2_DEPENDENCIES = host-lcms2
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
