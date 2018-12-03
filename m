From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 23:27:07 +0100
Subject: [Buildroot] [PATCH-2018.02.x] glibc: bump version for post-2.26
 security fixes
In-Reply-To: <20181130095027.16587-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 30 Nov 2018 10:50:26 +0100")
References: <20181130095027.16587-1-peter@korsgaard.com>
Message-ID: <87lg561c1w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 >   CVE-2018-19591: A file descriptor leak in if_nametoindex can lead to a
 >   denial of service due to resource exhaustion when processing getaddrinfo
 >   calls with crafted host names.  Reported by Guido Vranken.

 > Adhemerval Zanella (2):
 >       Fix misreported errno on preadv2/pwritev2 (BZ#23579)
 >       x86: Fix Haswell CPU string flags (BZ#23709)

 > Alexandra H?jkov? (1):
 >       Add an additional test to resolv/tst-resolv-network.c

 > Andreas Schwab (1):
 >       libanl: properly cleanup if first helper thread creation failed (bug 22927)

 > Florian Weimer (3):
 >       preadv2/pwritev2: Handle offset == -1 [BZ #22753]
 >       conform: XFAIL siginfo_t si_band test on sparc64
 >       CVE-2018-19591: if_nametoindex: Fix descriptor for overlong name [BZ #23927]

 > Ilya Yu. Malakhov (1):
 >       signal: Use correct type for si_band in siginfo_t [BZ #23562]

 > Martin Kuchta (1):
 >       pthread_cond_broadcast: Fix waiters-after-spinning case [BZ #23538]

 > Stefan Liebler (2):
 >       Fix segfault in maybe_script_execute.
 >       Fix race in pthread_mutex_lock while promoting to PTHREAD_MUTEX_ELISION_NP [BZ #23275]

 > Szabolcs Nagy (1):
 >       i64: fix missing exp2f, log2f and powf symbols in libm.a [BZ #23822]

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
