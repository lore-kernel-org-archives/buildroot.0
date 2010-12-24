From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Dec 2010 18:21:37 +0100
Subject: [Buildroot] [PATCH 1/1] u-boot: add support for version 2010.12
In-Reply-To: <cover.1293211282.git.thomas.petazzoni@free-electrons.com>
References: <cover.1293211282.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4104ad3430da978e9b76ab73c6caa9b5df1b5912.1293211282.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 86c656d..60aeb1a 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_09
+	default BR2_TARGET_UBOOT_2010_12
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2010_12
+	bool "2010.12"
+
 config BR2_TARGET_UBOOT_2010_09
 	bool "2010.09"
 
@@ -45,6 +48,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
-- 
1.7.0.4
