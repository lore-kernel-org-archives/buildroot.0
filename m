From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 19 Oct 2017 10:56:35 +0200
Subject: [Buildroot] [PATCH 1/1] qpdf: Fix dependency on JPEG
Message-ID: <20171019085635.8726-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Solves http://autobuild.buildroot.net/results/1abd0814de200abd6bad42675405a686cac4eb58

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/qpdf/Config.in | 1 +
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index e8ab9ba969..0b29b6f827 100644
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
index 5b775401a6..27e4d09978 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,7 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Artistic-2.0
 QPDF_LICENSE_FILES = Artistic-2.0
-QPDF_DEPENDENCIES = pcre zlib
+QPDF_DEPENDENCIES = pcre zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
 
-- 
2.11.0
