From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:58:45 +0200
Subject: [Buildroot] [git commit] libucl: add optional libcurl dependency
Message-ID: <20180701125627.B8103838E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f00e599ccd75161e23e9fc882817b02f904a95ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libucl/libucl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libucl/libucl.mk b/package/libucl/libucl.mk
index 087fea683d..9f0378ad9c 100644
--- a/package/libucl/libucl.mk
+++ b/package/libucl/libucl.mk
@@ -12,4 +12,11 @@ LIBUCL_LICENSE = BSD-2-Clause
 LIBUCL_LICENSE_FILES = COPYING
 LIBUCL_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBUCL_DEPENDENCIES += libcurl
+LIBUCL_CONF_OPTS += --enable-urls
+else
+LIBUCL_CONF_OPTS += --disable-urls
+endif
+
 $(eval $(autotools-package))
