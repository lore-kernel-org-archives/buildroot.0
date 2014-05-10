From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 12:02:15 +0200
Subject: [Buildroot] [PATCH v6 03/32] mesa3d: use --enable-shared-glapi also
	for Gallium drivers
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399716164-6452-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed since this upstream commit:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=0432aa064bf5d4d0ad8fc3c4d648b8feb238ddfa

Remove --disable-shared-glapi from the non-DRI-block, this
would break with enabled Gallium drivers.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f0dd364..b14364e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -63,13 +63,13 @@ MESA3D_CONF_OPT += \
 	--without-gallium-drivers
 else
 MESA3D_CONF_OPT += \
+	--enable-shared-glapi \
 	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y))
 endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
 	--disable-dri \
-	--disable-shared-glapi \
 	--without-dri-drivers
 else
 MESA3D_CONF_OPT += \
-- 
1.7.10.4
