From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 1 Feb 2012 23:46:48 +0100
Subject: [Buildroot] [git commit] boot: only show vendor-specific
	bootloaders for applicable arm variant
Message-ID: <20120201224701.C13259097B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a18e5eb09b7817986a365ba701259454ac51a80a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Atmel at91sam9 and NXP lpc32xx are both all arm926t, so only show
then if that arm variant is selected.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/Config.in     |    2 +-
 boot/at91dataflashboot/Config.in |    2 +-
 boot/lpc32xxcdl/Config.in        |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index ff968cd..b232b3b 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -1,5 +1,5 @@
 config BR2_TARGET_AT91BOOTSTRAP
-	depends on BR2_arm
+	depends on BR2_arm926t
 	bool "AT91 Bootstrap"
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index a4efe11..7537548 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
-       depends on BR2_arm
+       depends on BR2_arm926t
        bool "AT91 DataFlashBoot"
diff --git a/boot/lpc32xxcdl/Config.in b/boot/lpc32xxcdl/Config.in
index b6cbcfd..ce7589c 100644
--- a/boot/lpc32xxcdl/Config.in
+++ b/boot/lpc32xxcdl/Config.in
@@ -1,5 +1,5 @@
 config BR2_TARGET_LPC32XXCDL
-	depends on BR2_arm
+	depends on BR2_arm926t
 	bool "LPC32XX CDL (kickstart and S1L)"
 
 if BR2_TARGET_LPC32XXCDL
