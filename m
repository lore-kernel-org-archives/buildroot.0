From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 22:21:15 +0100
Subject: [Buildroot] [git commit] boot/uboot: fix order of Config.in
 properties
Message-ID: <20190207080709.3711383C52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5de451e5986abbbbea4df5ec9f4d64f3d726b407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

boot/uboot/Config.in:185: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index cbbbd5f1a4..bd1b248e94 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -181,8 +181,8 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 
 choice
 	prompt "U-Boot ATF BL31 format"
-	depends on BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	default BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
+	depends on BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
 	bool "bl31.bin"
