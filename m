From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 31 Jul 2015 15:14:32 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-30
In-Reply-To: <20150731063016.698F510159B@stock.ovh.net>
References: <20150731063016.698F510159B@stock.ovh.net>
Message-ID: <1438355672.4848.42.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2015-07-31 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-30
> ===============================
> 
>         success : 7  
>        failures : 6  
>        timeouts : 0  
>           TOTAL : 13 
> 
> Classification of failures by reason
> ====================================
> 
>              libselinux-2.1.13 | 5 
>                 gnuradio-3.7.5 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                 gnuradio-3.7.5 | NOK | 
> http://autobuild.buildroot.net/results/4dfb0ddcdfb61908e1601506373e990abf5647b7/

Interesting, gnuradio includes Boost and boom it fails in the same way as Boost:
------------------------->8-----------------------
boost::asio::detail::eventfd_select_interrupter::open_descriptors()':
/home/buildroot/build/instance-1/output/host/usr/arc-buildroot-linux
-uclibc/sysroot/usr/include/boost/asio/detail/impl/eventfd_select_interrupter.ipp:50:50: error: '__NR_eventfd' was not
declared in this scope
------------------------->8-----------------------

So once Boost is fixed gnuradio will be cured as well.

-Alexey
