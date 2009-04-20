From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 20 Apr 2009 17:30:07 -0300
Subject: [Buildroot] Qt Embedded build problem for x86 target (was Re: A
	new QTOPIA error)
In-Reply-To: <87y6tz8jnh.fsf@macbook.be.48ers.dk>
References: <d6cda7730904170243v9ff8a13jcd7e70fe0b486264@mail.gmail.com>
	<87y6tz8jnh.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730904201330t1cc17320n370070798d3f4bdb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/4/17 Peter Korsgaard <jacmet@uclibc.org>:
>
> ?Thiago> The problem is, if we just commit this work around, then build would
> ?Thiago> fail for other hosts, such as freebsd, macos, etc.
>
> What exactly breaks for those people? My guess is that non-Linux users
> compiling for x86 are a pretty small group, but if it's an issue we
> can always detect host OS and only add the configure flag for Linux
> users.
>

For them, the proper -platform would be different (freebsd-g++, macos-g++, etc).
This basically tells configure what is the proper mkspec/* folder to
use for the host tools, while -xplatform and -embedded tells it what
are the proper mkspec/qws/* folder for the target.

Those folders contain compiler settings, flags and some times, include files.

We could restrict that to only when building x86, but it would still
be hackish, I guess.

Thanks,
    Thiago A. Correa
