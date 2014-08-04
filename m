From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Aug 2014 21:58:07 +0200
Subject: [Buildroot] [PATCH 0/2] Fix pkg-kconfig infra (branch
	yem/kconfig)
In-Reply-To: <e6001c6d-be6d-4d79-8136-88979fc1ea29@email.android.com>
References: <cover.1407172590.git.yann.morin.1998@free.fr>
 <e6001c6d-be6d-4d79-8136-88979fc1ea29@email.android.com>
Message-ID: <20140804195807.GC3875@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-04 20:13 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >Hello All!
> >
> >This series fixes a nasty regression introduced with the pkg-kconfig
> >infrastructure recently applied, whereby kconfig packages are always
> >rebuilt on each 'make'.
> >
> >The proposed fix consists in a post-configure hook, and I believe this
> >is enough to get us rolling for the next release.
> >
> >A better fix would be to move the call to 'oldocnifg' out of the
> >packages, and into the kconfig infra itself, but this is a bit more
> >involved. This could be done in -next (or maybe in master shortly after
> >-rc1 if possible).
> 
> For uclibc, the oldconfig call is actually part of the fixup commands,
> so no problem there, right?

Right, I did look at it, and it should work OK.

> What if we do the same for busybox?

Well, I do not know what your plans are for the other kconfig packages,
so I came up with the hook solution, because it is fool-proof against
any future kconfig package messing arounf with oldconfig, and because we
need a quick fix.

But as I said in the cover-letter, we can further improve the situation
in -next.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
