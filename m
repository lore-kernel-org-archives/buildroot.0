From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 28 Oct 2018 10:39:53 +0100
Subject: [Buildroot] [PATCH 1/1] libkcapi: disable documentation
Message-ID: <20181028093953.28938-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable db2pdf, db2ps and xmlto which are used for building PDF, PS, man
or html documentation

Fixes:
 - http://autobuild.buildroot.org/results/28df3b50d90bc53b965280b77224f89fe09ec2b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkcapi/libkcapi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 1557d2017a..9edf0394d4 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -11,6 +11,10 @@ LIBKCAPI_AUTORECONF = YES
 LIBKCAPI_INSTALL_STAGING = YES
 LIBKCAPI_LICENSE = BSD-3-Clause (library), BSD-3-Clause or GPL-2.0 (programs)
 LIBKCAPI_LICENSE_FILES = COPYING COPYING.gplv2 COPYING.bsd
+LIBKCAPI_CONF_ENV = \
+	ac_cv_path_DB2PDF="" \
+	ac_cv_path_DB2PS="" \
+	ac_cv_path_XMLTO=""
 
 ifeq ($(BR2_PACKAGE_LIBKCAPI_HASHER),y)
 LIBKCAPI_CONF_OPTS += --enable-kcapi-hasher
-- 
2.17.1
