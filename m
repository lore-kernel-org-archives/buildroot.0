From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:25:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/lame: set LAME_CPE_ID_VALID
Message-ID: <20210304112521.1225954-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:lame_project:lame is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alame_project%3Alame

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lame/lame.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 3d76ab93ac..206e4407c9 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -12,6 +12,7 @@ LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPTS = --enable-dynamic-frontends
 LAME_LICENSE = LGPL-2.0+
 LAME_LICENSE_FILES = COPYING
+LAME_CPE_ID_VALID = YES
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
-- 
2.30.0
