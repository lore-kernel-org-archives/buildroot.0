From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:17:16 +0100
Subject: [Buildroot] [PATCH 5/5] package/libraw: add optional support for
	lcms2
In-Reply-To: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454170636-9427-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libraw/libraw.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 5ebc4a2..e261e2b 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -12,7 +12,6 @@ LIBRAW_INSTALL_STAGING = YES
 LIBRAW_AUTORECONF = YES
 LIBRAW_CONF_OPTS += \
 	--disable-examples \
-	--disable-lcms \
 	--disable-openmp \
 	--disable-demosaic-pack-gpl2 \
 	--disable-demosaic-pack-gpl3
@@ -33,4 +32,11 @@ else
 LIBRAW_CONF_OPTS += --disable-jpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+LIBRAW_CONF_OPTS += --enable-lcms
+LIBRAW_DEPENDENCIES += lcms2
+else
+LIBRAW_CONF_OPTS += --disable-lcms
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0.rc3
