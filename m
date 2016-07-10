From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 18:54:12 +0200
Subject: [Buildroot] [PATCH] package/acpica: disable -Werror
In-Reply-To: <CAK4VdL3NbNaC8U6QnAz=bQZoh9s+YSo+qYcC9qfO=7vADzGbQQ@mail.gmail.com>
References: <1468160051-23957-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL3NbNaC8U6QnAz=bQZoh9s+YSo+qYcC9qfO=7vADzGbQQ@mail.gmail.com>
Message-ID: <20160710165412.GC3688@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enrico, All,

On 2016-07-10 18:37 +0200, Erico Nunes spake thusly:
> On Sun, Jul 10, 2016 at 4:14 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Fixes:
> >     http://autobuild.buildroot.org/results/d17/d1728c29e90d978405d24bb97f5c8687dc5a6165/
> >     http://autobuild.buildroot.org/results/2ec/2ecdf0e87a76781b66098d034768fc8de657faaa/
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/acpica/0001-build-do-not-use-Werror.patch | 62 +++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 package/acpica/0001-build-do-not-use-Werror.patch
> >
> > diff --git a/package/acpica/0001-build-do-not-use-Werror.patch b/package/acpica/0001-build-do-not-use-Werror.patch
> > new file mode 100644
> > index 0000000..4ccb4d4
> > --- /dev/null
> > +++ b/package/acpica/0001-build-do-not-use-Werror.patch
> > @@ -0,0 +1,62 @@
> > +From 9382ae2431d2962c430e7149302c8690f5bc159c Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Sun, 10 Jul 2016 15:06:15 +0200
> > +Subject: [PATCH] build: do not use -Werror
> > +
> > +Warnings come and go with various compiler versions, so using -Werror is
> > +prone to cause build failures with various compiler versions, especially
> > +newer versions that introduce new warnings.
> > +
> > +Remove use of -Werror.
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +---
[--SNIP--]
> I was taking a look at this issue before this patch, and it seems that
> of these errors with acpica are the same as one that has happened
> before for mips64, as in fixed by:
> https://patchwork.ozlabs.org/patch/521624/
> 
> I'm trying a similar patch to that to fix this error in acpica.

-Werror is a *development* opiton; it should not be used in a *release*.

Fact is, warnings are added with new versions of the compiler, so when
we update to a newer version and keep -Wall -Werror, and the code hits
such a new warning, we'd still get build issues for code that might even
be correct with an overly pessimistic compiler.

> In case you can wait a bit for that, maybe fixing it in the same way
> as micropython would be a patch easier to upstream.

Even if you manage to fix those very warnings, I still believe this
patch to be valid and applied.

Granted, we could turn it into something that is acceptable upstream, to
only enable (or disable) use of -Werror at will.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
