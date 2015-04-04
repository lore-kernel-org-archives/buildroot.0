From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:59:42 +0200
Subject: [Buildroot] [git commit] package/qpdf: New package qpdf 5.1.2
Message-ID: <20150404100040.ABCA181900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02ab0bdc5815a3910760d9c95007e55b1c62f8fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - adjust length of comment header in .mk file.
  - fix comment in Config.in to match what's specific in the Buildroot
    manual.
  - fix <pkg>_LICENSE to 'Artistic-2.0'.]

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in      |    1 +
 package/qpdf/Config.in |   17 +++++++++++++++++
 package/qpdf/qpdf.hash |    2 ++
 package/qpdf/qpdf.mk   |   16 ++++++++++++++++
 4 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3f670f3..89bed0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1077,6 +1077,7 @@ menu "Miscellaneous"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
+	source "package/qpdf/Config.in"
 	source "package/qemu/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
new file mode 100644
index 0000000..e8ab9ba
--- /dev/null
+++ b/package/qpdf/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_QPDF
+	bool "qpdf"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
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
+comment "qpdf needs a toolchain w/ C++"
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
index 0000000..bfd533c
--- /dev/null
+++ b/package/qpdf/qpdf.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# qpdf
+#
+################################################################################
+
+QPDF_VERSION = 5.1.2
+QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
+QPDF_INSTALL_STAGING = YES
+QPDF_LICENSE = Artistic-2.0
+QPDF_LICENSE_FILES = Artistic-2.0
+QPDF_DEPENDENCIES = pcre zlib
+
+QPDF_CONF_OPTS = --without-random
+
+$(eval $(autotools-package))
