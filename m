From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 9 Jun 2014 15:10:32 -0500
Subject: [Buildroot] [UNSURE]Re:  autoconf caching
In-Reply-To: <CAB0FRst_Vp6Dq43Jeogo820TXOsU7u101CJOOu26G2XEa4k0Pg@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140607110432.3e52d064@free-electrons.com>
 <CAB0FRst_Vp6Dq43Jeogo820TXOsU7u101CJOOu26G2XEa4k0Pg@mail.gmail.com>
Message-ID: <CAE9DZURuLUrvh2HgM9YmnZmrsb9YOkAn+nmiJaTOC8YQgtTsug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 8, 2014 at 3:19 AM, Fran?ois Perrad <francois.perrad@gadz.org>
wrote:

> 2014-06-07 11:04 GMT+02:00 Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>:
> > Dear Dallas Clement,
> >
> > On Fri, 6 Jun 2014 11:14:15 -0500, Dallas Clement wrote:
> >
> >> Hi Thomas.  Thanks very much for looking at my configuration.  I think
> you
> >> certainly nailed it.
> >> I have a lot of packages, and perl and mysql especially are taking a
> long
> >> time.  My build recipes
> >> for both of these are a year or two out of date.  In fact, my perl
> recipe
> >> is still using qemu to build
> >> instead of perl cross.  Hopefully updating this recipe will help some,
> >> though as you pointed out
> >> it is still using MAKE1.
> >
> > Right. I'll send a separate e-mail to Fran?ois Perrad about this (our
> > Perl guy), because it seems like other build systems are building Perl
> > in parallel.
> >
>
> The build of perl with qemu takes very very long time.
> The build of perl with perl-cross takes the same time as Linux Kernel
> for example.
> Parallel build with perl-cross seems not supported (this needs a
> confirmation of Alex Suykov, the author of perl-cross).
>
> Fran?ois
>
> >> Yep, very speedy SSDs and 64 GB for RAM.  Because of all the
> serialization
> >> in this build process,
> >> building from a large ram disk seems to make little difference.
> >
> > Right. So you have a good build configuration, there's not much we can
> > do here.
> >
> >> > There is another thing that strikes out in your configuration: there
> >> > are many packages that we don't have in Buildroot, and that don't seem
> >> > to be specific to your company or project. What about submitting your
> >> > new packages upstream?
> >>
> >> Yes, I can certainly do that.  There's a lot here.  Much of it is
> obscure.
> >> Please let me know which ones you are most
> >> interested in.
> >
> > Could you make a list of the packages that you've added, and that are
> > open-source? I'm pretty sure a majority of them could potentially be
> > useful to have in Buildroot.
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Free Electrons
> > Embedded Linux, Kernel and Android engineering
> > http://free-electrons.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>

The build-time histograms in buildroot now are so cool!  The three biggest
hogs in my rootfs are perl, icu, and xerces, all of which are MAKE1, and
the lion's share of this time is compilation.  It would sure help me a lot
if we could somehow get these guys to parallel make.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140609/6d7270df/attachment.html>
