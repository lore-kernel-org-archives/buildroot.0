From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jul 2016 23:16:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix udev dependency check
Message-ID: <1468098963-17126-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the typo ;)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9cce0ef..dcd43d5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -38,7 +38,7 @@ MESA3D_DEPENDENCIES += libgcrypt
 MESA3D_CONF_OPTS += --with-sha1=libgcrypt
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 MESA3D_DEPENDENCIES += udev
 MESA3D_CONF_OPTS += --disable-sysfs
 else
-- 
2.8.1
