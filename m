From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 30 Jun 2018 12:28:56 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-29
In-Reply-To: <20180630212104.4254a15e@windsurf.home>
References: <20180630060034.AFC6220A33@mail.bootlin.com>
 <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
 <CAMWSM7icLBAbxF9OmTCSPr5qXjeNZJBa7ddZP9SbdHpVmY03jg@mail.gmail.com>
 <20180630212104.4254a15e@windsurf.home>
Message-ID: <CAMWSM7hhyRKyhcTVVP6zU=+xMr9o1-BFUQrmbhVmf9AhBv_+pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 30, 2018 at 12:21 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 30 Jun 2018 12:17:35 -0700, Joseph Kogut wrote:
>
> > > It seems that gcc 8.1.1 from the host (ArchLinux) is buggy, there is no such
> > > error with a Fedora 28 with gcc 8 installed.
> >
> > I'm wondering if it really is an Arch bug, or something else, because
> > the problem is not consistently reproducible. It seems to only happen
> > a fraction of the time, and I can run make again on the exact same
> > config after GCC segfaults, and the build will finish.
> >
> > Could be a hardware problem. I remember reading about a segfault issue
> > with Ryzen chips during parallel compilation, though Threadripper
> > chips, which this was built on, weren't supposed to be affected.
>
> I also believe it's a HW issue. Could you stop your autobuilder, until
> you figure out what's going on ?
>
> Having bogus build results really isn't helpful, as it gives a lot of
> noise to analyze and triage to find out what are the interesting things
> to look at.
>

That's completely understandable, I've stopped builds on the system
that's segfaulting until we can narrow it down some more.

> However, I very much welcome an installation like yours as part of the
> autobuilders, because you found out a number of issues that we had
> never found so far, and those are very useful to fix.
>
> > I have a few Arch systems with Intel chips I can use to see if I can
> > reproduce the issue. That would at least tell us if it *is* an Arch
> > bug, or a hardware problem.
>
> Would be good.
>

I've started an autobuilder on an Intel system running Arch. I'll keep
an eye on it, and if it reproduces the same issue, I'll file a bug
report with the Arch maintainers.
