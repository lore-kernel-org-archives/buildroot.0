From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 17:54:08 +0200
Subject: [Buildroot] [PATCH] uClibc: ldso/libdl: Also include dl-tls.h
	for for !SHARED.
In-Reply-To: <1410439878-32028-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 11 Sep 2014 13:51:18 +0100")
References: <1410439878-32028-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87zjd1uvvj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Apply an upstream patch:
 >   http://git.uclibc.org/uClibc/commit/ldso/libdl/libdl.c?id=b57e9640db53166c88cdac66b79a046e46b8d728

 > On MIPS, several relocations that were original only resolved by the
 > dynamic linker were reused as static relocations.  Consequently the
 > macros TLS_DTPREL_VALUE and TLS_TPREL_VALUE defined in
 > libpthread/nptl/sysdeps/mips/dl-tls.h need to be available even for
 > !SHARED.

 > Relevant: http://www.linux-mips.org/wiki/NPTL#History

 > Fixes:

 >   http://autobuild.buildroot.net/results/85e/85e66962da9a6b80e1d1b721031b6ef0da45e3d5/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
