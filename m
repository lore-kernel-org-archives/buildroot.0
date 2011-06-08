From: =?ISO-8859-9?B?QWxwZXIgWf1sZP1y/W0=?= <yildirimalper@gmail.com>
Date: Wed, 8 Jun 2011 23:11:47 +0300
Subject: [Buildroot] [RFC] Review request for branch
	for-2011.08/bootloaders
In-Reply-To: <20110530223403.0f8fcbd4@surf>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
	<BANLkTim_Bb3fRZcC4rT2ofpF7GhuroUULA@mail.gmail.com>
	<20110530223403.0f8fcbd4@surf>
Message-ID: <BANLkTim570iiTkV3F5vg_zF__jgWaLdqjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
D?sol? pour la r?ponse tardive

2011/5/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> G?nayd?n Alper!
>
> On Mon, 30 May 2011 22:53:11 +0300
> Alper Y?ld?r?m <yildirimalper@gmail.com> wrote:
>
> > Thanks for the comprehensive work. I have a suggestion, maybe you can also
> > implement this within the context of your work.
> > In our project, we have some local applications, hosted under local git
> > repositories. We are currently using the package infrastructure with git. If
> > we give a commit id or tag name everything is fine but in some use cases we
> > want to build the latest commit (HEAD) with buildroot. In that case, giving
> > HEAD as the version is not sufficient, since buildroot checks the dl dir for
> > pkgname-HEAD.tar.gz and finds it there after first build. Currently we
> > manually delete this file and force buildroot to clone the repo again. In my
> > opinion this is not the proper way.
> >
> > My suggestion is:
> > For the first build, clone the git repo to the build directory and for the
> > next builds make a git pull in the build directory.
> >
> > It would be nice to have such an option in buildroot.
>
> I think I understand your workflow and your need. However, I
> unfortunately don't think your proposal works properly: the next time
> you will do "make clean", the build directory of your package will have
> disappeared, so Buildroot won't know that it should do a "git pull",
> and will use again the pkgname-HEAD.tar.gz file from the dl directory.
> Or maybe I misunderstood your proposal ?
>
> In your case, wouldn't it be better to not let Buildroot download your
> custom applications from Git, but rather give Buildroot the path to a
> directory where you have the source of code of the applications ? This
> way, you can handle this directory however you want in terms of
> ?revision control: Buildroot will never remove it.
>
> What do you think of the proposal I've sent on May, 18th ? See
> http://lists.busybox.net/pipermail/buildroot/2011-May/043320.html.

I read your proposal. It totally implements what we want from buildroot.
It will definitely solve our "buildroot usage" problems.
I will write my comments to that thread.

Thanks for your support.
Cheers
Alper

> Thanks for your suggestion!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
