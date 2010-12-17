From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] Free text field for serial port
	configuration
Message-ID: <20101217160204.CE74E8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5cfc41c752a90e695eb3d8e4e715b92f8e14d233
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_GENERIC_GETTY_PORT has now a string type instead of choice.
This makes port configuration flexible and compact.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Config.in |  120 ++--------------------------------------------
 1 files changed, 4 insertions(+), 116 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 81ac011..c624ba8 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -17,123 +17,11 @@ menuconfig BR2_TARGET_GENERIC_GETTY
 
 if BR2_TARGET_GENERIC_GETTY
 
-choice
-	prompt "Serial port to run a getty on"
-	default BR2_TARGET_GENERIC_GETTY_TTYS0
-	help
-	  Select a port to run a getty (login prompt) on.
-
-config BR2_TARGET_GENERIC_GETTY_NONE
-	bool "none"
-config BR2_TARGET_GENERIC_GETTY_TTYS0
-	bool "ttyS0"
-config BR2_TARGET_GENERIC_GETTY_TTYS1
-	bool "ttyS1"
-config BR2_TARGET_GENERIC_GETTY_TTYS2
-	bool "ttyS2"
-config BR2_TARGET_GENERIC_GETTY_TTYS3
-	bool "ttyS3"
-config BR2_TARGET_GENERIC_GETTY_TTYAMA0
-	bool "ttyAMA0"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYAMA1
-	bool "ttyAMA1"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYAMA2
-	bool "ttyAMA2"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYAMA3
-	bool "ttyAMA3"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYSAC0
-	bool "ttySAC0"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYSAC1
-	bool "ttySAC1"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYSAC2
-	bool "ttySAC2"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYSAC3
-	bool "ttySAC3"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYMXC0
-	bool "ttymxc0"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYMXC1
-	bool "ttymxc1"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYMXC2
-	bool "ttymxc2"
-	depends on BR2_arm
-config BR2_TARGET_GENERIC_GETTY_TTYUL0
-	bool "ttyUL0"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYUL1
-	bool "ttyUL1"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYUL2
-	bool "ttyUL2"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYUL3
-	bool "ttyUL3"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYPSC0
-	bool "ttyPSC0"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYPSC1
-	bool "ttyPSC1"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYPSC2
-	bool "ttyPSC2"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYPSC3
-	bool "ttyPSC3"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYCPM0
-	bool "ttyCPM0"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYCPM1
-	bool "ttyCPM1"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYCPM2
-	bool "ttyCPM2"
-	depends on BR2_powerpc
-config BR2_TARGET_GENERIC_GETTY_TTYCPM3
-	bool "ttyCPM3"
-	depends on BR2_powerpc
-endchoice
-
 config BR2_TARGET_GENERIC_GETTY_PORT
-	string
-	default "#ttyS0"	if BR2_TARGET_GENERIC_GETTY_NONE
-	default "ttyS0"		if BR2_TARGET_GENERIC_GETTY_TTYS0
-	default "ttyS1"		if BR2_TARGET_GENERIC_GETTY_TTYS1
-	default "ttyS2"		if BR2_TARGET_GENERIC_GETTY_TTYS2
-	default "ttyS3"		if BR2_TARGET_GENERIC_GETTY_TTYS3
-	default "ttyAMA0"	if BR2_TARGET_GENERIC_GETTY_TTYAMA0
-	default "ttyAMA1"	if BR2_TARGET_GENERIC_GETTY_TTYAMA1
-	default "ttyAMA2"	if BR2_TARGET_GENERIC_GETTY_TTYAMA2
-	default "ttyAMA3"	if BR2_TARGET_GENERIC_GETTY_TTYAMA3
-	default "ttySAC0"	if BR2_TARGET_GENERIC_GETTY_TTYSAC0
-	default "ttySAC1"	if BR2_TARGET_GENERIC_GETTY_TTYSAC1
-	default "ttySAC2"	if BR2_TARGET_GENERIC_GETTY_TTYSAC2
-	default "ttySAC3"	if BR2_TARGET_GENERIC_GETTY_TTYSAC3
-	default "ttymxc0"	if BR2_TARGET_GENERIC_GETTY_TTYMXC0
-	default "ttymxc1"	if BR2_TARGET_GENERIC_GETTY_TTYMXC1
-	default "ttymxc2"	if BR2_TARGET_GENERIC_GETTY_TTYMXC2
-	default "ttyUL0"	if BR2_TARGET_GENERIC_GETTY_TTYUL0
-	default "ttyUL1"	if BR2_TARGET_GENERIC_GETTY_TTYUL1
-	default "ttyUL2"	if BR2_TARGET_GENERIC_GETTY_TTYUL2
-	default "ttyUL3"	if BR2_TARGET_GENERIC_GETTY_TTYUL3
-	default "ttyPSC0"	if BR2_TARGET_GENERIC_GETTY_TTYPSC0
-	default "ttyPSC1"	if BR2_TARGET_GENERIC_GETTY_TTYPSC1
-	default "ttyPSC2"	if BR2_TARGET_GENERIC_GETTY_TTYPSC2
-	default "ttyPSC3"	if BR2_TARGET_GENERIC_GETTY_TTYPSC3
-	default "ttyCPM0"	if BR2_TARGET_GENERIC_GETTY_TTYCPM0
-	default "ttyCPM1"	if BR2_TARGET_GENERIC_GETTY_TTYCPM1
-	default "ttyCPM2"	if BR2_TARGET_GENERIC_GETTY_TTYCPM2
-	default "ttyCPM3"	if BR2_TARGET_GENERIC_GETTY_TTYCPM3
+	string "Serial port to run a getty on"
+	default "ttyS0"
+	help
+	  Specify a port to run a getty (login prompt) on.
 
 choice
 	prompt "Baudrate to use"
-- 
1.7.2.2
