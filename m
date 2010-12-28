From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 28 Dec 2010 16:31:37 -0600
Subject: [Buildroot] oprofile "requires" gmp??? Slight fork:
	BR2_STAGING_DIR
In-Reply-To: <4D1A54D6.60805@zacarias.com.ar>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1EA26053@EXV1.corp.adtran.com><20101223082740.3a8e44c4@surf><9AC3F0E75060224C8BBC5BA2DDC8853A1EA263BF@EXV1.corp.adtran.com>	<20101224090517.0c935c19@surf>	<9AC3F0E75060224C8BBC5BA2DDC8853A1EA2689B@EXV1.corp.adtran.com>
	<4D18D7B3.3020900@zacarias.com.ar>
	<4D18D873.9010502@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB132@EXV1.corp.adtran.com>
	<4D19E079.9030704@zacarias.com.ar>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB2EA@EXV1.corp.adtran.com>
	<4D1A54D6.60805@zacarias.com.ar>
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1EAEB607@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> My failure for hitting send before finishing.
> I was about to say that we can keep a symlink from staging->sysroot
but
> i'd rather watch it die because i can't think of any useful purpose
> where people can't use the computed $(STAGING_DIR) directly.

Okay, perhaps I'm (mis)using/abusing what the toolchain directory option
was meant for.  I point the toolchain dir to something like
/opt/mips/gcc-<some identifier> because I'll do something like have a
small kernel with an initrd (usually statically compiled BusyBox with
MINIMAL tools, and one or two IP type utils), then the real RFS will
have all the libs associated with it.  The purpose for specifying the
toolchain dir in my case is so that I can set CROSS_COMPILE to
/opt/mips/gcc-small/usr/bin/mips-linux- or
/opt/mips/gcc-large/usr/bin/mips-linux- when I'm compiling against the
nano type system or the micro system respectively.  Usually, I'll make a
tar ball of these toolchains and throw them up onto the CMS so that
others don't have to compile the system just to get the toolchain for
that system.

Now, another e-mail I saw today from Peter Korsgaard titled "[Buildroot]
[git commit master 1/1] package: avoid copying .m4files from host to
staging" (to me) implies that I will be able to [easily] create a
toolchain "package" which will allow me to install it to wherever I
choose.

Now, am I wrong?  If I shouldn't be using the toolchain from the build
for making user-space apps for the system, what should I be doing?

Thanks again,
Andy
