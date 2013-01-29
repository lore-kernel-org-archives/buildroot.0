From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2013 18:47:45 +0100
Subject: [Buildroot] [PATCH v3] New package: cache-calibrator
In-Reply-To: <1359453232-23310-1-git-send-email-sho@relinux.de>
References: <1359448315-22100-1-git-send-email-sho@relinux.de>
 <1359453232-23310-1-git-send-email-sho@relinux.de>
Message-ID: <51080B41.8000401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/13 10:53, Stephan Hoffmann wrote:
> The Calibrator is a small C program that is supposed to analyze
> a computers (cache-) memory system and extract the following
> parameters:
>
>      number of cache levels
>      for each cache level:
>          its size
>          its linesize
>          its access/miss latency
>      main memory access latency
>      number of TLB levels
>      for each TLB level:
>          its capacity (i.e. number of entries)
>          the pagesize used
>          the TLB miss latency
>
> http://homepages.cwi.nl/~manegold/Calibrator/
>
> It is also recommended as a load generator for realtime testing in:
>
> https://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO#Benchmarking
>
> Signed-off-by: Stephan Hoffmann<sho@relinux.de>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

> ---
> v2: Review by Arnout Vandecappelle
> 	Fix License

  Now I've looked at the license, it turns out to be _almost_ a BSD-3c. 
But not exactly, so 'Cache calibrator license' is a good approximation.

> 	Use $(TARGET_CFLAGS) and $(TARGET_LDFLAGS)
> 	Fix Typo
> 	Remove $(CACHE_CALIBRATOR_DIR)
> v3: Review by Thomas Petazzoni
> 	Fix CACHE_CALIBRATOR_EXTRACT_CMDS


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
