From: Xavier Roumegue <xroumegue@gmail.com>
Date: Wed, 25 Nov 2020 19:30:12 +0100
Subject: [Buildroot] [PATCH v4 3/8] package/freescale-imx/firmware-imx: Copy
 of all DDR files if uboot needs fw.
In-Reply-To: <20201109142309.1135596-2-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
Message-ID: <20201125183017.15585-4-xroumegue@gmail.com>
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
index 09ccacb0c1..c704d78637 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -83,6 +83,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_DMEM_LEN
 
 config BR2_PACKAGE_FIRMWARE_IMX_DDR_FW_MULTIPLE
 	bool
+	default y if BR2_TARGET_UBOOT_NEEDS_FW
 
 endif # BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
-- 
2.29.2
