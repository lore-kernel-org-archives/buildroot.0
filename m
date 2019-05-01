From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 2 May 2019 00:15:41 +0200
Subject: [Buildroot] Buildroot does not try to find/use the
 system-installed meson
In-Reply-To: <a7227af9-dcc7-7984-0d2e-444d1557d8ed@mind.be>
References: <CADYdroNf-GCbQVe5bZ1SU4D4aphJbnWPL_phiSLxLZb8DCv9wQ@mail.gmail.com>
 <a7227af9-dcc7-7984-0d2e-444d1557d8ed@mind.be>
Message-ID: <CADYdroM8dPrVxmCAWyXBsahvNwqaTDzkH0yiFWedprsN3w9mXA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 1. Mai 2019 um 14:40 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
>
> On 30/04/2019 12:23, Norbert Lange wrote:
> > Hello,
> >
> > even though I have very recent meson installed, buildroot will go to
> > great lengths to build everything from source (including host-python3,
> > host-ninja and host-python which is a dependency of host-ninja for
> > some reason).
>
>  Cfr. [1].
>
> > Is there a good reason for this, or is this just a lacking feature for now?
>
>  The same question was asked [2] for the autotools packages (m4, autoconf,
> automake), and the same answer applies:
>
> >  The problem is rather that we don't *know* if there is some version dependency...
> >
> >  That said, I think we can just go ahead and try it, and rely on the
> > autobuilders to tell us if something doesn't work, and update the minimum
> > version of that tool accordingly.
> >
> >  Since we the oldest autobuilder we have is a CentOS6, I would use the versions
> > from that as the minimum as a start.
>
>  meson would definitely be much simpler to support than autotools, since you
> just have to check the meson and the ninja executables. And I think it's much
> more likely that an older meson still works.

Well, the checker-scripts in support/dependencies already do check for versions.
meson is extremely annoying because of the build time (including its
dependencies),
and should be not much worse of an issue than CMake.
Perhaps packages using a bleeding edge build could somehow override
the default min-version.

At worst, some env/config variable could whitelist using the system meson/ninja.

Regards, Norbert
