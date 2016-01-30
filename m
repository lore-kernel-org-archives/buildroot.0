From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 17:17:14 +0100
Subject: [Buildroot] [PATCH 3/5] package/libraw: add optional support for
	jasper
In-Reply-To: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454170636-9427-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454170636-9427-3-git-send-email-bernd.kuhls@t-online.de>
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
index a4ab92f..106c52c 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -19,4 +19,11 @@ LIBRAW_CONF_OPTS += \
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 
+ifeq ($(BR2_PACKAGE_JASPER),y)
+LIBRAW_CONF_OPTS += --enable-jasper
+LIBRAW_DEPENDENCIES += jasper
+else
+LIBRAW_CONF_OPTS += --disable-jasper
+endif
+
 $(eval $(autotools-package))
-- 
2.7.0.rc3
