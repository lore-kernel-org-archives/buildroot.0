From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:17:15 +0100
Subject: [Buildroot] [PATCH 4/5] package/libraw: add optional support for
	jpeg
In-Reply-To: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454170636-9427-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libraw/libraw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 106c52c..5ebc4a2 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -26,4 +26,11 @@ else
 LIBRAW_CONF_OPTS += --disable-jasper
 endif
 
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBRAW_CONF_OPTS += --enable-jpeg
+LIBRAW_DEPENDENCIES += jpeg
+else
+LIBRAW_CONF_OPTS += --disable-jpeg
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0.rc3
