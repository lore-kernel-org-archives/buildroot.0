From: Elizabeth Oldham <beth@the-hug.org>
Date: Tue, 09 Oct 2007 20:16:19 +0100
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <470B88CC.9040705@ruby.dti.ne.jp>
References: <470ADDA8.3080105@ruby.dti.ne.jp>
	<20071009070816.GP20951@aon.at>	<470B5043.5010606@ruby.dti.ne.jp>
	<20071009122700.GB15786@aon.at> <470B88CC.9040705@ruby.dti.ne.jp>
Message-ID: <470BD383.4060504@the-hug.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shinya Kuribayashi wrote:

>>1. O32 ABI (CONFIG_MIPS_O32_ABI) (NEW)
> 
>   2. N32 ABI (CONFIG_MIPS_N32_ABI) (NEW)
>   3. N64 ABI (CONFIG_MIPS_N64_ABI) (NEW)
> choice[1-3?]: 1
> Target Processor Architecture
> 
>>1. Generic (MIPS I) (CONFIG_MIPS_ISA_1) (NEW)
> 
>   2. MIPS II (CONFIG_MIPS_ISA_2) (NEW)
>   3. MIPS III (CONFIG_MIPS_ISA_3) (NEW)
>   4. MIPS IV (CONFIG_MIPS_ISA_4) (NEW)
>   5. MIPS32 (CONFIG_MIPS_ISA_MIPS32) (NEW)
>   6. MIPS64 (CONFIG_MIPS_ISA_MIPS64) (NEW)
> choice[1-6?]: 5
> 
> But it seems these configs were not directly passed to GCC configs
> according to mips-linux-gcc -v, or GCC config.status.
...
> Ditto, it's hard for me to answer. I should learn more about GCC config.
> Anyone MIPS guys?


The matrix of MIPS ISA and ABIs supported on Linux is:
(fixed pitch font time)

               o32    n32    n64
MIPS I         o
MIPS II        o
MIPS III       o      o       o
MIPS IV        o      o       o
MIPS32(r1)     o
MIPS32R2       o
MIPS64(r1)     o      o       o
MIPS64R2       o      o       o

(blank is not supported)

MIPS16 is a bare-iron thing, along with other tweaks like using a 64bit 
FPU inside a 32bit world.
Beth
