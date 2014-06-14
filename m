From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Fri, 13 Jun 2014 19:52:15 -0500
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAHkwnC8ud8QUt85XbHJfUnMvjXGbvWGtDqg_SuTyV_QJt2OUEw@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
 <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
 <20140606113148.464ff3c8@core2quad.morethan.org>
 <CAE9DZUTpc3+jAZKNi8mrDDTmZDyZUQ1Z_-aymUP6h743buZqRw@mail.gmail.com>
 <CAHkwnC8ZyLMTLeHH2CVDS__EQFU0bYcWWb12ppygreRDU70PPg@mail.gmail.com>
 <CAE9DZURzUZzenZMwfciAWQgQXFp7fbSg1wPHcJc54SCsmuUdhQ@mail.gmail.com>
 <CAHkwnC8ud8QUt85XbHJfUnMvjXGbvWGtDqg_SuTyV_QJt2OUEw@mail.gmail.com>
Message-ID: <CAE9DZUQhgXHBpRQX1Gzde3x4uOgXTHdqS3=b2pc7f6KCdD1jPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2014 at 4:23 AM, Fabio Porcedda <fabio.porcedda@gmail.com>
wrote:

> On Wed, Jun 11, 2014 at 7:41 PM, Dallas Clement
> <dallas.a.clement@gmail.com> wrote:
> > On Tue, Jun 10, 2014 at 4:32 AM, Fabio Porcedda <
> fabio.porcedda at gmail.com>
> > wrote:
> >>
> >> On Fri, Jun 6, 2014 at 6:45 PM, Dallas Clement
> >> <dallas.a.clement@gmail.com> wrote:
> >> > On Fri, Jun 6, 2014 at 11:31 AM, Mike Zick <minimod@morethan.org>
> wrote:
> <snip>
> >> > This is a good idea.  I think I've exhausted most of the other options
> >> > except for
> >> > commenting out .NOTPARALLEL in the top-level make.  If that doesn't
> >> > help,
> >> > I will definitely try breaking things up.  Thanks for the tip.
> >>
> >> Please let me know if you have any issue using top-level parallel make.
> >> I'm curently testing it and ironing it out.
> >>
> >> Best regards
> >> --
> >> Fabio Porcedda
> >
> >
> >> Please let me know if you have any issue using top-level parallel make.
> >> I'm curently testing it and ironing it out.
> >
> > So far, no serious issues.  It uncovered some hidden dependencies.  But I
> > was warned about this.  ;)
> >
> > Surprisingly, it did not speed up my build times at all.  Perhaps this is
> > due
> > to a complex dependency graph.
>
> Can you please send the graphs made by "make graph-depends" and
> "make graph-build" for both serial and parallel and the output of the
> time commands, i mean just the time command output not the complete
> log:
> "time make" and "time make BR2_JLEVEL= -j$((`getconf
> _NPROCESSORS_ONLN`+1))"?
>
> It's best if you don't attach those files to the email but use some
> other way, e.g. dropbox.
>
> Best regards
> --
> Fabio Porcedda
>

Fabio, I have some good news!  I had commented out the .NOTPARALLEL in the
top-level
makefile earlier, but I was not setting BR2_JLEVEL correctly, as I was
doing so from
a wrapper makefile.  Anyhow, parallel building is working for me now after
fixing my mistake.
When I started this journey, my build times were about 1 hour and 50
minutes.  After
enabling ccache they were reduced to about 1 hour.  With parallel package
building,
all 8 of my CPU cores are near 100% the whole time, and build times are now
only 14 minutes!!!

You are a beautiful man!  Thank you for all you have done to get this
working.

p.s.  If you still want me to collect the graphs, and time comparison for
parallel vs
not parallel, please let me know.  I also have more testing to do to verify
that there
are no unexpected run-time errors due to parallel building.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140613/12170b91/attachment.html>
