From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Jan 2021 22:59:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix gallium-xa configure
 option
Message-ID: <20210104215901.103994-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build warning:

output/build/mesa3d-20.3.2/meson.build:727: WARNING:
 gallium-xa option "false" deprecated, please use "disabled" instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5eca1f0906..a366eee4e9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -74,7 +74,7 @@ endif
 else
 MESA3D_CONF_OPTS += \
 	-Dglx=disabled \
-	-Dgallium-xa=false
+	-Dgallium-xa=disabled
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-- 
2.29.2
