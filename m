From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 01 Feb 2009 14:57:59 +0100
Subject: [Buildroot] Binary toolchain fails
In-Reply-To: <87d4e2i9t1.fsf@macbook.be.48ers.dk>
References: <1233484479.4147.149.camel@elrond.atmel.com>
	<1233489031.5742.11.camel@elrond.atmel.com>
	<87d4e2i9t1.fsf@macbook.be.48ers.dk>
Message-ID: <1233496679.5742.16.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-02-01 klockan 14:08 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> Once that is fixed, sysroot is still not enabled 
>  Ulf> since the configuration variables for sysroot are disabled
>  Ulf> when you use a binary toolchain.
> 
>  Ulf> BR2_TARGET_OPTIMIZATION="-Os -pipe --sysroot=$(STAGING_DIR)/ -isysroot
>  Ulf> $(STAGING_DIR)"
> 
?
> Don't forget the !SYSROOT case.
> 

?BR2_TARGET_OPTIMIZATION is a user definable thing
in the .config file.
Anyone not having sysroot would have to change these parameters.

Since basically nothing is set for a binary toolchain,
this variable would 
have to contain a lot...

Better probably to have an include file describing the toolchain
functionality, which gets included after the .config.

>  Ulf> Would let me build packages with problems.
> 
>  Ulf> Since there are so many changes needed to get binary toolchains
>  Ulf> to work, I propose we simply disable them in the distribution
>  Ulf> and fix the problem afterwards.
> 
> I wouldn't do that as we pretty frequently hear from people apparently
> using it (Like Daniel's latest changes), so it obviously works for
> some.
> 

BR
Ulf Samuelsson
