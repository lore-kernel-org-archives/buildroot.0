From: Joachim Pihl <jpihl@nevion.com>
Date: Sat, 7 Nov 2009 11:24:01 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <87k4y2ve5w.fsf@macbook.be.48ers.dk>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
	<op.u2y208p6yqa4qb@jap-lappis.nevion.com>
	<87k4y2ve5w.fsf@macbook.be.48ers.dk>
Message-ID: <op.u20sibi9yqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 07 Nov 2009 11:10:19 +0100, Peter Korsgaard <jacmet@uclibc.org>  
wrote:

>>>>>> "Joachim" == Joachim Pihl <jpihl@nevion.com> writes:
>
> Hi,
>
>  Joachim> Doesn't look good to me, will revert to previous tool chain to
>  Joachim> have a look at what it says then. In the old buildroot, we had
>  Joachim> the threads library set to linuxthreads, but I have changed
>  Joachim> that to NPTL. Could that be the culprit?
>
> Yes, NTPL support in uclibc is still very much work in progress.

Just before I left work yesterday, I discovered that the uclibc .config  
(inherited from previous project) had "use linuxthreads" set, while  
buildroot had NPTL set. The mismatch here could be what we are looking for?

I would much prefer NPTL if it works, since our applications are heavily  
multithreaded (for architecture clarity reasons, among other things), and  
I suspect that some of the performance issues we have could be caused by  
context switch/scheduling latency.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
