From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jun 2017 23:27:20 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170606213500.0fe44a79@free-electrons.com>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
 <20170606213500.0fe44a79@free-electrons.com>
Message-ID: <20170607212720.GA23160@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, Thomas, All,

On 2017-06-06 21:35 +0200, Thomas Petazzoni spake thusly:
> On Tue, 6 Jun 2017 19:56:59 +0200, Waldemar Brodkorb wrote:
> > We do not support uClibc-ng/musl C library version choice support,
> > do the same for GNU C Library.
> > Add me as Maintainer for the package.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> 
> On this one, I'd like to have the opinion of others. Arnout? Peter?
> Yann? What do you think about this?
> 
> I don't have a very clear-cut opinion about this one.

Neither do I.

On principle, I agree that we should drop versions. But glibc is part of
the toolchain, and the toolchain has always been special.

True, we do not have a version for uClibc-ng, but we do have some
traction on the maintainer! ;-) So we know things are gonna be fixed
soonish, or that we can grab a temporary backport, both very easily.

Not so much for glibc in my experience...

musl is another kind of thing, because it is (was?) moving relatively
fast, and I am under the impression that the maintainers are somewhat
amenable to some fixes.

Not so much for glibc in my experience...

So, I won't oppose the patch, not will I push for it...

Yep, that is a very clear-cut position... ;-]

Regards,
Yann E. MORIN.

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index cdd38e6..bfeb824 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1686,6 +1686,7 @@ F:	arch/Config.in.sparc
> >  F:	package/uclibc/
> >  F:	package/uclibc-ng-test/
> >  F:	package/mksh/
> > +F:	package/glibc/
> 
> Alphabetic ordering not correct here.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
