From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jun 2010 23:16:55 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: Use 4.3.x like
	for 4.4, get rid of older 4.3.x versions
Message-ID: <20100615214759.C2631803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=144e4ed085d67b46cb0ce9c1c45794bce3c8cb99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    2 ++
 toolchain/gcc/Config.in |   24 ++++--------------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1c4425b..f3b8c6c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	Fixes all over the tree and new features.
 
+	Toolchain: GCC 4.3.5, older 4.3.x versions removed.
+
 	Bootloaders: Various cleanups, moved to boot/, added Barebox,
 	removed yaboot. Support building u-boot from custom tarball.
 
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 7ca5ae2..9140a8d 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -4,7 +4,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_3_5 if !BR2_avr32
+	default BR2_GCC_VERSION_4_3_X if !BR2_avr32
 	default BR2_GCC_VERSION_4_2_3 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
@@ -37,22 +37,9 @@ choice
 		depends on !BR2_avr32
 		bool "gcc 4.2.4"
 
-	config BR2_GCC_VERSION_4_3_2
+	config BR2_GCC_VERSION_4_3_X
 		depends on !BR2_avr32
-		depends on BR2_DEPRECATED
-		bool "gcc 4.3.2"
-
-	config BR2_GCC_VERSION_4_3_3
-		depends on !BR2_avr32
-		bool "gcc 4.3.3"
-
-	config BR2_GCC_VERSION_4_3_4
-		depends on !BR2_avr32
-		bool "gcc 4.3.4"
-
-	config BR2_GCC_VERSION_4_3_5
-		depends on !BR2_avr32
-		bool "gcc 4.3.5"
+		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_avr32
@@ -87,10 +74,7 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
-	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
-	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
-	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
-	default "4.3.5"     if BR2_GCC_VERSION_4_3_5
+	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.4"     if BR2_GCC_VERSION_4_4_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
-- 
1.7.1
