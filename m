From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:15:17 +0200
Subject: [Buildroot] [git commit] qpdf: add missing dependency on jpeg
Message-ID: <20171021080858.B9E2A80FFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b44c23089308cd6394858c924c34c411fb361e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  configure: WARNING: unable to find required header jpeglib.h
  configure: WARNING: unable to find required library jpeg
  configure: error: some required prerequisites were not found

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qpdf/Config.in | 1 +
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index e8ab9ba..0b29b6f 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_QPDF
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
 	help
 	  QPDF is a command-line program that does structural, content-
 	  preserving transformations on PDF files. It could have been called
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 5b77540..27e4d09 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,7 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
 QPDF_LICENSE_FILES = Artistic-2.0
-QPDF_DEPENDENCIES = pcre zlib
+QPDF_DEPENDENCIES = pcre zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
 
