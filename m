From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 13:22:10 +0200
Subject: [Buildroot] [PATCH 00/13] MIPS: improve architecture support
	and add specific cores
In-Reply-To: <20160930093659.35032-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 30 Sep 2016 10:36:46 +0100")
References: <20160930093659.35032-1-Vincent.Riera@imgtec.com>
Message-ID: <87eg3hj1r1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > This patch series aims to improve the MIPS architecture support and add
 > a small starting set of MIPS cores.

 > Currently you can build root file systems for mips32, mips32r2,
 > mips32r6, mips64, mips64r2 and mips64r6 ISAs. These are all generic
 > -march options so the compiler will not activate any core specific
 > optimizations.

 > The first thing we do in this series is to add some blind options to
 > specify which CPU ISA is gonna be used.

 > Then we make the current target architecture variants to select those
 > new added CPU ISA options. We do this in preparation for the addition
 > of specific cores that are also based on some ISA, so the will also
 > select the appropriate one. This will still allow us to apply ISA
 > specific tweaks as we already do.

 > After that, we replace any occurrences of BR2_mips_* by the appropriate
 > CPU ISA option so this will still be valid when the user select an
 > specific core instead of a generic variant.

 > The next step is to make the options of the "Target Architecture
 > Variant" menu more explicit by specifying they are generic. This is just
 > a cosmetic change but also useful so people will not get confused.

 > After that we add new generic variants for R5 ISAs.

 > The Codescape MTI external toolchain currently depends on R2 ISAs, but
 > it also has support for R5, so we enable that.

 > Finally we add suport for some specific MIPS cores, disabling the
 > unsuported GCC versions and external toolchains when appropriate.

Committed series, thanks!

-- 
Bye, Peter Korsgaard
