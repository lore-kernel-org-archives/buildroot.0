From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 10:08:57 +0100
Subject: [Buildroot] arch support
In-Reply-To: <20090112100054.25c79c4f@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Mon\, 12 Jan 2009 10\:00\:54 +0100")
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>
	<20090112100054.25c79c4f@hcegtvedt>
Message-ID: <87d4esj3h2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 >> I just finished building the defconfigs for all the archs (uclibc
 >> 0.9.30 / kernel headers 2.6.28 / binutils 2.19 / gcc 4.3.2 except for
 >> avr32 which does it's own thing)
 >> 

 Hans-Christian> Nice, that is a good number of CPU cycles used ;)

yeah ;)

 >> avr32: ok (uclibc-0.9.29-avr32, binutils-2.17-avr32, gcc-4.2.2-avr32)

 Hans-Christian> Hmm, why is not 0.9.30 default for AVR32? It compiles
 Hans-Christian> fine with the upstream release, no extra patches
 Hans-Christian> needed.

I guess it's because of:

toolchain/Config.in:
config BR2_TOOLCHAIN_BUILDROOT
        bool "Buildroot toolchain"
        depends on !BR2_avr32

Which is from r21549 (Ulf)

and target/device/Config.in.toolchain:
choice
        prompt "Source location:"
        default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 if BR2_avr32

Which is from r22624 (Ulf)

-- 
Bye, Peter Korsgaard
