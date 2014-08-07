From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Aug 2014 13:09:15 +0300
Subject: [Buildroot] [PATCH V2] gdb: allow building on AArch64 systems
In-Reply-To: <20140807120031.0c82d985@free-electrons.com>
References: <1407314534-5536-1-git-send-email-alex.bennee@linaro.org>
 <20140806194603.3a56a5e5@free-electrons.com>
 <87sil8k4sg.fsf@linaro.org>
 <20140807120031.0c82d985@free-electrons.com>
Message-ID: <20140807100915.GM23355@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
On Thu, Aug 07, 2014 at 12:00:31PM +0200, Thomas Petazzoni wrote:
> On Thu, 07 Aug 2014 10:46:47 +0100, Alex Benn?e wrote:
> 
> > > On Wed,  6 Aug 2014 09:42:14 +0100, Alex Benn?e wrote:
> > >> gdb has had AArch64 support since 7.6 which is now the default minimum
> > >> version of GDB in the tree. Older versions are now legacy.
> > >> 
> > >> Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
> > >
> > > Applied, thanks!
> > 
> > How are you applying the patches? I'm curious because while my local
> > patch shows up in the log with:
> > 
> > commit 0b729ce2baa9903e7d3520196f9fff16cdff24fa
> > Author: Alex Benn?e <alex.bennee@linaro.org>
> > 
> > The one in upstream is:
> > 
> > commit 4372449a4f8e16f763c7d5a0c125ca015a7cbef6
> > Author: alex.bennee at linaro.org <alex.bennee@linaro.org>
> > 
> > I'd usually assume utf-8 shenanigans tripping something up but I see the
> > repo does have names with more accents than mine ;-)
> 
> We're using pwclient, which downloads the patch from patchwork and
> applies it with "git am".
> 
> There's basically no chance for your local commit used to generate the
> patch to have the same SHA1 as the commit integrated in the official
> repository. Your commit applies on commit A, but it ends up applied on
> top of commit B. And since the SHA1 of the parent commit is part of
> what defines the next commit and therefore it's SHA1, there's no chance
> for your commit to have the same SHA1 in the official repo as in your
> local repo with the workflow we have.
> 
> SHA1 would be preserved if we were taking pull requests and merging
> those pull requests without rebasing them. But basically, by using "git
> am", we're rebasing all patches on top of the latest master when
> applying them, which changes their SHA1.

Alex was asking about author name, not commit ID. Compare:

Author: Alex Benn?e <alex.bennee@linaro.org>

Author: alex.bennee at linaro.org <alex.bennee@linaro.org>

I should note that the sign-off line preserves the name correctly.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
