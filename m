From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 May 2018 16:10:55 +0300
Subject: [Buildroot] xfsprogs failing to build on your autobuilder
In-Reply-To: <CANQCQpaCKTZpFLoyBkYPxmNMvL=jx1uC7NVmN715_9RaNyEtRw@mail.gmail.com>
References: <20180509105314.2bc6d8d9@windsurf.home>
 <20180509091359.uqfkbtzw7xpuvht7@sapphire.tkos.co.il>
 <CANQCQpaCKTZpFLoyBkYPxmNMvL=jx1uC7NVmN715_9RaNyEtRw@mail.gmail.com>
Message-ID: <20180509131055.erysgpl6ercah6q5@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

On Wed, May 09, 2018 at 08:02:39AM -0500, Matthew Weber wrote:
> On Wed, May 9, 2018 at 4:13 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, May 09, 2018 at 10:53:14AM +0200, Thomas Petazzoni wrote:
> >> Hello Matt,
> >>
> >> Since yesterday, xfsprogs has started failing to build, but it seems to
> >> happen only your autobuilder (4 times so far):
> >>
> >>   http://autobuild.buildroot.net/?reason=xfsprogs-4.15.1
> >>
> >> xfsprogs hadn't failed to build since March 24th, and it suddenly
> >> started failing to build again (but with a different error) since
> >> yesterday, just on your autobuilder.
> >>
> >> It fails with:
> >>
> >> make[3]: *** No rule to make target `-lrt', needed by `xfs_scrub'.  Stop.
> >>
> >> I don't immediately in the commits from the last few days what could
> >> cause this. It fails on different architectures, with internal and
> >> external toolchains, with uclibc and glibc. Seems weird.
> >>
> >> Could you see if you can reproduce locally, and understand what's going
> >> on ?
> >
> > I think that the xfsprogs Makefile used check the host librt for the -lrt
> > dependency. This issue is a similar to the -lunistring dependency that
> > Buildroot commit a81601589 removed. Upstream developer Darrick J. Wong
> > indicated[1] that all this code is going to be removed in a future release. So
> > I think that bumping to v4.16.1 would fix the issue, but I didn't check that
> > yet.
> >
> > [1] https://patchwork.kernel.org/patch/10296957/
> 
> It does make sense why it just started as I just brought this U16.04
> autobuilder back online on 5/8.
> 
> I'll start a test of a bump to 4.16.1 (autobr failure and test-pkg).
> Baruch, shall I send a patch if it looks to resolve this issue or did
> you want to as you originated the comment?

Feel free to send a bump patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
