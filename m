From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 20 Nov 2015 21:01:28 +0000
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <20151120001552.51c1b21b@free-electrons.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
Message-ID: <1448053288.2964.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, 2015-11-20 at 00:15 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> J?r?me, Johan, Bernd, Yann, Martin, Gustavo, R?mi, Samuel, Alexey,
> Waldemar, Clayton, please read below, there are some interesting issues
> for you :-) Thanks !

[snip]

> > arc |                  mesa3d-11.0.4 | NOK | 
> > http://autobuild.buildroot.net/results/6baca535cf492f23112e39e4ced677a969e15d64/
>
>   CXXLD    gallium_dri.la
> collect2: error: ld terminated with signal 11 [Segmentation fault]
>
> Alexey, this looks like an ARC toolchain bug.

Indeed that we were able to reproduce and reported that issue as
9000976236 "Segmentation fault during mesa3d build" to our toolchain guys.
Hopefully will be fixed soon.

[snip]

> > arc |              util-linux-2.27.1 | NOK | 
> > http://autobuild.buildroot.net/results/75960db671807091fe9155aee9e46a6245e32590/
> 
> checking for prlimit... no
> configure: error: flock selected, but required timer_create function not available
> 
> Not sure. Alexey ?

Well I was trying to reproduce that locally but to no avail.
Indeed I tried to strip everything but "util-linux" from defconfig to save time so
might be that's the reason of my failed attempt.

Still google tells me there's a similar issue with MIPSEL, see
http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/build-end.log

So I would assume that's not just ARC. Still I'm going to start building full defconfig
from failed build and we'll see if I'll be able to trigger that same issue.

-Alexey
