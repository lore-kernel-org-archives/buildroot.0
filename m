From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 30 Jan 2013 08:51:50 +0100
Subject: [Buildroot] [PATCH v3] New package: cache-calibrator
In-Reply-To: <87libbd8zz.fsf@dell.be.48ers.dk>
References: <1359448315-22100-1-git-send-email-sho@relinux.de>
 <1359453232-23310-1-git-send-email-sho@relinux.de>
 <87libbd8zz.fsf@dell.be.48ers.dk>
Message-ID: <5108D116.1060606@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 29.01.2013 21:33, schrieb Peter Korsgaard:
>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>  Stephan> The Calibrator is a small C program that is supposed to analyze
>  Stephan> a computers (cache-) memory system and extract the following
>  Stephan> parameters:
>
>  Stephan>     number of cache levels
>  Stephan>     for each cache level:
>  Stephan>         its size
>  Stephan>         its linesize
>  Stephan>         its access/miss latency
>  Stephan>     main memory access latency
>  Stephan>     number of TLB levels
>  Stephan>     for each TLB level:
>  Stephan>         its capacity (i.e. number of entries)
>  Stephan>         the pagesize used
>  Stephan>         the TLB miss latency
>
>  Stephan> http://homepages.cwi.nl/~manegold/Calibrator/
>
>  Stephan> It is also recommended as a load generator for realtime testing in:
>
>  Stephan> https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO#Benchmarking
>
>  Stephan> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>  Stephan> ---
>  Stephan> v2: Review by Arnout Vandecappelle
>  Stephan> 	Fix License
>  Stephan> 	Use $(TARGET_CFLAGS) and $(TARGET_LDFLAGS)
>  Stephan> 	Fix Typo
>  Stephan> 	Remove $(CACHE_CALIBRATOR_DIR) 
>  Stephan> v3: Review by Thomas Petazzoni
>  Stephan> 	Fix CACHE_CALIBRATOR_EXTRACT_CMDS
>
>  Stephan> @@ -0,0 +1,13 @@
>  Stephan> +config BR2_PACKAGE_CACHE_CALIBRATOR
>  Stephan> +	bool "cache-calibrator"
>  Stephan> +	help
>  Stephan> +	  Cache calibrator is a small C program that is
>  Stephan> +	  supposed to analyze a computers (cache-) memory
>  Stephan> +	  system and extract useful information
>  Stephan> +
>  Stephan> +	  http://homepages.cwi.nl/~manegold/Calibrator/
>  Stephan> +
>  Stephan> +	  It is also recommended as a load generator for
>  Stephan> +	  realtime testing in:
>
> We normally wrap help text around col 70, not 50. I've reformatted this
> to better fit menuconfig.
>
>
>  Stephan> +++ b/package/cache-calibrator/cache-calibrator.mk
>  Stephan> @@ -0,0 +1,24 @@
>  Stephan> +#############################################################
>  Stephan> +#
>  Stephan> +# cache-calibrator
>  Stephan> +#
>  Stephan> +#############################################################
>  Stephan> +
>  Stephan> +CACHE_CALIBRATOR_SOURCE = calibrator.c
>  Stephan> +CACHE_CALIBRATOR_SITE = http://homepages.cwi.nl/~manegold/Calibrator/src
>  Stephan> +CACHE_CALIBRATOR_LICENSE = Cache calibrator license
>  Stephan> +CACHE_CALIBRATOR_LICENSE_FILES = calibrator.c
>  Stephan> +
>  Stephan> +define CACHE_CALIBRATOR_EXTRACT_CMDS
>  Stephan> +	cp $(DL_DIR)/$(CACHE_CALIBRATOR_SOURCE) $(D)
>
> Did you test this? It is $(@D) not $(D) (which expands to the empty
> string)
You're right, I did not. Thanx for the fix.

Stephan
>
> Committed with these fixes, thanks.
>
