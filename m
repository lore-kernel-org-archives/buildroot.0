From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 7 Apr 2014 14:53:41 +0100
Subject: [Buildroot] [PATCH 02/11] arch: MIPS: Add config option
	BR2_GCC_TARGET_TUNE
In-Reply-To: <533DD7B6.8080009@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-2-git-send-email-paul@crapouillou.net>
 <20140403211925.GC17328@free.fr> <533DD7B6.8080009@crapouillou.net>
Message-ID: <5342ADE5.1060908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/2014 10:50 PM, Paul Cercueil wrote:
> Hi Yann,
>
> This patch would pass the same value to --with-arch and --with-tune,
> unless you define a different value for BR2_GCC_TARGET_TUNE in your
> defconfig. We use that for the Ingenic jz4740 processor, which is a
> mips32 processor but running better the code tuned for mips32r2.
>
Hi Paul,

I don't understand this patch as well. If the jz4740 needs a mips32r2 
userland, why not use Target Options-> Target Architecture Variant -> 
mips32r2? You want to use the same toolchain for non-mips32r2 targets as 
well?

The TARGET_TUNE option has been removed for MIPS in 
f60dafe06833a17540608d1c8172d6535c513f1e
"arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS"

and i see no good reason to bring it back.

If you need to optimize for a different ISA, wouldn't it be possible to 
use custom CFLAGS in Toolchain->Target Optimizations?

-- 
markos
