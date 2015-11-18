From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Nov 2015 22:57:10 +0100
Subject: [Buildroot] [RFC v1] directfb: fix musl compile
In-Reply-To: <1447110344-1446-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Tue, 10 Nov 2015 00:05:44 +0100")
References: <1447110344-1446-1-git-send-email-ps.report@gmx.net>
Message-ID: <87vb8z9djd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

Hi,

 > - use 'union sigval' instead of sigval_t (same as suggested
 >   for canfestival by Yann E. MORIN, see [2])

 > - delete DIRECT_RECURSIVE_MUTEX_INITIALIZER define (which uses unknown
 >   PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP)

 > - use DIRECT_MUTEX_INITIALIZER instead for trace.c (no recursive
 >   mutex needed)

 > - use pthread_once and direct_recursive_mutex_init instead for
 >   directfb.c

 > Fixes [1]:

 >   system.c:114:6: error: unknown type name 'sigval_t'

 > and

 >   ../lib/direct/os/linux/glibc/mutex.h:49:53: error: ?PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP? undeclared (first use in this function)

 > [1] http://autobuild.buildroot.net/results/548/548bf7b800a946e97135c0ba66363f388e517d6f
 > [2] https://patchwork.ozlabs.org/patch/509731

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > RFC: not yet runtime tested

Thanks, but I don't feel confident applying such a patch, especially as
upstream seems dead so we cannot get their feedback on it / will have to
carry it along ourselves - So I've instead marked directfb as !musl.

-- 
Bye, Peter Korsgaard
