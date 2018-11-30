From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Nov 2018 11:20:50 +0100
Subject: [Buildroot] [PATCH] glibc: bump version for post-2.28 security
 fixes
In-Reply-To: <20181130090557.14640-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 30 Nov 2018 10:05:57 +0100")
References: <20181130090557.14640-1-peter@korsgaard.com>
Message-ID: <87h8fy6f3x.fsf@dell.be.48ers.dk>
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

 > Andreas Schwab (2):
 >       Fix stack overflow in tst-setcontext9 (bug 23717)
 >       libanl: properly cleanup if first helper thread creation failed (bug 22927)

 > DJ Delorie (2):
 >       malloc: tcache double free check
 >       malloc: tcache double free check

 > Florian Weimer (9):
 >       conform: XFAIL siginfo_t si_band test on sparc64
 >       stdlib/test-bz22786: Avoid spurious test failures using alias mappings
 >       stdlib/test-bz22786: Avoid memory leaks in the test itself
 >       support_blob_repeat: Call mkstemp directory for the backing file
 >       stdlib/tst-strtod-overflow: Switch to support_blob_repeat
 >       nscd: Fix use-after-free in addgetnetgrentX [BZ #23520]
 >       support: Print timestamps in timeout handler
 >       Revert "malloc: tcache double free check" [BZ #23907]
 >       CVE-2018-19591: if_nametoindex: Fix descriptor for overlong name [BZ #23927]

 > H.J. Lu (2):
 >       i386: Use _dl_runtime_[resolve|profile]_shstk for SHSTK [BZ #23716]
 >       Check multiple NT_GNU_PROPERTY_TYPE_0 notes [BZ #23509]

 > Ilya Yu. Malakhov (1):
 >       signal: Use correct type for si_band in siginfo_t [BZ #23562]

 > Istvan Kurucsai (1):
 >       malloc: Additional checks for unsorted bin integrity I.

 > Joseph Myers (2):
 >       Update syscall-names.list for Linux 4.18.
 >       Update kernel version in syscall-names.list to 4.19.

 > Moritz Eckert (1):
 >       malloc: Mitigate null-byte overflow attacks

 > Paul Eggert (1):
 >       Fix tzfile low-memory assertion failure

 > Paul Pluzhnikov (2):
 >       Fix BZ#23400 (creating temporary files in source tree), and undefined behavior in test.
 >       [BZ #20271] Add newlines in __libc_fatal calls.

 > Pochang Chen (1):
 >       malloc: Verify size of top chunk.

 > Rafal Luzynski (1):
 >       kl_GL: Fix spelling of Sunday, should be "sapaat" (bug 20209).

 > Stefan Liebler (2):
 >       Fix race in pthread_mutex_lock while promoting to PTHREAD_MUTEX_ELISION_NP [BZ #23275]
 >       Test stdlib/test-bz22786 exits now with unsupported if malloc fails.

 > Szabolcs Nagy (2):
 >       i64: fix missing exp2f, log2f and powf symbols in libm.a [BZ #23822]
 >       Increase timeout of libio/tst-readline

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
