From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Tue, 22 Dec 2015 16:29:49 +0300
Subject: [Buildroot] [PATCH 1/2] Enabling mesa3d radeon driver for all
	architectures
In-Reply-To: <1450790990-28939-1-git-send-email-ltrimas@synopsys.com>
References: <1450790990-28939-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1450790990-28939-2-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa32 radeon driver doesn't depend on x86 and can be build for all architectures.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fdeb599..c2c4bf3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -109,7 +109,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
-- 
2.5.0
