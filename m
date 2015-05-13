From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 May 2015 21:12:26 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-05-09
In-Reply-To: <20150510063016.82480100F50@stock.ovh.net>
References: <20150510063016.82480100F50@stock.ovh.net>
Message-ID: <1431551546.3047.18.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2015-05-10 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-05-09
> ===============================
> 
>         success : 19 
>        failures : 2  
>        timeouts : 0  
>           TOTAL : 21 
> 
> Classification of failures by reason
> ====================================
> 
>                     gpm-1.20.7 | 1 
>       host-gdb-arc-2014.12-gdb | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/f80b17513ae5c2797c9d0bb4db4b40e4c2e1560e/

I see that build log
http://autobuild.buildroot.net/results/f80/f80b17513ae5c2797c9d0bb4db4b40e4c2e1560e/build-end.log ends with:
------->8------------
/usr/bin/install -c
gpm /ssd1/thomas/autobuild/instance-3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/sbin/gpm
/usr/bin/install: cannot create regular file
'/ssd1/thomas/autobuild/instance-3/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/sbin/gpm': No such file or directory
Makefile:107: recipe for target 'install' failed
------->8------------

Is there a chance that autobuilder run out of disk space etc and so
"install" command wasn't able to create an output file?

-Alexey
