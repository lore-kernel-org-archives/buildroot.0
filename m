From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Mar 2021 10:52:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/flac: set FLAC_CPE_ID_VALID
Message-ID: <20210305095202.1833360-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:flac_project:flac is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aflac_project%3Aflac

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flac/flac.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index f2922ffefc..15d4eefb37 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -11,6 +11,7 @@ FLAC_INSTALL_STAGING = YES
 FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
 FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
+FLAC_CPE_ID_VALID = YES
 
 # patch touching configure.ac
 FLAC_AUTORECONF = YES
-- 
2.30.0
