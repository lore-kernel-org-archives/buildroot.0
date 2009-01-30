From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 20:28:22 +0100
Subject: [Buildroot] svn commit: trunk/buildroot:
	target/device/Atmel/arch-avr32/kernel-pa etc...
In-Reply-To: <1233337768.4147.93.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Fri\, 30 Jan 2009 18\:49\:28 +0100")
References: <20090130085310.9730F765E9@busybox.osuosl.org>
	<87zlh9np10.fsf@macbook.be.48ers.dk>
	<20090130100919.5b8c93ba@hcegtvedt>
	<1233337768.4147.93.camel@elrond.atmel.com>
Message-ID: <877i4cmw4p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> HC has all these patches in the kernel-headers directory in his
 Ulf> tree.  I thought initially that was a little risky.

 Ulf> I therefore tried putting them in the avr32 specific parts, 
 Ulf> but I have seen strange effects on some packages.
 Ulf> That is why I tried this approach.

Just split up the patches and put the kernel header _FIXES_ in
toolchain/kernel-headers, just like all other architectures do.

The leftovers you can but under target/device/Atmel.

 Ulf> Have read a little bit more on the kernel-headers, 
 Ulf> and it appears that I can keep the stuff in the
 Ulf> AVR32 parts and then define 

 Ulf> KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/2.6.[27.6|28.2]

 Ulf> for AVR32 targets.

 Ulf> Does that make sense?

I would prefer to have the kernel headers stuff together for all
archs, the amount (and size of) patches is normally very limited.

-- 
Bye, Peter Korsgaard
