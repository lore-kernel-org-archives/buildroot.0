From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:17 +0200
Subject: [Buildroot] [PATCH 05/35] u-boot: remove ancient versions
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0317d23e36901cf689a8e298a5b3d1513f50254d.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/Config.in |   26 --------------------------
 1 files changed, 0 insertions(+), 26 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 70d9eb8..8a49b37 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -27,26 +27,6 @@ config BR2_TARGET_UBOOT_2009_08
 	bool "u-boot-2009.08"
 	depends on BR2_DEPRECATED || BR2_RECENT
 
-config BR2_TARGET_UBOOT_2009_06
-	bool "u-boot-2009.06"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_2009_03
-	bool "u-boot-2009.03"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_2009_01
-	bool "u-boot-2009.01"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_2008_10
-	bool "u-boot-2008.10"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_1_2_0_ATMEL
-	bool "u-boot-1.2.0-atmel"
-	depends on BR2_TARGET_AT91
-
 endchoice
 
 config BR2_UBOOT_VERSION
@@ -54,15 +34,9 @@ config BR2_UBOOT_VERSION
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
-	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
-	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
-	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
-	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
-	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
 
 config BR2_U_BOOT_SITE
 	string
-	default "$(BR2_ATMEL_MIRROR)"		if BR2_TARGET_UBOOT_1_2_0_ATMEL
 	default "ftp://ftp.denx.de/pub/u-boot"
 
 source "target/device/Config.in.u-boot"
-- 
1.6.3.3
