From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:39:55 +0100
Subject: [Buildroot] [git commit] uboot: Use BR2_TARGET_UBOOT_SPL_NAME for
 TPL name
Message-ID: <20171201205334.8DDF07FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=357322107859d50230721604faca00940451c359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the BR2_TARGET_UBOOT_SPL_NAME option accepts a space-separated
list of binaries, the same option can be reuses for TPL binaries as
well. This commit updates the string and help text to indicate that
the same option can be used for SPL and TPL.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 14caafa..0e109d0 100644
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
