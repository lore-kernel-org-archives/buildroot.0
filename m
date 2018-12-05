From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 5 Dec 2018 07:14:06 +0000
Subject: [Buildroot] [PATCH v3] ARC: Add support for ARC HS38 with Quad
 MAC & FPU
In-Reply-To: <20181108215940.18298-1-abrodkin@synopsys.com>
References: <20181108215940.18298-1-abrodkin@synopsys.com>
Message-ID: <edd84fcb506743551664263bdae6e51345f1f683.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 2018-11-08 at 16:59 -0500, Alexey Brodkin wrote:
> From: Alexey Brodkin <alexey.brodkin@synopsys.com>
> 
> We used to build everything for pretty much baseline ARC HS capable
> of runnig Linux kernel, which was ARC HS38/48 with MMU and caches.
> 
> But there's a fully featured ARC HS with additional support for
>  - Dual & quad integer multiply and MAC operations
>  - Double-precision floating-point unit
> 
> It corresponds to the following ARC HS templates in ARChitect: hs38_slc_full.
> 
> In fact existing HSDK board uses exactly this configuration in its SoC
> and this is recommended configuration for Linux use-cases.
> 
> To make life simpler we have corresponding "-mcpu" and "--with-cpu"
> options in ARC GCC port so we're going to use it and get binaries
> built accordingly optimized.
> 
> And while at it added help message so users may better understand
> what they are dealing with.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> 
> Changes v2 -> v3:
> 
>  * Spello in BR2_READELF_ARCH_NAME: "BR2_archs_full" instead of
>    "BR2_archs38_full" which obviously lead to build failure.
> 
> Changes v1 -> v2:
> 
> Basically this is a slight rework of [1]
> with the following chnages:
> 
>  * No uClibc changes as we no longer mess with ARC core
>    versions there, see [2]
> 
>  * Added help message so users see what is meant
> 
>  * Renamed internal BR variable to indicate more chnages
>    but not only floating-point unit

Any concerns about this one or otherwise may we get it applied
sometime soon?

-Alexey
