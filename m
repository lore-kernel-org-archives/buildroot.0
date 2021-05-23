From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 23:03:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmspack: add CPE variables
Message-ID: <20210523210302.1532313-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:kyzer:libmspack is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kyzer:libmspack

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmspack/libmspack.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libmspack/libmspack.mk b/package/libmspack/libmspack.mk
index e9fdc3ca8d..f806192eec 100644
--- a/package/libmspack/libmspack.mk
+++ b/package/libmspack/libmspack.mk
@@ -4,10 +4,15 @@
 #
 ################################################################################
 
-LIBMSPACK_VERSION = 0.10.1alpha
+LIBMSPACK_VERSION_MAJOR = 0.10.1
+LIBMSPACK_VERSION_MINOR = alpha
+LIBMSPACK_VERSION = $(LIBMSPACK_VERSION_MAJOR)$(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_SITE = https://www.cabextract.org.uk/libmspack
 LIBMSPACK_LICENSE = LGPL-2.1
 LIBMSPACK_LICENSE_FILES = COPYING.LIB
+LIBMSPACK_CPE_ID_VENDOR = kyzer
+LIBMSPACK_CPE_ID_VERSION = $(LIBMSPACK_VERSION_MAJOR)
+LIBMSPACK_CPE_ID_UPDATE = $(LIBMSPACK_VERSION_MINOR)
 LIBMSPACK_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
2.30.2
