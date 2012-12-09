From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Dec 2012 22:45:38 +0100
Subject: [Buildroot] [PATCH 21/51] package/libedit2: new package
In-Reply-To: <20121209195205.7fb4b643@skate>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-22-git-send-email-yann.morin.1998@free.fr>
 <20121209195205.7fb4b643@skate>
Message-ID: <201212092245.39336.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 09 December 2012 Thomas Petazzoni wrote:
> On Sun,  9 Dec 2012 17:34:54 +0100, Yann E. MORIN wrote:
> 
> > +LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses
> If I'm correct, this package is the only one that needs host-pmake, no?

Yes, so far.

I also do not have any local change that adds another package which
depends on pmake.

> If so, then seeing how simple libedit seems to be, I think a patch
> adding a proper configure.ac + Makefile.am to libedit2, making its
> build system correct, and independent of pmake, would be in fact a lot
> easier.

Well, I've had a quick look, and it's not that easy.
For one, the Makefile has dirty dependencies on generated headers.

I'm afraid adding  a configure.ac and Makefile.am will not be as
straightforward as we may think, but I'll try to do it.

> It would avoid the huge pmake package that has gazillions of patches,
> and would avoid the horrible mess in libedit2.mk to get the
> installation step correct.

Yes, pmake is ugly. :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
