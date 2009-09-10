From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 10:32:45 +0200
Subject: [Buildroot] [git commit master] toolchain/gcc: make 4.3.4 default
Message-ID: <20090910083412.DC9CF777A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5cc0622a14054b8b2b1e2d5f37565a31f65c6511
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There still seems to be some issues with 4.4.x and C++.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 8246a95..279e101 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -4,7 +4,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_3_3 if !BR2_avr32
+	default BR2_GCC_VERSION_4_3_4 if !BR2_avr32
 	default BR2_GCC_VERSION_4_2_3 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
@@ -49,11 +49,12 @@ choice
 
 	config BR2_GCC_VERSION_4_3_2
 		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_RECENT || BR2_DEPRECATED
+		depends on BR2_DEPRECATED
 		bool "gcc 4.3.2"
 
 	config BR2_GCC_VERSION_4_3_3
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "gcc 4.3.3"
 
 	config BR2_GCC_VERSION_4_3_4
-- 
1.6.3.3
