From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 15 Jul 2015 17:59:05 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-13
In-Reply-To: <20150714063019.304A8101082@stock.ovh.net>
References: <20150714063019.304A8101082@stock.ovh.net>
Message-ID: <1436983123.3682.19.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-07-14 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-13
> ===============================
> 
>         success : 3  
>        failures : 16 
>        timeouts : 0  
>           TOTAL : 19 
> 
> Classification of failures by reason
> ====================================
> 
>              util-linux-2.26.2 | 5 
>              btrfs-progs-4.1.1 | 5 
>                   zeromq-4.0.5 | 3 
>                alsa-lib-1.0.29 | 1 
>                   boost-1.58.0 | 1 
>                  libpcap-1.7.4 | 1 
> 
> Detail of failures
> ===================

Most of items were addressed in the previous mail and remaining here failed due to
inability to get sources:
------------------------------------>8-------------------------------
>>> libpcap 1.7.4 Downloading[23m
--2015-07-13 18:00:40--  http://www.tcpdump.org/release/libpcap-1.7.4.tar.gz
Resolving www.tcpdump.org... failed: Name or service not known.
wget: unable to resolve host address `www.tcpdump.org'
--2015-07-13 18:01:07--  http://sources.buildroot.net/libpcap-1.7.4.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-07-13 18:01:07 ERROR 404: Not Found.

make: *** [/home/peko/autobuild/instance-1/output/build/libpcap-1.7.4/.stamp_downloaded] Error 1
make: Leaving directory `/home/peko/autobuild/instance-1/buildroot'
------------------------------------>8-------------------------------

Now I may wget that tarball, so probably temporary connection issue.

>          arc |                  libpcap-1.7.4 | NOK | 
> http://autobuild.buildroot.net/results/7f5b393f8b99172a5b9cd1a4aee7e94b755f4ce7/
> 

-Alexey
