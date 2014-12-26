From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Dec 2014 21:53:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/kismet: fix ncurses static build
In-Reply-To: <20141226210112.224245f6@free-electrons.com>
References: <cover.1419615048.git.yann.morin.1998@free.fr>
 <bc13bcfd2fff0fa2c313edad80d220ef5e34e567.1419615048.git.yann.morin.1998@free.fr>
 <20141226210112.224245f6@free-electrons.com>
Message-ID: <20141226205332.GG3982@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-26 21:01 +0100, Thomas Petazzoni spake thusly:
> On Fri, 26 Dec 2014 18:33:08 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/package/kismet/0003-fix-curses-libs-ordering.patch b/package/kismet/0003-fix-curses-libs-ordering.patch
> > new file mode 100644
> > index 0000000..c5e7eff
> > --- /dev/null
> > +++ b/package/kismet/0003-fix-curses-libs-ordering.patch
> > @@ -0,0 +1,52 @@
> > +configure: fix ordering of ncurses libraries
> > +
> > +Says Vicente:
> > +    [T]he order is very important when doing static builds.
> > +    Otherwise we will see errors like this one:
> > +
> > +    [...]/sysroot/usr/lib/libpanel.a(p_delete.o):
> > +    In function `del_panel':
> > +    p_delete.c:(.text+0x68): undefined reference to `_nc_panelhook'
> > +
> > +Fix the order configure adds libraries: new libraries should be added
> > +at the *front* of the list, not at the end.
> 
> So this is only talking about library ordering.
> 
> > +-# Add additional cflags since some distros bury panel.h
> > +-CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
> 
> But the patch also removes some invalid -I path.

Damn, that was supposed to go in a separate patch.

I'll fix. Thanks for spotting.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
