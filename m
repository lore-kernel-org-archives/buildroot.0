From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 3 May 2020 16:10:25 -0600
Subject: [Buildroot] [PATCH 1/1] support/dependencies: set cmake version
 min to 3.15.3
In-Reply-To: <CALFsTFUYwj6ROx6kziiM2eCxjwD-4Qhtk+kNKHmga5OAbfOR=Q@mail.gmail.com>
References: <20200428054352.110007-1-james.hilliard1@gmail.com>
 <20200428080328.4a06266b@windsurf.home>
 <CALFsTFUYwj6ROx6kziiM2eCxjwD-4Qhtk+kNKHmga5OAbfOR=Q@mail.gmail.com>
Message-ID: <CADvTj4obwekwgr+cx70MQ=+87ZuVtqNiqmocPgGzDTEzceo7QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 2, 2020 at 2:27 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Hello,
>
> On Tue, Apr 28, 2020 at 9:04 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Mon, 27 Apr 2020 23:43:52 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > This is required by uvw.
> > >
> > > Fixes:
> > > http://autobuild.buildroot.net/results/ab6/ab6954a65fd6d43c0674cb7a38a941102cb0dfe3/build-end.log
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > The CMake version required by uvw was suddenly bumped from 3.2 to
> > 3.15.3 in upstream commit 55d7782af5654cde8bba89071e13d240fd27ff3b.
> >
> > From a quick look of it, I don't really see why it was bumped "so
> > high". Could you instead try to revert to a minimum CMake version of
> > 3.10 in uvw, and see if it builds ?
>
> I tried to build the package with CMake 3.10 and it failed with:
> CMake Error at CMakeLists.txt:22 (project):
>   No CMAKE_HOMEPAGE_URL_COMPILER could be found.
>
>   Tell CMake where to find the compiler by setting the CMake cache entry
>   CMAKE_HOMEPAGE_URL_COMPILER to the full path to the compiler, or to the
>   compiler name if it is in the PATH.
>
>
> The minimum version I managed to compile with is 3.12
Upstream seems to think the minimum is 3.13 see discussion here:
https://github.com/skypjack/uvw/issues/194
> >
> > Thanks,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> Regards,
> Asaf.
