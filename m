From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Nov 2009 22:50:03 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <op.u20sibi9yqa4qb@jap-lappis.nevion.com> (Joachim Pihl's message
	of "Sat\, 7 Nov 2009 11\:24\:01 +0100")
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
	<op.u2y208p6yqa4qb@jap-lappis.nevion.com>
	<87k4y2ve5w.fsf@macbook.be.48ers.dk>
	<op.u20sibi9yqa4qb@jap-lappis.nevion.com>
Message-ID: <87my2wu1o4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:

Hi,

 >> Yes, NTPL support in uclibc is still very much work in progress.

 Joachim> Just before I left work yesterday, I discovered that the uclibc
 Joachim> .config  (inherited from previous project) had "use linuxthreads" set,
 Joachim> while  buildroot had NPTL set. The mismatch here could be what we are
 Joachim> looking for?

No, buildroot rewrites that part of the uclibc config (see
toolchain/uClibc/uclibc.mk)

 Joachim> I would much prefer NPTL if it works, since our applications
 Joachim> are heavily multithreaded (for architecture clarity reasons,
 Joachim> among other things), and I suspect that some of the
 Joachim> performance issues we have could be caused by context
 Joachim> switch/scheduling latency.

You should probably check on the uclibc list, but there's afaik no NPTL
support for any architecture in any released uclibc versions.

-- 
Bye, Peter Korsgaard
