From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 23:01:16 +0200
Subject: [Buildroot] [git commit] gcc: drop redundant explicit version
	handling for aarch64
Message-ID: <20140613210208.693E399EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=712414ce2dc6f40ed98a3d8007e7d7ec382f79d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed anymore now that we default to gcc 4.8.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 309750c..fde1b90 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -11,7 +11,6 @@ choice
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_7_X if BR2_sparc
-	default BR2_GCC_VERSION_4_8_X if BR2_aarch64
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
