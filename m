From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Wed, 23 Dec 2015 15:49:51 +0300
Subject: [Buildroot] [PATCH v2 1/2] Enabling mesa3d radeon driver for all
	architectures
In-Reply-To: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
References: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <1450874992-15627-2-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mesa32 radeon driver doesn't depend on x86 and can be built for all architectures.

Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 40af2ef..fcfd3c3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -122,7 +122,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	bool "DRI radeon driver"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
-- 
2.5.0
