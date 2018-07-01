From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Jul 2018 14:52:57 +0200
Subject: [Buildroot] [PATCH 1/1] libucl: add optional libcurl dependency
Message-ID: <20180701125257.4995-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
