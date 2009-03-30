From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 10:42:31 +0200
Subject: [Buildroot] EABI broken on arm926t?
In-Reply-To: <22754259.post@talk.nabble.com> (kelvincheung's message of "Fri\,
	27 Mar 2009 23\:59\:21 -0700 \(PDT\)")
References: <76d9e2a30810181737u6987153fsb6509635312f5141@mail.gmail.com>
	<22738895.post@talk.nabble.com> <22754259.post@talk.nabble.com>
Message-ID: <87ocvjbdvs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "kelvincheung" == kelvincheung  <keguang.zhang@gmail.com> writes:

Hi,

 kelvincheung> I fond the sulotion:
 kelvincheung> http://lists.uclibc.org/pipermail/buildroot/2007-June/003189.html

 kelvincheung> To us EABI for ARM920T in the buildroot, two options are needed to the main
 kelvincheung> buildroot config:
 kelvincheung> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS="--with-arch=armv4t"

Really? Binutils afaik doesn't support an --with-arch configure
option.

 kelvincheung> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-arch=armv4t"
 kelvincheung> or
 kelvincheung> BR2_EXTRA_BINUTILS_CONFIG_OPTIONS="--with-cpu=arm920t"
 kelvincheung> BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-cpu=arm920t"

I've fixed the GCC_TARGET_ARCH table for ARM in r25889 - Could you
give it a try to verify?

-- 
Bye, Peter Korsgaard
