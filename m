From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:31:30 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain/wrapper: fix building without
	glibc
In-Reply-To: <20161231225649.x6lp2l6oavetrbth@sapphire.tkos.co.il> (Baruch
 Siach's message of "Sun, 1 Jan 2017 00:56:50 +0200")
References: <20161231153017.10545-1-marcinch7@gmail.com>
 <20161231225649.x6lp2l6oavetrbth@sapphire.tkos.co.il>
Message-ID: <87bmuug72l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Marcin,
 > On Sat, Dec 31, 2016 at 04:30:17PM +0100, Marcin Chojnacki wrote:
 >> toolchain-wrapper.c now uses program_invocation_short_name, which is
 >> a glibc specific extension. This causes build to fail when using a
 >> system with libc different than glibc (musl, BSD libc, etc.)
 >> 
 >> This change makes toolchain-wrapper.c portable, by setting it's value
 >> to getprogname() when __GLIBC__ is not defined, and thus makes running
 >> buildroot possible on glibc-less systems.

 > getprogname() is BSD specific[1]. None of the major Linux libcs (glibc, 
 > uclibc-ng, musl) provide it.

 > [1] https://www.freebsd.org/cgi/man.cgi?query=getprogname&sektion=3

Out of interest, what system are you trying to use Buildroot on? A BSD
variant? I would imagine a number of other things breaking on !Linux
systems.

-- 
Bye, Peter Korsgaard
