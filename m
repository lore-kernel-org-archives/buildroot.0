From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 16:00:34 +0200
Subject: [Buildroot] Qt Embedded build problem for x86 target (was Re: A
	new QTOPIA error)
In-Reply-To: <d6cda7730904170243v9ff8a13jcd7e70fe0b486264@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 17 Apr 2009
	06\:43\:22 -0300")
References: <d6cda7730904170243v9ff8a13jcd7e70fe0b486264@mail.gmail.com>
Message-ID: <87y6tz8jnh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago> I built i686_defconfig with Qtopia enabled and was able to reproduce
 Thiago> his first bug with the g++@ missing.
 Thiago> The workaround was to add -platform linux-g++ to configure. I guess
 Thiago> Nokia/QtSoftware's configure script has a bug somewhere that during
 Thiago> x86 to x86 crosscompiling it's unable to figure out the proper
 Thiago> platform for the host tools.

Ahh ok, thanks for looking into it.

 Thiago> The problem is, if we just commit this work around, then build would
 Thiago> fail for other hosts, such as freebsd, macos, etc.

What exactly breaks for those people? My guess is that non-Linux users
compiling for x86 are a pretty small group, but if it's an issue we
can always detect host OS and only add the configure flag for Linux
users.

-- 
Bye, Peter Korsgaard
