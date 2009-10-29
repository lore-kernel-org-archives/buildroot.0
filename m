From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 21:17:21 +0100
Subject: [Buildroot] [git commit master]
	target/device/Atmel/arch-arm/u-boot: Fix u-boot patch dependencies
Message-ID: <20091029201958.5B7F277667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1ea44bb11a73955b559cc5d4cd61e89bfebd21fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure that the 2009.01 u-boot patches can only be enabled for 2009.01 builds.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/Atmel/arch-arm/u-boot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/device/Atmel/arch-arm/u-boot/Config.in b/target/device/Atmel/arch-arm/u-boot/Config.in
index 16f900d..6d32e78 100644
--- a/target/device/Atmel/arch-arm/u-boot/Config.in
+++ b/target/device/Atmel/arch-arm/u-boot/Config.in
@@ -7,6 +7,7 @@ choice
 config	BR2_TARGET_U_BOOT_2009_01_ARCH_AT91
 	bool "AT91 patches for u-boot-2009.01"
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	depends on BR2_TARGET_UBOOT_2009_01
 	help
 	  Apply the at91 u-boot-2009.01 patches
 
-- 
1.6.3.3
