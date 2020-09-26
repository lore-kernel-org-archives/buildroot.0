From: daggs <daggs@gmx.com>
Date: Sat, 26 Sep 2020 18:06:25 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
In-Reply-To: <20200926153910.009ca5ed@windsurf.hq.k.grp>
References: <20200926095550.27437-1-daggs@gmx.com>
 <20200926153910.009ca5ed@windsurf.hq.k.grp>
Message-ID: <trinity-191718b2-1823-476c-b87e-3f66019aba4b-1601136385289@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Saturday, September 26, 2020 at 4:39 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
>
> Hello,
>
> Thanks for the patch. There are however a few coding style issues.
> First, the commit title must always have the following format:
>
> 	package/<foo>: <something>
>
> I.e you forgot the package/ prefix.
you are correct, I've forgot about this, will fix

>
> On Sat, 26 Sep 2020 12:55:50 +0300
> Dagg Stompler <daggs@gmx.com> wrote:
>
> > dvb-apps fails to build with glibc 2.31 with the following error:
> > | dvbdate.c: In function set_time:
> > | dvbdate.c:312:6: warning: implicit declaration of function stime; did you mean ctime? [-Wimplicit-function-declaration]
> > |   312 |  if (stime(new_time)) {
> > |       |      ^~~~~
> > |       |      ctime
> >
> > this patch takes from the first entry in the reference fixes it.
> >
> > reference:
> >  1. https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-glibc-2.31.patch?id=eb705f892eae45b93306c1de1407c1c22ac23956
> >  2. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964223
>
> Please add a reference to the autobuilder failure, like this:
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/

frankly speaking, I had no idea this issue was marked by the autobuilder, I've encountered it when trying to build an image with dvb-apps installed.

I'll reference the failure in my next revision.

>
> > diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
> > new file mode 100644
> > index 0000000000..d404212b5e
> > --- /dev/null
> > +++ b/package/dvb-apps/0006-fix-glibc-2.31.patch
>
> All patches must have a description and Signed-off-by.
>
> Could you fix those details, and send an updated version? Thanks a lot!
>

as mentioned in the commit mail, I took the patch as is from the first reference.
I'll try to find a more detailed commit or will rewrite it.

Thanks,

Dagg.
