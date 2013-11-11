From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 17:47:27 +0100
Subject: [Buildroot] [PATCH 03/15] grub: factorize BR2_TARGET_GRUB
	dependency in Config.in
In-Reply-To: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1384188459-1332-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/Config.in | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/boot/grub/Config.in b/boot/grub/Config.in
index ec48d17..fab3323 100644
--- a/boot/grub/Config.in
+++ b/boot/grub/Config.in
@@ -4,9 +4,10 @@ config BR2_TARGET_GRUB
 	help
 	  The GRand Unified Bootloader for x86 systems.
 
+if BR2_TARGET_GRUB
+
 config BR2_TARGET_GRUB_SPLASH
 	bool "Splashimage support"
-	depends on BR2_TARGET_GRUB
 	help
 	  Add support for splashimage.
 
@@ -15,132 +16,112 @@ config BR2_TARGET_GRUB_SPLASH
 
 config BR2_TARGET_GRUB_DISKLESS
 	bool "diskless support"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable diskless support
 
 config BR2_TARGET_GRUB_3c595
 	bool "3Com595 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable 3Com595 driver
 
 config BR2_TARGET_GRUB_3c90x
 	bool "3Com90x driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable 3Com90x driver
 
 config BR2_TARGET_GRUB_davicom
 	bool "Davicom driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Davicom driver
 
 config BR2_TARGET_GRUB_e1000
 	bool "Etherexpress Pro/1000 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Etherexpress Pro/1000 driver
 
 config BR2_TARGET_GRUB_eepro100
 	bool "Etherexpress Pro/100 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Etherexpress Pro/100 driver
 
 config BR2_TARGET_GRUB_epic100
 	bool "SMC 83c170 EPIC/100 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable SMC 83c170 EPIC/100 driver
 
 config BR2_TARGET_GRUB_forcedeth
 	bool "Nvidia Geforce driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Nvidia Geforce driver
 
 config BR2_TARGET_GRUB_natsemi
 	bool "NatSemi DP8381x driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable NatSemi DP8381x driver
 
 config BR2_TARGET_GRUB_ns83820
 	bool "NS83820 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable NS83820 driver
 
 config BR2_TARGET_GRUB_ns8390
 	bool "NE2000 PCI driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable NE2000 PCI driver
 
 config BR2_TARGET_GRUB_pcnet32
 	bool "AMD Lance/PCI PCNet/32 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable AMD Lance/PCI PCNet/32 driver
 
 config BR2_TARGET_GRUB_pnic
 	bool "Bochs Pseudo Nic driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Bochs Pseudo Nic driver
 
 config BR2_TARGET_GRUB_rtl8139
 	bool "Realtek 8139 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Realtek 8139 driver
 
 config BR2_TARGET_GRUB_r8169
 	bool "Realtek 8169 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Realtek 8169 driver
 
 config BR2_TARGET_GRUB_sis900
 	bool "SIS 900 and SIS 7016 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable SIS 900 and SIS 7016 driver
 
 config BR2_TARGET_GRUB_tg3
 	bool "Broadcom Tigon3 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Broadcom Tigon3 driver
 
 config BR2_TARGET_GRUB_tulip
 	bool "Tulip driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Tulip driver
 
 config BR2_TARGET_GRUB_tlan
 	bool "TI ThunderLAN driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable TI ThunderLAN driver
 
 config BR2_TARGET_GRUB_undi
 	bool "PXE UNDI driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable PXE UNDI driver
 
 config BR2_TARGET_GRUB_via_rhine
 	bool "Rhine-I/II driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Rhine-I/II driver
 
 config BR2_TARGET_GRUB_w89c840
 	bool "Winbond W89c840 driver"
-	depends on BR2_TARGET_GRUB
 	help
 	  enable Winbond W89c840 driver
+
+endif # BR2_TARGET_GRUB
-- 
1.8.1.2
