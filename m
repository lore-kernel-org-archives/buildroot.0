From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Mar 2013 19:50:22 +0100
Subject: [Buildroot] [git commit] toolchain: default to gcc 4.7.x
Message-ID: <20130325191506.C65569B2D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02c26700f4bb038ff5ec64570f8fc7f8b90250de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With 4.8.x released, it makes sense to update our default gcc version
before 4.6.x becomes unmaintained.

At the same time simplify the kconfig logic a bit.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 87d9cc1..f8cb82a 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -7,9 +7,9 @@ config BR2_GCC_NEEDS_MPC
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_6_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
+	default BR2_GCC_VERSION_4_7_X
 	help
 	  Select the version of gcc you wish to use.
 
