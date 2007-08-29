From: Simon Pasch <fpasch@googlemail.com>
Date: Wed, 29 Aug 2007 13:12:11 +0200
Subject: [Buildroot] Problems with some x86-Target Architecture Variants
Message-ID: <f90898420708290412h83ed442x4bd7e61e048b629d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are missing some x86-architecture-variants in Config.in. Without
them it isn't possible to build the toolchain with build-optimization.

Perhaps someone could look over the instruction-set versions...I tried
my best to find the correct ones.

--- buildroot/Config.in.old	2007-08-29 09:15:47.000000000 +0200
+++ buildroot/Config.in	2007-08-29 12:06:04.000000000 +0200
@@ -366,9 +366,26 @@
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i686"		if BR2_x86_i686
+	default "i686"		if BR2_x86_pentiumpro
+	default "i586"		if BR2_x86_pentium_mmx
+	default "i686"		if BR2_x86_pentium_m
+	default "i686"		if BR2_x86_pentium2
+	default "i686"		if BR2_x86_pentium3
 	default "i686"		if BR2_x86_pentium4
+	default "i686"		if BR2_x86_prescott
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
+	default "i686"		if BR2_x86_opteron
+	default "i686"		if BR2_x86_opteron_sse3
+	default "i686"		if BR2_x86_barcelona
+	default "i586"		if BR2_x86_k6
+	default "i586"		if BR2_x86_k6_2
+	default "i686"		if BR2_x86_athlon
+	default "i686"		if BR2_x86_athlon_4
+	default "i486"		if BR2_x86_winchip_c6
+	default "i586"		if BR2_x86_winchip2
+	default "i586"		if BR2_x86_c3
+	default "i686"		if BR2_x86_geode
 	default "ia64"		if BR2_ia64
 	default "m68k"		if BR2_m68k
 	default "mips"		if BR2_mips
