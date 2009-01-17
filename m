From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Jan 2009 08:50:28 +0100
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel/atngw1 etc...
In-Reply-To: <20090116223907.4517B77584@busybox.osuosl.org> (ulf@uclibc.org's
	message of "Fri\, 16 Jan 2009 22\:39\:06 +0000 \(UTC\)")
References: <20090116223907.4517B77584@busybox.osuosl.org>
Message-ID: <87wscu2wxn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "ulf" == ulf  <ulf@uclibc.org> writes:

 ulf> Author: ulf
 ulf> Date: 2009-01-16 22:39:05 +0000 (Fri, 16 Jan 2009)
 ulf> New Revision: 24891

 ulf> Log:
 ulf> Update broken AVR32 toolchain, and update configs for this, deprecate all but latest AVR32 toolchain

 ulf> Added:
 ulf>    trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch

 ulf> Modified:
 ulf>    trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
 ulf>    trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
 ulf>    trunk/buildroot/target/device/Config.in.toolchain
 ulf>    trunk/buildroot/toolchain/gcc/Config.in
 ulf>    trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk

ulf> +++ trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 22:39:05 UTC (rev 24891)
 ulf> @@ -32,9 +32,8 @@
 ulf>  		bool "gcc 4.2.1"
 
 ulf>  	config BR2_GCC_VERSION_4_2_2
 ulf> -		depends on BR2_avr32
 ulf>  		depends on BR2_EXT_GCC_VERSION_4_2_2
 ulf> -		depends on BR2_DEPRECATED
 ulf> +		depends on BR2_DEPRECATED || BR2_avr32
 ulf>  		bool "gcc 4.2.2"

This adds one more version for the !AVR32 archs, but OK.
 
-- 
Bye, Peter Korsgaard
