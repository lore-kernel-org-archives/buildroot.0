From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Apr 2010 10:53:34 +0200
Subject: [Buildroot] [git commit master] atmel: Add at91sam9g45ekes board
	support
Message-ID: <20100409085536.EADDE8B845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b6ebab842dbb0581526f907bf5b39cad0ac1f756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Josh.Wu <josh.wu@atmel.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/Atmel/AT91_Config.in |   16 ++++++++++++++++
 target/device/Atmel/Config.in      |    1 +
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/target/device/Atmel/AT91_Config.in b/target/device/Atmel/AT91_Config.in
index 4cff406..77b01bf 100644
--- a/target/device/Atmel/AT91_Config.in
+++ b/target/device/Atmel/AT91_Config.in
@@ -119,6 +119,14 @@ config BR2_TARGET_AT91SAM9G40
 	help
 	  Atmel AT91SAM9G40 ARM based systems
 
+config BR2_TARGET_AT91SAM9G45
+	bool "Atmel AT91SAM9G45 Microprocessor"
+	depends on BR2_TARGET_AT91
+	depends on !BR2_TARGET_ATMEL_FPDSP
+	depends on !BR2_TARGET_ATMEL_MPB
+	help
+	  Atmel AT91SAM9G45 ARM based systems
+
 config BR2_TARGET_AT91SAM9M10
 	bool "Atmel AT91SAM9M10 Microprocessor"
 	depends on BR2_TARGET_AT91
@@ -267,6 +275,14 @@ config BR2_TARGET_AT91SAM9263EK
 	help
 	  The Atmel AT91SAM9263 Development Board
 
+config BR2_TARGET_AT91SAM9G45EKES
+	bool "Atmel AT91SAM9G45EKES"
+	depends on BR2_TARGET_AT91SAM9G45
+	select BR2_BOOTSOURCE_DATAFLASHCARD
+	select BR2_BOOTSOURCE_NANDFLASH
+	help
+	  The Atmel AT91SAM9G45 Development Board
+
 config BR2_TARGET_AT572D940DCM
 	bool "Atmel AT572D940 Diopsis Computer Module"
 	depends on BR2_TARGET_AT572D940HF
diff --git a/target/device/Atmel/Config.in b/target/device/Atmel/Config.in
index 9665fc2..4e36b90 100644
--- a/target/device/Atmel/Config.in
+++ b/target/device/Atmel/Config.in
@@ -21,6 +21,7 @@ config BR2_BOARD_NAME
 	default	"at91sam9xeek"		if	BR2_TARGET_AT91SAM9XEEK
 	default	"at91sam9g20ek"		if	BR2_TARGET_AT91SAM9G20EK
 	default	"at91sam9g20dfc"	if	BR2_TARGET_AT91SAM9G20DFC
+	default "at91sam9g45ekes"	if	BR2_TARGET_AT91SAM9G45EKES
 	default	"at91sam9m10ek"		if	BR2_TARGET_AT91SAM9M10EK
 	default	"at91sam9m10dfc"	if	BR2_TARGET_AT91SAM9M10DFC
 	default	"atstk100x"		if	BR2_TARGET_AVR32_ATSTK1002
-- 
1.6.3.3
