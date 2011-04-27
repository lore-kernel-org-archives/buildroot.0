From: Ken McGuire <kenm@desertweyr.com>
Date: Tue, 26 Apr 2011 19:51:38 -0600
Subject: [Buildroot] devmem2
Message-ID: <1303869098.2489.67.camel@kenm-i7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use devmem/devmem2 on a daily basis.


On Tue, 2011-04-26 at 07:40 -0700, David Anders wrote:
> Peter,
> 
> yes we've had all this argument before and devmem in buildroot has
stayed the same and everyone has continued using devmem2. basically it
still boils down to the request that devmem2 not be removed from
buildroot.
> 
> Dave
> 
> 
> 

I was thrilled when this applet was added to Busybox (which I've been
using since 2002).
The last version of Busybox I use (for omap4) is 1.17.4 and its'
devmem.c applet was 93 lines including comments and 10 lines which were
commented out. The devmem2.c that I use every day is 79 lines including
comments. Having it as a busybox applet is a nice feature.
 
Unfortunately since the referenced changes, busybox's devmem is more
difficult to use, not impossible, just a pita because it is different
form devmem2 which I use on non busybox/uClibc/buildroot based systems
(the final software configuration). Now, I compile devmem2 outside of
Bulildroot, it just takes a few seconds and I have a little script to do
it when I change uclibc/libc versions or machine architectures.

Busybox, Buildroot and uClibc are great tools and I think that Buildroot
evolving into a mini-distro is not as really a "bad thing(tm)" as some
seem to think. Keep up the good work. 

That's my opinion, maybe the right thing to do is just remove devmem
from busybox, even devmem2 from the Buildroot "distro". I can live with
building it myself. 


   ...ken... aka cynfab aka GPSFan aka WA2VFN aka NGMB...




> 
> --- On Tue, 4/26/11, Peter Korsgaard <jacmet@uclibc.org> wrote:
> 
> > From: Peter Korsgaard <jacmet@uclibc.org>
> > Subject: Re: devmem2
> > To: "David Anders" <dave123_aml@yahoo.com>
> > Cc: "Peter Korsgaard" <jacmet@uclibc.org>, "Xianghua Xiao"
<xiaoxianghua@gmail.com>, "Bj?rn Forsman" <bjorn.forsman@gmail.com>,
buildroot at busybox.net
> > Date: Tuesday, April 26, 2011, 9:19 AM
> > >>>>> "David" == David
> > Anders <dave123_aml@yahoo.com>
> > writes:
> > 
> >  David> Peter,
> > 
> >  David> the primary commit that makes the devmem applet
> > unusable for
> >  David> most debugging is this one:
> > 
> >  David> commit 043246560fcd5bb7bfb2caa2db270c3c0e8e06f4
> >  David> Author: Denis Vlasenko <vda.linux@googlemail.com>
> >  David> Date:   Sun Oct 26 17:26:55 2008
> > +0000
> > 
> >  David>     devmem: make it more
> > script-friendly; don't do any reads
> >  David>      and output nothing if
> > writing was requested. -100 bytes
> > 
> > 
> >  David> for board bring up and general development, for
> > which devmem is
> >  David> primarily used, having devmem report the value
> > before the write
> >  David> is important, as well as reporting the value
> > after the write.
> > 
> > Ok, but adding a little shell wrapper to do that would be
> > simple to do.
> > 
> > Forcing 2 extra read actions isn't that nice, both for the
> > script-friendlyness, but also for registers where reads
> > have side
> > effects.
> > 
> > -- 
> > Bye, Peter Korsgaard
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
