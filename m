From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 22 Dec 2019 13:50:00 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
In-Reply-To: <20191222110534.GA26395@scaer>
References: <20191222083707.3448-1-heiko.thiery@gmail.com>
 <20191222105754.188b7bd2@windsurf> <20191222100801.GR26395@scaer>
 <CAEyMn7aQSNzWDyPLi_g3mn+9Ze5ZxDYJ+mWp4m4TTMHUY6jrxg@mail.gmail.com>
 <20191222110534.GA26395@scaer>
Message-ID: <CAEyMn7ap+MRO=-fUv5uH8fOvZ9_MqHc9pb0hQuHhfyfajVpNsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am So., 22. Dez. 2019 um 12:05 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2019-12-22 11:56 +0100, Heiko Thiery spake thusly:
> > Am So., 22. Dez. 2019 um 11:08 Uhr schrieb Yann E. MORIN
> > <yann.morin.1998@free.fr>:
> > > On 2019-12-22 10:57 +0100, Thomas Petazzoni spake thusly:
> > > > On Sun, 22 Dec 2019 09:37:08 +0100
> > > > Heiko Thiery <heiko.thiery@gmail.com> wrote:
> > > > > - add sha256 tarball hash
> > > > > - add sha256 license hash
> > > > The source code for this package is fetched from Subversion. Are the
> > > > tarballs we create out of SVN repositories reproducible ? I guess so,
> > > > but let's loop in Yann Morin for some additional feedback on this.
> > > Seeing the dance we do in the git backend, and that we don't do it in
> > > the svn backend, I doubt the svn backend is reproducible...
> > >
> > > Yet, I just checked, and I indeed get the same sha256 as Heiko provided
> > > in this patch...
> > >
> > > Which prompted me in lookig at it. And we are not getting it from the
> > > svn repository, for the good reason that the repository is dead and
> > > off-line.
> > >
> > > Instead, we're getting in from s.b.o instead, and thus the reason why
> > > the sha256 is reproducible...
> > >
> > > Dang... :-(
> > >
> > > So I suggest we do indeed add this hash, because in the end, that's
> > > s.b.o providing it, so it is stable.
> >
> > Sorry, I didn't want to create this work ;-/ I just wanted to do some
> > cleanup for the stats. So I picked a simple package to improve.
>
> No problem. It was nice that you picked it up, because that made us
> notice the problem! :-)
>
> > I was not aware that special handling is needed for making builds
> > reproducible at this point.
>
> Yeah... Reproducibility is not a given. :-(
>
> The subversion backend would need some love for that, so if you have a
> bit of time on your hnads, that's be nice if you could tackle it (if
> you're interested).

If I will get the time I can take a look on. Is this implemented in
the dl-wrapper and co? And should it be treated like the git one?

> > By the way ... what does s.b.o mean?
>
> Sources.Buildroot.Org, our fallback mirror:
>
>     http://sources.buildroot.org/
>
> Regards,
> Yann E. MORIN.
>
> > > Regards,
> > > Yann E. MORIN.
> > >
> > > --
> > > .-----------------.--------------------.------------------.--------------------.
> > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > '------------------------------^-------^------------------^--------------------'
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
