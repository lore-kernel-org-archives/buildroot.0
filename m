From: LP C <lpdev@cordier.org>
Date: Sun, 26 May 2019 16:08:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <112312f0-39bd-e416-d8db-431b3dca27f4@mind.be>
References: <112312f0-39bd-e416-d8db-431b3dca27f4@mind.be>
Message-ID: <1558874852.local-6573d1a7-8bd6-v1.5.5-b7939d38@getmailspring.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On May 25 2019, at 5:31 pm, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 13/05/2019 17:59, Julien Boibessot wrote:
> > Thomas,
> >
> > On 13/05/2019 13:31, Thomas Petazzoni wrote:
> > > Hello,
> > >
> > > On Mon, 13 May 2019 13:20:54 +0200
> > > Julien Boibessot <julien.boibessot@free.fr> wrote:
> > >
> > > > I have already brought this problem up a few times before but no one has
> > > > a clue.
> > > > My build system is consuming 100% CPU in conftest process when building
> > > > libsodium.
> > > >
> > > > In this state I have to manually kill all conftest processes otherwise
> > > > the build is blocked for days... :-)
> > >
> > > Which configure test is it running when it's blocked ?
> >
> >
> > when host-libsodium fails I would say it is blocked on:
> > /checking whether segmentation violations can be caught when using the C
> > compiler.../
>
>
> I've taken a look at the code of that test. There's nothing really wrong with
> it, but it's pretty much undefined behaviour so the compiler is free to do
> stupid things.
>
> Fortunately, we know that SIGSEGV can be caught since we know we're building on
> Linux, and anyway we don't care a lot for host-libsodium. So we can just set the
> cache variable ax_cv_check_cCATCHABLE_SEGV=yes.
>
> Regards,
> Arnout
>
> >
> >
> > > What does
> > > "strace" says about this conftest process that is stuck ?
> > >
> > > Can you reproduce manually ? Does it happen every time libsodium is
> > > built on your machine, or only once in a while ?
> >
> >
> > It sometimes can be reproduced manually but not as often as from BR build system.
> > I would say when it fails from BR build, I can kill it and reproduce the problem
> > once.
> >
> > Most of the time it works well when build manually.
> > Best regards,
> > Julien
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot

Hi Thomas,
https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-multimedia/libva/intel-media-driver/0001-linux-fix-build-when-using-musl.patch
seems to fix the issue with musl. This patch does not break the build with standard libc. As it is a patch from yocto, can I use it directly or is there any license restriction to do so?
Thanks,
LP
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190526/1e3ffd0e/attachment.html>
