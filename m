From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 18:25:26 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-11
In-Reply-To: <20150712063017.DECA510149E@stock.ovh.net>
References: <20150712063017.DECA510149E@stock.ovh.net>
Message-ID: <1436984726.3682.35.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2015-07-12 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-11
> ===============================
> 
>         success : 3  
>        failures : 15 
>        timeouts : 0  
>           TOTAL : 18 
> 
> Classification of failures by reason
> ====================================
> 
>                   zeromq-4.0.5 | 6 
>              btrfs-progs-4.1.1 | 2 
>              util-linux-2.26.2 | 2 
>                   fbterm-1.7.0 | 1 
>                alsa-lib-1.0.29 | 1 
>                    iperf-2.0.5 | 1 
>                    tinc-1.0.24 | 1 
>                       atf-0.21 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                       atf-0.21 | NOK | 
> http://autobuild.buildroot.net/results/c2655319d2c0df0c86de81b670e40dac4438a05d/

Another TLS-handling failure. Waiting for a fix from toolchain guys.
------------------------------->8---------------------------
/opt/toolchain-build/build/host-gcc-final-arc-2015.06-rc1/build/arc-buildroot-linux-uclibc/libstdc++
-v3/libsupc++/../../../../libstdc++-v3/libsupc++/eh_globals.cc:58: undefined reference to `.tdata'
------------------------------->8---------------------------

>          arc |                   fbterm-1.7.0 | NOK | 
> http://autobuild.buildroot.net/results/37e9c3c79e0a6aea5b89428c2226811ebb3fd611/

Same here.

>          arc |                    iperf-2.0.5 | NOK | 
> http://autobuild.buildroot.net/results/8b22ac0dc9e3c1cd44f2fdbe5cc99a41cf77f454/

Hm, and here.

And actually that was fix few days ago here:
https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a

I'll send this patch separately ASAP if we won't cut another tag for it.

-Alexey
