From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Feb 2009 14:08:42 +0100
Subject: [Buildroot] Binary toolchain fails
In-Reply-To: <1233489031.5742.11.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Sun\, 01 Feb 2009 12\:50\:31 +0100")
References: <1233484479.4147.149.camel@elrond.atmel.com>
	<1233489031.5742.11.camel@elrond.atmel.com>
Message-ID: <87d4e2i9t1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> Once that is fixed, sysroot is still not enabled 
 Ulf> since the configuration variables for sysroot are disabled
 Ulf> when you use a binary toolchain.

 Ulf> BR2_TARGET_OPTIMIZATION="-Os -pipe --sysroot=$(STAGING_DIR)/ -isysroot
 Ulf> $(STAGING_DIR)"

Don't forget the !SYSROOT case.

 Ulf> Would let me build packages with problems.

 Ulf> Since there are so many changes needed to get binary toolchains
 Ulf> to work, I propose we simply disable them in the distribution
 Ulf> and fix the problem afterwards.

I wouldn't do that as we pretty frequently hear from people apparently
using it (Like Daniel's latest changes), so it obviously works for
some.

-- 
Bye, Peter Korsgaard
