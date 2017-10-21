From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 19:14:20 +0300
Subject: [Buildroot] [PATCH] uboot: Make Kconfig a default build system
Message-ID: <1508602460-4807-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Given now default U-Boot version is 2017.09 and it requires
Kconfig build system it makes perfect sense to have default
build system which matches U-Boot version requirements.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8215912339ba..2d3f189a548a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -6,7 +6,7 @@ config BR2_TARGET_UBOOT
 if BR2_TARGET_UBOOT
 choice
 	prompt "Build system"
-	default BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
+	default BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 
 config BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 	bool "Legacy"
-- 
2.7.5
