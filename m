From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 24 Jun 2016 04:34:55 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-06-19
In-Reply-To: <20160620063029.16331102969@stock.ovh.net>
References: <20160620063029.16331102969@stock.ovh.net>
Message-ID: <1466742836.3244.20.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2016-06-20 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2016-06-19
> ===============================
> 
> ????????success : 2??
> ???????failures : 14?
> ???????timeouts : 0??
> ??????????TOTAL : 16?
> 
> Classification of failures by reason
> ====================================
> 
> ?????????????bluez_utils-4.101 | 3?
> ??????????????e2fsprogs-1.43.1 | 1?
> ?????????????????gflags-v2.1.2 | 1?
> ???????????????????libxcb-1.12 | 1?
> ???????????????libcap-ng-0.7.7 | 1?
> tinyalsa-f2a7b6d3d81bd337a5... | 1?
> ????????????????????mpv-0.17.0 | 1?
> ??????????libmicrohttpd-0.9.50 | 1?
> ?????????????????jack2-v1.9.10 | 1?
> ?????????????????mesa3d-11.2.2 | 1?
> ???????????????linux-pam-1.2.1 | 1?
> tvheadend-8e637f9f903f6d820... | 1?

With arc-2016.03 toolchain we're seeing quite a lot of failures here and there.
That's sort of expected because we switched to binutils rewritten from scratch.
So we're still ramping up with these new binutils. What is also important these
new rewritten binutils are in upstream already. I.e. upcoming binutils 2.27 will
have everything ARC-specific from arc-2016.03 plus some more fixes and
enhancements that we made since March.

And what we may do in Buildroot we may either wait for 2.27 binutils to be released
and then apply [backported from mainline master] patches on top of it to fix still
existing issues or alternatively we may start using so-called "engineering builds"
of binutils for ARC.

These "engineering builds" are basically snapshots [that pass internal review and
testing] made from our dev branch (arc-2016.09) on GitHub like the most recent
"arc-2016.09-eng004":?https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/releases/tag/arc-2016.09-eng0
04

We'd prefer to go with "engineering builds" simply because we foresee still a lot
of changes in ARC port of binutils (remember our port is in its childhood currently)
while upstream binutils see release about once a year. Which means adding fixes and
enhancements on top of 2.27 release at some point will become a support nightmare.

What do you guys think about all that?

-Alexey
