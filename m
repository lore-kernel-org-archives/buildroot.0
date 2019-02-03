From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  3 Feb 2019 23:39:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgeotiff: add optional proj
 dependency
Message-ID: <20190203223928.23536-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgeotiff/libgeotiff.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 522802cc94..a4606bc30c 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -26,4 +26,11 @@ else
 LIBGEOTIFF_CONF_OPTS += --without-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_PROJ),y)
+LIBGEOTIFF_DEPENDENCIES += proj
+LIBGEOTIFF_CONF_OPTS += --with-proj=$(STAGING_DIR)/usr
+else
+LIBGEOTIFF_CONF_OPTS += --without-proj
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
