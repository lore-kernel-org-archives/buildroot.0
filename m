From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jun 2009 09:59:03 +0200
Subject: [Buildroot] [git commit] Add support for Freescale's MXC serial
	terminals
Message-ID: <20090610180236.99E447782B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee0ebdfd596925277634c8ecde95eb33c960acfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


This patch makes ttymxc[012] an option to choose for
BR2_TARGET_GENERIC_GETTY.

It also adds these ports to the generic device table and to securetty.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Config.in                     |   12 ++++++++++++
 target/generic/device_table.txt              |    1 +
 target/generic/target_skeleton/etc/securetty |    3 +++
 3 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index cb7ef77..5f5110c 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -107,6 +107,15 @@ config BR2_TARGET_GENERIC_GETTY_TTYSAC2
 config BR2_TARGET_GENERIC_GETTY_TTYSAC3
 	bool "ttySAC3"
 	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYMXC0
+	bool "ttymxc0"
+	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYMXC1
+	bool "ttymxc1"
+	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYMXC2
+	bool "ttymxc2"
+	depends on BR2_arm
 config BR2_TARGET_GENERIC_GETTY_TTYUL0
 	bool "ttyUL0"
 	depends on BR2_powerpc
@@ -160,6 +169,9 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttySAC1"	if BR2_TARGET_GENERIC_GETTY_TTYSAC1
 	default "ttySAC2"	if BR2_TARGET_GENERIC_GETTY_TTYSAC2
 	default "ttySAC3"	if BR2_TARGET_GENERIC_GETTY_TTYSAC3
+	default "ttymxc0"	if BR2_TARGET_GENERIC_GETTY_TTYMXC0
+	default "ttymxc1"	if BR2_TARGET_GENERIC_GETTY_TTYMXC1
+	default "ttymxc2"	if BR2_TARGET_GENERIC_GETTY_TTYMXC2
 	default "ttyUL0"	if BR2_TARGET_GENERIC_GETTY_TTYUL0
 	default "ttyUL1"	if BR2_TARGET_GENERIC_GETTY_TTYUL1
 	default "ttyUL2"	if BR2_TARGET_GENERIC_GETTY_TTYUL2
diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index b6dd6b9..a80863e 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -77,6 +77,7 @@
 /dev/ttySAC	c	666	0	0	204	64	0	1	4
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
+/dev/ttymxc	c	666	0	0	207	16	0	1	3
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-
diff --git a/target/generic/target_skeleton/etc/securetty b/target/generic/target_skeleton/etc/securetty
index 0e7cf97..b25f4a5 100644
--- a/target/generic/target_skeleton/etc/securetty
+++ b/target/generic/target_skeleton/etc/securetty
@@ -30,3 +30,6 @@ ttyCPM0
 ttyCPM1
 ttyCPM2
 ttyCPM3
+ttymxc0
+ttymxc1
+ttymxc2
-- 
1.6.0.6
