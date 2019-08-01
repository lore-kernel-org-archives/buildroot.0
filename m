From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Aug 2019 11:59:14 +0200
Subject: [Buildroot] [PATCH v3] ARC: Add support for ARC HS38 with Quad
 MAC & FPU
In-Reply-To: <20181108215940.18298-1-abrodkin@synopsys.com>
References: <20181108215940.18298-1-abrodkin@synopsys.com>
Message-ID: <a3c1dd2c-4f37-f805-7a97-5b789c566991@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/11/2018 22:59, Alexey Brodkin wrote:
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
[snip]
> +	  It corresponds to "hs38_slc_full" ARC HS template in ARChitect.

 This line was too long, as reported by check-package.

 Committed with that fixed, thanks.

 Regards,
 Arnout
