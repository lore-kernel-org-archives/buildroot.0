From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:53 +0100
Subject: [Buildroot] [PATCH 22/55] u-boot: add U-Boot 2010.09
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f9e99fb26632746f10132d90862673a40c2b96fe.1291582351.git.thomas.petazzoni@free-electrons.com>
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
index ce79a8a..86c656d 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_06
+	default BR2_TARGET_UBOOT_2010_09
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2010_09
+	bool "2010.09"
+
 config BR2_TARGET_UBOOT_2010_06
 	bool "2010.06"
 
@@ -42,6 +45,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
-- 
1.7.0.4
