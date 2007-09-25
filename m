From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 26 Sep 2007 01:39:14 +0200
Subject: [Buildroot] native GCC not found in HEAD
In-Reply-To: <1190759932.19731.103.camel@elrond.atmel.sweden>
References: <d6cda7730709250656u4b67c688q4f4e5fe83ce32571@mail.gmail.com>
	<02ca01c7ff9f$46e23020$dcc4af0a@atmel.com>
	<d6cda7730709251133u591f038rf80cdb0bdd6d8614@mail.gmail.com>
	<1190747162.19731.100.camel@elrond.atmel.sweden>
	<20070925220541.GM20058@aon.at>
	<1190759932.19731.103.camel@elrond.atmel.sweden>
Message-ID: <1190763554.19731.112.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-26 klockan 00:38 +0200 skrev Ulf Samuelsson:
> ons 2007-09-26 klockan 00:05 +0200 skrev Bernhard Fischer:
> > On Tue, Sep 25, 2007 at 09:06:02PM +0200, Ulf Samuelsson wrote:
> > >tis 2007-09-25 klockan 19:33 +0100 skrev Thiago A. Corr?a:
> > >> I have also noticed that the folder names don't have the avr32 suffix
> > >> anymore, so I guess it's a variable that is not right.
> > >> 
> > >
> > >
> > >> Also, there is no more Buildroot toolchain, only external toolchain in
> > >> the options. Is this really expected? Something wrong with using
> > >> buildroot toolchain? or part of the problem? There is some 300
> > >> revisions between what used to work and HEAD *sigh*
> > >> 
> > >
> > >Yes, all the version info for gcc,binutils,uclibc etc. are gone
> > >with Bernhards changes.
> > 
> > The logic in your target/device/Toolchain.in looks a bit flawed to my
> > untrained eyes.
> > 
> Not if you assume that  there will eventually be several versions.
> You are making things worse from my point of view.
> 
As an additional item.
When you remove the Toolchain Build options ,you lose all capability to
configure the externally downloaded toolchain.


All toolchain *.mk depends on GCC_VERSION / BINUTILS_VERSION etc.
having a value and there is no way you can complete
a build without them.

The only reasonable thing is to go back to how it was before.

After this, I would appreciate if you did not commit
things which is AVR32 related unless you do some testing before.
It is unavoidable that failures will occur from time to time, 
as a result of commits but you clearly did not see the implications of
your change and has not done *any* testing selecting AVR32 as a target.

BR
Ulf Samuelsson



> Please ensure that the GCC/BINUTILS/GDB/UCLIBC Versions are
> again visible when you are selecting an external toolchain.
> 
> 
> BR
> Ulf Samuelsson
> 
> 
> 
> > >That is why you have a problem.
> > 
> > Exactly. r20029 removes this problem.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
