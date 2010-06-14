From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91dataflashboot: fix
	configuration options
Message-ID: <20100614203443.72A4C804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=21aa87d6c67571afafe0812d619b3389f049279e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91dataflashboot/Config.in |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index c6711c4..25b9723 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -2,22 +2,24 @@ menuconfig BR2_TARGET_DATAFLASHBOOT
        depends on BR2_arm
        bool "AT91 DataFlashBoot"
 
+if BR2_TARGET_DATAFLASHBOOT
+
 choice
 	prompt "Target Architecture"
 	default BR2_TARGET_DATAFLASHBOOT_AT91RM9200
-	depends on BR2_TARGET_DATAFLASHBOOT
 	help
 	  Select Chip for which Dataflash boot should be built
 	  Currently only AT91RM9200 Supported
 
 config BR2_TARGET_DATAFLASHBOOT_AT91RM9200
-       depends on BR2_TARGET_AT91RM9200
 	bool "AT91RM9200"
+
 config BR2_TARGET_DATAFLASHBOOT_AT91SAM9261
-       depends on BR2_TARGET_AT91SAM9261
 	bool "AT91SAM9261"
+
 config BR2_TARGET_DATAFLASHBOOT_AT91SAM9261S
-       depends on BR2_TARGET_AT91SAM9261S
 	bool "AT91SAM9261S"
 
 endchoice
+
+endif # BR2_TARGET_DATAFLASHBOOT
-- 
1.7.1
