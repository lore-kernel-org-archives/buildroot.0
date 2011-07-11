From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:53:56 +0200
Subject: [Buildroot] [PATCH 12/12] uboot: Add 2011.06
In-Reply-To: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310392269.git.thomas.petazzoni@free-electrons.com>
Message-ID: <14df8d133d8d461941592ceaab66bc040fbabcbe.1310392269.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index b8eb42d..d396fb5 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_03
+	default BR2_TARGET_UBOOT_2011_06
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_06
+	bool "2011.06"
+
 config BR2_TARGET_UBOOT_2011_03
 	bool "2011.03"
 
@@ -48,6 +51,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
-- 
1.7.4.1
