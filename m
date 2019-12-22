From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Dec 2019 11:49:28 +0100
Subject: [Buildroot] [PATCH 1/2] package/qpdf: bump to version 9.1.0
Message-ID: <20191222104929.2197066-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add host-pkgconf dependency as it is used since version 9.0.0 and
  https://github.com/qpdf/qpdf/commit/12400475283f5081ea55f52a764e43f14032f6ba
- C++11 is mandatory since version 9.1.0 and
  https://github.com/qpdf/qpdf/commit/653ce3550d18a07194a4c3bb9b4a3d260ed842cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qpdf/Config.in | 6 ++++--
 package/qpdf/qpdf.hash | 4 ++--
 package/qpdf/qpdf.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 3a4fa6072c..7550e1547a 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	help
@@ -13,5 +14,6 @@ config BR2_PACKAGE_QPDF
 
 	  http://qpdf.sourceforge.net/
 
-comment "qpdf needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "qpdf needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/qpdf/qpdf.hash b/package/qpdf/qpdf.hash
index 0ab4e0af4e..48b8c77f1e 100644
--- a/package/qpdf/qpdf.hash
+++ b/package/qpdf/qpdf.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/qpdf/files/qpdf/8.4.0/qpdf-8.4.0.sha512/download
-sha512	13225c6285311e8fe89970971b082b9613e70d474ee71dd5572f1ae268234d366c2c9c7bf427c4758a746a1a27ecc0127d31044ab501dbc08885c8aa0a514028  qpdf-8.4.0.tar.gz
+# From https://sourceforge.net/projects/qpdf/files/qpdf/9.1.0/qpdf-9.1.0.sha512/download
+sha512	7561ffc366dbce9df58cc85ff18480b28b0d46de04733ba463139188bee95690f92cf0960a328619f0c9f34ce865598db490fa1c6aaa76ee87d2c034a5f7f57e  qpdf-9.1.0.tar.gz
 # Locally computed:
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
 sha256  fb929ac30decb4dc3a2eea2bec6c43296a797c5d2d602deb3784ee39430583d5  Artistic-2.0
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 7dfc7acd70..217bff8055 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-QPDF_VERSION = 8.4.0
+QPDF_VERSION = 9.1.0
 QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
-QPDF_DEPENDENCIES = zlib jpeg
+QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
 
-- 
2.24.0
