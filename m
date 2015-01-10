From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jan 2015 15:25:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/gd: Add explicit support for tiff
Message-ID: <1420899924-20218-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ensures reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gd/gd.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 868b45e..d7a6512 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -52,6 +52,13 @@ else
 GD_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF),y)
+GD_DEPENDENCIES += tiff
+GD_CONF_OPTS += --with-tiff
+else
+GD_CONF_OPTS += --without-tiff
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 GD_DEPENDENCIES += xlib_libXpm
 GD_CONF_OPTS += --with-xpm
-- 
1.7.10.4
