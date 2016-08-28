From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 18:47:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
In-Reply-To: <20160731230102.070d5413@free-electrons.com>
References: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
 <1469969267.9042.2.camel@embedded.rocks>
 <20160731160517.GJ3620@tarshish>
 <20160731230102.070d5413@free-electrons.com>
Message-ID: <20160828164701.GC5758@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, Baruch, All,

On 2016-07-31 23:01 +0200, Thomas Petazzoni spake thusly:
> On Sun, 31 Jul 2016 19:05:17 +0300, Baruch Siach wrote:
> 
> > netbsd-queue is a header only package, so it adds nothing to packages that 
> > don't use it. libglob adds libglob.so that is only useful for few packages. We 
> > can do something similar to way we handle gettext by adding
> > 
> >   select BR2_PACKAGE_LIBGLOB if BR2_TOOLCHAIN_USES_MUSL
> > 
> > for each such package.
> 
> Agreed.

In the meantime, the release is approaching, and libglob is not yet in
the tree.

So I think we should just hide openswan for musl, at least until after
the release.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> BTW, the other day I was wondering if we shouldn't add another dummy
> package for musl that adds the <sys/cdefs.h> header. It's supposedly an
> internal glibc header but *lots* of packages use the __BEGIN_DECLS /
> __END_DECLS definitions, and it's really annoying to fix them all, for
> not a huge benefit.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
