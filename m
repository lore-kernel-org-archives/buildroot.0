From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 Sep 2012 13:28:03 +0200
Subject: [Buildroot] [git commit] gcc: default to 4.6.x
Message-ID: <20120904134540.DD4FD9950C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27045cde7d18f6132ab804ed30673e3fb3961879
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.5.x is no longer maintained upstream.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index d08efbc..a67e7b0 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -4,7 +4,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_5_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+	default BR2_GCC_VERSION_4_6_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	help
