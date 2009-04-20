From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Apr 2009 22:50:53 +0200
Subject: [Buildroot] Qt Embedded build problem for x86 target (was Re: A
	new QTOPIA error)
In-Reply-To: <d6cda7730904201330t1cc17320n370070798d3f4bdb@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Mon\, 20 Apr 2009
	17\:30\:07 -0300")
References: <d6cda7730904170243v9ff8a13jcd7e70fe0b486264@mail.gmail.com>
	<87y6tz8jnh.fsf@macbook.be.48ers.dk>
	<d6cda7730904201330t1cc17320n370070798d3f4bdb@mail.gmail.com>
Message-ID: <87fxg3rqvm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> For them, the proper -platform would be different
 Thiago> (freebsd-g++, macos-g++, etc).  This basically tells
 Thiago> configure what is the proper mkspec/* folder to use for the
 Thiago> host tools, while -xplatform and -embedded tells it what are
 Thiago> the proper mkspec/qws/* folder for the target.

 Thiago> Those folders contain compiler settings, flags and some
 Thiago> times, include files.

 Thiago> We could restrict that to only when building x86, but it
 Thiago> would still be hackish, I guess.

Ok, we do have some non-Linux support with the BR2_GNU_BUILD_SUFFIX
stuff (see the toplevel Makefile). We could use the same logic in
qtopia.mk to get the correct -platform.

Don't worry too much about getting support for all obscure OSes
correct right away - Either those people will complain and/or send
patches or no one needs it.

-- 
Bye, Peter Korsgaard
