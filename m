From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Wed, 11 Jun 2014 12:41:27 -0500
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAHkwnC8ZyLMTLeHH2CVDS__EQFU0bYcWWb12ppygreRDU70PPg@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140606113148.464ff3c8@core2quad.morethan.org>
 <CAE9DZUTpc3+jAZKNi8mrDDTmZDyZUQ1Z_-aymUP6h743buZqRw@mail.gmail.com>
 <CAHkwnC8ZyLMTLeHH2CVDS__EQFU0bYcWWb12ppygreRDU70PPg@mail.gmail.com>
Message-ID: <CAE9DZURzUZzenZMwfciAWQgQXFp7fbSg1wPHcJc54SCsmuUdhQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 10, 2014 at 4:32 AM, Fabio Porcedda <fabio.porcedda@gmail.com>
wrote:

> On Fri, Jun 6, 2014 at 6:45 PM, Dallas Clement
> <dallas.a.clement@gmail.com> wrote:
> > On Fri, Jun 6, 2014 at 11:31 AM, Mike Zick <minimod@morethan.org> wrote:
> >>
> >> On Fri, 6 Jun 2014 11:14:15 -0500
> >> Dallas Clement <dallas.a.clement@gmail.com> wrote:
> >>
> >> > > Seems a fairly decent setup. You have enough RAM, and a good storage
> >> > > system (ideally based on SSDs) ?
> >> >
> >> > Yep, very speedy SSDs and 64 GB for RAM.  Because of all the
> >> > serialization in this build process,
> >> > building from a large ram disk seems to make little difference.
> >> >
> >>
> >> Having 7 of your 8 cores sitting in their idle loop is probably your
> >> #1 thing to address. . . .
> >>
> >> With a very large selection of packages, perhaps you could split them
> >> into several (8, 9?) Buildroot trees.
> >> Then run those buildroot instances as jobs at the same time.
> >>
> >> Or...
> >>
> >> At least pull the really big time consumers out, into their own BR
> >> instance, and use your idle cores on those.
> >>
> >> Mike
> >>
> >
> >> Having 7 of your 8 cores sitting in their idle loop is probably your
> >> #1 thing to address. . . .
> >
> > Yes, makes me sick to have them just sitting there...
> >
> >> With a very large selection of packages, perhaps you could split them
> >> into several (8, 9?) Buildroot trees.
> >
> > This is a good idea.  I think I've exhausted most of the other options
> > except for
> > commenting out .NOTPARALLEL in the top-level make.  If that doesn't help,
> > I will definitely try breaking things up.  Thanks for the tip.
>
> Please let me know if you have any issue using top-level parallel make.
> I'm curently testing it and ironing it out.
>
> Best regards
> --
> Fabio Porcedda
>

> Please let me know if you have any issue using top-level parallel make.
> I'm curently testing it and ironing it out.

So far, no serious issues.  It uncovered some hidden dependencies.  But I
was warned about this.  ;)

Surprisingly, it did not speed up my build times at all.  Perhaps this is
due
to a complex dependency graph.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140611/e29b9ecb/attachment.html>
