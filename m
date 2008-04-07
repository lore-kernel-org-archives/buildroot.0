From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 7 Apr 2008 11:01:50 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <007601c89846$ee875b80$020514ac@atmel.com>
References: <03b601c897df$7b07f7b4$85f0af0a@corp.atmel.com>
	<874paf88ma.fsf@macbook.be.48ers.dk> <47F8EB5B.9050905@eclis.ch>
	<1207499614.6817.36.camel@nigel-x60>
	<87iqyuu8d0.fsf@macbook.be.48ers.dk>
	<007601c89846$ee875b80$020514ac@atmel.com>
Message-ID: <d6cda7730804070701k4da8e45dpfbced7f63561fefb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

   I for one use buildroot from an ssh shell, even thought the
building machine is right besides me. A default that requires X is
unreasonable, give that buildroot doesn't check for X, and doesn't
require X either. I too back up the others on the opinion that the
default behavior should be menuconfig.

>  I do not put this requirement on everyone else.
>  The default behaviour is
>  1) To not build a kernel at all or
>  2) To build a kernel using the classic behaviour.
>
>  Only by selecting two non-default behaviours you get
>  exposed to the "advanced" linux configuration
>  I have spent considerable time on during the last 9 months.

Actually, the default behavior for NGW100 and STK1000 is to use the
advanced linux configuration. And it's the only one that works at all
AFAIK.

>  This will default to xconfig for AT91/AVR32 chips,
>  but you have the option to select the menuconfig you want.

Which is exactly what most people seam to be using at the moment. At
least I haven't seen any target/device/Hitachi users, I doubt it even
builds new days.
Whenever I do an an{stk1002|ngw100}_defconfig, I have to craw thru a
bunch of menus and packages to change stuff (libdaemon doesn't build
on gentoo, using -j2 makes lot more sense than -j1, etc, etc....). Why
should a default config be tailored to a single user's needs?
IMHO it should be a reasonable minimum set of options most would be
happy with, and clearly xconfig isn't.

>  If someone wants a different behaviour,
>  then they can create yet another linux makefile.

That would just introduce more maintenance, just makes no sense.

>  > Even easier, change the setting in the defconfigs he works with.
>  >

Please don't. We might use ARMs too in the future. :)
What about the make BOARD=<name> save/get thing? I never used it
myself, but should work as an option.

Kind Regards,
    Thiago A. Correa
