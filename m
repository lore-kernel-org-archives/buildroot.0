From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 15:27:45 +0200
Subject: [Buildroot] [PATCHv2] valgrind: build for the right MIPS ISA
	revision level
In-Reply-To: <1442874710-11595-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 21 Sep 2015 23:31:50 +0100")
References: <1442874710-11595-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87oagg6q0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
 > -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture, it
 > forcibly adds -march=mips64. This causes Valgrind to be built always for
 > the first ISA revision level (R1), even when the user has configured
 > Buildroot for the second ISA revision level (R2).

 > Since R2 is backwards compatible with R1, you can run a Valgrind built
 > for R1 in an R2 core. This is why nobody noticed about this problem, or
 > at least nobody complained.

 > But, since (I hope) we will support R6 in Buildroot in the near future,
 > this problem will become very important because R6 is not backwards
 > compatible with R1 or R2, so building Valgrind for R1 when your target
 > is R6 will result in a non-working Valgrind.

 > Override the CFLAGS variable (which Valgrind appends to its CFLAGS) and
 > pass the right -march option, so they take precedence over Valgrind's
 > wrongfully detected value.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Changes v1 -> v2:
 >   - Improved commit log. (Suggested by Yann E. Morin)

Committed, thanks.

-- 
Bye, Peter Korsgaard
