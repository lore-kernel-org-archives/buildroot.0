From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 13:57:36 +0100
Subject: [Buildroot] [git commit] package/qpdf: remove pcre dependency
Message-ID: <20191208124911.BF079887C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84a7e647aecad74a00af75637bc11181bce467bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pcre is not needed since version 7.0.0 and
https://github.com/qpdf/qpdf/commit/9a96e233b051b31289c84f90a321583887b1400a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qpdf/Config.in | 1 -
 package/qpdf/qpdf.mk   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/qpdf/Config.in b/package/qpdf/Config.in
index 87a3192c5e..3a4fa6072c 100644
--- a/package/qpdf/Config.in
+++ b/package/qpdf/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_QPDF
 	bool "qpdf"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
 	help
diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 728ecc9289..7dfc7acd70 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -9,7 +9,7 @@ QPDF_SITE = http://downloads.sourceforge.net/project/qpdf/qpdf/$(QPDF_VERSION)
 QPDF_INSTALL_STAGING = YES
 QPDF_LICENSE = Apache-2.0 or Artistic-2.0
 QPDF_LICENSE_FILES = LICENSE.txt Artistic-2.0
-QPDF_DEPENDENCIES = pcre zlib jpeg
+QPDF_DEPENDENCIES = zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
 
