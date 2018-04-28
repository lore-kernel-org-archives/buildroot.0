From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 17:52:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: add missing elfutils
 dependency with RadeonSI driver
In-Reply-To: <20180428155252.27526-1-romain.naour@gmail.com>
References: <20180428155252.27526-1-romain.naour@gmail.com>
Message-ID: <20180428155252.27526-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

RadeonSI needs LLVM support which require elfutils dependency.

Fixes:
checking for RADEON... yes
checking for AMDGPU... yes
configure: error: radeonsi requires libelf when using llvm

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Valentin Korenblit <valentin.korenblit@smile.fr>
Cc: Micha? Kalbarczyk <michal@gamecodehq.com>
---
 package/mesa3d/mesa3d.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2529c7d8e6..3aac0c19b8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -39,7 +39,8 @@ MESA3D_CONF_OPTS += \
 	--enable-llvm-shared-libs \
 	--enable-llvm
 # R600 needs libelf when Mesa3D is built with LLVM support
-ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600),)
+# RadeonSI needs libelf
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),)
 MESA3D_DEPENDENCIES += elfutils
 endif
 else
-- 
2.14.3
