From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Sep 2015 23:12:30 +0200
Subject: [Buildroot] [PATCHv2] micropython: fix build for MIPS64 n32
In-Reply-To: <1442997860-1402-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 23 Sep 2015 09:44:20 +0100")
References: <1442997860-1402-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <8737y4rgap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This patch applies an upstream patch to fix a compile error like this
 > one:

 > modffi.c: In function 'ffifunc_call':
 > modffi.c:358:25: error: cast from pointer to integer of different size
 > [-Werror=pointer-to-int-cast]
 >              values[i] = (ffi_arg)a;

 > This error can be highlighted when building micropython for MIPS64 n32
 > because ffi_arg is 64-bit wide and the pointers on MIPS64 n32 are 32-bit
 > wide, so it's trying to case an integer to a pointer (or vice versa) of
 > a different size. We should cast first the pointer (or the integer) to a
 > pointer sized integer (intptr_t) to fix that problem.

 > This patch was merged upstream as a result of this pull request:

 >   https://github.com/micropython/micropython/pull/1471

 > Fixes:

 >   http://autobuild.buildroot.net/results/e22/e2253de3f96e9a53e75b4cecaf56c1df2950803f/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

If we need to apply any more patches then I think it makes more sense to
get the sources from git (or convince upstream to make a new release).

-- 
Bye, Peter Korsgaard
