From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Oct 2018 17:36:17 +0100
Subject: [Buildroot] [git commit] libkcapi: disable documentation
Message-ID: <20181028163426.C95638323A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b3dea2c2a0434fae4824cfe3098b93e684979ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable db2pdf, db2ps and xmlto which are used for building PDF, PS, man
or html documentation

Fixes:
 - http://autobuild.buildroot.org/results/28df3b50d90bc53b965280b77224f89fe09ec2b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
