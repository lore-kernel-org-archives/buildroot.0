From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 10 Aug 2015 13:38:10 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-07
In-Reply-To: <20150809000631.487d0954@free-electrons.com>
References: <20150808063018.735131014E7@stock.ovh.net>
 <20150809000631.487d0954@free-electrons.com>
Message-ID: <1439213890.4848.36.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2015-08-09 at 00:06 +0200, Thomas Petazzoni wrote:
> Hello all,
> 
> Bernd, Alexey, Angelo, Vicente, Will, see below there are some
> questions for you! :-)

> >          arc |                   boost-1.58.0 | NOK | 
> > http://autobuild.buildroot.net/results/2658feb999f457c4d88342f822c03aa7f9f983ed/
> >          arc |                   boost-1.58.0 | NOK | 
> > http://autobuild.buildroot.net/results/2e3e004d1b53e9b01d6071452ab2c95c1855f0d7/
> 
> Alexey, still the same issue. Should I make boost unavailable on ARC for now?

Well I'd like to have boost on arc because it is used by other software packages.
See discussion in a separate thread.

There should be a way to fix it finally :)

> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/f252d616c90829304f5c5c4d7a25012b40769c62/
> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/7f871263c2342e050034e359870cde72b6ddb986/
> >          arc |              libselinux-2.1.13 | NOK | 
> > http://autobuild.buildroot.net/results/e92bcb6a3b671fe61453d5c616ef6e4e8e31a150/
> 
> I'm tempted to mark libselinux as not available on ARC for the moment.
> Alexey?

Ok I got this reproduced and filed internal bug report as STAR 9000937132.
If we may wait another couple of days let's wait otherwise please disable it for
ARC for now. I had to report this problem a while back.

IMHO it worth waiting. Usually fix follows in few days. 


> >          arc |                    tinc-1.0.24 | NOK | 
> > http://autobuild.buildroot.net/results/2b1aa474fc432f3f79b03c4577d68642bb7e0f9c/
> >          arc |                    tinc-1.0.24 | NOK | 
> > http://autobuild.buildroot.net/results/e16588f02f1f576e8769ddd7be997904fdfd5ba1/
> 
> BFD (GNU Binutils) 2.23.2 assertion fail elf32-arc.c:3074
> 
> Alexey, that's a toolchain issue.

Another PIE thingy. fixed with http://patchwork.ozlabs.org/patch/505645/

-Alexey
