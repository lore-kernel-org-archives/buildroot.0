From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2016 23:05:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/spice: depend on libglib2
In-Reply-To: <20160221211249.723daeb6@free-electrons.com>
References: <1456076407-20364-1-git-send-email-bernd.kuhls@t-online.de>
 <20160221211249.723daeb6@free-electrons.com>
Message-ID: <20160221220552.GF3456@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2016-02-21 21:12 +0100, Thomas Petazzoni spake thusly:
> Dear Bernd Kuhls,
> 
> On Sun, 21 Feb 2016 18:40:07 +0100, Bernd Kuhls wrote:
> > The package selects BR2_PACKAGE_LIBGLIB2 but did not depend on it.
> > 
> > The buildsystem treats libglib2 as a hard-dependency:
> > https://cgit.freedesktop.org/spice/spice/tree/configure.ac?h=0.12#n117
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> I am not sure in fact. The part of configure.ac you're pointing to
> simply adds libglib2 to SPICE_REQUIRES, which is *only* used in the
> spice build system to fill in the Requires.private field of
> spice-server.pc. I.e, it seems like libglib2 is only an indirect
> dependency of spice, and a reference to libglib2 only needed when
> static linking.

    $ git grep -E '\<glib.h\>'
    server/reds.c:#include <glib.h>

The server is not optional (only the client is), and reds.c is not
conditoinal in server/Makefile.am.

So it looks like it really requires glib for itself.

> This clearly needs more investigation, as other dependencies of spice
> are handled in the same way.

Not sure I'm following... Except for libglib2, for each select or
depends on, we have the corresponding entry in _DEPENDENCIES.

Unless you're referring to how spice internally treats its depednencies?

> Yann, you originally added the spice package, maybe you can have a look?

Are you kidding? That was more than three years ago! Hehe! ;-)

And by the way, a bump would be welcome (after the release, I mean). ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
