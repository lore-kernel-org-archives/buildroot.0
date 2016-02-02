From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 14:27:03 +0100
Subject: [Buildroot] glibc and --enable-kernel
In-Reply-To: <56AAA5BE.2050306@mind.be> (Arnout Vandecappelle's message of
 "Fri, 29 Jan 2016 00:35:26 +0100")
References: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
 <20160127092119.7cf8953d@free-electrons.com>
 <20160128025537.GB5589@tungsten.ozlabs.ibm.com>
 <20160128093618.42baf311@free-electrons.com>
 <56AAA5BE.2050306@mind.be>
Message-ID: <87egcv5jko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> The only reason that may encourage you to use
 >> BR2_TOOLCHAIN_HEADERS_AT_LEAST instead of BR2_DEFAULT_KERNEL_HEADERS is
 >> an upcoming patch from Yann E. Morin (already submitted but not merged
 >> yet), which allows to tell Buildroot to use the kernel version
 >> specified in the "Kernel" menu as the version for the kernel headers.
 >> In this case, I believe BR2_DEFAULT_KERNEL_HEADERS will not be correct,
 >> while BR2_TOOLCHAIN_HEADERS_AT_LEAST will be.

 >  A minor issue with _AT_LEAST, however, is that it will probably go through
 > deprecation eventually. Right now we have "2.6" as the lowest _AT_LEAST - how
 > will glibc deal with that? I can imagine at some point we'll deprecate 3,1, 3.2,
 > and 3.3, so if you're using 3.3 headers the _AT_LEAST will become 3.0. Right
 > now, we already have that for 2.6.3x, which will fall back to 2.6.0 (I guess -
 > should be checked if glibc doesn't barf on 2.6 without .0).

If it does, then I suggest we filter out --enable-kernel for the oldest
variant, so we're back to how it works now as a lowest common denominator.

-- 
Bye, Peter Korsgaard
