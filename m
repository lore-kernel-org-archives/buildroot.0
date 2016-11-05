From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 5 Nov 2016 09:47:55 -0400
Subject: [Buildroot] [PATCH] pseudo: fix build for python3 based distros
In-Reply-To: <20161105123951.GE31560@free.fr>
References: <20161105035549.18698-1-gael.portay@savoirfairelinux.com>
 <20161105035549.18698-2-gael.portay@savoirfairelinux.com>
 <20161105123951.GE31560@free.fr>
Message-ID: <20161105134609.GB26483@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, Nov 05, 2016 at 01:39:51PM +0100, Yann E. MORIN wrote:
> Ga?l, All,
> 
> On 2016-11-04 23:55 -0400, Ga?l PORTAY spake thusly:
> > Pseudo is not python3 friendly. It causes build failure on distros using
> > python3 as default python interpretor.
> > 
> > ./maketables enums/*.in
> >   File "./makewrappers", line 327
> >     return """/* This function is not called if pseudo is configured --enable-force-async */
> >                                                                                            ^
> > TabError: inconsistent use of tabs and spaces in indentation
> >   File "./maketables", line 76
> >     print "Flags: set for %s" % self.name
> >                             ^
> > SyntaxError: Missing parentheses in call to 'print'
> > make[2]: *** [Makefile:150: wrappers] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[2]: *** [Makefile:147: tables] Error 1
> > 
> > Those patches make pseudo works with python2 and python3.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> My python is python2, and it still work.
> 
> Then I switched 'python' to 'python3' as the interpreter to use in both
> scripts, and it indeed work too.

Great! Thank you for the test.

> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Regards,
Ga?l PORTAY
