From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Nov 2009 11:02:14 +0100
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <op.u31nbqpqyqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Fri\, 27 Nov 2009 09\:03\:16 +0100")
References: <op.u3z7srteyqa4qb@jap-lappis> <873a419x3e.fsf@macbook.be.48ers.dk>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
Message-ID: <87eink70bd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 Joachim> This is what I extracted from the email that came back from
 Joachim> this list, I think you made a mistake somewhere:

 Joachim> # BR2_KERNEL_HEADERS_2_6_31 is not set
 Joachim> BR2_KERNEL_HEADERS_VERSION=y
 Joachim> # BR2_KERNEL_HEADERS_SNAP is not set
 Joachim> BR2_DEFAULT_KERNEL_VERSION="2.6.27.10"
 Joachim> BR2_DEFAULT_KERNEL_HEADERS="2.6.27.10"

Argh, sorry - I have too many /tmp/.config* files :/

Your fix is then to use the 2.6.27.x version instead of hardcoding
2.6.27.10 - That will make you use 2.6.27.39 which has the getline fix.

Notice that your kernel headers version doesn't need to be the same as
the kernel version you're using.

 >> The getline problem is a known issue with old kernels and new
 >> distributions (fixed in 2.6.29+ and later versions of 2.6.27.x).

 Joachim> OK.

 Joachim> Some time back, I remember hearing that 2.6.27 was the branch
 Joachim> that was to be maintained for XScale PXA. Is this correct, or
 Joachim> are all XScale oddities handled in later kernel versions?

I don't know about PXA in particular (but even if so, please use the
latest in the 2.6.27.x series). In general, the latest stable kernel
release (currently 2.6.31.6) is the most sensible choice.

-- 
Bye, Peter Korsgaard
