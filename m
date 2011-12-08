From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Dec 2011 23:37:15 +0100
Subject: [Buildroot] [git commit] gcc: default to 4.5.x
Message-ID: <20111208224036.55F3A8F702@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1ae7cdd69b52a054b5ae822232634123281887b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 4.3.x series is getting quite old, so let's use 4.5 instead.

There were reports of problems in the past, which is why this is done
early in the cycle.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 5905262..e3d2587 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -4,7 +4,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_3_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+	default BR2_GCC_VERSION_4_5_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	help
