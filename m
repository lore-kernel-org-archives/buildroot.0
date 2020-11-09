From: Xavier Roumegue <xroumegue@gmail.com>
Date: Mon,  9 Nov 2020 15:23:04 +0100
Subject: [Buildroot] [PATCH v3 3/8] freescale-imx/firmware-imx: Copy of all
 DDR files if uboot needs fw.
In-Reply-To: <20201107135909.1265116-1-xroumegue@gmail.com>
References: <20201107135909.1265116-1-xroumegue@gmail.com>
Message-ID: <20201109142309.1135596-4-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
---
 package/freescale-imx/firmware-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 2ed6d4254d..69381e71b5 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -83,6 +83,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
 
 config BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE
     bool
+    default y if BR2_TARGET_UBOOT_NEEDS_FW
 
 endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
-- 
2.28.0
