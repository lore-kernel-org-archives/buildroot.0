From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Aug 2016 18:37:17 +0200
Subject: [Buildroot] [PATCH] package/ncurses: fix build on noMMU uclinux
 targets
In-Reply-To: <20160821151658.lg64uhf5fy3mwzq7@tarshish>
References: <1471786682-18906-1-git-send-email-yann.morin.1998@free.fr>
 <20160821151658.lg64uhf5fy3mwzq7@tarshish>
Message-ID: <20160821163716.GB5780@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-08-21 18:16 +0300, Baruch Siach spake thusly:
> On Sun, Aug 21, 2016 at 03:38:02PM +0200, Yann E. MORIN wrote:
> > The ncurses buildsystem does not recognise 'uclinux' as being a 'linux',
> > so it falls back to generic checks, especially when trying to decide
> > what macros to define. So it misses defining absolutely required macros
> > when doing widechar, which break the bui,d.
> > 
> > But 'uclinux' is just a 'linux' like any other in this respect.
> > 
> > We fix both aclocal.m4 and the generated ./configure script because
> > ncurses does not autoreconf correctly (see comment in 0001-*.patch).
> > 
> > Fixes:
> >     http://autobuild.buildroot.org/?reason=ncurses-5.9
> 
> The failures shown in this link might change over time, so I'm not sure it is 
> good for a commit log message.

Well, even if the results it will return in the future will not
necessarily be the same of it does today, looking only to the results
that occured before that patch is applied would still be interesting.

(But there's nothing in the autobuild website to limit on date...)

Regards,
Yann E. MORIN.

> >     http://autobuild.buildroot.org/results/d5c/d5c787d34acbfc0c0c7bd8cc0e15b5bc2460d88a/
> >     http://autobuild.buildroot.org/results/fc4/fc4b41fb955c390913a879e0202760347ce29987/
> 
> These, on the other hand, are immutable.
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
