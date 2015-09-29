From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 21:48:47 +0300
Subject: [Buildroot] [PATCH] libbluray: explicitly enable optional enabled
	features
Message-ID: <3801bfc7a86c5b3dd7adb6e4a3c1f33003989bb4.1443552527.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libbluray/libbluray.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 2e9268ef29ac..e62ad4844c44 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -20,18 +20,21 @@ endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
+LIBBLURAY_CONF_OPTS += --with-freetype
 else
 LIBBLURAY_CONF_OPTS += --without-freetype
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBBLURAY_DEPENDENCIES += fontconfig
+LIBBLURAY_CONF_OPTS += --with-fontconfig
 else
 LIBBLURAY_CONF_OPTS += --without-fontconfig
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBBLURAY_DEPENDENCIES += libxml2
+LIBBLURAY_CONF_OPTS += --with-libxml2
 else
 LIBBLURAY_CONF_OPTS += --without-libxml2
 endif
-- 
2.5.3
