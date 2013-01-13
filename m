From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jan 2013 00:49:31 +0100
Subject: [Buildroot] [git commit] Makefile: use
	newly-introducedBUILDROOT_CONFIG breaks build
In-Reply-To: <201301140047.28540.yann.morin.1998@free.fr>
References: <20130113221602.6AFBD99C29@busybox.osuosl.org>
 <201301140042.37099.yann.morin.1998@free.fr>
 <201301140047.28540.yann.morin.1998@free.fr>
Message-ID: <201301140049.31919.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On Monday 14 January 2013 Yann E. MORIN wrote:
> On Monday 14 January 2013 Yann E. MORIN wrote:
> > On Monday 14 January 2013 Sagaert Johan wrote:
> > > This changes seem to break the build.
> > [--SNIP--]
> > > make[1]: Entering directory `/home/buildroot12git/output/toolchain/uClibc-0.9.33.2'
> > > Makefile.in:425: target `output/libm' given more than once in the same rule.
> > > Makefile.in:425: target `output/libubacktrace' given more than once in the same rule.
> > >   MKDIR include/config
> > >   MKDIR extra/config/lxdialog
> > > /bin/sh: line 0: cd: output/extra/config: No such file or directory
> > >   HOSTCC-o extra/config/conf.o
> > > Assembler messages:
> > > Fatal error: can't create output/extra/config/conf.o: No such file or directory
> > > make[2]: *** [output/extra/config/conf.o] Error 1
> > > make[1]: *** [output/extra/config/conf] Error 2
> > > make[1]: Leaving directory `/home/buildroot12git/output/toolchain/uClibc-0.9.33.2'
> > > make: *** [/home/buildroot12git/output/toolchain/uClibc-0.9.33.2/.config] Error 2

Hmm. Sorry, that's not the same error.
You are using a custom uClibc .config file, and my build fails to find it.

I'll investigate further...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
