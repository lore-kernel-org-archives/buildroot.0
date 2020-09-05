From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 5 Sep 2020 09:20:30 -0700
Subject: [Buildroot] More maintainers
In-Reply-To: <877dt8n2o7.fsf@dell.be.48ers.dk>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <20200827223956.7cb87050@windsurf.home> <20200829095023.GC14354@scaer>
 <CAFSsvmrUXjQBJ5XDu2NZayp5AWttbf_DomgVOB0iaKcHuzbCBw@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
Message-ID: <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 4, 2020 at 11:44 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Christian" == Christian Stewart <christian@paral.in> writes:
>
>  > Hi Peter,
>  > On Fri, Sep 4, 2020 at 2:10 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >> I think it is unrealistic to think that review bandwidth won't always be
>  >> an issue. Given the meta nature (a build system of buildsystems) of
>  >> Buildroot, no automation will ever be a substitute for real human
>  >> review.
>
>  > "No robotic pilot can ever beat a human!"
>
>  > I think you're right about architectural changes, there's probably
>  > some maintenance tasks that could be fully automated (at least for
>  > approval) with some rules. The most simple example would be upgrades:
>  > auto bump version + hash -> e2e test in Docker container -> manual
>  > review period of 2-3 days -> merge. If any issue in this process, open
>  > a bug report w/ the results.
>
> Possibly, but what would that solve? We are not really lacking in
> version bumps, are we? And trivial version bumps are typically applied
> very fast.
>
> The issue for any such testing is the number of combinations to get good
> test coverage is very big, which is why we have the autobuilders to
> catch things like "bumping foo breaks building bar when package x is
> enabled and building for architecture y with toolchain version z" (an
> extreme example, but it does happen).
>
> I don't think adding more automation for these trivial version bumps
> will make any significant change to our backlog.
>
> But sure, we could do the basics, E.G. check-package and perhaps even
> building a basic config. That could cover basic issues and would have
> the advantage that the contributor gets fast feedback. It naturally also
> means quite a bit more mails on the list (E.G. to send a reviewed-by or
> any issues found).
>
>
>  >> So yes, lets please discuss concrete improvements to the automation
>  >> checks we already have or ways to get more people to help review rather
>  >> than yet another discussion about the merits of pull requests versus
>  >> emails.
>

Commit 9faba29108e74eb4acab21f5919dfab0288b23ac broke systemd with
busybox in the stock Buildroot configuration.

An incredibly simple test:
Download the tarball
select systemd
make

Not only was this incredibly embarrassing yesterday when I was showing a
client how to update Buildroot, but it could have been prevented with a basic
CI/CD test. I don't have to mention how much guff I would have received from
the maintainers if I had submitted a patch like that without a simple test.

>  > One thing I'm working on right now is automated testing on
>  > cross-compile targets - like Odroid, Raspberry Pi, etc, with network
>  > boot + watchdog of course.
>
>  > Probably with a very extensive test matrix, it could be possible to
>  > allow very small patches to be merged automatically to "next" with a
>  > qualifying # of reviewed-by?
>
> More testing is certainly good, but aren't those "very small patches"
> already getting applied to next pretty fast? Actually applying a patch
> is a single git command so that doesn't take a long time.
>
I have had several small patches in the past sit for months if not almost years
before being applied. Including an OpenJDK bump that took over 3 months.

In fact, just looking at the list right now, a simple patch that has
been reviewed
AND tested is still sitting from 2019:
https://patchwork.ozlabs.org/project/buildroot/patch/20191029095736.16586-1-fontaine.fabrice at gmail.com/

Here's another:
https://patchwork.ozlabs.org/project/buildroot/patch/20191109185512.24139-2-jeremy.rosen at smile.fr/

Here's a simple test:
https://patchwork.ozlabs.org/project/buildroot/patch/20191112162325.529637-2-m.niestroj at grinn-global.com/

So this is demonstrably false, which is why a lot of us are growing
more frustrated.

Adam
> --
> Bye, Peter Korsgaard
