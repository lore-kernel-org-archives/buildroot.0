From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 09:40:37 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal
	floats
In-Reply-To: <4FB2D9B7.6050705@mind.be> (Arnout Vandecappelle's message of
 "Wed, 16 May 2012 00:33:27 +0200")
References: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
 <4FB2D9B7.6050705@mind.be>
Message-ID: <87ehqkr2tm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 05/15/12 23:15, Yann E. MORIN wrote:
 >> Decimal floats were introduced circa gcc-4.2 or -4.3, and requires
 >> the floating-point environement fenv.h in the C library.
 >> 
 >> The uClibc .config file used by crosstool-NG to build uClibc is the
 >> same as used by the internal buildroot mechanism, and explcitly
 >> disables fenv support.
 >> 
 >> The quick workaround is to simply disable decimal floats in all
 >> crosstool-NG config files.

 Arnout>  Wouldn't it be better to enable FENV in buildroot's uClibc config?

It's afaik only available for i386, and even then I believe some things
are missing.

-- 
Bye, Peter Korsgaard
