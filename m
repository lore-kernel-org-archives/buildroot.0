From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Jul 2013 22:30:19 +0200
Subject: [Buildroot] [PATCHv2 01/25] gcc: use
	BR2_EXTRA_GCC_CONFIG_OPTIONS in gcc-initial and gcc-intermediate
In-Reply-To: <1373754468-7527-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Jul 2013 00:27:24 +0200")
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373754468-7527-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hafwdgv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When refactoring the internal toolchain backend logic, the code was
 Thomas> changed to pass the custom configure options given through
 Thomas> BR2_EXTRA_GCC_CONFIG_OPTIONS only for the gcc final pass, with the
 Thomas> idea that we're only interested by user customization for the final
 Thomas> compiler.

 Thomas> However, the beaglebone_defconfig was passing --with-float=hard
 Thomas> --with-fpu=vfpv3-d16 as BR2_EXTRA_GCC_CONFIG_OPTIONS, and since the
 Thomas> refactoring, it was causing build failures of the beaglebone_defconfig
 Thomas> (with messages saying that Busybox is built to use VFP arguments, but
 Thomas> libc/libm are not). This is due to the fact that the gcc intermediate,
 Thomas> which is used to build the C library, wasn't built to generate hard
 Thomas> float, while the final compiler was generating hard float.

 Thomas> So, we get back to the original situation where the options in
 Thomas> BR2_EXTRA_GCC_CONFIG_OPTIONS are passed to all of the compiler
 Thomas> passes. Of course, the specific case of hard float will be fixed by
 Thomas> following patches in this area, but the idea still remains: the three
 Thomas> gcc should have the same options, if those options affected the ABI of
 Thomas> the generated code.

Committed, thanks.

-- 
Bye, Peter Korsgaard
