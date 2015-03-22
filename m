From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 16:10:47 +0200
Subject: [Buildroot] [PATCH 6/8] package/qpdf: New package qpdf 5.1.2
In-Reply-To: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1427033449-20179-6-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in      |  1 +
 package/qpdf/Config.in | 16 ++++++++++++++++
 package/qpdf/qpdf.hash |  2 ++
 package/qpdf/qpdf.mk   | 14 ++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/qpdf/Config.in
 create mode 100644 package/qpdf/qpdf.hash
 create mode 100644 package/qpdf/qpdf.mk

diff --git a/package/Config.in b/package/Config.in
index e9f362d..c12a098 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1059,6 +1059,7 @@ menu "Miscellaneous"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/qpdf/Config.in"
 	source "package/qemu/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
new file mode 100644
index 0000000..3002c06
--- /dev/null
+++ b/package/qpdf/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QPDF
+	bool "qpdf"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PCRE
+	help
+	  QPDF is a command-line program that does structural, content-
+	  preserving transformations on PDF files. It could have been called
+	  something like pdf-to-pdf. It also provides many useful capabilities
+	  to developers of PDF-producing software or for people who just want
+	  to look at the innards of a PDF file to learn more about how they
+	  work.
+
+	  http://qpdf.sourceforge.net/
+
+comment "qpdf requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
new file mode 100644
index 0000000..c6c6ebe
--- /dev/null
+++ b/package/qpdf/qpdf.hash
@@ -0,0 +1,2 @@
+# Downloaded from http://sourceforge.net/projects/qpdf/files/qpdf/5.1.2/
+md5	0bd15ef5eea5f628951ab456c84e78ec  qpdf-5.1.2.tar.gz
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
new file mode 100644
index 0000000..d0fe679
--- /dev/null
+++ b/package/qpdf/qpdf.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# qpdf
+#
+#############################################################
+
+QPDF_VERSION = 5.1.2
+QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
+QPDF_INSTALL_STAGING = YES
+QPDF_DEPENDENCIES = pcre
+
+QPDF_CONF_OPTS = --without-random
+
+$(eval $(autotools-package))
-- 
1.9.1
