From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 14:57:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libv4l: fix udev configure options
Message-ID: <20170527125708.5971-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

AC_ARG_WITH([libudev] was removed in version 1.12.0:
https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=3aba7817cd1994e6da00651114368db8171eabcc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/libv4l.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 6bc9d85d5..7a5956c2d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -46,10 +46,7 @@ LIBV4L_DEPENDENCIES += libgl
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBV4L_CONF_OPTS += --with-libudev
 LIBV4L_DEPENDENCIES += udev
-else
-LIBV4L_CONF_OPTS += --without-libudev
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLU),y)
-- 
2.11.0
