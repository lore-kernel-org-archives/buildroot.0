From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Fri, 30 Oct 2015 22:52:46 +0900
Subject: [Buildroot] [meiwaku] Re:  [PATCH v3 1/1] gauche: new package
In-Reply-To: Your message of Fri, 30 Oct 2015 13:51:16 +0100.
 <563367C4.40607@mind.be>
Message-ID: <201510301352.t9UDqler021783@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, Arnout.

Thank you for your comment.

Arnout Vandecappelle writes:
> On 30-10-15 12:49, Hiroshi Kawashima wrote:
> > Gauche is an R7RS Scheme implementation developed to be a handy script
> > interpriter, which allows programmers and systemadministrators to write
> 
>  interpreter
Ok.

> > small to large scripts for their daily chores. Quick startup, built-in
> > system interface, native multilingual support are some of my goals.
> 
>  my -> its
>  Same comments for the help text, obviously.
Ok.

> > --- /dev/null
> > +++ b/package/gauche/0001-fix-so-suffix.patch
> > @@ -0,0 +1,18 @@
> > +With uclibc configuration, $host does not match to '*-linux-gnu-*'.
> 
>  uclibc or musl. Oh, and it's gnu*, not gnu-*, otherwise ARM's gnueabi would
> also not match.
Ok.

> > +I touch configure instead of configure.ac because autoreconf failed
> > +by version mismatch of autotools.
> 
>  Then also include the fix for configure.ac in the same patch, and of course
> please send the patch upstream so we don't have to carry it forever.
Ok, I will.

> > +GAUCHE_VERSION = 0.9.4
> > +GAUCHE_SOURCE = Gauche-$(GAUCHE_VERSION).tgz
> > +GAUCHE_SITE = http://prdownloads.sourceforge.net/gauche
> 
>  That will lead to the annoying sourceforge redirect page. Instead, point
> directly to http://downloads.sourceforge.net/project/gauche/Gauche
Ok.

> > +GAUCHE_LICENSE = BSD
> 
>  BSD doesn't exist, it's BSD-4c, BSD-3c or BSD-2c. In this case, it's BSD-3c.
> 
>  Also, there's a bunch of other licenses mentioned in COPYING. Many of them a
> re
> BSD-3c, one of them is "You may do as you please" so that's included in BSD-3
> c,
> and boehm-gc has its own license so call it Boehm-gc (couldn't find it on SPD
> X).
> srfi-11.scm has a home-grown license we can call SRFI (also not found on SPDX
> ),
> and reload.scm has another home-grown license so we'll call it reload license
> .
> Are the latter two files actually used (i.e., if you remove them, does it sti
> ll
> work)?
> 
>  In summary, it should be:
> 
> GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
Thank you for your investigation.
I will change as yours.

I will send v4 patch later.

Thank you!
Kawashima
============================================================
    Hiroshi Kawashima
