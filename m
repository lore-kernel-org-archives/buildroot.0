From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 30 Sep 2016 13:27:05 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-28
In-Reply-To: <20160930084255.07d4833e@free-electrons.com>
References: <20160929063048.6633A1049F9@stock.ovh.net>
 <20160930060433.GO1947@waldemar-brodkorb.de>
 <20160930084255.07d4833e@free-electrons.com>
Message-ID: <20160930112705.GQ1947@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Fri, 30 Sep 2016 08:04:33 +0200, Waldemar Brodkorb wrote:
> 
> > Thomas Petazzoni wrote,
> > 
> > >         m68k |                    nload-0.7.4 | NOK | http://autobuild.buildroot.net/results/b0d10b82f2308a92a8d6c8ac768c9efa2c1770b7  
> > 
> > This should be fixed by the update to uClibc-ng 1.0.18.
> > Tested here with the internal toolchain.
> 
> OK. Should I rebuild just the m68k toolchains with uClibc-ng 1.0.18, or
> are there potentially fixes or patches affecting other architectures as
> well?

I would prefer rebuilding all uClibc-ng toolchains as we get then a
good overview about the quality of the 1.0.18 release.
Furthermore all static/no-thread builds for other architectures are
affected by this release, a lot of issues regarding pthread_mutex_*
should be resolved. (libarchive issues,..)

May be the linker script fix should be applied before that.
I will sent the patch today.

Thanks in advance,
 Waldemar
