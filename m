From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 25 Sep 2007 21:06:02 +0200
Subject: [Buildroot] native GCC not found in HEAD
In-Reply-To: <d6cda7730709251133u591f038rf80cdb0bdd6d8614@mail.gmail.com>
References: <d6cda7730709250656u4b67c688q4f4e5fe83ce32571@mail.gmail.com>
	<02ca01c7ff9f$46e23020$dcc4af0a@atmel.com>
	<d6cda7730709251133u591f038rf80cdb0bdd6d8614@mail.gmail.com>
Message-ID: <1190747162.19731.100.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-25 klockan 19:33 +0100 skrev Thiago A. Corr?a:
> I have also noticed that the folder names don't have the avr32 suffix
> anymore, so I guess it's a variable that is not right.
> 


> Also, there is no more Buildroot toolchain, only external toolchain in
> the options. Is this really expected? Something wrong with using
> buildroot toolchain? or part of the problem? There is some 300
> revisions between what used to work and HEAD *sigh*
> 

Yes, all the version info for gcc,binutils,uclibc etc. are gone
with Bernhards changes.
That is why you have a problem.

> On 9/25/07, Ulf Samuelsson <ulf@atmel.com> wrote:
> > > Hi,
> > >
> > >   I've done an svn up today, and something has been broken since the
> > > last time I tried a full build:
> > >
> > > /bin/sh: /bin/-gcc: No such file or directory
> > > copy_toolchain_lib_root: lib=libc.so.6 not found
> > > make: *** [/root/novacomm/buildroot/buildroot-original/project_build_avr32/pppserver/root/lib/libc.so.6]
> > > Error 255
> > > gentoo-vm buildroot-original # which gcc
> > > /usr/bin/gcc
> > > gentoo-vm buildroot-original #
> > >
> > > Been greping here and there, tried some hints from
> > > http://www.oreilly.com.cn/samplechap/gnumake/ch12.pdf but can't find
> > > where this is broken :(
> > >
> >
> > Bernard Fisher, is the last one to touch the AVR32 and he broke it severely.
> > I am pretty sure that he did not test building the AVR32 toolset
> > before submitting...
> >
> > He should fix the problem!
> >
> > Best Regards
> > Ulf Samuelsson
> > >
> >
