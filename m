From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sat, 18 Nov 2017 10:28:47 +0100
Subject: [Buildroot] [PATCH v4 1/3] uboot: Use BR2_TARGET_UBOOT_SPL_NAME for
 TPL name
Message-ID: <1510997329-4111-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since BR2_TARGET_UBOOT_SPL_NAME can accept list of binaries,
the same config can reuse for TPL binary name as well.
So update the string and help text to indicate the same
config use for SPL and TPL.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- Use BR2_TARGET_UBOOT_SPL_NAME for adding tpl binary
Changes for v3, v2:
- None

 boot/uboot/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8215912..70e2bfd 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -334,13 +334,14 @@ config BR2_TARGET_UBOOT_SPL
 	  into DDR.
 
 config BR2_TARGET_UBOOT_SPL_NAME
-	string "U-Boot SPL binary image name"
+	string "U-Boot SPL/TPL binary image name(s)"
 	default "spl/u-boot-spl.bin"
 	depends on BR2_TARGET_UBOOT_SPL
 	help
-	  A space-separated list of SPL binaries, generated during
-	  u-boot build. For most platform it is spl/u-boot-spl.bin but
-	  not always. It is MLO on OMAP and SPL on i.MX6 for example.
+	  A space-separated list of SPL/TPL binaries, generated during
+	  u-boot build. For most platform SPL name is spl/u-boot-spl.bin
+	  and TPL name is tpl/u-boot-tpl.bin but not always. SPL name is
+	  MLO on OMAP and SPL on i.MX6 for example.
 
 config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	bool "Generate image for Xilinx Zynq"
-- 
1.9.1
