From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Sep 2014 22:15:09 +0200
Subject: [Buildroot] [PATCH] strace: Disable for MIPS when using a
	uClibc toolchain
In-Reply-To: <1410518438-14544-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Fri, 12 Sep 2014 11:40:38 +0100")
References: <1410518438-14544-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <871trf8egi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > A change introduced in strace-4.9 makes it incompatible with MIPS
 > architecture when using a uClibc toolchain. This is the failure:

 > signal.c: In function 'printsiginfo':
 > signal.c:453:9: error: 'siginfo_t' has no member named 'si_timerid'
 sip-> si_timerid, sip->si_overrun);
 > 	 ^
 > signal.c:453:26: error: 'siginfo_t' has no member named 'si_overrun'
 sip-> si_timerid, sip->si_overrun);

 > uClibc needs to be patched in order to fix this problem. In the meantime
 > we disable strace for MIPS when using a uClibc toolchain.

 > Fixes:

 >   http://autobuild.buildroot.net/results/91c/91c0413e755c365332bc15d1d69ab3d6160ae78c/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
