From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 00:09:41 +0200
Subject: [Buildroot] [PATCH v1 2/2] libevdev: disable runtime tests
In-Reply-To: <20151012000348.08c8b374@gmx.net>
References: <1444598683-12269-1-git-send-email-ps.report@gmx.net>
 <1444598683-12269-2-git-send-email-ps.report@gmx.net>
 <20151011213017.GG24916@free.fr> <20151012000348.08c8b374@gmx.net>
Message-ID: <20151011220941.GH24916@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-10-12 00:03 +0200, Peter Seiderer spake thusly:
> On Sun, 11 Oct 2015 23:30:17 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2015-10-11 23:24 +0200, Peter Seiderer spake thusly:
> > > Add new configure option '--disable-runtime-tests' and use it do
> > > disable runtime tests which fail to compile on some uclibc
> > > configurations.
[--SNIP--]
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 54a2510..f285e93 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -74,7 +74,16 @@ else
> > > + 	AC_MSG_WARN([check not found - skipping building unit tests])
> > > + fi
> > > + AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
> > > +-AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x$HAVE_CHECK" = "xyes"])
> > 
> > Instead of patching configure.ac, can't we just configure it with:
> > 
> >     LIBEVEDEV_CONF_OPTS += HAVE_CHECK=no
> 
> s/LIBEVEDEV_CONF_OPTS/LIBEVDEV_CONF_OPTS/

Meh... ;-)

> Invitingly simple solution, but did not work out, sorry...

Too bad... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
