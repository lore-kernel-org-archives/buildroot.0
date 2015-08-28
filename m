From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Fri, 28 Aug 2015 15:15:34 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
In-Reply-To: <20150828115314.606c5049@free-electrons.com>
References: <1990856.EDz1xKh0BM@raillard-dv6>
 <20150828115314.606c5049@free-electrons.com>
Message-ID: <180102384.TlRWI16dqe@raillard-dv6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

On Friday 28 August 2015 11:53:14, Thomas Petazzoni wrote:

> > Now elf2flt sources had been moved out of the buildroot tree, but the
> > currently used upstream has no obvious mean of contact so here is a serie
> > of small patches that allow the elf2flt toolchain to compile cleanly C
> > code (C++ not tested).
> Can you submit this as proper patches against Buildroot, i.e a patch
> adding patches in package/elf2flt/ ?

Sure, I'll patch my patch to create a patch adding patches right away.

> Also, can you ask on the nommu.org mailing list
> (http://lists.nommu.org/listinfo/nommu) is they have a new official
> upstream location for elf2flt ?

Sure

> > Here is the URL of that prebuilt toolchain:
> > https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/ar
> > m-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
> Are you sure? This is a Linux toolchain, not a uClinux toolchain.

Well, it runs on linux host and output working bFLT binaries (runtime tested) 
for a uClinux target. Not a lot of people seems to be working with uClinux, 
but I found that this toolchain was the one used by most of people working 
with the stm32f429-discovery board, probably because Emcraft Systems has 
released a BSP for that board and they point to (nearly) that toolchain. 
(http://www.emcraft.com/stm32f429discovery#release-materials).

> If you want the sources of:
> 
>  
> http://sourcery.mentor.com/public/gnu_toolchain/arm-uclinuxeabi/arm-2011.03
> -46-arm-uclinuxeabi-i686-pc-linux-gnu.tar.bz2
> 
> they are available at:
> 
>  
> http://sourcery.mentor.com/public/gnu_toolchain/arm-uclinuxeabi/arm-2011.03
> -46-arm-uclinuxeabi.src.tar.bz2
> 
> And this one does have the sources of elf2flt:
> 
>   arm-2011.03-46-arm-uclinuxeabi/elf2flt-2011.03-46.tar.bz2

I'll study these sources, as they should handle correctly the .ARM.exidx and 
.ARM.extab sections, thanks for the pointer.
Caveat: From https://github.com/jserv/stm32f429-linux-builder:
SourceryG++ arm-2011.03 is known to NOT work (but elf2flt is probably still 
useable).

Best regards,

Douglas


-- 

Douglas RAILLARD
