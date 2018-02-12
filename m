From: Audrey Motheron <audrey.motheron@gmail.com>
Date: Mon, 12 Feb 2018 22:59:31 +0100
Subject: [Buildroot] [PATCH] package/mesa-demo: remove duplicate osmesa
 option
Message-ID: <20180212215931.6105-1-audrey.motheron@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-osmesa option is unconditionally added to CONF_OPTS
even if --enable-osmesa is used latter.

Signed-off-by: Audrey Motheron <audrey.motheron@gmail.com>
---
 package/mesa3d-demos/mesa3d-demos.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index cbc15c3b69..9182803748 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -12,7 +12,6 @@ MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
 MESA3D_DEMOS_LICENSE = MIT
 
 MESA3D_DEMOS_CONF_OPTS += \
-	--disable-osmesa \
 	--disable-gles1
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
-- 
2.14.3
