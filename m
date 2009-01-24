From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 12:48:28 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	multimedia/mpg123
In-Reply-To: <20090124112748.D8336769CC@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Sat\, 24 Jan 2009 11\:27\:48 +0000 \(UTC\)")
References: <20090124112748.D8336769CC@busybox.osuosl.org>
Message-ID: <87ab9ghqlv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-24 11:27:47 +0000 (Sat, 24 Jan 2009)
 ulf> New Revision: 25004

 ulf> Log:
 ulf> Make toolchain configration to fix mpg123 global and move to Makefile

 ulf> Modified:
 ulf>    trunk/buildroot/package/Makefile.in
 ulf>    trunk/buildroot/package/multimedia/mpg123/Config.in
 ulf>    trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch
 
 ulf> +# Handle bug fixes in toolchain
 ulf> +ifeq ($(BR2_arm),y)
 ulf> +ifeq ($(BR2_GCC_VERSION_4_3_2),y)
 ulf> +# Removes segment violation in mpg123.

Confusing comments as It's a GCC ICE, not mpg123 crashing.

What about the other gcc 4.3.x versions? Does it E.G. also occur with
4.3.1?

Why isn't this in mpg123.mk ?

 ulf> -+#if	defined(MPG123_ARM_UNROLL_FIX)
 ulf> ++#if	defined(ARM_UNROLL_FIX)

Why the rename?

-- 
Bye, Peter Korsgaard
