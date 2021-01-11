From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Jan 2021 23:43:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: add BINUTILS_CPE_ID_VENDOR
Message-ID: <20210111224329.1419555-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:binutils is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Abinutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index d978b424be..aff7f4ba86 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -35,6 +35,7 @@ BINUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 BINUTILS_MAKE_OPTS = LIBS=$(TARGET_NLS_LIBS)
 BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
+BINUTILS_CPE_ID_VENDOR = gnu
 
 ifeq ($(BINUTILS_FROM_GIT),y)
 BINUTILS_DEPENDENCIES += host-flex host-bison
-- 
2.29.2
