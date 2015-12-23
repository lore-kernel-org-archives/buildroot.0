From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:01:14 +0100
Subject: [Buildroot] [git commit] Enabling mesa3d radeon driver for all
	architectures
Message-ID: <20151223220119.2ED4880440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=206527394b7cffcc812ff607a4630c2cc7d0084d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mesa32 radeon driver doesn't depend on x86 and can be built for all architectures.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd6a8c6..04167c3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -123,7 +123,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
