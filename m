From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 16:12:09 +0200
Subject: [Buildroot] [PATCH 23/30] package/matchbox: drop useless
 dependencies
In-Reply-To: <20150502134042.GD13701@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <0f88fac02eba1f18605db80731bfb130d00721cb.1429725549.git.yann.morin.1998@free.fr>
 <5543E50C.2080602@mind.be> <5543E904.5010600@mind.be>
 <20150502134042.GD13701@free.fr>
Message-ID: <20150502141209.GE13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-02 15:40 +0200, Yann E. MORIN spake thusly:
> On 2015-05-01 22:58 +0200, Arnout Vandecappelle spake thusly:
> > On 01/05/15 22:41, Arnout Vandecappelle wrote:
> > > On 22/04/15 20:09, Yann E. MORIN wrote:
> > >> xlib-libXft is only needed when building a 'standalone' matchbox, which
> > >> means not using matchbox-lib.
[--SNIP--]
> > >  So, is the dependency on xlib_libXft a few lines lower still relevant? If so,
> > > comment on it in the commit message.
> > 
> >  It actually is, configure checks for it and it is used in the code. So
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > but I'd still like it to be mentioned in the commit message.
> 
> Well, not sure. AFAICS, checks for libxft are done only when either
> standalone or standalone-xft is specified. Also, Xft is only used in
> src/mbtheme-standalone.c, which as its name implies, is the standalone
> mode.
> 
> So, I'll remove that dependency in the patch that disable standalone
> mode (pending a test-build without libXft, but pretty confident it'll
> work, nothing selects it in matchbox, I never manually selected it, and
> all my previous builds were successfull).

OK, the build goes on successfully as expected.

So I'll drop the dependency on libXft.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
