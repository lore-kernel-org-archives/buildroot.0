From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jun 2009 23:09:26 +0200
Subject: [Buildroot] [git commit] target/generic: add ttySACx support to
	serial console config
Message-ID: <20090609144407.382777781E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d41f360565feee04697764cf0006161a3dadfc13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Add ttySACx (samsung s3c SoC) support to the generic serial console
config.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Config.in                           |   16 ++++++++++++++++
 target/generic/device_table.txt                    |    1 +
 .../generic/target_busybox_skeleton/etc/securetty  |    4 ++++
 target/generic/target_skeleton/etc/securetty       |    4 ++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 3520939..cb7ef77 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -95,6 +95,18 @@ config BR2_TARGET_GENERIC_GETTY_TTYAMA2
 config BR2_TARGET_GENERIC_GETTY_TTYAMA3
 	bool "ttyAMA3"
 	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYSAC0
+	bool "ttySAC0"
+	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYSAC1
+	bool "ttySAC1"
+	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYSAC2
+	bool "ttySAC2"
+	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYSAC3
+	bool "ttySAC3"
+	depends on BR2_arm
 config BR2_TARGET_GENERIC_GETTY_TTYUL0
 	bool "ttyUL0"
 	depends on BR2_powerpc
@@ -144,6 +156,10 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttyAMA1"	if BR2_TARGET_GENERIC_GETTY_TTYAMA1
 	default "ttyAMA2"	if BR2_TARGET_GENERIC_GETTY_TTYAMA2
 	default "ttyAMA3"	if BR2_TARGET_GENERIC_GETTY_TTYAMA3
+	default "ttySAC0"	if BR2_TARGET_GENERIC_GETTY_TTYSAC0
+	default "ttySAC1"	if BR2_TARGET_GENERIC_GETTY_TTYSAC1
+	default "ttySAC2"	if BR2_TARGET_GENERIC_GETTY_TTYSAC2
+	default "ttySAC3"	if BR2_TARGET_GENERIC_GETTY_TTYSAC3
 	default "ttyUL0"	if BR2_TARGET_GENERIC_GETTY_TTYUL0
 	default "ttyUL1"	if BR2_TARGET_GENERIC_GETTY_TTYUL1
 	default "ttyUL2"	if BR2_TARGET_GENERIC_GETTY_TTYUL2
diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
index d009f18..b6dd6b9 100644
--- a/target/generic/device_table.txt
+++ b/target/generic/device_table.txt
@@ -74,6 +74,7 @@
 #/dev/ppp	c	666	0	0	108	0	-	-	-
 /dev/ttyCPM	c	666	0	0	204	46	0	1	4
 /dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttySAC	c	666	0	0	204	64	0	1	4
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 
diff --git a/target/generic/target_busybox_skeleton/etc/securetty b/target/generic/target_busybox_skeleton/etc/securetty
index 793a4af..0e7cf97 100644
--- a/target/generic/target_busybox_skeleton/etc/securetty
+++ b/target/generic/target_busybox_skeleton/etc/securetty
@@ -14,6 +14,10 @@ ttyAMA0
 ttyAMA1
 ttyAMA2
 ttyAMA3
+ttySAC0
+ttySAC1
+ttySAC2
+ttySAC3
 ttyUL0
 ttyUL1
 ttyUL2
diff --git a/target/generic/target_skeleton/etc/securetty b/target/generic/target_skeleton/etc/securetty
index 793a4af..0e7cf97 100644
--- a/target/generic/target_skeleton/etc/securetty
+++ b/target/generic/target_skeleton/etc/securetty
@@ -14,6 +14,10 @@ ttyAMA0
 ttyAMA1
 ttyAMA2
 ttyAMA3
+ttySAC0
+ttySAC1
+ttySAC2
+ttySAC3
 ttyUL0
 ttyUL1
 ttyUL2
-- 
1.6.0.6
