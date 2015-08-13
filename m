From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 13 Aug 2015 17:46:57 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-08-12
In-Reply-To: <20150813063012.56B7A101EC1@stock.ovh.net>
References: <20150813063012.56B7A101EC1@stock.ovh.net>
Message-ID: <1439488017.5209.19.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2015-08-13 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-08-12
> ===============================
> 
>         success : 6  
>        failures : 3  
>        timeouts : 0  
>           TOTAL : 9  
> 
> Classification of failures by reason
> ====================================
> 
>              libselinux-2.1.13 | 1 
>                  mesa3d-10.6.3 | 1 
>                   boost-1.58.0 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                   boost-1.58.0 | NOK | 
> http://autobuild.buildroot.net/results/3b26e44f9fb08220836ce0d2d474d052b4afb3b6/

This one is fixed with 
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3
in uclibc-ng. Probably we may want to push the same patch to original uClibc.


>          arc |              libselinux-2.1.13 | NOK | 
> http://autobuild.buildroot.net/results/4b2d6a802bd2dff5f9cfa37d2b2f930dd1f48bf3/

That's a known issue, out binutils guy is off until the end of the week, I expect to
get reply from him early next week. Sorry for that delay.

>          arc |                  mesa3d-10.6.3 | NOK | 
> http://autobuild.buildroot.net/results/e52c71a13e3bba0d7d2d17d9d37b4099ccacc029/

Most probably this is a generic issue:
------------------------->8--------------------
configure: error: gbm requires --enable-dri
------------------------->8--------------------

And indeed in configure command line I see both "--enable-gbm" and "--disable-dri".
Maybe Bernd may take a look at this one?

Looks similar to what he fixed in http://git.buildroot.net/buildroot/commit/?id=b65154c3e4e5c454359d1bef16ae33853cf383e7

-Alexey
