From: Federico Pellegrin <fede@evolware.org>
Date: Tue, 23 Feb 2021 13:32:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4
 kernels
In-Reply-To: <CAM6O0ZjhQiAtPjSt12tUeSCW5MnbRY+r3hD2fSEbQTJmzWdr+Q@mail.gmail.com>
References: <20210129050312.12247-1-fede@evolware.org>
 <20210131232413.15c9ae9a@windsurf.home>
 <CAM6O0ZhoTAtjiFm1NhwWiUkfXnO=m0v0gVTb1=2C-Q3hwcnG8g@mail.gmail.com>
 <CAM6O0ZjhQiAtPjSt12tUeSCW5MnbRY+r3hD2fSEbQTJmzWdr+Q@mail.gmail.com>
Message-ID: <CAM6O0ZjyL0Fc=e19gJJefwuWV4+jCoR=NEtR9aE1nhydmy7g6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Very funny enough, I got a feedback today from the original author
soon after I sent the email to the list, giving an ok with his review.
So seems to be probably the right way to solve the problem, but still
needs to be merged and not sure how much this may take.

The feedback:

----
Thanks for the fix, I didn't notice pre 4.4 kernels don't have this defined
when I submitted that patch.

Reviewed-by: Kairui Song <kasong@redhat.com>
-----

Cheers!
Federico

Federico

Il giorno mar 23 feb 2021 alle ore 09:30 Federico Pellegrin
<fede@evolware.org> ha scritto:
>
> Hi Thomas,
> Just wanted to revive this thread/patch even if not with very useful
> info: pinged a few times in kexec mailing list but nothing yet, just
> one partecipant kindly forwarded directly also to the developer that
> wrote the specific code, but then everything stopped still sadly (~3
> week now since first patch post).
>
> For the time being we keep it as a local patch, I'm not sure how you
> proceed in buildroot in such cases.
>
> Cheers,
> Federico
>
>
> Il giorno mer 3 feb 2021 alle ore 11:15 Federico Pellegrin
> <fede@evolware.org> ha scritto:
> >
> > Hi Thomas,
> > I apologize for the very bad patch I sent last time, very sorry I
> > missed a level of patch indirection :-)
> >
> > I've just resubmitted a few moments ago, I hope it is fine this time.
> >
> > As for upstream: I contacted them on the kexec mailing list
> > (describing the problem, proposing informally the solution and asking
> > if a patch would be welcome) but got no response as of now. I will
> > wait a bit more and ping in case. I'm not really sure if they are
> > interested to support very old kernels (which may be somehow also true
> > for Buildroot, but I guess given that Buildroot proposes as of now
> > also that versions in the configuration stage, we should try to keep
> > all the tooling working with them as well)
> >
> > Many thanks!
> > Federico
> >
> >
> > Il giorno dom 31 gen 2021 alle ore 23:24 Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> ha scritto:
> > >
> > > Hello Federico,
> > >
> > > On Fri, 29 Jan 2021 06:03:12 +0100
> > > Federico Pellegrin <fede@evolware.org> wrote:
> > >
> > > > kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
> > > >
> > > > This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.
> > > >
> > > > Signed-off-by: Federico Pellegrin <fede@evolware.org>
> > >
> > > Thanks a lot for your contribution! However, we need all patches added
> > > to packages to have a proper commit log and Signed-off-by line, and be
> > > generated using git format-patch. Could you adjust your patch
> > > accordingly ?
> > >
> > > Also, did you submit this change to upstream kexec ?
> > >
> > > Thanks a lot!
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
