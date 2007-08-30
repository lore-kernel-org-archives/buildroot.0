From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 30 Aug 2007 23:56:46 +0200
Subject: [Buildroot] Problems with some x86-Target Architecture Variants
In-Reply-To: <f90898420708290412h83ed442x4bd7e61e048b629d@mail.gmail.com>
References: <f90898420708290412h83ed442x4bd7e61e048b629d@mail.gmail.com>
Message-ID: <20070830215646.GD11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 29, 2007 at 01:12:11PM +0200, Simon Pasch wrote:
>There are missing some x86-architecture-variants in Config.in. Without
>them it isn't possible to build the toolchain with build-optimization.
>
>Perhaps someone could look over the instruction-set versions...I tried
>my best to find the correct ones.

gcc-4.3 supports these:
generic
native
i386
i486
i586, pentium
pentium-mmx
pentiumpro
i686
pentium2
pentium3, pentium3m
pentium-m
pentium4, pentium4m
prescott
nocona
core2
k6
k6-2, k6-3
athlon, athlon-tbird
athlon-4, athlon-xp, athlon-mp
k8, opteron, athlon64, athlon-fx
k8-sse3, opteron-sse3, athlon64-sse3
amdfam10, barcelona
winchip-c6
winchip2
c3
c3-2
geode


See the archives for a suggestion on how to please older versions of gcc
http://www.nabble.com/GCC---march%3Dgeode-doesn't-exist--t4108131.html
(or set your BR2_EXTRA_GCC_CONFIG_OPTIONS, BR2_TARGET_OPTIMIZATION
accordingly).

The hunk below is not really appropriate.
>
>--- buildroot/Config.in.old	2007-08-29 09:15:47.000000000 +0200
>+++ buildroot/Config.in	2007-08-29 12:06:04.000000000 +0200
>@@ -366,9 +366,26 @@
> 	default "i486"		if BR2_x86_i486
> 	default "i586"		if BR2_x86_i586
> 	default "i686"		if BR2_x86_i686
>+	default "i686"		if BR2_x86_pentiumpro
>+	default "i586"		if BR2_x86_pentium_mmx
>+	default "i686"		if BR2_x86_pentium_m
>+	default "i686"		if BR2_x86_pentium2
>+	default "i686"		if BR2_x86_pentium3
> 	default "i686"		if BR2_x86_pentium4
>+	default "i686"		if BR2_x86_prescott
> 	default "i686"		if BR2_x86_nocona
> 	default "i686"		if BR2_x86_core2
>+	default "i686"		if BR2_x86_opteron
>+	default "i686"		if BR2_x86_opteron_sse3
>+	default "i686"		if BR2_x86_barcelona
>+	default "i586"		if BR2_x86_k6
>+	default "i586"		if BR2_x86_k6_2
>+	default "i686"		if BR2_x86_athlon
>+	default "i686"		if BR2_x86_athlon_4
>+	default "i486"		if BR2_x86_winchip_c6
>+	default "i586"		if BR2_x86_winchip2
>+	default "i586"		if BR2_x86_c3
>+	default "i686"		if BR2_x86_geode
> 	default "ia64"		if BR2_ia64
> 	default "m68k"		if BR2_m68k
> 	default "mips"		if BR2_mips
