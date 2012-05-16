From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 10:39:52 +0200
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: disable decimal
	floats
In-Reply-To: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 15 May 2012 23:15:50 +0200")
References: <1337116550-12175-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <871umkr02v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Decimal floats were introduced circa gcc-4.2 or -4.3, and requires
 Yann> the floating-point environement fenv.h in the C library.

 Yann> The uClibc .config file used by crosstool-NG to build uClibc is the
 Yann> same as used by the internal buildroot mechanism, and explcitly
 Yann> disables fenv support.

 Yann> The quick workaround is to simply disable decimal floats in all
 Yann> crosstool-NG config files.

 Yann> In the long run, it might be better to check this situation, and/or
 Yann> add code and/or options in crosstool-NG to handle this (but it is
 Yann> much more involved, and this workaround is sane).

Committed, thanks.

-- 
Bye, Peter Korsgaard
