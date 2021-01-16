From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 17:29:41 +0100
Subject: [Buildroot] [git commit] package/mesa3d: fix gallium-xa configure
 option
Message-ID: <20210116161204.2120786E3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a432c42db7602b72196c278f908889bda9ed3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build warning:

output/build/mesa3d-20.3.2/meson.build:727: WARNING:
 gallium-xa option "false" deprecated, please use "disabled" instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/mesa3d.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 682492d86f..ce1197cc99 100644
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
