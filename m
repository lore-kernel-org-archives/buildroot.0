From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jul 2013 16:02:04 +0200
Subject: [Buildroot] [PATCH 2/8] arch: Refactor BR2_SOFT_FLOAT into
 per-architecture options
In-Reply-To: <87vc4mglui.fsf@dell.be.48ers.dk>
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373123292-15085-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87vc4mglui.fsf@dell.be.48ers.dk>
Message-ID: <20130708160204.6b7b96f8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 07 Jul 2013 22:24:05 +0200, Peter Korsgaard wrote:

> Does avr32 SoCs with hard float even exist? Does
> uClibc/kernel/.. support it? If not, we could just make this a hidden
> option.

According to http://en.wikipedia.org/wiki/AVR32, the AVR32 AP7 never
had a floating point unit, only the UC3, but I believe Linux was only
running on AP7 cores, but I'm not sure. Anyway, I'll make AVR32
soft-float only.

>  Thomas> +config BR2_POWERPC_SOFT_FLOAT
>  Thomas> +	bool "Use soft-float"
>  Thomas> +	default y
>  Thomas> +	select BR2_SOFT_FLOAT
>  Thomas> +	help
>  Thomas> +	  If your target CPU does not have a Floating Point Unit (FPU)
>  Thomas> +	  or a kernel FPU emulator, but you still wish to support
>  Thomas> +	  floating point functions, then everything will need to be
>  Thomas> +	  compiled with soft floating point support (-msoft-float).
> 
> We didn't use to default to soft float for powerpc, as most cores have a
> FPU.

Correct, will fix. As a followup to this patch set, it'd be nice if
someone knowledgeable in PPC stuff did a similar handling of FPU stuff.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
