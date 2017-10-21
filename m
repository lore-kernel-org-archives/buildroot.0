From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 23:49:10 +0300
Subject: [Buildroot] [PATCH 1/2] mesa3d: Make Etnaviv arch-independent
In-Reply-To: <1508618951-24632-1-git-send-email-abrodkin@synopsys.com>
References: <1508618951-24632-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1508618951-24632-2-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivante GPU could be a part of SoC along with any CPU architecture
thus get rid of nonsense dependency.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd5d0d4385ab..9249b1d71a15 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -56,7 +56,6 @@ comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
-	depends on BR2_arm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
-- 
2.7.5
