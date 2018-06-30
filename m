From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 30 Jun 2018 12:17:35 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-29
In-Reply-To: <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
References: <20180630060034.AFC6220A33@mail.bootlin.com>
 <f38c57af-44a3-2766-2512-1f0e9f4f4f98@gmail.com>
Message-ID: <CAMWSM7icLBAbxF9OmTCSPr5qXjeNZJBa7ddZP9SbdHpVmY03jg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 30, 2018 at 11:30 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> Hi,
>
> Le 30/06/2018 ? 08:00, Thomas Petazzoni a ?crit :
> > Hello,
> >
> > Build statistics for 2018-06-29
> > ===============================
> >
> >       branch |  OK | NOK | TIM | TOT |
> >    2018.02.x |  19 |   2 |   0 |  21 |
> >    2018.05.x |  16 |   1 |   0 |  17 |
> >       master | 141 |  44 |   0 | 185 |
> >
> > Results for branch 'master'
> > ===========================
> >
> > Classification of failures by reason
> > ------------------------------------
> >
> >                host-llvm-6.0.0 | 2
> >
> > Detail of failures
> > ------------------
> >
> >          arm |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/84222a111d7a4cecb14f9fb280ff5763d61ed592 |
> >       x86_64 |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/d9265c7a1f9d6568d0a187dc52a08168e1954c91 |
>
> It seems that gcc 8.1.1 from the host (ArchLinux) is buggy, there is no such
> error with a Fedora 28 with gcc 8 installed.
>

I'm wondering if it really is an Arch bug, or something else, because
the problem is not consistently reproducible. It seems to only happen
a fraction of the time, and I can run make again on the exact same
config after GCC segfaults, and the build will finish.

Could be a hardware problem. I remember reading about a segfault issue
with Ryzen chips during parallel compilation, though Threadripper
chips, which this was built on, weren't supposed to be affected.

I have a few Arch systems with Intel chips I can use to see if I can
reproduce the issue. That would at least tell us if it *is* an Arch
bug, or a hardware problem.

> Thanks Romain for the analysis. Joseph, could you bring this up to the
> Archlinux maintainers ?

Absolutely, I'll do some testing and follow up.
